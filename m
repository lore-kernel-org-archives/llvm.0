Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F124C96;
	Mon, 20 Jan 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362736; cv=fail; b=RDtuevUBbB1mTjy5HgDuf3HDNBtlTZmqkeZ7sbPLDKUWfi7KmDQH9RXt2Hv84gJtrXBZOZobLF60zHD4JK/9c4wyp2oS/D0VTmAvn8HjVTRGLhCZvL+ii2TM3uenK0aCwKIAGsEHQ9ZJA2S7fYbsoYetfhqnLAbKuljx2YZM4Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362736; c=relaxed/simple;
	bh=ngyXCim8NVTqhrC9d1ZNZ3jP3yrayQjSxasojfJLWLU=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=mWn1M/vm/00ugSJG4s5GZYvb6esqCs/kFFmuKERzvzrUgTJC6K3pPC+JCt8Y+ahf+fvy+VNxk0hB7T1289hEX4iKKcDa+YNRgZx8SVisO6X9o5eBEKXJMGiawJzPzqHs+iluFP2UMvroO1vQd277Q1yaNK5qMnZFZwOFEjs+Rm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjDyT3HW; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjDyT3HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737362735; x=1768898735;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ngyXCim8NVTqhrC9d1ZNZ3jP3yrayQjSxasojfJLWLU=;
  b=NjDyT3HWvTSdF46wvV+ko47Z6dmIcueEKr/ACdgvqZjA5umU3vmr7/WN
   btwg4ThHgBQQwBoS3S5HyUBEnl1siAnp0iSUqekacO9Be906samSXjoFW
   scrkAv9WBUsBt8oAUNYa8xob1OjoEeH4JQETHuxGnf/LQoreZW/kgk/QZ
   zqlqq8vk5MnihIw0wPADIjC3y86INd5JhoVPkzDNbG/7xbipY8GKuZ/KF
   3/kOq0TVPaNFnBbonE1/P6mXAqYha4p8kNVyfDWHlSpzPlM9cbhdr2VHJ
   CJaU964adX5vjNTIb9Ud8HxpxCLXxd6AgAoi2ptyhC4NZ7s1A4L3WJ2WI
   w==;
X-CSE-ConnectionGUID: InYxJQ7vQ/aRkMp4GJvHLg==
X-CSE-MsgGUID: cuWO3X1ASZWFHanRcdq8NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37845524"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37845524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 00:45:34 -0800
X-CSE-ConnectionGUID: zwLLGABzR0+KT4S61i21vQ==
X-CSE-MsgGUID: acZEB3G/RXCLbb/mLbhgpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111416377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2025 00:45:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 00:45:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 00:45:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 00:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEVS+PU6a4/6G8Bd1PU8mrwUS+SLy9CRpXg3weqRNL8bUdnTaqYH5V0ZFi+5xmZ3TSOyo9l0nv6HotReRWQWPhpIXH8HIfVm8gbUyZQFrjt6098s8v1EiDqyA11m5jpesUjBXZbfpZsHHJQ7ekcjg1X/eF9Vxlm8UqIwHEBCXDTOWJJL+bA99ljF7RSYB/K7LsHjEIWEc1NML5feEoS7JF9Oy9E+h/3jyMq2Py8HDNVVnJCbVJeVoJ3rXvtjLhj5AdBX4kKGX+oXBZVTGwFD4zWsiye9YN8ddCMIn/7sDC17LuI9NpzyaCjZrjRSyw4/91bdpXiTA5osKAdFfFw9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snDo9EyZynB/C5L6ovV2GTp1CO4JJLpg3l764D9aRfE=;
 b=ixaWLAsr7E/tdk1nnOiOTlNNnECJgcCtvisaWtU6aEfA3DjqUcFFyMUQ2zTpaNBxc/wLuwaFaK1PH0f1WKhlhbqMAytEP1sYY3jir5zZ+IGMhHntpcUvIdQ4a7yW5vmp0WhoWGgcEBXAeuof8IRO6LlbQA/id3lOKrXNZq1zyLcZLZ6ljyY4Jl0Bsd7aJnNyTiofXvyU5iRt+TK8ufRJ5dw9L0SuVd2j3IWWlu3wBG03QDOIBP9DTwg8jUdeLf20H9Qox2ptvxoXUfsoserdd+7KKWLXMMu6heak26LbrTzK8l/iA8Ex82NMuumy+75TIBtarJ6AsIjaPrcLJhvY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:45:31 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:45:31 +0000
Date: Mon, 20 Jan 2025 16:45:24 +0800
From: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>
Subject: ld.lld: error: vmlinux.o:(function run_init_process:
 .text.unlikely.run_init_process+0x18): relocation R_RISCV_HI20 out of range:
 529072 is not in [-524288, 524287]; references '.L_MergedGlobals'
Message-ID: <Z44NJDPJs4uF08bm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: a3762545-1e35-4b58-4e89-08dd392ecbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tZX85g3XwRwwaHj0c3iQmlAvIVWDSc3ynQ416SqYffgCxFW5O3nDahb91kCT?=
 =?us-ascii?Q?BLEvD7i6u0oEM5fuKVVqvNHtXX3neE55dSJz4EYxUR9cbPc0dqPupyBXyUyH?=
 =?us-ascii?Q?T41sgOqJtUG+HyI6ew5f+bb6zum9GfKIr+SrdQbfcbbiHJoONvmSHdLOWgYB?=
 =?us-ascii?Q?YNQlL+fWSL1sHuc1i9dtA6xCf53vaILstu9z7tZ4dS1gh0hqV2No113qYVdl?=
 =?us-ascii?Q?WMM5tQ8sLM/mRSi13jsSi71+4ZyHflW09CUkTvwj+p3n3Jr/h3D2Ifrux+RV?=
 =?us-ascii?Q?HoRDNpdoiJGbBC0XQdWZ55bqW3BqaD9aQ2wTU8oXJVfmGQIkAey0vhv5Xx/1?=
 =?us-ascii?Q?fJw6sOurF0+m2iCCvbzLVbIPt4fq1jqmrvpucW3H5blL9WfvEXTO9TQAtrcO?=
 =?us-ascii?Q?NagsPeyExuOhxj6YxYy5/y7s6sJcryD58WlABpNOF7nPniDuxz7Imsp52ijm?=
 =?us-ascii?Q?6SjFs4V7tMbrHOb3v7BJXW9hN8dZJh3NZPTgzvteEhN81FoOI1aixfSKgT9v?=
 =?us-ascii?Q?WUAyIUvoNW63dmcAW3gYgh2pdtt0cBTRKBshiWUHT+DIZCzBlMvxzJxto/TV?=
 =?us-ascii?Q?yM6A6C185SU9K0W6+7iXJhKf0fFSgympZQ++iJfAB1ItcbrZFzL6Ur6eHKsw?=
 =?us-ascii?Q?CJRaP3lTBRSd2cNGrNbooHlpeTjhFmUbaHl+p3gMsfNIJFWYBxHE4p1UcUZE?=
 =?us-ascii?Q?HQSghwAlewVxhvQbNvCODQzc0eivgYhttXS4/+4VONO8jlaqJgky+fVVG/6q?=
 =?us-ascii?Q?aqiErDEV++u13RWQ7tTokQa72YNwd2asQhozYb4ASi52atDf6szuzH0HqxkI?=
 =?us-ascii?Q?yKuSxUdeUuoLs7YZMHn1V7fdpW94ngo+wzJMOtlN3yofNsinRJNuk1ItzN2e?=
 =?us-ascii?Q?gOtl5lrL+NEJDLJ/g2qaz5CS28E5s5TlNkP4Lwky+a418j/tHSDGJ74dyzaT?=
 =?us-ascii?Q?gyOo+6JVbgEfN70odUgSo1n2T3W9idLoJP1EaSmLIwmskYdwXU47mAVMpBJO?=
 =?us-ascii?Q?iAgH4rzK1wZIXutEm8Q4/iUCUZRhOdwXrKYLf8NTQfI1J2jncDiNgq3nkcDd?=
 =?us-ascii?Q?IrIg/cHKn4bNPoaeEePTp9Qk+hKZVHe8jvzAjCmApyMIVj3mSrhLKL+hUmR2?=
 =?us-ascii?Q?6TBlPLZvyXRfnCmXEnp5WNSRmJWH8ZnKb0687a9i1rPWjS/9p41JpR4nXFt+?=
 =?us-ascii?Q?FT5Jb2K6fmPY+e2mGZTahVhvGgNZcYOqteEvbxsqXQbtZ2qdF94cQsbwGF/8?=
 =?us-ascii?Q?a7AcXSnXIaCYd+5nm8YEIfrDjTY90hu/lwD5vXIjv2a4heDl2QDuEJaamn69?=
 =?us-ascii?Q?WWvmVgxcV4tSEh5P/WoKtRbonZrBe8fnf/+gPb7t2LwhjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Q2KA5vG8ZxYb0yb0+R5rjqei0/Hxy4yXXQWA8m4ElkR0Wym4xWyT+iN13S4?=
 =?us-ascii?Q?I7PCpkTEErf9RVozB24W4Pg+CuLhjg9LPgSlXF50RSCR56PjDk+l+ILpVu0v?=
 =?us-ascii?Q?o5edAzZdV4qYBHQk7uOJFpJ8fogxbfv5vp738YUxXI0QVlN991knQFghARme?=
 =?us-ascii?Q?wpBkEDLaWrv0p1aQueE3UlUh2v+MLhZc+ZHEINzxuuDEwkkT41uVnsaDoRiv?=
 =?us-ascii?Q?SLBIlLZN00pUXQNmrdoSyJcdWmt83pNsyz/oIUL9mZ3Gz1hKT+Q4VRww+G5I?=
 =?us-ascii?Q?h3W/YpOEmxNKJWrjiVR/6YK/FSkoZH3Bs3EYI6A99XfmavLJGnDEFB0ycqSh?=
 =?us-ascii?Q?nxhHj4kLJf2ZBOjMY06XQWY8AcSIFmzXIx2h5DzThfm40pL2hUVW3p8TAAFu?=
 =?us-ascii?Q?LsRigAGgzb5WvqjSA5coCemUpJvSqDbBR9BYldJb4tm3cmGnKH51rJA5yKmo?=
 =?us-ascii?Q?bYTo/TKmyLTZeTwoeTKuzVYxFSQ2ZdiWzkYlfXEoF06ETp62t/5o/iuYWZN8?=
 =?us-ascii?Q?5AOYOxzoW3dJMVM3V0/YhLv9h3d1KsgPvGFCzkaTPlANszEpWfJ2n03fSJjm?=
 =?us-ascii?Q?DqHwXeXZMoCHkSLLZmWlbnvzEuK5XlrsGZ3AQCXeQE4vHCh0JYrymPfbRCWs?=
 =?us-ascii?Q?EAGxS1SzhqIKWK0SazZu3lCeTnFLFWHymev7yfePJSiGFyWVGt3lyr+nVFNf?=
 =?us-ascii?Q?a/8TfCmcvmy24JW0O/KT2YIQiaL4/eY7g7djgv7tLGJPBQVCI0trKj3ugmUg?=
 =?us-ascii?Q?wTB2I3xxW0yC1/kttXdvviFKHNlwWePuIuTPuw64j+pKpz+hb0hLo7++lSF1?=
 =?us-ascii?Q?cmUaP08ZhoPswSbXP06gcNjmQ0dsFzFo2ckoYe7zIezWRz3gG+f/pwUZoKxm?=
 =?us-ascii?Q?sEncjrjv5BhPbIPg5tRC3owkcVUajVH2FvKholLcea20VxDjaRfqaWl8reTY?=
 =?us-ascii?Q?GPuCVcw2bRbFhUqHEyTtB9xpCS7MtQbRAK9di+rpP3CQa9eztsBNJVNlbNGX?=
 =?us-ascii?Q?xiCQpTTANRQpGJoqrxeokr1JWT7SAsIF1nKKA86VZo9d/wqXKj4BE9TcmCwZ?=
 =?us-ascii?Q?XRHjUBVKEG5vr+g5JDowkhtMDbQEJFJcGbHyYoDlDDlgekkLvoM1yQhYwg1p?=
 =?us-ascii?Q?ZKhW7hfG1f8g63CORDkvwW8Zsj9P9kZaMvB5VW1rblp0bAqs57skvC2P6BDh?=
 =?us-ascii?Q?+Uf9915ou2rTLlLH8vT5v83OWkcuib5JM3F0oMQFFLwmGmqMzLhil0PEN5bG?=
 =?us-ascii?Q?MiE0PQuwHjJSJCzdWxZ319aj+VJeqTDwuFpCa9T1h7R+KJ450AmrI641wA57?=
 =?us-ascii?Q?32A+eiTeF/PIVzuopIaqrT2eovz+EC5DMw7aFIyl0VOZPOqV1FK94hP1K4XO?=
 =?us-ascii?Q?fL06c3Ydhwy2M8GvM88lNvsCTBCBjQlfMRbbGQGn+aIHoic/NO/ArZQP7+L3?=
 =?us-ascii?Q?g36AfhpmHkinxC439a+KRMZ+OM5/IvBjWcOoRR0tMX87bY9ks7VSyIfSTP9c?=
 =?us-ascii?Q?WDirXXIOQWhAdXfMAGEcdQlyar+fQ4GjJ4yVcgQahR6kQQShWicXgIUF6PtK?=
 =?us-ascii?Q?vSJnmwEmybkjKRpg9ozynTCUFWIs1Zp0Owxe3dYr9R/Fy4iEl9p+/YfW6D4o?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3762545-1e35-4b58-4e89-08dd392ecbe4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:45:31.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax15jiTtV/9wUZhuhXGb9b25N8AoCghmmBJ4QKJxxePIa2xSRq0jBzIESe4OI8R6fdjlaY3pAtkoHNaKZpbZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-OriginatorOrg: intel.com

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: bede169618c68379e1be7ace14e8ac85b964a9ec kbuild: enable objtool for *.mod.o and additional kernel objects
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201626.M3REz6Dq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201626.M3REz6Dq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501201626.M3REz6Dq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function run_init_process: .text.unlikely.run_init_process+0x18): relocation R_RISCV_HI20 out of range: 529072 is not in [-524288, 524287]; references '.L_MergedGlobals'
   >>> referenced by main.c:1379 (init/main.c:1379)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_finish_cb: .text.unlikely.trace_initcall_finish_cb+0x36): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.144'
   >>> referenced by main.c:1224 (init/main.c:1224)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function run_init_process: .text.unlikely.run_init_process+0x24): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.121'
   >>> referenced by main.c:1379 (init/main.c:1379)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function try_to_run_init_process: .text.unlikely.try_to_run_init_process+0x32): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.134'
   >>> referenced by main.c:1397 (init/main.c:1397)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_start_cb: .text.unlikely.trace_initcall_start_cb+0x1a): relocation R_RISCV_HI20 out of range: 528281 is not in [-524288, 524287]; references '.L.str.142'
   >>> referenced by main.c:1212 (init/main.c:1212)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_finish_cb: .text.unlikely.trace_initcall_finish_cb+0x20): relocation R_RISCV_HI20 out of range: 528121 is not in [-524288, 524287]; references '.LCPI60_0'
   >>> referenced by main.c:1221 (init/main.c:1221)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

