(ns lt.objs.langs.hy
  (:require [lt.object :as object]
            [lt.objs.eval :as eval]
            [lt.objs.console :as console]
            [lt.objs.command :as cmd]
            [lt.objs.clients.tcp :as tcp]
            [lt.objs.sidebar.clients :as scl]
            [lt.objs.dialogs :as dialogs]
            [lt.objs.files :as files]
            [lt.objs.popup :as popup]
            [lt.objs.platform :as platform]
            [lt.objs.editor :as ed]
            [lt.objs.plugins :as plugins]
            [lt.plugins.watches :as watches]
            [lt.objs.proc :as proc]
            [clojure.string :as string]
            [lt.objs.clients :as clients]
            [lt.objs.notifos :as notifos]
            [lt.util.load :as load]
            [lt.util.cljs :refer [js->clj]])
  (:require-macros [lt.macros :refer [behavior defui]]))


(defn find-project [obj]
  (let [p (:path obj)
        roots (files/get-roots)]
    (loop [cur p
           prev ""]
      (if (or (empty? cur)
              (roots cur)
              (= cur prev))
        (assoc obj :project-path nil)
        (if (and (not (files/exists? (files/join cur "__init__.py")))
                 (files/dir? cur))
          (assoc obj :project-path cur)
          (recur (files/parent cur) cur))))))

(defn check-all [obj]
  (-> obj
      (find-project)))

(defn hy-watch [meta src]
  (let [meta (js/JSON.stringify (clj->js meta))]
    (str "sys.modules['lttools'].__dict__['watch'](" src ", " meta ")")))

(behavior ::watch-src
                  :triggers #{:watch.src+}
                  :reaction (fn [editor cur meta src]
                              (hy-watch meta src)))

(object/object* ::hy-lang
                :tags #{:hy.lang})

(def hy (object/create ::hy-lang))

(scl/add-connector {:name "Hy"
                    :desc "Select a directory to serve as the root of your Hy project."
                    :connect (fn []
                               (dialogs/dir hy :connect))})
