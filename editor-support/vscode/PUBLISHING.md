# Publishing Flowa Extension to VS Code Marketplace

Follow these steps to publish your extension to the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/).

## 1. Prerequisites

- **Microsoft Account**: You need a Microsoft account to sign in.
- **Azure DevOps Organization**: Required to create a Personal Access Token (PAT).

## 2. Create a Publisher

1. Go to the [Marketplace Management Page](https://marketplace.visualstudio.com/manage).
2. Sign in with your Microsoft account.
3. Click **Create Publisher** on the left.
4. Enter a verified **Publisher ID** (e.g., `senapati484`).
   - *Note*: This ID must match the `publisher` field in your `package.json`.

## 3. Configure package.json

Open `package.json` and ensure the `publisher` field matches the ID you just created:

```json
{
  "name": "flowa",
  "displayName": "Flowa Language Support",
  "publisher": "YOUR_PUBLISHER_ID", 
  ...
}
```

## 4. Get a Personal Access Token (PAT)

1. Go to [Azure DevOps](https://dev.azure.com/).
2. Go to **User Settings** (top right) -> **Personal Access Tokens**.
3. Click **New Token**.
4. Set the following:
   - **Name**: "VS Code Marketplace"
   - **Organization**: "All accessible organizations"
   - **Scopes**: Select **Custom defined**, then click **Show all scopes**, finding **Marketplace** and selecting **Acquire** and **Manage**.
5. Copy the generated token immediately.

## 5. Publish via CLI

Open your terminal in `editor-support/vscode` and run:

```bash
# 1. Login with your Publisher ID (enter PAT when prompted)
npx @vscode/vsce login YOUR_PUBLISHER_ID

# 2. Publish the extension
npx @vscode/vsce publish 
```

## 6. Verify

Within a few minutes, your extension will be live at:
`https://marketplace.visualstudio.com/items?itemName=YOUR_PUBLISHER_ID.flowa`
