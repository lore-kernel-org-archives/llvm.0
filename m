Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95783CF677;
	Fri, 27 Mar 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621736; cv=fail; b=i2Bhoh1Dm/2Z4DUz/1xagOlwe0rXxCfx95ls4aV94mn+3pQYSMeeK3XZmap4h8NG8UdnNCbpLeUm4+uYry2yD2sHi6zB+wsjFckHplvyuhKokLGStpMQwK91iJDR7+/ixSrdFOyfIRQPxUb9dj9VIdqopqQZIzGO8LM6hsU08cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621736; c=relaxed/simple;
	bh=bgj7TGsUdBGfZA9X7bLtAbAPx9imXUAk3f5d8xrx+C8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FYGthEoljszj4SaiDD4nBugtgzU3tztuNY8Wzn/bW1X6yoallCc6a9zFAOAwrEBnVrcKq8UB6ZuoTCfdqYtxZe+ogXrLX532sZDpHOmWp5DV0OzfKUx6HZkXddNafH0YqlHmBKhHPUKbo3UGE06IVb9A3GTZNklDmvfvgcQXlZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVihVrHo; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVihVrHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774621734; x=1806157734;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=bgj7TGsUdBGfZA9X7bLtAbAPx9imXUAk3f5d8xrx+C8=;
  b=AVihVrHoF4ztVWj0JeAFOJsR/GF0ggzh4EeSlsPTWYAMSSSzTsBcZ7Zg
   nI/ht9R03FY16Cm0KPd/BBFFvOkCGhmFA2dorgDp5EhtjXRLypUmPki2Q
   61MSIe83D7EKAO+hveWLMl52131wgYNmYPe6EnncEaz6vWz1inCQaGGk8
   21AqAb+5RlAgXYa4QFhiAnej7Sod9EBCxPYIETFjdNB0oCu6ECV5hkeOj
   juExH4cn9GNwQrQXD7yLpxQQerBeXXHzzcCZGYPOvZivFQea2d53aEI2X
   B2yx9JSf/u4mzO9MKjRdz6oQGC95CkAcN67qNCpRJv0HhF5+ynichKueF
   A==;
X-CSE-ConnectionGUID: SsJSzYsFR4Kh3r7xtgfoDA==
X-CSE-MsgGUID: fdrJGX9xT6GCTF7xi4+VWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75576469"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75576469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:28:54 -0700
X-CSE-ConnectionGUID: IDhCDQRAQfGgW4GZxlKA3w==
X-CSE-MsgGUID: Iwnc5199QdWIitDtSusI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="220485145"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:28:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 07:28:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 07:28:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 07:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUhfuDXDinhqt5fraqyAWPIe+zG84AwcAnsMB6i3dpYib8OE5D6jz2VPaAn6bnqhXyEnMSW+69QUnb3Y2UOR9nNmo+XKkUD9x0Ii0D2wqeHhA7DVlI6xhZiHJD0ulYqUE2FJr4UZBu/hTICoPjcMsFajofH49+unQqZ58iYFxWMdY9sBWlVcQHPLla+XDAo5sD3pBMnH8p8Rx+nKU+Pn5TcRQVZrV2WrpSYQ74RCmpRIy/n8GtSTQ0c0VXjQiMZDhYNWejjni1hXtzUp/CDiV5ouc+zIN1W2V21ukFRxNSk80DrdFyYqPwWVTrVxIrf5BJM40Dv238sQmdZpsFfuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbCM1VKeplbyMR9QHLKgUlTy+h710F8gB6uwHPyX1SM=;
 b=B2HHexEEU+pVq6SmzMGHhAZAHKM8w1bt3yKfyzTy9hehPl9et28JBfvCnVpkbZdASp5eGpNzTyiU7Z2x7WnV4k56Yn2azlcScQdCFmcgesG6UhSoU19QmEyh2g/F+8cFFLYpJi0aMHwbPMDlf5kDNsGps/rh3Oq/laArKo8VwFZ2XVowoMMpTBYxGN9y1brC89Kao8QVhGk6yL/8442u5eZPq4emFkim7ANMRkMelshmLyTeDP3wEZgsE4XIxRxb/F6V9UwVvq4oohud7b31sGuvtlWBv6Bt/putCFv0w4dYkjSau4L3GVeCAwQXg0lBFd/kIFIJop/pyVQ7TsV2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 14:28:42 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Fri, 27 Mar 2026
 14:28:42 +0000
Date: Fri, 27 Mar 2026 22:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	"Bill Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	"Miguel Ojeda" <ojeda@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Boqun Feng
	<boqun@kernel.org>, Gary Guo <gary@garyguo.net>, "=?iso-8859-1?Q?Bj=F6rn?=
 Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <rust-for-linux@vger.kernel.org>, Alice Ryhl
	<aliceryhl@google.com>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
Message-ID: <acaUDeUlB/mEPLvy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: d26e61c4-eba8-494a-ec76-08de8c0d256e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4gftaxe7gLQDcbXl2PtwIwaLuNpCkEZGRYmIM47ilk9lubITtgHg8OpK6j/YpV0+AFpsCfN3Eb2ggQMdoWpCGkTnLunSb9LbvZZRq0Hnkd0BWbTZOuZU68Haq0ePF49VooK87viss17PlrfZUlsNa2LfwpwfedjPMUio5antc/xZyjYBmeW2vRbXYUVw9UB8QcHDrW8QrTU15PY2C7U77Bvt4p+gIb6ZmygmHvvQnaoDVciIc8Q4VnCc6a+bVsYjPKmkz9paAy4JudlE+KEl+fhlXrpJ7ri38ffrDNnrRmZW1hKl34bQkk/eKVJw2J8Gwcw7ACt91YQX211q9LOVcVy02AnB+oRGw2vjtNYRsxmbHrorEFjE0H2bBKsl8lY4qb1SyWyKi354NyZfpxc/Hy19wK+HMUegAqusoD093yD7kUDkH8kmQ6gni/voxjv/WplhgjLNTmab+WG7aLABvW0MRve2EN58pW5oubBM2K9s6zvQ08ooPld4B6L1VgCD2x7zqvRQqzWM28J4T3Cp5W8ZUf83kDH2rwNWUwtfbbTk/NM+IzLzJg57pKQ5+t2d1/bBq6gneWUbYOi5IGDoRegG3f0r1hv+sjflsIKJ2BmyAYhu7UTl7TAYI4hn5ef6pejxt0BdqyF3q4dK1lcGUhbJbu+nZIN05ub7FsimejjAKoZjC14enRnOXnbjb+/COw/Y8TVH41NdamLS5RRVxYrYNGiotaa2sFv1tKDZkz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jfF9KY6k4/KYW/aBmPwM1yvdqPnj/iSeDOmoNF6y7EXdoao+vDJUcqmidudS?=
 =?us-ascii?Q?LB9Dx0jqFES+rCNxY9tFtTf7KXyHZDSzNJYUt0v6nZ1uALS/XLmoILAFHc4T?=
 =?us-ascii?Q?TUsnksglAqpIVmjdXIyCXG5Wve3YQJhRrQCPpvhdLaqt8nt4HjaRsl7mwJ2s?=
 =?us-ascii?Q?YONl9RSL1pEoyJ2MqhpyHAQTyDuhVktuMoER1gxy5Zj9Y37rvidY1TNAEDcS?=
 =?us-ascii?Q?OyhGKk1COkEvsxFheK0V8kP/Xn/uiCBF4c97jnE+gom75eAu84SZRvBBONmJ?=
 =?us-ascii?Q?/PfSkbyH9GeUKbFiqJXnDrfztIiLmIgYnAMCxi7KtAqvbga/Qs6Cvd9X9y5f?=
 =?us-ascii?Q?wXzPFfX++/h2+Z5O6Yg7Jnr3NCErB2TUUaqILkYin8yADa2SPpI3uZQILN7u?=
 =?us-ascii?Q?3adRH/LtZhp36uQq/uVea3cDQ2sFwsjhDNy95ym2Cr24Dk+p2Gt333+eBgaB?=
 =?us-ascii?Q?jFlzsXMjafkLA5GUmQJdj+loNjEQlLWRTPW8P6T89rZrvzXSOMZMWT1qR8lg?=
 =?us-ascii?Q?U7hqd5wUDNmePKAmxO3ZhmyQqMZp81S1O/tMkFzcU/pSiXvdp+a3khlq1tPZ?=
 =?us-ascii?Q?ZQs1nizWLBRaPnBFLY6ujSyFsWm5IIarwkOJfj78jUU83odMOK5lDtLxgbJY?=
 =?us-ascii?Q?kVcJRSaDhFLKMgOduJhuWrlcg4BXg3p00vYe2dT0TrttfAPWHr6ESrnKVFc5?=
 =?us-ascii?Q?aC8/sXjGwPa0xDk03mGwgpe+FcMRY1vjt3s7/6d/Swv6rjnIsIGGAQd7ZZYN?=
 =?us-ascii?Q?YFvSIuJl2nf47t5BmNiL/i0Fizcdt3EdqgnxwhN/eUGB7+uxUsBj1wFmPPEo?=
 =?us-ascii?Q?DQmNI3gZ1R1n8hL+SPDQo8/t/bsbW4zIucCMX28hlXlr40vY538kngzAGsHK?=
 =?us-ascii?Q?R/I9Kqce6VHAr5Ni6HHXGq4Jz86D4FbfoUXcZX43rVR0w1+EbeUUF9pgezhY?=
 =?us-ascii?Q?2KzPtPRjZ/hOetV+wXDrwSivvaDSxwswSVf0TqRJMbGEkIcP+JxftxrvURYc?=
 =?us-ascii?Q?wMR2h1LYJ5PCA5XAIrrsBQIJZFUUQ8iYZaKWG8KwkD0hQjKdBADSq/xGXmNj?=
 =?us-ascii?Q?m3f8BaxrM1yuozZQdHWui1L1DC2Dp8pw9B0M+XVPobr6zhVV1fYvx9j9XdoM?=
 =?us-ascii?Q?rmcV5ofIMeK3W+mAt35iUVqKknYEiLsAtpqORxPKpD9GrHnZTI5fgQttGNu+?=
 =?us-ascii?Q?8NSlokUTTxrr3lQwOv8Pe6zHPGXka2LYdaZBgdUXi/M2/LZnrdS58mQgeR9/?=
 =?us-ascii?Q?3szaViDduB10430YfSVnSt3eft/LQUqFg0JdQhpjT3xm7sblBH4i+bZDcszt?=
 =?us-ascii?Q?EUFFUTDgK74cP4f0pgiY68ZKKzRHN1m2udKBCLeG+CyHgZS9uNOPPlF11kBx?=
 =?us-ascii?Q?m+tHfl4gzFHHzEVnsyNyVy38kVZmDnckwDyUgbzsWEXBsHVGV9LB2cMnDAy7?=
 =?us-ascii?Q?zv0rZufmhytY16FZ/ITU5KndhzcDiKUe1rw1RNymOLMMYNnsfjOnF1z5UFmO?=
 =?us-ascii?Q?uYusOgtaebID7Dpy/Jnl9ZSjlDaBa8JZ5k5+8JvUdacMKugerLgEQuv4qZOd?=
 =?us-ascii?Q?hJQJEQyEq+WQ+LsjWghPMD/9XbhcaRKZ9Aj8v7+NCqy80DVaDjoyVAUioc4m?=
 =?us-ascii?Q?jgzw5rZMb1lMMiZG/SPHTCwMAodYyN9S2n1S9a2BkYLKr/51NtaPBjx8ZQtM?=
 =?us-ascii?Q?m384iFAMpzx7fcWKa70+gwLmoF4PEhyuCWS2QB04mQev1hiA+T1O/DF5lPfZ?=
 =?us-ascii?Q?syRxVaMvow=3D=3D?=
X-Exchange-RoutingPolicyChecked: dpHm15D4qHofUZqhqKYGpRrby2WWhKWacb9YEhJn8WjPHB6xL7KmczlcJWss2hZrrR9Bh8BKjpD6EEEpWGk+oVyYyUqD4kMGOXPxiy25bW/xuiB9OyBqvbYEYZMEm8DVUWyvB275Q3m9iSMJaPr+F/2FGU4mSgtZLNrznNSri+c2q6N/Gct6xDGDNcSO3ALIiLRx3Wt2DbU07SHlWmCC8jSsguwgOORiRZYcSOD8P63iBGTJuxlRR7W60dDlJqQ7+4GsRSQYWjLNii44wUmEzR9oUvgw4jgvx36DFFoJTOoeMYwJuvw6eA0FZsmOI6wqTRsvlI+Bi/IPv++h4z8Svw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d26e61c4-eba8-494a-ec76-08de8c0d256e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:28:42.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAXoEsIvHssd9EjThMY6tZcSMg6lYi2Jz6MY5G2fPoBCxENiXxvB6xCtJrbsTHoO1N0U/h9q1bK02GtDCPWuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
X-OriginatorOrg: intel.com

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-kasan-do-not-pass-Zsanitizer-recover/20260326-213339
base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
patch link:    https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa%40google.com
patch subject: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
config: x86_64-randconfig-071-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271853.RhfDTdOp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271853.RhfDTdOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603271853.RhfDTdOp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __asan_report_load8
   >>> referenced by kvec.rs:847 (rust/kernel/alloc/kvec.rs:847)
   >>>               samples/rust/rust_soc.o:(core::ptr::drop_in_place::<kernel::str::CString>) in archive vmlinux.a
   >>> referenced by kvec.rs:847 (rust/kernel/alloc/kvec.rs:847)
   >>>               samples/rust/rust_soc.o:(core::ptr::drop_in_place::<kernel::str::CString>) in archive vmlinux.a
   >>> referenced by aref.rs:170 (rust/kernel/sync/aref.rs:170)
   >>>               samples/rust/rust_soc.o:(<kernel::driver::Registration<kernel::platform::Adapter<rust_soc::SampleSocDriver>>>::post_unbind_callback) in archive vmlinux.a
   >>> referenced 3034 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store8
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_soc.o:(<kernel::platform::Adapter<rust_soc::SampleSocDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_soc.o:(<kernel::platform::Adapter<rust_soc::SampleSocDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by rust_configfs.rs:86 (samples/rust/rust_configfs.rs:86)
   >>>               samples/rust/rust_configfs.o:(<rust_configfs::Configuration as kernel::configfs::GroupOperations>::make_group) in archive vmlinux.a
   >>> referenced 1783 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load16
   >>> referenced by num.rs:648 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:648)
   >>>               rust/core.o:(<u128 as core::fmt::Display>::fmt) in archive vmlinux.a
   >>> referenced by num.rs:655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:655)
   >>>               rust/core.o:(<i128 as core::fmt::Display>::fmt) in archive vmlinux.a
   >>> referenced by niche_types.rs:100 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/num/niche_types.rs:100)
   >>>               rust/core.o:(<core::num::niche_types::NonZeroU128Inner as core::fmt::Debug>::fmt) in archive vmlinux.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store16
   >>> referenced by option.rs:1279 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:1279)
   >>>               rust/core.o:(<core::num::nonzero::NonZero<u128> as core::str::traits::FromStr>::from_str) in archive vmlinux.a
   >>> referenced by option.rs:1279 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:1279)
   >>>               rust/core.o:(<core::num::nonzero::NonZero<i128> as core::str::traits::FromStr>::from_str) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __asan_report_load1
   >>> referenced by c_str.rs:416 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ffi/c_str.rs:416)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Configuration, rust_configfs::Child>>::make_group) in archive vmlinux.a
   >>> referenced by c_str.rs:416 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ffi/c_str.rs:416)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Child, rust_configfs::GrandChild>>::make_group) in archive vmlinux.a
   >>> referenced by revocable.rs:218 (rust/kernel/revocable.rs:218)
   >>>               samples/rust/rust_driver_auxiliary.o:(core::ptr::drop_in_place::<kernel::sync::arc::Arc<kernel::revocable::Revocable<kernel::auxiliary::Registration>>>) in archive vmlinux.a
   >>> referenced 890 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store4
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Configuration, rust_configfs::Child>>::make_group) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Child, rust_configfs::GrandChild>>::make_group) in archive vmlinux.a
   >>> referenced by result.rs:2050 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/result.rs:2050)
   >>>               samples/rust/rust_configfs.o:(<rust_configfs::Configuration as kernel::configfs::GroupOperations>::make_group) in archive vmlinux.a
   >>> referenced 539 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store1
   >>> referenced by atomic.rs:3845 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/sync/atomic.rs:3845)
   >>>               samples/rust/rust_driver_auxiliary.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::auxiliary::Registration>>) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by atomic.rs:3845 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/sync/atomic.rs:3845)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::pci::io::Bar<16>>>) in archive vmlinux.a
   >>> referenced 356 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load4
   >>> referenced by lib.rs:1300 (rust/pin-init/src/lib.rs:1300)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by io.rs:261 (rust/kernel/pci/io.rs:261)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::pci::io::Bar<16>>>) in archive vmlinux.a
   >>> referenced by io.rs:261 (rust/kernel/pci/io.rs:261)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::sync::arc::Arc<kernel::revocable::Revocable<kernel::pci::io::Bar<16>>>>) in archive vmlinux.a
   >>> referenced 320 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store_n
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced 105 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load2
   >>> referenced by pci.rs:372 (rust/kernel/pci.rs:372)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by pci.rs:381 (rust/kernel/pci.rs:381)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by pci.rs:372 (rust/kernel/pci.rs:372)
   >>>               samples/rust/rust_driver_auxiliary.o:(<rust_driver_auxiliary::AuxiliaryDriver as kernel::auxiliary::Driver>::probe) in archive vmlinux.a
   >>> referenced 54 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load_n
   >>> referenced by mod.rs:3753 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/intrinsics/mod.rs:3753)
   >>>               drivers/android/binder/rust_binder_main.o:(<[u8]>::copy_from_slice) in archive vmlinux.a
   >>> referenced by mod.rs:3753 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/intrinsics/mod.rs:3753)
   >>>               drivers/android/binder/rust_binder_main.o:(<[u8]>::copy_from_slice) in archive vmlinux.a
   >>> referenced by mod.rs:864 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/mem/mod.rs:864)
   >>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::range_alloc::tree::Descriptor<rust_binder_main::allocation::AllocationInfo>>::try_change_state::<<rust_binder_main::range_alloc::tree::TreeRangeAllocator<rust_binder_main::allocation::AllocationInfo>>::reservation_abort::{closure#1}, (rust_binder_main::range_alloc::Reservation, kernel::rbtree::RBTreeNodeReservation<(usize, usize), ()>)>) in archive vmlinux.a
   >>> referenced 81 more times
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

