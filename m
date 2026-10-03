Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1B367B65;
	Sat,  3 Oct 2026 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038349; cv=fail; b=BB+pLpvBcJW16Jq0jAIQMYXDaLwB1KIh6Y+9Xw5uHCrTubl/fs85KslrXifEJUXUuRrBHfEQ74PN0L7Eh5KUL56Ru8+dAMsQaHG4Wh8Itq3SN2yH8THNKbmHG0VOmSoStZqjy5N91aR9ndcvo/FyRqsj/6XHGFcvWO3JUPNavhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038349; c=relaxed/simple;
	bh=cIaXJdz45sLkGS8bv4pEz00qzISfbkbxlOGB9Xue2yY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n0yAZwsBhr3WVGjr5kptk4ERwSL71NDL7AMTR9Dpf9du/BcHOlyP4PFBWDfPfjccAyxnbXbh5XuzTH4eKgKJqJQgN2D3uEPP7K2tkVa4031tIuWCfkmbELugNt7JRxCHPFbyTmzgWnbGMwckeYPqrzUpPU5zZ2A3QP85XOnrbeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEoc8tAj; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEoc8tAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038347; x=1822574347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIaXJdz45sLkGS8bv4pEz00qzISfbkbxlOGB9Xue2yY=;
  b=lEoc8tAjmb51hveqn5vFOqR5typpUYInnvW7oDtTS/tONtblNMzv7R6J
   SUpwxMNhg8oZsvlKCqgRprxzRKtjlpIc8Nda+pfHTRaT9DyXaXGBhxL5r
   5ToeDopohI5t1B7nB6ndhpVyk6DQVQAclKoO7xBkf9Av6a4SI2FAVkdNj
   jVc04PV8p91s7HJrSmHcYqEipV98zO41jBfcFGRc5rszUQR/x/xOzJwjl
   gA7iRU9652uYwc+i4IO3PbOrQh6MnvIetcF5ADvND6EtVPwGcr79caWr4
   xkJbHbKeB14zSNmSvamK9S+kuYGvfOHp/beZazVf4fBi7if1LD9vqpUXk
   A==;
X-CSE-ConnectionGUID: P4iObGnYSHqO1aTvdJboLQ==
X-CSE-MsgGUID: PN5Vi+ziQZmc3lkPSzzfGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90675384"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90675384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:39:05 -0700
X-CSE-ConnectionGUID: 5jkArJBeQSKiLgkAkz6nlA==
X-CSE-MsgGUID: 7IzyWQo1TG+JljLJVk0/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276593815"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:39:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:39:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:39:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op09rJOkeTz8QbyB9kglSvLbbya+Wtz893ZOGHk0vVDT8fnIQHdBsb6ASpnx/kyIwbDH32G0xwPGd6A1a6YSWmmaYHT1erpBUVs0XscXifK/NvKdP7eJsnpfpbm9Qqxo0GOOYv2Dt4Z9uI3ldQ6+s+8Z0i5WVFUwqCDnexDfGmCKFg1e6lvS4s4EDvWrgoUxjVWexkFcuPHjmY1n99hhp2eNh6ntPzr7tW96dSOns+5l2rUYsVuZ5a8EmjQ4GfTR7vt33nIjNKCl4VtsDNlVew5GDF0aq98HyYT6Lq+2Cn6RZ1PdwFh6AFswCTXaZMSr5NEEVR55vj4UKNnJNFNixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJCJm7WdgkTL9hR5q7w8RckR15zMyOQQnppxYv0jhP4=;
 b=jg/YsvRwAxSjZlo52Hlw2tuDn+YCnDcxbfmKvhMWAl1r1feAbHCn8KPHsZs3oRY8LPVGVqEatocFa4yKOnh/Esxw9HSGg6fRbwIH+bbjL/BTtvtS8U5FSHMub1S80eAMsdpaDrXxhQT/UYXuGE/ggGa1RSYH/QvJlj7Teoty4hogfwUZP2e2HBjxPkH8BUH/J+edrOe2koGTmqGiJofLwxcjGBEWPncugRpabP5Fo6lIr6473lFYEMi6VwQTYlYZAADxg21QVLw68FN7bUcR5BGdkGadjjatYZTEIUo7ijO92/abSDdUTidvfCgI30doEV0JpEEIcCbIr8cc0r92yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:39:02 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:39:01 +0000
Date: Sat, 3 Oct 2026 22:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>
Subject: ld.lld: error: undefined symbol: iommu_put_pages_list
Message-ID: <asETfkNkskaJdgqI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::8) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf5ad3d-6eac-49be-af6a-08df215c110f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|260925021311599003|10067099003|260925022911599003|260925021911599003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: PcrdSFoAzeA2kzZ8vzBYS6Z3BIZIfj2B8P2yZ5CyMc/x2nKXgsMVrJjEF0OWZZAC2w+QHDfsIRDzMIWzrJ9AB5ieKAsrTGwEXXdBSMh3HCwhPNyMNe/jBqCo0y82Gf2Tz1+LRh5eOfW6dZNc2I21vM4U/w9xnoX3eAD8IJxQqt+Bx5eiDP+e2zmjmo4ANQDjOWNd5eByEpvsguNUa0y3tco7nTe737LfYY95oyyt5ik/1LN50XVhY51zMVM4GI7hNnHdEZYNei9m332KwdQ3omhqZM0ZHmoYpW/CkLm7x9a6AWaggprM9E0bvYf5ymvAUOZtrUxxEvVn4m4fmv348QLxVetpr69fhNbVZkgaQYCjxW61ttwJmDQe3Xle8PpdnnbflVdDm5G0F/f/v7IQF7gPlE9Tg9qb90w26jWh9nw/PU5MzE3NRX543ILYUtp/qx0a0iFPq/KZKJcYTnX06cmFfOiZDub4ExxWMcXurrzAmwVKYhjmBpejoX0k5IIp/FnyQs4a1hFVXcGXu4IOfXgoKKcvrLed43OCHYCw4Y27vn2k2rCf0oCwFpAlMYqCYrSGe0u79XJ6ZgLYKEyBYI00PZPGPvbeWR+JCUgi45s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTrU1E94x4EZ+LenEIKbOf+LT5PUzBpze0M8JBNac/w3rokbIyTM754We561?=
 =?us-ascii?Q?cXoSQY03woFp+kyC5wlkSAzvqTeeDwKisKbdsVXYNiwieQI//ywSFkqF5drd?=
 =?us-ascii?Q?vaBBSRYj6vm0YuhrRLj9hMwdVbt5IqWcilf2LUMgsSLxxR9DGX+PoBrMX1Ks?=
 =?us-ascii?Q?3rbCmqHoeYSmSdlc4XD6CRUKrQZc+skbQVsLIDZQXv6pzCfnjmcOe0X7qcJT?=
 =?us-ascii?Q?e3ijN/SgSzLiQN1fQFa4E4y6tLGElJQiuI2UgwW0pIpp9LJykUe44bUCfCTO?=
 =?us-ascii?Q?KYP7ryaGgsdymd9cWE+SRFA+2IrGhbGpTNsI2HkBLa0Q4YHdh7EvJ6iDo4HA?=
 =?us-ascii?Q?irjhAdwymHR9FtNdSFDcUolrhTpDGcLlUEK66+uLLS/mxhIxOeTbyNFHCGVl?=
 =?us-ascii?Q?U+e/2cUfuEgUo6tCWrWTwExh21Zp7N2HmpaO90LM4SVpgwJAvWHBNk5oSDUM?=
 =?us-ascii?Q?jI+cpw6o6+2UbRR8jSUojYA7J8b97gvb3EAYviB9ewrke2J92VEjbMlCFp2w?=
 =?us-ascii?Q?ktvNj1E36jyQQNl8yKLpaGem8BuzyHKuRcOaZZLteRGQUPpZvBPvDiRM5QLO?=
 =?us-ascii?Q?G3GOzCGRM9CzFW2p7CSisfH4q1io8pB4yG8LHoe+nm4nKZVpDb+EiSDPz/ll?=
 =?us-ascii?Q?LKEuQkpTIvf7q1ekktsE15cXQUTm5TC4rNO2F8CcjeASrPyi14AQPlQKNXwI?=
 =?us-ascii?Q?YuRVxHDc3WIdp2jK3XVGKtjHua8zwIDdtqUPL8Qvk+2HNLYJG5dy1zisKYlQ?=
 =?us-ascii?Q?GEqJPuXqBMXfzgg4JIstHgk6Sv43vnmRzloCL82FJX4bURgw2rTnc8whE45X?=
 =?us-ascii?Q?BO03zkRUiFRZE8+ukBtX1FYgxoHdU4HgqdGpQvklssFaluOnEWPGyLEKya7E?=
 =?us-ascii?Q?9VZoSaofAM0Aj3Tguv92gpL2YTh+Q03MZQjSxcmkHo2zSKa67aVvNN8udnob?=
 =?us-ascii?Q?GpVqBLBpv+l3cMrncsz5b13HxiNPy0QEaun/+24Kjtt5HEwU+NCDayp16kxj?=
 =?us-ascii?Q?o7BDBNTQspWx8Vcg67dER0FOLep70IfCvGVB8E5WYdfDRPbnwzWYJjJKFWk3?=
 =?us-ascii?Q?sOmN4kd8M4oUyzwrl/TBRzvY08xh3tnv0YJ9dmWUCn/s8Gy67EayDHUGZBxO?=
 =?us-ascii?Q?93BWi/oEq+wYgG7j5h+CZTHr0xobHIRhojd1ECTlfgghm4ClvUDUpjARr8KF?=
 =?us-ascii?Q?2mX7KdFLSLmVVmM28qvKIGFeIgYHM2t0975XzHQNBSKpNMBv+vMDU4uQWizc?=
 =?us-ascii?Q?qhLgGqQi+AxzMoy/jGE+cgM/xavTHGV1w/j0b7iazwrjBOfWDAX0udlrXLuR?=
 =?us-ascii?Q?PS1Utp5q2hfcJScaxJi7NwTy5vUYlbl2FQTNF/ceHFcQhWWLYm2+8syEW5ln?=
 =?us-ascii?Q?A8YHRb4jJa4JY5X8bs0Xvkuq0FXrPrNUtvnWYjvLwcd/9VrYa9lA/p0o0Tpp?=
 =?us-ascii?Q?Nz3OtuDHg9XKPecEf/TJtxvWM+K/RLjxSd70I5ktFIyGN+cQIOSAc5AvvRXQ?=
 =?us-ascii?Q?EB5AlIBIe3mMuapTzvrZ/mBywnkruYhAEzMdPWGv74fjNPWvZ3aJbJC4CQFN?=
 =?us-ascii?Q?LkQ2f1XZF5nuVBUqPNLG5biyJNmGXhdWolNwTZhAYJ38SnGwJElNwGgCa9Jn?=
 =?us-ascii?Q?lAl+e+FEhXVqpditEnOJuhTcoTp8Qs9pCLHtSD1LvAs32fHFc5YXESsUMMKH?=
 =?us-ascii?Q?OgPGE6hjCXHlR/iD0NPqp3Ow6QcK3KgkEaYJwD1+cDrlBPB5KDxBxeqIIq7y?=
 =?us-ascii?Q?dmht3icsHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: h5HNICRDZQOzfRtuhEuy9n5yydFd+pj19zWD/KXuzRQVe4vNwyd9jI8eYUfDySDjydeyTSHq/++jzGcKhKpyhW5EPJaDuXCFziQeJGf8rpU2X2IaEhl0nb5Pn2hq0syiXwhb9MBpXvaanHnkV9Ra1nekVcplWctgKjRJykiSiQPx9kQGc0nca+a2cG7dzUKGd57gro8XaQcxWoJT5TT3TrxbuddV8gGkkHjtKP2EhajdTEq2vlGZsTLLG+354FnT2Qpql8VS295Vql1nyfqFlzmd5GzxLvuh552lZ3ROZ6hBB8AcrkCKQTNt5/Otbjm36T/6sRu93RPI8zoIRxVxKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf5ad3d-6eac-49be-af6a-08df215c110f
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:39:01.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXBV1G9LG0OJwqkrvAiO/DBaq8vc5apLAqvH4wnr197ini9VBVLKPjyE/NG8/wHNn3Gp9uJUXwraPeehSCRG6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215
head:   27fca47089358dfe3840aa0b0c9795b3963c21b9
commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7 iommupt: Introduce lockless page table shrinker
config: hexagon-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030304.oLF3VaZd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030304.oLF3VaZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030304.oLF3VaZd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iommu_put_pages_list
   >>> referenced by shrinker.c:117 (drivers/iommu/generic_pt/shrinker.c:117)
   >>>               drivers/iommu/generic_pt/shrinker.o:(generic_pt_shrinker_scan) in archive vmlinux.a
   >>> referenced by shrinker.c:117 (drivers/iommu/generic_pt/shrinker.c:117)
   >>>               drivers/iommu/generic_pt/shrinker.o:(generic_pt_shrinker_scan) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

