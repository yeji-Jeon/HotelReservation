(function(a){"function"===typeof define&&define.amd?define(["jquery","./grid.base"],a):"object"===typeof module&&module.exports?module.exports=function(e,f){e||(e=window);void 0===f&&(f="undefined"!==typeof window?require("jquery"):require("jquery")(e));require("./grid.base");a(f);return f}:a(jQuery)})(function(a){window.tableToGrid=function(e,f){a(e).each(function(){var d=a(this),b,g,c,e,h=[],l=[],k=[],m=[],n=[];if(!this.grid){d.width("99%");b=d.width();g=a("tr td:first-child input[type=checkbox]:first",
d);c=a("tr td:first-child input[type=radio]:first",d);g=0<g.length;c=!g&&0<c.length;e=g||c;a("th",d).each(function(){0===h.length&&e?(h.push({name:"__selection__",index:"__selection__",width:0,hidden:!0}),l.push("__selection__")):(h.push({name:a(this).attr("id")||a.trim(a.jgrid.stripHtml(a(this).html())).split(" ").join("_"),index:a(this).attr("id")||a.trim(a.jgrid.stripHtml(a(this).html())).split(" ").join("_"),width:a(this).width()||150}),l.push(a(this).html()))});a("tbody > tr",d).each(function(){var c=
{},b=0;a("td",a(this)).each(function(){if(0===b&&e){var d=a("input",a(this)),f=d.attr("value");m.push(f||k.length);d.is(":checked")&&n.push(f);c[h[b].name]=d.attr("value")}else c[h[b].name]=a(this).html();b++});0<b&&k.push(c)});d.empty();d.jqGrid(a.extend({datatype:"local",width:b,colNames:l,colModel:h,multiselect:g},f||{}));for(b=0;b<k.length;b++)c=null,0<m.length&&(c=m[b])&&c.replace&&(c=encodeURIComponent(c).replace(/[.\-%]/g,"_")),null===c&&(c=a.jgrid.randId()),d.jqGrid("addRowData",c,k[b]);for(b=
0;b<n.length;b++)d.jqGrid("setSelection",n[b])}})}});
//# sourceMappingURL=grid.tbltogrid.map
