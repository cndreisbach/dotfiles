if(!lt.util.load.provided_QMARK_('lt.objs.langs.hy')) {
goog.provide('lt.objs.langs.hy');
goog.require('cljs.core');
goog.require('lt.util.cljs');
goog.require('lt.objs.plugins');
goog.require('lt.objs.files');
goog.require('lt.objs.platform');
goog.require('lt.objs.popup');
goog.require('lt.objs.dialogs');
goog.require('lt.objs.popup');
goog.require('lt.objs.notifos');
goog.require('lt.objs.proc');
goog.require('lt.objs.notifos');
goog.require('clojure.string');
goog.require('lt.util.cljs');
goog.require('lt.objs.command');
goog.require('lt.objs.platform');
goog.require('lt.objs.files');
goog.require('lt.objs.clients.tcp');
goog.require('lt.objs.sidebar.clients');
goog.require('lt.objs.plugins');
goog.require('lt.plugins.watches');
goog.require('lt.objs.eval');
goog.require('lt.objs.clients');
goog.require('lt.objs.clients.tcp');
goog.require('lt.util.load');
goog.require('clojure.string');
goog.require('lt.plugins.watches');
goog.require('lt.objs.editor');
goog.require('lt.object');
goog.require('lt.object');
goog.require('lt.objs.dialogs');
goog.require('lt.util.load');
goog.require('lt.objs.console');
goog.require('lt.objs.proc');
goog.require('lt.objs.console');
goog.require('lt.objs.eval');
goog.require('lt.objs.clients');
goog.require('lt.objs.sidebar.clients');
goog.require('lt.objs.command');
goog.require('lt.objs.editor');

lt.objs.langs.hy.find_project = (function find_project(obj){var p = new cljs.core.Keyword(null,"path","path",1017337751).cljs$core$IFn$_invoke$arity$1(obj);var roots = lt.objs.files.get_roots.call(null);var cur = p;var prev = "";while(true){
if(cljs.core.truth_((function (){var or__5799__auto__ = cljs.core.empty_QMARK_.call(null,cur);if(or__5799__auto__)
{return or__5799__auto__;
} else
{var or__5799__auto____$1 = roots.call(null,cur);if(cljs.core.truth_(or__5799__auto____$1))
{return or__5799__auto____$1;
} else
{return cljs.core._EQ_.call(null,cur,prev);
}
}
})()))
{return cljs.core.assoc.call(null,obj,new cljs.core.Keyword(null,"project-path","project-path",1907176907),null);
} else
{if(cljs.core.truth_((function (){var and__5787__auto__ = cljs.core.not.call(null,lt.objs.files.exists_QMARK_.call(null,lt.objs.files.join.call(null,cur,"__init__.py")));if(and__5787__auto__)
{return lt.objs.files.dir_QMARK_.call(null,cur);
} else
{return and__5787__auto__;
}
})()))
{return cljs.core.assoc.call(null,obj,new cljs.core.Keyword(null,"project-path","project-path",1907176907),cur);
} else
{{
var G__7239 = lt.objs.files.parent.call(null,cur);
var G__7240 = cur;
cur = G__7239;
prev = G__7240;
continue;
}
}
}
break;
}
});

lt.objs.langs.hy.check_all = (function check_all(obj){return lt.objs.langs.hy.find_project.call(null,obj);
});

lt.objs.langs.hy.hy_watch = (function hy_watch(meta,src){var meta__$1 = JSON.stringify(cljs.core.clj__GT_js.call(null,meta));return [cljs.core.str("sys.modules['lttools'].__dict__['watch']("),cljs.core.str(src),cljs.core.str(", "),cljs.core.str(meta__$1),cljs.core.str(")")].join('');
});

lt.objs.langs.hy.__BEH__watch_src = (function __BEH__watch_src(editor,cur,meta,src){return lt.objs.langs.hy.hy_watch.call(null,meta,src);
});
lt.object.behavior_STAR_.call(null,new cljs.core.Keyword("lt.objs.langs.hy","watch-src","lt.objs.langs.hy/watch-src",2601473103),new cljs.core.Keyword(null,"reaction","reaction",4441361819),lt.objs.langs.hy.__BEH__watch_src,new cljs.core.Keyword(null,"triggers","triggers",2516997421),new cljs.core.PersistentHashSet(null, new cljs.core.PersistentArrayMap(null, 1, [new cljs.core.Keyword(null,"watch.src+","watch.src+",868749304),null], null), null));

lt.object.object_STAR_.call(null,new cljs.core.Keyword("lt.objs.langs.hy","hy-lang","lt.objs.langs.hy/hy-lang",982517003),new cljs.core.Keyword(null,"tags","tags",1017456523),new cljs.core.PersistentHashSet(null, new cljs.core.PersistentArrayMap(null, 1, [new cljs.core.Keyword(null,"hy.lang","hy.lang",2334929949),null], null), null));

lt.objs.langs.hy.hy = lt.object.create.call(null,new cljs.core.Keyword("lt.objs.langs.hy","hy-lang","lt.objs.langs.hy/hy-lang",982517003));

lt.objs.sidebar.clients.add_connector.call(null,new cljs.core.PersistentArrayMap(null, 3, [new cljs.core.Keyword(null,"name","name",1017277949),"Hy",new cljs.core.Keyword(null,"desc","desc",1016984067),"Select a directory to serve as the root of your Hy project.",new cljs.core.Keyword(null,"connect","connect",1965255772),(function (){return lt.objs.dialogs.dir.call(null,lt.objs.langs.hy.hy,new cljs.core.Keyword(null,"connect","connect",1965255772));
})], null));

}

//# sourceMappingURL=