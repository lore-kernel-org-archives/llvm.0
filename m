Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E31B21B6;
	Thu, 24 Oct 2024 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764415; cv=fail; b=a0/4BFSIpBVUvtMf8Bwsue3teeSj95B6u33KcqiWFU/zYtOJ3GNJ9NNFeoYySK8JVBZw26ABUFgJx29NZE70W/1SqLtM19dzPmv5PQHaK+09drLvCUYWfgFs+Xzsy1Sqy9UcEbWeE5Cz93ZUPmOD52Y/LBic234YpkRAoNKRm0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764415; c=relaxed/simple;
	bh=zhPOil6SPPCkVbg3yk3WcGCCIeii8GVz4xmmA4H2BAM=;
	h=References:From:To:CC:Subject:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=AGmojTobddfLtJ0iz3r3lGd74Ydjx5GfbjXiqHppTNQv65HJrEDEEbJrHpVbkp1iFZwlqEX1rVpST7zX+1upp9wRnz4lwBKvCt23FV1uv59kKHVMeMYLn2ubrPyhi0/azrEANf6lQKCHZrr5SGkhDnzZfe9flGJ1493PfnClmbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q7lH/2vc; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q7lH/2vc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSRBTeKTBjWZaD9OxgprIU5c4eex4RP9YvX9XV0HioLxM8yPBw4IMRJFsVlSKxQD20dy9Ou1ajshdf7IHS0SaSl1qzKeKIlbBXDvcPnUb5CUSXD7BRruFQ98aLfw5Kx1BrkiDFVaATy7J1inzICSAPutSRXkDk2h+swRMDT3glEuLKjkCeJ2KPPPeSTnb+52ilN5KJKKbV4ZMWM2EooG8PKjldUNi/DdvBM1TxZ+OlRSZQUM6j2xLrg9GjiISLIyd/Vi2WQap1/Xzm7ON7dhKP0bjYWe87bYZ8/D7OVq28t2Yh8hXusy6Q1vzXNoEAbr2p/L4kMt6zVYBvSeswoEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Vd3X/gqnrs50qnULxAEQPNSuob/0URVUH+fuPHCtGA=;
 b=sVazo58k1jUKa/VVStfjE2uZ9RkxxiTIporpwu5yCV+G3Qxxh1fezW9fTREquZANmJ06E/+xLm2/IbEaatwWTAb2KXR73j1WdmGw0jqoZkh3183CXs8zMlcEYVYqS8ckSSb1ku+UiC3WqSzXQ5wXmnv9i9GzZcIsf5azwYHbzhzIllpSyouYE8Am5kA8LkiMg9Kig9XmjhKs6CMGj9WG99A9q+KZsJavbVgtEKm22usdlOLK0wnC1wkveWzmjoE1VihgdSca9vsXDLfwqrXBoqa5IWZP5WIy4Zy3wgEIa/3MmT3c55a5m50cXPEtCIMJQPuiE5njBnnyiPqldj6x6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vd3X/gqnrs50qnULxAEQPNSuob/0URVUH+fuPHCtGA=;
 b=q7lH/2vcbDaior+vvm+dr6466Glgn6DBA3Nztx0Cv602UhfOQ4JnMEvnU8VlgEEqh0CSL9MfqtjN4oCf0ovZ6DM88JjW3/Sck7mrSNxCP0SKTUTSGEEn3otlboR9uVi9F3iQ6UPp+DgB2DptmJNxxhWwMyFOTAyc4rFSWVJVVGQE4zIY8h1azl3fjH5nJwSeBWbd8ykQ/qlokhYD4/bhxDBYSwf2tFKHkirTu2npT2uU9nOoXohvGWcCeJo48EYcLj9UvpnS03+Nolco/p/b5M/8v/VRBlPAAbk+sqKhyz+eMYI2AyAIxAwOgRothqAZj5SkKpQwcWqhrndG3Bwz7w==
Received: from BLAP220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::32)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 10:06:46 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::58) by BLAP220CA0027.outlook.office365.com
 (2603:10b6:208:32c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Thu, 24 Oct 2024 10:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 10:06:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 24 Oct
 2024 03:06:27 -0700
Received: from fedora (10.126.230.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 24 Oct
 2024 03:06:25 -0700
References: <00caa74f6dea128400472b5dec77f61b16d0f9d4.1729607879.git.petrm@nvidia.com>
 <202410240831.djzzgAk3-lkp@intel.com>
User-agent: mu4e 1.8.14; emacs 29.4
From: Petr Machata <petrm@nvidia.com>
To: kernel test robot <lkp@intel.com>
CC: Petr Machata <petrm@nvidia.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH net-next 2/8] ndo_fdb_add: Shift responsibility for
 notifying to drivers
Date: Thu, 24 Oct 2024 12:05:24 +0200
In-Reply-To: <202410240831.djzzgAk3-lkp@intel.com>
Message-ID: <87frolizmr.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e1ee05-532f-4e0c-691f-08dcf4139135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PYUwLXc8rjGjmYy0sH5A7xTPRG76AwLpBeI1RrCvzqJlZh+m4IllvNlW6okk?=
 =?us-ascii?Q?xMcylj0FVY20p3Z/ym3YufmFcWZaFvOg6aXLvCHODEtZnUq4zwLQfbAqUbay?=
 =?us-ascii?Q?WK1f2XvWFLnWoyGRZBA7ZtlH0pi9TF0OjDtfgNe5rXP3sDVCallrKWcDsFVh?=
 =?us-ascii?Q?quufJDUTqvTxkb5i4y0uQ3p/Bz4sjcC91CZ3Z7U/yXLlnXG7xiSEVRfYX5rr?=
 =?us-ascii?Q?uxW7SRtizVs0CCGWu1up3V7kawXP5VenklPjGdTxAk5ZGobXjFCtejH+F1F7?=
 =?us-ascii?Q?NFy5/eNLR5GZl8mqysIGmDVoWJZjT1m4AA2wtH24YzvxiV8K1IGsGVNI7zb8?=
 =?us-ascii?Q?EeRAd/XdbJaiymRmgLJy0IbCmu1P5Wiv00u4zJoVrHh1pSp/iT0av4DrFO4I?=
 =?us-ascii?Q?PqnvyJOzLh3lsQpo0uErk5Xo3U7W/DWbUvCJ2uQUVMvXFtWwuG0Z03p6GgAd?=
 =?us-ascii?Q?fx2bzzQd9HMCuRVWycWpsc/q57rXIwutxTTTTawRt7Lh3J/JSJ+opdgzj/wj?=
 =?us-ascii?Q?kBRJT+6ReCg5/ybbYq3CnGOKpe0Bcuogc8ntHyarbULCtIITbI66FgSufpA3?=
 =?us-ascii?Q?+ZAPVKEb2N/5IXNrtv28/+HTiPxKLKgVznODOxXKCXE324vJG5cuGug7tW0v?=
 =?us-ascii?Q?RRjiE+2QOaMQvGD0M+HIyHrzFLB1IwL8D+gzm4aDh9xQ6KyKgMkWnRUTMr3t?=
 =?us-ascii?Q?LN44C/hGeMK+e8sm+zPstDsr8V8/oIep4K5SdW0NhsUBcebTUc8bd6CST3zl?=
 =?us-ascii?Q?HuwKU4TOQHBfTnwv4iq4cJNjQ6Po2ElogYYTLfJAmhY4x5zhmqLG6LLTL2sT?=
 =?us-ascii?Q?QybqhdpWFxbS48pzsIRxy7dI2TUB5OYGUt79W4YFnboCpe2MXCSUl9z+BDol?=
 =?us-ascii?Q?Utk4IXqqbQ9UuKTAYkPsYgxmTHbC+BGVHvEp1gSPLE2LGH3Gjc2rXnpyOwTp?=
 =?us-ascii?Q?6okjiXW+PORG9HVERMYIo2AJtzwLjqgwLFMJ2jXow6skqrFIu3fat0rfmStc?=
 =?us-ascii?Q?yXHKqgwkc4vPokoMKrVo3NcW0RS81Mrf8SnJvBA9VYO7EeUNld6PynCPOqyy?=
 =?us-ascii?Q?KX96MqrRd5ffQ7jkOKVF+oTsrpOwPtisA4KfEOWTa+N4Ev76YQO3P+mSb2jz?=
 =?us-ascii?Q?k7IJl2pdN6GkawjVKBrp/V4tKgxtZZbihImnElhVbMYpgKLw5tbx0jfon4D+?=
 =?us-ascii?Q?azERcagSUQ6BO+PmMibK3DNq5QtOGd1U13kIZ/mlIlkJRHWyuuQJ4xXm2Grk?=
 =?us-ascii?Q?WOZ/ZjaEuurAVTSY5wQTeFOZ6VFBWBQdR6hasw8sfCpcCDv5kaKJvlgXva0e?=
 =?us-ascii?Q?mq0g8KeAccgxgEyb3BUSx/t5qO4HIxuMBQyYiLfwDYzmPg+OapzFXwwubcIA?=
 =?us-ascii?Q?7OqgeyGfA1AtyAqunug/lbUzXct3DEADtDYkRCly+qcjyveMAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 10:06:45.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e1ee05-532f-4e0c-691f-08dcf4139135
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236


kernel test robot <lkp@intel.com> writes:

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410240831.djzzgAk3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:19: error: use of undeclared identifier 'dev'
>      427 |                 rtnl_fdb_notify(dev, addr, vid, RTM_NEWNEIGH, ndm->ndm_state);
>          |                                 ^
>    drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:2440:46: warning: shift count >= width of type [-Wshift-count-overflow]
>     2440 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>          |                                                     ^~~~~~~~~~~~~~~~
>    include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
>       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>          |                                                      ^ ~~~
>    1 warning and 1 error generated.

Hm, evidently I forgot to enable qlcnic in my test build. My bad, will
fix & resend.
