Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989648A2CE
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781641; cv=fail; b=PBrzg+nZXwiMzbTsjp7v7yj+o7LfzTi+rsCASstqXNnOe+SYzGMudybz/XJKRiGTEF9Gvzqzq0n5nMztihVlMKQKmMFXmhioJIbJtWjVDf9lnHaCUpQsm4oz7T/1HSYDiaZM4GbyF7LdWDtxuHJx9gfcIjDofbfPDgEtTEtfcP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781641; c=relaxed/simple;
	bh=6vtMsr+TahgQjCdpdFBxmDpmepGSal6RGW/+aYnH1zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mSPWGBsMi5DZS8W4CCTa6IpLj+WOsBqc9TPobbkd5dRoC+V128qrngW/uYo9zSENF22HzfNTA3I7BZvrjYVDpnxJ4obS8NB4OhT95hWknjqhNu8RyBN2cermH937JwDSL+2xpcqBSwJJL1alJwJXrGQ3tjYRogdZ340oxb3SYrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BLjMsMYL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fNa3gsPJ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BLjMsMYL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fNa3gsPJ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67QKdsSr322381;
	Wed, 26 Aug 2026 17:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ktMaJmOIVNNKjNGfCdF+eRWO2GK+YZZt79zM8eQKf
	vw=; b=BLjMsMYLsL2mcj1LLTQ30tSMpQCDv1dqfGp8N99OuKUGbBufd/CV3yvQA
	c8//rjfk0sek+AvaVFs72y+UEYf1erlV6A4hwqSLCct+8t9wVrIPFZPt/yixfnA5
	IQZd3OLsU4jmhLTZfR+jmbjue1owrudjC2YoaZ01LhRx2m079mnwyy3D4rrADFxm
	w+WE3Pwi59XuoIoBmUvglUk9ZLC0JsUFAlceMV1WvtxwJCYGwgHNEpqSLuTycfXX
	HaVg66yqQyxt7eqMBBiEvC4EPUbRzZRtvNducGT6HOrtYsZMqEs5RPk/z+sX1Jq4
	aStgfZw2bGrplKpk/Ld2tyUmsCAcg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g9phne635-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 17:00:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1x2QnNo4IdvBIqiuGGZ6TIfhNSM3xz0aI8dd+Ny16XHFPDm9LqEodWZH7Dqx2zVi5bMdwPQ4NOvH5pCDQJvtbndPQwXE+RLyJ/C5L6HYgAXEw3Q/geGUtCCZNqW7f6MBGRLG/tmB5eG2KLq23h6GGCnBAfZN/O9JmWDbXXlvKPhWnNRulw2dddAytsy4kGH+pCPKVinmy2M9fb6UFFgKtzmueKLGObfEUIWKdKtDGJMTqk7SYCAn4s1K0fEkZ2fKPHiN9G0O3jYxcko4x4EMI5iK+z4kNC7i0XYBMcJxtyjhXMPLuQcM16Vrp/g8cZa08nBioSf9kSO4o2OrJ3eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktMaJmOIVNNKjNGfCdF+eRWO2GK+YZZt79zM8eQKfvw=;
 b=PoqJSnt5PptQQUx0ycejxYMSyoTa4oSYaZ2fWwjIdG4lEkAqhz/+b4CYq03FA6oTnZzHxiGsVhpkayQGvrbSGtmo4tpKzQYdpL7S1hpYUPYpIX1bAB/G4ZLToiHH9gYo2NAzNWZk6tIBzT8GZjm63tSGKuS7KOFAzXrJ9jhwgbvAYUdsqoHNfIp9MARavqJ4kGt21uKBSrnagNc3q4EjQ+TOXe01TttiP7nDBoxidMZ0nMi+aq88Hm9dC9fQ/QfUDh5+XTuCBGvP/Fe0W/a8ddPIVmi84bjBUJhD3/5SN7UYUj0xEUxSkM5nuXfoiOgC6wmHSlkdj5j1j6iKbtzKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktMaJmOIVNNKjNGfCdF+eRWO2GK+YZZt79zM8eQKfvw=;
 b=fNa3gsPJ+bG6+7yirM0niS1PXqFJg3bm3ofj3rUOXHMweIwvaqT+s/2f8mrl3/ZIfOE6nEY9rprLvcVwSv4bcfjCGS+BYDOMK7akefWW55pGOIAc9N6aNiDZdEZUKnBtxkUhu5qQmnCZry3U+YMYCRWGMjt2HWCYOO/wbjWx+Aw=
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by DSVPR10MB997913.namprd10.prod.outlook.com (2603:10b6:8:3bc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.6; Wed, 26 Aug
 2026 22:00:09 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::6) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 22:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 22:00:07 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 16:59:35 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 16:59:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 16:59:35 -0500
Received: from [10.249.32.55] ([10.249.32.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67QLxY9l3787060;
	Wed, 26 Aug 2026 16:59:34 -0500
Message-ID: <de6f8a26-cec7-4618-9a71-b55dcddb0dc4@ti.com>
Date: Wed, 26 Aug 2026 16:59:33 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling
	<morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Judith Mendez
	<jm@ti.com>,
        Daniel Schultz <d.schultz@phytec.de>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof
	<bb@ti.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Stefano Radaelli
	<stefano.radaelli21@gmail.com>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
        Akashdeep Kaur <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Hari Nagalla <hnagalla@ti.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
 <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com>
 <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
 <DKY17OVPN49B.3U7OKB7NIMLF2@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <DKY17OVPN49B.3U7OKB7NIMLF2@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DSVPR10MB997913:EE_
X-MS-Office365-Filtering-Correlation-Id: 42309f72-3779-4aa6-d1d7-08df03bd642d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|4143699003|56012099006|10067099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1X62qDxVJXNp4LQ8t5PToHG6yJh6wgypEUS4j4b5W9UKES+XW/yLco5i0IjV/2qroJLXyBztbe3Eb1mNlt7H/Q4olOk6KVyoFEwThFsi9CUWr2DKhIAlaYHrdrkFRfq03k0cABU3AZIUNpeO2fn+okLW73CtT56r4+y+fd+EaTiD/ipN5UdENxfXJ2gFzjSL1Ope/umz9An1/m+wZKKnsBCUQkeTv3JEM3d29rbRtVPR8gQct4sqKIbaa4zSNXuiclT6SfKHU9sPyaeO/pMGVhYr+cumeMrD6m/kTFI/8GdS2PCc+3df354ktjtIWdwerIYQC8E/f8jXofWksrQ0exkFIIWyDdFacFwR9hsGKKsCiQ/GeulfZN+AdjDOTnctmuA9OwG8Nd+pA2GyLHis0nPvwODjY2Rx5eOBr9n6fmZ8eCgyYFx22hqnNEeL6VligX+stUSR6m8CAFc25M5Dg/LHJABrFjHZdaIIRBayYSeJaUxR8xXJlDL3qsC4yMyFHrtVFJjnw/e6gosHvMjBWMiDY0netxPE2wRNnQPZd3K0tDpb4A5IicTwBAKv9K1PQoWrZ76fvc81g7DRHw8fnwxFkAXGTdyCgxriDWAWe0Hzls+UX9KZZrCyUD2kOdrQzNFTAa0y0tZaBWQQusIxyqRRH36c2VU7N3nr09RGA+dJhOZ5c95yOQBLI6DdZsGV34NW8nOSJbxiO9auvouELhfeas8ouPt1FZj4m2JhJ3+bZgIl9sHa0YduOZI/qubH
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(4143699003)(56012099006)(10067099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sYP2YrU2tdG1A5XHB5GWRNsBdgkFn9Ek9CEg8oSJ03wyLiPDqfvlm3UWwAZcunnE8H8ICpgvF4bfDTR36kONntHq4z30lkX0W/a/7b+4gdC14Yq/T8dh5+zHB1TQ8bDGwwLi3vmk4T9ps8kEogpsj7UH93Np8Ljf3kpAQJsa5gYoxa3ZGvswYAxd/AP32KvVVwxk8tKItDW+GPbw3T4x0oTvrS8ffDPeSxQOVu39s+7XvinVsHMHn3nhejxLQVPUiOdT6ZJi+9HfIjo914KNLkwh935KU4k+rBukxb01mu48DWsPI7p5CA6sFUH0E1HNHeOan6yZwt+I7b3E24PjWlm6Y89ukTlqe38FjY+77vMDfrTMZl0aiH5+pb1VXoXHstdnLU48oFCk2h1s0E0NKVwYzdwW1bic2EA6U89GqLDWiehciYCO/wcXuB5RXHm9
X-Exchange-RoutingPolicyChecked:
	K9XpNpN6jcHMVfSFtJGMyCMhcfmHC2liDkoDLQ+rO4VsBwfc4w/zXT0Mj9cXfy92wsKlIHZgM+MsRpd6wSVIVv+Ria8DHJfMHPMvRoxqdlMLVUCuCIEFok9pA2zADe0/gcO1gx5uEkkpWBJa/bm1nqG4akw9OzPgzgGEcScQi0xGV5nOFskxHSVHX98B3i3BbUpEGPgrGkMJaYEK2PcKJUDEJCjSSECXMilTTAKcYdLcYqcZT1mmlDV9t82kkMWCcSriRd5wj5yv9v9R5gUKdb24fMQgYrNQHZN2bf2Q2ueEgUiNjCgLaYfb7xYW9BoACUO9PwWuGvWyQwo46TVmiw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:00:07.3165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42309f72-3779-4aa6-d1d7-08df03bd642d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997913
X-Proofpoint-GUID: 0M3i_LGdwVRwaxA844G96XkB7lhEUyQI
X-Proofpoint-ORIG-GUID: 0M3i_LGdwVRwaxA844G96XkB7lhEUyQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4NSBTYWx0ZWRfX+FBz8aoZs6Iq
 faPfkZFOS+SRTHrLxBhZvvCkvz80BD5KTF8fZRp29XoaO2Q044pqMuCfV395L8KcBe4D4RpKhvN
 4w2vKoJc4ZbcwhXCYWTQqoJ9g3Hz93q0rl1OqtqK1d4/nhkHxCQ1ic2GfErceR+gvyxj8RCdWoW
 gHoihzOZQc7+y8LsNUZ8EC2iUeaLa+0gDiw/Q8XRS0Hi2O7zjXeVH6i8iMRg6KGWb7YzMB+IJoH
 rg7gv2qMOlkwfVH2xsI1slHIdY+8Bp8AUgirN8E+vyOhjf1+LqQ5uPeW3Tw6Oqp/ds2UMJ6+cot
 yxzfXs2CDHZ9VmDuGoHbuyGty2LEq2pXLGNYoktRmLse064PCpm0mjxniD7zRXyYoskgVm9shY5
 vpU74LJ/0pnqWAK0s2W/YFS3sL8k4bC6Hg/TzkZiLmEcxo83AS9MvgnJz1HgcqUUGINB5ZRzI+y
 vCPRWaDwb0xr2hVy+Fw==
X-Authority-Analysis: v=2.4 cv=crSrVV4i c=1 sm=1 tr=0 ts=6a8f61ed cx=c_pps
 a=85i0V4ggiSMiQM2jsTwpvQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=NHwz0TPot8ljZK_TRlcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4NSBTYWx0ZWRfX+l8a+bRjkm/7
 A08g9smOFcPrayuHT0U9V1UGn7FSERrmNMXL1FYNVWqmYE5rApQUazKXRo6L8JqYLostTaqpiND
 SzZWUwIhiotC3Xqv2TlcCAL2i3Qytio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260185

On 8/25/26 7:43 AM, Markus Schneider-Pargmann wrote:
> Hi Andrew,
> 
> On Thu Jul 9, 2026 at 9:33 PM CEST, Andrew Davis wrote:
>> On 7/1/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
>>> Move the reserved memory regions used for wkup_r5fss0_core0 to the
>>> k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
>>> boards as well, so we can combine them here similar to what is already
>>> done for the mcu_r5fss0_core0 memory regions.
>>
>> The reason we left this region here in the base DTSI is this region
>> is for the DM firmware and is required for the SoC to function.
>> The other firmware regions are all optional.
> 
> I left this in the base dts before and Nishanth pointed out that it
> should be in the ipc-firmware.dtsi so it only needs to be changed in one
> place:
> 
>    That was the entire purpose of splitting ipc-firmware.dtsi out -
>    if the default firmware carveouts have changed, do the change in
>    ipc-firmware.dtsi. That way some other firmware people will have could
>    potentially have their own dtsi files and handle things appropriately
>    there, even if they are using the same evm OR if they use the exact
>    ipc-firmware on different boards, that will appropriately introduce
>    the change there as well. BUT, do check first.
> 
> https://lore.kernel.org/r/20260507155710.5zch4ghhzrj7hnlh@immovably
> 
> Maybe I am misunderstanding what you are suggesting. Also note that the
> memory-region list in wkup_r5fss0_core0 which references the memory
> regions defined in the base dts were always in the ipc-firmware.dtsi.
> 
> Could you please help me understand how this is modeled so I can update
> the patches appropriately?
> 

I think the issue with your v3 was that you updated the wkup_r5fss0_core0
node outside of the ipc-firmware.dtsi file where it was defined.

The core idea behind ipc-firmware.dtsi is it should be optional. If for
instance if I have a different set of remote firmware then I only need
to modify that .dtsi file. If I don't want any remote firmware and my
bootloader starts none of the remote cores, then I should be able to
simply not apply that .dtsi file and not lose any memory to unneeded
carveouts.

Now the wkup_r5fss0_core0 is a little different, that core runs the
DM firmware, that firmware is mandatory to even boot the system, it is
not optional. If I try to boot Linux without marking its memory region
as reserved then Linux will write over it can things will break. So,
its carveout (and only its carveouts) remains in the base dts.

Do as you did in v4, but update the wkup_r5fss0_core0 node in
ipc-firmware.dtsi, not only for k3-am62a7-sk.dts. Yes this means
you will need to make this change for all AM62A based boards, but
that will be the correct thing to do as all boards will be using
the same DM firmware anyway.

Andrew

> Thanks!
> 
> Best
> Markus

