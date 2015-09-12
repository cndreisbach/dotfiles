
{:user {:plugins [[lein-ancient "0.5.5"]
                  [lein-marginalia "0.8.0"]
                  [lein-grep "0.1.0"]
                  [lein-try "0.4.3"]
                  [lein-gorilla "0.3.3"]]
        :dependencies [[alembic "0.2.1"]
                       [criterium "0.4.3"]
                       [org.clojure/tools.namespace "0.2.6"]
                       [slamhound "1.5.5"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
