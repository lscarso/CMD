## Script api
### Step-by-Step Process
#< Log into the SOTI MobiControl Console.

Navigate to:

Global Settings > Services > API Client
Click on Add API Client.

In the Add API Client panel:

Enter a Name for the new API client.
Click Generate.
The system will automatically generate:

Client ID
Client Secret

⚠️ Important: Copy and store the Client Secret immediately. You won’t be able to retrieve it again after closing the dialog.

The Grant Type is automatically set to Password and cannot be changed.

Click OK to finalize.
>#

---------------------------------------------------------

let
    // Step 1: Request Access Token
    TokenResponse = Json.Document(Web.Contents("https://yourdomain/MobiControl/token", [
        Content = Text.ToBinary("grant_type=password&username=YOUR_USERNAME&password=YOUR_PASSWORD&client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET"),
        Headers = [
            #"Content-Type" = "application/x-www-form-urlencoded"
        ]
    ])),
    AccessToken = TokenResponse[access_token],

    // Step 2: Use Token to Call API
    Source = Json.Document(Web.Contents("https://yourdomain/MobiControl/api/devices", [
        Headers = [
            #"Authorization" = "Bearer " & AccessToken,
            #"Accept" = "application/json"
        ]
    ])),

    // Step 3: Transform JSON to Table
    Devices = Source[devices],
    Table = Table.FromList(Devices, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    Expanded = Table.ExpandRecordColumn(Table, "Column1", {"id", "name", "batteryLevel", "carrier", "osVersion"}, {"ID", "Name", "Battery", "Carrier", "OS"})
in
    Expanded
