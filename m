Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2BC8F40;
	Wed, 22 Jan 2025 01:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508778; cv=fail; b=JDykVJg3ZlasQrLz8nVtocGkpjQhr0ch5xfILF2j+D9nY3YIta+HaEK/7ooglb/HHpqY9tkwn5qVCrYX2iUcXg3iYkEOnjQPg2DquJOi7i08XD+PS9CtDc7pkCkS/6uPYS89NKSqqZ1cjRw8SytbpsahOLhgyYpcpsJ+qb4gJzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508778; c=relaxed/simple;
	bh=xeKeYn2F8aw/8ebbCayaNaHacOgUCtY98ArT+npu6V8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hjx3+8PHJGPLLCz813XpPZG+HSzmvCTxRzY22l98Pw/ZEVgy20ekSvLGpPuDgpxp97BUd1LO0TI6XNpX2oO54veq8W45rqqRvg1LaQxjJ74SZdEquvDh7vPYFKBqu2mJaHmXN1XlLnLNKSN426IgwG4ERb//fJQmGyrbngh33vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bCceFOSn; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bCceFOSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie+5Hf7jzUnPJ4WN+qV6q09moofgB4z8k8ZSXM7HxSIsjpYLTMSatnk/dWHgI3Rk7/uHzUowUlIC4Zam0KFMIQXIQGABEUxfScUoVdS2QsOGWHHrsxlnupLU0ugF89DEFRwULCezPdMDXCjdu6PJ+d+vTAvhwd1/R5o8f1F6Xnf0c37Iuv5mmBa/3wmSyY23YrLM1ClGKd4wCZB9HoMGElC7KRrTk9bSZ8zoABXhXvIxmDdebcPt5OspVNenJpkzvdArEmo9KOhtuxSWBG0mOCbe142qFMWCUbPq0SBl2reYfmHY+sB9uYjwni9rvseGITQIy7lSuUizWBneER0C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmJZxyUmSjfr6UNZYat4uFukOUraPsur/pX0mLWBOp4=;
 b=qX5KaoUz2NiIESscT6AYAnu0Un6EfuWV0ajlZqL44UEzv8jKuLkiYVWQMjNPt5Wt5JfcZTIi4TalArhQlbP7DRJRG4qfVqcLLSxGW4l1WwClcghOSkg16ayC/N+uV1xJc8ehn/B+JHgt6bdWUQAGpnrYy6FY0iRDwMHzqsSJis6MGKLZvVYSw5vqvU7TrOejHCjn6s/0gfTQbGjnVzYT5E2dV4o2wJ165VkPex+vyjJtmcUTAh2fJ720imyv7mVGU9afjs4ArNV7pTtOUzeO88wgzYS3lbpUf+EDCgfJsDaJ720TpUGOZhQJvulWTuo6jj7WTeD1rsEYivp14eaoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmJZxyUmSjfr6UNZYat4uFukOUraPsur/pX0mLWBOp4=;
 b=bCceFOSnmGTDSZ3jpAFwUWRKBCHYpcJhwzzC+Uh3gciymVMf3X3V6AEMNuvI9OAy7+9w6czrSajOHFGNfD+4oV8guKAEEZOGtKMKk4RO8etagzDSifa1yA1v9I7U1J85BQHXAv5V8qb7YQg20WPUHRLwgRaURfTGze7DLlaAtvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14859.jpnprd01.prod.outlook.com
 (2603:1096:405:258::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 01:19:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 01:19:31 +0000
Message-ID: <878qr3k5lo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [morimoto:sound-cleanup-2025-01-16-2 7/23] sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
In-Reply-To: <202501171455.ZDrGYjE5-lkp@intel.com>
References: <202501171455.ZDrGYjE5-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jan 2025 01:19:31 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2927a001-672a-474b-27dd-08dd3a82d2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nFt8GoJknnsIk0+RvAKfRYAzqR2x+AwqS7ick95mw6TQvH7DMEV6tAO1JbLN?=
 =?us-ascii?Q?7Lv2CXmO7ySMc46EOqq6MqzZwsal+Qvmw/MeYJLI+OKZunGc+NN5HJvrTU8k?=
 =?us-ascii?Q?Z0SQ9Tfk52pGAKKhjSqHwz7yNmC+ywnpNE9wHcj1fd5oFL0ZZd4rXQhv9KJq?=
 =?us-ascii?Q?m64pn2MvIwqwLXkcAAJziaURMoxYo00ZkMiWIxXrX1lww6fyusYuGPcAxlZT?=
 =?us-ascii?Q?7i0bfWaGHSv64abiQmeQGPl3rDbHybigATYSc488CT/JIzxz58yZXWmA/Uiz?=
 =?us-ascii?Q?jgBu5KF4F9VTG9r40hSBB8Dva/FLELb0In3ZjPiJl41NNaA05rQECeuw8O4c?=
 =?us-ascii?Q?Ny8vXjZkj8OflyX/pPxktrExLRTCDjLYkEP6+bEZMi90FEmfAtCDDt+3Ybm+?=
 =?us-ascii?Q?7Fj1zJAsmO6ci0PEQeebx9/DVdmhRQjDogQDTi7R3rA9bwtMeu0HgU26TlHl?=
 =?us-ascii?Q?SfK4RBlqzTF/IauEYg3UxPrQDATah6DTkosDVcOOBbWIkxke0sTG6kwWTEbt?=
 =?us-ascii?Q?GnhwYl7j8US/ZhZ8jfTpTLnIr2j0su0LrlmMHfqLE1l/dkZ1UmIf0m2GuWr/?=
 =?us-ascii?Q?7U2k6d7HFVt4MLVCR5W/qAL0GveytDtjpWnF1DxCGzSCW+HiDnzAHKFW9QOI?=
 =?us-ascii?Q?iedZ8beoFMoY09jmfllOF9NmucEj/9Px3kUMm+WiW+xxloI9viDp43p9mACG?=
 =?us-ascii?Q?BzhgJ6rg7XyjOJ1hnRL+tPY5amqTUk2CLEPk/Q5I+VsjWCBwXZ0fJD46jLjm?=
 =?us-ascii?Q?LdOGJKzcNl7ryXtG0VavvTv3JOlj2SO6+8I0DfTjm0/THOuRRKN/pmHTNdqZ?=
 =?us-ascii?Q?8b/H81IWjXH71ACg02zcXRMvecfaPqXHqrRQPTh20X278FGRoEvSNg/tLyhU?=
 =?us-ascii?Q?Wm99J5grmuL5AGqwd6wjh9XL8xxI0lHhg67VQ0aUEd0OX7jJaafc6JQDoryT?=
 =?us-ascii?Q?NRCG+Pp/4zN2RXcmDKMnfzzW9lsRCwL5mAj6wRP21XVkVHy4NLi7rRd6LxKF?=
 =?us-ascii?Q?Pp2ANgrPv5JoBE5juZXOV+P7zSdVhZOYtz6Tb6CVkCBYQiFArjEihg8qZiYR?=
 =?us-ascii?Q?3M0x+uDmxZ1VIYHonSVp2vTyp9jHCfkekRdJibfTzfMpXv7NyZ0HFbxb8r2O?=
 =?us-ascii?Q?pxqozx7w9lPIA+rLXur5lfnIuCYc0jMa8EFxcPyUKS264UpR/cHg+vlgTzGj?=
 =?us-ascii?Q?9EXupiUsOn1J9lVqEMg+kYlBZ+U9cww1JoT9TggsIJLT6RPjJTRyYYmmXqpR?=
 =?us-ascii?Q?rKYR+P3hl2e3kWEN7p35GZK8QFOyH7EdBKD+y7wCjTv21RfVmy65n6829Fvm?=
 =?us-ascii?Q?d3Vgu/hU0vna197ccWpunxifLXtEuZTXAwvAdzxWRsRBtigVaSb/WwTiyoD+?=
 =?us-ascii?Q?hZECTtiLJPGCZJpoz7eIZOzBsUI2kZZ3uHsSCb/5klsQ+jtEUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mqBTkfhSvIBheElEoCpCnw1DiqHGP17MZQ18lBHmKLKo2bEyr0WlqH4Q1F0F?=
 =?us-ascii?Q?ltD90fbtszzb3o6hUaA076UVC2CK+015k6OftmZpLpYYm9Pxgcov/AVsNTmg?=
 =?us-ascii?Q?f5gZ7UEubzEd0t8RIZBLdym9ZC5njM5APkYPBDUk93LzDHW2sntRi4lcZjha?=
 =?us-ascii?Q?eWmatS7RgXnf+C4ZhcfU016wb/fZeO97KzxMj4bNGv2iMWZj9brU88tmYjhq?=
 =?us-ascii?Q?6P5r3xzqCF50YXbyiezTx6VVFWIv3LI1c1WO9J51weyi7iLxlS+vB6+l6UwT?=
 =?us-ascii?Q?vCKYRdMQcPT9g2HENdsgpuPCp/CEYVl7AjwbPddlbM1XIAdBCeAa0+B0f6et?=
 =?us-ascii?Q?CelY8Bmz4U6/vDoHLvi39RmjQIqLldlIXNCLxR5U/2cWylu4l9Vpq+d2nMg/?=
 =?us-ascii?Q?rY/7rSyN0X8tPMgmNK3FcJ0uSjxvIqpuZoN2XYN2/AlrROIcNO6m9Fu7X41t?=
 =?us-ascii?Q?wzivMB+r3uug2tVB0MKv/kUPywHSl2K0nhb7TdFRoeFlNZ1IyoiqjWJDiX+o?=
 =?us-ascii?Q?gfW02G5/mjmrmteI429x5KiuJUBrLBnZ99iimwqzPSMK8EcN2FKGskCjlNwU?=
 =?us-ascii?Q?aXXTDea+s9FYbDMY4gaw7V+KX9p8BPgeRRJa/VMbF8PNUKJWWm1lXjeaFvrb?=
 =?us-ascii?Q?cl43ju2x5Bodue+V4BNyDGnzcGZbu9duFixjT66UHfdJv/zNK0sYPv3C/tXM?=
 =?us-ascii?Q?er38ZUs8TRGqr5QpSMje5hn9piqiDrhcLpOCxh0Ae/qbPyTO1hRvzmY14DtC?=
 =?us-ascii?Q?RQlh1WZ6jubXTDYi2MQuoKRiI3xto65DYJNVJTatjpybLc92dgNLp5mcs2q3?=
 =?us-ascii?Q?3iSVlvHSAwefuFIyNMW9dvodXylOjy3ImGbgsLxN837C9IcxN1QRzVd/8P/1?=
 =?us-ascii?Q?KiDRB/mqWsgNmxPEczjx9lvav+t17c2QXeikC3OoCBwSmWRxTUDvq8sKCTdT?=
 =?us-ascii?Q?mS3XtQlSv4ZJvtlYzFj0LVe120HDatRVjk3UFgV8R9iH9AUxR1g6zasH95DG?=
 =?us-ascii?Q?Xa/ubTjfAGvgKg4EdmtPiPAcVecmHc51B2JWVoJxjFOMRooS/3JaeSbFm0lZ?=
 =?us-ascii?Q?fRWVt7lWZ2zUClFZo5ztSh87/vvqZ3vlOd7Nql7sBSW2a/fMCC4ZVhIvZlPQ?=
 =?us-ascii?Q?ZEOK3JQAjAgoCTO0/6FG4w7a55ORbOX/GmbOm6G4oRb+DwXNQlo5ZbXDvR56?=
 =?us-ascii?Q?OZ8bBBLp4CFHHmD6qDoFav1yq8wIQ93JdAm7/JCMsmxnOLeTetm32LuwnySV?=
 =?us-ascii?Q?1rzHmw9SQAuowKQTPXA14zE8eoz4upbxSPf/SNEzKk/Q0INXe02Zl5gKjGru?=
 =?us-ascii?Q?/7vZBH00UEJ2pBAERwi2TFZEFPM1pUTm296P3xvhBdF9JC61KC/NYI1IIbH0?=
 =?us-ascii?Q?WyGEFrt2aSzV3t+uSKGPj7W5ACNFU/1DjDe5Rb/50CsJgHsuECScVjYPgLuu?=
 =?us-ascii?Q?4TtFsVG4etVbuL4jqitZtlPEG9bBAYeLlp1VKSz/P1NOoabIzrO+AppcfpvO?=
 =?us-ascii?Q?5Ba66mRhYCo8DiDD76p44AAUTs4FeAwpTHlSfaaLc6+64+gFU0YSlhIhpr4X?=
 =?us-ascii?Q?Vef1uMJIqerZv3CES8ldJFLqFwaERjF2qT6yKgI3y49VL1r+15iyfug2ay8Y?=
 =?us-ascii?Q?Z0DOsLRWkonObLRRFuJJYVs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2927a001-672a-474b-27dd-08dd3a82d2c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 01:19:31.3291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcxvb0HenzvGVbAbmJ+/DyTptlYB290puwjk0dEV/+JVK4mAiQtH+Ihm5OlvcZCp//MfwU0gFNx8+RxMHMn/0mylBK8nDx0rzfudv4BiI0TAduphcmQcWXWDy09nB+X/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14859


Hi kernel test team

> tree:   https://github.com/morimoto/linux sound-cleanup-2025-01-16-2
> head:   e3977d58d39b9fd3d4f04615aa580d4fa702aa0e
> commit: 08af04b193d94a1cbda7863d699552bd674dacd2 [7/23] ASoC: audio-graph-card2: use snd_soc_ret()
> config: i386-randconfig-013-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/reproduce)
(snip)
> >> sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
>     1013 |                         goto end;
>          |                         ^
>    sound/soc/generic/audio-graph-card2.c:1030:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>     1030 |         struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
>          |                             ^

I couldn't reproduce this issue on clang v18.1.3 (Ubuntu 24.04.1 LTS).
Is it clang new feature (19.1.3) ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
