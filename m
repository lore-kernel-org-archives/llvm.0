Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9B1CCEF8;
	Mon, 16 Dec 2024 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734387259; cv=fail; b=nUqVqONWN5w/7YwuGyxPyUokEw4aknck7jkIDkyhbemuiPSCSbCWUa5xjRbRMzE1wGJb7jT6xvCgSosn0qc6jB7Yj3pmiYpw0pUYnIauwSvRb4awN9klGCtvG1mrGt/5d3SCY2LV1ZK5bhCxWh86x7t1+TkbPZJN2ajcdU5YhW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734387259; c=relaxed/simple;
	bh=dg06e4RrEmWWvSbcZjIDgx6Q8DqPKMQ4E7ifV0SjDYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D4bS/OR8bgbkbl+vKDDPqPIF8ZGh8EoOQ4p9pMfl9J3tZCpxXwLXbpzViQmGub23snzHxUiuqDA559Xy79w3voDlCZpuWXDq/1YANHbMtbM09cyTS9////35OI36NMnry37Eye8NZ/ifNcb9YNBQt6CIEFTKPagetfPUwJh1ZDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lfgXmhE+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kvMqqRdB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lfgXmhE+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kvMqqRdB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGLXrWG030319;
	Mon, 16 Dec 2024 22:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9+sdsmm+xUhAnT9oja
	kb6sQ8QmLLY9HbJni6/NgInX8=; b=lfgXmhE+ymzZzNNPM1WCg+fFWnG5Yk+HJF
	TTfxycNFKKBiunV9tsL1ToUaxsqFHCztHrtIzUEkZ3AFVtXqW4flLHaNGlXAQcs1
	WrWFErqAIB3vKff9pAdDyZt3rxPbmcQhAjWWNI3ipMpgvzJr5HYfQKkCG9T3HT4p
	5VDb9MV2qVBzdewBQ2hUeLIt1atvbiUKJKy7tB2rlNB0IMkaGxuGSbkUsVUSWJNb
	2eCCUqEf2Ir+w1dLdUnlozUVkSrKSHOJY9hNpU253Y4hg8iWIONIKGFx7R/pVYEh
	FZVSvMZq1o7ALSyaNQgSlxLfLbLDjARDezMCmuKmbQyW9BPjoviQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0m04n32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:14:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKe6U9006411;
	Mon, 16 Dec 2024 22:14:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0f8m4tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki6KoE3TwKpAK/CMwC130pHhJyiUwTOTOCsPeK20pN1gE0WI8yRZBk3NOv0oM1JXwUe1M9FqmvGpCd8ue0bo1reS/nr0LHVp0u/OgWcJ7MCU4FRQjnsz8g5JcSNtrjXHK4fkhoRGQ8zQzbb6Ep8V8CD6SNEqaWEDzgsyM7N56CqH8ywO4OhnzncqbAkKOsd1VQeyfkcXPGJvjbDQY2MeF2EKEum5pwk9C2kswHMo56sXNnK5mEziDtA0bTZzd20GJ9lr8dXw8/qhBxbRh/Ju0FX/0VJ8o/3K8uTEOKGZ8anFAs3WZWkFRY7+VG4qZLFugepSSL94fzUNWH8Q2OPEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+sdsmm+xUhAnT9ojakb6sQ8QmLLY9HbJni6/NgInX8=;
 b=GVovzbVOMJ7vrtE8/AlKTCbPaIm7T0tc3dD5cIyMEicByOQsoiiJHHZvPblQZCiZsOd/pS6sZsFZwpOaQAY5iBJ2525gfKWL1Uizyc8KAWvRe8vKbLXBQoglsMjFrFLfly4noBxgV8gVpgR5DjHKYqIDv7uAtF7yOk87drwF5+TI9Goz/vLK6P1nCQYGWNfQTBxnsCODsW+qIbXLWMOSragZrSwQF5AftP902PHh9iXOgruwjlH1+NvNBfSuZf6NQh5098omRIo+7FidDGP0dvrgs3u+Zy+2W8ARYpA5AnvLTWNmba6P+7CdQUSMj8neU7xQACYOgQStsFOD0GwEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+sdsmm+xUhAnT9ojakb6sQ8QmLLY9HbJni6/NgInX8=;
 b=kvMqqRdB0RdXs56qQ7qC6lDlCID234WTcdi0iryTLgeenIW6vChyPv+RqT7P0dhWW6tXsD8Rpc5deQw5A2Ux/YSfKBCluhXfoZFsxle93+WygrZkxz/93J9Z/V9C5tEVPvzV2xivLPDu+fOcYxqWgALY5czKU/Z6WDBc4J1JPMk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB7311.namprd10.prod.outlook.com (2603:10b6:208:3fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 22:14:12 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 22:14:12 +0000
Date: Mon, 16 Dec 2024 22:14:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: enforce __must_check on VMA merge and split
Message-ID: <33048ab0-6a59-48da-9c1d-d7d3e870241a@lucifer.local>
References: <20241206225036.273103-1-lorenzo.stoakes@oracle.com>
 <202412170555.i4T2rEdD-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412170555.i4T2rEdD-lkp@intel.com>
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: e55d1a5a-d44b-4837-35b8-08dd1e1ef871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1I+BwC36sE+190XK0lijrcCyWpXzT9wF5iAI1GcbWyfWR0PTkurWIPCpI5qT?=
 =?us-ascii?Q?dhngW0Qjzg7AXb0VQ5IUdH3KegSJubNUsKUJxU14cMh5pmowHV2NSpqtljzN?=
 =?us-ascii?Q?mvBsL1CqhwW0OK8Q4DgXxLlPd9SfAFWeMqoxMsOti90e9ZxP1wcdGRjx95/V?=
 =?us-ascii?Q?tT1oxQZ8h8/lFq3xoErlYrNVmCX/IPV9FlMYxm+cl+gY6h6UOycH+kTbGLpO?=
 =?us-ascii?Q?XHwYmTx9ork4VCRpfBrskyqRJCBGh5e/RD0+J1EdbaXVevMb+M2s0OUlVQca?=
 =?us-ascii?Q?m1NsuMrcZpspMNtDmdWam/S4p5ru3RDUeijR4M+h7btsrM7pVMozKPRbHTdF?=
 =?us-ascii?Q?9TUmXXHyxaDAasBsK6XQs9tvoWbE7WeBpoBbJM46dXINuT3HNwWYlRPv/xq3?=
 =?us-ascii?Q?73eY5nxIbnn3OhqaUQ0YD07zOVr2IUQO/knjHyiLYAEh46UdXdSacpa+7YQR?=
 =?us-ascii?Q?8B9B6tjamj5tcWiRBgYKD5Yr4NwqHCnkPSn3dIkHN/7zLHprpkHnX++l3Wm6?=
 =?us-ascii?Q?aBU2yZji2rVvPiys9m+LRgwTS8yCkLT1r90BISVjnYlwRZBxfuG87cJJGVVM?=
 =?us-ascii?Q?uEwy+Mo9ycWMheISw0BXD8WeEiIWimmMsVF2nz08ReMq/6+wexSEaCUsdwe0?=
 =?us-ascii?Q?J8rZlWwPEDKCoXZWvendPcTbdbsHrrsbobH6SThuU5IIV+RbDg7CQC4OMPWK?=
 =?us-ascii?Q?xh04arvK+6fNsKIOO13ajWQBW9G9D/kyhq4xH6a9X9TrX0qblJSrSZTz/oR6?=
 =?us-ascii?Q?+g8cSkQ+GlzvDH7uNiDgC9MYWcd44ynSY8kmB+9L98DWyB1vd7Q+ndMjm5Hv?=
 =?us-ascii?Q?5m6hGJeeqwSo8Vc6bCFFqeI4zNzO8nobH7BCzhge9WQ0YfHARgCtX1Nl+Bbe?=
 =?us-ascii?Q?3qi5Hsw2ZFA/Mex+oTpbs7uadwdCM4Wyrl74JvFhhwrTVY5gunp+EPqTSBMo?=
 =?us-ascii?Q?FjWgrSKbdKTzODLyH72C7ne2igwrf7+K3ovTx7YsF4S1O1KEvB8lsDC+SOJ9?=
 =?us-ascii?Q?FOMzNx0Ht4bpTq5TE/upkb4ljb3TSMI/ESAfTrqI5w/MxR30ZOYnIvJW5SaK?=
 =?us-ascii?Q?MydOx0va9uFcelh+zN1dR1nFI6DXgXWemHcc7tN5GecJCuIjH0FeF6FiPttr?=
 =?us-ascii?Q?2R1xRO359sgkrzi5e9rbF3AV4wFcDdWY8vnPOz0NbK4WoYacpeKra3XGEuea?=
 =?us-ascii?Q?NBWkEoMZb0nGjZ/j9KnamOlLM2tVrDUYEwOJFbquTfKSw4T0KdfEx6icALKP?=
 =?us-ascii?Q?zMG1vNSSdGg0tqr9s/Hat+fNGjvVNSoLWEfwkNyoaCvZxaSjVep+7dIZc1l3?=
 =?us-ascii?Q?qFywix5OwHeMOkLYfZYaFSzm/YaLTrGZUDjbZQMlbIIJFg9uhrNOwr90swAB?=
 =?us-ascii?Q?4VJM3mUu7ZCIN74oNgTGTmmInDJQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0p1h4I2JlXNKT+1+8tfzhh754PJDKvBg/QaZ3x/x/a+QbqnMJVpKGTf5dBRB?=
 =?us-ascii?Q?chmxCbj+3PomQ7R9q16qs/G2y2ozG+Y5FqJUNzWuZtXsS8fRI1uZbGN8z8Na?=
 =?us-ascii?Q?/RRoL30Xna1h9XNc2yFVbhAh+n7ssmFHiHuQV2pg7FG87bqT1aS6F1thwhyj?=
 =?us-ascii?Q?Ny7WxnFq0JaIRiwibdLmaCoEbHjS7Hpq+v87bwb2u90bHLdq/2CKsJ5L+Z6g?=
 =?us-ascii?Q?iVZyPm9wBiUKuw4vXXnEhJukheV86KYKwaKFKwWdYuyUlLNicBMFX1RpJ+14?=
 =?us-ascii?Q?C20F6jFLwOuCrIkYnx20BJvauGgX+iXyRR6u0C/q53o5fdW4d3ckIHY3jzYA?=
 =?us-ascii?Q?Pf0syiF/jChFS+Eqj5Qot4TEG5wfq9tc5+4XnfnTcCsmG5czfwqddXgb696h?=
 =?us-ascii?Q?9tJeRSNifHWtlrsNxgzbBwrY1QC0eZBNGjaRr/M43CSZVUPuj4o5QZEc17De?=
 =?us-ascii?Q?gGSDwKjJIy+Q2lA8ndm/IAj9m0N6an7fjCMrMBSJz+WYCXxzGxVo1wITNHGB?=
 =?us-ascii?Q?H7+YpMGo4Qpj/3nfb58ymvSn+CV6An9zB7zwds4/cWi6PgW7jqaNCqYcuKMX?=
 =?us-ascii?Q?qx3zQoR4UCCSyT66AGS/9iU3D0I3R8oNB2QES68XfPNqTwz4COzgTkHJ0bpg?=
 =?us-ascii?Q?fjI2iegQCqKM94drhucKWKZUkSQabR4aqxJqvBysOvszAR4YwYmXg47wAitM?=
 =?us-ascii?Q?0EqOnPxjefsHk/+mTHOpHOWkqI8YaFFjEYsdPxFHm3koph6fq/mptzUTZxtN?=
 =?us-ascii?Q?sI0KiGv7/4etDGjSPj4InvJVWQ+UwnBNCQ8CygnWwu/JktL4LZxsg12kYn+9?=
 =?us-ascii?Q?GYG8hhfXaj5QxYcFlyDu4i+zaPuv6x3hrmWBN+ZVp3sZOZuwsDHGYC2PCN2Y?=
 =?us-ascii?Q?zo8JpUDjlb6aJCWXqpB1Sufn2Nz69sGc/iMjzNXAw6q4RwG7coHhNULim1I5?=
 =?us-ascii?Q?k9iuqVufvUM5zzro0I2iAVVuadhXEcZrCEJNzT9D51KxkDiDuqRGTviT5P6n?=
 =?us-ascii?Q?Vnl9JtLcsMbUkgcJbR554eEAUVktzqjB3TEPBvLDvfUsnPXxaoTcyO7a03E8?=
 =?us-ascii?Q?hLHzWOGEMvdq6Mm+lTn58ryj6W7bWRotP5dn/2lnlIwWl4bYNd4fVsqGsoOZ?=
 =?us-ascii?Q?pWuIwTSsOOZBYIgEOwjf+VjdY9uTCgureoOivj2rQ7fMgyA7LvOlBAlq1g2A?=
 =?us-ascii?Q?mwxYuLv7omHCSfNYq5v7KGG3HRHPfKH4bCvQC98NGODymTRYYqiN+4LkDMXU?=
 =?us-ascii?Q?F6X0k0FosjZrQ/lW8Kb5U9ugch2mt/TCeVehR8enJ6y2APXhaow7M2Lqg2O+?=
 =?us-ascii?Q?V6tGPgzX6ZVEe4nD7JnGYrpXiBYcuqxm1IybjnYF5OE1jHAa3QH1hw7j0r3i?=
 =?us-ascii?Q?jqvdrbMTtA9rbQflMCFNTyrTyxzGSz9/4nL3YTMuQnHDRAm4IxD0p3OXWfzV?=
 =?us-ascii?Q?m/cXTutAnV+2bHaHs72FeQpo2m45g2oNT2q3cWr6e2kgmDQA9Ycgzr/jUewe?=
 =?us-ascii?Q?3FVPeWoG9g00LrkEhtoK7TIgHHJZV+hc94qr94vhxjIUGiRgVUnM1zHigCZe?=
 =?us-ascii?Q?iRzDqLH+rnTojP0MxmoJ5AUDcCMOfm5W+kZocNlU+rLsSypk8J31IuH3JncO?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1IKNmLbKdciT+1wX+GYMFwl5enmRPAesNwsgFM/rtQow6xmLbznQKIUdCQ5T3BRUPsIn1qJ3x2eqZVxtMrS/sDDMXZgU+op0O/SXX5aAN35sTo5wSol6j7mzQITNQlg5zLvekiJr2J+WGwyeNDSGsKpfabzdSk1faIUgzPwb6WRUy8axZ/KpkZvl/dQVWLXm4HW+UFOIb+iaASx8jWZcVpEZrqlWzWQdoOVcMhwKUste4UtcqRt+Ut+oGMNro9jgV5vik0qPquraZtpHpdOQ6qN0o5At6BNOGHmcv2NPlU+owayBDbz3iXDpXDEXpqaWuHXA3aehs/gCVceNgAr11Bw/brrIt+5R4s0ttAeKE8drn8FWjNne1/HLKoNyrYwh9BFW599U70aaf9YycFFQHagxa3YUcJhsXyBxQCYZVzkLyVoI7BTLhQW1kLBMb6Xs40PBSIDwqry/9wLAi0HLwtlF/zZVX2b8ChMtFIa03OJZUxHNtEvz1sEyPc3+Er/zRc/gFl/1pdENCCy3YpO5EjJrFSiPBUmR5cSVIg0S/+35ypJTCvwFr5FpmvvX0Azwgmeap6qtystyoNFQqAk2h65WPr2AMlSVsegmkHZHjS0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55d1a5a-d44b-4837-35b8-08dd1e1ef871
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 22:14:12.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtpWp15uNlrxIr0e6sM23eUuNCPpmlvEE66weC2bM0LSs57663EnFXytsOpIl1JNnan3gzqrcvof/zft8dIZsXlo6W94VQc0epHE0BvK5Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_09,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=640 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412160182
X-Proofpoint-GUID: aL-YyMnypbxCM49ikcwMTNiX34vCubv5
X-Proofpoint-ORIG-GUID: aL-YyMnypbxCM49ikcwMTNiX34vCubv5

I'm on annual leave so can't be responsive, however just to be clear...

On Tue, Dec 17, 2024 at 05:59:14AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
[snip]
> >> mm/vma.c:2468:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
>     2468 |                 vma_merge_existing_range(&vmg);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~

...this is a non-issue and produced by unfortunate commit ordering I
expect. This change was motivated by a fix that I applied that resolves
this line being mentioned here, which is already slated for hotfix and
present in mm-everything + mm-unstable (and mm-hotfixes-unstable).

Since it is a hotfix, the fix will go in first, and then the __must_check
change will go in after.

The __must_check fix is critical as it prevents this kind of issue from
ever arising again.

Thanks, Lorenzo
