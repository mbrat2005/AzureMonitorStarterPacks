param solutionTag string
param solutionVersion string
param location string
param lawresourceid string

var wbConfig = loadTextContent('./workbook.json')
// var wbConfigold='''
// {
//   "version": "Notebook/1.0",
//   "items": [
//     {
//       "type": 1,
//       "content": {
//         "json": "# Azure Monitor Starter Packs - Admin Centre\n\n\n"
//       },
//       "customWidth": "50",
//       "name": "text - 5"
//     },
//     {
//       "type": 9,
//       "content": {
//         "version": "KqlParameterItem/1.0",
//         "parameters": [
//           {
//             "id": "741661c9-5e51-44bc-8e8e-bfc6396f2646",
//             "version": "KqlParameterItem/1.0",
//             "name": "showHelp",
//             "label": "Show Help Info",
//             "type": 10,
//             "isRequired": true,
//             "typeSettings": {
//               "additionalResourceOptions": [],
//               "showDefault": false
//             },
//             "jsonData": "[\n    { \"value\":\"yes\", \"label\":\"Yes\",\"default\": \"yes\" },\n    { \"value\":\"no\", \"label\":\"No\" }\n]",
//             "timeContext": {
//               "durationMs": 86400000
//             },
//             "value": "no"
//           }
//         ],
//         "style": "above",
//         "queryType": 0,
//         "resourceType": "microsoft.operationalinsights/workspaces"
//       },
//       "customWidth": "50",
//       "name": "parameters - 14"
//     },
//     {
//       "type": 11,
//       "content": {
//         "version": "LinkItem/1.0",
//         "style": "tabs",
//         "links": [
//           {
//             "id": "a9a63932-4a11-4fe1-938c-02619e609193",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Getting Started",
//             "subTarget": "gettingstarted",
//             "style": "link"
//           },
//           {
//             "id": "4f0ca437-37b0-42f6-a150-e994338f5185",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Status",
//             "subTarget": "status",
//             "style": "link"
//           },
//           {
//             "id": "15f0fa97-4286-48d6-9dea-26a956197d26",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Servers",
//             "subTarget": "discovery",
//             "style": "link"
//           },
//           {
//             "id": "7499a88f-a536-41d7-9b58-9ebae1b5290e",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Alert Setup",
//             "subTarget": "alertmanagement",
//             "style": "link"
//           },
//           {
//             "id": "3a19e3a9-d64d-41d8-a313-3a60db36bcc4",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Policy Management",
//             "subTarget": "policystatus",
//             "style": "link"
//           },
//           {
//             "id": "c2a67d72-dd46-44ea-adba-b9d70915c607",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Pack Status",
//             "subTarget": "rulemanagement",
//             "style": "link"
//           },
//           {
//             "id": "d8f7936d-170f-430d-af7d-ac22115a9e38",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Agent Info",
//             "subTarget": "agentmgmt",
//             "style": "link"
//           },
//           {
//             "id": "e1f636a4-1593-49ef-bf35-abf708e2be48",
//             "cellValue": "tabSelection",
//             "linkTarget": "parameter",
//             "linkLabel": "Configuration",
//             "subTarget": "backend",
//             "style": "link"
//           }
//         ]
//       },
//       "name": "links - 8"
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "items": [
//           {
//             "type": 1,
//             "content": {
//               "json": "## General Parameters",
//               "style": "info"
//             },
//             "name": "text - 3"
//           },
//           {
//             "type": 9,
//             "content": {
//               "version": "KqlParameterItem/1.0",
//               "parameters": [
//                 {
//                   "id": "7a778b2c-619d-4f82-bd1c-810f853af6fd",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "Subscriptions",
//                   "type": 6,
//                   "isRequired": true,
//                   "isGlobal": true,
//                   "multiSelect": true,
//                   "quote": "'",
//                   "delimiter": ",",
//                   "typeSettings": {
//                     "additionalResourceOptions": [
//                       "value::all"
//                     ],
//                     "includeAll": false,
//                     "showDefault": false
//                   },
//                   "timeContext": {
//                     "durationMs": 86400000
//                   },
//                   "value": [
//                     "value::all"
//                   ]
//                 },
//                 {
//                   "id": "1efb8bbe-532a-491b-b3c4-55f1402ee280",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "logicAppResource",
//                   "label": "Logic App",
//                   "type": 5,
//                   "isRequired": true,
//                   "query": "resources\n| where type == \"microsoft.logic/workflows\" \n| where isnotempty(tags.MonitorStarterPacks)\n| project Id=id, Name=name",
//                   "crossComponentResources": [
//                     "value::tenant"
//                   ],
//                   "typeSettings": {
//                     "resourceTypeFilter": {
//                       "microsoft.logic/workflows": true
//                     },
//                     "additionalResourceOptions": [],
//                     "showDefault": false
//                   },
//                   "timeContext": {
//                     "durationMs": 86400000
//                   },
//                   "queryType": 1,
//                   "resourceType": "microsoft.resources/tenants",
//                   "value": "/subscriptions/6c64f9ed-88d2-4598-8de6-7a9527dc16ca/resourceGroups/monstar-rg/providers/Microsoft.Logic/workflows/MonitorStarterPacks-Backend"
//                 },
//                 {
//                   "id": "ea93902e-9856-4bd4-998d-ea88378907a7",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "GrafanaInstance",
//                   "label": "Azure Managed Grafana",
//                   "type": 2,
//                   "isRequired": true,
//                   "isGlobal": true,
//                   "query": "resources\n| where type =~ \"microsoft.dashboard/grafana\"\n| where isnotempty(tags.monitorStarterPacks)\n| project id, label=properties.endpoint",
//                   "crossComponentResources": [
//                     "value::tenant"
//                   ],
//                   "typeSettings": {
//                     "additionalResourceOptions": [],
//                     "showDefault": false
//                   },
//                   "timeContext": {
//                     "durationMs": 86400000
//                   },
//                   "queryType": 1,
//                   "resourceType": "microsoft.resources/tenants",
//                   "value": "/subscriptions/6c64f9ed-88d2-4598-8de6-7a9527dc16ca/resourceGroups/monstar-rg/providers/Microsoft.Dashboard/grafana/AMSP6c64f9ed"
//                 },
//                 {
//                   "id": "4552c35d-c26c-4cbf-a4cf-b2e57ff7ee78",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "Workspace",
//                   "label": "WorkSpace",
//                   "type": 5,
//                   "isRequired": true,
//                   "isGlobal": true,
//                   "query": "resources\n| where type == \"microsoft.operationalinsights/workspaces\"\n| project id",
//                   "crossComponentResources": [
//                     "value::all"
//                   ],
//                   "typeSettings": {
//                     "additionalResourceOptions": [],
//                     "showDefault": false
//                   },
//                   "queryType": 1,
//                   "resourceType": "microsoft.resourcegraph/resources",
//                   "value": "/subscriptions/6c64f9ed-88d2-4598-8de6-7a9527dc16ca/resourceGroups/MonStar-rg/providers/Microsoft.OperationalInsights/workspaces/monstar-la"
//                 }
//               ],
//               "style": "above",
//               "queryType": 0,
//               "resourceType": "microsoft.operationalinsights/workspaces"
//             },
//             "customWidth": "100",
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "backend"
//             },
//             "name": "generalParams"
//           },
//           {
//             "type": 1,
//             "content": {
//               "json": "## Backend Function Status",
//               "style": "info"
//             },
//             "name": "text - 3 - Copy"
//           },
//           {
//             "type": 9,
//             "content": {
//               "version": "KqlParameterItem/1.0",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "parameters": [
//                 {
//                   "id": "dfce71e0-74f5-46ee-b952-004f421cbee4",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "AppInsightResources",
//                   "type": 5,
//                   "isRequired": true,
//                   "query": "resources\n| where type == \"microsoft.insights/components\"\n| where isnotempty(tags.MonitorStarterPacks)\n| project id\n",
//                   "crossComponentResources": [
//                     "value::tenant"
//                   ],
//                   "typeSettings": {
//                     "additionalResourceOptions": [
//                       "value::1"
//                     ],
//                     "showDefault": false
//                   },
//                   "timeContext": {
//                     "durationMs": 86400000
//                   },
//                   "queryType": 1,
//                   "resourceType": "microsoft.resources/tenants",
//                   "value": "/subscriptions/6c64f9ed-88d2-4598-8de6-7a9527dc16ca/resourceGroups/monstar-rg/providers/Microsoft.Insights/components/MonitorStarterPacks-6c64f9ed"
//                 }
//               ],
//               "style": "pills",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants"
//             },
//             "name": "parameters - 14"
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "requests\n| project\n    timestamp,\n    id,\n    operation_Name,\n    success,\n    resultCode,\n    duration,\n    cloud_RoleName\n| where timestamp > ago(30d)\n| order by timestamp desc\n| take 20\n",
//               "size": 1,
//               "timeContext": {
//                 "durationMs": 86400000
//               },
//               "queryType": 0,
//               "resourceType": "microsoft.insights/components",
//               "crossComponentResources": [
//                 "{AppInsightResources}"
//               ],
//               "gridSettings": {
//                 "filter": true
//               }
//             },
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "backend"
//             },
//             "name": "AppInsightsQuery1",
//             "styleSettings": {
//               "showBorder": true
//             }
//           }
//         ],
//         "exportParameters": true
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "backend"
//       },
//       "name": "ConfigStatusGroup"
//     },
//     {
//       "type": 1,
//       "content": {
//         "json": "# Getting Started\n\nWelcome to the Azure Monitor Starter Packs. This workbook was designed to help you configuring the solution. Here you can:\n- Enable/Disable monitoring packs for one or more VMs. You may also disable all the monitoring for a specific server. This will remove the tags and the rule associations*\n- Enable/Disable Alerts in bulk. You can also assign a different Action group to one or more alerts.\n- Check policy status and start remediation if required. By clicking in a policy, you can also assign that policy to another scope.\n- Check Monitor pack associations\n\n[Azure MONitor STARter Packs](http://github.com/Azure/AzureMonitorStarterPacks)\n\n[Azure Managed Grafana ({GrafanaInstance:label})]({GrafanaInstance:label})\n\n"
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "gettingstarted"
//       },
//       "name": "text - 14"
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "items": [
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "resources | where type =~ 'microsoft.hybridcompute/machines' or type =~ 'microsoft.compute/virtualmachines'\n| extend MonitorStatus=iff(isempty(tostring(tags.MonitorStarterPacks)),'Monitored','Not Monitored')\n| summarize count() by MonitorStatus",
//               "size": 1,
//               "title": "Monitoring Status (Tags)",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "piechart",
//               "chartSettings": {
//                 "seriesLabelSettings": [
//                   {
//                     "seriesName": "Monitored",
//                     "color": "green"
//                   },
//                   {
//                     "seriesName": "Not Monitored",
//                     "color": "orange"
//                   }
//                 ]
//               }
//             },
//             "customWidth": "33",
//             "name": "Monitoring Status",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "Resources\n| where type == 'microsoft.compute/virtualmachines'\n| extend\n    JoinID = toupper(id)\n| join kind=leftouter(\n    Resources\n    | where ( type == 'microsoft.compute/virtualmachines/extensions') and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId\n| union (Resources\n| where type == 'microsoft.hybridcompute/machines'\n| extend\n    JoinID = toupper(id)\n| join kind=leftouter(\n    Resources\n    | where type == 'microsoft.hybridcompute/machines/extensions' and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId)\n| summarize count() by AgentInstalled=iff(isempty(ExtensionName),\"No\",\"Yes\")",
//               "size": 1,
//               "title": "Agent Install Status",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "piechart",
//               "chartSettings": {
//                 "seriesLabelSettings": [
//                   {
//                     "seriesName": "Yes",
//                     "label": "AMA Installed",
//                     "color": "green"
//                   },
//                   {
//                     "seriesName": "No",
//                     "label": "No AMA",
//                     "color": "red"
//                   }
//                 ]
//               }
//             },
//             "customWidth": "33",
//             "name": "query - 1",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "policyresources | where type == \"microsoft.policyinsights/policystates\" | extend policyName=tostring(properties.policyDefinitionName), complianceState=properties.complianceState\n| join (policyresources | where type == \"microsoft.authorization/policydefinitions\" and isnotempty(properties.metadata.MonitorStarterPacks) | project policyId=id, policyName=name, pack=tostring(properties.metadata.MonitorStarterPacks)) on policyName\n| project policyId, policyName, complianceState=tostring(complianceState), pack,type='Policy'\n| union( policyresources\n| where type =~ 'Microsoft.PolicyInsights/PolicyStates'\n| extend complianceState = tostring(properties.complianceState)\n| extend\n\tresourceId = tostring(properties.resourceId),\n\tpolicyAssignmentId = tostring(properties.policyAssignmentId),\n\tpolicyAssignmentScope = tostring(properties.policyAssignmentScope),\n\tpolicyAssignmentName = tostring(properties.policyAssignmentName),\n\tpolicyDefinitionId = tostring(properties.policyDefinitionId),\n    policySetDefinitionId=tostring(properties.policySetDefinitionId),\n\tpolicyDefinitionReferenceId = tostring(properties.policyDefinitionReferenceId),\n\tstateWeight = iff(complianceState == 'NonCompliant', int(300), iff(complianceState == 'Compliant', int(200), iff(complianceState == 'Conflict', int(100), iff(complianceState == 'Exempt', int(50), int(0)))))\n| summarize max(stateWeight) by resourceId, policyAssignmentId, policyAssignmentScope, policyAssignmentName,policySetDefinitionId\n| summarize counts = count() by policyAssignmentId, policyAssignmentScope, max_stateWeight, policyAssignmentName,policySetDefinitionId\n| summarize overallStateWeight = max(max_stateWeight),\nnonCompliantCount = sumif(counts, max_stateWeight == 300),\ncompliantCount = sumif(counts, max_stateWeight == 200),\nconflictCount = sumif(counts, max_stateWeight == 100),\nexemptCount = sumif(counts, max_stateWeight == 50) by policyAssignmentId, policyAssignmentScope, policyAssignmentName,policySetDefinitionId\n| extend totalResources = todouble(nonCompliantCount + compliantCount + conflictCount + exemptCount)\n| extend compliancePercentage = iff(totalResources == 0, todouble(100), 100 * todouble(compliantCount + exemptCount) / totalResources)\n| project policyAssignmentName, scope = policyAssignmentScope,policySetDefinitionId,\ncomplianceState = iff(overallStateWeight == 300, 'nonCompliant', iff(overallStateWeight == 200, 'Compliant', iff(overallStateWeight == 100, 'conflict', iff(overallStateWeight == 50, 'exempt', 'notstarted')))),\ncompliancePercentage,\ncompliantCount,\nnonCompliantCount,\nconflictCount,\nexemptCount\n| where isnotempty(policySetDefinitionId)\n| join (policyresources\n| where type =~ 'microsoft.authorization/policysetdefinitions' and isnotempty(properties.metadata.MonitorStarterPacks)\n| extend policySetDefinitionId=tostring(id)) on policySetDefinitionId\n| project policyId=policySetDefinitionId, policyName=name,complianceState,pack='N/A', type='Set')\n| summarize count() by complianceState,policyName",
//               "size": 1,
//               "title": "Assignment Policies Status",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "piechart",
//               "chartSettings": {
//                 "seriesLabelSettings": [
//                   {
//                     "seriesName": "Compliant",
//                     "label": "Compliant",
//                     "color": "green"
//                   },
//                   {
//                     "seriesName": "nonCompliant",
//                     "label": "Not Compliant",
//                     "color": "redDark"
//                   }
//                 ]
//               }
//             },
//             "customWidth": "33",
//             "name": "policyComplianceStatus",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "insightsresources\n| where type == \"microsoft.insights/datacollectionruleassociations\"\n| extend resourceId=split(id,'/providers/Microsoft.Insights/')[0]\n| where isnotnull(properties.dataCollectionRuleId)\n| project rulename=tostring(split(properties.dataCollectionRuleId,\"/\")[8]),resourceName=tostring(split(resourceId,\"/\")[8]),resourceId//ruleId=properties.dataCollectionRuleId\n| join (resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| extend MPs=tostring(['tags'].MonitorStarterPacks)\n| where isnotempty(MPs) //or properties.dataSources.performanceCounters[0].name == 'VMInsightsPerfCounters'\n| summarize by Pack=MPs,rulename=tostring(name)) on rulename\n| project-away rulename,rulename1,resourceId\n| summarize Associated=count() by Pack\n| sort by Pack asc",
//               "size": 1,
//               "title": "Servers/Pack (Association)",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "piechart",
//               "tileSettings": {
//                 "showBorder": false,
//                 "titleContent": {
//                   "columnMatch": "Pack",
//                   "formatter": 1
//                 },
//                 "leftContent": {
//                   "columnMatch": "Associated",
//                   "formatter": 12,
//                   "formatOptions": {
//                     "palette": "auto"
//                   },
//                   "numberFormat": {
//                     "unit": 17,
//                     "options": {
//                       "maximumSignificantDigits": 3,
//                       "maximumFractionDigits": 2
//                     }
//                   }
//                 }
//               },
//               "mapSettings": {
//                 "locInfo": "LatLong",
//                 "sizeSettings": "Associated",
//                 "sizeAggregation": "Sum",
//                 "legendMetric": "Associated",
//                 "legendAggregation": "Sum",
//                 "itemColorSettings": {
//                   "type": "heatmap",
//                   "colorAggregation": "Sum",
//                   "nodeColorField": "Associated",
//                   "heatmapPalette": "greenRed"
//                 }
//               }
//             },
//             "customWidth": "33",
//             "name": "AssociatedResourceStatsperTag - Copy - Copy",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "insightsresources\n| where type == \"microsoft.insights/datacollectionruleassociations\"\n| extend resourceId=split(id,'/providers/Microsoft.Insights/')[0]\n| where isnotnull(properties.dataCollectionRuleId)\n| project rulename=tostring(split(properties.dataCollectionRuleId,\"/\")[8]),resourceName=tostring(split(resourceId,\"/\")[8]),resourceId//ruleId=properties.dataCollectionRuleId\n| join (resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| extend MPs=tostring(['tags'].MonitorStarterPacks)\n| where isnotempty(MPs) //or properties.dataSources.performanceCounters[0].name == 'VMInsightsPerfCounters'\n| summarize by Pack=MPs,rulename=tostring(name)) on rulename\n| project-away rulename,rulename1,resourceId\n| summarize Tagged=count() by Pack\n| sort by Pack asc\n\n\n",
//               "size": 1,
//               "title": "Tagged Resources per Tag",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "tiles",
//               "tileSettings": {
//                 "showBorder": false,
//                 "titleContent": {
//                   "columnMatch": "Pack",
//                   "formatter": 1
//                 },
//                 "leftContent": {
//                   "columnMatch": "Tagged",
//                   "formatter": 12,
//                   "formatOptions": {
//                     "palette": "auto"
//                   },
//                   "numberFormat": {
//                     "unit": 17,
//                     "options": {
//                       "maximumSignificantDigits": 3,
//                       "maximumFractionDigits": 2
//                     }
//                   }
//                 }
//               }
//             },
//             "customWidth": "33",
//             "name": "taggedResourceStatsperTag",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "insightsresources\n| where type == \"microsoft.insights/datacollectionruleassociations\"\n| extend resourceId=split(id,'/providers/Microsoft.Insights/')[0]\n| where isnotnull(properties.dataCollectionRuleId)\n| project rulename=tostring(split(properties.dataCollectionRuleId,\"/\")[8]),resourceName=tostring(split(resourceId,\"/\")[8]),resourceId//ruleId=properties.dataCollectionRuleId\n| join (resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| extend MPs=tostring(['tags'].MonitorStarterPacks)\n| where isnotempty(MPs) //or properties.dataSources.performanceCounters[0].name == 'VMInsightsPerfCounters'\n| summarize by Pack=MPs,rulename=tostring(name)) on rulename\n| project-away rulename,rulename1,resourceId\n| summarize Associated=count() by Pack\n| sort by Pack asc",
//               "size": 1,
//               "title": "Associated Servers per Pack",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "tiles",
//               "tileSettings": {
//                 "showBorder": false,
//                 "titleContent": {
//                   "columnMatch": "Pack",
//                   "formatter": 1
//                 },
//                 "leftContent": {
//                   "columnMatch": "Associated",
//                   "formatter": 12,
//                   "formatOptions": {
//                     "palette": "auto"
//                   },
//                   "numberFormat": {
//                     "unit": 17,
//                     "options": {
//                       "maximumSignificantDigits": 3,
//                       "maximumFractionDigits": 2
//                     }
//                   }
//                 }
//               }
//             },
//             "customWidth": "33",
//             "name": "AssociatedResourceStatsperTag - Copy",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "alertsmanagementresources\n| where ['type'] == 'microsoft.alertsmanagement/alerts'\n| project ['Alert Id']=id,resourceId=properties.context.context.resourceId, alertRule=tolower(tostring(properties.essentials.alertRule)), status=properties.context.status,severity=properties.context.context.severity\n| where isnotempty(alertRule)\n| join (resources\n| where type == \"microsoft.insights/scheduledqueryrules\" or type ==\"microsoft.insights/metricalerts\" or type == 'microsoft.insights/activitylogalerts'\n| where isnotempty(tags.MonitorStarterPacks)\n| extend alertRule=tolower(tostring(['id']))) on alertRule\n| project ['Alert Name']=name,['Details']=['Alert Id'], Status=status, Resource=resourceId, Sev=severity\n| where Status=='Activated'\n",
//               "size": 0,
//               "title": "Active Alerts",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "Details",
//                     "formatter": 7,
//                     "formatOptions": {
//                       "linkTarget": "Resource",
//                       "linkLabel": "Details",
//                       "linkIsContextBlade": true
//                     }
//                   },
//                   {
//                     "columnMatch": "Status",
//                     "formatter": 18,
//                     "formatOptions": {
//                       "thresholdsOptions": "icons",
//                       "thresholdsGrid": [
//                         {
//                           "operator": "==",
//                           "thresholdValue": "Activated",
//                           "representation": "up",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "Default",
//                           "thresholdValue": null,
//                           "representation": "success",
//                           "text": "{0}{1}"
//                         }
//                       ]
//                     }
//                   },
//                   {
//                     "columnMatch": "Resource",
//                     "formatter": 13,
//                     "formatOptions": {
//                       "linkTarget": "Resource",
//                       "linkIsContextBlade": true,
//                       "showIcon": true
//                     }
//                   },
//                   {
//                     "columnMatch": "Sev",
//                     "formatter": 18,
//                     "formatOptions": {
//                       "thresholdsOptions": "icons",
//                       "thresholdsGrid": [
//                         {
//                           "operator": "==",
//                           "thresholdValue": "1",
//                           "representation": "Sev1",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "==",
//                           "thresholdValue": "2",
//                           "representation": "Sev2",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "==",
//                           "thresholdValue": "3",
//                           "representation": "Sev3",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "==",
//                           "thresholdValue": "4",
//                           "representation": "Sev4",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "==",
//                           "thresholdValue": "0",
//                           "representation": "Sev0",
//                           "text": "{0}{1}"
//                         },
//                         {
//                           "operator": "Default",
//                           "thresholdValue": null,
//                           "representation": "unknown",
//                           "text": "{0}{1}"
//                         }
//                       ]
//                     }
//                   },
//                   {
//                     "columnMatch": "Alert Id",
//                     "formatter": 7,
//                     "formatOptions": {
//                       "linkTarget": "Resource",
//                       "linkLabel": "Details",
//                       "linkIsContextBlade": true
//                     }
//                   },
//                   {
//                     "columnMatch": "Target",
//                     "formatter": 13,
//                     "formatOptions": {
//                       "linkTarget": null,
//                       "showIcon": true
//                     }
//                   }
//                 ]
//               }
//             },
//             "customWidth": "66",
//             "name": "alertsquery"
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "alertsmanagementresources\n| where ['type'] == 'microsoft.alertsmanagement/alerts'\n| project ['Alert Id']=id,resourceId=properties.context.context.resourceId, alertRule=tolower(tostring(properties.essentials.alertRule)), status=properties.context.status\n| where isnotempty(alertRule)\n| join (resources\n| where type == \"microsoft.insights/scheduledqueryrules\" or type ==\"microsoft.insights/metricalerts\" or type == 'microsoft.insights/activitylogalerts'\n| where isnotempty(tags.MonitorStarterPacks)\n| extend alertRule=tolower(tostring(['id']))) on alertRule\n| summarize count() by AlertType=type\n\n",
//               "size": 0,
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "piechart"
//             },
//             "customWidth": "33",
//             "name": "query - 6 - Copy"
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "status"
//       },
//       "name": "dashboardgroup"
//     },
//     {
//       "type": 1,
//       "content": {
//         "json": "## Server Monitoring Setup\n\nSelect servers on the right to assign a pack. Once the backend is done with the assigning, the server will show on the left side grid.\n\nOn the left side grid, the monitoring can be updated to add more packs, as well as to remove a specific pack or remove any monitoring altogether from the server.",
//         "style": "info"
//       },
//       "conditionalVisibilities": [
//         {
//           "parameterName": "tabSelection",
//           "comparison": "isEqualTo",
//           "value": "discovery"
//         },
//         {
//           "parameterName": "showHelp",
//           "comparison": "isEqualTo",
//           "value": "yes"
//         }
//       ],
//       "name": "text - 15"
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "title": "Servers",
//         "items": [
//           {
//             "type": 12,
//             "content": {
//               "version": "NotebookGroup/1.0",
//               "groupType": "editable",
//               "items": [
//                 {
//                   "type": 3,
//                   "content": {
//                     "version": "KqlItem/1.0",
//                     "query": "resources | where type =~ 'microsoft.hybridcompute/machines' \n| where isnotempty(tolower(tags.MonitorStarterPacks))\n| project Resource=id,['Resource Group']=resourceGroup,Packs=tags.MonitorStarterPacks, OS=properties.osType, subscriptionId\n| union (resources | where type =~ 'microsoft.compute/virtualmachines' \n| where isnotempty(tolower(tags.MonitorStarterPacks))\n| project Resource=id,['Resource Group']=resourceGroup,Packs=tags.MonitorStarterPacks, OS=properties.storageProfile.osDisk.osType, subscriptionId)\n| join kind= leftouter   (resourcecontainers\n| where type =~ 'microsoft.resources/subscriptions'\n| project Subscription=name,subscriptionId) on subscriptionId\n| project-away subscriptionId, subscriptionId1",
//                     "size": 0,
//                     "title": "Monitored Machines",
//                     "exportMultipleValues": true,
//                     "exportedParameters": [
//                       {
//                         "fieldName": "",
//                         "parameterName": "taggedVMs",
//                         "parameterType": 5,
//                         "quote": ""
//                       }
//                     ],
//                     "queryType": 1,
//                     "resourceType": "microsoft.resourcegraph/resources",
//                     "crossComponentResources": [
//                       "{Subscriptions}"
//                     ],
//                     "visualization": "table",
//                     "gridSettings": {
//                       "filter": true
//                     },
//                     "sortBy": []
//                   },
//                   "name": "Monitored Servers",
//                   "styleSettings": {
//                     "margin": "400",
//                     "padding": "400",
//                     "showBorder": true
//                   }
//                 },
//                 {
//                   "type": 9,
//                   "content": {
//                     "version": "KqlParameterItem/1.0",
//                     "crossComponentResources": [
//                       "{Workspace}"
//                     ],
//                     "parameters": [
//                       {
//                         "id": "54f2c7fb-7251-43b6-aa4d-fd94647cac4a",
//                         "version": "KqlParameterItem/1.0",
//                         "name": "PackTagsLeft",
//                         "label": "Add/Remove",
//                         "type": 2,
//                         "isGlobal": true,
//                         "query": "resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| where isnotempty(tags.MonitorStarterPacks)\n| project MPs=tostring(tags.MonitorStarterPacks)\n| summarize by MPs\n",
//                         "crossComponentResources": [
//                           "{Workspace}"
//                         ],
//                         "typeSettings": {
//                           "additionalResourceOptions": [],
//                           "showDefault": false
//                         },
//                         "timeContext": {
//                           "durationMs": 86400000
//                         },
//                         "queryType": 1,
//                         "resourceType": "microsoft.resourcegraph/resources",
//                         "value": null
//                       }
//                     ],
//                     "style": "pills",
//                     "queryType": 1,
//                     "resourceType": "microsoft.resourcegraph/resources"
//                   },
//                   "customWidth": "25",
//                   "conditionalVisibility": {
//                     "parameterName": "taggedVMs",
//                     "comparison": "isNotEqualTo"
//                   },
//                   "name": "parameters - 5 - Copy"
//                 },
//                 {
//                   "type": 11,
//                   "content": {
//                     "version": "LinkItem/1.0",
//                     "style": "paragraph",
//                     "links": [
//                       {
//                         "id": "36b65f94-1c3d-4e7a-b771-677a2081d288",
//                         "cellValue": "",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Remove Monitoring for {PackTagsLeft} Pack ",
//                         "preText": "",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [
//                             {
//                               "key": "action",
//                               "value": "removeTag"
//                             }
//                           ],
//                           "body": "{ \n  \"function\": \"tagmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"RemoveTag\",\n    \"Resources\": [{taggedVMs}],\n    \"Pack\": \"{PackTagsLeft}\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Remove Monitoring",
//                           "description": "# Please confirm the change.\n\nRemove Monitoring for {PackTagsLeft} Pack \n\nServers:\n\n{taggedVMs}",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "550df977-06a8-4c40-9cd3-aba6286ebcdf",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Add Monitoring for {PackTagsLeft} Pack",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"tagmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"AddTag\",\n    \"Resources\": [{taggedVMs}],\n    \"Pack\": \"{PackTagsLeft}\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Add Monitoring",
//                           "description": "# Please confirm the change.\n\nAdd Monitoring for {PackTagsLeft} Pack ",
//                           "actionName": "AddMonitoringPack",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "3b1af630-47ab-43e9-a5b2-d2f2e21880d0",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Remove All Monitoring for VM",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"tagmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"RemoveTag\",\n    \"Resources\": [{taggedVMs}],\n    \"Pack\": \"All\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Remove All Monitoring",
//                           "description": "# Please confirm the change.\n\nRemove All Monitoring for {PackTagsLeft} Pack ",
//                           "actionName": "RemoveAllMonitoring",
//                           "runLabel": "Confirm"
//                         }
//                       }
//                     ]
//                   },
//                   "customWidth": "75",
//                   "conditionalVisibility": {
//                     "parameterName": "taggedVMs",
//                     "comparison": "isNotEqualTo"
//                   },
//                   "name": "links - 1"
//                 }
//               ],
//               "exportParameters": true
//             },
//             "customWidth": "50",
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "discovery"
//             },
//             "name": "TaggedGroup"
//           },
//           {
//             "type": 12,
//             "content": {
//               "version": "NotebookGroup/1.0",
//               "groupType": "editable",
//               "items": [
//                 {
//                   "type": 3,
//                   "content": {
//                     "version": "KqlItem/1.0",
//                     "query": "resources | where type =~ 'microsoft.hybridcompute/machines' \n| where isempty(tolower(tags.MonitorStarterPacks)) //and subscriptionId in split('{Subscriptions:subscriptionId}',',')\n| project Resource=id,['Resource Group']=resourceGroup, OS=properties.osType, subscriptionId\n| union (resources | where type =~ 'microsoft.compute/virtualmachines' \n| where isempty(tolower(tags.MonitorStarterPacks)) //and subscriptionId in split('{Subscriptions:subscriptionId}',',')\n| project Resource=id,['Resource Group']=resourceGroup, OS=properties.storageProfile.osDisk.osType, subscriptionId)\n| join kind= leftouter   (resourcecontainers\n| where type =~ 'microsoft.resources/subscriptions'\n| project Subscription=name,subscriptionId) on subscriptionId\n| project-away subscriptionId, subscriptionId1",
//                     "size": 0,
//                     "title": "Non-monitored Machines",
//                     "exportMultipleValues": true,
//                     "exportedParameters": [
//                       {
//                         "parameterName": "vmstotag",
//                         "parameterType": 1,
//                         "quote": ""
//                       }
//                     ],
//                     "queryType": 1,
//                     "resourceType": "microsoft.resourcegraph/resources",
//                     "crossComponentResources": [
//                       "{Subscriptions}"
//                     ],
//                     "visualization": "table",
//                     "gridSettings": {
//                       "filter": true
//                     },
//                     "sortBy": []
//                   },
//                   "name": "Non Monitores Servers",
//                   "styleSettings": {
//                     "margin": "400",
//                     "padding": "400",
//                     "showBorder": true
//                   }
//                 },
//                 {
//                   "type": 9,
//                   "content": {
//                     "version": "KqlParameterItem/1.0",
//                     "crossComponentResources": [
//                       "value::tenant"
//                     ],
//                     "parameters": [
//                       {
//                         "id": "8a177eab-edac-41cc-84f9-a5b7de931bea",
//                         "version": "KqlParameterItem/1.0",
//                         "name": "PackTags",
//                         "label": "Select Pack to Enable",
//                         "type": 2,
//                         "isGlobal": true,
//                         "query": "resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| where isnotempty(tags.MonitorStarterPacks)\n| project MPs=tostring(tags.MonitorStarterPacks)\n| summarize by MPs",
//                         "crossComponentResources": [
//                           "value::tenant"
//                         ],
//                         "typeSettings": {
//                           "additionalResourceOptions": [],
//                           "showDefault": false
//                         },
//                         "timeContext": {
//                           "durationMs": 86400000
//                         },
//                         "queryType": 1,
//                         "resourceType": "microsoft.resources/tenants",
//                         "value": null
//                       }
//                     ],
//                     "style": "pills",
//                     "queryType": 1,
//                     "resourceType": "microsoft.resources/tenants"
//                   },
//                   "customWidth": "50",
//                   "conditionalVisibility": {
//                     "parameterName": "vmstotag",
//                     "comparison": "isNotEqualTo"
//                   },
//                   "name": "parameters - 5"
//                 },
//                 {
//                   "type": 11,
//                   "content": {
//                     "version": "LinkItem/1.0",
//                     "style": "paragraph",
//                     "links": [
//                       {
//                         "id": "91fb0fed-0e4f-41ce-9024-98a3cc4432a7",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Enable Monitoring for {PackTags} Pack",
//                         "preText": "",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [
//                             {
//                               "key": "action",
//                               "value": "addTag"
//                             }
//                           ],
//                           "body": "{ \n  \"function\": \"tagmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"AddTag\",\n    \"Resources\": [{vmstotag}],\n    \"Pack\": \"{PackTags}\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Enable Monitoring Packs",
//                           "description": "# This will enable the pack for the following servers:\n{vmstotag}\n\nby adding the {PackTags} to the server.",
//                           "actionName": "EnableMonitoring",
//                           "runLabel": "Confirm"
//                         }
//                       }
//                     ]
//                   },
//                   "customWidth": "50",
//                   "conditionalVisibility": {
//                     "parameterName": "vmstotag",
//                     "comparison": "isNotEqualTo"
//                   },
//                   "name": "links - 1 - Copy"
//                 }
//               ],
//               "exportParameters": true
//             },
//             "customWidth": "50",
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "discovery"
//             },
//             "name": "NonTaggedGroup"
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "discovery"
//       },
//       "name": "IaaS",
//       "styleSettings": {
//         "showBorder": true
//       }
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "title": "Alert Management - MonStar Alerts",
//         "items": [
//           {
//             "type": 9,
//             "content": {
//               "version": "KqlParameterItem/1.0",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "parameters": [
//                 {
//                   "id": "e99b4870-f7a6-4b8e-95b7-6aaeece1f438",
//                   "version": "KqlParameterItem/1.0",
//                   "name": "AlertPack",
//                   "type": 2,
//                   "query": "resources\n| where tolower(type) in (\"microsoft.insights/scheduledqueryrules\", \"microsoft.insights/metricalerts\",\"microsoft.insights/activitylogalerts\")\n| where isnotempty(tags.MonitorStarterPacks)\n| project MPs=tostring(tags.MonitorStarterPacks)\n| summarize by MPs\n",
//                   "crossComponentResources": [
//                     "value::tenant"
//                   ],
//                   "typeSettings": {
//                     "additionalResourceOptions": [],
//                     "showDefault": false
//                   },
//                   "timeContext": {
//                     "durationMs": 86400000
//                   },
//                   "queryType": 1,
//                   "resourceType": "microsoft.resources/tenants",
//                   "value": "vWan"
//                 }
//               ],
//               "style": "pills",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants"
//             },
//             "name": "parameters - 7"
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "resources\n| where tolower(type) in (\"microsoft.insights/scheduledqueryrules\")\n| where isnotempty(tags.MonitorStarterPacks)\n| project id,MP=tags.MonitorStarterPacks, Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions.actionGroups[0],\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1]\n| union (\nresources\n| where tolower(type) in (\"microsoft.insights/metricalerts\")\n| where isnotempty(tags.MonitorStarterPacks)\n| project id,MP=tags.MonitorStarterPacks, Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions[0].actionGroupId,\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1])\n| union (resources\n| where tolower(type) in (\"microsoft.insights/activitylogalerts\")\n| where isnotempty(tags.MonitorStarterPacks)\n| project id,MP=tags.MonitorStarterPacks, Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions.actionGroups[0].actionGroupId,\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1])\n| where MP=='{AlertPack}'",
//               "size": 0,
//               "exportMultipleValues": true,
//               "exportedParameters": [
//                 {
//                   "fieldName": "",
//                   "parameterName": "alertsselected",
//                   "parameterType": 1,
//                   "quote": ""
//                 }
//               ],
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "table",
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "location",
//                     "formatter": 5
//                   },
//                   {
//                     "columnMatch": "name",
//                     "formatter": 7
//                   }
//                 ],
//                 "filter": true
//               }
//             },
//             "customWidth": "70",
//             "name": "query - 6",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 12,
//             "content": {
//               "version": "NotebookGroup/1.0",
//               "groupType": "editable",
//               "items": [
//                 {
//                   "type": 1,
//                   "content": {
//                     "json": "# Enable or Disable alerts. \n\n## By selecting a list of alerts on the left, the buttons will disable or enable the alert rules in Azure Monitor.\n\n# Update Action Group\n## Select a list of alerts on the left and a new Action Group to assign to the alert.",
//                     "style": "info"
//                   },
//                   "conditionalVisibility": {
//                     "parameterName": "showHelp",
//                     "comparison": "isEqualTo",
//                     "value": "yes"
//                   },
//                   "name": "text - 3"
//                 },
//                 {
//                   "type": 3,
//                   "content": {
//                     "version": "KqlItem/1.0",
//                     "query": "resources\n| where type == \"microsoft.insights/actiongroups\"\n| where properties.enabled == 'true'\n| project id, emailReceivers=strcat(properties.emailReceivers[0].name,\"(\",properties.emailReceivers[0].emailAddress,\")\")",
//                     "size": 1,
//                     "exportFieldName": "",
//                     "exportParameterName": "selectedAG",
//                     "queryType": 1,
//                     "resourceType": "microsoft.resources/tenants",
//                     "crossComponentResources": [
//                       "value::tenant"
//                     ],
//                     "gridSettings": {
//                       "formatters": [
//                         {
//                           "columnMatch": "id",
//                           "formatter": 13,
//                           "formatOptions": {
//                             "linkTarget": "OpenBlade",
//                             "linkIsContextBlade": true,
//                             "showIcon": true
//                           }
//                         }
//                       ],
//                       "filter": true
//                     }
//                   },
//                   "conditionalVisibility": {
//                     "parameterName": "alertsselected",
//                     "comparison": "isNotEqualTo"
//                   },
//                   "name": "query - 3",
//                   "styleSettings": {
//                     "showBorder": true
//                   }
//                 },
//                 {
//                   "type": 11,
//                   "content": {
//                     "version": "LinkItem/1.0",
//                     "style": "paragraph",
//                     "links": [
//                       {
//                         "id": "f5cb3ede-91d1-4414-bfa1-a1689f45d0c8",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Enable Alerts",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Enable\", \n    \"alerts\":  [{alertsselected}]\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Enable Alerts",
//                           "description": "# This action will Enable the selected Alerts\n\n{alertsselected}",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "d9469141-a104-4696-b9cd-f0fc7e3f963e",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Disable Alerts",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Disable\", \n    \"alerts\":  [{alertsselected}]\n  }\n}\n",
//                           "httpMethod": "POST",
//                           "title": "Disable Alerts",
//                           "description": "# This action will disable the selected Alerts\n\n{alertsselected}",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "7942ba17-4942-4f4a-b2ea-e19ad806b49d",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Update Action Group",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Update\", \n    \"alerts\":  [{alertsselected}],\n    \"aGroup\": {selectedAG}\n  }\n}\n",
//                           "httpMethod": "POST",
//                           "title": "Update Action Group",
//                           "description": "Updating alerts:\n\n\n{alertsselected}\n\nwith Action Group:\n\n{selectedAG}\n",
//                           "actionName": "updateAG",
//                           "runLabel": "Update"
//                         }
//                       }
//                     ]
//                   },
//                   "name": "links - 8"
//                 }
//               ]
//             },
//             "customWidth": "30",
//             "name": "AlertsSubGroup1"
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "alertmanagement"
//       },
//       "name": "AlertMGMT"
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "title": "Alert Management - Other Alerts",
//         "items": [
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "resources\n| where tolower(type) in (\"microsoft.insights/scheduledqueryrules\")\n| where isempty(tags.MonitorStarterPacks)\n| project id,Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions.actionGroups[0],\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1]\n| union (\nresources\n| where tolower(type) in (\"microsoft.insights/metricalerts\")\n| where isempty(tags.MonitorStarterPacks)\n| project id, Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions[0].actionGroupId,\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1])\n| union (resources\n| where tolower(type) in (\"microsoft.insights/activitylogalerts\")\n| where isempty(tags.MonitorStarterPacks)\n| project id,Enabled=properties.enabled, Description=properties.description, ['Action Group']=split(properties.actions.actionGroups[0].actionGroupId,\"/\")[8], location, Target=split(properties.scopes[0],\"/\")[-1])",
//               "size": 0,
//               "exportMultipleValues": true,
//               "exportedParameters": [
//                 {
//                   "fieldName": "",
//                   "parameterName": "alertsselectednopack",
//                   "parameterType": 1,
//                   "quote": ""
//                 }
//               ],
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "visualization": "table",
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "location",
//                     "formatter": 5
//                   },
//                   {
//                     "columnMatch": "name",
//                     "formatter": 7
//                   }
//                 ],
//                 "filter": true
//               }
//             },
//             "customWidth": "70",
//             "name": "queryOtherAlerts",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 12,
//             "content": {
//               "version": "NotebookGroup/1.0",
//               "groupType": "editable",
//               "items": [
//                 {
//                   "type": 1,
//                   "content": {
//                     "json": "# Enable or Disable alerts. \n\n## By selecting a list of alerts on the left, the buttons will disable or enable the alert rules in Azure Monitor.\n\n# Update Action Group\n## Select a list of alerts on the left and a new Action Group to assign to the alert.",
//                     "style": "info"
//                   },
//                   "conditionalVisibility": {
//                     "parameterName": "showHelp",
//                     "comparison": "isEqualTo",
//                     "value": "yes"
//                   },
//                   "name": "text - 3"
//                 },
//                 {
//                   "type": 3,
//                   "content": {
//                     "version": "KqlItem/1.0",
//                     "query": "resources\n| where type == \"microsoft.insights/actiongroups\"\n| where properties.enabled == 'true'\n| project id, emailReceivers=strcat(properties.emailReceivers[0].name,\"(\",properties.emailReceivers[0].emailAddress,\")\")",
//                     "size": 1,
//                     "exportFieldName": "",
//                     "exportParameterName": "selectedAG",
//                     "queryType": 1,
//                     "resourceType": "microsoft.resourcegraph/resources",
//                     "gridSettings": {
//                       "filter": true
//                     }
//                   },
//                   "name": "agQuery2",
//                   "styleSettings": {
//                     "showBorder": true
//                   }
//                 },
//                 {
//                   "type": 11,
//                   "content": {
//                     "version": "LinkItem/1.0",
//                     "style": "paragraph",
//                     "links": [
//                       {
//                         "id": "f5cb3ede-91d1-4414-bfa1-a1689f45d0c8",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Enable Alerts",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Enable\", \n    \"alerts\":  [{alertsselectednopack}]\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Enable Alerts",
//                           "description": "# This action will Enable the selected Alerts\n\n{alertsselected}",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "d9469141-a104-4696-b9cd-f0fc7e3f963e",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Disable Alerts",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Disable\", \n    \"alerts\":  [{alertsselectednopack}]\n  }\n}\n",
//                           "httpMethod": "POST",
//                           "title": "Disable Alerts",
//                           "description": "# This action will disable the selected Alerts\n\n{alertsselected}",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "7942ba17-4942-4f4a-b2ea-e19ad806b49d",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Update Action Group",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"alertmgmt\",\n  \"functionBody\" : {\n    \"Action\":\"Update\", \n    \"alerts\":  [{alertsselectednopack}],\n    \"aGroup\": {selectedAG}\n  }\n}\n",
//                           "httpMethod": "POST",
//                           "title": "Update Action Group",
//                           "description": "Updating alerts:\n\n\n{alertsselected}\n\nwith Action Group:\n\n{selectedAG}\n",
//                           "actionName": "updateAG",
//                           "runLabel": "Update"
//                         }
//                       }
//                     ]
//                   },
//                   "name": "links - 8"
//                 }
//               ]
//             },
//             "customWidth": "30",
//             "conditionalVisibility": {
//               "parameterName": "alertsselectednopack",
//               "comparison": "isNotEqualTo"
//             },
//             "name": "AlertsSubGroup1"
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "alertmanagement"
//       },
//       "name": "AlertMGMT - Others"
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "title": "IaaS Packs Association",
//         "items": [
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| extend MPs=tostring(['tags'].MonitorStarterPacks)\n| where isnotempty(MPs) //or properties.dataSources.performanceCounters[0].name == 'VMInsightsPerfCounters'\n| summarize by Pack=MPs,rulename=tostring(name)\n| join (insightsresources\n| where type == \"microsoft.insights/datacollectionruleassociations\"\n| extend resourceId=split(id,'/providers/Microsoft.Insights/')[0]\n| where isnotnull(properties.dataCollectionRuleId)\n| project rulename=tostring(split(properties.dataCollectionRuleId,\"/\")[8]),resourceName=tostring(split(resourceId,\"/\")[8]),resourceId//ruleId=properties.dataCollectionRuleId\n) on rulename\n| project-away rulename1,resourceId\n| summarize Associated=count() by Pack, rulename\n| order by Pack asc",
//               "size": 0,
//               "title": "Select Pack to see associated Machines",
//               "exportFieldName": "rulename",
//               "exportParameterName": "selectedRule",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "Group",
//                     "formatter": 1
//                   }
//                 ],
//                 "filter": true
//               },
//               "sortBy": []
//             },
//             "customWidth": "50",
//             "name": "query - 6 - Copy",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "insightsresources\n| where type == \"microsoft.insights/datacollectionruleassociations\"\n| extend resourceId=split(id,'/providers/Microsoft.Insights/')[0]\n| where isnotnull(properties.dataCollectionRuleId)\n| project rulename=split(properties.dataCollectionRuleId,\"/\")[8],resourceName=split(resourceId,\"/\")[8],resourceId//ruleId=properties.dataCollectionRuleId\n| where '{selectedRule}'==rulename",
//               "size": 0,
//               "title": "Associated Machines",
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "Group",
//                     "formatter": 1
//                   }
//                 ],
//                 "filter": true
//               }
//             },
//             "customWidth": "50",
//             "name": "query - 6 - Copy - Copy",
//             "styleSettings": {
//               "showBorder": true
//             }
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "rulemanagement"
//       },
//       "name": "rulemanagement",
//       "styleSettings": {
//         "showBorder": true
//       }
//     },
//     {
//       "type": 3,
//       "content": {
//         "version": "KqlItem/1.0",
//         "query": "resources\n| where type == \"microsoft.insights/datacollectionrules\"\n| where isnotempty(tags.MonitorStarterPacks)\n| extend ds=properties.dataSources\n| project id,Type=kind, location,syslog=ds.syslog[0].streams[0], windowsEventLogs=ds.windowsEventLogs[0].streams[0], logsettings=ds.logFiles, performanceCounters=ds.performanceCounters[0].streams[0],provisioningState=properties.provisioningState, \ndataCollectionEndpointId=properties.dataCollectionEndpointId,transformKql=properties.dataFlows[0].transformKql,workspaceResourceId=properties.destinations.logAnalytics[0].workspaceResourceId\n",
//         "size": 1,
//         "title": "List of Currently Configured Data Collection Rules",
//         "showRefreshButton": true,
//         "exportedParameters": [
//           {
//             "parameterName": "selectedRule"
//           },
//           {
//             "fieldName": "destinationName",
//             "parameterName": "destinationName",
//             "parameterType": 1
//           },
//           {
//             "fieldName": "",
//             "parameterName": "resourceGroupName",
//             "parameterType": 1
//           },
//           {
//             "fieldName": "workspaceResourceId",
//             "parameterName": "workspace",
//             "parameterType": 5
//           },
//           {
//             "fieldName": "properties",
//             "parameterName": "properties",
//             "parameterType": 1
//           },
//           {
//             "fieldName": "name",
//             "parameterName": "name",
//             "parameterType": 1
//           },
//           {
//             "fieldName": "location",
//             "parameterName": "location",
//             "parameterType": 1
//           },
//           {
//             "fieldName": "Rule Type",
//             "parameterName": "kind",
//             "parameterType": 1
//           },
//           {
//             "parameterType": 1
//           },
//           {
//             "fieldName": "id",
//             "parameterName": "id",
//             "parameterType": 1
//           }
//         ],
//         "showExportToExcel": true,
//         "exportToExcelOptions": "all",
//         "queryType": 1,
//         "resourceType": "microsoft.resourcegraph/resources",
//         "crossComponentResources": [
//           "{Subscriptions}"
//         ],
//         "gridSettings": {
//           "formatters": [
//             {
//               "columnMatch": "id",
//               "formatter": 13,
//               "formatOptions": {
//                 "linkColumn": "id",
//                 "linkTarget": "Resource",
//                 "linkIsContextBlade": true,
//                 "showIcon": true
//               }
//             },
//             {
//               "columnMatch": "Type",
//               "formatter": 18,
//               "formatOptions": {
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "==",
//                     "thresholdValue": "Windows",
//                     "representation": "Initial_Access",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "==",
//                     "thresholdValue": "Linux",
//                     "representation": "Console",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "Capture",
//                     "text": "Custom"
//                   }
//                 ]
//               }
//             },
//             {
//               "columnMatch": "location",
//               "formatter": 17,
//               "formatOptions": {
//                 "customColumnWidthSetting": "94px"
//               }
//             },
//             {
//               "columnMatch": "syslog",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "subTarget": "2",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "bladeOpenContext": {
//                   "bladeName": "DataCollectionRulesDataSourceManagementViewModel",
//                   "extensionName": "Microsoft_Azure_Monitoring",
//                   "bladeParameters": [
//                     {
//                       "name": "id",
//                       "source": "column",
//                       "value": "id"
//                     }
//                   ]
//                 },
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "windowsEventLogs",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "logsettings",
//               "formatter": 18,
//               "formatOptions": {
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "performanceCounters",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkColumn": "performanceCounters",
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured!"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "provisioningState",
//               "formatter": 18,
//               "formatOptions": {
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "contains",
//                     "thresholdValue": "succeeded",
//                     "representation": "success",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "{0}{1}"
//                   }
//                 ],
//                 "customColumnWidthSetting": "17ch"
//               },
//               "numberFormat": {
//                 "unit": 0,
//                 "options": {
//                   "style": "decimal"
//                 }
//               }
//             },
//             {
//               "columnMatch": "dataCollectionEndpointId",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "Resource",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "21.7143ch"
//               }
//             },
//             {
//               "columnMatch": "transformKql",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkColumn": "queries",
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "stopped",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "contains",
//                     "thresholdValue": "|",
//                     "representation": "success",
//                     "text": "Ingestion KQL"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "stopped",
//                     "text": "Custom KQL"
//                   }
//                 ],
//                 "bladeOpenContext": {
//                   "bladeName": "CreateMicrosoftTableTransformBlade",
//                   "extensionName": "Microsoft_OperationsManagementSuite_Workspace",
//                   "bladeJsonParameters": "{\r\n\t\"workspaceResourceId\" : \"{workspace}\",\r\n\t\"providers\" : \"microsoft.operationalinsights\",\r\n\t\"table\" : { \r\n\t\t\"name\" : \"{selectedTableName}\",\r\n\t\t\"description\":\"Security events collected from windows machines by Azure Security Center or Azure Sentinel.\",\r\n\t\t\"hasData\":true,\r\n\t\t\"tableType\":\"Microsoft\",\r\n\t\t\"tableAPIState\":\"Any\",\r\n\t\t\"solutions\":[\"Security and Audit\",\"Microsoft Sentinel\"],\r\n\t\t\"categories\":[\"Security\"],\r\n\t\t\"retentionInDaysAsDefault\":false,\r\n\t\t\"totalRetentionInDaysAsDefault\":false,\r\n\t\t\"isEditTransformationEnabled\":true,\r\n\t\t\"isCreateTransformationEnabled\":true\r\n\t},\r\n\t\"isMicrosoftTable\" : true,\r\n\t\"isMigrationRequired\" : false\r\n}"
//                 },
//                 "customColumnWidthSetting": "22ch"
//               }
//             },
//             {
//               "columnMatch": "workspaceResourceId",
//               "formatter": 13,
//               "formatOptions": {
//                 "linkTarget": "Resource",
//                 "showIcon": true,
//                 "customColumnWidthSetting": "16.8571ch"
//               }
//             },
//             {
//               "columnMatch": "properties",
//               "formatter": 7,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "linkLabel": "📋",
//                 "linkIsContextBlade": true,
//                 "customColumnWidthSetting": "5ch"
//               }
//             },
//             {
//               "columnMatch": "kind",
//               "formatter": 18,
//               "formatOptions": {
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "Capture",
//                     "text": "{0}{1} Custom"
//                   },
//                   {
//                     "operator": "contains",
//                     "thresholdValue": "Linux",
//                     "representation": "Console",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "contains",
//                     "thresholdValue": "Windows",
//                     "representation": "Initial_Access",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "contains",
//                     "thresholdValue": "WorkspaceTransforms",
//                     "representation": "Persistence",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "{0}{1}"
//                   }
//                 ],
//                 "customColumnWidthSetting": "17ch"
//               }
//             },
//             {
//               "columnMatch": "name",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "securityEvents",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkColumn": "windowsEventLogs",
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "destinations",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "queries",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "dataSources",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "dataFlows",
//               "formatter": 5,
//               "formatOptions": {
//                 "aggregation": "Sum"
//               }
//             },
//             {
//               "columnMatch": "description",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "destinationName",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "lastModifiedBy",
//               "formatter": 5
//             },
//             {
//               "columnMatch": "customEvents",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "is Empty",
//                     "representation": "cancelled",
//                     "text": "Not Configured"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "success",
//                     "text": "Configured"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             },
//             {
//               "columnMatch": "StepTab",
//               "formatter": 5
//             }
//           ],
//           "rowLimit": 1000,
//           "filter": true
//         },
//         "sortBy": []
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "rulemanagement"
//       },
//       "name": "Select Existing DCR - Copy",
//       "styleSettings": {
//         "showBorder": true
//       }
//     },
//     {
//       "type": 12,
//       "content": {
//         "version": "NotebookGroup/1.0",
//         "groupType": "editable",
//         "title": "Policy Assignment Status",
//         "items": [
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "policyresources | where type == \"microsoft.policyinsights/policystates\" | extend policyName=tostring(properties.policyDefinitionName), complianceState=properties.complianceState\n| join (policyresources | where type == \"microsoft.authorization/policydefinitions\" and isnotempty(properties.metadata.MonitorStarterPacks) | project policyId=id, policyName=name, pack=tostring(properties.metadata.MonitorStarterPacks)) on policyName\n| project policyId, policyName, complianceState=tostring(complianceState), pack,type='Policy'\n| union( policyresources\n| where type =~ 'Microsoft.PolicyInsights/PolicyStates'\n| extend complianceState = tostring(properties.complianceState)\n| extend\n\tresourceId = tostring(properties.resourceId),\n\tpolicyAssignmentId = tostring(properties.policyAssignmentId),\n\tpolicyAssignmentScope = tostring(properties.policyAssignmentScope),\n\tpolicyAssignmentName = tostring(properties.policyAssignmentName),\n\tpolicyDefinitionId = tostring(properties.policyDefinitionId),\n    policySetDefinitionId=tostring(properties.policySetDefinitionId),\n\tpolicyDefinitionReferenceId = tostring(properties.policyDefinitionReferenceId),\n\tstateWeight = iff(complianceState == 'NonCompliant', int(300), iff(complianceState == 'Compliant', int(200), iff(complianceState == 'Conflict', int(100), iff(complianceState == 'Exempt', int(50), int(0)))))\n| summarize max(stateWeight) by resourceId, policyAssignmentId, policyAssignmentScope, policyAssignmentName,policySetDefinitionId\n| summarize counts = count() by policyAssignmentId, policyAssignmentScope, max_stateWeight, policyAssignmentName,policySetDefinitionId\n| summarize overallStateWeight = max(max_stateWeight),\nnonCompliantCount = sumif(counts, max_stateWeight == 300),\ncompliantCount = sumif(counts, max_stateWeight == 200),\nconflictCount = sumif(counts, max_stateWeight == 100),\nexemptCount = sumif(counts, max_stateWeight == 50) by policyAssignmentId, policyAssignmentScope, policyAssignmentName,policySetDefinitionId\n| extend totalResources = todouble(nonCompliantCount + compliantCount + conflictCount + exemptCount)\n| extend compliancePercentage = iff(totalResources == 0, todouble(100), 100 * todouble(compliantCount + exemptCount) / totalResources)\n| project policyAssignmentName, scope = policyAssignmentScope,policySetDefinitionId,\ncomplianceState = iff(overallStateWeight == 300, 'nonCompliant', iff(overallStateWeight == 200, 'Compliant', iff(overallStateWeight == 100, 'conflict', iff(overallStateWeight == 50, 'exempt', 'notstarted')))),\ncompliancePercentage,\ncompliantCount,\nnonCompliantCount,\nconflictCount,\nexemptCount\n| where isnotempty(policySetDefinitionId)\n| join (policyresources\n| where type =~ 'microsoft.authorization/policysetdefinitions' and isnotempty(properties.metadata.MonitorStarterPacks)\n| extend policySetDefinitionId=tostring(id)) on policySetDefinitionId\n| project policyId=policySetDefinitionId, policyName=name,complianceState,pack='N/A', type='Set')",
//               "size": 0,
//               "title": "Assignment Status (Compliance)",
//               "exportedParameters": [
//                 {
//                   "parameterName": "policiesToRemediate",
//                   "parameterType": 5
//                 }
//               ],
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "complianceState",
//                     "formatter": 18,
//                     "formatOptions": {
//                       "thresholdsOptions": "icons",
//                       "thresholdsGrid": [
//                         {
//                           "operator": "==",
//                           "thresholdValue": "Compliant",
//                           "representation": "success",
//                           "text": "Compliant"
//                         },
//                         {
//                           "operator": "==",
//                           "thresholdValue": "Non-compliant",
//                           "representation": "2",
//                           "text": "Non-Compliant"
//                         },
//                         {
//                           "operator": "Default",
//                           "thresholdValue": null,
//                           "representation": "warning",
//                           "text": "{0}{1}"
//                         }
//                       ]
//                     }
//                   }
//                 ],
//                 "filter": true
//               }
//             },
//             "customWidth": "75",
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "policystatus"
//             },
//             "name": "query - 8",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 12,
//             "content": {
//               "version": "NotebookGroup/1.0",
//               "groupType": "editable",
//               "items": [
//                 {
//                   "type": 11,
//                   "content": {
//                     "version": "LinkItem/1.0",
//                     "style": "list",
//                     "links": [
//                       {
//                         "id": "b3bb5a4d-0f95-4e9a-8634-9cb027f860aa",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Remediate (all policies)",
//                         "preText": "",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"policymgmt\",\n  \"functionBody\" : {\n    \"SolutionTag\":\"MonitorStarterPacks\",\n    \"Action\": \"Remediate\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Rmediate policies",
//                           "description": "# Please confirm remediation\n\nThis button will trigger a global policy remeadiation. \n\nThe backend script will go through the policies and initiatives, finding the ones that are not compliant, and will trigger remediation. \n\nIt is not restricted to the ones in this screen.",
//                           "actionName": "Remediate",
//                           "runLabel": "Confirm"
//                         }
//                       },
//                       {
//                         "id": "8dfc5afa-108a-4713-8a0c-651c3a32c5f1",
//                         "linkTarget": "ArmAction",
//                         "linkLabel": "Check Compliance",
//                         "style": "primary",
//                         "linkIsContextBlade": true,
//                         "armActionContext": {
//                           "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                           "headers": [],
//                           "params": [],
//                           "body": "{ \n  \"function\": \"policymgmt\",\n  \"functionBody\" : {\n    \"SolutionTag\":\"MonitorStarterPacks\",\n    \"Action\": \"Scan\"\n  }\n}",
//                           "httpMethod": "POST",
//                           "title": "Check Policy Compliance",
//                           "description": "# Please confirm the scan.",
//                           "runLabel": "Confirm"
//                         }
//                       }
//                     ]
//                   },
//                   "name": "links - 3"
//                 },
//                 {
//                   "type": 1,
//                   "content": {
//                     "json": "## Policy Compliance Check\nThis task will trigger a tenant wide check for policy compliance.\n\n## Policy Remediation\n\nThis Task will trigger remediation for the policies in the list that are considered not compliant at this time.",
//                     "style": "info"
//                   },
//                   "conditionalVisibilities": [
//                     {
//                       "parameterName": "tabSelection",
//                       "comparison": "isEqualTo",
//                       "value": "policystatus"
//                     },
//                     {
//                       "parameterName": "showHelp",
//                       "comparison": "isEqualTo",
//                       "value": "yes"
//                     }
//                   ],
//                   "name": "text - 7"
//                 }
//               ]
//             },
//             "customWidth": "25",
//             "name": "ComplianceButtons"
//           },
//           {
//             "type": 1,
//             "content": {
//               "json": "## Installed Policies and Initiatives with Assignments\n\nThis grid can be used to visualize the policies and currenct assignments as well as assing/unassign policies to/from different scopes.\n\nOnce one or more policies are selected, the diaglog of scopes (subscriptions and management groups) is displayed along with the respective buttons.\n",
//               "style": "info"
//             },
//             "conditionalVisibilities": [
//               {
//                 "parameterName": "tabSelection",
//                 "comparison": "isEqualTo",
//                 "value": "policystatus"
//               },
//               {
//                 "parameterName": "showHelp",
//                 "comparison": "isEqualTo",
//                 "value": "yes"
//               }
//             ],
//             "name": "text - 7"
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "policyresources\n| where type == \"microsoft.authorization/policydefinitions\"\n| where  isnotempty(properties.metadata.MonitorStarterPacks)\n| project Name=name, Type='Policy',['id'],Pack=tostring(properties.metadata.MonitorStarterPacks)\n| join kind = leftouter (policyresources\n| where type == \"microsoft.authorization/policyassignments\"\n| project AssignmentName=name,scope=properties.scope,PolicyId=tostring(properties.policyDefinitionId), PolicyName=split(properties.PolicyId,\"/\")[8]\n| join kind=leftouter  (policyresources\n| where type == \"microsoft.authorization/policydefinitions\"\n| where  isnotempty(properties.metadata.MonitorStarterPacks)) on $left.PolicyId == $right.id\n| project tostring(AssignmentName),Name=tostring(split(PolicyId,\"/\")[8]), PolicyId,ScopeLevel=iff(scope contains 'subscriptions',\"Sub\", \"MG\"), Scope=scope) on Name\n| project-away Name1, id\n| union ( policyresources\n| where type == \"microsoft.authorization/policysetdefinitions\"\n| where  isnotempty(properties.metadata.MonitorStarterPacks)\n| project Name=name, Type='Initiative',['id'],Pack=\"_N/A\"\n| join kind = leftouter (policyresources\n| where type == \"microsoft.authorization/policyassignments\"\n| project AssignmentName=name,scope=properties.scope,PolicyId=tostring(properties.policyDefinitionId), PolicyName=split(properties.PolicyId,\"/\")[8]\n| join kind=leftouter  (policyresources\n| where type == \"microsoft.authorization/policysetdefinitions\"\n| where  isnotempty(properties.metadata.MonitorStarterPacks)) on $left.PolicyId == $right.id\n| project tostring(AssignmentName),Name=tostring(split(PolicyId,\"/\")[8]), PolicyId, ScopeLevel=iff(scope contains 'subscriptions',\"Sub\", \"MG\"),Scope=scope) on Name\n| project-away Name1, id)\n| sort by Pack asc, AssignmentName asc ",
//               "size": 0,
//               "title": "Installed Policies and Initiatives with Assignments",
//               "noDataMessage": "No MonStar policies (packs) installed.",
//               "exportMultipleValues": true,
//               "exportedParameters": [
//                 {
//                   "fieldName": "",
//                   "parameterName": "policyseletedpolicy",
//                   "parameterType": 1
//                 }
//               ],
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ],
//               "gridSettings": {
//                 "formatters": [
//                   {
//                     "columnMatch": "Group",
//                     "formatter": 1
//                   }
//                 ],
//                 "filter": true
//               }
//             },
//             "conditionalVisibility": {
//               "parameterName": "tabSelection",
//               "comparison": "isEqualTo",
//               "value": "policystatus"
//             },
//             "name": "query - 8 - Copy",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 1,
//             "content": {
//               "json": "Select Scope below to assign a policy. There is no need to Select a scope to Unassign the policy.",
//               "style": "info"
//             },
//             "conditionalVisibility": {
//               "parameterName": "policyseletedpolicy",
//               "comparison": "isNotEqualTo"
//             },
//             "name": "text - 6"
//           },
//           {
//             "type": 3,
//             "content": {
//               "version": "KqlItem/1.0",
//               "query": "resourcecontainers\n| where type == 'microsoft.management/managementgroups' or type =~ 'microsoft.resources/subscriptions'\n| project name, id, subscriptionId, type=split(type,'/')[1]",
//               "size": 0,
//               "exportMultipleValues": true,
//               "exportedParameters": [
//                 {
//                   "parameterName": "policyscopes",
//                   "parameterType": 1,
//                   "quote": "\""
//                 }
//               ],
//               "queryType": 1,
//               "resourceType": "microsoft.resources/tenants",
//               "crossComponentResources": [
//                 "value::tenant"
//               ]
//             },
//             "conditionalVisibility": {
//               "parameterName": "policyseletedpolicy",
//               "comparison": "isNotEqualTo"
//             },
//             "name": "query - 15",
//             "styleSettings": {
//               "showBorder": true
//             }
//           },
//           {
//             "type": 11,
//             "content": {
//               "version": "LinkItem/1.0",
//               "style": "paragraph",
//               "links": [
//                 {
//                   "id": "63320366-2b93-4e52-831c-55f7c6de4043",
//                   "linkTarget": "ArmAction",
//                   "linkLabel": "Assign Policy",
//                   "style": "primary",
//                   "linkIsContextBlade": true,
//                   "armActionContext": {
//                     "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                     "headers": [],
//                     "params": [],
//                     "body": "{ \n  \"function\": \"policymgmt\",\n  \"functionBody\" : {\n    \"SolutionTag\":\"MonitorStarterPacks\",\n    \"Action\": \"Assign\",\n    \"Scopes\": [{policyscopes}],\n    \"policies\": [{policyseletedpolicy}]\n  }\n}",
//                     "httpMethod": "POST",
//                     "title": "Assign Policy",
//                     "description": "# Assign policy below to selected scope:\n\n## Policy\n\n{policyseletedpolicy}\n\n## Scope\n\n{policyscopes}",
//                     "runLabel": "Assign"
//                   }
//                 },
//                 {
//                   "id": "ed3b8c20-e2ef-4768-b0b9-bfcc254602e6",
//                   "linkTarget": "ArmAction",
//                   "linkLabel": "Unassign Policy",
//                   "style": "primary",
//                   "linkIsContextBlade": true,
//                   "armActionContext": {
//                     "path": "{logicAppResource}/triggers/manual/run?api-version=2016-06-01",
//                     "headers": [],
//                     "params": [],
//                     "body": "{ \n  \"function\": \"policymgmt\",\n  \"functionBody\" : {\n    \"SolutionTag\":\"MonitorStarterPacks\",\n    \"Action\": \"Unassign\",\n    \"policies\": [{policyseletedpolicy}]\n  }\n}",
//                     "httpMethod": "POST",
//                     "title": "Unassign Policies",
//                     "description": "# Unassign policy or policies below from their scopes.\n\n## Policy\n\n{policyseletedpolicy}\n\n",
//                     "actionName": "Unassign Policies",
//                     "runLabel": "Unassign"
//                   }
//                 }
//               ]
//             },
//             "customWidth": "25",
//             "conditionalVisibility": {
//               "parameterName": "policyseletedpolicy",
//               "comparison": "isNotEqualTo"
//             },
//             "name": "links - 2 - Copy"
//           },
//           {
//             "type": 1,
//             "content": {
//               "json": "## Policies To Assign: \n\n`{policyseletedpolicy}`\n\n## Scopes: \n\n{policyscopes}"
//             },
//             "conditionalVisibilities": [
//               {
//                 "parameterName": "policyseletedpolicy",
//                 "comparison": "isNotEqualTo"
//               },
//               {
//                 "parameterName": "showHelp",
//                 "comparison": "isEqualTo",
//                 "value": "yes"
//               }
//             ],
//             "name": "text - 4"
//           }
//         ]
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "policystatus"
//       },
//       "name": "policymgmt"
//     },
//     {
//       "type": 3,
//       "content": {
//         "version": "KqlItem/1.0",
//         "query": "Resources\n| where type == 'microsoft.compute/virtualmachines'\n| extend\n    JoinID = toupper(id),\n    OSName = tostring(properties.osProfile.computerName),\n    OSType = tostring(properties.storageProfile.osDisk.osType)\n| join kind=leftouter(\n    Resources\n    | where ( type == 'microsoft.compute/virtualmachines/extensions') and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId\n| union (Resources\n| where type == 'microsoft.hybridcompute/machines'\n| extend\n    JoinID = toupper(id),\n    OSName = tostring(properties.osProfile.computerName),\n    OSType = tostring(properties.osType)\n| join kind=leftouter(\n    Resources\n    | where type == 'microsoft.hybridcompute/machines/extensions' and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId)\n| summarize by id, OSName, OSType, ExtensionName, subscriptionId\n| join kind= leftouter   (resourcecontainers\n| where type =~ 'microsoft.resources/subscriptions'\n| project Subscription=name,subscriptionId) on subscriptionId\n| project-away subscriptionId, subscriptionId1\n| order by tolower(OSName) asc",
//         "size": 0,
//         "title": "Agent Install Status",
//         "queryType": 1,
//         "resourceType": "microsoft.resources/tenants",
//         "crossComponentResources": [
//           "value::tenant"
//         ],
//         "visualization": "table",
//         "gridSettings": {
//           "formatters": [
//             {
//               "columnMatch": "ExtensionName",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "==",
//                     "thresholdValue": "AzureMonitorLinuxAgent",
//                     "representation": "success",
//                     "text": "Linux Agent"
//                   },
//                   {
//                     "operator": "==",
//                     "thresholdValue": "AzureMonitorWindowsAgent",
//                     "representation": "success",
//                     "text": "Windows Agent"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "stopped",
//                     "text": "No Agent"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             }
//           ],
//           "filter": true
//         },
//         "sortBy": []
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "agentmgmt"
//       },
//       "customWidth": "50",
//       "name": "query - agent install status",
//       "styleSettings": {
//         "showBorder": true
//       }
//     },
//     {
//       "type": 3,
//       "content": {
//         "version": "KqlItem/1.0",
//         "query": "Resources\n| where type == 'microsoft.compute/virtualmachines'\n| extend\n    JoinID = toupper(id),\n    OSName = tostring(properties.osProfile.computerName),\n    OSType = tostring(properties.storageProfile.osDisk.osType)\n| join kind=leftouter(\n    Resources\n    | where ( type == 'microsoft.compute/virtualmachines/extensions') and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId\n| union (Resources\n| where type == 'microsoft.hybridcompute/machines'\n| extend\n    JoinID = toupper(id),\n    OSName = tostring(properties.osProfile.computerName),\n    OSType = tostring(properties.osType)\n| join kind=leftouter(\n    Resources\n    | where type == 'microsoft.hybridcompute/machines/extensions' and name in ('AzureMonitorLinuxAgent', 'AzureMonitorWindowsAgent')\n    | extend\n        VMId = toupper(substring(id, 0, indexof(id, '/extensions'))),\n        ExtensionName = name\n) on $left.JoinID == $right.VMId)\n| summarize count() by ExtensionName",
//         "size": 1,
//         "title": "Agent Install Status",
//         "queryType": 1,
//         "resourceType": "microsoft.resources/tenants",
//         "crossComponentResources": [
//           "value::tenant"
//         ],
//         "visualization": "piechart",
//         "gridSettings": {
//           "formatters": [
//             {
//               "columnMatch": "ExtensionName",
//               "formatter": 18,
//               "formatOptions": {
//                 "linkTarget": "CellDetails",
//                 "linkIsContextBlade": true,
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "==",
//                     "thresholdValue": "AzureMonitorLinuxAgent",
//                     "representation": "success",
//                     "text": "Linux Agent"
//                   },
//                   {
//                     "operator": "==",
//                     "thresholdValue": "AzureMonitorWindowsAgent",
//                     "representation": "success",
//                     "text": "Windows Agent"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": "stopped",
//                     "text": "No Agent"
//                   }
//                 ],
//                 "customColumnWidthSetting": "20ch"
//               }
//             }
//           ],
//           "filter": true
//         },
//         "chartSettings": {
//           "seriesLabelSettings": [
//             {
//               "seriesName": "",
//               "label": "No Agent",
//               "color": "red"
//             }
//           ]
//         }
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "agentmgmt"
//       },
//       "customWidth": "50",
//       "name": "query - agent install status - Copy",
//       "styleSettings": {
//         "showBorder": true
//       }
//     },
//     {
//       "type": 3,
//       "content": {
//         "version": "KqlItem/1.0",
//         "query": "Heartbeat | where Category == \"Azure Monitor Agent\"\n| summarize arg_max(TimeGenerated, *) by Computer\n| project  Computer,LastHeartbeat=TimeGenerated, ['SecondsAgo']=datetime_diff('second',now(),TimeGenerated)\n| sort by SecondsAgo asc",
//         "size": 4,
//         "title": "Last Heartbeat (24 hours)",
//         "timeContext": {
//           "durationMs": 86400000
//         },
//         "queryType": 0,
//         "resourceType": "microsoft.operationalinsights/workspaces",
//         "crossComponentResources": [
//           "{Workspace}"
//         ],
//         "gridSettings": {
//           "formatters": [
//             {
//               "columnMatch": "SecondsAgo",
//               "formatter": 18,
//               "formatOptions": {
//                 "thresholdsOptions": "icons",
//                 "thresholdsGrid": [
//                   {
//                     "operator": "<=",
//                     "thresholdValue": "600",
//                     "representation": "success",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": ">",
//                     "thresholdValue": "600",
//                     "representation": "2",
//                     "text": "{0}{1}"
//                   },
//                   {
//                     "operator": "Default",
//                     "thresholdValue": null,
//                     "representation": null,
//                     "text": "{0}{1}"
//                   }
//                 ]
//               }
//             }
//           ],
//           "filter": true
//         }
//       },
//       "conditionalVisibility": {
//         "parameterName": "tabSelection",
//         "comparison": "isEqualTo",
//         "value": "agentmgmt"
//       },
//       "customWidth": "50",
//       "name": "query - 16",
//       "styleSettings": {
//         "showBorder": true
//       }
//     }
//   ],
//   "fallbackResourceIds": [
//     "/subscriptions/6c64f9ed-88d2-4598-8de6-7a9527dc16ca/resourcegroups/monstar-rg/providers/microsoft.operationalinsights/workspaces/monstar-la"
//   ],
//   "$schema": "https://github.com/Microsoft/Application-Insights-Workbooks/blob/master/schema/workbook.json"
// }
// '''
// var wbConfig2='"/subscriptions/${subscriptionId}/resourceGroups/${rg}/providers/Microsoft.OperationalInsights/workspaces/${logAnalyticsWorkspaceName}"]}'
// //var wbConfig3='''
// //'''
// // var wbConfig='${wbConfig1}${wbConfig2}${wbConfig3}'
// var wbConfig='${wb}${wbConfig2}'

resource workbook 'Microsoft.Insights/workbooks@2022-04-01' = {
  location: location
  tags: {
    '${solutionTag}': 'mainworkbook'
    '${solutionTag}-Version': solutionVersion
  }
  kind: 'shared'
  name: guid('monstar')
  properties:{
    displayName: 'Azure Monitor Starter Packs'
    serializedData: wbConfig
    category: 'workbook'
    sourceId: lawresourceid
  }
}
