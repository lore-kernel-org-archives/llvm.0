Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B617A2FC
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260515; cv=fail; b=ScXPh+F8mzxhszXMU5EB+RlMcq+4uN8Z67Oj/Mk+D6rzJfNxP8eLxT3VAg6cb/Qh+sTj4NmF7jaBRBkm5HPCenQ0ZBiQWuUQOSK3KX0S+C79p8q1FvvZc2x8mNJHKTNiWE7HDzpv36KsFqueh2C+yyqABUka7ej6RGbaT4O925Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260515; c=relaxed/simple;
	bh=bWX1MC2OGv6/CcdCA7yfNp6WVinUgLbD9gqw9n3Mh84=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGE/lksqxavY1WXkjgJVb+7ctFJwGzK1TWZQQjAzITE19DR24p4LC7VePaWwaE7Zwww6ZYUlVV0UY7rFJO7PxmqyAO+NZogscLZ1pzemQbinVk07BD22xPsXGhqQeh8ZbMkCCgT/gvsOqe2ygjUCvHrFVMtjxu6jeZvvi6FYRgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TUa5dDyX; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TUa5dDyX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSpYjSMb/ERPu8+JBfpuJWvJryHpBfYQNa/hd9eIQjK4w1bRsOwuBZOqp0cJVHutF/f4kXocHNCxsag62rGcJp60Eq2iMjCXMbrkel9H9mXKo1zj3hDT6lGBfhTEFQECp3Q0IHVaaLtRfDTSl1donZRRiouc88MjlCH7T7Seb88lXKsi9R+rKWsIg8nytkKNSm89Cqgjggz90DMpxI/pdOn/wW8NWjWF7x9cfRL8y/K3d5/zKDwqCpb7W1wAKPVGhiumm0MEHge1oeoMauoxs7Qphy8cVCVZcYEB+g3p2w5gcz8lrEE57TVdSo5NX2JvQmMBURU5iAEG2klyoIYJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fEPIPapwiWmQTP+hFwhjhmvdlYv9/glLLK7fn8olog=;
 b=I7k/b+roKhJT+QGAPL4cT0uENIBEiLoO8ehvrNmyoET5E+BtpBvmbZy4VNqZBS2UOr30j7rqL0X7bYaGPVnm8T2zvkt8kyBMqaSq59Hw/a9t1SvXo5vFjZP85FsTbIY8PYxnxtyh9MsO6ENeUtv7s3CwTp1WmGmrmoEGf2n6dArA3V9DB9feMMDsrgZks9vjqz8ohkLcFhtGBvueKysi8p04j+FXV9pG8LtHSgp9sAH2yO1pwZR6N8XeB0XlNSUWOod7MXG4+Ws5G8vSsRCyGdFOWY0/ipvrDTGJbCrD/wfhihiAqUidrKiHmPxZqat5yOBZ7WHRV4v25oXkAz2z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fEPIPapwiWmQTP+hFwhjhmvdlYv9/glLLK7fn8olog=;
 b=TUa5dDyX7EWf2MM/PSJ616Rt+NsSIeAdxY+JR5LW9gNjrkTjm2Pmbe9a72n7kwbsK0hn3sL9cvLTX90DONfd9DmIfKHdt0KZB64IDrsSkXvd6RXFaOnZV3O3m3QJJOWKu96aAl93zcbzVMyBFWBWg/+60TQSWPlgzvs35Hu579M=
Received: from CH2PR14CA0054.namprd14.prod.outlook.com (2603:10b6:610:56::34)
 by BY5PR10MB4161.namprd10.prod.outlook.com (2603:10b6:a03:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 17:15:11 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::6d) by CH2PR14CA0054.outlook.office365.com
 (2603:10b6:610:56::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 17:15:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 17:15:11 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:15:06 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:15:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:15:06 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648HF65l1822239;
	Fri, 8 May 2026 12:15:06 -0500
Date: Fri, 8 May 2026 12:15:06 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/11] soc: ti: knav_qmss: Inline lockdep condition in
 for_each_handle_rcu
Message-ID: <20260508171506.7m7ejuyrp2r5zphn@little>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-4-nm@ti.com>
 <a994a69d-2482-4e96-8d18-70a09146ce36@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a994a69d-2482-4e96-8d18-70a09146ce36@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|BY5PR10MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 126df4aa-c8ff-4a74-2cbc-08dead255c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IO7B0xJYdoyvKn13aUZL92aXxFkbmjXyOO6aSsQmkzZa5eCC7Rk6VCYRXpWMan5rt3ZDvOjOnboj50nz5VHq/s8z1L/x/Xkj04/MNqWyiNU7Lcp1Xp1w7KcNMEsp0xQEgZmlgW0BDVnoJEzBbWKoN2fHf9KNCLKfRQVA+xZjJ8w1ETbYTTYz7vuUbLyIF5RIUwABmPrm93ptOg/YoTj49QEMRs8WmPGb0hZhSK1VbQ40A3znjsAgHVQ8Jp6mjZT7FKV3ux9CRkoXRdqYg2a0ZfMMvwJsvuQ0afQHLL/n3frDcnzzkcD/bjI8zROS4j3jDTxgHT/tyGMt5cqlOhjTNoVUIClmVB9VrUNxbR139MOC5EsDymfMht5wwRGC/dcNL3RzaJB3ii9OZIergOmDBfEM3AY8+HBAFJKzkt0oEJDx6zLLLgPp6Wor7GQXl7RkrUpz6IVSDITmj4yu22KxuA8wBNbLc7zXPSytNYEUIS5ZrGqo1srhJkPIncaHWZ10VW1RBcde2NzQyLVQr69HpLPp3gyQpquRo5AZFjOzgLWNY0hQ5NPBc+40Rl5rSR5CsHkncZOjsnu7Asr5tzHbQewTGzg3UVGe6JPKB0W2fpU7Vy+j2AakPg2iLL74MwQaN1a/EG8aB5cjzDmuw+u0PxlTCKLziZcesx+/JfhroMQ3ggTzGdN4lkBU2zVW/UMLK+f2tGTnMW6ixSVJ7v5bkKnrtdlsD8tENny8fTRnM/o=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfKytgGlX3MIiQ8I2tK5qmcrZhLV6VNUw7zhMyiQz5HKDVjFsYQrEweBTv5mvKf8wim+OYaRyD9A6csirMKaPPRfCfqRvWHyq9plUEslugFkPoRhzpqmz7EXDQHiYUhw1F9qMnlusdyuL6/e9FexisinyuMBMDwmoX6lZoOtfk79Pzg3apGSL0cYYcBZofBSu3VTP/9UO7WBe4+XXc8imv2yKihxrE/dhq5Y3eWkZZjr8FJRwlLpLLkc/kE9+XOR5vo/XT+mW0AS0JinvZodnogxrKvD2Uu1FBOKsTu07Pl6CY73GejokJluxbiG6Lj2swMxGgufG3vgJP06BVyoLjXWLzXpn/KXVu3BKnV1ZhHXIPxBtd8UXTCUmr61SEtz0KLe4RsyzxT1xcp0WiT1BJaYPGndjWc6jCE5NDCyZo4yUt16qnh/lWXgN7RMlxxe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:15:11.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 126df4aa-c8ff-4a74-2cbc-08dead255c90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4161

On 12:05-20260508, Andrew Davis wrote:
> On 5/8/26 10:32 AM, Nishanth Menon wrote:
> > knav_dev_lock_held() is a single-use wrapper around
> > lockdep_is_held(&knav_dev_lock), used only as the lockdep condition
> > in for_each_handle_rcu. When CONFIG_LOCKDEP is disabled,
> 
> Is it when CONFIG_LOCKDEP is disabled, or is it when CONFIG_PROVE_RCU_LIST
> is disabled the condition argument is ignored?

Gaah, you are right.. CONFIG_PROVE_RCU_LIST..  will respin with the fix
once all other patches have had a chance to cook in the list.

Thanks for catching, I miss took things there.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
