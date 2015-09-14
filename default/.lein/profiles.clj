
{:user {:plugins [[lein-ancient "0.6.7"]
                  [lein-marginalia "0.8.0"]
                  [lein-grep "0.1.1"]
                  [lein-try "0.4.3"]
                  [lein-gorilla "0.3.4"]]
        :dependencies [[alembic "0.3.2"]
                       [criterium "0.4.3"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [slamhound "1.5.5"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
