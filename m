Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AF363C6C
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254347; cv=fail; b=TbHxDSogjwINBbqIYqMs6eup56EKWAvBoACUSI/Z0R2iCzeVnXR+krYb/TIyBPRXqlqWon7b5JHA+Mh8UsHRKWbKU/BQ5EJeOIyqsQZOQpOzGbBl96II1X5qZ1JN7w8buTK1/SAZrZEy9gd52iQvbavWodpz0zRQFw3iiuNNiVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254347; c=relaxed/simple;
	bh=JiGGqPH2dt7oLGHILmrowKGD5m5ZZ3F6cLy46OpvWQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GujXO6TqaanDDZEEw9V/RReRZfpcwD/xGX+qmOBET9ClId8+YzbGxI6RuYFP8JMGV3JJPtqxcqZ9FguOivVI5viNPzECIa08z4JEHCZ5zBtCG1iYywEfVMFcwQe1aqbHIluvenZn1GClnMr8hzxxF+ukYfUIoFmnu+75fixfquo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mOnhk9Fv; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mOnhk9Fv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgtQIsiV0LCzHe0tS/TklBRM7uPBHqI/4vZ02rOnvahwhm2NUtH3K6s7NrQ1rmvYiusklvbdNmwWEYerZ+ihd8fqLNJzh13D3Qr9R87Darb5eXLPDic2fZCQpH/88z3lN9IcaS4tgctCd8PsLExN1f1US+PPT9FFHc8cjnxLtrrSTxaTsncGaUUtsR2p21uS02jAkMUh+NIrmlI7N0JlLOSBevHqZqCZ7aVeQE+XsI+478h66GeZwHEQ8a01sU3AVyD6tqe2jtgDxMdNvDXLh904aYuMGsGUS55DBCSKXmU+SxNVfMjJzVdmzZmYv8H5g0T0Ykue69cibnobrdkrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CU2rYv9wmYiY3CqtTndbC82uSau77ljkX+GWRkucq3k=;
 b=tMK7rxPpawtui+inWMQozgvrGrWUnsrq/Cug4CWqkP4wboIFgHSTFmsZCTo3bjNwvSr8kKzOz5rMLzHzLFACKLVyBvMX6wsmS4SDLBqTK50nAboNyrTCQWf4OGTM5OgoqvyJJZCYbsYZjxqCxcacYkKS0qrYF97KidkwDxdvenb3SxE1LIq2Etxn5p7F91Ejllxfka5i17TteXxPY6DrVLfLDIH8DLShr7erYRHmwuNxW2soxR8STnOASQJZkHUNpMCpQK2VHyBf8oQUBddLlVH7wD4y1GXQeFZBMVhP4xV/p89QU8xAESvPnFqYGa/wkjs1YGZV6pTZxWl0BdX5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CU2rYv9wmYiY3CqtTndbC82uSau77ljkX+GWRkucq3k=;
 b=mOnhk9Fvx9YlT7U7QL2km/O1LXMVO/86RhmJ/g4QhwopHPbEJk7o/voTNKY0lSwl1yqGFUIILlFrgvxr9fmlgyOsLvJKwf6wBFLSPadkadweI5GrVB8mw5qIBT/IyJuHx8k2sJQuq5OCoko1SoPt+6O7jUNHqgGx1q0Z7uP9p2o=
Received: from PH0PR07CA0104.namprd07.prod.outlook.com (2603:10b6:510:4::19)
 by CH0PR10MB4985.namprd10.prod.outlook.com (2603:10b6:610:de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:20 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::36) by PH0PR07CA0104.outlook.office365.com
 (2603:10b6:510:4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Fri,
 8 May 2026 15:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Fri, 8 May 2026 15:32:19 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEL21647278;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 05/11] soc: ti: knav_qmss: Use %pe to print PTR_ERR()
Date: Fri, 8 May 2026 10:32:05 -0500
Message-ID: <20260508153211.3688277-6-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|CH0PR10MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ec3345-8fe3-4df3-ce97-08dead16fddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ROBN7B/EY1R7eM2Iz01ewo1tlmqowmwS07K0EYHTll9DXU+KHsLCvtC67VcBDAsnaSOKnTZHta3Zz3evZ/ZQvb4zwOzy9/kHnnEZr3AxujXXi5jIaOGdAu4DE5//C6POlIl4x9D4ZaCm3HhKiqZBXtLEjcffs4ObxkmRR6VXxu1SSk3YqAy5Fg9M1WPY4PBxXt1NEa+Xcv0LQN4xvKUMvBt0+hrL0HryVFWU675BZ4eNL/pP77tS/gDyuVg+7otGtVasddxR/jymwOfiM3kV/Lp88rLSWUQVRcCpbtZYkZ7h4sMqypJAwMCrByGgkyjAFLEssIDdSypmIy4qFNn1WGO2xpBADQ2PW+znLEf8z0BNQHFjmsdXjRBNDIBJ/4u7Kf9Nhpa5XIJp+/F9I6JRCaxDF320EMrQQeWr1Phh41exKVMHm4AfYGTElkc/Q3ZqoUSr5T0KVSg0Hk3Czt/GTlv7WCswmXvQDYOpV+y5+fc/zVNVp/G2QN04ypR6VboOuTf1NMJ22eWQhleIIA1njVt+nyBFOqwB6m+prnvOuOTkmpwwaKDNx39F82asutELbyACXKeEMTF7aJYjyyQ8vN45ukwjzZfAAyt/EDy1y85vQGrC0NMwoRqv5K2zAD8zZ/Lfm4VQGppnxgecnCCwCMh5N179nGMV64tEvXwlOOSb+fmImpGuQjy78UfKRtBFC7AVY3YxIDt/c6UU+h68g49g5bcAN+e+FsgBR3pt/gM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t9gmuqukEbodHUA4/NbpP0+lqFobMHKo5UoSmpLuVzX6x48dyplBR1tcN5uidsDBvO0qpykikSFAE2kbwADrf5BlyhnkdHN+j9QGgpwrj6wLUB+fDm8kbVv8M4UihtDEFLFk2tDGuYBipvKTCpbEINrbGhx1UBniOyTYBQpV5b7bPfDJ8hDDLvtob6+YDZXtqBV0Te8UGbY+9ADhclI8UHL93DKXKLNCkdVhDx4kcbQGRfs8HRDqFFvompRX0fZ5PG7Zbtvzv5F0yEpsJgZaENuGhrnDD6XRpFOQlW0Rc/1ASKbsmfoqMcjODwH9YchX0L2BgVI36ArZcFH29VnUwy4S390Q71ByZX3ixea+SBYcNt51rNxbMDVt9I4hVqDvlIzYMrbDTixjO0alLzJJSMv7E5JrYlen9N2kG0BDSnM20w2BKaHYkpo4/GyRqhxc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:19.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ec3345-8fe3-4df3-ce97-08dead16fddc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4985

Coccinelle (scripts/coccinelle/misc/ptr_err_to_pe.cocci) flags the
dev_err() call in knav_pool_create():

  knav_qmss_queue.c:789:9-16: WARNING: Consider using %pe to print
  PTR_ERR()

Replace the %ld / PTR_ERR() pair with %pe and pass the error pointer
directly to also print the symbolic error name.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index c3f85052002b..50072e9dea37 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -785,8 +785,8 @@ void *knav_pool_create(const char *name,
 	pool->queue = knav_queue_open(name, KNAV_QUEUE_GP, 0);
 	if (IS_ERR(pool->queue)) {
 		dev_err(knav_qdev->dev,
-			"failed to open queue for pool(%s), error %ld\n",
-			name, PTR_ERR(pool->queue));
+			"failed to open queue for pool(%s), error %pe\n",
+			name, pool->queue);
 		ret = PTR_ERR(pool->queue);
 		goto err;
 	}
-- 
2.47.0

