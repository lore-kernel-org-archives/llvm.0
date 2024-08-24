Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04911AD2F;
	Sat, 24 Aug 2024 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724528625; cv=fail; b=KAjbL7Upo/MMNAqOBRRtwYH6YHrDj9Q8B5XiBaOpbTFd8Uh2eMn5fS4AD4RaoCil1VRMVSL8cDK3XEHQbCk2rb8VUQK/oOgB1U07EIry4oEaMxUtM+TgshEpTxtiP1U/RMyMHKFjU6WP8/vM4GPOOy7Gq3ip/B4osqqr9RNOmU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724528625; c=relaxed/simple;
	bh=wE+sc4tHt/cxybhQkUitz3d9Vymjj/BEpgnS8bPMxI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E5qA4YswksHTyRUGZ/rsz1rRWK3x07uOoTplLmXgDIPImZ32b5fzDJiNo16j8bQbxSSHLm7LjbA7S5QsH6/afkQYfjT9hyqHr2PGEM6KfO3pxeQuw84w7oFQHV1dloktLENsNTC+aw2k1z7YBMTyD0URWG8WXsr2Mq4bPY8RNYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jxtqvjF1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=odKIm/k1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jxtqvjF1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="odKIm/k1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47OFhKQ2003157;
	Sat, 24 Aug 2024 19:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Haz1vvLScpUU3z/
	S2FcQY/K/LhnBJydozxnXU/5kEY4=; b=jxtqvjF1wchm1LdVd8+7pGmcRO+5XFF
	arUV483eeRnzKNcN6LfZE2UjSTkHIbAgbUDDC1vtGZcaeSVXsFmX9Yd61v0L1J+o
	nx3NVQs2Q6wKEcWMXPmhRz0SXPzR4TnYg5mn+CEaQFxkRVyhVPVIHb8aYBMT2Rpy
	g9dcFrY67MQ2XfnaDE42yAxEZHQm+hgXQbmAKoyqsjRBvBlJC14h6czlXBIsAgx5
	9LqjkfPASWIbudVUKfDud/3vDsLEHpwzpg1g0qwF9eimngQrukHUqBdKnsz9GKx2
	JPmhI9vhxd4aRrbK6BVl2tb44PjMSSV8BRaRyLtm4IWaLgCcooQUdgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177hwgkek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 19:43:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47OJa95N024427;
	Sat, 24 Aug 2024 19:43:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 417ntdr210-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 19:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGsNnQuvBPB1o5pVzfBJzwz0fnNM5xXDUPnINetTVyGnxmhvGYbdUwrEGWiksa70zjRLDgNsOIRjcmsuGDhNJ+pcRP97sWbsGukqO1Pe2pJ8cxnfG+Oo48/KynapQpt8/aJOsGoRMwAYkuTkm+cvXdGgkEEzdAdaqIN5vmMyxj3c65ANJc1+YbT56laK9p6PzRZAc9yUFS1xATQYbV8Uk77bL0iFz1h2HyMVbEedjZiw8Q2mz4Q/AZzP04wsyuCAnhUk2jzbaZSrRenpH8zb/fisgOWg8HU32zMqV0qyTrZIPGtbaBPMcq2qw1Dk7DaQDKpNlS+8I9uPIoZpAJXxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Haz1vvLScpUU3z/S2FcQY/K/LhnBJydozxnXU/5kEY4=;
 b=sBGqE5fUoOxrGzshMhjy9uoNrpIlOL6g+eD5LBPSxzYdPOAP4GOrDH8lknKwOn4fwECsh/p9WjEH+JdCtX12+XNI2Z9mY3wg9NcTk4gaUWV6UFwQ8PrsEqcifON0aCV67FEGWjYKT6SeDhLf1tx/eIwgy6usmA8qsrH+lkm+K7RiFdrXlbugcdm3Yo3a8oPfIlKSlFrdlXWmSGDh+nAaX2/cCYbwWzLxRV/n//b2BXH00t4ygHUBgbHxLHSiEtkPfDR0uHfgmG8hnKi0sXi7F5P8rPNYR3d7b5JyPht+7B9YDU3NLt+69SCHcHhm4msvOZUniqz1CMDW93adZqojzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Haz1vvLScpUU3z/S2FcQY/K/LhnBJydozxnXU/5kEY4=;
 b=odKIm/k1e8S6DRDeoQsm6gyXqbbioHC8WHS9NeMwcaW9gMTCYAWK2Mmu83qQUFq9eT+2DvG/zVbm4H6Ls/Cwf/Hb/3ShX19KrnXJd6QoL0/tdHcRTFisEJ4/QJpR2g/QmcP0KUReemXpuPV9UQnzXQeLDfB87ZDl2oASGclwA4c=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS7PR10MB5038.namprd10.prod.outlook.com (2603:10b6:5:38c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.9; Sat, 24 Aug
 2024 19:43:29 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 19:43:29 +0000
Date: Sat, 24 Aug 2024 20:43:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 357/379] mm/vma.h:114:19: error: use of
 undeclared identifier 'USER_PGTABLES_CEILING'
Message-ID: <da1a6b2c-f792-432f-b99f-51717dcc8d83@lucifer.local>
References: <202408242348.uGvgH9tt-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408242348.uGvgH9tt-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::20) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS7PR10MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c93815b-0da8-46c8-3bbb-08dcc4750739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NuwvhV8jSIJnK5rmJwfACg95mg3g4FT8ukgb/ixn7c+cnjoIQfkYj+YMRZqR?=
 =?us-ascii?Q?BUK+tJ8XZ0DZB2VJgepS5TRD1OwMztIoghclGHrE02y+aeBkKCBC9gT7pE+5?=
 =?us-ascii?Q?y/b+mU+4r4VJRXFC5NAzK98vIVou1Mgi0adZudwKB+M5lYk2quO05xCd3cM5?=
 =?us-ascii?Q?sSdmECSuVrOeKtN0XLiAi+lcApzBMSSpJTXYqDoIKcXAPeDxnVWprs720pmi?=
 =?us-ascii?Q?mp2xRFvw3VUAYdyS2nbmqTvnTM8RJ0ENeLFPyCnOI87LQVpBNzlGz3+U9NJ6?=
 =?us-ascii?Q?tngooq4AfPrW6Rcywm8lMhYMkWsbAMT9PMEvXwraVF4CShUCdzInHtIXlDeJ?=
 =?us-ascii?Q?tAeed7e8hC64Sbatbw1EHE+a8yLa/msBHAiCeVV0i3Jao9yfI1Pi8gd54mgC?=
 =?us-ascii?Q?TXl28fxcbNOU5IVRIrdjbxR9CgzTj0BTYqEidspq2vxzFpbRkWOg9cqSGq7y?=
 =?us-ascii?Q?9Gxo8kARdBjvdr4OYIsNXkhjDLVp8xxX5erKa8TH73ayVD6xvIPjUQvfqfkj?=
 =?us-ascii?Q?faaWhrGsDlXkDvwjHwxnmyW2zcB/F9cPmq7jwEuiWGGMmHwP20u/vPGrfXSX?=
 =?us-ascii?Q?zozUYAdCU+AW52/Nvlms7L8W1Jkq8yyhpGQ58OGA8vgCAoVyMvzPZAaqsQ+p?=
 =?us-ascii?Q?60Dlkp0CdI8rleNgjYUH+Pgt5vUVz7m35fycf6JzWKgGyNL3y2sv4ekPbVym?=
 =?us-ascii?Q?bzjKBe7pg/MQpBMMfqy2D11IyHxpx8AotB1P12L6pMpcOPETia2dKGwx7LpM?=
 =?us-ascii?Q?pXeXjKPuW1VFo0JHhj/wcOH+/nJy6ZtewcP5mFrNrQ4YKinTLr/ivQuNigu/?=
 =?us-ascii?Q?pSfAR19aP0z6XTCDFGbRN++aHEw5XTVVmoftFaXWenuFcUAbaMWlmXM5Nc0F?=
 =?us-ascii?Q?8PpviCBtTLQXlZTLMTFGb7qByx0JYUaDXD19NIq0QFZYUkvKXGHWV3naJPL6?=
 =?us-ascii?Q?Y/kbbktANtG0BEeB0Xee8AOkdxmm62HmD+U5rmQiIu4yI0v3iej0G8J9DqZU?=
 =?us-ascii?Q?EXbGrDYPmrX/WIm+XcviU0MR6Els376V1gHZs2SH84u7u/fbNHwikJRDKBq7?=
 =?us-ascii?Q?ldbudFwQQJq5nsGiexmLfjs87d4p4fk6BMeQ4uqpNFysqI1B7RudTPl89INW?=
 =?us-ascii?Q?p9L4TUK9GI0tK2nmLXqpNZC07V+ujniAGQ9JsOYPyv/3T+U9PnIXKLsUIH20?=
 =?us-ascii?Q?qk2o/GWoEWRs2tq2XjWH7iaL4oJ3EAO4Wnk3LeeFpEvL8GTJeVw+MQP2Hp01?=
 =?us-ascii?Q?yEBNVXTJLgcPvh9I+udpzecPO8Gb+CbpcileixA21MC8WJ+DIkFqD0mj74c5?=
 =?us-ascii?Q?d94=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BcWYLICniiRk2cd5wv5sM+7/1utODj7EuZh4UZKK3Pu+d+mE9z2wxupB+nCy?=
 =?us-ascii?Q?7xP9KO3Cs8NLdSOWZJjp6HidfQD8HPDvi2YKPeHLuJX2RovBGZxj2NM/NggI?=
 =?us-ascii?Q?BoGoYHKA/L3G0Xmag2ARtaxxcS3Ct4AnFBNlG7KfgJcLvFcEYEEPAFpFSRcd?=
 =?us-ascii?Q?wiO6c64Z0FkQlNm9gBVB70dF71GB1we4pwMHMWSwYX2CwlfLsR3DQE2mZxvk?=
 =?us-ascii?Q?8T48KOn3rYT/A4EW+PuFwMxKoX7N+dlsHrVC9/1Pou7h9fj7xO+HBRnV49WP?=
 =?us-ascii?Q?JyrPmRdSehamcsRWKul5A6yBFRyCGOofeNs4M2UQRXC1ywA4jEe15My6rNDg?=
 =?us-ascii?Q?loRAZZkIZ206/ICOsJ7Pv32yw8bkGRwjkQt3O0ZGNJA8ZUuVuwx1F87wmHr8?=
 =?us-ascii?Q?sj/pQObmRKCgjxLmVVU+NOU5bGBQ49D9v4wrRMDNcM31RL3Rs7sALApoo9Vp?=
 =?us-ascii?Q?ZDUKXLhait/rbrpa8Q4f7OQ1cASR9i5iSQw9Y9YYPd8XrxUbGkfZsTOdAu/C?=
 =?us-ascii?Q?WaYTJa1tJWzICZA4VoK3HXBz2M5IwiTTGP1z1MkpNMKmMI9+g3krrzpoS+F6?=
 =?us-ascii?Q?irvXxTpez3SmxLm/Z6pRoe1A4lfprYngeqcAJDvQT8HXfQyeodjyeT0eXV/L?=
 =?us-ascii?Q?N286q5fANQK7ps2Zn4g0jwz2ctGjbIozL4VDKPmfGmE5lDbKAMSBox3monuh?=
 =?us-ascii?Q?XN+7+S0zNGEhaiCVDOepCVRWy7Rfplliws/IQVLcafoOfSO6fIVOnhVJzf63?=
 =?us-ascii?Q?sD5s/4NExZ2ZSB2kET+l5nsEH509NJ7yrXucfKuN9WFeH1hhwQtgpl8M9MJS?=
 =?us-ascii?Q?liVgnVZFnWi7YMB+3gmlCKKfifTVTri3EtR4XsiWwBDw5lFqjPYD0YJKl8j7?=
 =?us-ascii?Q?5h7HE47H3l92HuQ3D2XIYR9XcfP3fT9NlLS4GS9gBwkGI6YonEMjo/wZS+nn?=
 =?us-ascii?Q?4nt0BuDIbkNbD+Y+RYAu6bb8YYXa3fAwIa1ghTZCQBq2P95XK9SuxDdvFbWj?=
 =?us-ascii?Q?XBL8CdpSsAnmQZRM7f+0DPPWdWmUmJrgEm55N98hgS09aV9v6ex8JIJiVGno?=
 =?us-ascii?Q?n4iJHmN4cM6SJqK3CNrH34KlIPvQ5MUYP/NcAGG7Did8l1Y8rTJTVxb0Eq8/?=
 =?us-ascii?Q?g3t3t9e4csve9yBCJ0fYgJcnKIqfTMBow7gTnFkIRBBBV8KF4KaDDSFACdNV?=
 =?us-ascii?Q?gqa9eV14l2uXyK6vKpTcrvgoIva9R9OM/s5sbq/R2cGgNNvW7r9Mgwj2hIOJ?=
 =?us-ascii?Q?s+6aCaXqFrZFLiwbLSN3BHtw8HPxfI/DMQ4RTUJPTqNBOq6FC3c+boyvsFIf?=
 =?us-ascii?Q?cgHoaUfMF0nmcHP5Ff7xHby3mJqny47jLBJocGYNibET48NQOje7OvBgvqNi?=
 =?us-ascii?Q?b341Wwt2biWqbavKKv9Hg9RkROFPFEgrs/apdWn2qx3Lh6Y6f7MHUjw6rANf?=
 =?us-ascii?Q?PWNzSXf3C13gJVE9yCzCpSu7xlqWcSnTPjbrrGLldRP2XPz4lXJyvnjXVI6G?=
 =?us-ascii?Q?CHb6Wq3lBUJbLhPGp8mfpXsd3GaLlforY57RYduiy/oqfobX7SSBKWd09yUN?=
 =?us-ascii?Q?q5SuWejNzMVGggPkItKdjcaU2NOiU348T5Cmsk9bnLOw9DlIQuEbYSrtlcF3?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SCVoc5iHL80iKIFuRDotjKTXza5sklbXCwC+hQKGepff8B6YTL4vYf5abLzsguFGHNvBBnCX6sAXm3ApH8aF4M4HhiMaDgusiTB99ojEPxYM/m9/Wgsd+szyNa3XXPibN0qalk/u04YhluBiGR8AiU7SS2ocyOpQrT7qta1oVh26XPAswlCzrtNTO3tWpwtbWQA87vb7BzwQeN1ncqjaFB3ivb2RAIdZiNKyGpdm/ZWIvbYUkbgyzd3Dv6Wyt+OZ2XR5WPuq3WBNctpvCNDwTXaRJWna/zQmO6IedADuCnJ6GDgTz7O3CCwGHzwpb9seOBWXWq36ZHkRc0O4ka4JWQ/lrE8o3zrF/Ach0Q2/YEt+6hdl7QA5TkqhWoggmetdS0oB1E0lLnCuozIzY9j+UAkLzIVqyzxIJWQqLOyni54agVgwchXfoN3WWXMBwagaul6BU2lcMvNPgt3m86GRq9AKZgsbHDUIBnA7ie9Ia4kSKVY37GNthsb6wTC5gclyvw4qFldrysyi+pTwwjG2Aew+dP2bWTNYAOv3ZzsTtYWSyNFpfRHMqaMTTnQWvqWY4KGf8i6619x2jgTS/wMiAMWWV6ddKnBF+pnHBkWxzb0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c93815b-0da8-46c8-3bbb-08dcc4750739
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 19:43:29.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+0Txz8n8kYzebzx+1oDWnRiq7d8H1Dx26VdHdpOWtJ9Mjkcxi02TJ+vCZIHapkt+b9Kk3qgEPFlylEe+aVMZyrKvMgOCTH6TNGDcXdU7Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_13,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408240131
X-Proofpoint-GUID: LCE2ANjm0IVyNdmJcrgyVXyKblTakH7X
X-Proofpoint-ORIG-GUID: LCE2ANjm0IVyNdmJcrgyVXyKblTakH7X

On Sat, Aug 24, 2024 at 11:14:17PM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   b659edec079c90012cf8d05624e312d1062b8b87
> commit: ca39aca8db2d78ff82356defba75d14ce78a67b9 [357/379] mm/vma: track start and end for munmap in vma_munmap_struct
> config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/filemap.c:15:
>    In file included from include/linux/dax.h:6:
>    In file included from include/linux/mm.h:2198:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/filemap.c:52:
>    In file included from mm/internal.h:13:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>    In file included from mm/filemap.c:52:
>    In file included from mm/internal.h:22:
> >> mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
>      114 |         vms->unmap_end = USER_PGTABLES_CEILING;
>          |                          ^
>    3 warnings and 1 error generated.

[snip]

Thanks for the report!

This is a trivial issue, and can be fixed with the attached fix-patch. This also
resolves the issue reported in
https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/

----8<----
From 565ad376b0a3aa5822ef479faadff271e90ba51c Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sat, 24 Aug 2024 20:20:17 +0100
Subject: [PATCH] mm: include linux/pgtable.h in vma_internal.h

For some arches this is required in order to have access to
USER_PGTABLES_CEILING and FIRST_USER_ADDRESS.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma_internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vma_internal.h b/mm/vma_internal.h
index b930ab12a587..971b13e880c9 100644
--- a/mm/vma_internal.h
+++ b/mm/vma_internal.h
@@ -33,6 +33,7 @@
 #include <linux/mutex.h>
 #include <linux/pagemap.h>
 #include <linux/pfn.h>
+#include <linux/pgtable.h>
 #include <linux/rcupdate.h>
 #include <linux/rmap.h>
 #include <linux/rwsem.h>
--
2.46.0
