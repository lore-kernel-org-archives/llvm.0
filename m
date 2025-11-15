Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8BD2B9BA;
	Sat, 15 Nov 2025 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763170466; cv=fail; b=CmjYDtWGDR3REAJrK+4U8s8CQAkT93wT+r3+K9igH4rt4iO/2DrYJOiIpD0YfcgwUQssu77XHO0+QP++wMcWvP73Ew0Q7csWIGHx/NldlwFrz8BYpx4OLpcNwEz+7/09mS7hiBcSiNap7/g0MLeZGCRw0r730jBQmO+N+CDVyEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763170466; c=relaxed/simple;
	bh=YO9ZCgjsrypdahDuwGuLXVcKcMiAPsg1vk2tvhvy+OM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n9boAFpoanT2MDq0oUweSdiKmphnEUfXalIMIbz2o04pTBkds0/WycW8MZxPC2APgXkISejmZh3rwo/0GC31pxck5CJFBsPfd214iP5Z9Q99pW5siofXiRxdMVfnnyfrmPK96GyYXmW7lrr0q/5q9t8Ok1ObQZ7oOKGlgLtSK/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4EYuRqK; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4EYuRqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763170464; x=1794706464;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=YO9ZCgjsrypdahDuwGuLXVcKcMiAPsg1vk2tvhvy+OM=;
  b=O4EYuRqKoXn4gIeVPWxRqduZLYXwAZMpADwfrO+M/FEG5/itqMR3qmSr
   5P0Q97DuMdueTWpDFAoAVYRdOaMNL0Xiv3ocqNeNkOgeJbY/SbGbIL7A3
   /GuOhu+mFG1lN/+u3a7X7Hlo2h6Yh2aZbXVHt0Grl4ja5KY/EBlidg6L/
   E1QSNX5vpaiFx8TITK6do4YzR31UBxuWVb8dz3t3GYOZbpSMA7DNEJEBr
   LTe10JZbcZUASl+pvJqPGAexhACCZBKJ5MjW9eFA9h1cUyuoC+ZwI0p5I
   gH+bhEciPNn9erdOEqvJjyaLrDer5nGNLGHyHfxq4+QdUrSHIflfLvIZJ
   w==;
X-CSE-ConnectionGUID: zI35+qYyRHKZvuiHb2MoKw==
X-CSE-MsgGUID: xeKFt1CzRY6HN3Ww+vNqEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75587745"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="75587745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:34:24 -0800
X-CSE-ConnectionGUID: Ok6YqD++Sfy7UJWzssUpsA==
X-CSE-MsgGUID: gp9dRT9CQQiihvbpWe0+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="194018297"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:34:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:34:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 17:34:23 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:34:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvRa0K1j4YHa7NapIMND3rs44Ia/hpkJMQ+kH4xOweXXC5GF2jyQNqGZn+e3ToDe8DEWezTWiUw9bqb9uPpzQGL0Uid3nSnrvc+HYOSJ+D+er1OgmaTuI1IvFXt+pXjplEbgKuVxTCXQDK5vroT1yCByr0sMJ7COmSVjcYeEwspk39p3YFwYxdFiB28+5bXh33lvFxoswKYs7jvUBICv0yGjiVTVIZj3BocZ6BxyZ7+QpIrBqQU5TdUmq0OZ91QCco4S3oECJD1XwaY9/5YSs+pZlHE3widUoOFG2safx7FHYqiIH7ZrgAuoCHZUPXNzHjAioJ3i+ys/zABRgyS3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1LKGK07nxSONYx52Iloyn7XHS4B71FzsTWfCXbqQz4=;
 b=BeLllbnmbYskHkWXxZft4ZwRrQux5X0iAkX5OHLoa8N0LgrbiP5IvF+ZIfnccE3PjIruNkhfjONAobGwQB02RPodfoL2/w+Io6S72Rn9p4vtoKHOtDyLl70vFAA5HbhU/9qQzqp+CCFL7wiV8BRFvSfjpFdNh6cnyfxFVL9AF8bqLsS3dCFh/f2H7+qm2SYL90lrNcivoqem4XaDHOxSx1CS4W6mUVZSrxi+8/8DslCA5jjlx4YGhRaKeMSY12BplYk2bK7bBz5I8b7bdFks0Cjk00zwbr5hV3L1DxPbNvTRqcFaYqoWyamc/PkA/CmI6lCYhylmLN823zRmETuKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 01:34:19 +0000
Received: from DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd]) by DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd%3]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:34:19 +0000
Date: Sat, 15 Nov 2025 09:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Chartre <alexandre.chartre@oracle.com>,
	<linux-kernel@vger.kernel.org>, <mingo@kernel.org>, <jpoimboe@kernel.org>,
	<peterz@infradead.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<alexandre.chartre@oracle.com>
Subject: Re: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops
 call
Message-ID: <aRfYicXA4R3Gb04i@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251113164917.2563486-28-alexandre.chartre@oracle.com>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4172:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 0856f23e-c526-4de9-f54e-08de23e717d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zT3GMGpSHiCQu2/wbhJ5HD1RYlLxUcriBbv45nTfdQjbgUp2CKZcwZWCKxS/?=
 =?us-ascii?Q?rEs4YWzjHh13/OanrEhcX/TLFvGzth6T1gwJREtWZ74OLzVG5uK7JdJtDeUW?=
 =?us-ascii?Q?D9BkyEX7AQFkWxztitHxFXvARAOd6HNfnjCJijQrCCGcX99lBR0UMTewQc7M?=
 =?us-ascii?Q?dwD0rItv/DiIhEV7Ec5Ol0LTZBXgeJLfZiRxYII5jK4U2hAofa7j1j6JKiSK?=
 =?us-ascii?Q?SHbaQwcn6f4kZalIdQ90eOF/NG7TXb8+K+YF113PylQJ4JJkHRcommSTpU0Z?=
 =?us-ascii?Q?Td2AUy9IXX4d1+Qp8HP/TdLvPtQq4HPNBQGwbwO3QBdFyl5wACDYqPtv8qoD?=
 =?us-ascii?Q?s74zuPd0rcfxWOPxo7krrHSVjXQ1BH42eJF2fs/PT5MVDUzIn4lGgStkDb6n?=
 =?us-ascii?Q?mGEAkqtvlHizQ0CzERZU4dDRsD+zXQqQ7gPf9m6XP12LyuGPrZIQ8pka8+L0?=
 =?us-ascii?Q?qooh9PUJP2/OF6KNURYoFhwqZeGCqCJKkP13mGv+wq1shV3xoITS0/5mZvPn?=
 =?us-ascii?Q?plJ32nkvfemwZIpeqCsBnJH/DcyAL+l6Q8aXkMk6rOlNKCsSJcAh4RNTx61z?=
 =?us-ascii?Q?+VoSHRu2aZ3nsUk0SNraFaaq/j/LzaANwUFpCtIVc1z0S/2pKVkXfi6iiEBE?=
 =?us-ascii?Q?Q552/vE6Q50ptCKv7L9rsWTr9Xa1W29oAOMz8Vdbnll7b/qNInBfBzH5iOmE?=
 =?us-ascii?Q?42WuunDthHyYVp6gr/R+79t7w1GlKKyBEBQYHy1POTlLivEr72jDeQ3mq0k3?=
 =?us-ascii?Q?amcz1X4cVcDZmxX76qp7SDgw4nvJJ3eiPlAJED9hWtQ/5BNV8f7pRWgWq8e0?=
 =?us-ascii?Q?lbsZy1AeEHD7+WRbnWEqCCdYu1iDSjO2I1gOMJuZZP13XPslOQq8pvMUgwSy?=
 =?us-ascii?Q?YmnX8E8tX6BYqUEFQ9z4NOeAq+BoJw/IhycX0dD2uX3gqJdwvtB/6/Sj4dyh?=
 =?us-ascii?Q?ul40PJD7PmiSnzmfmZ8EB8mnobx9kufXQCjyem1T9yTUNPgrqho7l1Sq0G3p?=
 =?us-ascii?Q?SGn7swFmz1A+vr9tdeLC72M4OSbKXehAAgMUX6M8uQR2NqTY9Ba+68lbpOU2?=
 =?us-ascii?Q?CkrTDt6rkpQqjeqoAVCQUtXlW7bIjrkIsuVhirT2ewsW0ly1hKoxPZDQT0Lh?=
 =?us-ascii?Q?vtE3SSNWTH+s+V/IYqG4BywcwJxv6UEhISN1o15lzFVQW5+9RS/1F0LkYdcf?=
 =?us-ascii?Q?CVOy5LH17fuCElYQGNs+a4AWkvJaBSnCqv9LoAFc9noZZbNMEFnJb3CKdjH6?=
 =?us-ascii?Q?OCLzBoWDkZjXW3VPdH6XwFiU773hlinmKMCP6ddZElM3vBF07NdhSzSGSIJe?=
 =?us-ascii?Q?nQoIXoBAV8JoXTuggBRyH2cIChwTyGrQA++QDF70U5WS5vyXbfucxbBrxK/L?=
 =?us-ascii?Q?XJGa1yL4RoFOFAimtUvqVyyM9gRRNj26YhcwG1+y/sHxRlr+WBgn2l3Gh8Wp?=
 =?us-ascii?Q?aPITzdrcYS+l1/T68yTa6FMp2+Y5BPzRC23nTrpQlZ0+jVy6XbmFtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4172.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3F3Yk1yeMt8BEwE5obRvJb4Hu8SyIo4pDOnOPwa/TMM4IjIvF4aSpLcbfH28?=
 =?us-ascii?Q?nld0P8+sJ6Bekysss3zW9eBC7gLw+sI8hKkGg1S5fVGdBHZiWNAoZHfYS+LS?=
 =?us-ascii?Q?NXr0KD1QxdKnYZlgUwI+qowtjQN5kEYmNUwncpJwNXvtyt4FqImicB4g7UxO?=
 =?us-ascii?Q?/eexwx/VW7ZjRKWB9uI438yP3ZMUE3XI1QLZsrRVhCYooENSb8qlnW1+BbIH?=
 =?us-ascii?Q?i9eGqwyI0INIagt68uuJvgZy9yMm+BytyRgBLDUtxi7PkfpRwcBinnprnsV8?=
 =?us-ascii?Q?jpAIAlEb/pfC01fXmfSnuNLvY/tugf6JPN0VsaoWDgy9upfBVAZZSb3o0ixe?=
 =?us-ascii?Q?F8IqDTCJboVEuSryohrhdsQVSDiP8mAdGOGNe8f6cQ2KUGTRI0tBiLSkW17p?=
 =?us-ascii?Q?hoV8StxWME5WgxDBckQmJdrzT6AZrt9Mku8aW4d7GoDzEV8Sc+dhYdE7dxUU?=
 =?us-ascii?Q?uFt3xdKWDUXgyb4HjjIoQuTXsd2LtXQ9IniK4o5pFdSO/r8pe5sVDsjj+Hq1?=
 =?us-ascii?Q?J8/ueYKjcS98rqWEi5IUIfLKB+esVf+MMobHNEjQQ6+L6pWUN0ZMfUBeHn0Q?=
 =?us-ascii?Q?BcxqhH7USGKjKyDI4emRBCxO5Flq3/UmQNH3YsiAnzWWnMj8cpL4X9Hm3Hx+?=
 =?us-ascii?Q?KL1mS8TfCR0/+cbuPkhYEOnILcAXSHS1/c0sLij8Frb1PBOa8Ua/3fKrMlKY?=
 =?us-ascii?Q?6LdOHF9BQeH7N6UwddEEBbS2C5s/pZgK/OyEhGmWa4KAP5pwaIN2QQ+zsVrk?=
 =?us-ascii?Q?qD5fbQOBRmHPtvVeoWJWOjG8krXQuxYSpuqpIgz6LU0Qu1gb/tJzmT2CWfMZ?=
 =?us-ascii?Q?KCYXQ6kcAkkw1cVCjg9ic6ewFUibEb5UwFUgTTcP2SMu1WgCBkflV536e59F?=
 =?us-ascii?Q?IDUE/whfVjVR/0SHyes4F8AfqZ1Vvwr2OgPdltmK18WXY7tutO0W5H8mWND+?=
 =?us-ascii?Q?tQ1sGerKb/aXBQsKE9ZQnq9sc182WVRxedbr1SIBJCIyNan2aDh5tSspuzC1?=
 =?us-ascii?Q?e6hlnlpG3EBPlTCEi3xIPuzZaXg5/iQmOLeR4wsnclWD97how1og6PXPB/UW?=
 =?us-ascii?Q?bEt3BUWftrmZc2sgEnkQuxOXmHF63SwV5geAfKbDtOj1HC4ccbOH8mT6Q4EX?=
 =?us-ascii?Q?8izcvYyq2NojqDT4V6gWrK+lPy+UHlNPVy33KxLfsmUgD10OWi5hg4Qy/MXE?=
 =?us-ascii?Q?/OXE31IXSKiVSV4bVHy2Vp0wwnZzQeSM/ddhuSdpbUZSAYdawfv8S5EWVDS5?=
 =?us-ascii?Q?QjutL+jArto6feM6C0NoQ9jdEFzmwwnFYMbRhpP3ZwfQE+TqlgDrn+dNe6UW?=
 =?us-ascii?Q?tDqq7n5saO6h6LuRBaxhuQRWiD4Gg3IntL6HIRlBfvaqdmtE7bWgckOmTooN?=
 =?us-ascii?Q?xTOaMHfvoAqUNs5vnI/jqY/8lUZrnXCx8dNvr5R764siNhUI8LYrzu+sMp+5?=
 =?us-ascii?Q?CE2wxv7mcYrJnTzKvcHJhiRMwbvQ+Il5Jp/bs69Zp7lslOiZCuks3E5qqJe7?=
 =?us-ascii?Q?rKYLU+HYKG/WpLLefvGJK06zkayMxVO3z0uoiLa4tLIlYH4pL5UycBzbXX/F?=
 =?us-ascii?Q?wDDf5jH6To1DNqnwuxJOgH0/yjUDKtU3G48vLDBD0jPl1J3y15S58pyTNiG5?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0856f23e-c526-4de9-f54e-08de23e717d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:34:19.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aEhfhr9g2V6wsrZTwTRW7ido8ZOBAOgq7H3fjTZetQyg12XBrawJgX4ZCtUFHYJAKOhtMmwKQFc48ht02ItFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-OriginatorOrg: intel.com

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5]
[cannot apply to next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20251114-020940
base:   linus/master
patch link:    https://lore.kernel.org/r/20251113164917.2563486-28-alexandre.chartre%40oracle.com
patch subject: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops call
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: loongarch-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511150854.iDlHBWI5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> disas.c:15:10: fatal error: 'asm/cpufeatures.h' file not found
      15 | #include <asm/cpufeatures.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/disas.o] Error 1 shuffle=3303159566
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:87: tools/objtool/objtool-in.o] Error 2 shuffle=3303159566
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2 shuffle=3303159566
   make[2]: *** [Makefile:1449: tools/objtool] Error 2 shuffle=3303159566
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

