Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62901F9D9;
	Sat, 24 Jan 2026 03:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769224017; cv=fail; b=EbpHfXXvp5p52c8awij4x/53O2Hyk3vfKG7Pb3bUdjJOWt0Kel8GEXYhav+Ij9lf6eh+kVUqsyF1N/ut/qr5fkI0NTOfqVnDdP8F8oFgaC/pPUVrXPyaFiXEAslp4TjhWtkttq1HHbvcBQX3EiTLC1oWwhGuCpstyXkh424qwt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769224017; c=relaxed/simple;
	bh=+VAI8VoOhD4fflxEujydHDXbtdmB7O0AVLiQJMwPMQQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZXMB7Xy7qoBCca9W/TNg99b/7vDauSfLLy4+JwIss4eNub86m/9vu67YX4OySnkzOizHh1OBhNxXlFCQ9Z3VJYeGC8IQeeuOr4ZYYfVKcGxeMtR2e0l/pb5Hj0MlrKUL+MFv1p+/LLso3V+nT0Lbv1BqruvuMwmOUbuK1ngEWxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lC9+fIHW; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC9+fIHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769224016; x=1800760016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VAI8VoOhD4fflxEujydHDXbtdmB7O0AVLiQJMwPMQQ=;
  b=lC9+fIHWjXZRb3/q0Yr3TpHK5hr5Z28zLW9Ii0n4oCB9qla9xVZxHGEo
   DlJSdUpaQvN1Z2N0lOtVWqA/TT2snVAhwzfja+K3bRczcMbvG38KU2lL/
   aAMGxE/nvmcHlt+XiG10u9yISuLvSFzAOBoL8J608/ZceJKUyD6ZbVmNf
   xBiNX2Lj9K8V+2E5c832zMGJaYRGJNAKp4Grq2I9bbBJjom0cFaCJHGHW
   +UQR0idfLeE1WzEOcme7yGBw8WctPF3zUigeDqv15KwyMxj9BhkGoP9ql
   DJerNPq14mvugbvj0qEWlZ/MlMDPe2VEsytb/4s2DkEnedhXyLMS65jf4
   A==;
X-CSE-ConnectionGUID: NwKTz0FFTFuL/QMbPRTq6Q==
X-CSE-MsgGUID: 10yCefEYQSmO2nuuMjVQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73063372"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="73063372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:06:55 -0800
X-CSE-ConnectionGUID: m6eiV8GcSfCkLVJmnhZ6uw==
X-CSE-MsgGUID: QeEYIas0SnC8WxIzIAgpuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211681420"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:06:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:06:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 19:06:54 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:06:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDoq9dmXT9ljg4dxd8MAxur6z2jYqOMcj2HRX7H/gbBiMfgXqrSsOrxcYvPr0LDDcFQQVIu4BvRsI4gQ2EcHFUkqR4Bd9ykX0za82hSzYnRJ+8X0WgfKcMK5LbEQ1XQKA68ofJralXlq7E9hwE9TDXsy0zwM2KD3LEKIi40Ah827OvO8KnJUPpcty9cNufr4RCXgyS3fzEGQKkkNpH9hr+Xi5GTGcZ25opIjjmF/FZT3aPb9ClPmPulo+oEPsb6+s+yEfLj4H21Bn0iQaOJMQ6KovYsYxb14XG0UPXOX3lM7d0M17e7L/5zynplk/DeBPIKDiKwWcm44/JnqRgLUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV7aP1ggpm/cbcEMDVu02X9kzRxvmVoid8X8iuZvZLQ=;
 b=lQHisMXFQqsvLBHzsz5l/ncUrpknPQJXfgu9opGfmQ01got6+c/EY2A5fKSppJoGA9+xlfjAKkwQ5yzNSjpT9LfDg6UvCtKQB5EX96gQceqfWPBLfSnSY0cCdlg0q2seCHmXWc/L2Tb5epxTgLQBH+fb41GZ7sz79N+uHDW8Gv8bT802/iaLcv2ITXWNY+CG/le8Nqpf1/zeIKvrHApWC5OYruYuM1WdDkfv5qokS3jwGfSJGbA6PL+8RKGd5ocdAMr1RqMF7lrXxy6C9I2jE7Z0v2CXCfBqjh+h730qKIlCHzzn9EsyxPvPdNCNabM5Wxe8+2gs83eqgoOP2AZdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sat, 24 Jan
 2026 03:06:47 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Sat, 24 Jan 2026
 03:06:47 +0000
Date: Sat, 24 Jan 2026 11:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] clang: error: unknown
 argument: '-femit-struct-debug-detailed=any'
Message-ID: <aXQ3P8LxU7iFTnG2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a89522-3617-4c7b-09be-08de5af59cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kyCFSw+MXORVI7WGmC0ie7KGz3fdjM3cFzaUqD92SCLe22mTRz4o4rbzLzVj?=
 =?us-ascii?Q?Yk+jPmkclf7A31VHRaBELapbPClLk0Tgx+RWmbmS3tztUQxJHi/anha/JNcN?=
 =?us-ascii?Q?akOdVz8nTz9MhyZas1d82vZ9lJTF4Nl4SzXvCTFmKF/y68KPvq3F1nX4R2AB?=
 =?us-ascii?Q?Ou//JKp/dQAjvZDdmfMIvW+JczXHFzKlkaEMCGPu1BI1MxAFiElXfXLkuCDv?=
 =?us-ascii?Q?bk1PcbtwF/mlxBDYAiuXzkjvE7kj5ddZdLV+JvFevO99kwgLpSd9j4iCSZLA?=
 =?us-ascii?Q?479POPStcHLiqGhZJ+qQhDlNzFifryKohfREAqxwOMxPsn8gARWHW8Z71xq3?=
 =?us-ascii?Q?05Zfsmt5BTHQAL0yQmDmepPUsQpbGA5uOMBuYWB5cr/SMD85W38zxyya1ls3?=
 =?us-ascii?Q?PkP1KdT+67i+jm98EYT6eQ5vpb9yPY9ezIviLvOBH8qYxYIR8/9L72rA/IPR?=
 =?us-ascii?Q?tSB114b7pq/3xNo4B9Xam0qY6d5Ul2MgPa1nbb0i32LwpJdMkytXy3aUuXb+?=
 =?us-ascii?Q?cvgHF6I72pFHfA7D39jxgPxM+OIpQHpyPVoCH9dC+ZL8kuj4eX25TbUFhZaI?=
 =?us-ascii?Q?NWyHcM8xI7CjbwmSKTehqMZ8DyzzFr65jPA+VSbisUxuWxJqqDGCH4812kD6?=
 =?us-ascii?Q?M5ZN2f2dY/Zj84sVOOUt5l80WW0X0hSBPBo3CVXkbjvlHNxNmBlgA5LqlBIj?=
 =?us-ascii?Q?64MPPUd91BFhgOXhrkwHMrXd+OCwj0M5YHEKkbtY3iSAgi3W/b3ofOgWZPCf?=
 =?us-ascii?Q?xGHHdjplFJG+5PiHT4jV0T1esNY4D6qaaD78UFODqGQpGLwRAfsAq4qaXJU0?=
 =?us-ascii?Q?FYGqNr0p+RQ5Y9iRs0wp/PO2NFuyJuUc52YqGYcX/ufZ4snPLKDfFyga0Xyc?=
 =?us-ascii?Q?TijvcLmPm/Y6heR95FrbMEM3q1874HoCLF5K01j2XwVdVBrsRcVj+wFrJD2b?=
 =?us-ascii?Q?OnXxVgnKMAloUz3BG2AhBpkwy1UiWSYi20BQfQqmYhAJ+2cbd8NXa/uUFfh/?=
 =?us-ascii?Q?VJXEDDa9AKDUkwmWLkZZpCM2G5hLg9SSh6li021OeiVXix7qAuZKHUkV9IJ1?=
 =?us-ascii?Q?x/AiRKF4HBniWKcFIm/WicqcY35kKadbkOdM8ZerY/Y+9O5ZxPtPAqWD4OE8?=
 =?us-ascii?Q?jJHU162ieVMl1Z9oH8wor/ZBFMwlsTkFZc4tz61W3juywtyeiUV5WD8uQBIt?=
 =?us-ascii?Q?ta8NLMXGhpSH+LtIdgx9z34MHpu+m0CgotPSpmg5pspWmyfKIR24pHUwT61r?=
 =?us-ascii?Q?iiZZR3VPWkFM70N4IB1bLe/bBSGQ7mJg2VlwBTb/W8YjsrFgzfB0MjTrAIn5?=
 =?us-ascii?Q?ISgylXm9R0Ly78t5aFWP836ci6RF7ZOm1NVhny9NI5SUztziDGDztW27RmcF?=
 =?us-ascii?Q?dHrU9fGXdas9yJnJ/txxwEOUF6yKpjaJNfACLgL47NdQLxERqL6DIir7+zgy?=
 =?us-ascii?Q?XRMue00D3Xj95qTr1qLuMDVG5WQzRx1zZlLIfTWe+mwHSSQHp64BuyKPr8/i?=
 =?us-ascii?Q?x8s21bcvUDN2oU2RSj2Y2kS7D35g/Yer+MkIQi5/Fxnwh74ecAzrlP4Kz8wI?=
 =?us-ascii?Q?so2TxNqhxN1faIvEGGZfEbCpUqZ47kaVvRmq20yY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y5GvRHq5CWIhBx2lA+vOD0w0oacemCKQpTrdkRU1h3bUNKpkIdJniHwDFOnr?=
 =?us-ascii?Q?P6nccnyiDOJLEhcgSiY03Zm+wjMTjAs618Rk1B9m/lO+22D44N2HqMj+f8CG?=
 =?us-ascii?Q?mZD90IW7gME9sjiL5QLFFBCMsywsaxsnV/rvBAHWGCNmHLTegtzOscYrQf82?=
 =?us-ascii?Q?i+kTqvxvT8s2Bo3iHuUDQmTT4zoMeiK5knJceQ/u48IZusmWVP39RKSap2OS?=
 =?us-ascii?Q?LF2nX91Mnol9AqMmHWK1bxRogUHKxALVTtGvexWlQemjRl5OIq/5YhEnPQuL?=
 =?us-ascii?Q?Lgb+URsevhVNCeSByjFJMH+dZbGmxVT7ZDuaWhNa05bPqMZBdC9jGvKssKq3?=
 =?us-ascii?Q?EwNmFB32viPzZMgW/7/DanqY62VyJSMyG0OH8SUAY8WqeQhkwQzpjzJWbx0V?=
 =?us-ascii?Q?JN44JRuvkgyZC3528BlHhZvVTtBEFNQRG2VRlxpy1WV/VGsvsbxDj1mzSasm?=
 =?us-ascii?Q?CoKrXq1ihq4V7I5VjDCpAHb+L2p3AlMYVeahut5U8wMEGl5jzJtrKSVmSubh?=
 =?us-ascii?Q?/kG/HfrP2FV6QnP6MLu3WpjyKheYFuNyCxkL8XX8iaoQ89xkK90++h1HHYYN?=
 =?us-ascii?Q?JaZZyK6IQB4WccBBZ6tUFOH2rNUuKLMWVw93m6gw82mD/wieKYGihvdNitIl?=
 =?us-ascii?Q?3mSc0IZ0sRj1nG+RY4nHukMzu0Q4pX8CG67ooHt2vF5G2oMgiRKXlRvhDQ8v?=
 =?us-ascii?Q?ptsujFGUZKVi3447oczhIpMvlVp8G68DzFOmLYYy/YZj2B+Gf9QlgBZIVI4E?=
 =?us-ascii?Q?cSwU+p8nhj+edQvPW6YZ0byCCBLV5gmpF/CBfEuop86sBq9K5vpZnNhrGwSg?=
 =?us-ascii?Q?GrKWeuAzKf4FhDqCSAicUfSgSPcfIkt46f/rcYKpODxEdmkbcxONoYsiK2pg?=
 =?us-ascii?Q?rETpwKejiM9IyMxaWFe4r6lLCX7Mvitm4fyauCrfWRSu6Ppvc9SHZSZmH46J?=
 =?us-ascii?Q?WcVhn4X6kd36lSMmAXAUUDflc4i9DLzNBeyA3XX+L4lKdMGs76ppFwLduzmH?=
 =?us-ascii?Q?wT75oqPLt8Wu6wv3mG2Esa+p6BqArsJ5JQSmTUBPkhhl2wM9h9vE1WQi8yib?=
 =?us-ascii?Q?lVn3YZpogChqXusrPxkGlZvIEy159lQZYIzsV+oHQ3UObB47Hm8tyI5CYrrt?=
 =?us-ascii?Q?3qTYgrtDgoBDloOS3SQ+5GTfhffaT3jfbQs8qiUMzmF1XjnOY3IMTqPYeo46?=
 =?us-ascii?Q?spiOCW7tyfhUpu/1a1SsDG4i22xWNjFhooMb4hBPp7N107gt2vrq+4YbkFwV?=
 =?us-ascii?Q?u+DZC66eUvIPeQikw9cDyKhtNhR8FXwI9FB1Fx+gq1+MIUpwJnfAk9XHPM1C?=
 =?us-ascii?Q?W/v6vk9Q0PlVtetIfSpthoFuH6Djs60WyLyBUNOW1c5vUB9hGvz2WZKkTaST?=
 =?us-ascii?Q?V8Vxu1RD78L2fkOb5PHlDYDeMsgkxm7N6t1l4z33NC+XtMwIZgYICyx/w/QT?=
 =?us-ascii?Q?HqunliGxFBwp+qMJ1iz5NDyLpVT9roxh3XXAC+1XDeyTD9BxBhLv6OZZdNzk?=
 =?us-ascii?Q?0XCk8E9TKVs/TJUJ90jaNTdO7n7v470Yzbd8JGtLA6Ovhnb2mF75U14ZbKAg?=
 =?us-ascii?Q?rB30f0tF0Oe7PM5WBSQrVsn5dqjmrYCVW8+PUiFWsTvF2FSjkIcvrq8M5E1U?=
 =?us-ascii?Q?rkK8FqrEPbpwO4xja/eT6OOk0TPFQG8vWveHYDJAWCgHcz0NvkpzKR3Sa40q?=
 =?us-ascii?Q?FeBsnfkFDCufqeEwwP6tn0qMK1KDrT/Rq8gYBnu4h3gIPVNe/WfeEFWC3uHq?=
 =?us-ascii?Q?Bj2oeyRhXQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a89522-3617-4c7b-09be-08de5af59cbb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 03:06:47.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69NpzfcLiNTkyqGUSbMiRpQBkOzdFSpA1XC3JOTb2Ikm0qF1iroh+3XZQRE0yeMwI+I/4J7YH0ariupnrnt1Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
X-OriginatorOrg: intel.com

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260124/202601240506.8hNhpop0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240506.8hNhpop0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240506.8hNhpop0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-femit-struct-debug-detailed=any'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

