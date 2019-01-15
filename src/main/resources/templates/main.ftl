<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new message
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="card card-body">
        <div class="form-group mt-3">
            <form method="post" action="add" enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group col-sm-6">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Enter your message"/>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                </div>
                <div class="form-group col-sm-6">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>" name="tag" placeholder="TAG"/>
                    <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                    </#if>
                </div>
                <div class="form-group col-sm-4">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file...</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary ">Add message</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="card-columns">
    <div><strong>Message List</strong></div>
    <#list messages as message>
    <div class="card my-3" style="width: 20rem;">
        <#if message.filename??>
        <img class="card-img-top" src="/img/${message.filename}">
    </#if>
    <div class="m-2">
        <span>${message.text}</span>
        <i>#${message.tag}</i>
    </div>
    <div class="card-footer text-muted">
        ${message.authorName}
    </div>
</div>
<#else>
NO MESSAGES
</#list>
</div>
</@c.page>