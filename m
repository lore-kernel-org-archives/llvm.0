Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC973F413A
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796318; cv=fail; b=VSU0ao04i7iYLKipx8G5KxOc8g022VcR8kNVmffg8cCXsQ4vODOAcoSlTaGNW3+3IywcavEDWIwBT3k6fgHkOORt0B2y0zYqcImHWxX79ge7fau3xuF5PplutQlxZj+CYMmM2sNO4oUKeGeYP1vkuZ/1EALgJCB07g9D4WKnrs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796318; c=relaxed/simple;
	bh=4+reLZDrvWBLNu+3yXq9955bDCtDOvLGJjp2aKoTBxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BipYk3OoSJ5GfAS0VNRI6fxbitx7kaSbfxwSWFqcQXfrcvSBkcPrAzvKnQoCcvmD7/+xQlHyG9TklxiWIBZv4vvR+dj/Y1p00GbA/JjAvd9QlWGGgVMEF8pcOXAcvJszqfmzASs4bfYbd9S4ISfsL2LT4GZyA0oya4e1UeuD/pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KRH2zKvs; arc=fail smtp.client-ip=52.101.193.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KRH2zKvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vrxi7HWn1lKJpbJJJkuwS1xogZmSKeSn4sDQoLa8+L+Tp45MgHu0DOMK0IK2PFLstegksor7ennV2JN2N+ECvQo9XOw3JypBxUhLlSjAClVCGDU38RMxygH+4vFja2r8w0Pf6AmNJl9c/xz4a2rEusj5nOYG1UuskHOd0t+kWBqdGOWvyd+2jBWWvJVhmlujMYcLLJp0kgaQNb/b779lyktnC9t2IyjnJSiHNJ1tMWzsflgU37g8Oc+P9eLZ+9T3B0mJpBbUAxlJqA6cc51ACVZB9q+b+UGe1Oqcz87M6Q+PVZlQampMhIvhd8+FbcaAthjz1zN53uFwmg3XPTbfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnHL3Krm7ZMb//CUB+ItyHVXlpV0yqOvGMlYdW+94qs=;
 b=RosEhxRMljyNXRK6aw35eVRA9dCruzmmxMS1LAtuKkqmhYA8+kBrP4W/nBSr8siDaKYkCdm49jjks7+nt2E3JpDkKx+OgDarDrykggGmKa0iHfhuuuKs76g2eyos7Q+eceFJk00qXWL6rIw36R9HR1TFjWtZFrrlhHsVazBBIkGuzwbipKGjsak/O7eSG8XlaiPviWCT7Nzc0bEvdiXM0dZhqCT6w77/YJ0Ne1jZOVBrE0R9Pnu9xJB6E0WUgn8YJYEzQLEh3oEdbG/HQe+DzFcFy+6IuMfRDIcyAsL1BPqoy7fohuuXcXoj2gqedEmaFYfyKKWUORORiLgFEd03wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnHL3Krm7ZMb//CUB+ItyHVXlpV0yqOvGMlYdW+94qs=;
 b=KRH2zKvsEgbHFTgu3gSmJX5zLDCJ4OIu33BxpYgPnS9YvDjfBuTaXkid0pDb+xwiYOzyoUN7Od/amv2WiuMv39ljZk95jQlrqvD/ua2eTMmiJRbx0ZfZ0MXlF/ko65zGA/lm9QuuMjc0d1kz+aVtMx1tEwYILtpTArBTKdnc7OE=
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by IA0PR10MB7644.namprd10.prod.outlook.com (2603:10b6:208:492::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 11:51:43 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::4) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 11:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 11:51:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:51:42 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:51:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 06:51:42 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QBpgVG1352007;
	Tue, 26 May 2026 06:51:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <afd@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 00/11] soc: ti: keystone/k3 navigator queue/dma/ringacc cleanups
Date: Tue, 26 May 2026 06:51:40 -0500
Message-ID: <177979627538.2037951.11495500937235905269.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|IA0PR10MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e4fd8c-0073-485f-7646-08debb1d27fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GeFcj5/u+k4OlsFLDtIR2m1olokZChikHWZkq1uItFJt69+jDEMoBQfh2w/kV8B05iSl2ShxYPjCcQQomIqHuv2uAScm7Gp95tVGK/RL3m5qDEBdr1/0+8E57jX5cpn0p3Ocn0jx0CJjVm/Mxnt0F9GrAkNN63UH3NbK9rfrqEzuLRBHh/1ICyYXkhojWEdep0xjD1iQeS34ZVm2F0bJtizI9jtw9wLebaJqWuMx2HEMrpyX357QSCXYVsyr2Wl+YtWfLBU/r2Bt7a1jDdzlEyRyxs7ATjMNBx+CkqOiA4Ru3Ns4meRYUsK9CkeOQfuBE/4ZZNaCXsk2nWEz7nBXxDhDr5lIqjBWBmiy5kqTL/q0+X3v4KjmO8RAHRSVq4DEJ2/yHZcx5WezN5K8Ca02Nvo2feqN1yzDKjdtMWGxubYiMg0uT3sZ0sHRb518+Ntuvsn98O1Ef3yShtRDkx0XSK0KCF1tc3XC79v8sMqXT+RDNcpMQpJNEvr6mRsjFBN6R4vWOpSxQ2EgbyqzLwUvSVmcE8F1rzEYvES5iSTQVVOu8azfKB25e7w5RTLFH+11ozbp24NGfP58G7H9W4vK36sianrz0ljKqtfxipgwGXmckf771Wlryi0BjlG5OVeoO4mPwwegFm8EHpxp4pEt7Tzhkx7SHUqqxBPXnCvdDcT2iZhvlJ1TsENxfAJ1DKoR
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qWnQbT2SSgbITLZV7QMliQyxRzoH08Dbzdv7sG7PsRS/BEug6N//z1XLz4NiO7B9yOz5RUaHc6CA2dVE9+VA8JrqJwvUCbLcbZlqDKhaDK/qjcA0FV88obMtvhVzhCw2TaZWLCFyaTSLiwrwYLrV+G1km09xRbSHGRBFZL6bsYyEe8Cp8As8XiYrAkgC3yOwqIuqUYaGtdJmQu1L9m7L7ezzK9wchBsRcvqQJWEMFgQyoUOgRulRvWowDtf8hzOTuEfIxbH2dsh9+8Ev6zVd97nwK+cOdNbFViegIGjlap/ZzRSgvZepNWWKrmsMvJfC4XIPXuF2UwpDd+X2ngW9pT5jXEoVq1ARPolz1kB0RwBDQhhmdG5Am2ZMCIjgV/QPRoCeyogy6CU3hsu7B4g4bxvfL79W4ghjUKWlry65DPn2VEs0Uggz53MMB+X9V72H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:51:43.1135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e4fd8c-0073-485f-7646-08debb1d27fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7644

Hi Nishanth Menon,

On Tue, 12 May 2026 12:06:12 -0500, Nishanth Menon wrote:
> Fix W=2 (clang/gcc), sparse, smatch and coccinelle warnings.
> No functional changes.
> 
> Tested: NFS boot (via nav subsystem) on k2l-evm, k2hk-evm and k2g-evm
> based on next-20260507:
> https://gist.github.com/nmenon/cff02a5f2a72fde5fcb49664fcc834d2
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[01/11] soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
        commit: a76c24eb1f10366f128c621f876c20a13ae53489
[02/11] soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
        commit: 7db27a04fb8a33a7f9904961ee6f3c75f65d1118
[03/11] soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
        commit: b6542cf0f4d062133f6e05de03382080ad941c67
[04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
        commit: 7650590dbf12a3d4a3d302cd33ac31270e39c43c
[05/11] soc: ti: knav_qmss: Use %pe to print PTR_ERR()
        commit: a5f624c4fee6d7b51f7bc4bd6e213c220b610ec3
[06/11] soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
        commit: cb1a271a4f20faae9a10891bfae2b543778d2b4a
[07/11] soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
        commit: ebc1a345bf1166b22035f0cfbf877b9d0e80ba4e
[08/11] soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
        commit: 2b47cc255a952d3bd7ec3c0f38fdd81ccde3cb58
[09/11] soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
        commit: fe5272e13e34025a9bb10cc452805e5085492a92
[10/11] soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
        commit: 81f2c17bc0596f619616a2e85fab142c8316de85
[11/11] soc: ti: k3-ringacc: Use str_enabled_disabled() helper
        commit: 33050d81b828c7d699ad0ad0c7489a198c527019

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

