Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA94DB561
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448927; cv=fail; b=pRX8OG8nJCG4avTRIGnO4+Ueb6y7GL//jtfJAmV9WwJoWMbaTTRACbxoav5fc9fCXF8G+5lw64SG0ehgXUec/8eLs1yD68PdcnIWMEMwcC7xEbz0r0PLfZVrwwFoxJTwaADTu1sKYx5neRRbIZfPfapC9Fa/WCo626GXvoAlup8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448927; c=relaxed/simple;
	bh=rsmqaw9VoX8xgjF7zES85v1KB21zKbTcegKmJbPYKq4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyj9BInyBKlXlqWgMiLFbBOXbTiXhzWXBBaMTyJTdIhJ9U5NqQOSDIk7UQ7nmy47CnjXfJOj2UKra71xedUGrBtHUyI6Ti4JjzN1ra6ecg/rApwPHEh9pG7sUcOvCugm6sWJwo8br+VKBLNo0FGaK2rFzHvwF5FmKyxbmNGZku8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xhvzeb0D; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=taaTSE86; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xhvzeb0D";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="taaTSE86"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683D8Vg61008287;
	Thu, 3 Sep 2026 10:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=mk5P259/eZEUFaV
	f5ySRubtrEg/aYHcdXb8i4c8uzes=; b=Xhvzeb0DKWi82SKiqEP/JYIlOnxbO84
	kp8uPx4N5AQskPtL4fyaYZ6N9mz+T11Zxvp0oZDYNRVPHoj2mOeA/CdIU/Q02RkH
	6lPQ/2Lf98ftcLdSW9R/pKnZ01lVb4fHfxJktdEqXhVqf1jwh7nz8HzQCDv42O63
	PZlf7md3p54p2rB7vltq8pw8y3vAEcj55Bd3ybPqxloE8r41KoGDqmAY6N4EJh5m
	3y9D5aqrVquIuxt8/6slm6wsrGWU6DA+xpbmMvGhgaXoOqVqs+Z6XLEWpEG3kWxJ
	3vjHax+jsBoIBGeQjL1A/wmpohLwg4ZfXfSa5iqrmbo0V53WGZeiMyQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8mygt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 10:21:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2E8KytyNOujTwM3I+aI/uIlRqKxQxosEyfozYTfFxLL72gXLNQOyGQsl+71Z5DV58sdL6Iiek7rSJRSu5WCWWw/Tpdg4pKIL7Jw7cwKBKcW4vScLD3zDUrnNZGuRHh2Uf0bZ/OVEr8VcIJm4q8DOPSnArHoGuhGQbZEq9VnTubOAcxkyc1tuQ9fZ8VGg7qM/2s6Q9TVCYP+FnCxRpoalpsqAHQyQ2ICvJLgLIbZIBg3Fe6G8+lx2BMTWVAQbZHnVzEwpK8O7caWA4lFBTE/LpbsHGef2p6uTQ6bdn8C2rszKANORTqLyQtfXdHuNsY8Bb4Wux6c39iOZwP0x64VLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk5P259/eZEUFaVf5ySRubtrEg/aYHcdXb8i4c8uzes=;
 b=LQfdu/ExpnEPW3anaKYzvXtfe4rLD7rvTRynVvH5Mea2gPxj3VT62gcfuBfgFR+r+kCjflhzXqIxJPh6JXjOorEvj3iqX18yfOP361n1kGk5T3wbQW710H1m/Dex8wH3CuMWrUUO0KidMIuz789F0a8whXoYpTJeoEeTk0Ye0gsoP7l3Zto77r9oC/EfiCcTX040DLy7GHom2tCKa8bMDJgC4BWY4/mIe2w/YLpFjc6SpZ9WKoc3VaGaFWVgO82nkkJb6Z6TBei1+zpGLHE3+b79+MT1UcFSyd9Xsr+Ii+PXI76LlaJ4sfpkTRNguAeHSwP5xvOJnFjzE79o0zesKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk5P259/eZEUFaVf5ySRubtrEg/aYHcdXb8i4c8uzes=;
 b=taaTSE86A14fq1jcfuUH2XUp72D21CesKKTEUIAOr74PFAzPJPt+ED1ch5vlNjY6I53I5WC0wVvpqbqdlNEzhO6xmITxaozjstUOU2YcJi+9ZeRvapKc2freKYntQoDifk/gP2bSJvm/wyP7DThIMtdRWxhapSNkTgUuioerrZg=
Received: from CH2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:610:5a::35)
 by PH3PPF1F3678C2B.namprd10.prod.outlook.com (2603:10b6:518:1::78e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 15:21:21 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::8a) by CH2PR08CA0025.outlook.office365.com
 (2603:10b6:610:5a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:21:19 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:20:54 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:20:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 10:20:54 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683FKsI82795945;
	Thu, 3 Sep 2026 10:20:54 -0500
Date: Thu, 3 Sep 2026 10:20:54 -0500
From: Bryan Brattlof <bb@ti.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        "Justin
 Stitt" <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
        Daniel Schultz
	<d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>,
        Jai Luthra
	<jai.luthra@ideasonboard.com>,
        Devarsh Thakkar <devarsht@ti.com>, "Beleswar
 Padhi" <b-padhi@ti.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Stefano Radaelli <stefano.radaelli21@gmail.com>,
        Nick Desaulniers
	<ndesaulniers@google.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman
	<khilman@baylibre.com>,
        Sebin Francis <sebin.francis@ti.com>,
        Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: Re: [PATCH v8 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup
 R5F memory region size
Message-ID: <20260903152054.drcftn4lpzqnqx5y@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH3PPF1F3678C2B:EE_
X-MS-Office365-Filtering-Correlation-Id: a5dbd764-e391-4880-ad10-08df09cf013c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	3NYs8tPbhIsnmLD6K+DhH6Oin5+rJ9pIussFENwgW8vy5YzmfrDq3ZD4ALTYZMr0mSkw4rDDBzb+cA8y9MFIVHDxzSQV7FnTOq50+FEEeLPL9CodGXh8rwzXCojNdd1zQoFNFaGTeJ1oDK/+cZu6N3KWGc1wzZn5spXDo/UBbRRNjuRm1MXmtSSIaknjcS+FLSIkihtMikz20NOd7clFkj61nzcCf9Uol3xhwerTcUuiQGnPglyzVTrVd3JjabTv58FsjWwLJluIJ9zT8DElX2bNzsXh9yPoO2iXnEPt/RaIE3R6p2xzanl7UGyQyyVI9WGU6fXBJMnSeoXGrM2ZWW/m71rnfx7F7YCck5MP8HK+A30uciwKvthO8YtgFTTwwM/fD3if2un8T+zBGw7ZAnVw9d4Dxz4TofIbNpNSyopxW9q00ySIIQtRTDmbxXcusghF8tHwUy6QV09HUGgMiz4Une/SLkphfclmUcgl54DQTa0fV1WmM0ugNz2Bcd3qbbkg8bCHs/9vApjsAmNlaTKB1za5ZBToQTebuXm1f1kPrrQzw86BmaERdAlF3gilj8h7JVNsFOO5NNSejgrtsKx/FNVoekqpkyqgD4kXFSBXr90yESdRirTsaA3v5cfc6K/NXZVJE62EuyzRvZJZiw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+gq6O9OGd9/WT0XPkqeDWAsovYeqnj+qZu8rsmNaJfFjTCD4ZXQ6ej9WNV9HP1OibzPwE7cGnr47Upib5mPYTWNmIYjcTG2Zpwgcq0rYcCQvGmdckLL1d5nLDIDFaM3wLhgXbdR/ho1+2yitUXQ0RsI/Kb1iVYQGHZptB1MsSEG2fuMixUQSyjqQVsV1SgRa4ojztxjjKgGcw5ATfQBkWKrOJA/1LkId3ThGvM2ZbxCwT9IEizM+WQCFENvtuFhYlo15xcNG+sgEAEWZfJMhSxqIJeKotcCefMRdVfU1ABFu1b6dRWzGRfe7m3VBQR2k+XgJNTTkv+RA23xFGysAuCczun2Pr1EggWr2SHA+bOoA7zWUr5CI0WU9zqgRuUnuBBXRHe5scNb8ynJXo1zs7xFK4Y6IHlIA7ilK+64X28T8x7CU9I6jQW23ciw5MyUe
X-Exchange-RoutingPolicyChecked:
	PKkVXTbTbMPUqgABKCZchqEh3kH7yQEg1RLchH+bbPsRceSxKoUwRV4/VkpK4o7hxTbyXCIic5MXt5N9ZcaKi8PKbmEbA4z12m90/uRiPNKmtN0YR+hH2OaCg/jeHzekfRH2mGBS8UA2hLrhnC8bswUteXSQty6xQcE0mEYVM21elx387zDZMCLT5BCLiCUxrahoE045T5Nlq7AQjs82fZRrgpF7ioxvE/tydv4mnnRBpwm03mG4tifx8rmjOQKiDozwrycCHZzyck36wv0qzYEvD+6smMfe6D2lqZrhbqhWlr+mmj1Z/BUNqotaApO43/pQeA4wTdWmWOZmFzSZNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:21:19.2522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dbd764-e391-4880-ad10-08df09cf013c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1F3678C2B
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a999085 cx=c_pps
 a=PXpErafpzP6WDESZDYpOyA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=ZWcXVxRsAAAA:20
 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8 a=dbs-pGJ6yqg6YDvl5d4A:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: Vi0dXnHGy_KUV7fKcHh26MFxwrsDYCFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX6B/KBlCfW4RA
 xKOnX7JfYuVqkNHmYZgZesrQ4eMIY5mzFbybQeB2boyMH9iV3xfuiMVQrJpkZLpioi+ZIVuoNsP
 MEp4ZAzTxYacmE9ykaSJ7kEg6MZzv/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMyBTYWx0ZWRfX3CB0IyZp7cVj
 FltQsnt0plxHGpn43tKafZU9URtQuK3HppxCNmvqVg/2bquLgDS/4+bBsCbS8Fy5LeGuVxZB1o6
 zeL8EGMh/RyS5KKlrVYDM4X9Ky18sq9sHF8CM2f4Oey/qn7yQNvVVyQh0Tn9MLpl/nEaTHbaDcI
 9Ou37r4nwnKdjE57/mRdqu0kpokq8efhleZSDZneoPULcxJMrRitiskEqJW2l22UooKEx7Uqlwq
 izknKHer/3Vrq0tLiQMi3bd3ENqJCgYok9BTzrPfRPhW45d8W/fJlyMmeDCWjSjR3/yjNOx4fJh
 IaJnG8vx7h2bOKDl5jUKjW+EAs0bX1x2ycK0FGLbdyb/3Lwb2qJASI13enADtpKxChWdlRt+nME
 ldgZioiZlVNJWEZc5o1ZlRz+HqkjXEHbvK/7+/DmPUkgmKhmY6CC61TQX8J7XUNubLs7T7Exf9J
 XIUJzR78B1aU5xJOcLA==
X-Proofpoint-GUID: Vi0dXnHGy_KUV7fKcHh26MFxwrsDYCFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030133

On September  3, 2026 thus sayeth Markus Schneider-Pargmann (TI):
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62A defines the DM code/data DDR footprint differently:
> 
>     /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
>     DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000
> 
> which results in an end at 0x9e600000. For this memory region which
> starts at 0x9c900000 this means a length of:
> 
>     0x9e600000 - 0x9c900000 = 0x1d00000
> 
> AM62A additionally has a second DM firmware for edgeai whose highest
> section end address reaches 0x9e700000, so the region should end there:
> 
>     0x9e700000 - 0x9c900000 = 0x1e00000
> 
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
> Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index de4048a3564b..53c096da68b5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;

Lame. It stinks the MCU+SDK stuff needed to expand and we now need to 
worry about these things every MCU+ release :/

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
