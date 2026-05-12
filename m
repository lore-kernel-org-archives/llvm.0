Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A433D9693
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605600; cv=fail; b=KNwvJkZ9bguhFd37E2diBpP2I6ZWNO5A+sTrSLwQUZFPxaIBIi4nGx1HnFCDrh51HkFHa9Q+INhoBLA8WPfhl+SY6Os6BHKHlO5KYbU2kyvbpH0/eUXk+z582B9y+HMFFC/JzbHYC4CNsT4+Sy7ar8cQK0BKd5vGzq51JKzyqi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605600; c=relaxed/simple;
	bh=unkx76aTh07Lwq8JwpYielYI1CXzlSVBc/VAvMrAUR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRqz0meCC4BUAVSDUeUBpT9VA6wMFYmM9TgYYWABOYvpxI4FmsovUloI9F9rO49LsShoxAkHH0KzhcWvtK2A/sWLlecXdtnGj4MBiYuFcT6ZoexXwQELET3IZinKQo+TKaCi9PjIN/l35T/HxuXNGFa/qv9KAw1tdXwUUjrQQ94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kgP0DEne; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kgP0DEne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6gY6RKo9rIk/xpsLkrS4TbOTs8OMeSpMqHmyE0ugSWBmWX9+SjmvyzhH+JHENj8H7a4TU6FXHlm3ovfkzDNF2VgWY6Z9sOZ00KEJX5J6QdBMZUKSTQvuloNowYfga/RFF7lyuZAby7A2hgjkjHGY2OOE6F6XnFVw6YdMfRk5Daj3aklMikRZbgL+sDvZNMRpJL074DSsmHDoe6QJ007fS7FEsXOufsV7lWcpBVgperbdL7Id6Rn64zIhk63kIm9QySrNgTuM4o6HFj1s325PiI7MHcXiznbcrX5kCuOXGWLzRYyXr3TTqIdz5gQKR8iP8ae8ncv/dVCZXaPsLmcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME4FtsGHKYZtRaIgUY5JetrUtilxFCYnQ85JSYG/qqc=;
 b=KNmWAgiDC+nG2/B+ho4yiWLQQeNKrRbN34HZTxUajOsT+W2Nixc02JY7Se1Lm2mb7ND4g1jiDxHJMt02eiYqJCVkI+GAewNswtKRZ1DYanZhR7cY8BrnggPP0CHarxQa/L1ZfMiDBOrkQYcEQKbhb7f0qsUilj+cuHm8D6SVN3236Qlm/4G0gOnV83AW2GvCXETo8Spi5x/yGWtaY3pCau5PoQbYPHK3vt6ukzmi0rsZignRdCQzQaxeuiKRaM2AUWRmjsgq0eMtUtssgnMEfBMlx0ebtyc8YaNMLy3BVC/Id4zhTMasb94KCONsVnl6NJXNLH9rBATEqlhvwMhdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ME4FtsGHKYZtRaIgUY5JetrUtilxFCYnQ85JSYG/qqc=;
 b=kgP0DEne9WJPtNIAry/O/3X9WyhEbTCYZNNO81QBs6ypZKoSSuvFzoVdGKqncCZuI6WZLXubFGMlq6h5J5sQU8O5s4FesVvrSYRLWVJQlv34tWi8TtJNYkA8p+1OT+LIzbD6XG1oNYDioPWpbxGkpsEgKx20uyQZTyQNLmNUeFA=
Received: from SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21)
 by DM6PR10MB4185.namprd10.prod.outlook.com (2603:10b6:5:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:32 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::80) by SJ0PR05CA0166.outlook.office365.com
 (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 17:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:30 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PkN2235132;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 03/11] soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
Date: Tue, 12 May 2026 12:06:15 -0500
Message-ID: <20260512170623.3174416-4-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM6PR10MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a06159-bbe6-49ff-5365-08deb048cfd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L4kPQO6lCGSF9+WsOnfOgieTmMcFlDGN1fMSFYzX77d4w3pygc1lrPJfjdUOnFRsOENYHbKyixcpKRhxAabkH7+Lm7a3LqUT2Ss5VDxk8OwGV3wZTjZyrBLnymoUiM/ZOCp7oQn39WPj9FA0hKr6E2dyBu4qD0OJzmwFTHBVD1xphMmVOubswVt5WtyoiQe6VX60rDXWj2fPQK2z9QZl9lIHpcf1SVa8ypFmIaf4yLT7CbADJ6jBbIgquRD0BXtO/5JrAYXZwDhvHNsbDPT/mMYy2V+tG0/Vf7zeYdlNhFdu34uR3+N/9Oi2tVij3ln4ldFmjeAayxXW1WAaWmz15mFqpJp5Euz/+S0rhRKwNmb7iAxeqVKw0FOl1/SKxRQtcK94CGVtKEpYBw3RJY6p312UkGfI5aLmRZYrBBywQJ1s/OAh0d1VnQcBIuRtNGGdQDdoIHb6aqp5UcfKNoYgRMvfG9+ZnVG6gJfoRzNOhTYDF28ifgBPG9RWG5WZbGIS5kRG1KIMc71Fh6yGZx2yZoDkVbuGMSeD4pfXHUefUU9m8w9yxOIhfejz9vVdirdOVFkTmnXITW7oLbtBaru6rDrXl/uO0xU8qmvQB9lM5kPOXPNTQfk40ZJH4cAiCURCgjom183qr7QM6zY5yM+v0xAy2nUEagUn7D6C1qPSETZW0tj51aj7VbFUIToV6KammXupQWPUzUxkEd8HUzNoz8DAAXt5picdxtS5juNKy0I=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kg2vmuCMkquu22UDZ6bPwL1yjib7mze0g+1HO94s5ONr9+gBJJSFrINs/GSOBeJ08i0eZaBa5lOZ+ORL35n2ii6xIp1x6zucVv8f4krzy6VgG+e1+8HIqO6x8ITgQppEt+DZY8uyy+CkyhM40ysTNUH52CA5T9FeQifjYLfYDFSiCzmdh0hno/f3KbOfguuj/biKOEwC2P/J2IgckrvHTSKRaIM20AmUAXYcDeFPFKcOXI25C9LGyKBD5oOzhVaPK7ku5x5yVEL6j74oFUIFNGMRMpsk7aJkR3erET6xa4UXDO3ypsP19Oe6L48HxbkYhLz1mIQVfoaw2RB2ytk71awV2atyz7hkxvQ9H//E4lWlVkDMh7LjlqWOHGHuKELAswvgcsW5py0gFR2yNKvWQoHfQp+z9n7HU9pBtQMl0dg3QywQjHNDTVGI0mDy6IVY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:30.2947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a06159-bbe6-49ff-5365-08deb048cfd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4185

knav_dev_lock_held() is a single-use wrapper around
lockdep_is_held(&knav_dev_lock), used only as the lockdep condition
in for_each_handle_rcu. When CONFIG_PROVE_RCU_LIST is disabled,
list_for_each_entry_rcu() elides the condition argument entirely,
causing clang to report the macro as unused with W=2:

  knav_qmss_queue.c:30:9: warning: macro is not used [-Wunused-macros]
  30 | #define knav_dev_lock_held() \

Remove the intermediate macro and open-code lockdep_is_held() directly
in the for_each_handle_rcu definition.

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- Picked up Andrew's Rby
- Replaced CONFIG_LOCKDEP with CONFIG_PROVE_RCU_LIST in commit message.

V1: https://lore.kernel.org/all/20260508153211.3688277-4-nm@ti.com/

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

