// This is the main query rule template for query rules that are created by the starter packs
param alertRuleName string
param alertRuleDisplayName string
param alertRuleDescription string
param scope string // log analytics workspace resource id
param actionGroupResourceId string
param alertRuleSeverity int
param location string
param windowSize string = 'PT15M'
param evaluationFrequency string = 'PT15M'
param autoMitigate bool = false
param query string
//param starterPackName string
param packtag string
param solutionTag string
param solutionVersion string
param threshold int
param metricMeasureColumn string

@allowed([
  'GreaterThan'
  'GreaterThanOrEqual'
  'LessThan'
  'LessThanOrEqual'
  'Equal'
  'NotEqual'
])
param operator string

resource rule 'Microsoft.Insights/scheduledQueryRules@2023-03-15-preview' = {
  location: location
  name: alertRuleName
  tags: {
    '${solutionTag}': packtag
    '${solutionTag}-Version': solutionVersion
  }
  properties: {
    description: alertRuleDescription
    ruleResolveConfiguration: {
      
    }
    displayName: alertRuleDisplayName
    enabled: true
    scopes: [
      scope
    ]
    targetResourceTypes: [
      'Microsoft.OperationalInsights/workspaces'
    ]
    windowSize: windowSize
    evaluationFrequency: evaluationFrequency
    severity: alertRuleSeverity
    criteria: {
      allOf: [
          {
              query: query
              timeAggregation: 'Average'
              metricMeasureColumn: metricMeasureColumn
              dimensions: [
                {
                  name: 'Computer'
                  operator: 'Include'
                  values: [
                    '*'
                  ]
                }
              ]
              resourceIdColumn: '_ResourceId'
              operator: operator
              threshold: threshold
              failingPeriods: {
                  numberOfEvaluationPeriods: 1
                  minFailingPeriodsToAlert: 1
              }
          }
      ]
    }
    autoMitigate: autoMitigate
    actions: {
        actionGroups: [
          actionGroupResourceId
        ]
        customProperties: {

        }
    }
  }
}
