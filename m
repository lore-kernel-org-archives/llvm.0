Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFFB652
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770068510; cv=fail; b=Zef2p8HjIAAEOLB76Et/Yfg0ortGX/5q7h9mT//cutTNTX6sx0MFlAUSU4vxBwhIMieNuHe7EexnN+ZMgf8JxqGeMVR5j7OQUPg+M8VdchVPiRzuJpcLVIpqmeexg3FMo17tYo4ITN+STbe5h+ztza9RBKmlXUtqZrSRuTeEahw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770068510; c=relaxed/simple;
	bh=IWGGsf/pPkFvH0xF6ngZhp5JGys5HWgaCIAt17EO8oM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FwB5x72f4c/kft1bra2h7adZcW/4/rQntb26Au28oVb7KW0boN4IYrtJgTXdDnO1SRJmxTLR39pE3ySULZaWgcGtEGZ4TexeWusNxurtMpMC5GbnLeG9EySvq1A0T5ejREYuO7drdk42FuEqpNeohjBLUIuLQeWSu+b62b7qNN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sAL6IXCo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DXPRD0J4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sAL6IXCo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DXPRD0J4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612IrTlM698496;
	Mon, 2 Feb 2026 21:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YSx8j/U0YMQqDX8sfyeru/jxcDpHonmkyVZl+rvzpHY=; b=
	sAL6IXCoCt+61fW9/wGVJG2hO8CY6OBHw0l0nqwlbEuPTcaao2Zms0D97SNuipSz
	PxMJmONgTZQLPoAigH+epd4M/wrsy/Mvj+a1SWtx4YsCPs97/jFx/xh/ocO/t4tV
	GVZkeFSK6IJfF4/GJ7lIb8NF9Mv5kLO37WC2JBZU+Yct/w/Fk1COXN7nUgXDQAO7
	fPEbGBw/PrKABn5MIivKYNp852SvOjemPzq+HkRBxpxTXz/lNjZ7VqYBPlYYAk6Z
	cH5spWcki+gQYKWQwMBK1pqLtOUv+xFxCxHMItXhaAKzYDmXi3qgjL1+15aFvEJZ
	i9aDRrd4mOw4zDOoZkMhgg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c1axe32st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Feb 2026 21:41:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 612LR3aL002064;
	Mon, 2 Feb 2026 21:41:39 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186kgd1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Feb 2026 21:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2KzX5xppt5ewr+dONJ3u+jX9OmaS+8CmUUf4AiXO48pP4JPlgJ2eHDWZL6PoOvLrVRxcicQ/4c67gR543v2/OCa3BswV4dFP6Y7r74830S8kcoEXt+YMvh54djDB3HqP189DwgbXW4rlu3AcX5vkF36t37wSgE/4felvYYaeSfw/Gs+Mv6l8nnJgv7kffoeh4WKRh2mzsP+taY9l9ij+DyScoZiigfl8b1LcT4XGDxg5dK5O9ZWBmpJozsHqNkyXTaa/X5GB/ZC5XH1k/h1J7+P7cP/ZprOlskoR1w2vyxcustz2ghpmVND36xzvTgoMqq3eefFuoFS0RhIpfBihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSx8j/U0YMQqDX8sfyeru/jxcDpHonmkyVZl+rvzpHY=;
 b=VLpgyo9wrPst5ebgwc9CH4rlG3+B8XaRkRjK+LzT35iOICWiF6iPFPV3k0FScgHBLp4Us7lc4t1kh1kxv8du4YaLmLqVE8ZLqe+aDpKXyd5FKWHTVeZUcXjhkKnDeXvHNY9Nb1XGig+UqV0h8ST2y/x2dUhfwiiFZSbqBJkrSRM6C0hdNccWkob63QJ9vs6sKvFRsJ3Xqrnb+0whfbGPp3P0jKm1gh9AoZue9PwTyE2xEI8D7lfoY2vroQDXjsyc+iL5QmAVdDc2TwJq4jinfTrE+IJvIhGYGGkl9ttOgV27mHiiKSBpyB+Bc+lzjX1SaUedgF4jdkhnTIIGV/zqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSx8j/U0YMQqDX8sfyeru/jxcDpHonmkyVZl+rvzpHY=;
 b=DXPRD0J462c7WyKj2aXtFDnLghAwKGkczT0tpWEflR1m/8LWiGwkxHkqbN+ssxOl7UlLGnN92DTXtVg1wqQ8X5eTkunOvXx4nI9I9lglYR6SeeI29+nxMwEr8s8M9qGBQKd6hxut0U/NAOc0GaaB66pxHpXO7ugMnHTqYriW6wY=
Received: from IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20)
 by MW4PR10MB6629.namprd10.prod.outlook.com (2603:10b6:303:22e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:41:36 +0000
Received: from IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a]) by IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a%3]) with mapi id 15.20.9499.005; Mon, 2 Feb 2026
 21:41:36 +0000
Message-ID: <fb9e19bd-2543-4b83-9ec4-f595afd358c8@oracle.com>
Date: Mon, 2 Feb 2026 15:40:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] jfs: avoid
 -Wtautological-constant-out-of-range-compare warning
To: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Zheng Yu <zheng.yu@northwestern.edu>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Roman Smirnov <r.smirnov@omp.ru>, Aditya Dutt <duttaditya18@gmail.com>,
        jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20260202204351.2174384-1-arnd@kernel.org>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20260202204351.2174384-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::11) To IA1PR10MB8212.namprd10.prod.outlook.com
 (2603:10b6:208:463::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB8212:EE_|MW4PR10MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f1ff55-eaa1-4e76-dda2-08de62a3d740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3ZtM2h4dHVZWmZ4U2JKbHJpUTZxd0twSFBuSUxtTFk2K0h4TFVaMnlFbWNo?=
 =?utf-8?B?b3dnUEh0Q2FleWMvNy85NjN1dk9tWTREd3ZSYU94eVZQZmtnTm5WNjhLK1lV?=
 =?utf-8?B?VFdDWGhhdEhsaE45ZzdTSGx5M0VyblV4NjV1RGVmQXVrSUt0dnZlQ0NIWk96?=
 =?utf-8?B?WGFqU3ZubUg5cytkdGIvRTlCbHQ2dmhoNExDUVFEYWhXd0I1Uzg2ejk5WUVB?=
 =?utf-8?B?MzBqRFNleGt0LzRXanlWY1F3ZVBxdXZwdTRHb1lSUkRudmlGM01uUjRId1FQ?=
 =?utf-8?B?d0xlaEt5Vzl1NmhBdkNQckxQUnJWTS8yT1JyTy83TXBjTW1yYzB4d0hIWU9n?=
 =?utf-8?B?RW5DNXVjeHF0L3V1ZzErcHZ4Q3FqQ0IyUDc5U2J5Q0UzVmphSE1jWjlrQVhk?=
 =?utf-8?B?c2xyV0VoQ1RoWE5nRllLNDRhQ0JIRC82UnhxYVcwMng1WUF6Y2dLMitVdmFP?=
 =?utf-8?B?bzY1NkYrU1dFNk1LWmVoRDBvYS9EN0dXMyswQmo5NUt6cXhMWmJvWnZOZURj?=
 =?utf-8?B?MngxUWVMU3RZN0JMeXpFQ2cwL3UzWjNjTHY2cnZtdlFrWDRjYmU1a2ZCdlFh?=
 =?utf-8?B?UzRiMFRGclY2b0lLR2EvdWtZQnh6WXFaM2JjeHdNbG1VVGQ5c2lnWXRRSWsy?=
 =?utf-8?B?djdYNElLNlYyeVZqdXRjWkE0cDFOeDJIaW82bThIalZxZno1ZUp6VXgxSEtz?=
 =?utf-8?B?RUQyV0I5dHgxOW54RHVQbUNNNEtwWFNXempxcXNtbnArc0dMbkJSQ1FsdlhZ?=
 =?utf-8?B?SUExYmdGNUtMd2cvaUEycnZ1aW5oWWNxQ2tmaHAxcFJ1SGh4TG9sK29lRlYw?=
 =?utf-8?B?TUJ6L01ObjFWcWNLZzVZOWpTK3lrYXhObU5IVW13Zy9jK1V3QXN1S0xrYWxU?=
 =?utf-8?B?MTZITG56Q3ZxcGtuOUNSaVVNWHFZaVdJVFdnUEF2TXltZlFmY1ZsbVBSbHdx?=
 =?utf-8?B?TlV0OXgzTWYxc3B0QUhiS1hzNTRKRVA0RXIyZ0YvMU1SZi9KNXhXZlNBbFY2?=
 =?utf-8?B?cFVMZW5JMVo1ZHp2MCswejcwZDVtUUJSUzBVUE9BV1ZrSGxtMWF0V0tWOUR1?=
 =?utf-8?B?dlJkSzFuMTV3clJQNXkvUzZEVkM4SDJQQTlHY1RrQnFIQStYVHdXSDJOblhH?=
 =?utf-8?B?aGljU2RzempqbWRwZlpKaDhzSVVXU3BwOVVRQmVXajJpUHNabWJhYXdZK0JZ?=
 =?utf-8?B?N2NvZ2pzMWtGcWQrSHVMYmVWV0FxT2VtTnNuVHMvM1VqbFpONVhKVlFYanNL?=
 =?utf-8?B?eWZhZkJ3WDFvNEl2d21DS216c2N5Y09GQ2RCcndxN2o0bTIydU5naWI2SmRI?=
 =?utf-8?B?U0dsOEx6WUx4Tys4SWFtNFJwZ010cU9ua3NCdE9SOXIwUzlPNWVxeGQ4cnc4?=
 =?utf-8?B?eWhxMUJhUHpzV25rNXN1ZWxJOXFLL2Z5VWpRT3Jid3JGRjR6TDVCK01MWWI5?=
 =?utf-8?B?eU5nZzRrUS9nMHlvalVOZVdYbDE3WVk4UmF1aFFKQjBONlpMM2hNRFN6cVJK?=
 =?utf-8?B?YkQ2bjdSVVFHdGlydHpEdHc4OGpxdU5KWTc1YUtTK21kM2o2RWMrVWtRYmgr?=
 =?utf-8?B?cEdHQXV3WnRuQ2lkKzJZRTR6dGE5SmhaT2hadldXUkQvK0VQWFVJSkhnMTNT?=
 =?utf-8?B?UUNBcDhpK3JhYzRIRFpVRmJMT2hERmFDU0huMW5zYkJNSGR2SEdaR3dyZjNw?=
 =?utf-8?B?M3htbmhGQXJUZ0QvVVpLNy9Zb0tKYzB3dzlvNTV6Nms0RVpNajFVTnMvMXQ4?=
 =?utf-8?B?YmpsVDhXblhIbVRqZng4Q04yNlJ0bCtqclJEa1dLeW5TUkl6ZXVQKzFiT01N?=
 =?utf-8?B?UjZvWTJjaDFxai9YVjFxREloQTMycUhaaGpOeDl3bS9ITHlGYmZ6eklGbmIv?=
 =?utf-8?B?a0EvdHR6WTFjelliZFFPc2Y1WjlibDRSdEh5QVJQaGI2Qmw2ekJZMmd3L3I3?=
 =?utf-8?B?TEZ3WndkWUN1ekZYQzRSc2hwK2grR2NmTzVZb0w1Y0dGbUtXY1U3aTVYbWhW?=
 =?utf-8?B?dytHOURWTVlsVUFtVXoyMmY1QlVFQkN1ZzVCWWJ0c3BLcTlhQmRveUNvbEda?=
 =?utf-8?B?eVhyQ0J4dGxGZ1NaNmN2NHJVSEUzNEtPcFRReVFkN2xEQzVNUjFGdElEbDhX?=
 =?utf-8?Q?haVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB8212.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXpyeXRudU5tUTcxSlVrL3VEaU5takhTM0Q1eDVBMXhQTWhJWGVEb1NKb3R0?=
 =?utf-8?B?KzdpRm0vYlROT2NHdXFqSzVyZzZ1LzFlZ29oekhPMi92cXIyVVkxZHJ1TXJR?=
 =?utf-8?B?ODlMQzczMTBvT09ieEU3M0JGSGZ3bTh1Y3U5M2FRSnkvVlJtS3VuejFJRzBh?=
 =?utf-8?B?YktWZnF1VTVvVFQvdC9JNkVKSjdtbVRRdkhlbGtxN3orRDdxSTlIQzNJRStI?=
 =?utf-8?B?ZFhRUFA0NUdLM1VZL2lES1I4d3F5anRtQlUwcUNxdC81SkFRKzNUZWRscmhJ?=
 =?utf-8?B?TWVkb2JkMjRta1NzTVRrTlJCSERIazNlZHpCcHlrZzlrSCtycThJamNyNlhs?=
 =?utf-8?B?Um5xYy93OFk1Zk1qQlY3OGFxV2hUSTFka2lSaENWMit5N1RFcStwK0lPWXgw?=
 =?utf-8?B?ZzYvUFM5UFQzcWZJckZBQXZSbTZEUmRwZmdHOGFqTFpoQ05Ed1FCQk5aVW1j?=
 =?utf-8?B?dE1KK0FacnBpallxUnFPNTF2bUhDd09semczbUNTSnVmQ3NNSkI0MCtaMHlN?=
 =?utf-8?B?UUxrbDdmSVdTV1dzQ21mL0NybTNleEtLYWhaOU9DN2JkU1JFWkJ1ZVU1NXpz?=
 =?utf-8?B?SnVId2w5RHlZbnpsYTZpRnRUaVJXOFZWZXA3OWZRdFMyOG1vcU4xaTVPcitY?=
 =?utf-8?B?d1RidXk3bytIcERQODRLZ0ZoaHFqQ0FiN0E0ckhrY0Y3aitTaVlHMmZtN0R6?=
 =?utf-8?B?bDR4TlpQenNhNjBaSW9BU2gwcSs0RUhNVEpheEpFQ2haVWx2MWtGSWNkSmQ4?=
 =?utf-8?B?aUc1NGdJTWUxdXpabG9sNmUyeld6UnBQS3BtR0NWSnBCRDRCOVB5MHZ5cWlF?=
 =?utf-8?B?ZHQxazYxQ0Qza1JmaS85T0l5S2tnVTNXdHlxaC9zcEtHTkVNb0R4aWR6RFhh?=
 =?utf-8?B?TlVyOU5yMUo1U0J6YVppWTBrUXNXU2sxRWwvb1FOWlM2NDR0T01FK2J1Nkp3?=
 =?utf-8?B?Uk12c1lGS1JQNXpIRXpkT3E5ZHJZa29xd3VKZHpYTGlhL2QydmphYm85d2lS?=
 =?utf-8?B?TWlXQjJjMFc0R2hOKytSamNINnhzcVVvQnNiUXNnbkhxdjZTZHdSMTdlV0hp?=
 =?utf-8?B?a3hmTkMyT3ZEM040VUZDN09pWmtLbTJWUE9lWG5FcXRPRjNJTEMvZ1RYL1V5?=
 =?utf-8?B?YXltWlIwR0ljSmtVUUtVVDZ1MVJDMWs5ZzdvZUtHN251ZjlPMGtZbExYQ293?=
 =?utf-8?B?SW05aVEzSHUzRkRoVDMreGhNOVA3Y2wvMlFtNDZ6QzBITUQwTFdHcytNMjY1?=
 =?utf-8?B?amJGN0dSdG1jMlIrdWdCTTlmUWhkNDhPWTVGQTE2VlJZdktyQUc5bFB3WkJR?=
 =?utf-8?B?alc2Y2p0Q3o1VEl5dG9iVm1YNmpoOTJuWVZDNlBUbWtWYW85WEVsZ3VpeFlJ?=
 =?utf-8?B?YTFYYWZ0bXF5TmJZaFdhN0E3TTM4Qkw0K1J1TW9IbThENktVdHRGVUtBSUkz?=
 =?utf-8?B?NXlScFhzSEpqRnh4V1hCZ3FlcGNBR0FQMnFNcm54SkNqdjEwTlNZQVhlb3Vj?=
 =?utf-8?B?dHkzRXU2QXBnZ3FUNDlnNDhBcEpxRjR5aHUrT0t2RTFQQ0RXdGkyOWpCVlBC?=
 =?utf-8?B?QUs5OSsvM3krREpkZnp1QXZ0TUpKL0Z6cnkyVmlFeEdUS1A4THV6bmVKLzY4?=
 =?utf-8?B?N3FyZWJsL3Jvalp6YWM2RXQ0WTIwMmVHcStKeXFKQXdaMU9mc1VmN2JCOUVn?=
 =?utf-8?B?Q2Vtamcvbk9rKzlPMHhNUXRSRnYzTU5wOXlucEtnT1A4NnhXdmJ1QUlvZzZG?=
 =?utf-8?B?VmdnUGE1VXAxUmN4S3pZTUNvODltRzUzcWRwK054Zlg2UUZWR29JcWw3bVc4?=
 =?utf-8?B?TEMwbVRIWGFlOXV6VVJtcWVManorSFkrT1NrRnhiVlJuVWczZUhKaXFmcHVK?=
 =?utf-8?B?MXBpZDlNbXY1VGZISnQwcU9qaVBxNjVNL1VwUHhCcEExKzhaV3FuOTg3NUtR?=
 =?utf-8?B?L3lYbEZEYjA3aUZpRUZ2NWJLUmtnUzJibzhaRTFVcXU0ZFlGNkZCY1pnQWt5?=
 =?utf-8?B?QmNkeWhWMy9RY2VQYVZPeGxMTmc4aGRkMTVnVXpjTGdoZWV2OG90TkNIaDR2?=
 =?utf-8?B?dnMxVDRDVEtFU012cFNSd1IxcVh2R2FGOXBzZTBCQXA4czZEdDMvOWdUaHdJ?=
 =?utf-8?B?aVc4S0JnUmw0SUFwWm1DanRHYTFpZkI1aGE1MnFVQldhdDhZT0FsbWVkTll4?=
 =?utf-8?B?dFEzRTJCY1RHYlFxVk5xRFp6aWgwVU4wcW9VTnRNV1RXZVdFMzlUTnc1M0Fj?=
 =?utf-8?B?M1RRdFFsc0NxYVFFcXdqc2JSdXRKREc3ZVVrR0VnN0h5emROL2gyY1g2d2tS?=
 =?utf-8?B?aUxUMW1zb2g2RGNoV0pqV3AwVjFicUZzUHAvckZKSElrYm0rUzZZZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FhUujbkoqdbUH9mHGQIVCTI7GMKYSaH7MHVm7t4TGHGLu6SizqaCmnj7WPVHJFwTWXa3f8QdIlDD/ljcLKUMyWMAlfSOSlmT9kBX+zHwYW9OfIPdlUWCp07+zjbkFhq6t/M8AmucMjZzfRRbDAU+00jihLkYBU5nFy1S4SSgzqdzCjarQmSUDWw4vbDhHaCgBwUEiGkOYvKfpHJVm22ikswnnl4VqtyqZOrpY6M9eA2ntjwizda0zth/7RVBMRYdj1Pev0GeVe1SubmPMN/+t9lrVXgiAozG1egEtOiOe8m5wNZdo6idMf/1RDGfuWTz/xL/2h41yzhFIhC38rh+Vx6CmUB74nADp7cW983rArii/oFz1Ct5ptNdoC2yfS4vnQujv4sJA3dZTeuMTah2sI6wDhLvPdCocttHK4to5lUkcdTBBQtmckkyGRu82VRLg8UTHKX5D0jQfyNhuJ0hOgMl5r7avndKQUHSgpg1Lm/d+jVlvreBx+O5H81XefAA4Ibw/vgeeQRAHFmXVdWLMexzC5PllLIGUU03WnBVXCE2HNCSX0qNZ6bywR6CtWBSRl6lBDHftslI97oR6n1DVFyxUyu7HwhdOkaybd/BaXo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f1ff55-eaa1-4e76-dda2-08de62a3d740
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB8212.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:41:36.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yt8Rrv7N5LfYsX7Nou2X+rd9+TJPTHmBXRKvVvPGCRGZPqHjpDheGQ46YgfBVpIt48Ug0PdqC5Q5cCQVDF/fDgX5JWE2lievvCMPR11VUoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6629
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602020170
X-Proofpoint-ORIG-GUID: kNP17edBcLyYdbxVWN5xJQ4rzEpgfHEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE3MCBTYWx0ZWRfX7K4AnKf/zPKO
 EOAYX0eY2Xsqu0o5QeIUI8l4CACpkHZoblT0IbulXfl668AArx7j2A1RJtvXH6UjZPw+4cOBMUw
 bbKzfL2MTZVm+vf5gezJNQRDlwYEkE84gFzgfOui76Sy6kIqU+FoOA81/EwePAOe8WGCMOQzTaN
 ze/Qw/u/T8FA6wF+zXRWM+JJa14DCxbh4YJdO4mn3WQfpMogI9uH91VKdJQAGsSKbiX3vtvtGXO
 vd5Wq7wLFt16UnktLKXgAn1q8yOjebM/n4ndzcWn9sREjdzkjzn41MoeZPig68CRc/UggYGAIVW
 fYq0Dl1WsFR5nxbFB0T0Iybs49wek7i9lq+NMLwx8M4PsBSaSACNj5Ni89yPvBWlznzWF4S+vh4
 ujFWliUgxlZhFve01sRBbOnbZfDliqIcvAZzL2Rs/3GTPe4JBVecNDIVc1PAiyCkwCJCovzn46e
 O3xR0iIJw6nwHmmNcmhqi7L2pCtFpH+3HEcEOWKA=
X-Authority-Analysis: v=2.4 cv=F5hat6hN c=1 sm=1 tr=0 ts=69811a15 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WmfX0Ep4EwWLics8V8IA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12104
X-Proofpoint-GUID: kNP17edBcLyYdbxVWN5xJQ4rzEpgfHEF

On 2/2/26 2:43PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent change for the range check started triggering a clang warning:
> 
> fs/jfs/jfs_dtree.c:2906:31: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   2906 |                         if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
>        |                                            ~~~~~~~ ^  ~~~~~~~~~~~~~
> fs/jfs/jfs_dtree.c:3111:30: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   3111 |                 if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
>        |                                    ~~~~~~~ ^  ~~~~~~~~~~~~~
> 
> Both the old and the new check were useless, but the previous version
> apparently did not lead to the warning.
> 
> Remove the extraneous range check for simplicity.
> 
> Fixes: cafc6679824a ("jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: drop the check instead of shutting up the warning

Looks good. I'll put this into jfs-next.

> ---
>   fs/jfs/jfs_dtree.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
> index 0ab83bb7bbdf..9ab3f2fc61d1 100644
> --- a/fs/jfs/jfs_dtree.c
> +++ b/fs/jfs/jfs_dtree.c
> @@ -2903,7 +2903,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
>   		stbl = DT_GETSTBL(p);
>   
>   		for (i = index; i < p->header.nextindex; i++) {
> -			if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
> +			if (stbl[i] < 0) {
>   				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
>   					i, stbl[i], (long)ip->i_ino, (long long)bn);
>   				free_page(dirent_buf);
> @@ -3108,7 +3108,7 @@ static int dtReadFirst(struct inode *ip, struct btstack * btstack)
>   		/* get the leftmost entry */
>   		stbl = DT_GETSTBL(p);
>   
> -		if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
> +		if (stbl[0] < 0) {
>   			DT_PUTPAGE(mp);
>   			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
>   			return -EIO;

