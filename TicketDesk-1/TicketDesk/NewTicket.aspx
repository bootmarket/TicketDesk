﻿<%@ Page Language="C#" Theme="TicketDeskTheme" Title="Submit New Ticket" MasterPageFile="~/TicketDeskMain.Master"
    AutoEventWireup="true" CodeBehind="NewTicket.aspx.cs" Inherits="TicketDesk.NewTicket" %>

<%@ Register Src="Controls/TicketForm.ascx" TagName="TicketForm" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <%  // TicketDesk - Attribution notice
        // Contributor(s):
        //
        //      Stephen Redd (stephen@reddnet.net, http://www.reddnet.net)
        //
        // This file is distributed under the terms of the Microsoft Public 
        // License (Ms-PL). See http://www.codeplex.com/TicketDesk/Project/License.aspx
        // for the complete terms of use. 
        //
        // For any distribution that contains code from this file, this notice of 
        // attribution must remain intact, and a copy of the license must be 
        // provided to the recipient.
    %>
    <link rel="Stylesheet" type="text/css" media="all" href="<%= Page.ResolveUrl(@"~/Scripts/markitup/markitup/skins/markdown/style.css") %>" />
    <link rel="Stylesheet" type="text/css" media="all" href="<%= Page.ResolveUrl(@"~/Scripts/markitup/markitup/sets/markdown/style.css") %>" />
    
    <script type="text/javascript" src="<%= Page.ResolveUrl(@"~/Scripts/jquery-1.3.2.js") %>"></script>

    <script type="text/javascript" src="<%= Page.ResolveUrl(@"~/Scripts/markitup/markitup/jquery.markitup.js") %>"></script>

    <script type="text/javascript" src="<%= Page.ResolveUrl(@"~/Scripts/markitup/markitup/sets/markdown/set.js") %>"></script>

    <script type="text/javascript">

        mySettings.previewParserPath = '<%= Page.ResolveUrl(@"~/Services/MarkdownPreview.ashx")%>';

        $(document).ready(function() { $("#details").markItUp(mySettings); })
    
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:ScriptManagerProxy ID="AjaxScriptManagerProxy" runat="server" />
    <div class="Block" style="margin: 30px;">
        <div class="BlockHeader" style="font-size: larger; font-weight: bold; text-align: center;">
            Create a new ticket
        </div>
        <div style="padding: 15px" class="Form">
            <uc1:TicketForm ID="NewTicketForm" runat="server" />

            <script type="text/javascript">
                // Work around browser behavior of "auto-submitting" simple forms
                var frm = document.getElementById("aspnetForm");
                if (frm) {
                    frm.onsubmit = function() { return false; };
                }
            </script>

            <input type="submit" style="display: none;" />
            <table>
                <tbody>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:Button ID="CreateTicketButton" runat="server" Text="Create Ticket" UseSubmitBehavior="false"
                                OnClick="CreateTicketButton_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:ValidationSummary runat="server" />
                            <asp:Label ID="MessageLabel" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
