Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30089.outbound.protection.outlook.com [40.107.3.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8948EBB
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 10:21:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RpQkEgo2pUi+o2MCiNU4aHSnAE4tQKIJAQTTqqkjIdTaAXTV7UQrfL4JZBeYZSmGQAx1CKVpy/4axs5S8OljBNnh97o4O4NahB346fbtHL11z6OGTVeVPC3AoTyPzOIJu48IR/jdtnAsON8NM8S8Hl8ExnAaVhr50axxjkUk1Idl8MlKhuUselpiJGYPUlSfGU5zSmkJ8lsc46Fy93zw6W5Nx2WcA+ufj2tGRLYCIF1CT42o9vrzxPXC4nDkoBJjvPImkUOo893+iYmmGgW25ywYglRn9zrBn8ZuMDufRoqZgRpSKGD5uXtzz2ttdpxH+VzxJ9OU91XlVx3j54exHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyndOiTrC7XhBKLufTxChOMfEwP2vXUtHQffLSnJf/Q=;
 b=Zvzj2FsvM58wXBMGwl/JsvVyjOyb0H5hYW3SL3PzB44ZJftNWbHS1ffA/v3iBqtSj88wvtKzRuQ9RQaOMxKc/NlQnU+4deKLyxBxYaLbVZRMJITpPwkcNtgS4/AAIkXQN0SjPVkHTtPhiXbht9Auk3Abv3TBc/ugCV9kGrKzt3nOwLMY9GPBh2AU7WzcmIxhIKhHKKmTzvf2v/EgH0O6pBAdyv4hCVhuKQJF7j9n/XAGjdau9zXbBYJF8+MxjfE38bL37S6UIbo7DYWOsxcBX+hFIHD7qtHTpcF02Cd3rWXn/u+mGLlJywCIDJeroOhRF4gmCe9Y2iP4sxBWgNmL8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyndOiTrC7XhBKLufTxChOMfEwP2vXUtHQffLSnJf/Q=;
 b=jUfIs16KcGTKUmvhAH/NAlT0YsefmR6VuTUaNKyRiq2muvlp9tk9MflMHcbFNOYJ/LyeN4RaGQDlESYeXjahpWBvikVwCP27FRe1gGq1iwhnspL8V/S7sFEU2u/MW9zzsIHSjCB5pIXeIkFaDbHl5FJcEIvOtj8ZVOsxMtfaXBs=
Received: from AS8PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::19)
 by VI1PR0801MB1806.eurprd08.prod.outlook.com (2603:10a6:800:5b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 10:21:22 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::30) by AS8PR04CA0194.outlook.office365.com
 (2603:10a6:20b:2f3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 10:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 10:21:20 +0000
Received: ("Tessian outbound 9336577968ca:v121"); Thu, 30 Jun 2022 10:21:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72e15c1f7ea81537
X-CR-MTA-TID: 64aa7808
Received: from a12e51a1c011.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9603262A-4AC5-41C7-A8CB-3B232C682FEA.1;
	Thu, 30 Jun 2022 10:21:13 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a12e51a1c011.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jun 2022 10:21:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT/GOCjIHTSDM8BTi82HvJnRhyn3ZsRfcirAK74/x2u7H4OGM9rujzxs+KTYcOI0xBNBKxDLZWINMJy6uYCeyUW0uqxljbK1MtXPqLT/HCNvKq3q1s49Sbymg/Of/civbXz2Tw6/mcbMiLwLv7y7UOL0gnc3wvUvi57HxT7lGQd6HfigmvAzpYt+5f9q0jZsej+K5QkagdI6FRyYlS+g2cFa/AiexifZcoKXntHdBQDCtrRaU54ewYRayx/ZReHyUtbeVHFt4nF2g7j5SS7Nktmc1xWAnGgmpS+3viir5OEO+uLTYQAclxM9xzyOxydsWe0psHVzJtx/98eQeosZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyndOiTrC7XhBKLufTxChOMfEwP2vXUtHQffLSnJf/Q=;
 b=cwRdasl/gms/xgQnG4XsONY4Lh2EHGfKH2W1mPenL5peMITAODstCLoFI5Wq9F7KJJ8bASwzyFz4A7975pmXJgioLjVeMp9bFSMufggj0KJw/7xgyRr7DACc1MlySh59MoP1NOdnMizbTEZxjzRTWTEEyBPk+5/OKkxWZo3SG2ILeCQbw+3BK7fyPNIVn41CebRYk9h9iI7wdDWVyVlXtPjfRTesxVnUjqMoOEwqKZ7vH6TeNNlwUh0u9n5gY+2JQYuMPf6lXiVdUglonQccho/2kl+pvWJrjS/INxjUQqE4M2toSAN8mjkNZTbcTa5mwhQyMImhWEiIYCrNbYkbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyndOiTrC7XhBKLufTxChOMfEwP2vXUtHQffLSnJf/Q=;
 b=jUfIs16KcGTKUmvhAH/NAlT0YsefmR6VuTUaNKyRiq2muvlp9tk9MflMHcbFNOYJ/LyeN4RaGQDlESYeXjahpWBvikVwCP27FRe1gGq1iwhnspL8V/S7sFEU2u/MW9zzsIHSjCB5pIXeIkFaDbHl5FJcEIvOtj8ZVOsxMtfaXBs=
Received: from DB6PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:6:2a::28) by
 DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 30 Jun 2022 10:21:11 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::da) by DB6PR07CA0066.outlook.office365.com
 (2603:10a6:6:2a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 10:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 10:21:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 10:21:04 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9 via Frontend
 Transport; Thu, 30 Jun 2022 10:21:04 +0000
Date: Thu, 30 Jun 2022 11:21:03 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <nd@arm.com>, Will Deacon
	<will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v1 1/2] arm64: vdso32: add ARM.exidx* sections
Message-ID: <20220630102103.GA42260@e124191.cambridge.arm.com>
References: <20220628151307.35561-1-joey.gouly@arm.com>
 <20220628151307.35561-2-joey.gouly@arm.com>
 <YryxouOYOJLM+DDK@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YryxouOYOJLM+DDK@dev-arch.thelio-3990X>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 703d58d5-aeca-4a58-e71d-08da5a8246de
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7583:EE_|VE1EUR03FT058:EE_|VI1PR0801MB1806:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tT2ALsdG1C7+sUwKUfcxaTKEe8ZR1xL7zXshnqUuiRYMtMu83NEVFNL+C5MFe8053uBWAxt1n1C9uycHqmlWrpxfArXUhBOudsWSVYC0Wsw/vlzpdU8zw9b8zsQWxBLQGtXyi2VUOnO2lEC4TQAW66glRPyWYyLlCLCsA15UGzCiNxhyRUVOwWbS6CySwEXVhwdA6qByZ1Re5flf7ed6CW3P54W9nGvTEnHUERfrQafdhx53SSOuU1ltZNxIWjzGd8JC9+WzPOo8QZHnIf1KEsg1fbcOtFSbpf12n7DgrDi7J6RvoFnYxyJPSE/xyIZepd/xbJ6Tal3yw+EPf9aSl950zNDVAvVfuzgym2yWg2vIa3IzdY4xmaVODND0t7kbzDX1fpvLFcC/HD0ueh0x3WcgRH1wBAqIpR3EY2Ab/cs6nO0fgaIT/JqdRv4jMCP81vgv8A8PkJycHr+B4Hym6ol8GuA4jBreLf1Af/oEVO9ebUqaaQ81Q3EoGgbdu8R/mdM+HTXQ14SlJ7aO7LB1uybjWk1vNIgjJYfBgESp+2o/yvRumMcVhg5Jn+Wp1JqQ6xAJxs3iSYXYJoQPNfjWmdZnBcM/m/6QrZaqhSTs+IMtmdG9xur2qCv5Jk8TbjvCyw/dKU8JhNJoINonaT1n+1KMKrJWPRNYmNB6Ffx+13OiFOgORD+6LFvEkd3GVMOfkxisWOp6GiJmmP/2FYC/tK3zlmXbn5EHZFqRPBrZdNjjSPGHYe0ON7f7tYukDUvZJ1Mc5t262qtWUnywDnZFkv/okLkyNQ8IR7RQzlfjNL7y0vFlwyVt2gCUGnXJMZNq1j6EPpPcgm9YwciAllcb/PMY3RphGsvrKq5fRlk9IvQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(40470700004)(46966006)(44832011)(33656002)(5660300002)(8936002)(54906003)(40460700003)(86362001)(70586007)(70206006)(8676002)(478600001)(26005)(41300700001)(83380400001)(40480700001)(55016003)(186003)(4326008)(1076003)(47076005)(2906002)(82740400003)(336012)(81166007)(356005)(7696005)(36860700001)(426003)(82310400005)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2516b547-351e-4c6d-3080-08da5a82411f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	38UtIwPfBUvMXZzY2WtOAfoJ0GS26x3mlVGzuIZaP9Is8jW/OI+5/Sf8q+/IvupowGtptBKg5HoxPmFRzym/Et0IU09DjExpavyZHKDBjeOJaEZgngCVgNYn3onTVWrSj64X7JkwhGV1DNZHOJPGbRUDzUVdkUhueMXBqjoTiSoGaeVhv2y3aPdF7KT1WZPVHFG3aGr83Iid+7NIGyxLiPjWv34t3RiG7t1nbrYEPTKXhFUkzogeyncPPD6f4qQvrM4ocZp2piBkuKQVuWjdU5KqjqOAd7BBRkEpweng0+BV6pwKxrBoBn7lNPRTopCiyvQ99qOMaxYJbnzDDXMFsmczChglwEtaDnocvLpHvYLCyiPT8wNb7jCAr+AdZmwB90b+wgzm9StD8zuRv56VNTVBSxXvFhiK7gmlSzt3goWzTW4olHeq9uxPbQRon1CG2SUedUmbQj4JHOYZkdVz4YARF/yp8LOPo3mhexnFsKj0HVAHYhYK+Uvh5CAiHi8aqFb1R0O0J4DLZUQ2ZeDJvm69Qg4d2LcvWstJarQ6hr1lVADebfDdrDhkx2u+m/vSIMlnbdkWY/WKYd15Vu8JR2wKy2BH5fo1Sqz6bQ5NJi3qaLSPP2MoiZb59RJP0g35kI3GEta4xiUuqepj13Oz/YFJ+mONUXtBeJn/9LCPyUqzyPdkkdlNNBT0qfu0f/qUuqEuM+o8ZKjLBGweREbazXx/JCJ02mMRL/19eyW/qRkOeG6kV/1MAjlxEnTtzmTYYz0z04plt9ItXpLUDsHM+nfUX2R9NLvyU700LIchw4XJtsiGHYcN/XFQvt/e6wyI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(4326008)(81166007)(82740400003)(40460700003)(83380400001)(316002)(82310400005)(8676002)(40480700001)(55016003)(70586007)(70206006)(47076005)(36860700001)(2906002)(5660300002)(186003)(1076003)(41300700001)(8936002)(426003)(86362001)(6862004)(336012)(33656002)(54906003)(26005)(44832011)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 10:21:20.6514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703d58d5-aeca-4a58-e71d-08da5a8246de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1806

Hi Nathan,

On Wed, Jun 29, 2022 at 01:10:10PM -0700, Nathan Chancellor wrote:
> Hi Joey,
> 
> On Tue, Jun 28, 2022 at 04:13:06PM +0100, Joey Gouly wrote:
> > These show up when building with clang+lld.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> > ---
> >  arch/arm64/kernel/vdso32/vdso.lds.S | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> > index 120cf422036f..e2f8ced571d6 100644
> > --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> > +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> > @@ -60,6 +60,7 @@ SECTIONS
> >  	}
> >  
> >  	ELF_DETAILS
> > +	.ARM.exidx : { *(.ARM.exidx*) }
> >  	.ARM.attributes 0 : { *(.ARM.attributes) }
> >  
> >  	/DISCARD/	: {
> > -- 
> > 2.17.1
> > 
> 
> This patch is now in -next as commit 5c4fb60816ea ("arm64: vdso32: add
> ARM.exidx* sections"), which causes the following errors with ld.lld 11:

Sorry for the breakage.

> 
>   ld.lld: error: could not allocate headers
>   ld.lld: error: unable to place section .text at file offset [0x2A0, 0xBB1]; check your linker script for overflows
>   ld.lld: error: unable to place section .comment at file offset [0xBB2, 0xC8A]; check your linker script for overflows
>   ld.lld: error: unable to place section .symtab at file offset [0xC8C, 0xE0B]; check your linker script for overflows
>   ld.lld: error: unable to place section .strtab at file offset [0xE0C, 0xF1C]; check your linker script for overflows
>   ld.lld: error: unable to place section .shstrtab at file offset [0xF1D, 0xFAA]; check your linker script for overflows
>   ld.lld: error: section .ARM.exidx file range overlaps with .hash
>   >>> .ARM.exidx range is [0x90, 0xCF]
>   >>> .hash range is [0xB4, 0xE3]
> 
>   ld.lld: error: section .hash file range overlaps with .ARM.attributes
>   >>> .hash range is [0xB4, 0xE3]
>   >>> .ARM.attributes range is [0xD0, 0x10B]
> 
>   ld.lld: error: section .ARM.attributes file range overlaps with .dynsym
>   >>> .ARM.attributes range is [0xD0, 0x10B]
>   >>> .dynsym range is [0xE4, 0x133]
> 
>   ld.lld: error: section .ARM.exidx virtual address range overlaps with .hash
>   >>> .ARM.exidx range is [0x90, 0xCF]
>   >>> .hash range is [0xB4, 0xE3]
> 
>   ld.lld: error: section .ARM.exidx load address range overlaps with .hash
>   >>> .ARM.exidx range is [0x90, 0xCF]
>   >>> .hash range is [0xB4, 0xE3]
> 
> I bisected LLVM to see what fixed this in ld.lld 12 and I landed on
> commit ec29538af2e0 ("[ELF] Assign file offsets of non-SHF_ALLOC after
> SHF_ALLOC and set sh_addr=0 to non-SHF_ALLOC") [1].
> 
> We could bump the minimum version of LLVM to 12 over this but the
> following diff appears to resolve it for me, although I am not sure as
> to why.
> 
> diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
> index 6e67a6524d58..c25bed8e6df1 100644
> --- a/arch/arm64/kernel/vdso32/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso32/vdso.lds.S
> @@ -56,8 +56,8 @@ SECTIONS
>  
>  	.rel.dyn	: { *(.rel*) }
>  
> -	ELF_DETAILS
>  	.ARM.exidx : { *(.ARM.exidx*) }
> +	ELF_DETAILS
>  	.ARM.attributes 0 : { *(.ARM.attributes) }
>  
>  	/DISCARD/	: {
> 
> I just noticed that the .ARM.exidx section (ARM_UNWIND_SECTIONS)
> is placed before the sections the error mentions (ARM_DETAILS) in
> arch/arm/kernel/vmlinux.lds.S, where we do not see any errors with LLVM
> 11. Looking at the section headers, it seems like it should be okay?

I think it's good like this too, will you send it out as a patch?

Thanks,
Joey
