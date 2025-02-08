Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624422DFFD;
	Sat,  8 Feb 2025 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739031994; cv=fail; b=UUain3NNjUg+6nbVDzSL6ZAOa8GchrIF1tSuLgZFbybnJTYY6crbja43gx0QZc7ddFidWhOvv/GlSw951FGCamh7QPxMUe48/1xVp+9tWZByaKuGoQ85RORhL0rt/Uy4LhI9X9p3553WhIxg7hiPx0ZEdaVgAMn+oq6KmwJgeno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739031994; c=relaxed/simple;
	bh=OguO+tpY/JM8o+7JIKv1WzsepYqZGT+LHwhG60ibuxQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pm64gcQOStiw970Z+uF7SdlKftA1BkzLXRW12WSocKgj/Iyk0if1sA6LFnxCp9oZpZ+N6CDSlVLX/E1wjHWQLxOBVh6lLotamSFt7YlN53KDgMBROZkoSLt16NPhfeS3PyWiqbTgQLsO2RTni4TM6KUXSjb682n2Q/K4RiGpDAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxYJdJ9j; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxYJdJ9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739031993; x=1770567993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OguO+tpY/JM8o+7JIKv1WzsepYqZGT+LHwhG60ibuxQ=;
  b=BxYJdJ9jwBsyuce6xxM40q2EeDqB8IcTa4AFwN08xzjSTutJ22N6ZhOA
   iSMdmmhvpDs0uY4C+ijd4+UGT7HEkIeuRi0GbeyYR5pQHWN8D87q80AwG
   rjQWvm9J6ZfbP+/Ol+U55eObyp4FQu2q30sHSURAULkW+uxVPyP98lPBo
   rrMz04r1n9lcA13HzA8KXl9eMLKBXCaKB9H3zJcd4r4IbsSNYnNDRJOBq
   31QJC9KRdI1NKO8+mDmc0olCOS84EPg4A/6jpADkL4bRGfCsdtNoFX8y3
   OPIEdWVEhnYBGyuKg9t2gwojGJ7mIB9MUw5blTQJyfvp2kRvzvWEOjA8p
   g==;
X-CSE-ConnectionGUID: dlr2XT/+Q1WgiYnZl4t/Pw==
X-CSE-MsgGUID: Lj1ZtuvZQLiL+kyLMAPWOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51048587"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="51048587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:26:32 -0800
X-CSE-ConnectionGUID: s/ycZptCRZm8Fj/oB5iM5g==
X-CSE-MsgGUID: 6NBEp8doRF2G6leZy+Lwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135033191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Feb 2025 08:26:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 8 Feb 2025 08:26:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 8 Feb 2025 08:26:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 8 Feb 2025 08:26:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqD3cK/rikFZtxipwkAcaLZLzHkei1iO1B7wgaWR9+x2vgVoPUg0jkK+HeO0mM6MtEUn4MJIdQj3yj4ifKXVLiVF6xWt59oRqPMay+PZ+hes22ZhX7FdAk0waXtUiM3WUBtuYxfJU0SQAX3FNSkY7Tc5P3hr+nNgglNWbpN+bHUUNq/qoRl+VNDkO6Rg+jCBbwmwJFZvEX/HqSeamkvoNlOFNCjotGRBobYN/YbAfh6NWZy36ZqD0crGY5ZnOznB7rhLJKAwTuPTcMzwIDXx/sb5U71z65mk1sp6IcWZIM+CuzziWdq9/Dby60gl6j5a46T3F7e+F+BODtclAo6wcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dqApPYOpVqL1ljQa+OMDmkylHc3Rj5Xdrxp3IXV4yc=;
 b=DcWg/dZj7+mg96qZdbb1TY1zdT16TKaSeIOmTXWCu9BHje3foBLC196/NKg8mtk+cfOld60Seun10JZUS/Fq0qtDHmhOJrYQzW8dHkPPX6SFy9htX6gp5ioAbU4XMs135KGjlv4U9LE8BqPTLPhG/sTuOKakpLk6CUc1j6HjvBplkzbKLmpCR5tzmy34r9wdO4SYXuqD2HqJD7gs0WHLmLxlN6QuEFkwI0WtYMJDVmBIzodTZ/8Qhbm2PAsukdwSIbNLHDwgsf+g18QR8JiYW676R8qPyRWILeoFg/KlfrhnG2WgLv2yvZ9spWf/5R+Wc9AJnjubgJ9/BdDxEUeg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 16:26:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 16:26:27 +0000
Date: Sun, 9 Feb 2025 00:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [bvanassche:thread-safety 36/36]
 net/vmw_vsock/virtio_transport.c:228:2: warning: releasing mutex
 'vsock->tx_lock' that was not held
Message-ID: <Z6eFq+Md1EMp/fWJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: c93e7781-d42b-42a7-cab4-08dd485d565d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bSB/c+WKAoWq3onInjwBXE9fkLCBwLA2bPFCKU+ddlYMzJ3SFoJbo+hM1k39?=
 =?us-ascii?Q?QJvRUt2wgzcS4maxaI1uqYkVvz9frcLvsFucrJLM0EOOL6PS8GTENfLUE4ZF?=
 =?us-ascii?Q?hMBAgW8DOAlojZMXAmplUBlaBvgaAQfiDekovCPFsg4vFglmwQynZgWFAYce?=
 =?us-ascii?Q?5R6jrPAy5ISvl1g9UBEHJCSHSmgGAWxH9sp/h1gd8s8dtveo5da1UXzpRray?=
 =?us-ascii?Q?M+u1LCAL39aC1JXvwuhHjCFWJXHSafc9uudKtpQmZpp888KemgTZQoAyLO8h?=
 =?us-ascii?Q?QpKZpHTisCX3x8N61CKOcjzF4WUDvSRtsBfhyL67PDZZG7tS5fzZSE/iluhM?=
 =?us-ascii?Q?+41FpA/37KKj7mZWTWjt7HMGuH4wP/lQi1EgJd1zeJJ8nRFb4qaz5TS9x2vT?=
 =?us-ascii?Q?k2UBpRECxuAjbS0nlX67WN4VyZGY6WcaEdWGAAQTVHZIvJn9Y8GLN6XCZsml?=
 =?us-ascii?Q?nqjFjAfGJJUpb38t0yJVMd5FdN6B9SS17Ee0HtJOfU/7sX/oD8ipNIwSKQNr?=
 =?us-ascii?Q?vNu0RctiaPdWO5iTVGshG9XX2jd+LhPNhcjoYBxKPgFh07jT0LIG5tPh+vJs?=
 =?us-ascii?Q?vXJFI8X4PTec/RzSUauDoq4ATZ6aOoNzIScQOKaHJm4BUL3de/vG7S9Pg9Rt?=
 =?us-ascii?Q?E5M0IeVj/hSAzl3wtnDbdS9R+DmmOjjuGNrf6ZKvlfp0wAzMtNF79oTHvDU0?=
 =?us-ascii?Q?vfmrZfSPXe4+fRFlKoWOp1dbtUa1R1kxLUoCqWIEddrS6VyZhY19lPEOmyLX?=
 =?us-ascii?Q?DRc5n6GBcDvCzcaeWmeMmQm6H/puCEi4SBQFU/WWUCO0909L2/yj0k7E18Zi?=
 =?us-ascii?Q?taS3jCq0bSMvVz9G8i2/7AUQ1ssGxOrrd1RGxEd6k3RTiC6bRHNIjIC3NrWp?=
 =?us-ascii?Q?hfjgM1e+JfU2PylfFrDG6TLtgfComBtdjOrxIZNEKgLdiJNEBLQbbcCt9+w6?=
 =?us-ascii?Q?qfbdY5yYxDDq6VMHLV3nUezH6Fj5rWFkg3jbSR0f9FYHT7u9rC+wqarOwO9Y?=
 =?us-ascii?Q?tnt3sXxmb79yEqmd9HQ1RsRRkuJyBdP3kvSwE9VoVQNGyhwEJwqPqo19TN+X?=
 =?us-ascii?Q?edqVMkTqBgvg+UwU/je3wP41+PaCPL5slpqGt8G1T5rtZ8zlm8Nc3A0sG1pG?=
 =?us-ascii?Q?o+xJTHldOjNOiwO7kBUs0roqtrraOkdhE7G1XV7FPsL9S1dVla/IlUZi6CuN?=
 =?us-ascii?Q?Nv7WfzV1ziA1FXaFPvgZj3014XwRFRiXyNvrtY9tKZxCiGSgqusF2VbBq3kj?=
 =?us-ascii?Q?GWZk++R7Yp0gzylU5baLkolOoSwCXBpxP99xupeVGJuzsCCii1NylxWtT12G?=
 =?us-ascii?Q?00gJDOSNlrNYEEeeqGxF/UMedX1duqCKQDwu1K8x1/8ZFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4D5Ua8OGjlPh16jOn0Vup7r43ivJriQNXaT4VQFoXL1MHnb4N4IBDjRuEio?=
 =?us-ascii?Q?W8QMb0p2ecZNjmEM/0ptg3sxSDnRdgzVaVcPz87B9JAcXqraWHtW9pkA2uXd?=
 =?us-ascii?Q?8pHNu+X5WRQo/sdkIu4b/ZvNuZ1zC8UFlLQuEppuqijCRep7ofU3hJduGLPr?=
 =?us-ascii?Q?OHn3r5xK83qeizCObHGZXCD7uD43s4K49SoYAojStoQqU51xuo+8EIpW3IXx?=
 =?us-ascii?Q?bs3WGTub7Agh/Q80lcoVUK8APtx7kbhmoOYIAUW1uJW1qMuA/RBsqgx8ZExj?=
 =?us-ascii?Q?Y6gSECRFSk3YxhqdjAD6FNWgPcPuab16C+brtTxK4HJ6sa2YmTOtcPVQihCp?=
 =?us-ascii?Q?eSCGEiXrEaOOt7JmJMda1k7FpGdBsC6uD8zHbMpeQHB0VGON7CtUBtToVAfQ?=
 =?us-ascii?Q?b1G4i9n/Y4uesiUMEjsF19iBe7CoBqo0fzWv0vD81Z2g2LAClJwkawdDXPT2?=
 =?us-ascii?Q?khWbiDGLEUentZrELr0HlXVVn/rggryKieLtHcReh+mlujZ1n8P54jX7OjVD?=
 =?us-ascii?Q?4Z3acncQQ8CRX8tLDvimuTRCP+tYoaIos+M9Ndn08eKilpYJERL7Aw6UuQCp?=
 =?us-ascii?Q?ePYefFQ65n71S/gAvLo/QbRO0bLPFqkdzXVtiKBC5aUNQpu59R+psXgyxirO?=
 =?us-ascii?Q?wJ1rjVTf+OFtzbwBAyGqvvfatjdvpcX1pwiZ1Kl3wXhjdrBwOgGytCzx/8zf?=
 =?us-ascii?Q?pZw6oFexu4423rXlmgU9CS1SUJxnoFJ2Xc8XOk3C9zB2Q0wxa9BQN3vPYqR/?=
 =?us-ascii?Q?NagSgANNEjzhlLOttEVPsWZtrSlSejW6mWFwPS7YpR85DYtCebYyvmILlzWg?=
 =?us-ascii?Q?9/s/VBzjPhQAS5HrPNe/qqqolJJ7a7yn2OR2Jgy/fpeYKo4E+552Wxhd8OQE?=
 =?us-ascii?Q?O4PoO7qByBpnDN7d/2hISxignjg+MBgW0noZGnhEwthFWU+hSVFiXm5VxR/c?=
 =?us-ascii?Q?X5JyBNb72ggE72MCkYDrgxFbRcpg8C9et1aKxf7dxNHXaRAa7/6J3phHvr2R?=
 =?us-ascii?Q?ozgPoJLDvjbzjLUxzhfsbA40NSsOrU7PBTLqD3IW8R8GOKmnr2KGT8OxL06X?=
 =?us-ascii?Q?a47s0l9cybcM7jRJ1q9t5geW2ROG5rq/Of+A7LVTeLxF975THy2NpclDfmQe?=
 =?us-ascii?Q?925OhPrs8PiTHf/fp1Yp16d889MYcRMSQLxWqGj8Ndi6j/X0llXUWKqRrlWB?=
 =?us-ascii?Q?iXzdaM/rW3uYw4/YvC1Sip6BtRX03+U8w5vH8tPPCyPmsjaucCzXQuC2lCkf?=
 =?us-ascii?Q?AM1/89PV/fT611JgalsDHXjhQrmj3/XPHCT9yM6lvCTR9Kym4MwniTfUkHyI?=
 =?us-ascii?Q?amPVYT5n6IZvIVaBkTf4xjb/HQLcKukry1kWgJcnpObrMrKEro/mkOLYjTle?=
 =?us-ascii?Q?vG1tsQXFRDG7a8U4WWC1Hla//MWVzEf2KuVPAxtYA4oodQRmY17HLijQh9l2?=
 =?us-ascii?Q?u5ift53unVgMvBpMpYr7c5ItgbYMq2LNp3xPcRIvENL3OKEzETfRyrqOjnB6?=
 =?us-ascii?Q?mgqCsXBBU5fLf9XMsom+SVuEqHbbpcCTo4r0jLjHc3PMWom+5qSMtI1HFmBV?=
 =?us-ascii?Q?bzhGYQ+kgJEIoi7H1U9V2XHZWCM7Euatq4+mNsSpDhei0QkXEiPfClEzmN7E?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c93e7781-d42b-42a7-cab4-08dd485d565d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 16:26:27.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCtMk5ffkIKKCntoXt1l1ynZXstQA07VaatJC0hixDVSgoiFfD5j1XAwcdaYPvFbR/Wj4gKzGRCH87z4nJRbvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-OriginatorOrg: intel.com

tree:   https://github.com/bvanassche/linux thread-safety
head:   ce14c650535d31959070629f347cb214f6e51d3d
commit: ce14c650535d31959070629f347cb214f6e51d3d [36/36] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: hexagon-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071035.uOQ6feeD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071035.uOQ6feeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502071035.uOQ6feeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/virtio_transport.c:228:2: warning: releasing mutex 'vsock->tx_lock' that was not held [-Wthread-safety-analysis]
     228 |         mutex_unlock(&vsock->tx_lock);
         |         ^
   1 warning generated.


vim +228 net/vmw_vsock/virtio_transport.c

0ea9e1d3a9e3ef Asias He           2016-07-28  210  
efcd71af38be40 Luigi Leonardi     2024-07-30  211  /* Caller need to hold RCU for vsock.
efcd71af38be40 Luigi Leonardi     2024-07-30  212   * Returns 0 if the packet is successfully put on the vq.
efcd71af38be40 Luigi Leonardi     2024-07-30  213   */
efcd71af38be40 Luigi Leonardi     2024-07-30  214  static int virtio_transport_send_skb_fast_path(struct virtio_vsock *vsock, struct sk_buff *skb)
efcd71af38be40 Luigi Leonardi     2024-07-30  215  {
efcd71af38be40 Luigi Leonardi     2024-07-30  216  	struct virtqueue *vq = vsock->vqs[VSOCK_VQ_TX];
efcd71af38be40 Luigi Leonardi     2024-07-30  217  	int ret;
efcd71af38be40 Luigi Leonardi     2024-07-30  218  
efcd71af38be40 Luigi Leonardi     2024-07-30  219  	/* Inside RCU, can't sleep! */
efcd71af38be40 Luigi Leonardi     2024-07-30  220  	ret = mutex_trylock(&vsock->tx_lock);
efcd71af38be40 Luigi Leonardi     2024-07-30  221  	if (unlikely(ret == 0))
efcd71af38be40 Luigi Leonardi     2024-07-30  222  		return -EBUSY;
efcd71af38be40 Luigi Leonardi     2024-07-30  223  
a194c985973276 Michael S. Tsirkin 2024-10-02  224  	ret = virtio_transport_send_skb(skb, vq, vsock, GFP_ATOMIC);
efcd71af38be40 Luigi Leonardi     2024-07-30  225  	if (ret == 0)
efcd71af38be40 Luigi Leonardi     2024-07-30  226  		virtqueue_kick(vq);
efcd71af38be40 Luigi Leonardi     2024-07-30  227  
efcd71af38be40 Luigi Leonardi     2024-07-30 @228  	mutex_unlock(&vsock->tx_lock);
efcd71af38be40 Luigi Leonardi     2024-07-30  229  
efcd71af38be40 Luigi Leonardi     2024-07-30  230  	return ret;
efcd71af38be40 Luigi Leonardi     2024-07-30  231  }
efcd71af38be40 Luigi Leonardi     2024-07-30  232  

:::::: The code at line 228 was first introduced by commit
:::::: efcd71af38be403fa52223092f79ada446e121ba vsock/virtio: avoid queuing packets when intermediate queue is empty

:::::: TO: Luigi Leonardi <luigi.leonardi@outlook.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

