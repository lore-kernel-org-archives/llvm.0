Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5534F48F
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254343; cv=fail; b=tw2ubYPSnD/NJwS0d5jXVHzL6lz9zOmXTqZsDGZfstGvI/2wPlyBOSz0zjUU62wo2f8SHd6nBgBl+sl0YXfxkz9x+yhXjZ1H31ZndBLjlc4rEy9kawG+KRfaTPnT39hkDFPtSmH/Kr1/aifLNZrKHDZCRmUSNGvS/dgwBGtEv5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254343; c=relaxed/simple;
	bh=wB1cAEwt3zl9I15mjxw2GbpZlLh/GZRnqHV7uyQk6XU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0lVlIuvd7BYGTpp++8UNZAf1BomxHBXrZX301/Ge5m723CzwufjxmVL/5RII14fWN9t5cvnLeN1wI5RkhEF6RIcpbG72nBMLPa0BPNV0kDMiY9+fekr6iQBfJG57ds48wNthf91s+54zlkIv6kOv9v2UUte1taY270kvbTYfcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZVEhDsHb; arc=fail smtp.client-ip=52.101.61.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZVEhDsHb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/Ucp/LhufeCy1aF+V5cuRPlgne9EDiA74PyJ8KDg7AGTzFrofcGFS/oBY4/HRfv7iwbH6Vs6PRT95t0Cdgxwu63c4JK7qO8YGmE8YuiXyAUz0Q29FkQ2j5f/4OQP5CL6enOMZuU139aas6/o5o45+a0ydxlAJXVe4FdqfNulArR4Jri2pegrtRhI84HaGvA3A6Mhe0btX+yfMeQlUqePiLUF89LtqOJbep98qd/KYtTGNfXMlQKaKiOG2vQKb3MmiIa81spzV6E2yp8rRvUFjg8OkNGg6sjCL0qdNTZsrdbkUZb9SK+MXpLiDfCYmcE9BNrccoEHWvkOucs1b2KLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCoBY7Vg2ebbF/UP1l9bOG5TinWbL0YiTiEm14Rm55o=;
 b=IeTvwpVFpUncmgwhel82IEqQdh0Bgs8VY+rnx77NwFON5vV+/ux9DKW6Szbv3uFeHyZzQoDCgVEBr+LbJWjPCSP5w5u5tszT2fndLPNQQOp8yiK0Aq8trAsdf+VDCWAslXcJE7PIWwTn4/NHAwZ1j0UXb2MdIvhfsX46QuFRViwEVR/XmcigqbPeBOgrRXZM3VHLUM+wIH+A6WkUUOeg25zEs9gR6OrvBppdPio2gcvm3JdlieQViO6HkqPru6rhZzbbkaYc34a/8PRhMaSFR0EqSTClcomFhHADhW1jkQoN/hODXnqsmG3v7ReLLu4TaXnKYKkU58bsH7Iadb53ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCoBY7Vg2ebbF/UP1l9bOG5TinWbL0YiTiEm14Rm55o=;
 b=ZVEhDsHbQcqkVCOpb8OiSso51pDb0xldr/WN1/OsmdaIHMjMSy8QGOYVXPXdB9qHqfC7XycjUWdIp7Y7tbjtkAWBQI95FKuN9hNi1mjSDuxIwVsTozv05hgXpTB+Fla97uzqsbQ7VZguFrmmIAS2+u0hLJ+mzQTHy/p12mada6Y=
Received: from PH0PR07CA0115.namprd07.prod.outlook.com (2603:10b6:510:4::30)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:32:17 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::d8) by PH0PR07CA0115.outlook.office365.com
 (2603:10b6:510:4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Fri,
 8 May 2026 15:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Fri, 8 May 2026 15:32:17 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEMD1961978;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 03/11] soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
Date: Fri, 8 May 2026 10:32:03 -0500
Message-ID: <20260508153211.3688277-4-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcd8c55-cd6a-433a-786b-08dead16fcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OosTUbnJ8Vdo3nL8hXTBZdbuffAXz7YuUg7px9YkWgWGC13Xu9c4dCS5Bi2Ll52ptOEAjaWYOl8/2xLErStmchWtEsLOowSOSvKIT0alV5jB8p/bdJiGMDDB7+d5FAftfZpAJNVlN62kjX1n/JR6JAdIfgyQyq705rnmlIGByq7usiIRhMf68dIcHqVJVUlqWfN0I4ZBHzoNbJOx/nhjPHF9TT2NP2BEWcCqTladY0BxCLX1N9KPIeaI6Ki1qCWIRmRkBQL9kayOxR+ip250zxjgkpYeJaU0kiL17RDcigkDPVeAZJw1t7+MjgmIuCz0AjFBrNPp7UGy1U9jyRvyxgUWDBKKveomadbUS0QdXL+fat5Rxd50AEgv+D5cGw4U0ZWj0RZKMdW71rd1Hd/qMcG0HQoG+86jhrwRQgxble1bw4OqDSOEeESrGxNZoJRJP/Jrr2ZPS7AfxGCmJS6gfWU+25Pq5ckCwDI/Be+cj761COaJr7np2VK4ox+MqcCOfcDI/9cIzxnZVOjsasW5euOGWJ7wNrDzUzKxfkTKBRlcAgUPUoGVsLqRdGQwRLQUOHEN1rm2Umi/6kPzTTw2FdfLxM02fybMgGbA5X2rf7sczaXJwqWzgoOpMzmjkwsj2IXy3hx9/HFa9p4dOVTO3xTYCD/a7wsyp1RV2uWv50H/ro/pKFXgZP7oNTYVxBdSJraVeW24Hjp7nMwXhYOJ1if/GHCA/7F3xQfChslb2LI=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1C6RXErMyBFnuDwdL+6twbd9fzVHKzfDVVyd+5nVEr7IA+5vuBZwR8BSMcEuZqtbtdZ5TMy5Jk2KZy6kTL83WW85WRcYK8DhkQTIXKOF8177blIMRklIPIlAFEE/LXZ0ISUrI6EJ1on8gpot9bwRQFIKwT0b4A4JSzBS0GsIRWw6hxTD6tVn/lm3eZIiO7SLmUVNJ/BzOxsQqykBK2yXg8DEpH/rYlicmjI8HcA4IOXipJwhdUY0qnU2GVxwT9rXE6PX6BRSr9bbzjXJWkt43UEVaNhaH9ZdgG4ZMpL6w+BCyRMIurGqW5jbsnV+s91JKRDrl6lDA+RS1pVly48a2ZYDNdrOJJ32P/wtGJ+2FebZ64DZfzb8yf4uc7/1VqM7kEMGroWoNFV7n2hQJVotziPyzrpnfNWiAQR5Nm7MmIqpXuDEDK26DbRuiV2K5rs4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:17.1750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcd8c55-cd6a-433a-786b-08dead16fcaa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458

knav_dev_lock_held() is a single-use wrapper around
lockdep_is_held(&knav_dev_lock), used only as the lockdep condition
in for_each_handle_rcu. When CONFIG_LOCKDEP is disabled,
list_for_each_entry_rcu() elides the condition argument entirely,
causing clang to report the macro as unused with W=2:

  knav_qmss_queue.c:30:9: warning: macro is not used [-Wunused-macros]
  30 | #define knav_dev_lock_held() \

Remove the intermediate macro and open-code lockdep_is_held() directly
in the for_each_handle_rcu definition.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 2c103bb6edef..f65658014b05 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -27,9 +27,6 @@
 
 static struct knav_device *knav_qdev;
 static DEFINE_MUTEX(knav_dev_lock);
-#define knav_dev_lock_held() \
-	lockdep_is_held(&knav_dev_lock)
-
 /* Queue manager register indices in DTS */
 #define KNAV_QUEUE_PEEK_REG_INDEX	0
 #define KNAV_QUEUE_STATUS_REG_INDEX	1
@@ -58,7 +55,7 @@ static DEFINE_MUTEX(knav_dev_lock);
 
 #define for_each_handle_rcu(qh, inst)				\
 	list_for_each_entry_rcu(qh, &inst->handles, list,	\
-				knav_dev_lock_held())
+				lockdep_is_held(&knav_dev_lock))
 
 #define for_each_instance(idx, inst, kdev)		\
 	for (idx = 0, inst = kdev->instances;		\
-- 
2.47.0

