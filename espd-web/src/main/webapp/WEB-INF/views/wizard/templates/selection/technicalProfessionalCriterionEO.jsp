<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:importAttribute name="field"/>
<tiles:importAttribute name="number"/>
<tiles:importAttribute name="title_code"/>
<tiles:importAttribute name="tooltip_text"/>
<tiles:importAttribute name="tooltip_code"/>
<tiles:importAttribute name="has_your_answer"/>
<tiles:importAttribute name="has_please_describe_them"/>
<tiles:importAttribute name="has_multiple_description_amount_date_recipients"/>
<tiles:importAttribute name="has_multiple_year_number"/>
<tiles:importAttribute name="allows_checks"/>
<tiles:importAttribute name="has_info_electronically"/>

<s:message code="crit_description_placeholder" var="descriptionPlaceholder"/>
<div class="row criteria-row">
    <div class="col-md-5 criteria-cell-left">
        <div class="form-group">
            <div class="col-md-12">
                <strong data-i18n="${title_code}">
                    <s:message code='${title_code}'/>
                </strong>
            </div>
            <div class="col-md-12">
                <c:if test="${not empty tooltip_code}">
                    <s:message var="tooltip_text" code='${tooltip_code}'/>
                    <span data-i18n="${tooltip_code}">${tooltip_text}</span>
                </c:if>
            </div>
        </div>
    </div>
    <div class="col-md-7 criteria-cell-right">
        <c:if test="${has_your_answer != null && has_your_answer}">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label small" style="padding-top: 0px;" for="${field}-answer-${number}">
                        <c:choose>
                            <c:when test="${allows_checks != null && allows_checks}">
                                <s:message code='crit_do_you_allow_checks'/>
                            </c:when>
                            <c:otherwise>
                                <s:message code='crit_your_answer'/>
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <form:checkbox path="${field}.exists" id="${field}-answer-${number}" data-toggle="collapse"
                                   data-target="${'#'}${field}-form" class="radioslide checktoggle form-control"/>
                </div>
            </div>
        </c:if>
        <c:if test="${has_please_describe_them != null && has_please_describe_them}">
            <div class="col-md-12" id="${field}-form">
                <div class="form-group">
                    <div class="tab-pane" id="${field}-reliability">
                        <div class="form-group">
                            <label class="control-label col-md-4 small" for="${field}-description-${number}"><s:message
                                    code='crit_please_describe_them'/></label>
                            <div class="col-md-8">
                                <textarea class="form-control" id="${field}-description-${number}"
                                          placeholder="${descriptionPlaceholder}"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${has_multiple_description_amount_date_recipients != null && has_multiple_description_amount_date_recipients}">
            <tiles:insertDefinition name="multipleDescriptionAmountDateRecipients">
                <tiles:putAttribute name="field" value="${field}"/>
            </tiles:insertDefinition>
        </c:if>
        <c:if test="${has_multiple_year_number != null && has_multiple_year_number}">
            <tiles:insertDefinition name="multipleYearNumber">
                <tiles:putAttribute name="field" value="${field}"/>
            </tiles:insertDefinition>
        </c:if>
        <c:if test="${has_info_electronically != null && has_info_electronically}">
            <tiles:insertDefinition name="availableElectronically">
                <tiles:putAttribute name="field" value="${field}"/>
            </tiles:insertDefinition>
        </c:if>
    </div>
</div>