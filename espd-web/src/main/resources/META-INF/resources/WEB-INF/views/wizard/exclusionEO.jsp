<%@page import="eu.europa.ec.grow.espd.domain.DynamicRequirementGroup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.util.CollectionUtils"%>
<%@page import="eu.europa.ec.grow.espd.domain.CriminalConvictionsCriterion"%>
<%@page import="eu.europa.ec.grow.espd.domain.EspdDocument"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%--
  ~
  ~ Copyright 2016 EUROPEAN COMMISSION
  ~
  ~ Licensed under the EUPL, Version 1.1 or – as soon they
  ~ will be approved by the European Commission - subsequent
  ~ versions of the EUPL (the "Licence");
  ~
  ~ You may not use this work except in compliance with the Licence.
  ~
  ~ You may obtain a copy of the Licence at:
  ~
  ~ https://joinup.ec.europa.eu/community/eupl/og_page/eupl
  ~
  ~ Unless required by applicable law or agreed to in
  ~ writing, software distributed under the Licence is
  ~ distributed on an "AS IS" basis,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
  ~ express or implied.
  ~ See the Licence for the specific language governing
  ~ permissions and limitations under the Licence.
  ~
  --%>

<%request.setAttribute("exclusionEO", eu.europa.ec.grow.espd.xml.CriteriaTemplates.exclusionEO);%>
<%request.setAttribute("nationalExclusionGrounds", eu.europa.ec.grow.espd.domain.enums.criteria.ExclusionCriterion.NATIONAL_EXCLUSION_GROUNDS);%>



<tiles:importAttribute name="flow"/>

<script>
    $(function () {
        $("#espdform").validate({
            errorContainer: $("div.errorContainer"),
            errorPlacement: function ($error, $element) {
                $element.parent().append($error);
            }
        });
    });
</script>

<form:form id="espdform" role="form" class="form-horizontal" method="post" commandName="espd" data-toggle="validator">


		<% 
			EspdDocument espd = (EspdDocument)request.getAttribute("espd");
	    	if (espd != null) { 
	        	{// Add at least one Criminal Convictions to be sure user will see it in form
	        		if (espd.getCriminalConvictions() == null) {
	        			espd.setCriminalConvictions(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getCriminalConvictions().getUnboundedGroups())) {
	        			espd.getCriminalConvictions().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getCriminalConvictions().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	        	{// Add at least one Corruption to be sure user will see it in form
	        		if (espd.getCorruption() == null) {
	        			espd.setCorruption(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getCorruption().getUnboundedGroups())) {
	        			espd.getCorruption().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getCorruption().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	        	{// Add at least one Fraud to be sure user will see it in form
	        		if (espd.getFraud() == null) {
	        			espd.setFraud(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getFraud().getUnboundedGroups())) {
	        			espd.getFraud().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getFraud().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	        	{// Add at least one TerroristOffences to be sure user will see it in form
	        		if (espd.getTerroristOffences() == null) {
	        			espd.setTerroristOffences(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getTerroristOffences().getUnboundedGroups())) {
	        			espd.getTerroristOffences().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getTerroristOffences().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	        	{// Add at least one MoneyLaundering to be sure user will see it in form
	        		if (espd.getMoneyLaundering() == null) {
	        			espd.setMoneyLaundering(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getMoneyLaundering().getUnboundedGroups())) {
	        			espd.getMoneyLaundering().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getMoneyLaundering().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	        	{// Add at least one ChildLabour to be sure user will see it in form
	        		if (espd.getChildLabour() == null) {
	        			espd.setChildLabour(new CriminalConvictionsCriterion());
	        		}
		        	if (CollectionUtils.isEmpty(espd.getChildLabour().getUnboundedGroups())) {
	        			espd.getChildLabour().setUnboundedGroups(new ArrayList<DynamicRequirementGroup>());
	        			espd.getChildLabour().getUnboundedGroups().add(new DynamicRequirementGroup());
		        	}
	        	}
	    	}
        %>

    <tiles:insertDefinition name="viewChangeRole">
        <tiles:putAttribute name="agent" value="eo"/>
        <tiles:putAttribute name="page" value="${flow}/ca/exclusion"/>
        <tiles:putAttribute name="showLink" value="${flow == 'request'}"/>
    </tiles:insertDefinition>

    <div class="panel-default">

        <tiles:insertDefinition name="progress">
        	<tiles:putAttribute name="agent" value="${agent}"/>
        	<tiles:putAttribute name="flow" value="${flow}"/>
            <tiles:putAttribute name="exclusion" value="true"/>
        </tiles:insertDefinition>

        <div class="errorContainer alert alert-danger" style="display: none">
            <ul class="fa-ul">
                <li>
                    <i class="info-label fa fa-exclamation-triangle fa-lg fa-li"></i>
                        ${div18n['correct_errors']}
                    <div class="errorLabelContainer">
                        <ul></ul>
                    </div>
                </li>
            </ul>
        </div>
        <div>
            <h2>${span18n["createcaexcl_header"]}</h2>
        </div>
		<tiles:insertDefinition name="topLevelCriteriaTemplate">
			<tiles:putAttribute name="topLevelCriteriaList" value="${exclusionEO}"/>
		</tiles:insertDefinition>
		<c:if test="${espd.purelyNationalGrounds.exists || agent eq 'ca'}">
            <div class="panel panel-espd">
                <div class="panel-heading" data-toggle="collapse" data-target="#eo-national-grounds-section">
                    <h4 class="panel-title">
                        ${span18n['crit_top_title_purely_national']}
                    </h4>
                </div>
                <div id="eo-national-grounds-section" class="collapse in">
                    <div class="espd-panel-body panel-body">
                        <span data-i18n="crit_eu_main_breaching_obligations" class="aligned" style="font-weight: bold;">
                            <s:message code='crit_eu_main_purely_national'/>
                        </span>
                        <tiles:insertDefinition name="exclusionFormTemplate">
                            <tiles:putAttribute name="field" value="purelyNationalGrounds"/>
                            <tiles:putAttribute name="checkExistanse" value="true"/>
                            <tiles:putAttribute name="title_code" value="crit_eu_title_purely_national"/>
                            <tiles:putAttribute name="description_code" value="crit_eu_text_purely_national"/>
                            <tiles:putAttribute name="selfCleaning" value="true"/>
                            <tiles:putAttribute name="hasCriterion" value="true"/>
                            <tiles:putAttribute name="criterion" value="${nationalExclusionGrounds}"/>
                        </tiles:insertDefinition>
                    </div>
                </div>
            </div>
        </c:if>
        <tiles:insertDefinition name="footerButtons">
            <tiles:putAttribute name="prev" value="procedure"/>
            <tiles:putAttribute name="next" value="selection"/>
        </tiles:insertDefinition>
    </div>
</form:form>
	
