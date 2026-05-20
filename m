Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567503CD8A4
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273010; cv=fail; b=hFYiN3bylfvUNBS55D8c3RFf+17A+sgxjbOjuWxAvBH8vzQepg7RRtpwbVW31ZiYM6+NJyQYrawqVheNYpoQla6+qqdFzmyeKj6durz0pZxRyaEDgXYAAi5475G/X9v5SfboXq9hVvFrXiNHTgJ0l7KEPHrLmVJb4PZrywlGpgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273010; c=relaxed/simple;
	bh=7am4FG20vtB6W6c07YertikF7HvkW2AJvf9w6YDi0EY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHHClkr1xRRoinvqBTOsx7MZD8qX4u0POD2iJGDDy6J7lNv6n5etHoTIwJJ+mrSGBjQggdUjKOJKIhfj03lk1KvkppAK8re5tTKWdLklF8bwcImQdamfMTzeV/m1ReAQdJqQ0SWeDWZVthsN0+dtqkx9GznQlo+ClCf9zoCsnbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jRyMfQul; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jRyMfQul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9bBLwzDjMHyXRF5TQ1GM7jukC/ypPjwczcNdwdELyp26EAYVHzQYyfNTfHhNu8RDwWGfN64sCfpklyNm6peTMGRbCz0xGsYSAVqNHliRDg71KChEEmFY7EKTPNjeyk1/LEMYH/9ntxPD/mfW5vXNzjH7WjdDOggMPJpSUuJywxMkYc3bXBP4yPUgZdH7/PBU9+Si0Uv76ms13vgUUXbFa7/sE2XnISSGwo/dc6popXOf/66B/6pbW4jedLUdVm9B5DQzddOJCeHhrYFJDuMEPShoiQ2+BbP3BPVcNOsDoXSY+l6zgYGvcBiidFz7zbsOqRCvJzZBsafvRT04v5RYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJpJbMBxvu7YERy5/zYTpwBl18eXUjkzox1436azRwI=;
 b=KXb5cst6Msu49trgLaKFyDiwxxBxOgV2MCzXbaPIw/QC1ymbrTE4DxgQFqVNe2fFeOsspeTC95mKNFtOInE8ll9NrLc2HF/Rc96HtBMYJQH4twbvxBGQJGgel0+c/upCI/uLVFF/JL0Ep9xF5LuZ7pGqFhsTE1W4NKMWctXhPImrN5v5mDKwA/Zg/7WMvlOY8NUHOe/FPPsCmdIKKTFwqq20hiW90e9zKgemQ8EgoyBCTDg1ACceGOMLiwHoGVaH8j8kEucgY4VtcqDxtKa0LVn7KHdFPGnRcBrgO4mGUWpcmz2TSQC2V61hKf8pft/OxDR7qb+CP29CYBMJQYmDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJpJbMBxvu7YERy5/zYTpwBl18eXUjkzox1436azRwI=;
 b=jRyMfQulojOJr6rQ55aF/N0wlKPNnHA5XGLU91I4Nwb00fS3xuN97hERTqq0qEax2jhL4MQolGgZBtrZzrsk2m2w7wmUgmbHKhPSxI3dc35blr1QiTEEeK0TgZzTn7iU5dJx0ebLNIoS9m9qkGLsX3lDa07/Yv34+ytcw5HtYq0=
Received: from BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47) by
 DS0PR10MB7271.namprd10.prod.outlook.com (2603:10b6:8:f6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 10:29:57 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::a8) by BYAPR01CA0070.outlook.office365.com
 (2603:10b6:a03:94::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 10:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 10:29:57 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 05:29:56 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 05:29:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 05:29:56 -0500
Received: from localhost (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KATtRr1263009;
	Wed, 20 May 2026 05:29:55 -0500
Date: Wed, 20 May 2026 15:59:54 +0530
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, <afd@ti.com>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 00/11] soc: ti: keystone/k3 navigator
 queue/dma/ringacc cleanups
Message-ID: <20260520102954.kgrfn7f5halwjlgi@uda0498651>
References: <20260512170623.3174416-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|DS0PR10MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8a8b1b-9df2-43c8-beb5-08deb65abd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8BelJF08er+/1pXVB7gMLAfvXVlzgUKZFHtZlNfroV1ef51A71farW7w03pAYGW2tyLk5OsNRxF7iQPSlwrWSUSwTJ7luRJfEBR17P/MeD8OlSg9ajmzsLFl9qR4wR9RwkTj9hbOUvHF7u4zQB4H79gEt8ssR1zj4yqAgrXUuX2jWA+2eNseTntnw0obfDBLMmAN+0Dy5xtuK5+8yhqI134jZxYoNywVCnmy1DMYOO7VYhxHE0WbZm/B+RpL4Z3DTb9KYmgg66HZqfTuh2OPR6+EXG4pfYnJCqY/tlhIV+v0ES+7aNwiVHdgsCzXHUFxSIkPR6ZEkm+/oowXN29DOc8VYAivMd0xq8cXA46OIxHy0/UJ70FXQ+1qQXVil5B0NIpPvlCuUGEEs/oBgA14rxuizIYxvjOry/SDFOsRpYV5JeJBJx+5qTQR80XlQaEfPWijyjdWHwbNjlRoDLXzIkbcYJ12pXPAwD1fVsQQ8HiAtF4DZmwm8BQMM/y1u5IAQCfDGAgrbJRNVb1ajsMP3g6oNjhqRGas+A0ZZzI5fF2v1paIZjk2SRjgQ8c7OU1W/cNzl8YWYyjRaSkkH/XT5IsU+rKy4A58UrA35lTtQT9kAoMphyqe9y+53emN8jqN4Dg/vppzH8hVxqLn4+pDenT3VAVNRE6E5K2eM4ctFi2C2g4RzCrHj4d+wJ4An6s4
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NZVvjYEg/Q2TlzhbSJRR/IN2A9veMgrRoBUpvGcb0OhnRV821pYAyFCP7b/UpBOJemjmv9CwBZ6wR7aoZ/KzHhLnE8A6TH0XrOvHYh0YfSxZP6dojjde7CL2rvUUGj6NE6OQZtCFYZJGdUfUbBzlEzhrGi5qgvG7VsB+6u5/q8tETf1swPwMYcCGrCLrpUeqBUgMyNuxKbmYg3MDYE3ur8IJYDFOKpVQeQuqbU72r+DZlulEecGoqHNm6FD2xarc+uDdHCJZMXJ+Kp0K4K4O85pfnSVH5LNwg/Kxf1GsuMDUEZcQB4awSmYMzpeDuD/wHHfeny8UpdCQ63MTBuMC47Od6lbqr/H8+cWeUuPULYBhyywSObZRweUWzZEKwTV3lwmmvNHKlaLQ1H7PsPGr00LV/4oLUkEdBh5m9eV5IL3bOLjAdzC2FRwAmyl1qAqD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:29:57.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8a8b1b-9df2-43c8-beb5-08deb65abd58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7271

On 12:06-20260512, Nishanth Menon wrote:
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
> 
For the entire series,

Reviewed-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Regards,
Kartheek
> Nishanth Menon (11):
>   soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
>   soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
>   soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
>   soc: ti: knav_qmss: Fix kernel-doc Return: tags
>   soc: ti: knav_qmss: Use %pe to print PTR_ERR()
>   soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
>   soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
>   soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
>   soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
>   soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
>   soc: ti: k3-ringacc: Use str_enabled_disabled() helper
> 
>  drivers/soc/ti/k3-ringacc.c      |   3 +-
>  drivers/soc/ti/knav_dma.c        |   8 +-
>  drivers/soc/ti/knav_qmss.h       |   2 +-
>  drivers/soc/ti/knav_qmss_acc.c   |   2 +-
>  drivers/soc/ti/knav_qmss_queue.c | 148 +++++++++++++++----------------
>  5 files changed, 75 insertions(+), 88 deletions(-)
> 
> -- 
> 2.47.0
> 
