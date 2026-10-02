Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D11BC2A
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 01:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902919; cv=fail; b=EAmxNgocfw+YziAXeMI66sch2v3oywgHgGJ8Eo6f63y/Ew4Wx3QQbK0Bhne1RAUWEIlDhY+l2dBtPrIimFgr3chCyqIxy5ib74PIRj2OF1qqucrl6CqQVosSvTKErhWODmpQS3P8HHK5IT3hpPyCgf5qVymO4KwVB/4lRC2B8js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902919; c=relaxed/simple;
	bh=sQ5CehN+Blk10n2TerQJuNpf0R4zMaKsLh/c2nceSLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMev9G42ZhnbilNjFJaKotBtUYC/aM2vlzdqwuZ7YpanHnkSXpWcqLwsfyhy+HLfVhWeQwsVfx13hn7z98vQbSiO+lihrL1VSrS9+sen3WUDazquJXU27XCZKliRIEPe7Mgkq6gbGzCilgJ+jWNJTTycI6L7ex2JxLuRsjGZmQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=SRJypOYF; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=bUHYKD8j; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="SRJypOYF";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="bUHYKD8j"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 691NFjVj2972220;
	Thu, 1 Oct 2026 20:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pGbDLYk0weJhNHI6OkbXtbDdjgSiobmM/ifRw33zY
	Cs=; b=SRJypOYFAMZhPtti7KfaK5hf+EzC6pCqodNuEvOW82q3KpqReeOGGNuLL
	fkCZwHgfQeoksnM9xXKXsVCfdMl4U+aSSHRi9enzZxMINt3RuQ6VQGPkOYMITbo3
	jsWEsUfNBTP7OMQ+l9Xj+8EZYjPSu3uBWjj7cQRmd91ke2kGISEWubAKZKKrrw+V
	eedkQ1lGhF4T4HwPrE7J2/u2yowgTSfiwh4VGIqLbtAKZnAPLTRX0g8Csf+5wlQn
	93Cv0POvC836PoZak01Zns7sq9mEsZFP0PuqkvJ3wO6X4WZBgerqkODJ0Yex3HT1
	2tYxH3fdyJUIPOtFZ4ItsXgcQmtlg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqynyk4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 20:01:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sia3HWVe4v/lBo7+Owb5lyKCvFUk6g7uA88KaqLVf1f07NA3XIyEV9A+s73nrZgTcO5Qn/jOVGmUeaf0OlmlMny8kzKauMbBWH+bOxGunc6YfRGkNclfeP/0rlIt8Krkhm67UmDwqLwtWiAZJSBBMkGuJFgVasHhqtzUXveGqfycWjhiuOKXPzbsacPw47bAfOKBIMJWeP33+y0qTu1ELFOwHfbtyoDFzG3mmEHn+HaMbBlNpLB3giJrIRa/RmEhRutTLQcX/OKQMroaVk9g2E5w8JuFzNOfcmiwB3tNK1TdeIOquWhK5JT5ZSOSypYewbPsIILjqtzBvP4eJwuHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGbDLYk0weJhNHI6OkbXtbDdjgSiobmM/ifRw33zYCs=;
 b=G+CY/BbYy3E6qL1rObYw5sTPRybEDYGi1t55Wt2x2aHNyzmF1sBhXR7QBiahicREu9IpzzxI+jaYACqugxEVeqwZmBnUpAOhOdlBYtEdc0BiaUGK50OLo6tVJD3qU/hSHo5Epgpb/S/ngogvUzxxPnml0R5wVK18d1+0djRGjWHQJ1b6gnUlD7hcy1Y+gtCKVe/xcxH+X+nygPdkSfkVU06ni/fYr4ATF1fh8CJrE91P09UxTtjVzjLz3Wsc46OTq+uqe1spoIJOCRT1oQEOFEzmy2qTnnRVUaMacBTUVVOJrlnaeLoqVW1+CV3cl4qP19SxQSQ7z5r8kODxX99grQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=variscite.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGbDLYk0weJhNHI6OkbXtbDdjgSiobmM/ifRw33zYCs=;
 b=bUHYKD8jVTBBFbcb83Dfmqcy8ZbwgPWHUCQu8zTZSRWSK/gOYPBgu/J5FDvIJvkNN6GSyWJboya4AP51X8r4zXrcyfnRsd78kA5PTKNZv3kOU4CtRupsPs8gTdzXJrIN5D11v7l1/2Q+aeiQfBotjlQKOs4xi8UY6PiwuSbCHPs=
Received: from BN9P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::16)
 by PH8PR10MB6648.namprd10.prod.outlook.com (2603:10b6:510:220::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Fri, 2 Oct
 2026 01:01:38 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::33) by BN9P223CA0011.outlook.office365.com
 (2603:10b6:408:10b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Fri, 2
 Oct 2026 01:01:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 01:01:37 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 20:00:50 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 20:00:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 20:00:50 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69210oUN2991788;
	Thu, 1 Oct 2026 20:00:50 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
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
        "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Sebin Francis <sebin.francis@ti.com>,
        Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
        Hari Nagalla
	<hnagalla@ti.com>,
        Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v9 0/9] arm64: dts: ti: Split wkup R5F memory region for IO+DDR resume
Date: Thu, 1 Oct 2026 20:00:48 -0500
Message-ID: <179090282701.586197.11991528462742940397.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|PH8PR10MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df93144-a4b0-4336-31b9-08df2020b61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|7416014|10067099003|5023799004|921020|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TRxRUlfc9w8o4//invUEMc+OSd/J6501nSaf8+gWpTAyZcSRuxn1Hqv+xidP3iCMc2exKmfzSFsy8g2Rmv0dhC9pH4HmBMWbSPQjqAaFzO3st0RI5fel6EwrS4HeTu2VgMtTNzN6shdLOXtfbdwXPnyWA7wU66A/9Gaei9ZgPIr2Hb/zW3aiAqW2hl7p/tXScpWsy9kM4y/rFxC6V7FBaYBWbVKwZX04kJaXZ7G0OY0sMmVmTNXie6cqo0e0H/N5xeEy/vVPXqrQGvChDSUyp7rCt8Ocxowy9oviEIqq660BE8t4qWXDmsh3uTy4bIeZQu9wVMeLPJZIviYRAJAto9t/cZxev1y3INDMQi1YDCoZKyf3cd0sVyHD+LHaj6fV2eap6n4GhXIwIOREGBY0nj1IADZJZbtSyAtILC+wjOwWEd3opq8CZtp65KL0htMWY+YJeCn4P2tvJY3w4FoSlaXhLfgLNTxD/2qEuDU4fn3Ca1hzfOMZfhmmtk4BeAbCfeHKsyEU5avi1bRR7HaKCOIzTRh85t3i8eOBzrw5v5kBkQzdmzDC5oetLRB66epZZ3Xq7CzQpyqtOBd5KP6GM0hDRXUlrFpoE4/FrHwNNbVGxbMbJb4FYJ7PDPoyHfjs2EUI57yibH+iQCtlaPE24FeQOnBF5eKAu1jW+bCr1k6DB/kVQTVQ6+7aD89NIJuIOEQu6uVOwYhencJxaxcvUg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(7416014)(10067099003)(5023799004)(921020)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d+zt/6xi+Uyypj8u7lqbIywbYLVhDrcd/gUpdgKKlmfldDvGEPe/1DOSKdNiHmj3kUkOnAS9900ULlFjwgtB1oTv8FNXB+uqtRWLN71+B2er9CwvmZzh68OLwtBrGuYS14sTWasS2vst9w2jWL/rml2ObCBjwhVUhtoK1Lb1oD+irb0sSVm2nWwBz6UpuQklfokiMyvozdJqFTiLjQw1VdczJg3sh+cVjHzNHOWHKpYdeob5dTqFZC9yTTZq3w4eUDnAVCq7nS+scExwAP8XDmwe/aWmbgDFT4ODIIgaGAhOCo6iRvPHsuhmsc7kBAc2XtlENxTeM7PcOM/PSpazYBeJ0dYS0lFmavi6E5r4yl92mbLdO5F/whYElG3GqgFWJnq9mAyVDp4OVAQD5mxxIDZUS3LpWZwKrcTAzJksKX/ItgbQF+X5r9gIh9IxDD1O
X-Exchange-RoutingPolicyChecked:
	TNAdI9JarBV6Qvaq/WvzITg0t5OlDKNhS3F3VTbyX3UQBYogq1tL9MugeenJqjSirKPWmvKccAuIGtlwds4xFsylLEkUgHhlCYBJmIMMNonM5wfnahksQTml6GsbN2hNONpZ6zuNl6YYurNpFmYdSSsGsDYRpWeQB9OW028nDg1Lj6qG4Dnyj0LRggaPmF75Olp9WQEOwp+DSzV/cKKVIi1kxqfLM8WEIiZBXiIFRbrdLsEfY8UP8zDpx+5/RH7QAlaAf2IdI1+J7S29X47pK5JLdRl+hex0pN8ORdcr6P7+rttwGHyI6UraLL9bou2gsVxfmV9sl66enhZVH9Gnww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 01:01:37.2126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df93144-a4b0-4336-31b9-08df2020b61a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6648
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMyBTYWx0ZWRfX3fjBeO1hsxUY
 Ana6XAJ0plNprT7hV7sbfZRC/miGHnuXU0w8Jwg6t+plDIncwg7ubdfA5bSOfGz1nwyMZ46lKv6
 7qq83hEcFFBNarJjXwBhvCFOwMjVhI8=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abf0277 cx=c_pps
 a=/mfax+0MUk3zis5Hx41TAA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=8fnee6O-n0vwEk54MJ8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMyBTYWx0ZWRfXx80k0nbEspLZ
 gwiCYYQHX2UqitiRePwJUchcaMCVO7xjVFxLrR5i6FPD2Rng5rPX3/sPsqcTaw6CLub3Bcr921t
 vscXOajkUnAG1BO6qfVCAI6Hzw7JvCn5fhuPg4phnwnSp5Jbh5FJhJxDc+Ski8KcZvxn0H2cRye
 SM4n0Ttjk7HMZOjaubYWQEU069L2I0086wtMkv/M9jy9cm/uOAveb4IAP5BMef1/qjZAUVgmdRv
 dSNMNsd8JhHbMZvQERjXvq9dyPx6OpBTmuModSfIeJBz2QuaHWam9mzyuxaLNOujbAUaVuU6OgR
 rTff0ly85Zj3xVeapcs3DauM/xd5qw7F8smehstAtkQkzGZD6zi/sbXcMAfB+vfvD+4VoNmVdBs
 iESWecHYl3GcxtY1J0e4DyR1GhHOwDtapc4HRDlBt00YsULd7jbkSf01ZXjFfy5IaY4GLa+W1H4
 YQss81G5SfFHwJcWrRA==
X-Proofpoint-ORIG-GUID: O_YW5RT0jzbhl1fzAxcvp-dLb9D5JNlg
X-Proofpoint-GUID: O_YW5RT0jzbhl1fzAxcvp-dLb9D5JNlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020003

Hi Markus Schneider-Pargmann (TI),

On Fri, 18 Sep 2026 11:17:44 +0200, Markus Schneider-Pargmann (TI) wrote:
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
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      commit: 3690b591d07a2e8863eb96e2aff740da47b8de03
[2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      commit: 5dd0e5b9d5f67276ff291f30da9bf5a17a46c48e
[3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      commit: 8d36eb58c06b867f29a8df2f39f7fe6718c726af
[4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      commit: 70c9859fcca8dd964a588a0642aed3bd71bc1dcd
[5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      commit: 93cfb76923603ccaec3720dec065a7874458e67d
[6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      commit: c9b15cd49b3fbd54f3382655b4e898921a7adb4e
[7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
      commit: 13aea49af974352c2a6a96608bbaa3ed3030706c
[8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
      commit: 46b7261c2bad842e8b9a25106c132bb8ae83d634
[9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram bootphase
      commit: 0d14dd104de66eff1500dec9e80d72c4ab82b608

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

