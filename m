Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC62236E8
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112573; cv=fail; b=X53lm7kXnIvPY6ZlmN2wXlrQau1irsskpvQx9CNtiTpezAoLfnfasMhtAgDaiEBWEav5Elq47za1NpF0irqEzOQ3wjI0ZMYDfqOV/5lLZMVw4VsrsW6qFLqxEGoxNckEm6rseVfN6Gmx0oT3E/tiilppmS4w5oVslCwDCR0cVdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112573; c=relaxed/simple;
	bh=YP7paVPqcN90uDL89OkVSf2YCJ8FBQFgfJduuEkQwfo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNGb5RakcUdzFU7MGQGc24ZVBPZa0jNjc+iLP399r0qOgf5sbgdHLq9jBOfHxuwsHejJbw21vMCOzAV2ycJx/vMb1dYn4w13x9MFUuacjVUmTolT4TU3DZyIenHNRwUgTx/af7C74p4SjuukeXTCclmvbGBLl1ZfxBeWXkoMsoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=USJ67qWM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GeQhviVv; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="USJ67qWM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GeQhviVv"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68B4KO7Q2900402;
	Fri, 11 Sep 2026 02:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=814UeZnqV6NY0Rf
	BZSZuc+Zl6CoP9A9v/NzNxBckc6Y=; b=USJ67qWM0+PLxfHanqwL/l2G9J/7ooS
	SyYFRADIm8+TTa5F2acxjT7V9UBNK7nbjvq0EvlF2LsA5lMpGSxy2tODWAEDf3rS
	4BCAIpWMD2MjWOWAP+r8dKdeB/lb+RvZ6lkMkKEK1kfepwAaxe2gOP/o2vsz6kmo
	aJp8jTazRw5tAsd65+pJydzNDPlBWpOgmsGWPWU031vbDCv1WFwUpICWLn40HZKx
	MPWCMiLPILn7w0bfJGT+xttVPBCJAV9ovZ10kvubq0T3ZpUBRw1cmHpLdOI5Y9pl
	LAhKD99y+oE2wFuT8zD7WsP+oegzr4+WalAHiqvTf6j67lCigydfHQQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyu0cq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 02:42:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfkBMgEojJmZBr2p8AudJNXR2FL/cq+v24ZSmTDp3U/xwI7H5VhaCSeBVQEdPnpiIGoz+yb1K7jltqhp5ihdHIEClyECdD1eBW+5zeemc+a3JrK/C9Igr7Jw8MsF21hu4De4AU2/th9M8W2yEob5FzE0UuqVUfGmhm8eGxMqu+vBx+eJX2csUoqDZ9FwzpHeK165gu0KvyF14mj7lXwVZFV1gO3zLD0mj14j/nyJu6oE9sciOCxFsaKODYpVUhyl8Pgycd10t12336rKS2M2ECtrlzO/4ZHmMqnJMRNO0NLtPJqbPhiM+GCxG9FzbkFgJmpVYvMsMwtQGRjGMObSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=814UeZnqV6NY0RfBZSZuc+Zl6CoP9A9v/NzNxBckc6Y=;
 b=jiLqw3U35WUhSBh65JbWQ0q0KORotzPCOL0NpHrS28xa9xppRvPXmJ56m8wZo4FM67kab6hUToZavfYC4lVzQB4TFFGzZ0WiXQqyqIdevWC9KQwxeUpokWqQtIexAATXOrbTEcH96FKw7/a/ist44YjfYX6A6T1LjXL8McFF2PrR2ayV11Gjd0RyuDQXTvWhGOab3V+ywvzTk6Vvk1qftMxNqmlMYPinuDr+7xofHS+DZtG+QGh527UBGQEwmacDWojQERH/Rkdb5oCwuH7SFXotHmp1/F2YOAS55PmMnX/t4bwhlcUwMP8BSD81QyHBOl8RYUAjvLrAwUapRh+pfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=814UeZnqV6NY0RfBZSZuc+Zl6CoP9A9v/NzNxBckc6Y=;
 b=GeQhviVv+3mFWOLSrf2VPngr1pPdncKbIbqQ7pyRiu9GkHBYPSjr7exHHLB7KJAZJJ+OIax+IJBHi3YPTF/HoCjvkyjWKPEV+YQneF7RnGGy35mQV+rKMl/+rRDrszG1Znz7f0oQ1R/k33vXElRyFdXHo/GZ5azxFyt/VAYy6dQ=
Received: from BN9PR03CA0168.namprd03.prod.outlook.com (2603:10b6:408:f4::23)
 by SN7PR10MB7046.namprd10.prod.outlook.com (2603:10b6:806:346::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Fri, 11 Sep
 2026 07:42:31 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::2a) by BN9PR03CA0168.outlook.office365.com
 (2603:10b6:408:f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 07:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 07:42:31 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 02:42:13 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 02:42:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 02:42:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68B7gDIr685478;
	Fri, 11 Sep 2026 02:42:13 -0500
Date: Fri, 11 Sep 2026 02:42:13 -0500
From: Nishanth Menon <nm@ti.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling
	<morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Judith Mendez
	<jm@ti.com>,
        Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        "Devarsh Thakkar" <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Stefano Radaelli
	<stefano.radaelli21@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        "Sebin
 Francis" <sebin.francis@ti.com>,
        Kendall Willis <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
        Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <20260911074213.uucibicxngghf4rt@famine>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|SN7PR10MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a35e415-7981-4155-bd0a-08df0fd83c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|82310400026|36860700016|13003099007|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZsWztbZnp/q3GMWykbdkcknGE4NOI86bzH/ryHOyLZGz+kt34s5hlXoK30tAz2cLOFa+RpvrFrkwe0tfQX4OrjfvE3VkJXZ7FqhPeJ1Abq4mUiNHKLCzVSYcBTgrbjCiRKIe44P3spzWjds/R1U4hBeDLztAxMSO5TsEffu/0pjNMepaY5ZFxlyOVn4dWPsLryFSuT4hHBd+Wt0o1kEn3RdL5MOm9SubFUWpBBjlw0qwiknRw3EshSrvj62vqC64HgS2FbBJgQ8O3WU/R4DbtV9pUmy6as03UKCb66oeoT+swTqK1ySUZqSWUtIeHuf6H6VeyVGxwouVTUDUr28kzingZIA1TzwX5U3rAxKrpT1Vt0UvkbGG6gH1LDXhpFXwp7BHASTU3qlAcDRJy82sLjPLsKXeBiKErYkTK/m87TLefk2cgej4wnFDx84yVrMlQQ18pYhqFlqmRi1qWTw1ZdwOYbmNlWBAxbaCpvhcceShoEociaBHiGbLr+F+fsIlN68zqEygAPxk+h7TdRYCYUMY9F2xFxdc2CG0X3GEkOmRbXYksaRHy5EUuC6U42vGUYFimhw4n72LOeAbEgsuV2oowU4oTrRQO69BLM1mHUUAZHfGBO9l52GU0rWla7ptnrxvt9FTuLAn7kWLgjjdXBDNgsXLiubCBSS88151NCFkDm3MP1WK3n4AJK99F90OmS1ESMm9gXIVWAlL/0I5Ug==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xYlGaJEqRYz2+m+ipoqna0myLJUrwAFgeQGearnC9tZOL37CQ+QHdZ7nJOXPsSsmFQl/d3EsPDlbnz20OYudIByW63SK7AqldXuqjJ/0XqxyNqmzjd7CXC9FtYRpkV/IjznXeip224fw9lkFBezQ9e3KrpkKqrfQs1XF6kiWw9op6IWEBug5wUSYodhNPtxBQF28SCZ59IPEF1TddLQMMsA5SnT5W+jE+rbVn3jH8gYIbvA9gmuNV9+IlW1wNE1FpGbhSkAAFT8XYW+/jGyVfISczmIjv2mqx+GcbCY5w/T+keHqsLoyfIhOE+bGTJL/2IcHyFI0/QUTfSkedt0zuGoxbqJZ7cqgfgcXAARXui2NLfaXu1KAukcf0wLGA1sw4k3WGjfMRHHQfvxfRREvgd6Iai55Mr3Wx6lCw6NGlCWg1KIZODv27AOwBj8V7FAZ
X-Exchange-RoutingPolicyChecked:
	yQ3VyTFm3NyOq4y39Uwze33nLc/de8pno5l4ERkhHiar+anmst0pezn7EPTbxUJOfRR/kHNW5g6LVBClZPe6s9xif1HXMWYio8KgVuoVRWtyGBhrbY7iEcKV11bL2ugexfA7E065svEYQKrBLOA2CKwAxJrVIsnmY9J1suQOaRusK0OXu8/xFJsF68kTnV+xYVKtMGDfAw2mJZcKglK9kUiG6Kl5XUdLOnvs+XDhci2P20gxrRpwM3CQK9QjwbLqyUuwkLoPIEjjHr0GBsuBxiUsiH5iWAhH6YB0AvZ38Cq1vZhIQG9xBn7TzAWJAFybqeTQ05jrY3vLkcVyRSbeIw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:42:31.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a35e415-7981-4155-bd0a-08df0fd83c75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7046
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNiBTYWx0ZWRfX74RvALOVuLMB
 9cHUoLbcBceAK4fRYs62ENguVkyLRLwycpgHkk4LkJGW5qOKvQXSRRa9Fi1RgqmFqPogySPlr7u
 OTMumYQRypbmL41wWp3TytWhlpjlbgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNiBTYWx0ZWRfX7E9uMz/cRx4u
 HzfZqvMheNNX/lqCmAY+pxij1RS4TNeHh3XCNUx0w8k6u39H2b4bj3EIqdVwJAwkO8fyOHqcSSl
 A1e2lkFErIdreDn/CD0YDv+c7KXCtMnTiW7ktK2ltbmRxh5aQjb2noLeWJqf1d9TUkzgrIJbSiH
 JNKK0v8XGU+tPzz1FNqa8DQAcU+n5yrGgufbSZwntQkQC/r37JvlrPGe7poMVldr0EYBczOc6SB
 YszLK21wIb/OYOPaK/ng55Ke4Kq4YjPE25E27q3LtAkZQvG5vpitDmEHE8OzMKNIiyUI9885BRX
 HL2qXdmJd+eb/NPFUMZY1cOGBwqUc4t8TfPjaptpvQnxk0TUCsbhXuaUxNa6Vsh1oQjM+HeOQ3w
 WfEj6qs4LnJjaZZ86KLlkUW9enu3GdnAF7s1BzwVcUF5OQRV8nhcGH3lzNfgqzVVKn1dDmOtFcR
 RnXh+iaVBiYSRUQd1Dw==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa3b0ea cx=c_pps
 a=MBvOscNZ4ImqL1nQClNoCg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=1gx8R7YZUOk8cHEP82sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: AoCJ9mw9YaXydau0WBJDVvl-C6SzV8Fa
X-Proofpoint-ORIG-GUID: AoCJ9mw9YaXydau0WBJDVvl-C6SzV8Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110106

On 14:39-20260903, Markus Schneider-Pargmann (TI) wrote:
[...]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 84dfbfd1986c..a343166b815e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
>  			      "lpm-metadata", "lpm-context",
>  			      "dm-firmware";
>  	status = "okay";
> +	bootph-pre-ram;

Additionally, please check for dt style (status comes last and has an
EoL prefix).

Documentation/devicetree/bindings/dts-coding-style.rst

Could you kindly see closer with dt-style-check --strict as well (it is
a bit noisy atm, but it does need manual check on the log)

This specific one was caught by review-prompts[1].

[1] https://github.com/masoncl/review-prompts

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
