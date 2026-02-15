Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D823BCED;
	Sun, 15 Feb 2026 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771178397; cv=fail; b=h9xkAtl609fQ/uhcbT4/jq5IoyBSBOaStyeTCVmFMuhcjXLc4x4vh5/U7lEr6JUSFbzgY0EI7YxtCDd+3qqcGy/o3I8gN04pxfUTu9G8t5TZm6nSULhvCY2uHvGBnbCpNvFv0dS/wJEHLmk5ruCXFL8ayqwEdq3nxNCV6XXq9uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771178397; c=relaxed/simple;
	bh=QN0TWdgzCAqZn2coTeOSTLgUR/erTdO3u7YrxTVyOmE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Be2Y08FvhwagCiL/K5MoHqxo34cjkjDA744K3YsvJ4AhWNF5jkQWtzsyZyPrsIZSwtXF8xh943c4/n+Om/iWc8vFBNKFcfIGGl8q9WPsGaPx79fRrZxTVovbwi6JamR01I9h8KXUWXtnk+XjDY8mCxTc+cOw1sD83ziQkPEQwig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qboy9JDc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Blr+u83d; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qboy9JDc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Blr+u83d"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FHA2SS3385173;
	Sun, 15 Feb 2026 17:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JLA7/M5wp+sLFlNT67KeCCLw2ZIynYfurrtGR/UvZS4=; b=
	qboy9JDczfN4YcmmQiEIM3guaEgDTKWxJsKXpS75C3X9EgXFISAwQpDUJFn5XAJp
	FJbAgtWlk4NgvXbe8KJv7Q5E3bKpqwAJyRjO+w4L8/FJgaVzVsMAkb43Jl7sFhCR
	RpRVj+kgTdqh08hQvcv5kFSZm+C46Ci762dc0CrT7pZZ8Ra/eTPRIHFSJhPr55ED
	IxayRNQRfl8ziwTaLVEjpbumBb+dPqPGWCEvPYVFEEubjvEuy8RNhDweW1+2Q+6R
	9r8oXfrA7Z7TYb882MBmNxEryQOBIOeuQiHKMEysupmGj8m79RJzFx+gAm2neibM
	idX3Xk+aWibzUPdMzFMx6w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r11br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Feb 2026 17:59:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61FH2ink022416;
	Sun, 15 Feb 2026 17:59:51 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cafgbkkww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Feb 2026 17:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6ny2RYK/0FWYPRsfWwByG3fhywSZeIakW+ZF/dlaWnKse/njxdlALzQwIVC4ho9XOZnNperYRWxQzSpBjewTXZlmQDprImHtgdJeqgEHby6hK83AqF7q90kJXvNDjLdfpdNgP6UIzxSa6cyAQD017a7Yf3nlOb93WxBQRnH9W0+4WjyjsiXQtHWuS1wO106UBgqnkIb/hF0qPCeEQcyCNpBojPQYpNcO6whMWY90J4+URiyZSCJuKoFwjDXU5/yu+tqLs5jgF22w/i6RZO/1gBeR5Bhd4UEETjyMJ2dAU0a5ow6smhLf2q4mrKRM0YcaP/SDlYSeaJHRMzJHqPbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLA7/M5wp+sLFlNT67KeCCLw2ZIynYfurrtGR/UvZS4=;
 b=Cd5hoPVk7x/5KLxCym4bLhR5UrCLL04xvClHaCy8b7hf7dYLiB+Lc99xbxNqnearK+wB1Xh9m4ptUyOhlYQ7NEKaoYFe7Qk2N/QXNJJ2eCPWbROUuEE88/Prv4FJIktgT7M/XJyZ+x+MmkphxIcFl0rjxodxNORr3+hNhkDH+Ge8tqMTPB4YQWG67xFs/MY0IlI5NIbVKKZAhfO61E3D1mCCdMQCf36IIPUUrT+3K7NvtoATdpJra8Zwq464VlQxtbr1xwjNLLS9LmX3V04lTv81xxvCdE8H86e5GB4iEEeB6UipBmNhjU4cm0zl7Faq56jOaW50VMdaawR1YSmHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLA7/M5wp+sLFlNT67KeCCLw2ZIynYfurrtGR/UvZS4=;
 b=Blr+u83dJ5cKviGZ4+36FwZ8OK04F/kNkpS5wsYaz7kU+afhNPO0mrh54v7+w2JQAIjj2OaJuJw7LVqy6SqCto4cUvF59ApsHumcedL/yrpcATYUruJXRh2VHbEjxdZFeiRp0561FBQXV7q4pMXL8hYGD7tpRk1Dk/RkjPhrQPk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DS0PR10MB6948.namprd10.prod.outlook.com (2603:10b6:8:144::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Sun, 15 Feb
 2026 17:59:42 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9587.010; Sun, 15 Feb 2026
 17:59:41 +0000
Message-ID: <4717ed1a-cfd1-4f2a-9db5-96c52df198b0@oracle.com>
Date: Sun, 15 Feb 2026 12:59:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [cel:nfsd-testing 30/32] fs/nfsd/nfs4layouts.c:851:12: error: no
 member named 'cl_fence_retry_warn' in 'struct nfs4_client'
To: kernel test robot <lkp@intel.com>, Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202602151202.a1laeI7t-lkp@intel.com>
From: Chuck Lever <chuck.lever@oracle.com>
Content-Language: en-US
In-Reply-To: <202602151202.a1laeI7t-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:610:74::12) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|DS0PR10MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: b90d19bc-4267-4ee1-5a87-08de6cbbfe30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0lUUUZBWGFBNXNsRGFucm1HWGkyazFjL3VRV1I1cEZSSTgwV01TS3pSRDBZ?=
 =?utf-8?B?eEpZQlhqcWZWelBLQnJBMzR1aWVWWmRFcTIwb0pMUUQ1L0ExaW9jU3VJZUNY?=
 =?utf-8?B?TjFKVkxzN2ZZNWtma1haWGwrdDRhRFJaeDZGNnBZS3BzSWtua2ZaWEt0NU5m?=
 =?utf-8?B?WGFzVkl2WkwzYVdlWVZ4cHBhMWVHRU5iSDN0Sks2SWJSbDBDbTRjVFlyclds?=
 =?utf-8?B?bGZROTV6VnBHc3VvTEQ2U0huUWpGQk5SdG1sWlF3ZlYxWDBXdWZvZTlVRE83?=
 =?utf-8?B?dFIzM0ZCbWZGNGFtdVQvS0QwRUxTZGN2WG9Cemhwd0RiVTFKRTQweFJXTGN4?=
 =?utf-8?B?b2lBUnhocklQRzVZbjBqVlhEOUVnaDRTY2JnNFU0MTNXRm96dnRBZytWVkhn?=
 =?utf-8?B?dlRKWFJnRFhTRUVzQkdkbVZSNzVJcXhTT1g0YThRZTVjU3hGZlNzOHlUUmJJ?=
 =?utf-8?B?SjMyc0ozVllCOHpva3o0QjhkK1ZhcTVUM2tQSFUrRVg5dUh0K3ptdGNvV3J4?=
 =?utf-8?B?NXFjeXFQY2tVK25pUElRRWowWElSZEJHSll5Qk1yZ1Q0cEFXUUVtSHN1NHRv?=
 =?utf-8?B?VjFnV25tLzdiN09FakVZamVrOVV5Ni9JSERSV3h2V2hjcFFmM3FCUUlhUTRi?=
 =?utf-8?B?SHFDaGpTaXdjQlVsOUdpdWVMNDROMEhFVWM4MG5Ob1doTXFvQzJjOVJDMnYx?=
 =?utf-8?B?R0hJUjdKNk10Z1d5TU9jdzY5YjJ3Nm5va2MzcllSMVhWcnlsNWlGamZMekZ3?=
 =?utf-8?B?VDcwZzNxZkJ4RjFScDlFNytRc3Z4S2lYUStqTWFRSU8yRENlOFpDWVp2djlK?=
 =?utf-8?B?NVpnZDFja2s0VzA5MnlCaUtVaWorNWQrOU1LeWZKbFQrNXVhc0x3cFV5WDMr?=
 =?utf-8?B?U0RkYXEzVFRTeFJmWTNGZUZDRkREam91MXVxZTFiTkFIRmJpQk1XaGJFb2Fz?=
 =?utf-8?B?UkFsUzNSTi81TXdpZVBmV216L1B5N1ZDc1N5TW1DUkNWcTFZWFFoQUs4eTM2?=
 =?utf-8?B?aU1CVSsvRmZqeEVPL1JJU0xYWnZBM2NaQTI3WHJmVFNvc0ZqTUVqdXpJa09Q?=
 =?utf-8?B?MXVoOUVhNkNndW1UYVJGR0sxcDFyWnF0M3hsZ3hxQ0JNWXJZUXFGTmtZamZn?=
 =?utf-8?B?bG9RbktzR2trNHBNWXlDalVYUHZSbHFxSVN5RXp5WXRLYUJ0dTVTTlIreUs5?=
 =?utf-8?B?K3liTHYyYjE3T05FTmNvcXE5K1ZyV1JhcmdEdzB1TUxJVElBUzBTbm9DRExy?=
 =?utf-8?B?YVp0YUJUNFJtVitMa3FUdVBINFpUUm85QkZ5NGFGdWpmby9QZldNL0dQczdZ?=
 =?utf-8?B?QXVZRWtXcGV0NTR5OFBkQjVLZEhHSHFiZWRCc2dhTVozN2UwdkxVTlJEaG84?=
 =?utf-8?B?VWRhQ3FFRjRnTGhmYWVMLzBXRXI4alhNTlROYjBhbDNwNDlGaG03RDJTV0Zk?=
 =?utf-8?B?eEpOTjdzSjE5dGxQV1BpeHp3NnFEZ1hTcEZxQ2x1UVVOVy8rakRudE84RVVn?=
 =?utf-8?B?bUhzbTMzODlTREY1MVB2Q3M1WnBlVGgrT2x0VEpwa0dITkd0VDRlVnlrdCt2?=
 =?utf-8?B?SzhoRWJEZEVIc1d0QmZKNXA4NDdzTEV2cjkwNFphNTc0VDNCTDUrVFNGS1pL?=
 =?utf-8?B?STRqdWE0ejJVRW9qZEg2MHVtUzBXaytYVm8yaU5IOERzZ25SaVU5dUV6MCtS?=
 =?utf-8?B?WWNybTcyZXA0VGVOOC9LNFVDU3dkOStTZFVtcmpLdUhkMlY5bVB6NkpiT1o4?=
 =?utf-8?B?d1d6bytXdHhyNExSZkE4cHhXOE8yR1FaRExXek5OR1p0TjVBUE9nUlBKTUFx?=
 =?utf-8?B?Q0lXQ3A2OTlxNk4veDF0bHE3L2VJSHI2L2Q5TU54d1RoR3ZHeFJxSTJETDVi?=
 =?utf-8?B?U09QM1pueHVhVUlPaVI5cjlnOWpQenR4dlBIalBuN2JOc0t0bTVjMHZiemhO?=
 =?utf-8?B?OGFySmF4aGZMdnNsR0tycGhkMEIzV1N4a1JGbiszZ1hOeWJLeGw3Z2dsSzVT?=
 =?utf-8?B?aEVHWmNqMGZqdWtZeVA4WWd4dUkrRjVvT3IwVThVNngrenJXS3ZpanNGckti?=
 =?utf-8?B?bHZ6bjFIc0o0ZzQ0MGpESGpFM2g0QkEvQjZVM1l4Y1hSZmdjK3dkQUxhendn?=
 =?utf-8?Q?3qDOYBOuFNdvzbPLuUD7/zHg7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXdyMUtPV3JMOWlJZDJFdEhCYkJBUGwveHFRZGQ0ZFlUU1lzN0drQ21yQ0Vo?=
 =?utf-8?B?MGMyS1RYdExDaVRqdEF1eXRHQXJIV2FCTGdqa3FkOE5sY0MzUHJhdFp1WnFZ?=
 =?utf-8?B?QmhxQjN4K2g3bWFjd1ZubjlnZUY2Wi9TNlozN0JLUXZVZGF4SExIN0I0MWFl?=
 =?utf-8?B?T245dXNISmRwdTlwUENRTk9Ic0Rsa05yNTdSMkhLV1QvNHl3MjM3RU1EblZG?=
 =?utf-8?B?cWFJc0swZVdhWVVRbEEyT2dMeFdmV0pjSDdDRDlKWXlvZ3ptaVdGVkVWTWRY?=
 =?utf-8?B?TkJLVXpNd2I1eUdWaTY0TUtEOCsrYThxcDhJWHJTLzJTaVhDNnl5TWU0Tnp1?=
 =?utf-8?B?UUNWcVhSTVlBRGNCd09HamJRVkJQbXp2NUdpMFZhUVVQU0tvWWNnUzJiVE80?=
 =?utf-8?B?ZUxQdDRYOTYxOTc3YmRPOVUyYjMxSmxJWFhQN1NwMFFpN0RJeHdmOHg2ZG8w?=
 =?utf-8?B?ckx0ZWFraDdYRTUyK0JHZnRYUE9uYUhyVE5JUDVubnJlcHladHVXMW9kU3Uz?=
 =?utf-8?B?dmp0eWlsNWVnV3ZIL0RVMGgveXFiN1k4RnJ3Zkk1NEtUeVgzNEZaNWN3NVUv?=
 =?utf-8?B?cEc1WjlYOFNvcU1xTkUxNFp4SG9ieTN4bysxKzF3L2pSUWRuSmpQU1VzNXZi?=
 =?utf-8?B?RGdRdlpZclZLakVkL29zaTBUa2RBY3FtT202V3ArVS9uUXdrcUpvcTBCK0N6?=
 =?utf-8?B?N3dVSG80cW5Qcm0zeWU1Q1Z1QkZyM09qTHM0YzVXTW5JUUJ6VmExanNSSEJ3?=
 =?utf-8?B?NVpPRWh6L1ZaUnZIaUlKUEEzUXY5emJDVmUvbU50c05hSDJnMEsxNXhXcE10?=
 =?utf-8?B?R0hidUk0REdMR2JNL1BUOTl1bUtUQ0txM2hNVlJOMmFEOFpHNVMxcWxLNlYr?=
 =?utf-8?B?ZlNUSlRXa0pyWVRDempoQnZoOHNodGhFK3RzRi81czNHVmZHbXpWS0FtMkxT?=
 =?utf-8?B?d0RtSmRaMENiNElMRERubVgvZlNSUU9MR2wxMHNtWm1Sb3RWclMrR1pGU0lr?=
 =?utf-8?B?L2V5STZ6Q3Nlc2NDSjNkMkxQRUhWeDRkY3Y5YzE5a01IUUlUUVVteEZPTm9a?=
 =?utf-8?B?MlZNNGU3SVZnaU9hMEhHVitSNEdQWFJiTk5IQ1k3ZENaanBZQ1hCaTRmV1h1?=
 =?utf-8?B?R2w0QnNXYk4zaUJRZ2lZdHhOMFZKMnJjMG81Y1RuUjNJQUhhcVd0c3dmM01i?=
 =?utf-8?B?T0RNRDR1SHJoK0pHYTh6QmhmTjR5T2RhS2dlYm0wQlYyb1ZkMEFmclE3Y3Z4?=
 =?utf-8?B?aCtpb3VOOEFtNjNVLzBOYjhOSHFCa0V4cXlFS0xOaVZSK2QxTW9jOG9aUjVn?=
 =?utf-8?B?OEFlbkp0TzdtMmoydXczUFBweGxGTFAvTHg3Ukwrd2hKeXZ1WEpYOUhsdW9C?=
 =?utf-8?B?MWZWZ0lVVzBDUndEd3BVYkZDbjRHRGllbkgyRjV1Wi9UaFZnaDBwKzUyOEN3?=
 =?utf-8?B?VmFHdUpYWVNYRkswYS9YajhPSmpUZkRqQTg5LzUrbGxXeWs2ZG0zd2liRENX?=
 =?utf-8?B?RmhRUFpTb1QwUDFpUURWd25qMmZIUGdGVzN1U1hKY0NoSHcyUHVqSWRtd1pV?=
 =?utf-8?B?ZUl5b3lMSUhYODhkVjNPakU0cFlta3c2OEdUVmpqeHhHbStTMGw5K3ZWOVJ4?=
 =?utf-8?B?MTk5dW5vb0J0NGRHSEw3V0srTkpJMEhRSEJ0ektxaU9KK0dPVHJTbW5XOXpO?=
 =?utf-8?B?SThEWjRXM0ZTV2RBOUUyejNibzZnQU8wK0dCUWE5STJYeGFKbUdIcGhBRlN2?=
 =?utf-8?B?NmxpcVNYTE9tdTdNQzgvdlNIbDJCZDZod0ovUytONm5BVjdTMVIzaWpkZWxu?=
 =?utf-8?B?VFdsdUEvb3dOTTdkMUw1WXlRbEIvMmhxa2JkdUFpZmJ0RXl4N1JsS1JrN1g2?=
 =?utf-8?B?L2FUaFUwa1MxTFVTcURNRFIyZVFmK0NKQW1xRzZDcFc0SlE2dnJMZjRqSTFR?=
 =?utf-8?B?YTZqUHk5V3NQUk56aVBMM3l1MlFVUTI0YVJJWHZDb1ViV1J6d0xsOFRRTXl3?=
 =?utf-8?B?UkRobEpnNnBpVyt4UmdFaUlZTFc2Qks4ZEhKOXRVOVB5L3BqcHFNOUtBUEx2?=
 =?utf-8?B?dCsxUWRlQ04xWWY3YlplV1lrLzREQ08ydWx6bU80cU5lUUJ1V3RDeUtOVzV5?=
 =?utf-8?B?c1FXcGJOQTZieVZlUkFGWFBQa202VUpBRTh3SDVoZGVQd1FxK2NmMGxhMXpW?=
 =?utf-8?B?SjhuRnBINDdKbVdPZy9EKzhteWdXRzNKNXB6UVhONmE1Q0xleC96bkliVzF5?=
 =?utf-8?B?RzlTWk9VYVVPVVdYSWpyUzM1WXlQYm1IZkoyVFBYV1hiTTFmMC8wKzVWeWdQ?=
 =?utf-8?B?WHFBaWNpQkFWekxSSVZJa1cvQWRoK3lNNlU4QkRJZkhZUGlYWVFQdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0ivC6sb6ZKpX+oiBuCLvPJVGRFtDFeCuOqYtGYB6xFsQnTVlP6u9U3/dGiNMVnORrn7LcmSRHdSbIamlz8at056LCEi6KeOQmp10dYZLvQ0tmoHOjOrnNGOVPTiGz+crCw/uCt42qHGfukTGIzzGCcfFlqOcx2EAPlFSk5L0BvEioWncyhkbmC/lzDnokQ6rKwCHI8DkY2Q6l0cZVOzG4DpmCmmw2FJlaKntSVgjpHXsCTe1MBPtJoCmm/o6cyPSenQ4Z+9XPgfGyRCIu+RM1Os6vQBUch/LP7vcOcv9tdFYQ3+ZHNPE97BgjZAACP8VJ4fOCJyAoiyd6H4MRW9xABd+iO3rd4WVgE/p40HjLp+S5Vg6OALViF3muhAVBEM2stM1iVlUTcb3VSyDgohV/eJJFao8qgMt1VujDdm5gNMjVkjEiMjDpJr7L6NJ5eECR3CyIW0GXuGADjz9HayU0BQ4NC8IXB1O/8NztDGPKWZ3w2IxjvGlWh78DhQFU/PiGYlLbiQVuRpFvjb1WOV8OG+M28re0NbqatDtUcZ7cEUsM1y097soVZkwC/6b15fvHO1wwZgYK7I3vkjH4cXrwY6F0ESsFvyhUizGy/u0lNc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90d19bc-4267-4ee1-5a87-08de6cbbfe30
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 17:59:41.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW6GFv9o8huoCyQ120i01rCSq6nw8/s1Ttg7PKC166DFIWCZy/3nIKzv0mRZTv4kfaXtcIotQd9AIEHb2qPmLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602150150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1MCBTYWx0ZWRfX2tLBGR+oNDPn
 tvautvY3VUHM9STr33M/Nax03pCA9jkCfS3gF/ggpyZBgaycNDk7j+cLfXByooesg+q7JROj3y1
 ASyMogbS1h+J/Ld1xzaAvwPtksAP+EKi2zvF4BQknMoxsoEL/vHjLZmKp/u/OYUrFO1WWrGr9V6
 nnneFIM0Y8sUrbPengJgmussTBMkkaXoz/yfpX0cN0ds/uaY5+mdDkV5fc3NMF6I4NAM7CAmoXU
 5auz0P+eMzESlbwdXiU3eNEpCvY7tU8FcbqPhpEJukyB/hOlo+jjcz6YP4RhUKAjN0q6bGWSnxB
 DHfauMBicP9ez6jblb2xFLcKdFp+QPexpCiiaWVB1SydFZUfSsJ8m9HgBs01v/FjSlX24i1HF21
 43DJqFo5gfXB7xTLTA5T5h0XCc8puh1eQieigdR+relJfy6WgnyEd/94B5Vzz0cUUdcz7Fdqepu
 +poFhGKgRULHxadmuDr3+oWtNJrev3laud8m7aoE=
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=69920998 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=nk9QSqG56PvbT_ihOBEA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:12149
X-Proofpoint-GUID: dN0oXZzzVKrApImiEVBo0RAjGU9yfEXR
X-Proofpoint-ORIG-GUID: dN0oXZzzVKrApImiEVBo0RAjGU9yfEXR

On 2/14/26 11:27 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
> head:   953c8226cb2febafabb06a2667e860a2bfe43660
> commit: ce1368c9edf719a4fada76bf537f0614ab611835 [30/32] NFSD: Enforce timeout on layout recall and integrate lease manager fencing
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260215/202602151202.a1laeI7t-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151202.a1laeI7t-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602151202.a1laeI7t-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> fs/nfsd/nfs4layouts.c:851:12: error: no member named 'cl_fence_retry_warn' in 'struct nfs4_client'
>      851 |         if (!clp->cl_fence_retry_warn) {
>          |              ~~~  ^
>    fs/nfsd/nfs4layouts.c:856:8: error: no member named 'cl_fence_retry_warn' in 'struct nfs4_client'
>      856 |                 clp->cl_fence_retry_warn = true;
>          |                 ~~~  ^
>    2 errors generated.
> 
> 
> vim +851 fs/nfsd/nfs4layouts.c
> 
>    795	
>    796	static void
>    797	nfsd4_layout_fence_worker(struct work_struct *work)
>    798	{
>    799		struct delayed_work *dwork = to_delayed_work(work);
>    800		struct nfs4_layout_stateid *ls = container_of(dwork,
>    801				struct nfs4_layout_stateid, ls_fence_work);
>    802		struct nfsd_file *nf;
>    803		struct block_device *bdev;
>    804		struct nfs4_client *clp;
>    805		struct nfsd_net *nn;
>    806	
>    807		/*
>    808		 * The workqueue clears WORK_STRUCT_PENDING before invoking
>    809		 * this callback. Re-arm immediately so that
>    810		 * delayed_work_pending() returns true while the fence
>    811		 * operation is in progress, preventing
>    812		 * lm_breaker_timedout() from taking a duplicate reference.
>    813		 */
>    814		mod_delayed_work(system_dfl_wq, &ls->ls_fence_work, 0);
>    815	
>    816		spin_lock(&ls->ls_lock);
>    817		if (list_empty(&ls->ls_layouts)) {
>    818			spin_unlock(&ls->ls_lock);
>    819	dispose:
>    820			cancel_delayed_work(&ls->ls_fence_work);
>    821			/* unlock the lease so that tasks waiting on it can proceed */
>    822			nfsd4_close_layout(ls);
>    823	
>    824			ls->ls_fenced = true;
>    825			nfs4_put_stid(&ls->ls_stid);
>    826			return;
>    827		}
>    828		spin_unlock(&ls->ls_lock);
>    829	
>    830		rcu_read_lock();
>    831		nf = nfsd_file_get(ls->ls_file);
>    832		rcu_read_unlock();
>    833		if (!nf)
>    834			goto dispose;
>    835	
>    836		clp = ls->ls_stid.sc_client;
>    837		nn = net_generic(clp->net, nfsd_net_id);
>    838		bdev = nf->nf_file->f_path.mnt->mnt_sb->s_bdev;
>    839		if (nfsd4_layout_ops[ls->ls_layout_type]->fence_client(ls, nf)) {
>    840			/* fenced ok */
>    841			nfsd_file_put(nf);
>    842			pr_warn("%s: FENCED client[%pISpc] clid[%d] to device[%s]\n",
>    843				__func__, (struct sockaddr *)&clp->cl_addr,
>    844				clp->cl_clientid.cl_id - nn->clientid_base,
>    845				bdev->bd_disk->disk_name);
>    846			goto dispose;
>    847		}
>    848		/* fence failed */
>    849		nfsd_file_put(nf);
>    850	
>  > 851		if (!clp->cl_fence_retry_warn) {
>    852			pr_warn("%s: FENCE failed client[%pISpc] clid[%d] device[%s]\n",
>    853				__func__, (struct sockaddr *)&clp->cl_addr,
>    854				clp->cl_clientid.cl_id - nn->clientid_base,
>    855				bdev->bd_disk->disk_name);
>    856			clp->cl_fence_retry_warn = true;
>    857		}
>    858		/*
>    859		 * The fence worker retries the fencing operation indefinitely to
>    860		 * prevent data corruption. The admin needs to take the following
>    861		 * actions to restore access to the file for other clients:
>    862		 *
>    863		 *  . shutdown or power off the client being fenced.
>    864		 *  . manually expire the client to release all its state on the server;
>    865		 *    echo 'expire' > /proc/fs/nfsd/clients/clid/ctl'.
>    866		 *
>    867		 *    Where:
>    868		 *
>    869		 *    clid: is the unique client identifier displayed in
>    870		 *          the warning message above.
>    871		 */
>    872		if (!ls->ls_fence_delay)
>    873			ls->ls_fence_delay = HZ;
>    874		else
>    875			ls->ls_fence_delay = min(ls->ls_fence_delay << 1,
>    876						 MAX_FENCE_DELAY);
>    877		mod_delayed_work(system_dfl_wq, &ls->ls_fence_work, ls->ls_fence_delay);
>    878	}
>    879	
> 

Addressed by moving cl_fence_retry_warn behind CONFIG_NFSD_PNFS. Fix
folded into "NFSD: Enforce timeout on layout recall ..." in the
nfsd-testing branch.


-- 
Chuck Lever
