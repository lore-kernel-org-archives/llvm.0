Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBD433BB2;
	Fri, 31 Jul 2026 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510131; cv=fail; b=mmzCTRXkiXHlN/EaMAa5QA1d4v6Ga4CyDLiXPfmONUdbVTUIgShnt+3AD2Gse+DFLYtjecDQlI5draqAlsSIfzQzmDl3q04bqMdmHxIeNuidh2vXkEPAeXeBCr2R2TZnpNj17+E7zE0Atwk2r2almMs25ivjxwHtE6TTonazFwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510131; c=relaxed/simple;
	bh=b8e4bwIWSs/fLFg1cuMMBABimAsCbZkMrMswvjHPnyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l0EflG+B5lMWPVIcVb2W/t6onAJ7UVLF9Jn9rYigTwK/hyG4oBL7JlEHGjzCB306G5LFCDO1A87+iVRvXypeZ8B7vB+JOsQZb2Rm6517TjAP/rULYBJ2p+wujlugdhGB9F6ef5oBW/dvH7xxjDqWnpnO/QqzwZmDEr3alxh8uak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i9j78P88; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i9j78P88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5IJX6jMnX3FDUB8TBJokjek/F7wwt1ObL4RjFvA3hj4S9HtkEEWtnqsUvrcqOBf0ixFmzMfccbvZBxdJ7fi3lSpqtFSNo94n2fbV5CBcXnBhwXlgdWop8adDXrb13JgZETpEcwwKEgcummnH96ua9+irBgKeytnQAi54VYKgOiOBCYkI1a0Blh/BRgKsc4thQcdSqsAbIEIieHbuE5z1BGsR1rCg4AsPwzly/ARAJKxLDs188qW7skhBuoqtNKDb6P3KfE2MSjfDlcU8TZwkwceF5WOjq55VKBsScQjem3Bi9Uessu37l0nkN68Z7fGkZKYrRpNPRI1JgUVWnz/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cskCBDeDVDEFs3ujUPUS43gYlLYbkMwJxEU6F2EggwY=;
 b=LT4a/I1UGUgrUsC6sgzCRDRjaXmN1i/nI8FODywFYs9wvXYPPbfQniwoSf33UuQEJxgDaqi0VTUFg1qPDL/J+6DiMuUq16/a0lmTgO0/m3RqSOUQRLOOCbSKA9YNkBIlnpC8+0e7uSCgUURYN1frVEGR+8ax+A+CsSkHUr0YoHSOM4yGgjGXu0EzDJmFRuDgLPnVkn2s8to+JF0UoKtud2mP81fNLLUIl3bUzCt/76B6MsUC9qSEGuA/3Beh8YlYRQlUalwbNpdE8SzDMD1alLv/NLd3CIZFNdjryniqNwPtB0mOrh/k0+3/aBmEa9rKvcYwU8YB8moMlPDMEtgIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cskCBDeDVDEFs3ujUPUS43gYlLYbkMwJxEU6F2EggwY=;
 b=i9j78P88/k9F3QslgGxzmJMWEWIKot2YvmYuNXmJj9P/muKEmbFcOIVQacGTDyVBONK3ahcHcxTF9plkU8r318F9YBIVss95LxhitAmHn0G+Am+KewZ8KPTWEVcxJg4tOT3+N1rKn6g1AKN+fTBWzlGkyH5LlNykL81xADYhweSyfeEOIcuBfrHp6V2taGv8cL+aaVgLX+pwxEcQl6cbwl17RqY1ZvozuKPRd5iIYcmjxLwe+8+RqG3xZFe6J50nX+J47kivA5FTx1BCRm8JewkZZKwXtVyq+Iq3rhs+/KIXUy1dnw1oz0eC2DwGNhO1upuNWJ+A6Ekw+k3KfnjPOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9011.eurprd04.prod.outlook.com (2603:10a6:20b:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 15:02:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 15:02:05 +0000
Date: Fri, 31 Jul 2026 10:01:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <amy45S6tBC4CjdWa@SMW015318>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
 <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
 <amubjArdXOgTzNCX@SMW015318>
 <20260731000407.GIamvmdwHRq_PSgyvc@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731000407.GIamvmdwHRq_PSgyvc@fat_crate.local>
X-ClientProxiedBy: SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cca2721-b895-49ca-87c2-08deef14af42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|7416014|23010399003|1800799024|4143699003|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jtdX0+mJtF7HCMCU3WG1NlUty8V4wznAXEUE958fxDOAQsauhN9sEBUCfWE18/38oBIG/pp60ynkFmHp5T3zUzYaV6Cp6Cqf79apuT3fQzjsP9GX0F03zoxBy7ECHhW07Y6G6UbKEvYjoR41LpZbjpJIe6t8A2WbqACrAv87DV5n/D33itBnlW0qeO7DDKrG5XKXpx+3iFgEHoEO32gsfvg3iGcl+PK9j//okcSs55gWlgm0cK2omIhQneIYQyn14RuZIXAuBv1YehhradJZynjshsrEL2iH3UxHwJA7yS6n634cWaAFguIgxXnz4a0VA3mlW/Ymk6xMdAFWJFRM8Zzx4a/862DnAkKZykaPUiiE0oy5a7cPlA6FZ+/KqOkSzfnAt3XE1iyVr6U28EUqiNEbCRqtydBHW1Dj8UXzI7q7q51X4MsbH5+4M3/diF+wvZ0XPtfu47qmhLgJjBz22mhdk79LQEmiweu3PfIofKC2K4+PpbFLggPsNLhdOUrkhlZMzqtac2jSeA5MDh3ZYhKi3vJEhk//QC+RhgGkVuep31N8WMNk4YZ9WhqrvsPhxAfexMhbb49sOBw7b2k+b4/I/xIZ4YtJOA6TayKfGLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(7416014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?shtmPoswdLP6Rcajv5FoifZpPASaoUnUDmMoh+QbDpGQsSuI1LpVldll/QDW?=
 =?us-ascii?Q?waKmbCSHuzT5tiUa0xm0kMjk95AykMCDwrTsNB86GxSfhD2OI53EQbn529IV?=
 =?us-ascii?Q?0iDMa4JQzDYmLPqhGR+fq7W1eqzWRbYMXlKj1pswFz/e7lpaOJhqbU9rvVwT?=
 =?us-ascii?Q?wZdCxTioF1hAqaMI2WlxXZ4cMAPEU74ctRnHsp/7g2IlbBok05j5lPWxBKR5?=
 =?us-ascii?Q?5jg2jDO1wHL4pnezEjZx0jWq++phn0XPvm8U9v3XBMgshjjmANk2S9g0m21G?=
 =?us-ascii?Q?+5VH2vR6osj8gaR2OJPRZIsdQeeN83jre3fnI5zWouudP99jGr0WsDan49i3?=
 =?us-ascii?Q?UIU/E+F/TGAyRQXsr+sTI7efR3wNLWH1c2AHErHw5U0wRgBw8Oh5hv4W1Ik9?=
 =?us-ascii?Q?Ama8Wb3h53j20WMHWr7J5B5ZiHDwsn3B44lVwGKu1uzA8didm3IYcGhnCwdL?=
 =?us-ascii?Q?zSQGHswtRP7Xi97EkE5BP4S9ACvNv3N/62OEyhSNcgYAwjxNayDivZaDwyHe?=
 =?us-ascii?Q?hZaqcOVHEA/HR6U6fU16k1fHlawbqs432JiZBTngrUDNwGiD/WRyZHOKT5YK?=
 =?us-ascii?Q?0fhnFQzdZQdx0lV1DgnhckDj669XVnpP4jRtqxXui5rofsco6DqH9WXGRLaG?=
 =?us-ascii?Q?G1ySASrCbxlEFCPdI8giIf2P9yvGBNJvk30WWICjb1MuhslAHQfUfovBe80F?=
 =?us-ascii?Q?D9m0cWyLk/ZNBNs80bvUknhKnjaboBXkfNFHuzV2wlMT4mw7Wio4xmEkB+O6?=
 =?us-ascii?Q?zwapl59Hvo7N+8OKt4lVlmT9lEOyXjyM1oxl3baEywEKyywxVHD+O51bJo1/?=
 =?us-ascii?Q?QAenBdUk5iYXbiubO6Ry95wupoQkuOupDQ0qOJH60lz8+UoeawEBUj0MepXc?=
 =?us-ascii?Q?of3tOPb9RPy3QoI0APuU+pF+bxKZ0Lye9Y36/AgphKV7tbY1BKalmiw7i3EF?=
 =?us-ascii?Q?ZkcCnBFB7P5+IxgDnUWLoaAlCJ1jclOoPlwjudk+mqWOulDseE+JS1iFGvYD?=
 =?us-ascii?Q?/jGwqD0kGsBIHjr+ipGNYSzI8JzXKcIRIP9SM3kdhdOgkQByswiwROKda7dh?=
 =?us-ascii?Q?unj5H1So71sjb1LO0nLKgAByb5vbyAviNK9dA8kZfQ8iuopOyM+GK8hB55Y6?=
 =?us-ascii?Q?TPHqTyDPM472oE7+cGRrkUbk6qWfdaVW5kRFto+1WayXfBUaixsHHEAq6rbM?=
 =?us-ascii?Q?JJ401Wu4pzMGMRCMZEPTG22lW5rF65rZCFmBnUwsqbW3n6lakvoqo3kQJo7O?=
 =?us-ascii?Q?yuQAAie+Txm665Xa8/w8TRbF+y+7t1Vk+kvjjN21r8kfqX4ialTUecm0PPqi?=
 =?us-ascii?Q?WX8gKnkTMpweYNhth47/SRkC2C98iv4JK6n2CrJ966Pbqoai25WlBPIwEOVY?=
 =?us-ascii?Q?QOFpMkM8f7OKfoarE9NfwBJ0F5rAYr97nSVR/QzEX3KZt5nlpWCZn+mgqNOf?=
 =?us-ascii?Q?BHQIS6IUViJrfytwgOVMP0D2i5PNOJocXNFm1DqZdtjqu7ASmQDPjOwmROcX?=
 =?us-ascii?Q?2W6UW8AqUDjNljFj4kxtFXYsr8ycLqn42p4BTokjas64fbrd7NdAQtToxU3e?=
 =?us-ascii?Q?G176N5pykhybtCN+rfD2zVGiilKJIZxf4alVdtOOOaBO9Sd4dpB45w6C4IMX?=
 =?us-ascii?Q?5Gh9W/NjYdljmDt8X3e5jVShcisgSvJORhohL5cCNeqsis0INOKr47PjAy0z?=
 =?us-ascii?Q?UKxoRSXIfeA6XGKHnoaS/3Zg/tyRKKbB4vkg2uTvz8WFGAokZ7QiUoYqg7i6?=
 =?us-ascii?Q?Xs0FRD80ph84u9iWqHdRE4JTynTK/95EAS31g4MPXa5+PxvsBMlj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cca2721-b895-49ca-87c2-08deef14af42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:02:05.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L0fIU+3zEm3S2dOIsMis0hkIEYMFnkDHHQM9k7/R/uTrERY/0hJR793kcNerzusRAfoIJ6X1m1gHFaotNHhriI+mvKXD+4w0QKa2Sj6duAcQ6pqhSIr2Pbla4kakfIj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9011

On Thu, Jul 30, 2026 at 05:04:07PM -0700, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 01:44:28PM -0500, Frank Li wrote:
> > On Tue, Jul 28, 2026 at 03:40:59PM -0700, Borislav Petkov wrote:
> > > [You don't often get email from bp@alien8.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > > > The unfortunate part of that is sashiko does not understand v2 patches
> > > > and whatnot. Meaning it will always complain about things fixed in
> > > > other patches.
> > >
> > > That's fine as long as we've replied to the patches and said why it is ok. LLM
> > > is just a tool, at least for now and how it is used with Sashiko.
> > >
> > > What is more important here is finding real hw to test it on. I'm hoping Frank
> > > on Cc will move...
> >
> > Tested-by: Frank Li <Frank.Li@nxp.com>
>
> Thanks.
>
> We have a bunch of Sashiko reported pre-existing issues:
>
> https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com
>
> Who's taking care of those?

There are too many pre-existing issues at recent review, we are trying to
clean up these, but it takes time. I am not sure this driver is in the front
of queue.

But I help will review if I see these patches.

Frank

>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
