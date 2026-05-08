Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A122E2850
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254354; cv=fail; b=Ryzw0MmCixBXirv55U3nXATVpVHOaq0F0kbpD3HSlubRRlAQY3hLd8PJ2xAu988P5vA8QuJlo5pjWjhm81FPLLzVFSHHu+1MEjiFQ0i+tFMznhICZUkNAJXC7c6QwPAvs1oEGJ0qwwg9qFEpX3MQRly7oDIERX83aivY5cJsNwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254354; c=relaxed/simple;
	bh=K9IfVpQgo0JckYzJADwsJkFB/wHbN5b78iao5NPuL2Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVxc7QIAwaxppBVSxh0v6RMbW3PcfoveBZTR3wBqurrRIDrA5wDVlV9DB0OTySGB63XCCtq6y9inl9Mh4vUxXXC4s48l5D2nwQ2itGA+owvp0oKyAkypAPkZPxA0HCOrHoBGKfR24OLz72REfRKy8mo19ZouWx0zGa65DLRNaX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uENuNkhf; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uENuNkhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLXILyVYwngw5eXqPErG+ds1R/T6yNIxNIFGDrmhhIPvtiV/gZI8/EztjEX+LCH0b9sWtEhK5yYFbhlKQGG+jzzYgAXcSJ4OV1yJOqrIJLNTd4EJFdPtMYHytBY5MYOTWa+VmmDZ6Iw+tG2qiIPRFMHm7wZBqBU/59WsSfRK6aC0WtVqLEljtAIj6EkPwlu/RPgAK+LI13vKkf89Iz/NxvQPEx2xoX3f/n8ZJ6k02w4XWdPm+qA83fN0wi3Yjk0eW1MIlH23sB81qkRpAai2b0kTEHgO8qbLVCPWw/XyHGpCeewz1issXUf0LHemRpfnB8jm7zFl8hXXhMN2/cJ9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=;
 b=PHGPiKOHvow3sRUJkAnvjmKxiWM9bx/IyiI0toa2w0y+RKwEx5WWrsiOASUjEoPOykwJr1y2UZ3azvwAUPAfTyHg+maX3oerzyZcpV+I9zEPGrut6jUnnijL7x0zz1zbitI9zXjciz2+DzsFrEKRz+CnbZEBqS5iPyZFz/Jv1ciZ8DSadYWU1Z8sKyj2SOGKdWPwIWav8VpeQMz+jmyZROCEJeIwZP+4Fg3LH+CGEFuSmuEaaMeMWi2PkAOWiyiPjS5nf4wemeBHFBN9S8lsg+cQsVLyZwBKoUilW2yOYciaX2jhbMGmNYCwwcP5GW0bGmvoG3ptckCb4RDwosXvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83DMdZZrXbubodraG1MuTdXJuELcJZpN3b9+RE6+HLM=;
 b=uENuNkhfIfdRqIX6V5IDMCgmgiMwt+tPG2Ii+HiIgn7MKyywmAb6jtO+AWqSByOnQsoctUgA2Q8UK2GgV5urhE3Vvzdj+inClJqtpcd4DDU38YvgKyXDkSKn9wjQ4iGNIKnisHJouZZR7ihf1slxVCMyOqIS8AhAalC9CxUcel0=
Received: from CY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:930:3::25)
 by PH0PR10MB5871.namprd10.prod.outlook.com (2603:10b6:510:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 15:32:29 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::fa) by CY5PR20CA0024.outlook.office365.com
 (2603:10b6:930:3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWFWF1961990;
	Fri, 8 May 2026 10:32:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/11] soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
Date: Fri, 8 May 2026 10:32:09 -0500
Message-ID: <20260508153211.3688277-10-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|PH0PR10MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 8093fd6d-37a5-49c9-b579-08dead17038c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y7wLVcbPC3B1lnltwpKRJYMH4sqZHS2yocDR6ywHy2S6zecOXhVJTHtar+VF+79AubiYRkDQeCj6TEkSWWN+3EGvdPwXX48oOjUe+vzu6BXumcGC3wQVVdmKoyJT0MZMxb5/QWDtsxb4EIGT0E3LeFXDZvzWewxZqXPeD7Y0VtbMOcUfG4WuBzf+hP2X3bi+uhhsa1xY2CFlRVXkejeY5zsxpjqdTnVNNmJbveqlyGQ0aKrg8tkC9tIBTEvdUTvvEJatngNbSUGukJYb5aA9W5d9riHLaUNOrx+GpgiRHCuarz0q/qti77MpeF2dtk/KlbO3W4Zj5GdVrYzjmrqgRiLHMFoXdFpZhAnw9ZDvPfTQ9u14zkoA2rYggOgx1jBhvq1obDUIWiRpbAcaPIJ6+hyNmTnl47Y+bupsJyWFlzPF4DH4RBfayV97I7SqiMn4vXv5Jj7LqelKPsoHOJZPK61lFwqGEbN9KmmTgMExzaTGxnoz3x2RNDNN8K0NNIwvDpJvbcEQxl3dgDRJ9C7xnTImKDR5EfdWkcFqixHtBZRwye3sXwy8EzLdcv8YUR7XITFncYMhKiAUFNkS5Ql2hc4XigBynGwZLWP58EbtNF7fsaPZWaKfbjK9iRw3XuxXCwqZ8RO2VKDEheXSr/bKzYWUxjnSEWh2T7e8ntmY3Do4N8ysLIKKqfJDCcEvyFhzdDNJLVsp/yDM99OgpDSsQVDbJDI9ztajnStJWSSMjQE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ud3ahpRE4WNlGxhQZn+t8roSiQQGFMHW2GUEzRt7tcC67ARjLkh0YQgvdwg+RmQGgY3rLRkj/dvzF5LsmgUAhrzLsLeVxWsYEZmzURKcWLCgfXkGTUytkcrzoViCXouqjGnC9+FpGPbeAQ1YpswiA/RMS96LH/eVGKZmRWlVVME686UccKqu9qgQv6AOOGFRKQQt1sh6oreVPp9V3N419yXXW16WL+Swc9uKyihZu+xIn9kdJ7tZug2QI5qc35N5V7Qtq3No7+N++R4fZuo61NtHAaQNjJUmgaFlfM+HKtdkAFPEPXywyLBtuE9kpavmYWUk7RF7F0MzdFIHNofRN8DJNjAph2rSVm83w7LNClOwRnhGzM+A7av1h9Q4ZoffwvGVYbuKF40nt0EKBELrlYG8CWoUq1gqauG/A/R/fkzplUk/9UpUnh1w8cs4rO+N
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:28.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8093fd6d-37a5-49c9-b579-08dead17038c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5871

smatch warns:

  knav_dma.c:390 of_channel_match_helper() warn: unsigned
  'args.args[0]' is never less than zero.

of_phandle_args.args[] is uint32_t, so the 'args.args[0] < 0' check
is always false. of_parse_phandle_with_fixed_args() already handles
errors by returning a non-zero code, which is checked immediately
above. Remove the dead check.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 462d181ca564..7ba6fd58e9ce 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -387,11 +387,6 @@ static int of_channel_match_helper(struct device_node *np, const char *name,
 		return -ENODEV;
 	}
 
-	if (args.args[0] < 0) {
-		dev_err(kdev->dev, "Missing args for %s\n", name);
-		return -ENODEV;
-	}
-
 	return args.args[0];
 }
 
-- 
2.47.0

