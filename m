Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11522F26
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 08:53:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bVlwHi3Jy1U82Gs7BtVEeVlDOixuwYnQCFXEpV2C7b+PQmAoSddN+ym/3Ho6Qef/GC0bCZoHtW7WZN5b0ZwwRfBDXX1MwC/7zp5SDzVBf7jwgZca6wfqiXZf44ZdblwHFNeAEpSIzoDn2SvISMtZJ7s1Lh6h93Oy21uH1RqkAnfgGll22hF0GI9pV1tJeiGS8h9W+APSrZCb5UV2k+jcuQhNVmTeoBJq0RmHQKmwy1X70+VvCga5FX/Nzko4WAwvN+/PXluaJCLnUbcct1YDym8Y56iyEAUwTjqMgqaWsVJlmiz5pGjA4roGqS21O6/F6T/RtbETZU6sOcDaC+cINA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7CN3fj4/1mV4XEWmcp1h5L8bNiwClfT29vFBlY/VHM=;
 b=aRSrDYqzp0FTRjKAhjchvHLGFSt52JHgzleL9bkhwP+G/L+alOWtZ3oaWiTn3r+yi4KVoNoboNr5dZZ9C0nGanJVPygUAOaviWzWmSBdOnbqTRJZW46XWGqcC0w/r/w2YLw54hYYrliB8AqjU4109NZ80eZzUXzrZK6TR4ZeoIPVftVFJJOUGZOTQfxLxrTojlSKuGvs3F6ExkyJNw5pohUrL6Q2qUgXr0OBp+ch6NEXo/+XLc25kncGxW+7Opx/OMLe0lpucy7AQ4lWqlYHn1iH4vg6JMiZQYqymUvRl/Pgi5yTcKFQCsBZhBs6fbLfTKWdjCp7jCKchGoMML7pKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7CN3fj4/1mV4XEWmcp1h5L8bNiwClfT29vFBlY/VHM=;
 b=8PQm8+YpZ/2XKU0sCjzvhCbtn4ArB1AWVSqDr0aYQOk+7uERXT3xZa70HIsnMX8VuxmntpiaGviguCCYugpOukqz2jB92G4Gwsnci1btovmDQqLgP0fHUyyVmVidQjQ/QfYkRCumUrSI8sJbwh/7bouBB1pEd8I5jG8wFGiGz/A=
Received: from AS8PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:20b:127::19)
 by DB8PR08MB5114.eurprd08.prod.outlook.com (2603:10a6:10:e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 08:53:09 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::73) by AS8PR04CA0134.outlook.office365.com
 (2603:10a6:20b:127::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Tue, 16 Aug 2022 08:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 08:53:08 +0000
Received: ("Tessian outbound 73dd6a25223d:v123"); Tue, 16 Aug 2022 08:53:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75506156298b1ee8
X-CR-MTA-TID: 64aa7808
Received: from 4c2fed0f9752.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 85B62EC9-EF97-438F-8B36-789678B34C71.1;
	Tue, 16 Aug 2022 08:53:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c2fed0f9752.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Aug 2022 08:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYe1RltxzCxgveqpkHoPeDjesrtw+Zt17en8OVSBx/YsIdGnSMko9VS95bY2NEt77fklebhgP0RjtSwGpn0fxdRzAfkHYsimeSo2SdhlhG9rSD085Af2v0TONL4mQQQbf9D+a4toAw/1WVc4U6ZSqlr9Vy67W2NpJi/hHA3NVyUbQG2ojQo+z+YxdZCGWA8K3TZNoh/w6KJVqSaRU01Qev3eqViwrCnezzvIjx5utpwEsVtaP5nM2z5TpVY4Po11vpuSnuXJMYTME/QFgw5+EBZo71I+yTH5wMeW9DzekoH35XFmAf/JW1GWcfbMlzcvYJLab8sxbKDCrEQi4ReJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7CN3fj4/1mV4XEWmcp1h5L8bNiwClfT29vFBlY/VHM=;
 b=DQKRkW+M7USTy1EI3NhSkSrtVc7AbjbJPfDtXICTFqRlnxra2BfwmamvfYqq46AjY0sFIs9fr5fDPH5SGofUxWuW7NFKuakELU+MprtbOIA9P3qE4jwnfbkeaCYpwlM2Ghiv2ubcCvcFpaeqG6lrd81sIsQZS1OLual3hzYoMWXwnR5UlcoiCJ0qSDBV5cmtNQupO8WIs18iawawFFVP34fcX+wC3emPIsS0istblA1EHTUrcJNJIIWHLHLvelx0zUdt5tAz9fHjXQHzIMKsWmQ1CTFgbP0KM0AJZ3fS8uo7pn7R865gJ+x5u60mtsDMtC2Kt2sH8Q28dWZXQ2o4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7CN3fj4/1mV4XEWmcp1h5L8bNiwClfT29vFBlY/VHM=;
 b=8PQm8+YpZ/2XKU0sCjzvhCbtn4ArB1AWVSqDr0aYQOk+7uERXT3xZa70HIsnMX8VuxmntpiaGviguCCYugpOukqz2jB92G4Gwsnci1btovmDQqLgP0fHUyyVmVidQjQ/QfYkRCumUrSI8sJbwh/7bouBB1pEd8I5jG8wFGiGz/A=
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15)
 by DBBPR08MB4266.eurprd08.prod.outlook.com (2603:10a6:10:d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 08:52:58 +0000
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494]) by DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494%3]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 08:52:58 +0000
From: Andre Simoes Dias Vieira <Andre.SimoesDiasVieira@arm.com>
To: Nathan Chancellor <nathan@kernel.org>, "ci_notify@linaro.org"
	<ci_notify@linaro.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Topic: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Index: AQHYsPY2ELhEWGgbykyWGsnvroZHD62wsTyAgACH8sE=
Date: Tue, 16 Aug 2022 08:52:58 +0000
Message-ID:
 <DB9PR08MB655357C80DA0779B8D3DA863886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
References: <1465164958.6648.1660602445528@jenkins.jenkins>
 <Yvro06Uid0t0Ou1M@dev-arch.thelio-3990X>
In-Reply-To: <Yvro06Uid0t0Ou1M@dev-arch.thelio-3990X>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 756027e6-6c5b-40ec-1f04-08da7f64bdeb
x-ms-traffictypediagnostic:
	DBBPR08MB4266:EE_|VE1EUR03FT055:EE_|DB8PR08MB5114:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kL0PxX4YamvqDEcC94uJMaoFKVid71qnoAikTkfLGOa6RHBpsddIzCCg16x4jBhVvfKYdrvDXlCOCQ4B18Ui9P3RT485mP+2bzubJVFSyJKowHJJywUmvvVjeUbrG+erslPFq5g8b5PwzxbPqYXK55a+A0EB5Jhrr37JSDdfoLbPZPqb6W6A9hCfiAmBRpsSdj2SZXm6K9FLsn8tRcaXDZZ2DWieaR47KCNcJUgTPNtodgToeuSO1spa1UXepvSpZUOBKdV3DJlYTWHXL3jq1x1x639YfZIPcxNVqlNr7PCkuFXkMMmjMNnpAtrOg7zZY40VA6aUV2outG0PaRhw6rzIDXmgHPihjak8ODWdMZabjpU5ZbL0TxkN6DdGWY4v90ft3bxxhlo7LQM4FdeZywm3W2bADtqy6wbjy3O3GyXKST3N7cWp80Nwf3sK/lN57Fewp9iDJO/KpBFdIY8BSdmIf74Wd6AOrIAHrcHUgcgqd0ByrCCElJijtXON/gW1Ovyevx9RzJFfgzWmTrRM/KfpWAdGPbHhrcs6GiagpFhonlKvrkc+2+gXqZ5fTkpIpWWAbkO5c0AchQCT4D30QXMCmc5f8ePpx7r0yzfsVONxWujFTJDeYQnA4A58sK2RZbTSRaCyA4xcYF6D12RhH0USENbjgwAIU2GSVBSIxM9T2dzlTHkwmM9TriKmoLAyr+Xv4FuLpVWQ45wmikB2ohvash3b23a29EgWyqRykkEx9+ILEAQGfupMdonU9HakqjUKz/Wacpti1a9c44RHDdKHs3ajGGOILfFvxlvCdGOvVwC1JD+lU6Nl+rmNQ/CnjOC0lCikaQmTGvVAUofMZLP6MYK2CQovFRGmBoOH1EY/OoTfFmS8aPvsU3G9MVdY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6553.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(26005)(478600001)(966005)(7696005)(53546011)(6506007)(9686003)(8676002)(66556008)(64756008)(41300700001)(66446008)(66476007)(55016003)(2906002)(71200400001)(110136005)(86362001)(316002)(38070700005)(38100700002)(33656002)(186003)(5660300002)(52536014)(76116006)(4326008)(91956017)(8936002)(122000001)(66946007)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4266
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7728471f-6dc5-4e45-0a48-08da7f64b802
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQez4qvjTXaLd8I/Oy2u9ha7z2TsheVKOhqNrQEFkVXn8wanxmUHFYiZSA0msEOtFqyn49YFkqpR/F6U/O7e9ASQO1ePs4+ImxqcFD+SLaDxLMzHHXyBWQSVeq9+UDtHhb4+AosQ3kSiOMgXmEdt+/f+IeJWyL6BYv4P/Pwta7bhkIULRIdA3EvKHh4czQ7hzQJjGZzXensqVSx+4q3aDRDyuek0zlIuQAzJPsySEY4oTDzF2jmKHaS7KYhMP92pwOK6kMdNxWeRU0ELzImjEYeFmeIZUNIGdAwKJcM1htiyPMUkAx11sgjO5/4L8RHxZCztiVCSfIHR18TPyzu5eUt2VXSTo8gf1MtpQu8WCWiqpNUBH7HtKDg5HiX1XLbS9xQyEdEDSjN5q+5cEXsbG/iWIfIdpamNo1UTVYPVu9Wl1JvZ4P4Fi0vTGP8LNj5ebgzhmZiFDYb6j+Wov4QqISgCM5WpMUGnlVmCW5J/w8vu0q+R1+Vzkn17XdFHPsmUPzy7+uOXkFC0iqqfeZKH776jderXANSuV7oTVPd6JPKGtcDqRU9v8Vu3GNJOtbfdzAZe5y1JFqDgoPY4FhOvo/DS34YA+oj8co0d0aO/iV8tfptJafNZ4XQ4zEo5UGOEh4SxDKkj+b6SZUVc7EIwm6Pa0NFr6W8DC3oaeqWJnXBHPPjamwi3VkJVW0y7SKrsTs2rI0X67YIMwN5QzRWNbMObwZygoRcVGNNW0Rr4fZxQLqOqAcHopzFs8EXAusPIdZNMuMOyl8vir8dcE9212YT9fvZvdV2VCSvFmdI7OZIx6kVvAwA7hvKbx6Ii78OdXZqh2EiH1jnOdew2HqN1oGgcCM+WgKMeqH7ioJ+RjM0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(40470700004)(46966006)(55016003)(26005)(478600001)(2906002)(36860700001)(53546011)(6506007)(7696005)(40460700003)(8676002)(41300700001)(9686003)(82310400005)(966005)(40480700001)(110136005)(316002)(33656002)(81166007)(82740400003)(356005)(86362001)(47076005)(186003)(336012)(52536014)(5660300002)(4326008)(8936002)(70206006)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 08:53:08.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 756027e6-6c5b-40ec-1f04-08da7f64bdeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5114

Hi Nathan,

I'll have a look thanks!

Kind Regards,
Andre

________________________________________
From: Nathan Chancellor <nathan@kernel.org>
Sent: Tuesday, August 16, 2022 1:46 AM
To: ci_notify@linaro.org
Cc: Andre Simoes Dias Vieira; llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search fr=
om ZExt + PHI

On Mon, Aug 15, 2022 at 10:27:24PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [TypePromotion] Search from ZExt + P=
HI:
> commit 164067918725d1ee8875e38213b6aee9be13383e
> Author: Andre Vieira <andre.simoesdiasvieira@arm.com>
>
>     [TypePromotion] Search from ZExt + PHI
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 6329
> # First few build errors in logs:
> # 00:12:33 ld.lld: error: undefined symbol: __aeabi_uldivmod
> # 00:12:33 make: *** [Makefile:1208: vmlinux] Error 1

I noticed this towards the end of last week too:

https://github.com/ClangBuiltLinux/linux/issues/1688

I added some reduced reproducers to that thread. As I note in the
original post of that issue, I am not sure if this error is a standalone
problem or one that comes from another problem we are actively dealing
with:

https://github.com/ClangBuiltLinux/linux/issues/1666
https://github.com/llvm/llvm-project/issues/56153

Cheers,
Nathan
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
