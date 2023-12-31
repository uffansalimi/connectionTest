resource vm1 'Microsoft.Network/connectionMonitors@2022-07-01' = {
  name: 'myConnectionTest'
  location: 'ukSouth' // Replace with your desired location
  properties: {
    source: {
      resourceId: resourceId('') // Replace with your specific resource IDs
      port: 80
    }
    destinations: [
      {
        address: 'www.google.co.uk'
        port: 80
      }
      {
        address: 'www.bbc.co.uk'
        port: 80
      }
      {
        address: 'www.amazon.co.uk'
        port: 80
      }
    ]
    probes: [
      {
        name: 'probe1'
        intervalInSeconds: 60
        numberOfProbes: 3
        request: {
          method: 'GET'
          path: '/'
        }
      }
    ]
    thresholds: {
      consecutiveProbeFailures: 3
      maxFailures: 2
    }
  }
}
 
