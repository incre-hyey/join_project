/**
 * HTML문자로 변환
 * & -> &amp; , < -> &lt;,  > -> &gt;
 */

String.prototype.entityify = function() {
    return this.replace(/&/g, "&amp;").replace(/</g,"&lt;").replace(/>/g, "&gt;");
};
