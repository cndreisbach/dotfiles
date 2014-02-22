if(!lt.util.load.provided_QMARK_('lt.plugins.cnd')) {
goog.provide('lt.plugins.cnd');
goog.require('cljs.core');
goog.require('lt.objs.app');
goog.require('lt.objs.files');
goog.require('lt.objs.settings');
goog.require('lt.objs.workspace');
goog.require('lt.objs.notifos');
goog.require('lt.objs.notifos');
goog.require('lt.objs.workspace');
goog.require('lt.objs.editor.pool');
goog.require('lt.objs.command');
goog.require('lt.objs.files');
goog.require('lt.objs.settings');
goog.require('lt.objs.app');
goog.require('lt.objs.keyboard');
goog.require('lt.objs.editor');
goog.require('lt.object');
goog.require('lt.object');
goog.require('lt.objs.editor');
goog.require('lt.objs.editor.pool');
goog.require('lt.objs.command');
goog.require('lt.objs.keyboard');
lt.plugins.cnd.hello_panel = (function hello_panel(this$){var e__8111__auto__ = crate.core.html.call(null,new cljs.core.PersistentVector(null, 2, 5, cljs.core.PersistentVector.EMPTY_NODE, [new cljs.core.Keyword(null,"h1","h1",1013907515),"Hello from lt-cnd"], null));var seq__8256_8264 = cljs.core.seq.call(null,cljs.core.partition.call(null,2,cljs.core.PersistentVector.EMPTY));var chunk__8257_8265 = null;var count__8258_8266 = 0;var i__8259_8267 = 0;while(true){
if((i__8259_8267 < count__8258_8266))
{var vec__8260_8268 = cljs.core._nth.call(null,chunk__8257_8265,i__8259_8267);var ev__8112__auto___8269 = cljs.core.nth.call(null,vec__8260_8268,0,null);var func__8113__auto___8270 = cljs.core.nth.call(null,vec__8260_8268,1,null);lt.util.dom.on.call(null,e__8111__auto__,ev__8112__auto___8269,func__8113__auto___8270);
{
var G__8271 = seq__8256_8264;
var G__8272 = chunk__8257_8265;
var G__8273 = count__8258_8266;
var G__8274 = (i__8259_8267 + 1);
seq__8256_8264 = G__8271;
chunk__8257_8265 = G__8272;
count__8258_8266 = G__8273;
i__8259_8267 = G__8274;
continue;
}
} else
{var temp__4092__auto___8275 = cljs.core.seq.call(null,seq__8256_8264);if(temp__4092__auto___8275)
{var seq__8256_8276__$1 = temp__4092__auto___8275;if(cljs.core.chunked_seq_QMARK_.call(null,seq__8256_8276__$1))
{var c__7497__auto___8277 = cljs.core.chunk_first.call(null,seq__8256_8276__$1);{
var G__8278 = cljs.core.chunk_rest.call(null,seq__8256_8276__$1);
var G__8279 = c__7497__auto___8277;
var G__8280 = cljs.core.count.call(null,c__7497__auto___8277);
var G__8281 = 0;
seq__8256_8264 = G__8278;
chunk__8257_8265 = G__8279;
count__8258_8266 = G__8280;
i__8259_8267 = G__8281;
continue;
}
} else
{var vec__8261_8282 = cljs.core.first.call(null,seq__8256_8276__$1);var ev__8112__auto___8283 = cljs.core.nth.call(null,vec__8261_8282,0,null);var func__8113__auto___8284 = cljs.core.nth.call(null,vec__8261_8282,1,null);lt.util.dom.on.call(null,e__8111__auto__,ev__8112__auto___8283,func__8113__auto___8284);
{
var G__8285 = cljs.core.next.call(null,seq__8256_8276__$1);
var G__8286 = null;
var G__8287 = 0;
var G__8288 = 0;
seq__8256_8264 = G__8285;
chunk__8257_8265 = G__8286;
count__8258_8266 = G__8287;
i__8259_8267 = G__8288;
continue;
}
}
} else
{}
}
break;
}
return e__8111__auto__;
});
lt.object.object_STAR_.call(null,new cljs.core.Keyword("lt.plugins.cnd","lt-cnd.hello","lt.plugins.cnd/lt-cnd.hello",4715531000),new cljs.core.Keyword(null,"tags","tags",1017456523),new cljs.core.PersistentVector(null, 1, 5, cljs.core.PersistentVector.EMPTY_NODE, [new cljs.core.Keyword(null,"lt-cnd.hello","lt-cnd.hello",3682204010)], null),new cljs.core.Keyword(null,"name","name",1017277949),"lt-cnd",new cljs.core.Keyword(null,"init","init",1017141378),(function (this$){return lt.plugins.cnd.hello_panel.call(null,this$);
}));
lt.plugins.cnd.__BEH__on_close_destroy = (function __BEH__on_close_destroy(this$){var temp__4092__auto___8289 = new cljs.core.Keyword("lt.objs.tabs","tabset","lt.objs.tabs/tabset",3378091779).cljs$core$IFn$_invoke$arity$1(cljs.core.deref.call(null,this$));if(cljs.core.truth_(temp__4092__auto___8289))
{var ts_8290 = temp__4092__auto___8289;if(cljs.core._EQ_.call(null,cljs.core.count.call(null,new cljs.core.Keyword(null,"objs","objs",1017308622).cljs$core$IFn$_invoke$arity$1(cljs.core.deref.call(null,ts_8290))),1))
{tabs.rem_tabset.call(null,ts_8290);
} else
{}
} else
{}
return lt.object.raise.call(null,this$,new cljs.core.Keyword(null,"destroy","destroy",2571277164));
});
lt.object.behavior_STAR_.call(null,new cljs.core.Keyword("lt.plugins.cnd","on-close-destroy","lt.plugins.cnd/on-close-destroy",2662595509),new cljs.core.Keyword(null,"reaction","reaction",4441361819),lt.plugins.cnd.__BEH__on_close_destroy,new cljs.core.Keyword(null,"triggers","triggers",2516997421),new cljs.core.PersistentHashSet(null, new cljs.core.PersistentArrayMap(null, 1, [new cljs.core.Keyword(null,"close","close",1108660586),null], null), null));
lt.plugins.cnd.hello = lt.object.create.call(null,new cljs.core.Keyword("lt.plugins.cnd","lt-cnd.hello","lt.plugins.cnd/lt-cnd.hello",4715531000));
lt.objs.command.command.call(null,new cljs.core.PersistentArrayMap(null, 3, [new cljs.core.Keyword(null,"command","command",1964298941),new cljs.core.Keyword("lt.plugins.cnd","say-hello","lt.plugins.cnd/say-hello",1820287600),new cljs.core.Keyword(null,"desc","desc",1016984067),"lt-cnd: Say Hello",new cljs.core.Keyword(null,"exec","exec",1017031683),(function (){return tabs.add_or_focus_BANG_.call(null,lt.plugins.cnd.hello);
})], null));
lt.plugins.cnd.plugin_name = "cnd";
lt.plugins.cnd.save_plugins = (function save_plugins(){var personal_plugins_file = lt.objs.files.join.call(null,lt.objs.files.lt_user_dir.call(null,"plugins"),lt.plugins.cnd.plugin_name,"plugin.edn");var deps = ((function (personal_plugins_file){
return (function (p1__8262_SHARP_){return cljs.core.dissoc.call(null,p1__8262_SHARP_,lt.plugins.cnd.plugin_name);
});})(personal_plugins_file))
.call(null,cljs.core.apply.call(null,cljs.core.sorted_map,cljs.core.flatten.call(null,cljs.core.sort.call(null,cljs.core.map.call(null,cljs.core.juxt.call(null,new cljs.core.Keyword(null,"name","name",1017277949),new cljs.core.Keyword(null,"version","version",1365512266)),cljs.core.vals.call(null,new cljs.core.Keyword("lt.objs.plugins","plugins","lt.objs.plugins/plugins",2920328683).cljs$core$IFn$_invoke$arity$1(cljs.core.deref.call(null,lt.objs.app.app))))))));var plugin_body = cljs.core.pr_str.call(null,cljs.core.assoc.call(null,lt.objs.settings.safe_read.call(null,new cljs.core.Keyword(null,"content","content",1965434859).cljs$core$IFn$_invoke$arity$1(lt.objs.files.open_sync.call(null,personal_plugins_file)),personal_plugins_file),new cljs.core.Keyword(null,"dependencies","dependencies",1517678747),deps));return lt.objs.files.save.call(null,personal_plugins_file,clojure.string.replace.call(null,plugin_body,/(\"\s*,|\{|\},)/,(function (p1__8263_SHARP_){return [cljs.core.str(p1__8263_SHARP_),cljs.core.str("\n")].join('');
})));
});
lt.objs.command.command.call(null,new cljs.core.PersistentArrayMap(null, 3, [new cljs.core.Keyword(null,"command","command",1964298941),new cljs.core.Keyword(null,"ltfiles.save-plugins","ltfiles.save-plugins",2609342561),new cljs.core.Keyword(null,"desc","desc",1016984067),"cnd: Save plugins to :dependencies of personal plugin",new cljs.core.Keyword(null,"exec","exec",1017031683),lt.plugins.cnd.save_plugins], null));
}

//# sourceMappingURL=cnd_compiled.js.map