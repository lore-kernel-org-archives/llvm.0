Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAC3CD8D7
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 02:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092516; cv=fail; b=MOF+SjuS8z/L5CpSBXVWcfa7YvoBIC3oKr6k+H7yzKMyHGUYmodV1rywT66LQjGieGDm0UgNnsKKmjwy3JN/7VJRp6/J3Z2sT0IZj88qXFlw+OlcQB6QCJxWiKG54KUDQE6ZG0bTvjj4hp8a+1/CnSRGsMjEQD0XqKgC+rjG9Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092516; c=relaxed/simple;
	bh=/GnAi/tk0I/3e0jQZGuJuLEvUgmQ7SM92QkHsPQx8EM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohobKclIxrMy5F0+AtgOadz9kaxBgFsufBfFVXmw8rB76144U04gjKXt8RaXOHaq4rblQ0TSPv1WK7gw7HAYlZLSBku8jL0HTM2BPIO0c61PjcuY9AK7OrOH8E32xwegtBAqHHhXGmT+XFafyLWuTJAzkVwewrVOcTNPvD1Nefw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PHDSoqa3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aCFBHoQ3; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PHDSoqa3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aCFBHoQ3"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68B12V29402723;
	Thu, 10 Sep 2026 21:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=wZjF46+q73U3XmS
	P82J55fms+ulaV8/ODGIciz35Fcs=; b=PHDSoqa3b5SZm1uA8ESrZaeQ6rRP7jA
	/fdxR8WzlmI7IXKctaWao2qzKvKsc3EgTlSNOHijrjVxBzhfRF6E78IQNoAubhVF
	wgkDiQSHTbNb7jpXBnthFSVvnylIGyxjX/gJgebabYn5RPLQZGFuOeLFL5BBX4sv
	N1UjEuwKm4VyHWRasqSrc/CcQFD03YUmJ1AHy3VtHzhIw5Av4YrCePEvI8EoUDeu
	InjDpRJD1EDnfE8Q9ScOhthI/e5TOiurHrX/TR0t6vb9HMrgaMrVKX/ss6DnruHe
	qTo8pBuSeIx9Lv7+ADs9WkbusF2sVhgKCmXT5hyQ7oLeWyTlVyincwg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkstvdnmr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 21:08:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrPDa+siFWNIWNikXcgtLXkapn6367GHqfrZqiDH4kHJzsWIf+RWudkFU/adT1oFhOWxdZ5em8y8fQ4IQ0CbOo9HNZUqjCE4jyEueJJ8RwofBuHab+wXqBsMQ2baLyX4vo6VUttwZa0IPaAyY+l6vtgqGJ/4GkJfza8KlfCUBhJ60K8MvxifXlQoNgnkjSjyg/1WseJYRscLUHa3Z6ETlVwB51oCoS0B0o9N0ZSveSYc4Eo6R+YcPR2LFxbjRG3Q5LVDFU4tcKX1TcKqMlFldLb0SZ+XHE6ArXVamFg4PydZyiajeCEWTT1upUy3iUoxQO0x0/r7TgYQC9vlC6OJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZjF46+q73U3XmSP82J55fms+ulaV8/ODGIciz35Fcs=;
 b=OjdNYOdRYhf4QJk6CL3UL1Hi0TFO1/PhqibomuDm5NFn4t9OV49ZjDuPgaWdFHwzI7Awgi6eHFddviKKqdbxm0nz0hDEnt0lQR1vvY23Ft+tt1eewG0dFuptDVNivo45NUmTZ1gkM6uUtMPDQpRjvX4IquDaZ5KyFUblwlElORato6Uu6srFfwELSjis/Gmn7IXkrvw0kpbYSj6Uoks5VmqdkOAk1oyL0LUEJL/OPaopHZFG1nSpLoT3Laz+C/M2RW+dbDO+w+frr1Ew3FMuZeHh9ZhXM1PsG6bYrkUj9Ioud0Qc+DwHxoEyXcvpIc/lz0c/c79EU1mWg8ySPYI0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZjF46+q73U3XmSP82J55fms+ulaV8/ODGIciz35Fcs=;
 b=aCFBHoQ3lDYMDJ/zED37oIyjS1RMl5TF81p85zqdc8UQVDy4LniYRR1S+CW6NTwFsEa7EIEwK7XI3KeD/nQT2AwMvwk48lRs8CH8xw5K+GRUzsp1CFHE2CY2O1QcxfWZMs8yRDHQrTGuOthFHdSE9MZoGQM/cI+0sdRZdL/8YIc=
Received: from BY5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:a03:1d0::17)
 by DS7PR10MB4877.namprd10.prod.outlook.com (2603:10b6:5:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 11 Sep
 2026 02:08:13 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::77) by BY5PR04CA0007.outlook.office365.com
 (2603:10b6:a03:1d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 02:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 02:08:12 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 21:07:58 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 21:07:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 21:07:58 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68B27wbZ206470;
	Thu, 10 Sep 2026 21:07:58 -0500
Date: Thu, 10 Sep 2026 21:07:58 -0500
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
Subject: Re: [PATCH v8 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Message-ID: <20260911020758.65havcyyjxne32td@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS7PR10MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: be965a38-3097-4951-8efb-08df0fa988a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|23010399003|7416014|376014|82310400026|1800799024|5023799004|10067099003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	PlFajQlNU8U3pyBLH6c7DzqykRnJeHo9hTG9Rrrt0BLrofS/fyfDvadC6NERx2FX0QAic4a8slUSZL8NyUjQKBlVNkE8+DuB25Yo3vDwjNW7LnaBG41YJWjXBpWbvl2jrBMVKZaEQbIOlQP2EQ+SpQUwGorP5UNfknQmFmvIph8Ef/coSMRffiCYE/88QkQ87PQFYfaSFG9R99KzND1WjG0d0HMwwmOIn+djo8wpvpVxeg4eUyjhi/kaZRFeBYbBdmbWDD+YZ0VdrYk2svwiLAXVGv05tl/SwbewBHasQVeK0gpDB3X+h+y8Odi5fwzl28bk6tpg1RtRjir7MXCFRHWo5JZr+Wv3jl9TkScKm8cOzZgzq/38sFl7+E7DO/UCXsaBillm/jb4YDzVr8QGGFqnyXxkOItlP85NeoGBWvOKuhjPzztFtvzDQZ9PTW0UMOK1OV4pn4yvgH5HYZOsBRMB4f/1ZfcR7qvXShWhkyfPCO2dbgTiIc9SiGgThANfreZEKLPpN6G8Qb4TqyHq+NnSgMQW5g8iE91tG2BDTcbla7/SvWKfDf694NUUlTPW2E+kTYaSIrgkk/FLoqdUKhVS1U2DoGQ6Rb63a2osHvP33KLr5HDh5f5G+bmj1ebebL6WHcnQVbNOfQDLU9Dnx0YKG8GL4yG7Cl+20mh0OPuoicCtmCpy6Q0YYHpwJ+ICrBe2mODvzBYEJr0OOm/YSg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(23010399003)(7416014)(376014)(82310400026)(1800799024)(5023799004)(10067099003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gaIePxbfC0kj8EZeO7Y/cdHC6c8gqXIqEop8nsX+lwN2Q2kYuT0BJJwtKyquhkndCkTSvxZuTdi2+kXvXkalw5OnTgHT79NCS+4wJug8FijI3GN99+9vA4DF/KS5wRunsEejNQmv36bas9pEhnS+QIj8jBpjLtQeMVzBmMxDoX685vJiJ99UyRlJx9ES8IxqI+dVdW9MyNnXgI8ZRItPl/7My3+rOOX480jjjhmOtQZ/kpCmq3ZqJCYhqYIQ1EApDFmS0aGvFtqRwKn3NNm3Fm4uJqYMRaWkpizkJvVXDCYqF7n9bAMPtulJIfocl8uTeCHSmvY+CpXLX9REMzCExJ0Y9TyKGDk+xTm3aoI6pDmHJSQjRcj2r2lrxlzbB4A7QQdZGyh/uDhY1vJF8gXdFLXyTDSDFu4Pb3uQZyeDyMsemb8KrJ6HkYpPmvnFPy5+
X-Exchange-RoutingPolicyChecked:
	zNJOXVSp/4PBw81QWDX8XrsoSv1zrBN0VMShr/FLn8r9D5HLDelKiBw35C8C4MJ3MqosAWwhJbzmJ0U068QMmJFr4dfSNSXGmbO9G4U95zai1X7Yny/G2GZalh86RKsZZqHkQOSH2Jctnz6zu8F5OEh5kJbHVlrZK52ae1W3WzsA7efnD7wrjaxtRt9YtVlZHMPHmn5lgcmRCPYpcbKAKxk2/mnWK3aA4Y/kZwFFuX4yHqbCIVckd/ssBWplx+lSrUnSXtsi/NQC+IRvmq0jol9bbpsUh2owRqnMHFP7j6rUkV7DJGqdDEOUvF8m8jBDfvWmrS8UCbB6znjYKb9i0A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 02:08:12.4745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be965a38-3097-4951-8efb-08df0fa988a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4877
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAyNSBTYWx0ZWRfX0R7dWaaKlpYl
 xWFY7Hg9Xklb6JG8Oz6aHB+MOZ9FDPG1E0v31zn3VdqgMMz4ebJxYi9cYwP98g4Lm8cHRHSMvX3
 mEG09a0jf86JRVPYynu9B54HQoe/34w=
X-Proofpoint-GUID: yB_iVeuF6Pr1XTGL5B8xriYFPr7iYwmU
X-Authority-Analysis: v=2.4 cv=VvG2kO2n c=1 sm=1 tr=0 ts=6aa36290 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=IpJZQVW2AAAA:8 a=1XWaLZrsAAAA:8 a=P1BnusSwAAAA:8
 a=m8ToADvmAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=LX1hikC6EZUFzTVLHj8A:9
 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22 a=D0XLA9XvdZm18NrgonBM:22
 a=kCrBFHLFDAq2jDEeoMj9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAyNSBTYWx0ZWRfXzTjgWlES4cET
 CQyBL1uGZP0kLL4Q7DkbdwE5jtXJORASMV09ja2PAq5dc1XYS3t27AUr345Sbz5lb7B3TlnrLKL
 yvLxzGpc7kV05X3OVdE5+FTNDdw1WInrAhJxpyJ6lgPFipSKfe8Pz7DIsQ9IgMZAo+O11K+2UTP
 pnT9Q/T8q2HUI7V34aw/MX7RKGlh2xzHWaiTv+aRhPg67sf/LXnEfw/zHM54NevTjNmnXYBYJnn
 hmzxDfyavVv5TwqQRp2g1Phuq+QSa3Le+YMOyr2HlYSLDV4PGWIcfcRdWY2UOkKhJwscfelkTAr
 w+e13r28IqBlGtgkuHppnlwmIEka2M6XQiEjMMCbfiGmxz4dDSjZ9vyCD2EoqFfqRw9aMLT4GI8
 JYwxPceK9l82dM4mc4h1ULF9QmLMQk34xUpBQHf4AXdZoy8fZbx6jlhHrxEYy59xYTKF9/bMrgs
 bWwtg/HIynaBP+qQJag==
X-Proofpoint-ORIG-GUID: yB_iVeuF6Pr1XTGL5B8xriYFPr7iYwmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110025

On September  3, 2026 thus sayeth Markus Schneider-Pargmann (TI):
> Hi,
> 
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
> 
> The bindings are already applied. The remaining patches use the new
> layout for the platforms that are capable to support IO+DDR. For IO+DDR
> the new layout is necessary as it defines the location of the LPM
> metadata.
> 
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
> 
> The changes in this series were suggested as part of the IO+DDR u-boot series:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
> 
> Note that concerns about uboot fixup of memory region fixups were
> discussed here:
>   https://lore.kernel.org/r/DJD1Y3G9S1SP.2GHOZ5X4RYJFA@baylibre.com
> 
> Best
> Markus
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v8:
> - Rebase to v7.3-rc1
> - Increase the AM62A wkup R5F memory region to end at 0x9e700000 to
>   also fit the edgeai DM firmware as requested by Paresh
> - Move the memory region definitions back into the base board dts files
>   of all AM62A and AM62P boards
> - Added bootph-pre-ram to the memory regions are merged into the
>   bootph-pre-ram at the end of the series
> - Link to v7: https://lore.kernel.org/r/20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com
> 
> Changes in v7:
> - Rebase to v7.1-rc1
> - Fix commit messages
> - Link to v6: https://lore.kernel.org/r/20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com
> 
> Changes in v6:
> - Added fixes for the length of the wkup_r5fss0_core0_memory_region.
>   Thanks Francesco for pointing that out. am62a firmware is shorter than
>   am62p firmware. I calculated both and fixed all devicetrees using
>   them. All patches have different Fixes tags so I kept them separate.
> - Fixed the length of the split memory layout as well.
> - Removed the double definition of memory regions for the var-som board.
> - Link to v5: https://lore.kernel.org/r/20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com
> 
> Changes in v5:
> - Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
> - Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
>   already present in k3-am62d2-evm.dts and got moved into the
>   firmware.dtsi file which covers am62a as well then.
> - Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com
> 
> Changes in v4:
> - Rebased to v7.1-rc1
> - Dropped all already applied patches that are the bindings and the
>   initial introduction of memory-region-names
> - Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com
> 
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com
> 
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com
> 
> To: Nishanth Menon <nm@ti.com>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> To: Tero Kristo <kristo@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> To: Andrew Davis <afd@ti.com>
> To: Judith Mendez <jm@ti.com>
> To: Daniel Schultz <d.schultz@phytec.de>
> To: Siddharth Vadapalli <s-vadapalli@ti.com>
> To: Bryan Brattlof <bb@ti.com>
> To: Paresh Bhagat <p-bhagat@ti.com>
> To: Devarsh Thakkar <devarsht@ti.com>
> To: Jai Luthra <jai.luthra@ideasonboard.com>
> To: Beleswar Padhi <b-padhi@ti.com>
> To: Francesco Dolcini <francesco.dolcini@toradex.com>
> To: Stefano Radaelli <stefano.radaelli21@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Cc: Hari Nagalla <hnagalla@ti.com>
> 
> ---
> Markus Schneider-Pargmann (TI) (9):
>       arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
>       arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
>       arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
>       arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
>       arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
>       arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
>       arm64: dts: ti: k3-am62a: Split r5f memory region
>       arm64: dts: ti: k3-am62p: Split r5f memory region
>       arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase
> 
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 29 ++++++++++++++++++--
>  .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 11 ++++++--
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 29 ++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 32 ++++++++++++++++++----
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 11 ++++++--
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 29 ++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 29 ++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 29 ++++++++++++++++++--
>  8 files changed, 179 insertions(+), 20 deletions(-)

Thanks Markus for dealing with all the back and forth on the Linux and 
bootloader sides. 

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
