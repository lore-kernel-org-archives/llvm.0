Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6289129A1;
	Sun, 29 Dec 2024 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735440187; cv=fail; b=PbArXlKmfv/p8/cH3Nvxz7uPkoXWCpvxwp+swMFT87xcDVxMOmqQMaGUzldmoXJnBzAjQJe7QVSOLGlbVGcMTEnrLHBTHz+f99UpOoB5pPLpM9EeZ0OEO+4bRPodv1RJnTVR5jeejfwj1fa7CyJm0ND0TZtC5uM0T+jLc/rEk80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735440187; c=relaxed/simple;
	bh=AalrZKu+KwLvmkLP0lGU6uJYyXF+WVPVMKw4iCi6C4I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AqP+whbFoHTyQN6qS/ivQH1+1sVhazZDzwbvyS0KJMLA7XrKCUQ75ulMNlgTn3QWe7z3cE892s4UBzVzWLCXdfm2eCILeAUQT9jao9OY76luYC92aKhTEuc2uU6A+MNvgmdr8/wdFp75CKF5N9sdXK69UuKz3eU00LABW98qnYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLYi1yj2; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLYi1yj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735440184; x=1766976184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AalrZKu+KwLvmkLP0lGU6uJYyXF+WVPVMKw4iCi6C4I=;
  b=kLYi1yj2iC8jPgnRm00DB4ZuCGsNHeV5nE3Mq6VYqSPI7WN1ppOvg35R
   zQqxjESzkggQUQBpCUTxtgLF1qElbQDh3YB5YAZVXqpuaduR6o/UIU3LH
   NoQ/8zxfHlKraCDixCWzAvTnh8XwVzrWSdkPuiggCJHeeWVSKJ6hSAbw5
   a8DzceWmE8EMV5B1Mjpgfj7TNmcWcv4VDJowIh6dJ+5gZjdIdfn+82g+i
   fJ2rUwX+g+p/6abAkt9TxQ07QmhsPGXvbkXdu7B8BOEVYqHJKmRxAx7Y9
   MkqzTHnPG4Ip5mK5b9S1je7aYRVGifZCg+VvCIF2BL3x7pf+LKcWUp1y/
   w==;
X-CSE-ConnectionGUID: u5xVOqh5RQydJPsGFaKECw==
X-CSE-MsgGUID: kgiaM9f+Sju/Pl1KbJaZQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46267501"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46267501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 18:43:03 -0800
X-CSE-ConnectionGUID: EC25Iuy9S0OywAIAj4yhfA==
X-CSE-MsgGUID: QQD9JhxOTjeDoXeFYQdgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100650295"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Dec 2024 18:43:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 28 Dec 2024 18:43:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 28 Dec 2024 18:43:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 28 Dec 2024 18:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjQDEp6b0pPdeKMZ2nm/mV8IxJ6/wd4KPmowGUav9p+0yGHwCTlUrQ2LV34GusGpcRlX5UpIkHLEbHx1f9Ca83/LacWuah69sKlaqce7AV6nvQGquKQlipb6U7vbrimYCMPBaV4Lzus9EdILJTZdRf3bXPebjshqs47yBnvdhsTCXZHP2dj+CUA7+xs4joEBNa4DRYBxL2oNjQznXVNtG8q+4tmZrBxfZrNnyO4n6BR9nMFB2jn2Br9E9PnHU2rEwjuEPQJL9g8Tiyl+2D+R9UT+DGf90Mpcfa06W+nlFzYJjrdbm2ax+ViP6CggQnLdJRzEqJ5eE1XFod1akgjiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f89gs9s+1AMzStO7pR7mvR9JWp8pz/ZlkzNH7hcgvtk=;
 b=St/P/SKEmmjQCKVKy4Lg12Gkjzqnx/Y5069to7mCnUSwQ4YDfzRlG4NuUHVV0P7GZv1Dpgf/pIeThHcMIDmpZHw8j+xJXjrAW/eE7EsKtCjQFu/HosxIrUE16slpYHKX/CmXpl0KLe3MEYJNMKdzWYrqWn3HV2nu78E7nQrm0RQ0pw69T+/eEg6Y4zUaiSiHEPprgo9F4b5ErhrpY8cU3+MZDCyDC46BoWSmyxSWiN7LQ8PRFC/Ml7fx7NDFhoiUg4Nwx8WfEJKhPOnC76ScfJZjeSVTqdEIf98DZRg8GwqqYO0HQR7WI6tmdTpW9Xa3dzXkJnPcdHDzAuJdpYSwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Sun, 29 Dec
 2024 02:42:57 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8293.000; Sun, 29 Dec 2024
 02:42:57 +0000
Date: Sun, 29 Dec 2024 10:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6:
 Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph
 node has single child node 'port@0', #address-cells/#size-cells are not
 necessary
Message-ID: <Z3C3KHxn1bxhDLDf@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8488523a-b83a-4b5e-8397-08dd27b28066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JBi7W7MWKZQpUMk1RzulfSs0IYwcZdqKla4lc8Fd/5RJQT2g/cE9wQ+Xu7n9?=
 =?us-ascii?Q?z8+Gg6Q7SYZDzZGaeCZtNoTX7BNzciMa9NboNLtfVr2GsHDb93xvwk0OQyt6?=
 =?us-ascii?Q?E99mqtvltHA/KnxhUP1o3qdEe6KbtKeTxkITYMhucDFlovqf6BkFn2QLDVgF?=
 =?us-ascii?Q?rr8bAXNzYbm2ZyQost8kyfzJEKmA8p+8GrKJxvkRKGSmTtcW9rDEJLqsLUxW?=
 =?us-ascii?Q?9cNoYPGsDQh5cF9omlqZbNqG/zPCwaEjaWkA+6LLM7gUeX3tFART0l3tyyx5?=
 =?us-ascii?Q?/rNs1D6LQ4gAN55zNIKDlWiGlEemMUaSTA3WnZBOh8EnkZTukyfpRwvZ7VQe?=
 =?us-ascii?Q?tPrANQHnUMZ84exH7ytcWg49dnX6bm0ePyC3LUg5SenkUy5vosH+tJk6oJek?=
 =?us-ascii?Q?bLLS0yJCIcLtMhh4zKQ9HQHzSOk1l/Bgfpzu72orXcDY84oNTH7SMXfsP+9b?=
 =?us-ascii?Q?Q9hgOm0ZEy9grb3LUBIZC5KeRQF1Y2Sur2O5W4zlpEHO3ByoCREH5O/WQK/H?=
 =?us-ascii?Q?Wbxil3E/6ficZsaAnUqrquzmfb3eOZKhO5+NnMll+b6EZztbCGjf8XtnHjbS?=
 =?us-ascii?Q?OEwpZj1352+jfbkSZqQXm3+DZhzS6rRcmbn5/q47ZMUy59wtDMofwZeRo+YT?=
 =?us-ascii?Q?sBIUxkkLW5Oj2FslKCLbDNnl78wEFw1cfJ4G3PPbD+naEpjnES1l1OHHLmCY?=
 =?us-ascii?Q?bUOqLrDvH7beIezKMbuEdnC9x00no0IAbE5Bw2egcE3D/GPIlMImHYJ4D4dN?=
 =?us-ascii?Q?xLZpKGElb8ZwOr7+UZu1mINtmHGAw5CvX+NwQO/YMfLDkQxyi195EEMXsNhr?=
 =?us-ascii?Q?52pTwfm1cu8cBW+EA151FlS0smlpNqM9hirGXEzt/il08+JImQeU03p8bHay?=
 =?us-ascii?Q?qUAi5h2FwrHug0AicJ9Ni5q1bK5CykkFlPdLYJyIvHJZ9WJt5RlR6NOZ6Skj?=
 =?us-ascii?Q?iAeR7tyOMDypFpspJJCZUAHQs1W6me3O8fx0HPkW91y9TZteTTeG8I3lZHzD?=
 =?us-ascii?Q?sTQGXkBNfQuAEejQkgmTKLND0z7WWCfxD6JHwUQQecp+YroiBvL22TBkR/yl?=
 =?us-ascii?Q?TOJWbrx5dlwrWNk0frth4DpD6F/kMFlaCPRuRodxdcR8CR/58OLnjDExRIai?=
 =?us-ascii?Q?bliWLNLhlEKGOhEMR76aUSyH2dO/wuoZ2Pzju3WeWW/h7Dibj50GVL6mzBHj?=
 =?us-ascii?Q?3o2b81JaGQzBDaV/o3VXSUH2a3gypRKTsu06EJYb9bmbEGwWO6wlbQTjUnZI?=
 =?us-ascii?Q?26LHQi8sNqg0nMTEWVUTANUzgD/JtQfP/yMoizGN2KjFskVcJy2sFFjOF6J+?=
 =?us-ascii?Q?RQdARznl75hmwfM6dXnE+W0fhEat/jO/e9QwqxxmPR7BEfvC7AJPyU8dLKGB?=
 =?us-ascii?Q?4EYG3VU1EYNRggd7VoADRCVoO8uLqtz3ySIOtENBDOiCEAuMkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yLbq9+8b5twyoTwEg4bGb902FQEYj5r0v7ywwhAUYzyQUuy6ZwzizDFuByP+?=
 =?us-ascii?Q?r6OGXDQKMkpVTbChTuxRSNAfZiXP//7A0CMllKHVOWYHW7j/GfRuBUKwCzuB?=
 =?us-ascii?Q?s6TKVHfegkE+jZk0sRV7E/Q3uNdeolbKTCz4Z6yi572/JDIoEHW6Tem2nh0s?=
 =?us-ascii?Q?xF7TQKpNWNzYohUrQIKXZ2hqE/x+M+pTiaC+H0oPVvGwI8fI9HhKacjHX11P?=
 =?us-ascii?Q?Q2OeKMzcqmyK1POA1EbBtNCMjJbK+D6H34XX5LtA4uIGJ83i5wIdJLVPxJxj?=
 =?us-ascii?Q?ocjg0fG/TQF4AX3y2r3ZxvsJfNRM8QigYdsfKq+1SATbl4mDD+PANkX89gas?=
 =?us-ascii?Q?P+1s5FE2IFfE+/MhjhkPFqCL4sxvbRNWWBVAtn1sa7sXpc4uu/NQSqW4jZhV?=
 =?us-ascii?Q?s8w0T1qC827mT/Tw5vCiebcA3k8fOhD1VFkQNts4l2u2CHsXH5r293U3hcsX?=
 =?us-ascii?Q?rF9Q0U85hzYCpMXCsQ1lC12c671hSHBonEtd2KBEs4OTaWyGzRV9SUxEGFS5?=
 =?us-ascii?Q?Nb4Xi5z3tXpjDIXBhE0424f4JAJCIpV4+y9X5soXrKhecqDch+Zx0CrpiDu0?=
 =?us-ascii?Q?a0YuDB3IA8Ddjt57oUejRsXuhYCfPIpt6nrlg/UuOhW/qJ0vCI6pK0kkSsYo?=
 =?us-ascii?Q?Ba9uYrHLe52UDmMXkZa7J2LFUMykzEVZD07/JJR+jGs69GvZkNBoviWEH0Cp?=
 =?us-ascii?Q?+/3CNFqJdYtIJUReHk4ulAD2t7AWsnEG6DjuXhfHunFyvMJAZrOUXdCLtZPV?=
 =?us-ascii?Q?NnPTLxDTLqFG0Q08gfPrKUitxJjHNrtLmJOEF6RCi//Wlp3X83m1HklXV2Gi?=
 =?us-ascii?Q?seafpVbq1L5KJECpk0HIrZhCnNr4S81N3+dtDRLwkeJm5wqj3P4Brv89h8lk?=
 =?us-ascii?Q?BUPqLyVk1gmkVPHJkB58dVjw7pO3EVdr6Ycaw78Fewo0PrqU0omkjZSS5x+R?=
 =?us-ascii?Q?P6AZeQyFrZZvZUTf8WBujLovEwPAcUSRJ2OZM0ORnRJci6e2t4VM69XCvaOO?=
 =?us-ascii?Q?p2zasamf1mlbdzwx+1fW56e1jIy6kkUqJKcDNG/4yOqDw8FTi1W4k62Hl+Gv?=
 =?us-ascii?Q?9h+Z//zFnEaiVoLJVe88wHpOH2hHg8aSrFzuzlKlc1Ub5M2TITvxOZtKB30U?=
 =?us-ascii?Q?vmrHdO7twAlMJnDlsjOLbgkGfyZfIoI0YW/6xAHU2Nt169KiqKT7k8Wt9t5d?=
 =?us-ascii?Q?UthD/lmM1UW6KEqgyoMA1MjAgvSa97a87dSSqwaUNAev4acw/C6jgJUEQbZ8?=
 =?us-ascii?Q?qW6KvJ/W4kBLLqpaQS8ZbEuKhDc5fretNCN82lMo0nKjx2iWTKfagKmNCJ1O?=
 =?us-ascii?Q?1aiJyJxta9XHfRXGzKdNFEn1U+hmESdr/ZPaf0L3mVRVq4DwRpY4+6eToktx?=
 =?us-ascii?Q?l90avff2a6JzSSXxyOaDFFWfRx7EYrvjWs7mJ+MbWR3kvIPoi8tJ0nRBpUxg?=
 =?us-ascii?Q?AIWbEIlzEo+VadbAV2CmtegYn1kwGG4wBNFlMWW46T5sc1YinWKhMaaSPkrZ?=
 =?us-ascii?Q?+EhbEd02zropKBGoGcGyQZrZ3nmbpkQXPEIOvKfpcGfNmYiNdTgWytTy4qcJ?=
 =?us-ascii?Q?1VYcDNtDs29+UVZFCQlD9vTozBHxq+h88+wGdFP8w4Ei6AEWY8sYxjnzHzmF?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8488523a-b83a-4b5e-8397-08dd27b28066
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2024 02:42:57.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMtZR2N4PG+Am33gAMlFhnLCs/m7i5BzWnycj8eY1kLzhl3Z5ZIBcEn1NslGmNpplTIurmLoywdQgqYeGOHIqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 87a267b4af09477721e9d2bad63555f0dc49d08a arm64: dts: rockchip: Add USB and TCPC to rk3566-pinenote
date:   2 years, 8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 8 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241229/202412290950.FfXusXHx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290950.FfXusXHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412290950.FfXusXHx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +488 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi

d449121e5e8add Samuel Holland 2022-01-29  443  
d449121e5e8add Samuel Holland 2022-01-29  444  &i2c3 {
d449121e5e8add Samuel Holland 2022-01-29  445  	pinctrl-0 = <&i2c3m1_xfer>;
d449121e5e8add Samuel Holland 2022-01-29  446  	status = "okay";
d449121e5e8add Samuel Holland 2022-01-29  447  
d449121e5e8add Samuel Holland 2022-01-29  448  	led-controller@36 {
d449121e5e8add Samuel Holland 2022-01-29  449  		compatible = "ti,lm3630a";
d449121e5e8add Samuel Holland 2022-01-29  450  		reg = <0x36>;
d449121e5e8add Samuel Holland 2022-01-29  451  		enable-gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
d449121e5e8add Samuel Holland 2022-01-29  452  		pinctrl-0 = <&backlight_hwen_h>;
d449121e5e8add Samuel Holland 2022-01-29  453  		pinctrl-names = "default";
d449121e5e8add Samuel Holland 2022-01-29  454  		#address-cells = <1>;
d449121e5e8add Samuel Holland 2022-01-29  455  		#size-cells = <0>;
d449121e5e8add Samuel Holland 2022-01-29  456  
d449121e5e8add Samuel Holland 2022-01-29  457  		led@0 {
d449121e5e8add Samuel Holland 2022-01-29  458  			reg = <0>;
d449121e5e8add Samuel Holland 2022-01-29  459  			label = "backlight_cool";
d449121e5e8add Samuel Holland 2022-01-29  460  			default-brightness = <0>;
d449121e5e8add Samuel Holland 2022-01-29  461  		};
d449121e5e8add Samuel Holland 2022-01-29  462  
d449121e5e8add Samuel Holland 2022-01-29  463  		led@1 {
d449121e5e8add Samuel Holland 2022-01-29  464  			reg = <1>;
d449121e5e8add Samuel Holland 2022-01-29  465  			label = "backlight_warm";
d449121e5e8add Samuel Holland 2022-01-29  466  			default-brightness = <0>;
d449121e5e8add Samuel Holland 2022-01-29  467  		};
d449121e5e8add Samuel Holland 2022-01-29  468  	};
87a267b4af0947 Samuel Holland 2022-04-12  469  
87a267b4af0947 Samuel Holland 2022-04-12  470  	wusb3801: tcpc@60 {
87a267b4af0947 Samuel Holland 2022-04-12  471  		compatible = "willsemi,wusb3801";
87a267b4af0947 Samuel Holland 2022-04-12  472  		reg = <0x60>;
87a267b4af0947 Samuel Holland 2022-04-12  473  		interrupt-parent = <&gpio0>;
87a267b4af0947 Samuel Holland 2022-04-12  474  		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
87a267b4af0947 Samuel Holland 2022-04-12  475  		pinctrl-0 = <&tcpc_int_l>;
87a267b4af0947 Samuel Holland 2022-04-12  476  		pinctrl-names = "default";
87a267b4af0947 Samuel Holland 2022-04-12  477  
87a267b4af0947 Samuel Holland 2022-04-12  478  		connector {
87a267b4af0947 Samuel Holland 2022-04-12  479  			compatible = "usb-c-connector";
87a267b4af0947 Samuel Holland 2022-04-12  480  			label = "USB-C";
87a267b4af0947 Samuel Holland 2022-04-12  481  			vbus-supply = <&otg_switch>;
87a267b4af0947 Samuel Holland 2022-04-12  482  			power-role = "dual";
87a267b4af0947 Samuel Holland 2022-04-12  483  			try-power-role = "sink";
87a267b4af0947 Samuel Holland 2022-04-12  484  			data-role = "dual";
87a267b4af0947 Samuel Holland 2022-04-12  485  			typec-power-opmode = "default";
87a267b4af0947 Samuel Holland 2022-04-12  486  			pd-disable;
87a267b4af0947 Samuel Holland 2022-04-12  487  
87a267b4af0947 Samuel Holland 2022-04-12 @488  			ports {
87a267b4af0947 Samuel Holland 2022-04-12  489  				#address-cells = <0x1>;
87a267b4af0947 Samuel Holland 2022-04-12  490  				#size-cells = <0x0>;
87a267b4af0947 Samuel Holland 2022-04-12  491  
87a267b4af0947 Samuel Holland 2022-04-12  492  				port@0 {
87a267b4af0947 Samuel Holland 2022-04-12  493  					reg = <0x0>;
87a267b4af0947 Samuel Holland 2022-04-12  494  
87a267b4af0947 Samuel Holland 2022-04-12  495  					typec_hs_usb2phy0: endpoint {
87a267b4af0947 Samuel Holland 2022-04-12  496  						remote-endpoint = <&usb2phy0_typec_hs>;
87a267b4af0947 Samuel Holland 2022-04-12  497  					};
87a267b4af0947 Samuel Holland 2022-04-12  498  				};
87a267b4af0947 Samuel Holland 2022-04-12  499  			};
87a267b4af0947 Samuel Holland 2022-04-12  500  		};
87a267b4af0947 Samuel Holland 2022-04-12  501  	};
d449121e5e8add Samuel Holland 2022-01-29  502  };
d449121e5e8add Samuel Holland 2022-01-29  503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

