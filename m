Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416A39CD0B;
	Thu, 30 Jul 2026 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437083; cv=fail; b=Bau2aOuE4tK6KZiZ9GzJsldcXQkf+bsbeXvpOe9mnWE2a1qb8phs7nzQbVcSpQg9uavMd2hEKHfacPJJ9KrabDNPGahzo9D6hrdoH7R1uWSVZgiZq3kudgXxcK7jNZyH32MvrqhyXU4P0fLR/UwFJ/c8shpqIT/nmyAmJhs3yQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437083; c=relaxed/simple;
	bh=g36eCcZUcCjYV0OozPmHM88V0amcmCfhKtGSBMqabmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EJ+t0q44BZZ+zYbDTYWVNCzriDHdoS/RZ62yxc498MGpp1mp9AvK7dzcFAViLGLDzG1vMaX7L5iqsKVLCe99xz2dKjUvKzB6GonHscChvWmu1YQshDNLIBqerih65pVLrmDIFDjSVTkHiulezujDzBo9Lu6fArxq3V6725wVa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=odTj9isI; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="odTj9isI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+NqxCosZPmG1+42FhVs/TFc4tRnbj46e+1f/iXN2wDj4UaWivBPfpad1KW6euiioQe7Tv1htwyutIPluxifEjsArxqDU2fFdvFLuToBcE55LU74CK6jgzk/ipjl4Wu77B1LmplDNY16LL48JfNuXT1DCPIgLJEIWMdcmZ1QcuwWCrjTQ/aFoOdNUZzFT6ju2ofwqrW9t7GwOhiAjcSoqtS8WCHTW8jDuHHjcHuq5VTbMpLbPRNBo0GUu/TcQuQj09HqXEjcb4ZDbagUAdSNxlxAXMtrGJ69UDPsA/M1gzUevioK1bpuB30LgNibWbdXhxiSD8ArUG+IOHzPuxL4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pNQz/KKYt1bFXxaGS/5b9rB16fSyHmTxPmcXj4NGzo=;
 b=MLqg723SX4mFPm4VhIqWWDtGaea+FYuTmdXzQpYnoYHNvect36t7DfGcKZW/hRhixaPx/t1BpT6XqU/vcxPoA+r5mf6f9IxEa1evRYxY98M2pJuLKmsoSEn7HZHgY274VSGGwZJCF2bdw17MkGqNhNapUTmL+NwKb9HJuxCxM1KJw1HEMc0kqI7PZ65bbGhCA6xJE36akE5ImubQh6cfm5WQICNaWAKqGtxZ5JcZTl8N63YVz7J/Mm3zQl6aMXttQvMZvYpwqF8yfbgxkIM/rIb8F2i1a5WZC38JdFS85uNa8n3p1IzQj1ZPdGsnc+ThmIaJWYO1Wpqz0GsAdfPsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pNQz/KKYt1bFXxaGS/5b9rB16fSyHmTxPmcXj4NGzo=;
 b=odTj9isIF2tKH9m4gp9hTU/vFTP99CSVvn6aV+h9Fg9CsIDXFGUyWiDaxJLgL4ZITWQlhA1Jd63vSSSQqMC4jYuDVr7E6UyI6+VkB0vymvuNHY5PDmlrcyp8nn6e7p1rmgjj5l+0UIgJXxbHlpspzWcmaRqzZK0cxysE+lGZEC57ni8ztCdPFUkhUGiLHkjk96hbJk8sspm90hrzmDB7J3d2PMypvhjJ+ynblxCkP4dIqiCS+NMU8pZ1XtKrE/qm0RxcwGWUoL5a01cLlME8F2FYe4zNzDbq/JVEw8j7cgjlUqXlZX5FvVAKbArJDGl3bKwIpLc5y6WGBINJr4+AuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7345.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 18:44:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 18:44:36 +0000
Date: Thu, 30 Jul 2026 13:44:28 -0500
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
Message-ID: <amubjArdXOgTzNCX@SMW015318>
References: <20260714234609.902367-1-rosenp@gmail.com>
 <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
 <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
X-ClientProxiedBy: SA1PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 89708a41-a887-4acd-3718-08deee6a9aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|7416014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PQTf08DSSmXT09vNTD4iDR9Djmvp2NGmGuPIxlrSAyIPYBTQ9LHoOWBjsi2m3EVaGllLAp2feFMLSuz/6z3bXHoM9SZ0/MgoJ6eIn1oVafBX9YxGSN5SzHQA7r0QrFGmQ6jizCSF5lwUXWsuTdPikAJtSOcLI5oBj5X4O8ZEj8oj8FBAtKd9pn3iU7HkbVV/Yp/FjY3JtW+0lLxkvtLt9RnNkaGXlCQTBq87GP8s91Tir49EwnKdns+9lpuZDJ6k5bJtSTO0HSUE5qMhN5cetu0vwO1yZtkhSo/w0sqdhEg0TFceaA8RSuxL+rSrM6T2YjSAMeI9YtjsqeInoL3a7hhKdZJ5cZeaK9NBSTD8+Ah0FBWB2Mx0kfMyqyQe0Be3mTEhJruW7dxcdhpvnlgWlUZqezLl2RliMyG6/tPprhqjfMNmLDBt9PWmiRL0Hfr6KFrRHfcG+Ujq1uDLrGbry0+6pYSd0GX6xH5IaYTB9VXegX4AvBTJgYFcOTiC1UqLtPAIegGo1bVd+iGl4N+7PaXW3f5KSr91PsSW5l+91esr2Q8SK8clWbkLD1+wtsL1UFoPN88dUaZ+TOW3q+GTfGFydgWmWvtzf5QSVrCrCpS/pLlrYhSViZWsyliSYiOV/7kD6gXlBjnxA/uwQLRYo/OPpxmPyCle4vt0IcWk68A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(7416014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?udpo+mT/lBiJEkYfOCeFNjJvmjejGvtRVZEXdpI3MHBNYUWeU/7LHpJ7aJdI?=
 =?us-ascii?Q?kGjFAT+kt1ZZ0sz0i4druaSS5gXh9jvlbUZGemv2utgGBUPcAKw7wCS39ycL?=
 =?us-ascii?Q?SQRSGxS/74TrZDFUBO2I/vWVLwe7Tf9NRMcQi7c7kiGY1tCOYUIeerv+WWSH?=
 =?us-ascii?Q?ttFTBe9JV0Of0ZcaNcGaTFjOPt30KM5C7LDztv0sqwqaNP6uhJiwHiT4sPFV?=
 =?us-ascii?Q?GNNshzMwjk+cHsXGBZ+MEKfGK+J9gqi0qFbS7Xfz0E+Pm4Bm9RzEwmLtV+Ih?=
 =?us-ascii?Q?pvfA7dAVTUku24g7EXNAuc22ga0GJA5/kZ04F4Zi3TP/tk5/Eq0JNjuFGWu8?=
 =?us-ascii?Q?JHfMl+ScpymMjleIhP0twVrr1jYQMiwn8YAewDI5s0kMzhvuVCXW1+oP9D73?=
 =?us-ascii?Q?GCredSuMFr67z7/T+5X7uPdGhLAQVv4anh7lopIQ20AIhvhWOxIEYRiRfel0?=
 =?us-ascii?Q?Y3i8f2oLGqk4I+5x2/SIxKat0tbqlW993UPqhoqi6zAnTV1FErf9tWp+ioHC?=
 =?us-ascii?Q?iA3puILcWC3tRanu9+sAskxrBlUZ1UKHtV8wx+aZ9AYrkFi6gY5rlVt+7O+x?=
 =?us-ascii?Q?qkj3HGjnMlhX7XsS6IZQ16W58K1QW5wF78SWlTWrPZQ1VCbicmu0x0Sc7/Xq?=
 =?us-ascii?Q?VE/kLrqxlc44spoY+3KiIfcn/whA7N638s8gc8ZA0w7aaRMqjKNAoOB/xGOm?=
 =?us-ascii?Q?abaonSTv+uPWFVaeUZxwB7ZB/v7T3a6uFS/RzCcMxaBzGHwfJpNwac0kLCB2?=
 =?us-ascii?Q?3y3RequeQGOEPi6dhHjWNNVGzUT1c6Noq1ZYngDM4EFyGWS5JKht5b37d9t2?=
 =?us-ascii?Q?NaUwzJSafiq15vzyc8YMbVJeHCo2C6UHo8wuojzWNpD2WgYdFcYzpnzF4SYn?=
 =?us-ascii?Q?oCtfTMka9FEpzSXAlx0fyyoDGoSoDLqCMrtUFtpp4aBq6vjyXtKRhsc+7bfm?=
 =?us-ascii?Q?XB/OxW3D8vV0frsIqVigy/IPQy2ZUdwOHDzLBZcFulubCulLfKCWEnLqfF19?=
 =?us-ascii?Q?5mG42h3e6l+mqkamDf4lYcjDuqHh4KgpdKHYqgkNefoUJB2PzpHicKOAMzeS?=
 =?us-ascii?Q?8+e4nOwSBlPlF0qHcDDVWPdcnVGbI1h6PYsk38y/0o6MvMVfn1tEfJZexhgS?=
 =?us-ascii?Q?QFD2/Zi9x9/av06uh33M3Tu2/bk3z7AF6SlcDdq8jXQe77QR2TTHQADk2UMH?=
 =?us-ascii?Q?9PqsaDZ1Z312AbP+Nk6WdeJd1SKxaTU7ci23hm0AzWl5u8qUL0cKU6AVNdSR?=
 =?us-ascii?Q?uJiwH/QD9ZEQd59/wBJs+OMXYWhf2bTTqgKVV5F0UtYpzLIdDTJkOZd2qiI9?=
 =?us-ascii?Q?Z5Djn81dSI33ObCE9BGUAysZHWhQugdL0LgDeBIwQPwC0sZ6nM6ILIk9SBKs?=
 =?us-ascii?Q?f7BWLiPUrnzV2q4w3TVBV3LS7uNvB7SOu/LEnNFJA36yFuirMY0Q/e349ZGR?=
 =?us-ascii?Q?yMO8LYXGAjrHnfJD6Whxdd9eLjtCGUVQtS2Ra74A+J8bY0KizO27RjjvSZqY?=
 =?us-ascii?Q?XDvGHEk0nFx99djkkKo27ALW9iUC8bf6JuatoB2e00QXUh+SiXgwYxg8rB/l?=
 =?us-ascii?Q?dkJ0JaiOyySZqzZR907MncWqHTAGv911huNJC/pNNxqxsBJiv7AsNl0x+QL+?=
 =?us-ascii?Q?2BqMosiIeDrB/Joux3RPtr30wtFxOGd7E2r8ZF9E+TOxH/WLVr3JixtX3BRB?=
 =?us-ascii?Q?bweCGyj59Z7/nWyb4O84gAXGjJv/DIrn6D14AqLDO4ZeHGMP+XmeZKAB2ofm?=
 =?us-ascii?Q?ZGXOeaCV1u9bmnKnfLu8ot4MNU2hT79mUtn4sM6UAaQawZha8UtA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89708a41-a887-4acd-3718-08deee6a9aa0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:44:36.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3pdR41/SyYJ+0HD/ii9e3qVFR5pfr9emR+6vKYDlRZ6jU84LaXGwgKuIUUQgI/1iuQuDcbeV211HfYjQj/ms+WA0wQEKuODMI5Uvk+HSRLfCGg7BUzS3HOPz3C1oom4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7345

On Tue, Jul 28, 2026 at 03:40:59PM -0700, Borislav Petkov wrote:
> [You don't often get email from bp@alien8.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > The unfortunate part of that is sashiko does not understand v2 patches
> > and whatnot. Meaning it will always complain about things fixed in
> > other patches.
>
> That's fine as long as we've replied to the patches and said why it is ok. LLM
> is just a tool, at least for now and how it is used with Sashiko.
>
> What is more important here is finding real hw to test it on. I'm hoping Frank
> on Cc will move...

Tested-by: Frank Li <Frank.Li@nxp.com>

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
