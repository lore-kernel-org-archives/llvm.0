Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDA3D6477
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592014; cv=fail; b=Zk/2vJtB3V37JxVKhgNxRxiDSL8ItasTEQ4KCuANwagCl+IU5DbXGoWithwNwa8g2YRi7gJ5Aut6JJb9h98fejXrKmZOTVhVSDSLVnuyAa6Y41MHkaSD/dOpzm2wGXszehE5LosgN2dfX6mfC1cICakDGzMF8QQqBYo0mQmRnqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592014; c=relaxed/simple;
	bh=hchyQghqAjHbsDwNl5qAnEg/B5SSqwP1Pp2HOElOzws=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEZIFDLwt10LPwU6WBd+Y+yOsDyEXQ7G2I100jZw4/37xEpuXTjVPyJ2HcR5oF7NuYunolez2GhXB0fLRbHODIAccheD5C7DuwWV1DUTF4qKVGZoRVHAtUY9rEkLXgoSNPcT+L8Bt6wFJvCyWar0+mZLixB7TkbWk3wphjBK83g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GiK3HAWF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cqpwqapb; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GiK3HAWF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cqpwqapb"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GIjIBM3900570;
	Wed, 16 Sep 2026 15:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=lHYvBiaXUUaCf5u
	IlhDHTXAjfmYXqL3JSnpJ9dONupU=; b=GiK3HAWFH4PFUzddxeh8rNozap6Vi5n
	X65OYdzftUjwk+Kpe6zyagj66t+OFY5pJQsIXFHFE+SmEYOBuNB2VeNU9Hq4GhEP
	lI/DEf0GDJXpWXqEiZ5LfrF7Nmvet8a4P7fZtv/9mfqWnAbzRA/GW4HLaM/rblsG
	dJpVlXpaBub2SAqd9abG3JWscHpHEfBoCvUBYwOr/Y43UeAInvsXSZ857F0CGWo1
	sfmy8tW4YCuOjPLXA2RcCnNxV4pCRMuggnaxdLalZ3oixSx+byhWAbRKYz+X9THt
	4Ztj++1pFM2XvyBxAfUwFAwhIF1HYo5hvmDCFRymZBMi6s9owaX/lgA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqqmdcx7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:52:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxT2CDTCoC6oFuFaPJYstVa/xFTpbo7781/2gOWb1ruiT3+oJgCDQ2pNHG3RL+zGQPUc8HfM6IiBWpRPFPmIjnVh3216MfnhC9DDO4RinKOJEvEaRcZEx1WaYll64H5XC5tLwEQ0cZIMkbZpE1RH1lsk3uacojyIHmdSG9Y4OAaWOee5Wf+VzIAR0Znc8BzH2CPPgfrF+oRnkuywDMpa+8D8z1B+TBecb18A8E0fqvw129oRIhUa7wuAa0yaHCC6ox5nO50RbxCNLPRde26lb8ue/jSULAwyzVOIzv7sFUEeYBfqFSuEJ2qbcuOjIHXGAdGxQoX1RAZT326HwjJREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHYvBiaXUUaCf5uIlhDHTXAjfmYXqL3JSnpJ9dONupU=;
 b=p2ssUK3+8Nuq4nhyj5xXYLYqu4gBYXNVtyEJyHYLnzDSlACI3lRsXUrMGu9zVdChl0E/NovUtS8NLv3lghIKxM2FpYdqgs10Aqp1cORbEv2BMQ2HbsYi/3tJR+1InBj+HFUG2gRIAoPqVTvANhfDJJUmzPU8vzF9f7RBPI6iLg+kEZnau/EELOGdIiXilUNrv/EXLoqaSyB+ubpMklCZLbo2QD2+XNp4k66y06vqvJy+0cU/AATvmghjQrJRVqwTbN1UJ9WMVY2Z9PtYbPC2+KLh86OsVl5avyNAcZKTJK/RYeT7JcIz9bbI1a3ZxJ2QUidltVDdxPiIoni/3/hNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHYvBiaXUUaCf5uIlhDHTXAjfmYXqL3JSnpJ9dONupU=;
 b=cqpwqapbNCprOywods6TKatcQ8EoneztvwX0uiUV1xEyVNZhE4ogrgPmozEgAkdLF//6776H7dCG0QvbD25WT9iKZjnmC8IlwGJgtO10IC2M7kdNxh1HbJvPNrE60MHKNkP7VUs6Yp51ERyzSBJ2m+Jn18SY1/CG5jddyW6ua5k=
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by MN6PR10MB7520.namprd10.prod.outlook.com (2603:10b6:208:478::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 16 Sep
 2026 20:52:49 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::a0) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Wed, 16
 Sep 2026 20:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 20:52:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 15:52:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 15:52:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 15:52:36 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GKqa911706592;
	Wed, 16 Sep 2026 15:52:36 -0500
Date: Wed, 16 Sep 2026 15:52:36 -0500
From: Kendall Willis <k-willis@ti.com>
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
        Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof
	<bb@ti.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Stefano Radaelli
	<stefano.radaelli21@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        "Sebin
 Francis" <sebin.francis@ti.com>,
        Akashdeep Kaur <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Hari Nagalla
	<hnagalla@ti.com>
Subject: Re: [PATCH v8 0/9] arm64: dts: ti: Split wkup R5F memory region for
 IO+DDR resume
Message-ID: <20260916205236.hemdlwzjchmf6jm4@uda0506412>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MN6PR10MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bc6e6d-9090-4c09-5e58-08df14347644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|23010399003|56012099006|5023799004|18002099003|10067099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	iQOS0K65FvcVXuQ9WVALXmol5wTzVBACrfk2uVFCGHxBLf6gQOMPmDYdiHgWK/JcHRgZBwhr/VqbNsGHipF8edM12Jcpgrg/B/Xtn7vFpb/lsUGncMys7UtaRYnTmClZ9lRCooWGiyB8zsB7miCXbkE7VyE+JtPruf/Zt161wYq7dNYpiv6D6QRcHiAHvQSylLBn+/M/3/nD0c3gQA52JeIzOshlWx0Xo5Rrft+sd1NS1h30agekSXuwcwsg/2gBv1ifKKIFPDYWDJjvGnNRr1kik23qcgY6FwY2OZ9Y56osK9h+XU85cSGinl3sbEvqWjnWUA12hCMKoivooK/o/fTLmDlASErYM2YMbI/HM9PBaPhJ6EKkeiNddcDXhnvn/XXQ64WVXXMcfMQOqgEG8mlpD0CSIgIdexglM+S5g8dTatpL1yG6Bac4gI2bjo6UknpwcdN+CjwbcpG0Q0M97Ckt8VMciZzLAEcn/4NOP13sh/vDXp9yFUFY58duQ6TM4x0XllFXYaln9iDwl2SkAvsyOKgKcrnOA6FhbZLHl9tYjSIRmms60bPOioKlm8Gsdhk3VGUghni43YKwaBHRjIndPbY/z7E5Wl+EpE36z+08dHyJDdXxc8c2DmrwaZrN+Q35lCYtbkdQs1PRy18ae5CVLhnv1Bt+JTMnCtt4cEJ10MAMTkG6PWubPKkVJJqrQjE3K3V9zI3Rtb1fgr+eKg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(5023799004)(18002099003)(10067099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4lTpa9H2pZMw2wI2erS8Ynj2wwRJNXPuha41OINBQtPd6rcQ6ybYH54WFIN2amgIGrZqTBIEp299VI9XMw+BCNQLff2Gsw2dqLueA2OwZ04BxM0DJjx8RVMxKmm7/tcXWqPaUzUPE3EDWVDcT1AfxbfZ4gnMW7HPPIhCtiwN9h6PcjQGArRKpS7fIr4/6nXLQqO/xrfe7/KEbaqPajTv1IPUDOgCTD8XVctqcfSAJIzRvHrkgoi2OX5duo7HYj5BRclNz7XaYWOlyLFnrdQUTEcKJnvgmRkdz4HPCGpqf8+rWxxZh0xRCgx8VIyrTlQZdrp+pAI7R2wRkMSNSG3ouT7kZ6WC9kf36vXVp2ds+xNxIbB3oeSbC7Emm4bZn2nL/PancJi2I4D6Iq5nGQm9mjtXuoZ783KlY0dQGBneFyG+4sGyGEVobOAIEQZnvw2H
X-Exchange-RoutingPolicyChecked:
	0Z9WTldtRhMCyxaPwzPHiY2r6MB8yHtLxyk7HXzjxRfScBX89x7sdTJNsSZKsJIgsh3tqhhg7HH2im1p10v08RhS/cuAum08P9bETz/JR0Vbn1Z4YkWahZuONQ8ovYEn5NlTpbKsqSXASncMcQOhNK9NWCLZx2Hx4Bm7DF2Jb/+4SjywXxZ1CoClve+voPrd3dz6MytAMh+9TeLR/JoTs4ZW6iWe/wRNPTazex/R8Cp3k91CHyVXOVczP7QJhKmWrFnUPnpJ+DW237TCxiphQzbozNSrZYJmJl13+tph/Y/2EWghNVGggDJA+clBixmWvn1qyysmHTlCxVVp0kw5uQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:52:46.3533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bc6e6d-9090-4c09-5e58-08df14347644
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7520
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI5MCBTYWx0ZWRfX/wue9ZoPBJ7a
 EsAWd25hTdejZAS3fgnWboTMsdO1z/f2FrGmJoHk8ij86hqtg0j6CJMlqtbx9ptFsQZIsHkvJnn
 Nzf7tXubTCBCoMVR8zP/BKx9qPUGe6f0ZVakKVeYzO/azv5kptES/misvLl9yoGi//rCRiZBkSP
 ImpPJypjD7j4ExsVxWSaf9k9N0ujNDaYF16T5diwUmr2JZJbULv3jStl1pguJndMzUxONn634yd
 RI3r3xCjwntQx12c5rcgrBVllP3iG1zI/rko3SwkFeVGFr6OAgSSX9BwSKZcXEq7fUTQnfftzQt
 tmlUQcuTq30mbzScdUktieTC2xdbd+dfaSYB+Se8/NJEMGnZ1R/wj6oftXdMy4bJqPl3L3o36kN
 VhqWdRCEtzYb67oIlYhUT7mV11C//hrUEECTC1vDSD6OTHn8cKoTVGy/VASZE6lVnKyU0jDE7P9
 04DSFHVA6Esm+BinEIw==
X-Authority-Analysis: v=2.4 cv=S6JMU4sP c=1 sm=1 tr=0 ts=6aab01a4 cx=c_pps
 a=wszTalFPv2ofqEyTcV7qHQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=IpJZQVW2AAAA:8 a=_OlWVxyZ5w-zuUO0vw0A:9 a=CjuIK1q_8ugA:10
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI5MCBTYWx0ZWRfX8tsCvbzJZgW8
 IJRPhyq6S4LCISzWNIuCGHcd+iGSjcVDR73d/Egqs6453ARrjqLZ3YZzE/Ryxav2ORIV+jbf7k9
 0l1sDqVTgeKivNilXT+dtgfldTKALS0=
X-Proofpoint-GUID: g17eH6XFoyVL_RKjXPdHdLtZCBS71Qqi
X-Proofpoint-ORIG-GUID: g17eH6XFoyVL_RKjXPdHdLtZCBS71Qqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160290

On 14:39-20260903, Markus Schneider-Pargmann (TI) wrote:
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

For the series,

Reviewed-by: Kendall Willis <k-willis@ti.com>

Best,
Kendall
