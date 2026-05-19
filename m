Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1B322768
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209265; cv=fail; b=bi3rfRlTEl7H9Gr0Xa+62DUQHWo5Hqd3hUqOm2v7wnXiGIA1xO6nCP2G1524JFyBcZU0Vyy9ZlyIZDZuaZkPYMNGQ6AAPXoaUCX8XRdukPGJ010j0RPQn6luhTmI6zoUVrSf9YXEguziKVdsrQirvnsbbInwZqfsqFxp/CN81J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209265; c=relaxed/simple;
	bh=H5gdcmSTM+e+ZrKrkAQTpw0WcuzXBUqvUSkRTjQONzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RswG53mI1s3AKSqcpoNUsSDjpLThEKDIcACdapmOR7EVf2qQBGqaDgEc/4vx2PMs4QGVmeG3gIQz/ceUUZDKRswcxpiqUV8pf512ZafAH3gp3Bd0tWGeP+lYUWeVlfVLk4tTmheh/D20NpepN14dqjvT9I9xqJ9slNXum+f5mqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BAbL8aF5; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BAbL8aF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvv3diR8aosi2+GZdhucZ3gIm567RnG6x8IGlXC4UsumUFJwGp0DSn8dqBWtOnb8l8wzpNu/TYiaQw5jHebE4a00B09OqYZTSBEGugflDxdinlsx8yiWA7FHTExZ3E9Yt7sowR2W4H+AEniNZ3hBtK9xL4xNUqiUoU+FNZzFFOhCOVap9wlLeiI0RKiYhGDZkKL2sj9WvJya1nqaWUI+NXhA7HwX7QA4QJgUvxz3Y+GXXsXwpJBJA0OKCjrvAASR3NYNHRcIFm/4cSC3LGuXDaIFRd4/1TgohyU83hkDXKl7msm1e+6idb9+bLya3UQa/66tOQwDMpL+NlPAkOD2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GX73irdgJ/6RBvzWu+MKKv43mhQRTQLFvYZvlaR/7jE=;
 b=v58fM4bh9Za5Ty9QZpEWyG+w4RzvF0MZY0m49/CN996PQwhvH3e4vDUeZT1dNLS93bw9zXEnrqQ/LmFNF7DymMOJxQs3PznDjIczL5J+q6Mp69rabTge4Z6QtdY0dob9UNPpPU/1ow0XclR0T6w2QF4xXKtyjTkjs1TbxnuPZaq1OrCV7mTMSrYfDpfl56NSx/f/ojZLrzt9CjWk30aZxwSSQYtmUqJKyAGYpihWZJ9UurXiKQo91oyRzfweSxNeNWPycQ6bl7J+gGWvcc0EkxA8HGnY+gZbo17t11Gumt5zUIwl47FT8ga2eL36e1ieyQxrCVPCWt8wOpajy3Y9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX73irdgJ/6RBvzWu+MKKv43mhQRTQLFvYZvlaR/7jE=;
 b=BAbL8aF5LXSSsBiPmFzQgwl7//359obmEOb1hoH8NbeaLO7zI2E0QMnFfsTgnPJ/50ysfqFsRLOkJspw8O1mQB9NOBtmvx7GfzuCzM5lmprp3x+F5YDoZhiqmeCzLFYCL8kI4/ZHDyl8wY2vcvu60kdQkyFVEAq4gmnyzqwblwY=
Received: from SJ0PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:33f::18)
 by SJ0PR10MB4415.namprd10.prod.outlook.com (2603:10b6:a03:2dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 16:47:42 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::1d) by SJ0PR05CA0043.outlook.office365.com
 (2603:10b6:a03:33f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 16:47:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:47:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:47:07 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:47:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 11:47:07 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JGl31k220693;
	Tue, 19 May 2026 11:47:04 -0500
Message-ID: <6ea9a707-cb0e-4fad-b2e8-2fb9928b124a@ti.com>
Date: Tue, 19 May 2026 22:17:02 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/11] soc: ti: keystone/k3 navigator queue/dma/ringacc
 cleanups
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>, "Bill
 Wendling" <morbo@google.com>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260512170623.3174416-1-nm@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|SJ0PR10MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 4616aca7-50ba-42de-35bc-08deb5c65747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yEUilXSs4TrgQ87OPyu2Ofpz7WLmugR24I520dz6YIMPIlW+KLp23QzMr3p8DhyWF9vuXRHnd6G7apt8LG9aRXSqiTqoLYfgLkwpGRjFu/MiQ/sQtarRNLYL3VjR+p4uHmrY4JSbE5f8e1Es8YcRn3WpNYP4cKoi3c+ty8knGRHYcu7gBGhS7NPoRxwTMnrttS3UkV4BvDv+oZDDzm/75H1dnUqHTs2+H1L2QB8BwDMWF9KA0OfjNMmzyONdasurktoVTmAX7/WfN3K2TsSzw6fuosfe8rCoXbjwsDJtHMDh5PXH7pAVOYhNSzAnukWsRxaPGCHBJ5zLnipBSINO5FeGHyYfio8tpVZ6enOeUB5ivb20zEtQfmIyqni34cxakftDp1sjRM2UVhfdSx4Ybcvj5PPOuIDOQVcfwEzqDUqXzU8ZDIIJBmYtsqu5fXQ1nElQevEKkaXzsfwY0kKhql5zY/2/rnIgV1ZrtL+fI2lLled9KJu5amNGPuYD7YZzxZGyrilVpmH9zf4SCZHU4KkKgVvpImH+vZxcltqRhwalqYNHn5pZwQHVWOxIfLgxqUZ2Zr5hN2Q/+CLtPGVLoafUe9IuusGRBYVrGMqIAG8zgTv02mEWje075VOkICr9Ls8s/6B+FVot+mzeE/Jnomopb/xIKKtlxB/vqCGulXy5QpCNXpqyBTlldqRNA8o7
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zaZCfIQXschJu/RFcHkkQstOQZJf4R0YhgFKWgXIber1hGzHVkz7FlKnKXlCTandtLtqwowxRo14s+K+oS8eyFwcGAj85YrAJvai7WO9XmHniiwA0g0+42GEwGSaF9a6pqSzv7TjXKeaDvtphi3B677C2t8PFBaXgVc/cECy0GpnUax1qdNW3qFfKLupcXWqggRS43QjiAVfpBt1MHvN08xdegfaH/w3QmcsAIf98EMPJDG20SaZTtoerIsGfVssxOTxPva0YrX2l9Z33sFKEvS/LvOpH/8tWNWg8xl8wNgyaBAHA0TI/Zv33/8GehipySJDSZXOFDNfrNq51yw8X3UyJ8+ro8+Pgar5ianWFIla7s9lr+FefcOmRL4uSMHadl7S9g5BwlSkJZ+RuvwQWaVzA8CH16hC/0LGI3w7/erBCSPFFMH78l3SozT7RfMS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:47:40.4309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4616aca7-50ba-42de-35bc-08deb5c65747
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4415

On 5/12/2026 10:36 PM, Nishanth Menon wrote:
> Fix W=2 (clang/gcc), sparse, smatch and coccinelle warnings.
> No functional changes.
> 
> Tested: NFS boot (via nav subsystem) on k2l-evm, k2hk-evm and k2g-evm
> based on next-20260507:
> https://gist.github.com/nmenon/cff02a5f2a72fde5fcb49664fcc834d2
> 
> Changes since V1:
> - update for review comments.
> - Picked up Randy's and Andrew's tags in appropriate patches.
> 
> V1: https://lore.kernel.org/all/20260508153211.3688277-1-nm@ti.com/

For the whole series,

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

(I did see a few patches already have picked Reviewed-by tags)

Regards,
Hari

> 
> Nishanth Menon (11):
>    soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
>    soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
>    soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
>    soc: ti: knav_qmss: Fix kernel-doc Return: tags
>    soc: ti: knav_qmss: Use %pe to print PTR_ERR()
>    soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
>    soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
>    soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
>    soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
>    soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
>    soc: ti: k3-ringacc: Use str_enabled_disabled() helper
> 
>   drivers/soc/ti/k3-ringacc.c      |   3 +-
>   drivers/soc/ti/knav_dma.c        |   8 +-
>   drivers/soc/ti/knav_qmss.h       |   2 +-
>   drivers/soc/ti/knav_qmss_acc.c   |   2 +-
>   drivers/soc/ti/knav_qmss_queue.c | 148 +++++++++++++++----------------
>   5 files changed, 75 insertions(+), 88 deletions(-)
> 

