Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A17225A38
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674447; cv=fail; b=S6ufVEwS6ULhN9vmsClug/R3yxsfMTCFZ7c90Z0HDFHi2aXZlpAIRzOyoavdY51RImoSjXukSb2cDIPzgZmEQoep0BKfA6s3CMRbfL5DY6SWtedRuzF2K+new61WaSIlQYSIukgiq9dfcLS2N6M3kQwk5gvg6V/i1J2H/BuVb90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674447; c=relaxed/simple;
	bh=3AubnvoMdSxW96S0wZGZfICo+l5l4pVSglrCfwgvCBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=clZCe34NpVjI+Ly6bjBBrE3owSQMgrJTA432bMa+P6ULTCvOq9iANroi6LrNpqKD6aQOcpiYy/6tzLeYQ7lsoBQtgDDhVwv9k8Hm1xII3pCZGlYX+CaWgl9T9nxadygit6hAvxwMNP/vRGGU6A9cblYokgSIcDLM9Qd6fZL4Hbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e8nJRXpN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WKhCIh4e; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e8nJRXpN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WKhCIh4e"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDRRpG147471;
	Mon, 16 Mar 2026 15:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=K2hyAWhsYaraQNXTxho2d+nygaYNb0MgjdDUnugxgM8=; b=
	e8nJRXpNWJc9e9om6/SpRjfZ+yAxEGIkJwVVQAImkkJPqV353LaGjToLD1czRRk3
	87ExWaNAGNRtizPOqGijWyffspkqfuJwohXOGztpbhZUOZxskwUB9gDazVVrQr1w
	bAhEBJ9XdBK4rZas98aPfb7dEAQZtE+t7TjCZd8+t9LoyzvkECNM361YrLy5zJ4T
	sTTMcakINEBhRwHWLTo5mTB0Ol3uEU/q7Xudx4quC7bn2SXm3sPuZCMAv0QHc16s
	hHIoh/+Dq3oG9zfpBWJ0c+Wmh3vjVj6sT0o9FVSwDBrfKZMZKpLy2foM4d1HF7FF
	4gFTg4HXqyFTDNodC+/iUA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cw07ragpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:20:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62GE53k1031300;
	Mon, 16 Mar 2026 15:20:30 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx48r6u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 15:20:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNhXV4cNlsxy+rLXgVlkESSftTtAjTiDVPUm02DULf8D+t0pSnjirWdXhFuWA9Sn3tghvo5wZxX5ZFSuhl7l4Ii5Jsgh0g9cUgs5gwx3DxEjeuTjI/K0Ax5PPlcEJPlaKLQTvhHqfETsrzhF5WnaKx54RdPDzn27H2Be7JKDGh7wcsSaR7KqugFiJEOz9VM22jEKlmLinBpYihQn0PszIGTFj/5UO1qsIDi9f9glsbwJVKgCGFvmdGQWeQMkeHb9kXWSqqwSpd6K/Pna1HkRodh1AFBbICtr/G4sw+/rMUeBMYBVx1+pmVjU2IIz4LVnzTxuteOiV1Km2neaZiRTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2hyAWhsYaraQNXTxho2d+nygaYNb0MgjdDUnugxgM8=;
 b=SFDG72vJVtC5fBTx7a0wd1W09t1kdecB9EHegB1fRc4nQIcUlJpEi9eM7aWBYDlICy0FMby11soK1sWTDR4f1Xkz95RhMDo2KZLiwz1SNX3UjXJmKuqGTtO6I2t7jD82Cw/xnkR1M89/4uUZpo2+MH0Zj5G5fslEZkLc+7tElszagaQlJIONv18N1EYdUlw9kOXf/ZjKRYoSkqURYq9CX8jvn0URXZD6zqP8WtmwcvfaYw/OujxLLtdffQUof56E6y3bG7PJ3yepjRt8krXIc3JfOnPYgGLPZdUbywNC04PycKJzaYWeFQKf956gdv1E+PXESE0iGO6qMEPlP5bP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2hyAWhsYaraQNXTxho2d+nygaYNb0MgjdDUnugxgM8=;
 b=WKhCIh4eWg7LnZOb8PsddEPaQobS2yZc9ZvtuT1BD6KuGN8nHNv9s9UZROwZI4od+tzXwPsCeEXcsv5tS6rBo2oTWWqevZwwyed1hZ1/mTED7Q9Jq+BwfHtan2GYvWIzwfxGLITtlza0uD0Tr9CIsLhr6J9K/4DYFPr1NGIq0WU=
Received: from IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20)
 by IA1PR10MB6853.namprd10.prod.outlook.com (2603:10b6:208:426::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 15:20:26 +0000
Received: from IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a]) by IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a%6]) with mapi id 15.20.9700.013; Mon, 16 Mar 2026
 15:20:26 +0000
Message-ID: <0b457b47-3f22-42bd-a67e-29de401baba4@oracle.com>
Date: Mon, 16 Mar 2026 10:20:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [Jfs-discussion] [PATCH] jfs: avoid
 -Wtautological-constant-out-of-range-compare warning again
To: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Yun Zhou <yun.zhou@windriver.com>
Cc: jfs-discussion@lists.sourceforge.net, llvm@lists.linux.dev,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Zheng Yu <zheng.yu@northwestern.edu>,
        Aditya Dutt <duttaditya18@gmail.com>
References: <20260316144257.731006-1-arnd@kernel.org>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20260316144257.731006-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:610:54::26) To IA1PR10MB8212.namprd10.prod.outlook.com
 (2603:10b6:208:463::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB8212:EE_|IA1PR10MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcde4ac-b22e-49a6-c677-08de836f8cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	orivk6cn+jg1o8tvUQn8Dmd5Zn/DPa0pS5ijCrAYwz+cEhpehqD2+AVtVIK+A3OGNrMyZIsqihZGZ7T4NCAvQyUmFCtWxEZFDpo9H+fo/fTginr+7qk0Mvl9CQ3sP9RJLOhSZKDoYiWn9lazqC1H6pvimnapIByo/WC3xn1VAuGuv1HXD5uqVn6iQS5Zrw2o3UbbToD5w/SFnHSKjNfRcnkuWWQerqq4zTdTXdNeFoL7ENyqT3UJCoIsK7LcuhXMBIwBBCEBwl+7CaUk4S9R/4IlmBN93KOjbchZu3NDZLVynYRwjhJdadX9G+hlfurBGePcmUXtul2JshLnozidYYcMi8bxfOswZN2ZEAcYCaorvfdJMhu75Fxge4YOuhgTsxF1H/xSbeHINBbVEEVVMtCPnkOGOa7pyqtBegLcchYgZ8+x35RivDBpNd/eGeD9r6Y2j4FYMLazz2O5fpdyXJdmPBn9aBOWElhurNVo484TuQjORWP2w8jujGq2ZyhV5Fd0g8uBVPxFFYI0bZSeEu2KkxAx3LYpiWfBh2Qo+mISYQ/4q2hl2fOeY+qKwhCZyAaiqahG0o+Hb8Xg59xrK5MLHGr9vtvt2U74Rnu4/yKh2YX0HX8UwPv0blB3KAk4ri5o4jormcnOhLii6ztOvmZlXCrjYbsrw0Cpq/jUFJFAxPQoSCtu+PbyCSchrOemW5BFvcsdcsrRMykH+sCXSYeeY3/RWB8Klz85/UVgnh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB8212.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlETDNNL1ZIajJPMEl3K3Ntelo4WkJVUWVkcGZoRXhuN1lOODFHMERaZUZw?=
 =?utf-8?B?QzdXL3J5RHVjVlNmMVlvNzJZUGJlcVV1NU1KTXNoV3g0VlMxOVExSUMweE01?=
 =?utf-8?B?bzlmL3lCajZYQmxucnZIMkh5dGx6QjVOSlZ1K2gzVWZlcHoybEZ0aThmUUJI?=
 =?utf-8?B?dG13VmVxMzBlbjNTYmhMMkpvL3JvTCs5QmYweEtWdFVleWJRSEJpQjFUeTBi?=
 =?utf-8?B?N0RjVkNkenA3R2VMSnZuZllTK2owZ1N4Z1FmbXJMTWJZUTNUY2g1eEZzS3VG?=
 =?utf-8?B?d2ZIVmdQdGR1Q01GYzViV01NRzNyWVZqS0VsU3VqejJyaDF5T2M0TXQ4RHBX?=
 =?utf-8?B?RGRHOG5qL3M5WHBIQjVleUtZeVdSWmNmWlptbDlIOUc4dFhjWVNHdFNpTUhq?=
 =?utf-8?B?YlRtMmdyaTNwVjdSTS9QZlYxdFludWVra3V6OW0xYVlhdW9mVWtjdTMwNlJU?=
 =?utf-8?B?b2U5Zk1ZTklDQVlhUEFiaHJDZ3ZqbnFZVGVSWWlkcmlKK0lHQkh6ZGxHcjh6?=
 =?utf-8?B?dVJocyt2UDBLRmtNSU4zWW9pWXdJV0hqNWJaL2tEREFUdS9SMHJFY3BiTWh4?=
 =?utf-8?B?UE4xU2F1UGFZTzl0R1hLeE4rajY2L0FJL1ptQXpYeElhUVJ4RktCZ0w0WUFq?=
 =?utf-8?B?clRHc2I2Z2RMY1NmYVdwVUoya0ZvWGF2MkJ5dDByOU80WnI4UWprUW9ZWWZ4?=
 =?utf-8?B?RTRsTGtSMWlOU1RHQzYyY0Y1Z2swMnYzOUFYRlVZd3ZmUFhkaEFtQ2llYnpR?=
 =?utf-8?B?YXQyaUNFaWdGcEt0czRuSkdqMFpVZU85UFcvOTRpRnBjYVF0Qmppbm53UFNZ?=
 =?utf-8?B?UWU4TGhOYkkxVDNVcXI1K1phQjg2eEdLazZGWEErdlFtNnBSRE4xUlVSWUdJ?=
 =?utf-8?B?OWdJS0Q3UjlGWkFUVnVMNjNLOUpjYlJaQ0lVdE8wMXEwNW1wOU5xOEdTUmlW?=
 =?utf-8?B?QUpUU0pnbGducTRGSHZWc2xNQ1NpcGtodWJKNjdoZHI1QWdCNi9HMkx3TjVj?=
 =?utf-8?B?WVFPSEpHNEZOdDFhYldFOXRHVkQ5NjhzczR5aElSK3ZoQ0I4dUE5M3FOYmo0?=
 =?utf-8?B?U1ZMeTQ4cStNUDlXMTExNDc0b0hKaEFFWitPS2JKV0NoMTVJWm80bVRLKzhT?=
 =?utf-8?B?NDc0clA2eW9PTld4eGJ4ejc1USs2THd3cDVWM2hpQjF6aUJ3b1pVOWNaa096?=
 =?utf-8?B?bWtyK041NEovVkxLWHd4a2FZSmhCV1FXUDErcEFFMllVOWgrMGk1bitWRlEw?=
 =?utf-8?B?ZTJ2b0x5L2NEU29ENHh3R3F2SUp2enBDczlsOUVsVjIvcGxnemhhSGhuYVZE?=
 =?utf-8?B?MEp2SHpDZFZrL2FISW9JU1lqdWdCbjZDR3JtN1AxV3RZL1FRZC85RGlDVW1C?=
 =?utf-8?B?c1lnV1pJZnpCcTU4V1FhZWd2STZybUtrZVJEb0VnV1c0RTJsM3B6M2JpRVU0?=
 =?utf-8?B?bjZIbzhXbVFIYysvNmNCVm4vQzRPTTBRT2M5WlhPNncwNlg2YitCdFFqd01s?=
 =?utf-8?B?SkxvekxDeDNxSU8yODg2NDd4SndERTZWL3h0MWtleVQ2aFZVODhQNVd1bWpz?=
 =?utf-8?B?dHBzeTJyMDN0WS9hU09lOGtMZDJPN04vTU9ZZkNOTGVISmhNeGp6aEVqMFpw?=
 =?utf-8?B?L09nVWpmdWlNZ2FpbjBYczJYSHRIekJvYm4wVW0rVjhWTnVRWGlzRVpQTWts?=
 =?utf-8?B?elk2V3dBYVhZTXlId0NxK0RCSUQ1U3pQaU9LcXZtRE4xNUY0M2ZScUc4V1oz?=
 =?utf-8?B?OXdpNStYWkxsR05TYy9LMWZMUm1XUWd1M0NwaW93WlpjRk92dEdWUmdpcUg0?=
 =?utf-8?B?am5yYmR2eEVnY1d2emhCQ0htZGx6NzZIOElGZGZXRXM5UXg0aEtJR0RwVDZ0?=
 =?utf-8?B?NXNhOHUzZjJLTlJqbkM2WXQ1bU1mZjdndzVYSkNsRGRjUUE0TWFTMGZDY1Nm?=
 =?utf-8?B?WHdjTi9LcnVURjdOb05EQjNUSytwMXpEWE96U0VoVEJlbU1JRVBuNVA3UlVY?=
 =?utf-8?B?NWllRS83by9ncGVxeHR2SVdJRHVCb28xTno0djdiQWlZVnlWYVRGNXhKaWZF?=
 =?utf-8?B?MFNLU2R5aGd0S05Jc0t5TGRWSmh5MXNHRGZadkx2eTVHMENVdEMzby9wRlBW?=
 =?utf-8?B?aExTd3Vyd0ZhK1A1NVJlN3VJN3NXNWNiME1CcHlIa3RNMlA0MVdldmZvdldH?=
 =?utf-8?B?emNYVUFOL29vOHRXcWpjVldHOGpNMGEzVHFoc0x1SVozVFlYbVZGOEpmQ3F2?=
 =?utf-8?B?ZmVXNjg3QnE4Vm1vZXZSaGxVbnoxKy9TdFp6ZzVLSW8wR3NPcmtaSWowYmp3?=
 =?utf-8?B?QnRGWHB5TW9DaklTRU1sS3lDM2QxdVRpSnJTVUlKTUtVTGQ4eDBZdz09?=
X-Exchange-RoutingPolicyChecked:
	NmpGLjlUZmMAH1zETrR0DTt8g+jo61vOfQFucenr5gklYMXjfXHzkuO5DBBkLw5ucktLiUhkMGOOqOPjir3Ubj8pfKDTHowvX0fElUjUaat1egukzMeh9zgt87LbsFFsB0YEROIh9mnjMX8W10k0DvcTlV6ao7fP7pQu2YcaN7QLCccSF20/s+Dl/jqgaFu9wy54eRDP2j0ZKC8UC9cx8LWO4gaf/Ln0VHjXYqrAPdXAYrZam63GnJ0SOSOORCKH4B//HhiIDM2PnTUDdU3VjVXMshaHgdKsq877VofxXfnVj9KDHnj9DypGErCbnpktRsdSo9HQuwFw5iOCyT4CoQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zN0FqQIoWbDn35bqEwyFDid8+WYApNytHyfdi7A+IczoBkwiocNaBxdbDFa2mSnQAshzQb2XyQHStBlF3i4SU2PqTy7rr4DMwJOE8+EcHTKnBCxGw6C4EUUUDpsqn1cC/FlY6nTbJDNXvI1aPw17SUO+tIaC2aOsOfOgXVIRqv8NpgjNZKvDgN5EWB6YxSINCcgrRq7pi9zr+7ImEayo5ZGBrMHFzWopqzPDqvbPI2o/7Bp5vX68NfmJ/ypJpFtieMN9b9hQ54XVyRBr+RTmWY10WV7gi7PvpsNyES8PSZTbtPU8DyOxdAtqr1MxSOTnVrGcjGeGsp1lGJFWsrTKnBdQR3IXs6YDu+rSFN4ZUUGwj7WwM8WddkQrpKoIVcsns88RvfwErrYbnFW3NhhiS3GKN/LQlHshgh7AxLotYDyhD68dMK9JGw5yzSfuEaSu6Is8qIbaVQufoQcIMHFdxCwxR3U8WjoRGTaI8Z8o8hBo8k9qcpeCdf5lNWV9LOIlDXPNNrAS5ylKo0beopUqAVWhWq9fUrPdyDZ8pZplE8TD7Du5rIEuQSSPcjHjuH2Mc9j8MSSfmSPVi8njpeYnicvNxATGkzdSgaTJpZ/l9mI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcde4ac-b22e-49a6-c677-08de836f8cff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB8212.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:20:26.5317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MTpUR4xz9u1Vq0V8bTXbEgBwwUVM06mStghIQbNpMmwLZonlPkC7RTzNYiq9toQVA58P3qN+qOOKLrI5gJ9GJKAZp7wfXwtUwR/v1nHWN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6853
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603160115
X-Authority-Analysis: v=2.4 cv=HcsZjyE8 c=1 sm=1 tr=0 ts=69b81fbe b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=DVzSjUfza_Uva7U2fDAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2gHAeCmbciWHpZ-k_T74NdLBzFx_6aHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExNSBTYWx0ZWRfXxg+pWQ1V5OPm
 +3C+gg3vq6XIDXM6a6sIy/4QdgIu+jA/V3kn7QO+zaQ+S7JluHpXJvKNG5wRkXkNl2wBSOZxG74
 NfpYvR3m3CfjGbsGtI+6CbEIr8NA9MjsWAi3qpvl3EloFrEWDKoP1DMY5VV7FoNqFoYT/IxuJVw
 coybW6KdF5MslEVHxaHapcU1xnUasyw1hOsqiexGW7zddv0wCTxxl7j1LTRMp5cruAKBnnk/aBK
 tchuQRUMa0K29LM8CZlBmk+6aIznOCNywk9xu8Rd7UGM1RIx3txC2CCw+Zhkr4qabhSvLL8dWUa
 ebS3Pc1lUxBY3SSqtbRT1952UInhVI/KenCQuRASizSINqGbaXmvaj1CoioFclreyK2Ewydv8HS
 Avx/PCXF4BtWzhIf1Z5kByGqiDaOELUyAbZmhV1PX5KbwYUtXvznBN9/9irgISAqsNKIShDdZ9u
 U/W8blxaMgctCTniamw==
X-Proofpoint-GUID: 2gHAeCmbciWHpZ-k_T74NdLBzFx_6aHJ

On 3/16/26 9:42AM, Arnd Bergmann via Jfs-discussion wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The comparison of an __s8 value against DTPAGEMAXSLOT is still trivially
> true, causing a harmless (default disabled) warning with clang:
> 
> fs/jfs/jfs_dtree.c:4419:25: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   4419 |                                         p->header.freelist >= DTPAGEMAXSLOT)) {
>        |                                         ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~
> 
> I previously worked around two of these in commit 7833570dae83 ("jfs: avoid
> -Wtautological-constant-out-of-range-compare warning"), but now a new one has
> come up, so address the same way by dropping the redundant range check.

Thanks. I'm going to remove the comment above it as well, since it 
really isn't helpful.

> 
> Fixes: 119e448bb50a ("jfs: add dtpage integrity check to prevent index/pointer overflows")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   fs/jfs/jfs_dtree.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
> index 7669e268fe35..a32c78d1c416 100644
> --- a/fs/jfs/jfs_dtree.c
> +++ b/fs/jfs/jfs_dtree.c
> @@ -4415,8 +4415,7 @@ bool check_dtpage(dtpage_t *p)
>   		/* When there are free slots, freelist must be a valid slot index in
>   		 * 1~DTROOTMAXSLOT-1(since slot[0] is occupied by the header).
>   		 */
> -		if (unlikely(p->header.freelist < 1 ||
> -					p->header.freelist >= DTPAGEMAXSLOT)) {
> +		if (unlikely(p->header.freelist < 1)) {
>   			jfs_err("Bad freelist:%d in dtpage\n", p->header.freelist);
>   			return false;
>   		}

