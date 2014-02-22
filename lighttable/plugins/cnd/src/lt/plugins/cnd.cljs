(ns lt.plugins.cnd
  (:require [lt.object :as object]
            [lt.objs.keyboard :as keyboard]
            [lt.objs.workspace :as workspace]
            [lt.objs.notifos :as notifos]
            [lt.objs.settings :as settings]
            [lt.objs.editor :as editor]
            [lt.objs.editor.pool :as pool]
            [lt.objs.app :as app]
            [lt.objs.files :as files]
            #_[goog.string]
            [lt.objs.command :as cmd])
  (:require-macros [lt.macros :refer [defui behavior]]))

(defui hello-panel [this]
  [:h1 "Hello from lt-cnd"])

(object/object* ::lt-cnd.hello
                :tags [:lt-cnd.hello]
                :name "lt-cnd"
                :init (fn [this]
                        (hello-panel this)))

(behavior ::on-close-destroy
          :triggers #{:close}
          :reaction (fn [this]
                      (when-let [ts (:lt.objs.tabs/tabset @this)]
                        (when (= (count (:objs @ts)) 1)
                          (tabs/rem-tabset ts)))
                      (object/raise this :destroy)))

(def hello (object/create ::lt-cnd.hello))

(cmd/command {:command ::say-hello
              :desc "lt-cnd: Say Hello"
              :exec (fn []
                      (tabs/add-or-focus! hello))})

(def plugin-name "cnd")

(defn save-plugins []
  (let [personal-plugins-file (files/join (files/lt-user-dir "plugins") plugin-name "plugin.edn")
        deps (->> @app/app
                  :lt.objs.plugins/plugins
                  vals
                  (map (juxt :name :version))
                  sort
                  flatten
                  (apply sorted-map)
                  (#(dissoc % plugin-name)))
        plugin-body (-> (files/open-sync personal-plugins-file)
                        :content
                        (settings/safe-read personal-plugins-file)
                        (assoc :dependencies deps)
                        pr-str)]

    ;; one property and plugin per line for easier editing and diffing
    (files/save personal-plugins-file
                (clojure.string/replace plugin-body #"(\"\s*,|\{|\},)" #(str % "\n")))
    ;; Causes  "Maximum call stack size exceeded" error?
    #_(notifos/set-msg! "Plugins saved to " personal-plugins-file)))

(cmd/command {:command :ltfiles.save-plugins
              :desc "cnd: Save plugins to :dependencies of personal plugin"
              :exec save-plugins})
