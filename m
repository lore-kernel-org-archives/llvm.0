Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355374E13EF
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449750; cv=fail; b=AQxl8kUE1nCe6dDwol5nO1uzz6iI1zvAqXmGNHKt+eTBO5nN3VmTTtfV8RJUjYdDERc99+Iz+7b3MbzV+oXpM3+vf3DLd8oFRTFE7R1tXBqleukIxBlihGZFloy03PMJxrWXAiopYIvP/ijMknevaqPGjvyDFyjl55D+PQAS3+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449750; c=relaxed/simple;
	bh=rXVWmCHoKhfGBLfuLbZn23WRet69dklbrhN2Oz+l7fA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pobz1eQjKR1bu8Utq2cOv26amgL9jR00Ne8DGCV3M5asy03oEkZJLJ7GwGoebn4KuzEMLaZXfKxbBCKvTmfyJn+hghwgIRwCq64+4EeGPGNItY2rnpMK6zm33516uo/W6JlgpOcMyDZCW2+fQ+pa1/7yQtq8jsrgVrtzu3n6/3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Tw8NIl6d; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AtLzcVEw; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Tw8NIl6d";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AtLzcVEw"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683D9Bxk793968;
	Thu, 3 Sep 2026 10:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=yVeA8sfXPtCoiC6
	08bsir4m3Gs0+zlIvWo1tJyr9nF4=; b=Tw8NIl6dkoxM5uzgQeyVU0fzxugkCXc
	t1GbDsHweuvkg9RQcGtbF9fJzp7UHO/tLJDzelav72dw95Xznq7kK+SB/v1ezN5L
	M0Fp+fFhiyUqGmt+P4q8xRVwlcQfhSNo6NIaRSoH3q152Fe9Z6S5dXVmwBBTXU1f
	A4/55bUJcYYS8BmSRtrBX2vl8Lf9Yopp710DghkU7fMQTMXXpBIPx6xC8TkOnRmK
	khnCYVa/sizBUBCeRUB021xDCdMXLhRNenYT4Z8E3glqDKpm9QxwXiwFkNeWLfBA
	T0NymlQYUkaY4pe9Ht8gTy0Fnadanv0zUBJd4pG6J4v45InzNGn95bg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gf68jae0e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 10:35:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfqAnoC3VOb7s/lxpera4Nm8zA4HTxmH6gxdYVX0FICDSpn7m/tpCXc80gRPHbXg0QN2F4kYP/XfscC9NPgMbePPJm/7F3YfWhXYFOleaPWBjngOM3iFXzomma1RFoNNBAdhhAb1D9SxBqUkVs5U1YmorTQ7I7m7gL6sOJSjtlM5HlmtVW9dJa2x4O8eEWynU/75opnw9amjnMIQWicvoaVoaDu4rwo1e2gN3qoG9++qxGdcEiCQwcG84pGYqHW/baCH34LxoAb3a5y1Nfqk6sDTmaNAdLPCDj0gtsyi53a3Po4W/7Hxx47fJXkjq2a6jotSq73zZZ/ftYj6RsRRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVeA8sfXPtCoiC608bsir4m3Gs0+zlIvWo1tJyr9nF4=;
 b=gQ1bM6YG2ae7y+lHdsDVrdjsWIpg39UDoZ+eHhXEaGE/3QkccgGJy7x7CBfUJjd0C0xejjA1nQQnexuMuiy/5xh9SeLL/LoF1MKwa73MUBaL/XLd63QG7aoGXPwEgJxW4kQ51rpKR0NIell5kdsrLZkDCOAcWR27m4lojuOKBz0vKeyGUjTZkzQ0i6e2kjZAv+bymO8Yty8rf2VaNdVJSslKvxjwFtOm1T0G6rl5d33oMQ9dGinV4J73hJKcgZhW7Vecxvy7Nn1akSl//PzVbKZ0UuyPQThmMsZlUKGQ/kvoD1QRBJ5aHxHVOYv/+CznPJ44teEOxS5tMH/wXCYYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVeA8sfXPtCoiC608bsir4m3Gs0+zlIvWo1tJyr9nF4=;
 b=AtLzcVEw/dD5grgd4aUD8sny5oZUjsROa7dJ2datQD/mdmX4jZ5+D2DXBChewJq0a4Lt+LC4Y/Te0mkMWz+Fi3qoo0gg4qnGwamN+4L1QVcjE7SV/KeVPgX0v/g98KrbzC+gAE5RJHrGvwnkI0EBXajS2MFTj+0V8ZoSaT37v3E=
Received: from PH8PR22CA0010.namprd22.prod.outlook.com (2603:10b6:510:2d1::14)
 by PH3PPF54E75B76D.namprd10.prod.outlook.com (2603:10b6:518:1::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 15:35:27 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:2d1:cafe::56) by PH8PR22CA0010.outlook.office365.com
 (2603:10b6:510:2d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:35:25 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:34:41 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 10:34:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 10:34:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683FYexd2814637;
	Thu, 3 Sep 2026 10:34:40 -0500
Date: Thu, 3 Sep 2026 10:34:40 -0500
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
Subject: Re: [PATCH v8 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Message-ID: <20260903153440.rtw7admu6wfookqt@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-3-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-3-74c650dfdea6@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|PH3PPF54E75B76D:EE_
X-MS-Office365-Filtering-Correlation-Id: a6261f1d-7e03-4411-196c-08df09d0f9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|82310400026|36860700016|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9jkTdVVzxfBPIFccF+iWRTsSHjsDcPsFJ7YBrBGCpQplphYZz1xscXtF5NIWc3Cc9EHcGswPXWAwZUNbmdEQlQUrLhzUxguzWXGtibQIqHJOxyLYdsqsb8l19lOk2SDDO6iiDGwQKPCi+x4tIMWNzhr76SMd/ehV4DolOiOllfA1fPWzYwmkQAsx/NawUvQBSoEeLEM5ihwqx442wnQOhaG3OxZ4lmAWI5Hn9Af2miCwpdr0K6j0P6ilvZZHwbWLQLEnKzjcCSM05rdBAqMuq0mS7cy55vmJVfCMKG84if8a7WGNk6fiBC0SDQj2SuMF78WK6fwHAgtg3Z95P9T++fj4Dh0RKWMtPxdXOo3gc4+Dd/6nESWTgXj1OR1djbjGlkVcQQ8xGLnK0/TPoC9eYRNEpMxKsWu+2+WgLmRJY/qhRaPtMmqPvO9DxnehmLDRHWmCO500ueSVMvoJZubEIlZQSJEbqHA0olkLAAfuvCuBlCGpMQOp3FPNgZK6G/ap8VRE9TsswMAFIEWkAZu0YL/3wJ0DOmfzgXHflsaBKGaH+3ccw/iijBpeUrOUiHg8HwJw6IVzyfVWzoJKH7V31IT+PANlQmE3Ne49E7N4NQQD7TTnK6ZfE/7X+c6BmFBdSxkFOVe1W1Tp/7v4T2Rrtg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qUgDSb4HuXkzJZXu+mV5tETE4n7URprD685+ZTsfJQW3Kaf6aBgH9qahLjy/syrUsZmxXVZG8AHlqXG+jJCoxlejEiGzysuwiAtYMbRpVaO/s8BwdSYrw2PVLVUfL6xAkyhpRuLhAAL0Pfca8IQl6B1uZdgV8Gl5nWKqJDfFbW8pCZASSmfo+mN81dNZl1pgZ6f2Ga79FkHWyH4DPg9eIyGsp4HjJdkawFu3B2lJGOAJIR70gOMHHWiQzQnrAQK22QD0oMRaalMmwTTaQhMqykuZci8sxse3uKSQDWvqttXQKxtDZHU0GtdFY14S9plGZNeM4zL8ThR7Fg9y4yzgm8guAdUOiaXE+izluPQx+H3UDu5c1YIsNYG/BvT4N2InA/WDIPocUxXGUd5ZuayLifkqSs5nKTE1z4wSbCE2lSbPGOnJrZFQGNbJvR0FVURg
X-Exchange-RoutingPolicyChecked:
	yAR3N8FA9+E5r3rU+P8Tref7oCOn+J/jKvzON9I8iX3AErh/TokH5rkMiB0V0wpywlq4dy6wLVcZ2Tnbs3fYdxOMTt5sYjdNytSLT/UbSDhmgnFLEW2nV4qUqOq+epj0543DEYx791a9MEVKe9j7HGgTozsyPkh1yVsBWjzdPfGOJP3GoKO6LiUizm5If2KS4FjmETWw+b7vmsaPs/KJkH/JJsk3wE9kQaEnrqD5Wi8yvFvPdhzngaiTbBHdK75I2+HvPf+AUsJRjHNCcqLTT1sN9au4e1k2s3kvQ8I55RocDfFepAh/KzkbcGP8dQ8JtGLRvE+OPnSo+z/KOEny+A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:35:25.8387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6261f1d-7e03-4411-196c-08df09d0f9d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF54E75B76D
X-Authority-Analysis: v=2.4 cv=MvBiLWae c=1 sm=1 tr=0 ts=6a9993c8 cx=c_pps
 a=fIWvqWWOoOps8dVAlNTpGg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=ZWcXVxRsAAAA:20 a=IpJZQVW2AAAA:8 a=sozttTNsAAAA:8
 a=dbs-pGJ6yqg6YDvl5d4A:9 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: z70MQgkyq2m89wJcUVY1cgtPcWG-UR9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX5Ww+En1SvmeN
 bUGdIw0Lxi+S4qm7jppylcu2CLrad425OxJWO05Vtq/QpDo1KGLraucCUk1ZueDMqkeeeF6lN2z
 a65TKsUDS0rm4UJ97Cpr1yJ0ExmnxGIpdcqohzbChGOZ6bKRuAAH9B9IE3go/wGiak4gQGH3hgc
 d2Jm9pyJjn3XkOKInmKPRwZUwLpCfnIUNOBCoR8X1bn0udatyUVgJkWpJXM2sTDDPnxyARReyyv
 fbRtr+csof8URGbG/jlHElwjWYjQM1fps3FqOigaO6+6rVfFzL1Unc+SXkOeQJ3UFf0OkXte0u5
 wtZHfdmyeb/3AnDaH5APgiWR104UoREBNQCYDWAkd9s5k01aSnaSnchKfY/PlFAm5JV1Bt7aOE9
 l94OGW1cBOab2rxm3ECo5IQBLBSpFRBhP6UGSxoBHDAghDB1RaUXyATZNSHQ0BT4bdX5ehrSOj+
 dBFoixsxxUE45D8MTJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX30QExrp202+M
 CIXIsM84qW3AW/7RFiOBevntb5BUbA2JcWPmKoF7oat9QXKXFRBLcEFgjuPcAJiaHQOHyxAx33p
 JTPkePvPXUUIuhqnTxdSHwh2HlORr40=
X-Proofpoint-GUID: z70MQgkyq2m89wJcUVY1cgtPcWG-UR9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

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
> Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index d3b3675e7a8f..6e5419de8e35 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;

Ugh this is annoying. I don't like having to reserve the maximum of all 
the DM variants. It seems like a waste. 

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
