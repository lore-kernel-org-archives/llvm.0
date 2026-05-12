Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD23D7A1B
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605594; cv=fail; b=t74SwyodSEYIc+4Em5bKebJoDN8picgNNgvwdCa+2xpvRz2hhnqhG4l3ehLW7grU6fe54RE85XO1ps+4oWWMXZflfYM6d74o4QMlQNipUZCXpZBIJ96kNJuPDePWDmErYaprQ5IcDkWSG9CfFWRKrtYncbsVZev+Tocvh/tnM/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605594; c=relaxed/simple;
	bh=amYrlqJ/MpYKhT68BlkRSSWcTszkvj18tU+fz2xM6Gg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KwPssxUss9exWAOLYcHtku+4iFMk7eW4AHlAfzVVLDdR0GbTKr0eJxwkTUrzkXHqcgAhtFxlSrnf4Me4I0aY8L2pqjE+Oik7fC9PVkx3whqNX+iujvE0cYmxgv7CX/JhGSbv6Z1YL1V47PG6HlYwQH6Q4q+lIVVxK8+qN++vQRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OkA8Wmw9; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OkA8Wmw9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq6WsePIxU7V2liUZGt4Lak5pLBgM3fn5yriLFTvjsu5is9YqUs6tVkMaVfyXd14dAz3EWo/c//cBQRRlXMiqpRtzNecp9DjO6B+/U52E88zwMaVuEWIaYz+kjO0i4eOvpEaZFSqDtaKga6IZOeRT/IGlqWnuAW4908mfE1NKqzIEvlTZM0fLcFrSBebkdkkFJwXw3GVti+mG9cT8/OcFomT9DjQdU2zCmzh5B3Z+m+oK/s2rIHAGrbul95ctPVlDM4puFvublYrryH0rgyZx4PjUH5GVnWurqP5cwVY28wvzHBd1JI0yo3uagT5VCTF/PqcfjKMyhFNCg07LDQOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+ev741IfAdiFLbqHfFp3gCJqNW23cVxU94J2A4NDP0=;
 b=Yum2AeO6IwGmOFnmECyijXPF3shXapPwQUUGGSFmv+nMA9RZySZ0bJogIVLE2rLqvIkO4l0zULq1q5T/XoNi06uDFKVOzy4cezFZrM8755utNUq5jXoTIvrpORODyzLPvUk3s/eopKEV0RS6ac2bWMNJCFhclvPXgeV9+MUCY+8s9I0CnCI9tK978dUx1OC4yb6V0jcluDIlfBNSXvD3RKIKuCHpFZUOfdBfkH/ODNmY7yfwNxAVPEs4RYkTgSOuZGarm9vbqCCP/gkiPhcs350hUc1GjlTUHSrIH/lm02cP16opRsEktkhkC9hX5f1ImPj9/2GT78Uil5ZmyTEL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+ev741IfAdiFLbqHfFp3gCJqNW23cVxU94J2A4NDP0=;
 b=OkA8Wmw9S4pVQWzOAlmP0Bi0ZR42zwIKkAM85dafUwkgREGBOM6mXNGDKPWhy0qCZGf4F6RjQiUv4OyjgUw1D2R7oXdq7CBPSCaVgfPVZ+WF1hCJB3MJoZvRqm1cbvZ3Cc3hfOrECIGi7bOWpJgwZYXLL/VPOw1ispa+wPnWoBI=
Received: from CH2PR19CA0008.namprd19.prod.outlook.com (2603:10b6:610:4d::18)
 by MW5PR10MB5690.namprd10.prod.outlook.com (2603:10b6:303:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:27 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::fa) by CH2PR19CA0008.outlook.office365.com
 (2603:10b6:610:4d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 17:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:26 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PZ52235116;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 00/11] soc: ti: keystone/k3 navigator queue/dma/ringacc cleanups
Date: Tue, 12 May 2026 12:06:12 -0500
Message-ID: <20260512170623.3174416-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|MW5PR10MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: cc79accf-ed9d-474b-47c4-08deb048cd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BZ0KdnAvMGdC6qdM38QSZKLgRILHAv53IqfeAdBhEH7UZ7DJTY6xBfd6nRJ9azjowfz1Oys+8VlusSgaxB9FOErEZggxVmcyUVGRQfb9eMAUA8/V0rrrpSDI91D4iUL/MRIQc9C+Je5YAKtow6ieLJ0UTr5mvpmz2wPO0MmmtNbLz3GSRn6gbNmvpbvd0nmsdL/IUC6+Cybi6QW8FWPi42k5B8PiDRoeJi4wLDztxFlLVxlvjdkKeLZxCPxBzLgolDYetQ48XFJNWc4e5cT4qEF5pDl+AAY6ltqqQVjx8I8GjQMNRZyFSUIY5ZTC0bHfX9MeXw+3Fb97UoDgaA3lYJYm+q14ZLgwOHtd+izZA3NyOpwONfxsSZZVnIXvRe9PojdkxnYF+KWmUdXrngYI+smuAEEWtIOmKgKlml6BNUb3hiapR1xh91Rm618DwJ69VPqiSrH8fVmzzkq5f+Vi0Pm0a9qvyEJHIdbD+Uqgmje4HbeLccWMgYPSsm8xAUU83BAa0Dk3F4jCN+QMrrccyuUW/3yu9hBUWkTVBlsS72pQUlZRYiB8dK37aDqtZM367Fj4ISf4ehbgJ5yRsMqZ21qWfzb9cIRVGCZLt/x39OnKRjtv4m/qsHxAPwGk+K+3jC4fo5HWaruHh3Im+t76HNtv2jsp/heFIjCcx4HjanUfiAnDIPWxEybol4iarb+Z
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VMhd+DlH/Dlh8u8ImLySxl8+Cd5Q3thkByjBVWcPy8NDbRXF0fPk4e5CF+5Vmlfbbo0tH0CHzGU+nDqktqIJD2ces6LbmmjnwiBK7qANVowgteUUVxvwWKdB++Irkw0Jrs0RUbUWbRSXWIg/YJ0q6TsdYBn0KrEw6KKXfj7sYPLdsSH5PcLFOfmT+eJm3/UCTVzz2zMeE7yGYxN36UstCrmdVDeBdFCCSwOcMbL9JKgaaefLr+vUROTLwQcFwawjB3sJu1D7H6m1v1Sj7yNCXqVgax5BKUHdRnf9YUHlmJXXtaU3VYZiNNh8SpNTdYMgVnBZAB52Qx6ro84LqI/qwsR2a2pQkWxQryv3JP/EAl1+2pU2RElzQMNB/EAN1Fgr82Q+KAmoEhbmx7XW4ROcL6oLbs+Mhd2K+VqosM7Bh6DTUA22Fcj5ZnONsMP5aywm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:26.5308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc79accf-ed9d-474b-47c4-08deb048cd94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5690

Fix W=2 (clang/gcc), sparse, smatch and coccinelle warnings.
No functional changes.

Tested: NFS boot (via nav subsystem) on k2l-evm, k2hk-evm and k2g-evm
based on next-20260507:
https://gist.github.com/nmenon/cff02a5f2a72fde5fcb49664fcc834d2

Changes since V1:
- update for review comments.
- Picked up Randy's and Andrew's tags in appropriate patches.

V1: https://lore.kernel.org/all/20260508153211.3688277-1-nm@ti.com/

Nishanth Menon (11):
  soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
  soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
  soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
  soc: ti: knav_qmss: Fix kernel-doc Return: tags
  soc: ti: knav_qmss: Use %pe to print PTR_ERR()
  soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
  soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
  soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
  soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
  soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
  soc: ti: k3-ringacc: Use str_enabled_disabled() helper

 drivers/soc/ti/k3-ringacc.c      |   3 +-
 drivers/soc/ti/knav_dma.c        |   8 +-
 drivers/soc/ti/knav_qmss.h       |   2 +-
 drivers/soc/ti/knav_qmss_acc.c   |   2 +-
 drivers/soc/ti/knav_qmss_queue.c | 148 +++++++++++++++----------------
 5 files changed, 75 insertions(+), 88 deletions(-)

-- 
2.47.0

