Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8394499A5
	for <llvm@lists.linux.dev>; Thu,  9 Jul 2026 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625640; cv=fail; b=G4/ZuetM6yPeEWOUPVdddsJZF+NQprWjVvVpOxKNE6YJAiW613KeiBhcUs2UI67cakcu+SS9+4n9M7PIyVc/mr8KFUSTONRU7vnujgFY3m8Qfli/2gxFZEOh4pCVcTeA9QzDE+NtopgMyYEoSd/hZVn79FNbhjcPyYdrOLlBZf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625640; c=relaxed/simple;
	bh=jPH27nazxqRxtOjXMS0SvH4RMvMZnfaJPcovV6GmH8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m7juAG3Ax7jyp2pXtCJiHmju5CuUTUGKURIDy5prU2EDu3LRUYgsLHoA4Nr5tQkIRdl26ltIsU1nsj1vv9RTN+4l1N21nFn3MuFREoZ0hvNqbIFEhB/8GUM7Vj+OyTI6YPhwTGYT6gqilfJxmqNngtUkloZqtZLxM118D5GOtMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=plsfDfHh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EaUNIyoU; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="plsfDfHh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EaUNIyoU"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 669HV21f1661139;
	Thu, 9 Jul 2026 14:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YQU+PPBQ5+rvbVLMLuBYk5Kyz5+ehSqZ4BCcDlYF0
	BA=; b=plsfDfHh+GGhLqqhEBaZqK1v6Eom+HNWUdfJ8xAP+FKvtUuIo3Fkd4LGt
	98ElC7Ncr5uNM0kG9PNbik3N0emNHcXcRZzp30L+s8cvQwA2RZbszEu04he6TyDD
	oASzK5KWCsxOVQL45hIxahCFXDIKtGc7nd/CQAlB7tUfSPvfw+E9zCiS5gVFa+Sk
	BD18+8VBi8QlM0LiWmsA8Q5fOYvKtn4G9M7wu2AcnMvgkj2nrhYXLa6Xwd+14/FM
	0Bfi4RyW18KYchtqeeC3geqTs5nbqG7PDHieZfnWNinTSMlYUA+lFuUN+IievH4L
	YRnLwb0FssXCCrbzGMtFZj3ttQ4jw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fab73u34p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 14:33:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5LtLOl+BconJkYTLzNqGwAOmMU4yDZ1AjvA33RtsDrCttB1FwPdGhjzgI0t5rFHEBoxbkgmgRzTv38hiVx/4fr3a562RISw2+Wfz3TKbEnnb/5UEYf4ocnvDcdlSrSDkdLn1DNoFCyv9YDVA9XD8qvPmsvg+pePlTkPSL0HDJpH9UohlP9sb3Tus5B0XQg7aEUOO3/CkHDeeTI7AqB3WBAAYXt4WWD9PPMxh2PWC7dPSjrWH04zVXie8JuHUj3V8KeGr15Wm0ZjHxdKRqNJCbdxPqzKW4KNB77OcTO6miXmejEJiJkJ/lxFMzsPeqigm8UrzB1xODQ2NafhC9W0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQU+PPBQ5+rvbVLMLuBYk5Kyz5+ehSqZ4BCcDlYF0BA=;
 b=RQUL9qEluqLhWR4UDVGVD5OuVWE2Ac4UoXkntJRUc7SwCXJ+JnNH14edu6hFiHsr1OVasMHfsktswBNlm0Q1eIAcozfB5DeEubFWgE7ihiWoc4OOz0XNxx2/U/iVRNAKebekAY24pbD9xSC+PBFAaV69q8v3+okxBTnDpV2nsUb3DKWmXHc1G2Ggc1HcoTLM2eFWdjzefK8XI3wbg6mRRDxjbTE5maYa5AVhI6zB9L/wjjzwMIrzBFu9tv4OKh8qYNQgC7DDAlO73j/auSVzlAQyKzpiNaQNQCruubTeJucno/sUTtzmrTDgqVoYv1UVPnVN7++qcY+t0EOCKenIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQU+PPBQ5+rvbVLMLuBYk5Kyz5+ehSqZ4BCcDlYF0BA=;
 b=EaUNIyoUs5SzjhmHTHLhRnnz6BjAgu/VMlaoSVHLdMkwa09FIB7Yy70UbD1W6xX1D5Q4xbMFOUery97hkH0rPn2BNELH6cOFs4sqEsYn6eZ9ivaLM6DT9ody08cYKFrFH3KHEG0yeQMqjMJ6M77Fi++Q+tcoh16lD4PWVgLUFEM=
Received: from PH7PR13CA0014.namprd13.prod.outlook.com (2603:10b6:510:174::28)
 by CY5PR10MB6096.namprd10.prod.outlook.com (2603:10b6:930:37::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 19:33:35 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::b) by PH7PR13CA0014.outlook.office365.com
 (2603:10b6:510:174::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.5 via Frontend Transport; Thu, 9
 Jul 2026 19:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Thu, 9 Jul 2026 19:33:33 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 14:33:25 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 14:33:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 14:33:25 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 669JXOxS1978052;
	Thu, 9 Jul 2026 14:33:24 -0500
Message-ID: <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
Date: Thu, 9 Jul 2026 14:33:24 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        "Bill Wendling" <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
        Daniel Schultz <d.schultz@phytec.de>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Bryan
 Brattlof <bb@ti.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Devarsh
 Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
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
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|CY5PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 442176af-839f-452b-89ad-08deddf0f6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|23010399003|4143699003|921020|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cTQuSqeuh0S+TXIAEhlejb3qd0tRPb3QcLu3Tyl314tNozCg8x0w0edGaFFYDSzYchZ+P/MQRxEw7D239mWxYSJjmhLP0GKv6JwwTEO6H2trq0DIOgphZ2LleJAAUsQ8WtZPk1A5ig/iWZjuGjgd8MPnkLOLdlW264Fdog+Fth1yuGLoDbG0NvaZnvzwxCmcoHZn1KQ3u1Q/Jn+s8mcqpJnVXvIYPunQHlFCZYG5tdM1fDxrL3ML5Tc3BQHOr9HN+cogmPmXhYlmkxxKYf9Lhyz8ArWCtl6U3Opz8Q04wIs9sEuxoYFyJbj+0FUidBu3A25lJDAWIY96+ZbWaK8js8BGF5subqa6ujn1DHWgpAWJTdcXIqb7C5EJYMt3q2vFFK7zD8rx39Iu+io7gYqaBjWH53UbQCKiMVVjxMwbI6Wc8E6/nKPm+7hH4xk7Uu10oc1JkxL5m+503frGoq6joyUBGIKY9rmNo18t/zDhjkJoFDOzEgcRZny7pn/tJp6exHgRqX7VkrjdglA5+RfL5NdoVqfOMvFsj4EfhpWTwfMheeAmujJRlpN4OisDjehqrKWY3bzdGjWj5eCYyphwATN0FOzV+0VkGWq6QB4yPi71CfJ27SK5ZqVu6wawfaI1vam6CXiR1PBC/xf607+h+dUkbGc1qqS5lrNd5b9MSCYIkTO41KbuDeQqHMl35OLF/ycdeCe1feXKjyrsd9sy4gJUgDSBoHmeewhbKxU5idOI88xNpDN1VoGcmm7tjClq
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(23010399003)(4143699003)(921020)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FOisgpeyZwLrikP8mAzT2D9twOXNJTmAmf82K2YOeisBnmXTPsEKkcIkkyz8cn9TykZ9LhgtZzQXTrPUr+pn02O4KH0vxydoV1wwU0V6wLCMNXJ1SACwCe1cvVJpfqj5CETaio7ziGCO6tV0qmcuPc/3gf60uA92UmkUUoKdA6ORJIUfJPmr/c1cAhvYHKCUOvkDehkEldre8Us5bbYUeOld/Ep42uj8C0cYSQqddFwW0JYg1b+g3yYHktD3b+y6rL5Xn3/N8T1EZ13JF3V1D6CN6iq/PInkq0bYK/WOigXxz158x1PBxG79OIDuQb/dtNhF1RJjaE1V24kEJfJLliTID+1t+QcTXa74QZ9VYiCyIbY08BepY+xHbFlvfwQlN7jVMdRBGMDk8nCVkUyEslqNuLcngUqmNYUiQXYlavBbimvGHtZW/sMrZoUiqKFh
X-Exchange-RoutingPolicyChecked:
	eQqnJLQkpYFFjO1j8rcaW5l7gkOpPuhDDM5WQe1NkVoD0kcfhl5vN7na3ud3OQ4Ch2uBJ3zWZovEsRJIDuGwbmPlNhSgGV/8VrFFaCTRmHOy6q0/0qKxo8rxPODId8VunRCO3ddec9Qlmj0nLB2o9GhU++HZ82D4XoFp37+nRHcarFPeuhT73SiD8nuqXydLPWqXOOGpQp74P4QsFFqdMRs7ia5F/YuenFyii/HiBAozFbPXVAeVEYBDPmIEAtvvqTP5SdCLRAql1yDcljoqozhTGeczaiW5NJGVfZjBSW9H/zzheH9llfCYIlitqkbxgAEZbVMJlfhvO+zAQ2RNew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 19:33:33.5844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442176af-839f-452b-89ad-08deddf0f6e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6096
X-Proofpoint-ORIG-GUID: Tej-_FAzhiAfPI0CFjZ6CG8JDq39siz6
X-Proofpoint-GUID: Tej-_FAzhiAfPI0CFjZ6CG8JDq39siz6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX7AZ9/QFZjW9x
 qs3assS5/CRBwOMhLPnr18sHmUBM8mrMdDbTMR2xcClpOYTKhBjgFo8jd4VsmMHj0LA6HDdIxiZ
 ya5Y0F3itGO3QgqFi+mY2OoKWFOSnCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX210Jtfglvi4U
 rwcNgdYNJDM0d8SNY54RknO2ix8W1drPKfg8ASzdPq8tGAjq7ZKH6kQ6WD2qR0yE9q/Ft5KuI6+
 IRjWUUKE/dxv8iO9HGiMBl/SaT5xzCGaC8tu4E7VxncVqRIfh8+aDIpjTQ03nJqJyAle+BjOjvz
 tx4dbbTN+8EUzGK6lgyGElMXcIkt2Zhj+DpbNi/LTemwMGr0lF0VdZ+8Wz5rMZ9xA5/ICXRG5Yc
 yok2+qlL0Fk/C+Yf0bQTwbptbK+TqggDVnKaz9OrjfWCM9N5czNTwpfChjTFO1j2oesXr2lEXiV
 rlwQ4u8/SFIfSawb+D/mGr7/SvZpAAxy++N+Dj8IwkutlnDftk8FHWsQrV6xXEMuZovu/6oLQGv
 csnP5aqXTRahWFpOZPrIjti10675tUQ4uyyLjCW11zUGWWn//NLnODc548RxCaOZslRm9ulvJxD
 YYmy4iHnJlDR4a9nxrA==
X-Authority-Analysis: v=2.4 cv=Ovt/DS/t c=1 sm=1 tr=0 ts=6a4ff798 cx=c_pps
 a=8Mab7lbrFfecTh0PXXvUKw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=IpJZQVW2AAAA:8 a=6qXCup2lScmfWEgLmqwA:9
 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194

On 7/1/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
> Move the reserved memory regions used for wkup_r5fss0_core0 to the
> k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
> boards as well, so we can combine them here similar to what is already
> done for the mcu_r5fss0_core0 memory regions.

The reason we left this region here in the base DTSI is this region
is for the DM firmware and is required for the SoC to function.
The other firmware regions are all optional.

Andrew

> 
> It also moves the bootph-pre-ram flags from k3-am62d2-evm.dts into the
> firmware dtsi so that all boards inherit them.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ------------
>   arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 12 ------------
>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 17 -----------------
>   4 files changed, 14 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index e13da7c95a30459e7649f284689039b89a95f651..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -59,18 +59,6 @@ linux,cma {
>   			linux,cma-default;
>   		};
>   
> -		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c800000 0x00 0x100000>;
> -			no-map;
> -		};
> -
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d00000>;
> -			no-map;
> -		};
> -
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..682b1c9f3071ddf23044c1fde1e88f2b901ec64c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -29,6 +29,19 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
>   		reg = <0x00 0x9b900000 0x00 0xf00000>;
>   		no-map;
>   	};
> +
> +	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> +		compatible = "shared-dma-pool";
> +		reg = <0x00 0x9c800000 0x00 0x100000>;
> +		no-map;
> +	};
> +
> +	wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		compatible = "shared-dma-pool";
> +		reg = <0x00 0x9c900000 0x00 0x01d00000>;
> +		no-map;
> +		bootph-pre-ram;
> +	};
>   };
>   
>   &mailbox0_cluster0 {
> @@ -67,6 +80,7 @@ &wkup_r5fss0_core0 {
>   	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>   			<&wkup_r5fss0_core0_memory_region>;
>   	memory-region-names = "dma", "firmware";
> +	bootph-pre-ram;
>   	status = "okay";
>   };
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 08c73cae26c73993a613372110bfd5611c403846..27801c22a550330b52c4424f919d80f10dc76403 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -53,18 +53,6 @@ linux,cma {
>   			linux,cma-default;
>   		};
>   
> -		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c800000 0x00 0x100000>;
> -			no-map;
> -		};
> -
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d00000>;
> -			no-map;
> -		};
> -
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 463a3f6130b8f2927a032137e87c01df446cffda..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -59,19 +59,6 @@ secure_tfa_ddr: tfa@80000000 {
>   			no-map;
>   		};
>   
> -		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c800000 0x00 0x100000>;
> -			no-map;
> -		};
> -
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d00000>;
> -			no-map;
> -			bootph-pre-ram;
> -		};
> -
>   		secure_ddr: optee@9e800000 {
>   			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>   			no-map;
> @@ -776,10 +763,6 @@ partition@3fc0000 {
>   	};
>   };
>   
> -&wkup_r5fss0_core0 {
> -	bootph-pre-ram;
> -};
> -
>   &mcu_r5fss0_core0 {
>   	firmware-name = "am62d-mcu-r5f0_0-fw";
>   };
> 

