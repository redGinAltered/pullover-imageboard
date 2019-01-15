<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div class="mb-1"><h5>Create user</h5></div>
<div style="color:#ff0000">${message?ifExists}</div>
<@l.login "/registration" false />
</@c.page>