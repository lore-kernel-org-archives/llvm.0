Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322401BF38;
	Wed, 24 Jul 2024 05:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721799726; cv=fail; b=JZh8xhQp1x308CEm9b8Dw4nwCAX2tQ63t9mIlgrhBoeJiPNdYcDLnEnCnPxHP2tO1i9KzVYwlLkvCgp0VYXCQRUXCPyC9Y3rNMotrxojb1x9oQCR4DayPOKoHgAXlt20gxnWhWd/kp/jneExcDMNYfZjHLb4sD2E3m5rr3hmVuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721799726; c=relaxed/simple;
	bh=2aE3uD1rJ0gClIvMrvopR6MgckACbJEeOlFjKia+oY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oQUbHRBahUuLkzewUOgVr2MKmCTPteqs/eeTFQteiNoH6VIHXQjRjHJZ7ORKpRcXYF42LjppwScG+ppfPjOKDrDRpHOyp79/QvXk8V2R2i53OoJc7SkEf+ug89Ye+pifL9TmdEyF1ReBUkGTXfQ04zVdB4EjCJ4UBiSlaTNcuM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eVE64ryw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AmhX5JFP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eVE64ryw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AmhX5JFP"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NMBZIl023230;
	Wed, 24 Jul 2024 05:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=JoLa0WZHLfw1S0Y
	pYnC9n79yMdUYEQNVtO5L35KSbyY=; b=eVE64rywfnXlMjaj2Wpw5LWwHWwaoKt
	MIfE1rxvoK1q/nPE7tmORNldF6yeTJnOOuE38DzLnKov3LD1EYQf6ZEX5hDgr++y
	3UnPEJudl/vVvTwR/7kg5w2B3MWhV/ya3Hhh8QHuIC2m9VHfWkNaXhVuutdEfLqj
	byDl+0RcaxNFIO9R7QiANT2Q5X2KNhU9ujTe1pdRenLiDRHLAkQfY0lcajBJ0QEY
	T5R+g/zwajarBnhVDab6vzQR3PDa+5KAbaaBZ2Vrfwhdb7kLGa0o3LGVFKyKPum5
	phwTQVNHmqB2G0jgrSfz7M4gyY/2Nsb52tX3aPtjJT2jmPad5fvVDjw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hgcrg5qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:41:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46O30Rt5024587;
	Wed, 24 Jul 2024 05:41:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h2a2ca0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCeqsZFaA1+ssTRAuFqy9MeDbVpyxH60VXkYOBZgxv0SdbkU80Gqc9earNVNwhysaUB8LXe8j4Sz1irgjSmy/GW3VhwksWgLr03AWoiLJ5VWlBz6rlAUWdcupbxBW8ZLnv7NkUIJy9KsqkhjrXROi/obp9SCyjFjmlM59flCcd5PmMtk7Ggl/XQ7hCMzyCC2hGMMeQ6SjI9Rd3z6gKnRX7WoGcb18GkpJ2Zoa1bzUtWPFMH0Kfgzb72Qk0RvowQGsfQyP3p3NzfAMggebbWb/VPq7YCrjDhOmo6yhc1bmwDJNTIxvKqUwkYaHmeJ3/tnPewTzUVeAw9wDX2qGIAsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoLa0WZHLfw1S0YpYnC9n79yMdUYEQNVtO5L35KSbyY=;
 b=Cn8kfyWe8xP1AvaCiiEzmDyS9SKHh49IMbvLBr1vLVvXOrwOcH3QQSbELu8cvxrdMiOaefpbvdWRx8wwmCVV0VoaZbYQccZW7xOTRcY04IPXmpORMf7GGA/aHsu+td/TtzB5HJtpsHFmTxN1BjadT2ABw6oH4APHSMrgdVP/ZgIAztEkfd/0dR5343eB30ks2zQvxR/zmNJ60SObYtd8GFT3FPL3WJn4auolL/AgMXfJfeXOD6yPjJ56pE4r6Lowy1c8IsTVkSHVnGIki++EoTJUlUTN66jXqv0rlnDY1IqjK1W9j3YqBKTRQ4G4hHiYMV/iSi0N4WRsypaZihf1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoLa0WZHLfw1S0YpYnC9n79yMdUYEQNVtO5L35KSbyY=;
 b=AmhX5JFPKTiV60MXEhcikPZk1xf9JGoBwILP/Iy7uaSBYVapd2ZUatl71up2BeF1IQ0NYYtkDY1s2ezhAhzATLZFIBFM14dKq77YT4BclgI8fkaFDn8ZiDyE5rrLTQJIEZcApLw3zNUSRRvlJN8zielX7Gsd3XyhwdLRLRNXbcw=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by MW4PR10MB6607.namprd10.prod.outlook.com (2603:10b6:303:226::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 05:41:47 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 05:41:47 +0000
Date: Wed, 24 Jul 2024 06:41:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [akpm-mm:mm-unstable 17/30] mm/vma_internal.h:46:10: fatal
 error: 'asm/page_types.h' file not found
Message-ID: <5df672ac-73d0-4b23-a62f-c78f188424fa@lucifer.local>
References: <202407240947.x904ix8E-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407240947.x904ix8E-lkp@intel.com>
X-ClientProxiedBy: LO6P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::6) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|MW4PR10MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: da6e9103-3b89-4e97-b975-08dcaba34f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPzsWEv35wf/JXwnVhhMiIz+YRE6KGCwNjgfZvPcFqPsCFDe+yWBIrpfXmk9?=
 =?us-ascii?Q?xH5b9TrG3yRqsbiWlDmGwM9iRBnhEYCgaLrq3zEL1rUJ8H26lQK+E/5Maht9?=
 =?us-ascii?Q?uJ+arkZOQC+04ZXKVpvYtT8KI3tqM4XyHvinGOHMbGOrt2Iq9BuJiZ7KlKlV?=
 =?us-ascii?Q?LiFG6S04GtHWYIXlHsxTFO2oMN2f4VdYmHHMZV1x+wmTQsb6/KVyfvvyNOEl?=
 =?us-ascii?Q?rytsHpIFmjGf27SoYNHzUaGvWj2KpRsfmNNr0nyX0cKn8d+IzI/DoBkgb2cp?=
 =?us-ascii?Q?BW1YyDeT2oqZ5lxBCy1M0xSfUH2lRLmBVMs/WQ5fbSn7bWjNVyFMxMQiNsae?=
 =?us-ascii?Q?Z3fT4MBIWgZuwsoe915Li9GVuX87uQq74nldW+IihDk7Kb12plSCZRueVuXm?=
 =?us-ascii?Q?AKMIPFlOpNPiJeHBrYv7HLCO2EjMnG2Ockaye9hBSaSElsf6P+qLmxJphufC?=
 =?us-ascii?Q?JYfvmBSI9urRJyjsqciRn1D2O14umXdNvlyfcK7Wl7VbuG5rAyVF5H3bS+WA?=
 =?us-ascii?Q?puTE2T8mbnkSL/8xuSZbyF8krY9i424KEHDMnxFLGR+mGzKJ21J2aAOLbRiG?=
 =?us-ascii?Q?pXDtGLqk+UJjWOJEapVgwnTUlGbwAe904vbHRGAZi7rInsK1noWPkxqV7SGI?=
 =?us-ascii?Q?C6YXzLCPrKV2nsT4Ap6L1bwM9plH2S1igO5X36Vxups8NfyRqYqkgzVQEwrc?=
 =?us-ascii?Q?7Zg+g/yVR+1FlViLd5SlJ40RA/QnjQpFdN1riFA/k5RzlQxKgqINDgZV+e9z?=
 =?us-ascii?Q?GiBHAY3I3MhQ+yE+GCDL4zgkaOQz85MLYg8bXoAtHuypyjWgxPT4tKdYBazX?=
 =?us-ascii?Q?+Jx158NteiT/hgXDYGYwRddYbnG8YqoAVQm38fLn5VpyI+ltj1C5EGeUprzR?=
 =?us-ascii?Q?+yqArMg/jUlbZ+QXgV/MknoxbtdLgb6xs4tIUg7WefuZtcnN1gOqNOrjFVmm?=
 =?us-ascii?Q?kBg0p3XNmAdBbFmBCszkC2XPZkfPtPgUtMh96/S0JSN2Nvn8rL2oRR/CLboD?=
 =?us-ascii?Q?78ASVIuHUQQcJgNs+HL5rWQ5xX+AOk8NjwSnYJQtlpApU/MPScEjcHMDerph?=
 =?us-ascii?Q?UOanZTNS5qaD3mOQECbNyUz2ZgzzHDMDUuH9zd+HmGog6bcxSXw8KHRFEKvc?=
 =?us-ascii?Q?qROxdbO1YjFkLWh1lFg7BfUCEDoJ/zKT2Y8JISv8TSp8Bvky8S2xgSs+e9Xw?=
 =?us-ascii?Q?JEXqWmlyTOnuDuNFYEOXk/9dE0ILWCuzXR3eDy+IuL3arbum1eSSJNfXYiZF?=
 =?us-ascii?Q?jdGudsrs0H1uIUGolJUIbSqH4anyJuEZhxR26yz59CmXJe/n2AFCJCuIQYz1?=
 =?us-ascii?Q?9GY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CVlc9vjnT9XD7Lwrq1TUruALVcjoyy3dOpGh3ki/Soif7y5IuYvEhtck8HU2?=
 =?us-ascii?Q?Cd9TW4PKivtX89FptVgosgGmO8SpL4Txkq1MFZRXlk2LTQdqqBupEq/bFOcC?=
 =?us-ascii?Q?Du+lUrcvLAGdRia+fk6Yeqef/Rsbsn5oe5UvCZYnsD9mjZyDK33u1npnORK7?=
 =?us-ascii?Q?sTw5SWigB5wzyQzAvept4nyYCDPCZq+etOQE5xWJ8OMSHwLk4GWwrpzNNMgk?=
 =?us-ascii?Q?Jvi+p1GnnzE3j8AmH5I+5etvNiAOSQQf4xI2VlWRHpJ/4FLS9zTOljoDRyr4?=
 =?us-ascii?Q?U2LqXFBu40ygoV/6PLVM66YRSeKPlu51SDkFd67XqUuqqgjbf+C/WPJiMosG?=
 =?us-ascii?Q?BG+EsuIWVYjVYBVuXE+FGp6XKZtSdFTkHFEhF4h2ZUjMu+7dFMIt078BQnCu?=
 =?us-ascii?Q?dSpH67CYF4GCEH80BejpCxMhjEv2FoICajcb/xo8cR+OUpGLPda4/i7/HGIc?=
 =?us-ascii?Q?DsaJlNM/26UTnzmgze5zoZpln6kWLoqw2LacuVjcj0Rj+35fBHQTQXxZP4aL?=
 =?us-ascii?Q?5Jhfq2AXIkDJDKQdpEoyrjQy9DM9wLHPYhkpeIuaEZ1WolwRAAVooCQl7V23?=
 =?us-ascii?Q?TVrHvvUDjMZYcx8eJSACVhXb6db39chrcUh6HqLFV8wnxg80Agvu4+2O3VSY?=
 =?us-ascii?Q?0uSk95H0DsqNePwu/5QTIoL2eImX6e087QREcNG0b/dbKMrG126XYydFWGAo?=
 =?us-ascii?Q?W8UGTMBOa7H+e9P7ErXp3z3lx93il2vz14qw0rgiihts/tbpKddLJcL/fuDj?=
 =?us-ascii?Q?VmtV+f5394W2yzOeoHgTb6LFD3Wd8uqWVC6CnKzfBVMkbCBeCbx5EW3vhWxT?=
 =?us-ascii?Q?xgoIgafNT04/rVLe9mbp1+b/oFg7VnjQ2fzX3vYq6W5HcZaNGD0GCOmPBzBJ?=
 =?us-ascii?Q?9szUMONFOOh9ATYLLaYCPA4sXrfKlsuPyBi4hM15q1Yvq3dNTdswAMpSDDbq?=
 =?us-ascii?Q?jney5dFQXoAdCxoJ7qQ9gBp0uTrIS+NmPhYHzsZCnW2s46XibuQ/pzEoFKIy?=
 =?us-ascii?Q?bJ5A2EZFP/OItbbMAnbpnGzOnqBGbJM8AjrheH5tzkRhfybA8M1ZMD9vysYh?=
 =?us-ascii?Q?VUE0FR8NMRh0MM0L0iTuzjC74bSu8GrqJbpM701LgyGguBhLtUzU8fRHqCMM?=
 =?us-ascii?Q?heyltrp1N/MwgV/aYLmfzIg6aMvvB+Sd0K4ObBUvAm0+Y0bMLlb6RN0X4vbb?=
 =?us-ascii?Q?Z06VFPJZ+cbmLhK+UsNtAgEeK3rZwaFqMLUQN0y0vJer5X5P744tpxj7ZSV4?=
 =?us-ascii?Q?OLoldY/Ejl3+hY6+5cZUnQe/ubWUq3ptAbxessnHK4cRe9hw8GylrBBXMnZu?=
 =?us-ascii?Q?VSBoXMbeZjEyAKTQl/NXy+PyeDVeH6cL/RFRhyZ2QVBY+TqNlzfrbPPpWV3B?=
 =?us-ascii?Q?dXiacywXxEUUhghy6on/EwMOVNo/moSyvi0ilkU00Z8KVN7qjQ1vSnfL3qQ7?=
 =?us-ascii?Q?KpezR37dGYEA1n0CakSgN3b8GM3ljFmq83chg2OGt2OqidhYRbtRr5HVohfV?=
 =?us-ascii?Q?4oDko5Vah5JfATWHRd+WADSKisZkM6nRFeEU/iQBUJec/xYLzuc1kYJkM8P/?=
 =?us-ascii?Q?h9FLeKLBpJ3htQ01PWSGYMXecMUkEcYjA+EVoZOY/psg3D3CAf2co1IGCYY2?=
 =?us-ascii?Q?ihS0IR6mlhPii1ixD1PYhxA4Rc418v1nK7BpSOp6NwEgsKXminQY2I5+yWVc?=
 =?us-ascii?Q?MyOsQQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K3BOIAR1NcSOR5X+cen8UbwquoA2yVPrRGl91OO/BYtgHHQYwzIUJevFcEdmDi6+J6zjLzdda/o5MuNmTvwjc78AZ0X2tWVoKrgXbG+rlalzMowqL9NxpB0byJHUEpXGL0l14Tq94z05sp0m7KXDpYweqYM2ptCDBDIvCcWRwFrD2Hh24SjoMFEuic2v56DGedDWsNoareNQxwnVHx6NSvaHSN+QEt2DWF032zCOlzLD8tY24pcJ7wp353R6kKTTtxSNanRgOWUgDZpft1iE4k8nJzQObbh8or/fswbj0W360f3ir29AWhXpvcym5fpilLqPfqb1r2Rw3uQkV76AVj0DHIL6BanaZNpzXeWFVcK+6mrOG7qZJ5+3EjXo1nfLUlLn9sF8AoVBUareRmMF+wQijghH7+QbLEvGKOVHzhP7r3VQFpkVWUrCCvwoVZlpL/Qf4cVbUR7Z7WxYCPLxW+ihfhiz0L7DG8Fk4E/1iAuTnWcIhMyfMOXcENlmQpT5jiC0bVuMtBkkZeVh2A8DljeMUznbyERVYI+gr1hIJbOm+G46CkhmMcSlX9QRrr1dga6frP1JMjuJPeZ5z8McVVLtk3qxLKRb0+tCXhES3XE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6e9103-3b89-4e97-b975-08dcaba34f00
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 05:41:47.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6R3izQQ6oGYZGS/BJk3bLf12nGcygtX2ncXDHL53Nx0MOr7+69dfdZSPR66VIS/Dbs2SnjwYT0nhC5IKL9WCuPTQL72Welnz5q7VuNj92A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6607
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_03,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240040
X-Proofpoint-GUID: j74PwGN_XWch3o7wZ0_1kkE84NwDhHzC
X-Proofpoint-ORIG-GUID: j74PwGN_XWch3o7wZ0_1kkE84NwDhHzC

On Wed, Jul 24, 2024 at 09:41:14AM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   cecb3db438d76f7c1005fd52689809696a330474
> commit: b102945dd5b200efff9e8458946006770a513710 [17/30] mm: move internal core VMA manipulation functions to own file
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407240947.x904ix8E-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240947.x904ix8E-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240947.x904ix8E-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/vma.c:7:
>    In file included from mm/vma_internal.h:12:
>    In file included from include/linux/backing-dev.h:15:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2206:
>    include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      501 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      508 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      520 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      529 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    In file included from mm/vma.c:7:
>    In file included from mm/vma_internal.h:28:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>    In file included from mm/vma.c:7:
> >> mm/vma_internal.h:46:10: fatal error: 'asm/page_types.h' file not found
>       46 | #include <asm/page_types.h>
>          |          ^~~~~~~~~~~~~~~~~~
>    7 warnings and 1 error generated.
>
>
> vim +46 mm/vma_internal.h
>
>     44
>     45	#include <asm/current.h>
>   > 46	#include <asm/page_types.h>
>     47	#include <asm/pgtable_types.h>

Already fixed with a fix-patch (removes these includes). I expect the build bots
to produce a few more of these.

>     48	#include <asm/tlb.h>
>     49
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
