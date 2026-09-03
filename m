Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5CB4BCAD1
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447244; cv=fail; b=VF0aEzVayZ2NVXb9SQNXitFS6PAqhksqqeAjLmiB5rDU1GlmPWkpnetjGAUFkCJ9cohV6t+PqZvzBdJt8uXY2VnacDWz0y2bpGDy02P+a4v7nnVTDW/YtLll7w3SWom9jJSUQW+2twQ36yCI4YPAOxiWwabJJPVpUXTRCPuwdzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447244; c=relaxed/simple;
	bh=+qBPIAYxvLPnUn0HPTx8+GQEl5HWXD8w0unuqIM1BS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FVlRY7x6dfYKc4Dlp9Sp/umce1tKPNQgatDXcvz4gVxVch2T7DOq5iHTzJ/GZrUSdN7lw3D5vGwD7J9+O4v9tK0YNCwAV4ri//jSv8cSh+nozoDswJo+LzeGruXJkNRpzb2SUJNz/fwW8MXGw3wLX0wFFXwALsFFNVpNudHfaho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Nu0cdLNK; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ODExPTSj; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Nu0cdLNK";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ODExPTSj"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683D8TD61008184;
	Thu, 3 Sep 2026 09:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Z5MdsVe2XpljclTHpdk/2ULkuShLodsbUYtSQOIpw
	ZY=; b=Nu0cdLNKaNJhif3AQNEDvuddnXv0kgxpBS4YGseAeMWG6WF4Y7+CREUpB
	DRljHsh54o2Hc5QJkDSNWhSAA6Nhr4Re4F/IBZvL/ePcjKNTneteMnzsDGKNhIT4
	y6WYYE231571u872SSPQ3RVIQ1NhKZ8xcQbnyup3KG//9D1jNXJ+hGoW90MaT3G1
	q33qohiR44FNNQs4y23h3FF7R7hZvw1wiMctpDZ4GeIl9iAkexWbQMtSBGATsTL5
	aOuPt9ftFl0oKxLSLgcIXwuEFsI460WZHs3VHAjhGirHuLpH+qGSwgWUbA2OzYOk
	BA/NICHGuP0Ux00Hm8ZhdPlreiJNw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8mr5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 09:53:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfsXKlw9fLbkSngsp3OsIn4qyM77ujXHC88x3rcgV2nR6wZ0S9m4XN/5F+JnHMEq0RmwXBWjnAPo5Xu1S3q16+WtKs8h018rFvaTJK7QTbopy5ARyuUpYt8gum0q1qEhEWxhiYMiNJadhoAgvI7tTMfJBRz1rVxyAEYSdA/vA0EN6xPQeLI3OLw4YKALC+NbdQ12MbBYZTMFupIT2UCA0eDzp5VmqExsJTNbI3RGFB5hAYGk7Q8tA97ImY6CKfALLPfX8kl51IHYpIfwxrKp9EAx4FQcdjr+M42vAapoTzrBmrNaMOrjWRNpx3X7yfNDu5yeIIWnyut4VLQKKPsEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5MdsVe2XpljclTHpdk/2ULkuShLodsbUYtSQOIpwZY=;
 b=a5qKpJutk281EhlnSpHPvD9yznF02EM4Jll6SmLb+BK/472cHs0Dv+x9XVlcwZgJ2HxJCx16OCjDLmY0BYIiReKZDkYaHM6jbvbMOVlDThvxGvPyI31a1PRAl+3uCSV0GoIDLl4rgeXVmTEs1h9p1jHkBmLoQVIWIhPKMAa7INF9qUlfIMSDI3VuBxyepkV5+MyXzm3H9A9Q1jARrKsDvyioVj8EoOvqMtc4iTvqaVB2dsbjG9Vj1N7naMrtDQBkjE0QoBsvCP1j0BQ4+MG6GGtpxM6LOv90k8sxZ8LqBY6yYkxsvSbVh4kl6CAyZx77pSuVjjJruyLEexu+Gpv8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5MdsVe2XpljclTHpdk/2ULkuShLodsbUYtSQOIpwZY=;
 b=ODExPTSjS/YTsX1w/1j7ur3cwO6CTafcEdnTCaWNFLlvHncw8URmJYZAdXS5jFFFbSZGAL8QLwj74IY9Sabdzx9Uq8H0uivwVrGYErlCL4P0Wux8UAveEt2iVv7Q5nKJ35TRE3b6lWiA1RNQYdmWhzVjMMnXf68pezvBucUsPjM=
Received: from SJ0PR13CA0231.namprd13.prod.outlook.com (2603:10b6:a03:2c1::26)
 by PH8PR10MB997954.namprd10.prod.outlook.com (2603:10b6:510:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 14:53:43 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::8d) by SJ0PR13CA0231.outlook.office365.com
 (2603:10b6:a03:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Thu, 3
 Sep 2026 14:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 14:53:41 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 09:52:44 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 09:52:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 09:52:44 -0500
Received: from [10.249.36.221] ([10.249.36.221])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683EqgQ91728207;
	Thu, 3 Sep 2026 09:52:43 -0500
Message-ID: <5a2f3d99-15fa-4360-8c65-4bc44d583d40@ti.com>
Date: Thu, 3 Sep 2026 09:52:42 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
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
	<stefano.radaelli21@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
        Akashdeep Kaur <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <llvm@lists.linux.dev>, Hari Nagalla <hnagalla@ti.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-1-74c650dfdea6@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|PH8PR10MB997954:EE_
X-MS-Office365-Filtering-Correlation-Id: 478d0e8f-3d0a-4669-5884-08df09cb2527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|921020|56012099006|4143699003|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zKyvOH/ZFcpcqXk/QE2Nwk/KzAZiZDs/z4zwrVydaMXeJVJn0efVGTG0s+XvuoU9V3/sjxyAkWmTk9BA+mN2BeQ81VDS8LwpPripRF8Klq2aU1dyXvsX5s6jSHWmQt/rjdQZtYuesGRFBuCsG/tLeGPLLRJhOr87o9/yu3mJpW3So0SFDRssIfIs6vH/SfXb24nictxPlBkxXKXwCOi0delB1DwZLVUJQi9t9wtTIRRtUCIgNq0GXWxBMJEUnG++eyUjzINPUGwGMZXPu5VSdAslEpcz23CzxOEIfZFvaxAXOUlCZWs3Cjq448DeJwH1IuR9lu0nyemTzf4uebdOxvBsx6+IxTMeWj5vCACjCwVFEgYaruVR1/PIdJGbyMI63OvqRI/hYi341dPZsnvJ6wZ5k1bwijZmdUxDhRj9a/LXYVMvRS6hA3jp3XcIW0AkHpMY0z4I60pGaAjxYf4+1giBeSVN+t/YRjgbGrL1E6UtjntfOgOlmziYTG/AdyEjSM8HJ1IkcX/Nld8Kc3poIl8BT9YxPXUrgt+ay4RTavP17PMZGADxv1ltRX+cyu3lPrsDyNg8+FeI1Teq8HqhRfBNLg8HRGBcKGmU8krG6y3NUjbto3nqrUgYCeaIaROgqWJciG48+/sjVUKa0PP9gsYh9gmvA3kOKghNL/F6ZS0jfer/+mLWrGmMO3cnrQ0BSWeo3UNo1IFOjW7HPj0NEw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(56012099006)(4143699003)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7c11jg2Hj9kYtIccZ90okrbRL7C4xEy2LCTbT5io70ArF5qSXJfshoITRvWGrIm/rqlEjAGBOvDn4hLxfdlHj2IUcyEoN1z70/ouuveayTQ0CPJWRTA6oi27F+B5E5xk/nN3yHLriEyGm2nijTqnlg42jcPey/pXPOBXstzkAJ3aFmP0EwMtlY0wASj2fPY8jZLnN8Wapt1YeFeWry6apXx6QF4ndai2YmkDbU4fY/y7wRjUBCP4gD4K+t5tSE8q2kMyYReZcI+g6pZcCZpgQ7wS8STcGMLSP6DFHbn+Le4HZQlKIThHbhhTYCLltefN+W2JepxEGLtPe/GaOWknAGbyrZLHb5UEyFDtyKjUXPJjOVujvQYvZcQ/FEq4tJ8hblnZjp1JE9PnnFGlGIUB7/6wnb9DvyNRY6Hz6CeVVwemFZiPPCchD5jBFGUXlVb
X-Exchange-RoutingPolicyChecked:
	BGWgcluko68DffQPJhgzPL9LlO8Av3kUogQ7DD8bWTeKHTvySZ9Qm99+Js8kLRh5ZslVl14AwjRFGmTM8x6koWADfe3o77BzycoYA6XqPYA9YRw/4IIk3bPcRccUVwnWC1YGldqly8ASVrwBH2IU1bUe5981bsEjZ6rG/Q2pyZxtv7iOBTp9HWTXjnlhMaRZu4k0m81sxfYJyfY5bhNt6h8bUulqZ6dzCgEgJiw8FHFKbY76gwX+r7DV7dyV0V7qxNJ3UuVoolwJSXqKDRJE8ItaGVVL77Dx+A1y52qin1mLhse4bfLQ/E+BfnjqvPhdPoNK3mrCJSfeMYi+YGqdsg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:53:41.4937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478d0e8f-3d0a-4669-5884-08df09cb2527
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997954
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a9989f9 cx=c_pps
 a=6brTJxCCefizds7ERwDNzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=ZWcXVxRsAAAA:20 a=sozttTNsAAAA:8 a=IpJZQVW2AAAA:8
 a=rWiCR94CU3FsXXPWtN4A:9 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: BlVoEiXKuInyxY3lZJwUrC6anIS56m2J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyOSBTYWx0ZWRfX0OOaebcEwHQM
 WdZei5mAlIUJKqc0rqtxILinb6Rjz0PyWRtditL3EFNzr+0Kyj6zL5f5+7WAxsiBqoCVNlbBwk8
 hj5Pca65f3MEtSyPi+YhV7Qk0wHntIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyOSBTYWx0ZWRfX3ruNd4J/sdCz
 IoxTX/5ATJ+JMqwfaUgnd6lX9q1jj4MMa6kqYUgolAiW6CUm8w0JIkxnsG3gM25FSVu3pSArk6S
 sj1tKMCX5kL4qPw5iYhuMJEMBif/J/NUfRGOnKbYpVaimkjNrm/M6ofmdimq/TULRJQt8pQ11QB
 f+h01osthKdjUbO7uv0xEhPnSH+jbBl65hVRXFM4TaPUqidvhZpp4ywwYVYAUkSTkXJBPPPB6xB
 XRSz1NpQFX4sCk76f5WLmIVFbARYcm9Y5Vsa5NJJDTSKOCZSxHuGjMqa7l43cGV6qKNbNvslCEe
 9gRAeptY6VI6j7/wQ6m0Py05LU+mhqdj2rNKnRIrvLs84InGo/7vOs+IAGWx3jFu0Y2wojbQZvD
 uo+Y0WXZKVuowGpWEEZb5c2pf5oG8R7UuGwD5wQ2Nu67gJ8ZC5FsnFyj6321NedobCW4V4O4h0b
 VseAN7GoJ9Rf5lE2F1A==
X-Proofpoint-GUID: BlVoEiXKuInyxY3lZJwUrC6anIS56m2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030129

On 9/3/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62A defines the DM code/data DDR footprint differently:
> 
>      /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
>      DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000
> 
> which results in an end at 0x9e600000. For this memory region which
> starts at 0x9c900000 this means a length of:
> 
>      0x9e600000 - 0x9c900000 = 0x1d00000
> 
> AM62A additionally has a second DM firmware for edgeai whose highest
> section end address reaches 0x9e700000, so the region should end there:
> 
>      0x9e700000 - 0x9c900000 = 0x1e00000
> 
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd

Ugh, I really wish the MCU-SDK folks would have stayed within the
usual 16MB boundary.. Oh well, since there is firmware out there now
with this larger size our carveouts will just have to match that,

Acked-by: Andrew Davis <afd@ti.com>

> Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index de4048a3564b..53c096da68b5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>   
>   		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>   			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
>   			no-map;
>   		};
>   
> 

