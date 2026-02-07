Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08EF21773D;
	Sat,  7 Feb 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466620; cv=fail; b=XmbZcBxeueR8p0nsYxaxaP8bjgtuwdjqC+FAy4MPTUqT+/91d4jXovC6b9ju73lt82N/MqOcW+PxRpb1M44JDTpkvCEzyAvCiqIFbphD8uWGf1Q8AOlzF9auScnVRMc+A46SE4+B7gUxYnGPoqcH+mEYfc3aTiJqPJK4EuamePM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466620; c=relaxed/simple;
	bh=U/SuWLyF9n7NktmkKlIgHgtcwPUhC7iXlVaIxnR3+zU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gVW3PtRAMTvvJUc+JNEUXc88n1ooeKGtLQYODMPMNRsiGwHABOUcLbXrNNVTZPhepKIssWi5ZRCQN0MgWWJ274F8f5H7/a37tQ9NS/gF87NCvqo7vpxFrJ5O5prPuO4bVUuaXmA1dsthKwoZYyikK/oOq3MmYHIxBaXxVNZj8xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4qN1Tcy; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4qN1Tcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770466619; x=1802002619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/SuWLyF9n7NktmkKlIgHgtcwPUhC7iXlVaIxnR3+zU=;
  b=h4qN1TcyqTMg0kOKaRTAkY1QWIS8D6mXRiJk4buFcRtgeiggJaelQTFe
   74ltzdHDPPlkWSka4/3a804BReLVZcY6VtObl3Ndve4FQrNDD/WZ4IEN0
   zhSiSTQIlIFY5GtRYMEnG2aWFdaT5/75DHUXr9GMn5f+gU8uuF3xcTiaE
   uEnBXLIoHr5n4dy0l0wj83xJ+hypG30cmRHteulaT5svuESGt4miOPdNY
   w82crhvZyMTGMiyKTza/VBjqqyPeEd1/7qHCy3fPt8K8nWZIdK6J7r6Ro
   Iq4AG12mHhMPL9C+Ju2fCL0Fv4/AxZJbURm9RGeuKvmkkc7OEodGoQ+8z
   Q==;
X-CSE-ConnectionGUID: lzTwlBe4QweOnr2Ll7Q/Lw==
X-CSE-MsgGUID: 1O+Fw/TlQqmmgcYDPrl/Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71554791"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71554791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:16:59 -0800
X-CSE-ConnectionGUID: 3WX86munQPmy4ymHdkPGnA==
X-CSE-MsgGUID: O7yrH7CmTGamcfWUfKSwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="215638984"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:16:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 04:16:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 7 Feb 2026 04:16:58 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 04:16:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYAVCq05p+bX1mJg9lS1gEJFouhCOjoLI6MUqKt4kwbS1SCfDL46HWGBTDMcnPmi2SdzLtWNcI+ppyMZ6h6k7Mcd7KdX+pgRFwUfPco2pGm3HKldLqISn3jxNUGts1MGDivC1aVcu0XElOABeHkrkdr4wbykS5+KFlQxHpe4ooZTDhKZeyLxFoS1i+fvh0t4DAb/eKPGKrnnKaNeKHbB9O6vu2TyykyVZv4Oocw5JL7w14bKp8aVRDkA+gvSTfv6Tf2+ZmF/kTqCdwIkIfaq4oyNenqwTKm3K/MsmJZOCCtdqFAzro1sq/gxyH2oT3ICPqHok71tAD2aUYyUJWzxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUJHS1cas9JIRd5rQwSklqqjGtEQe8o9CiR+iGtGUPU=;
 b=eb2tyAi/a+zeKUuq6hL1Id67+SIp9Wb2yYYMgQEvtzXDHVzt43kdSjwdwbSJeYuEqT+kJ+AxHoZ+mJi75N/tmEhME1MajLmf+MgI5QuSfcQSZSIpgX10qRGYcDpykue2dQhES2fG4YIc4zknwMIX4GqZJio+GHO7Cu6G0/G8CRdee2g8g3fuGYFHXke5F5KGS629xm6Ax+o4PWhNcVjNxgquOtJFNxJ9j+wDL71EO9b/+odYdWWbtp7LydFMEWKueQ+1R/EKhw+k7z4P/3YtE7htLcp4hdOZXYhaiRgBAZjgtQGTFUu4o6+S7x62mdvZFzpYmkENKfNV9Mg6gzpkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Sat, 7 Feb
 2026 12:16:38 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.010; Sat, 7 Feb 2026
 12:16:38 +0000
Date: Sat, 7 Feb 2026 20:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 8/11]
 ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarator
Message-ID: <aYctHqvb70TJ1LZA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM4PR11MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 20078b9f-17ec-4570-0f37-08de6642be78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izEQhFwPXIROfGjWwxF0WuMKEJ1HOOieAlXK2lOt+cFmCK6mXM2Rqyo3SEmM?=
 =?us-ascii?Q?l8STXgvADE6ep1qJKllTU3NvNEs7Vnqa4dd8yHOpRdhPQ/D/1gLG0O9u9Glr?=
 =?us-ascii?Q?IMmsfxD8It/aVmMq+RIFrRGJEjBq7T927FdWazhknoesSe/Z5K6VWWO0leH4?=
 =?us-ascii?Q?/1foFINlvA5hP6/o03bEqr5MM7o9DvRi2ml+z7p7rXtHyQZlH/PfHckNBYav?=
 =?us-ascii?Q?9w473K5l/WVtGWRF38+S9XPO0A08TOhXn+b5iK/gOMLWNjSKD6ZvujDXkhcc?=
 =?us-ascii?Q?1XTyyFaqY5VhADCG5x+ph/6BheQ1Hb91vVHF7QBhU35vhLUwmwqG+kayw6gC?=
 =?us-ascii?Q?uDlauNeOtILm7CcwsJRWjCTy1qygsVErKGxCrDm0s1jE0LaR1Yz4ybKDFL3F?=
 =?us-ascii?Q?3DE05CBqT4KNlZ8AIKKk3arzmkitBKTv+6UjhzVBP8pfmCFBFC0/ENuaUics?=
 =?us-ascii?Q?rnHk8gEAHEjznHalObO3JSqKSaDi4MHyIOgBs06dn01q2NVwIXyng4jInA6i?=
 =?us-ascii?Q?X4Lc8As0xTtK39V8NFgSlkVvLx6hei73rVNemd/W7GaR3QbAwBxg6tPmZMCi?=
 =?us-ascii?Q?0irw2H0w+EdjCiVKVfMIZVnh8DcFFHhqgn9M2YQAQGjN1fwfNKVFVH2MgYI3?=
 =?us-ascii?Q?FApziRS5iUq+Bt4k5P0w3h15+neEKRAxpPCH4ik3S+EGQDPH0bMaBE79JG+1?=
 =?us-ascii?Q?NMh48MhrRJUyrvtZyWOhqsbywUE4MnYULhwSP7TuYH1LliRMYgZ5IXlTph5D?=
 =?us-ascii?Q?xuzUgssJu6lGNGHKfSJFdlnEc8Bar1HRoA0S+cd0rhLFl3tgFATeTmOthR07?=
 =?us-ascii?Q?shzk6s5rNmYzy42YFjvu95rIaOXDrQa5QDAH0L4U56rV6tO1gdQDUY/fRNSo?=
 =?us-ascii?Q?vQGdynZH2OIGFEBS19AtaJNQynRVrv/E/JanZLSYVLhkxppLNX66IoESoprL?=
 =?us-ascii?Q?3wbjVqHaVYzyfgcydrgoN55XmCEBzKqIxGX2nYV2v4nYomQz1U/0hP/bwStk?=
 =?us-ascii?Q?+Z/qntH/FzW6deFMt86RaWbuiD3+u5C8IRNaeg1VXUBUVgYXeHGhnreSI+Qr?=
 =?us-ascii?Q?+p57FO1JCixf4AG1ZVshtIMK6eUitsLI3TNL0gXfK74jYamlQd191j1DmZYL?=
 =?us-ascii?Q?b2CBz1ryeJgTBm3cAVeYC/2PRV0GcjExQJfCFAecDduki/7ySi/0vNKd+1EX?=
 =?us-ascii?Q?+61W6ZGyzau5RhEg6OiwGV6tQLqVHA68DLAMZ4/ZYM7LwJZb/I7BU2beW0Fe?=
 =?us-ascii?Q?7zWIIbWZVLYRGlnN+9peC1DlC6YELIb6m6se2fmglpcE1IAZ+rVn9qpqn3zG?=
 =?us-ascii?Q?RA/pPGENh3qWVaIZZNoq7qIYs1VUhBnY1wa5QyzCZ2lwbYwD8/870ZmVZmUz?=
 =?us-ascii?Q?0I5hiiKbsWol9nFEcC196ZyXBCO3IFCDjvHghq3/I0XpcOPPtMZUuDDzG1BD?=
 =?us-ascii?Q?aCv1LaoA+yVZkTCosVqYfhQSwZepf/wLZXEzFPKZrVb5dtCohaV1kAbDde3e?=
 =?us-ascii?Q?1r+1FyqJvcnxradjFglYVuXiNBdu3z9aEnY2miI+OEytgXe+9wttyGbOCZ5G?=
 =?us-ascii?Q?tgXB+iIhmqdHbNCg+jA+6UeDb1HCVKnv/NJzUfxt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sU864efyMl9nvoQv5VCRgxsSzkU7qnYym9EYa49iBLxd8IJB1GSuY78/fNOP?=
 =?us-ascii?Q?xJwD8zfncviF4BJk9SWUlEyptECv4uKeO6HvjkcozjGFbCcLsHgW2kfsjf2N?=
 =?us-ascii?Q?mwovP+oWOomSlsbg/aRfaCApo9CQ+vbpNqUsQcS9mnmR02wg6y5ZhYRpsZVy?=
 =?us-ascii?Q?jcmfi4+LYGVo+2dR3mSzvygWcV/7u4LA3ASBc7UhZmm33huNaLXtpuRFUwMj?=
 =?us-ascii?Q?8JuLTKunoD9XFlA30vZ0gaoEDcDgBEYI7fwBaSnNvKoMTYkoK+bqmT17NVZ8?=
 =?us-ascii?Q?tU3HG7UynBeJS8/OfNnrnJ+A8nHNfJARCwxX9VQnrQNnsbhEwvJbdXluiJb3?=
 =?us-ascii?Q?K6W3HpquL+8esoFp2pbZ8q8EN+WG4YyAd/Cni324FDwcB2/7n9z00HM4Z1Lb?=
 =?us-ascii?Q?0dXnt0QAlkwEjrP4aVroPjgw6negdees7mVu/haVtCuX4YHPBe4a4bSjhxxL?=
 =?us-ascii?Q?ebmS49mbJ4N2WjXyZl5xfaaIy3cTHXJb1lI0RrqAwkFIvIjLX9jONedmF9nK?=
 =?us-ascii?Q?wKTLzoV93BqLc/rGPuQlSRvbMfgOvSV0Ba0g4+YCXl0qrKi8YnoTUMAJImQi?=
 =?us-ascii?Q?RlD/7z99TmX/VHbYVCTR9VF+AeFmwMJuDnLcHp7VosZwlThTO9j3T9A+2Ezs?=
 =?us-ascii?Q?6VeZR2t+aEdC0N2mbHAXA3nfx1wrAMpc0bqr5JIrRq/Uui21Vzz5qj6bDsGU?=
 =?us-ascii?Q?LzLBd68NZw/0D10cmdtqt8u2OellTVPJyv1LAtqIQcgxw/slDopYnq0q+07d?=
 =?us-ascii?Q?regN6QC4ECTo2UIT9tQttyk1gv1RFLeifzgRIss9TAXGHQbJfQbfA6ggRMM1?=
 =?us-ascii?Q?rVCwo23i0/ZRNlz13xikiAJNrqxQw1cRoN22az8pe5jv2dxbyfN3wK72sNNk?=
 =?us-ascii?Q?dct8luQWzN9JKx2i8wPevHe6NfGb9Ji/tjBZnoBT+rcWPY2O4oAhjTv67gz3?=
 =?us-ascii?Q?p8Tt9dLsbt5dT0W9hhh9caoCxp+HsgaBJ3SsvMKn9E4OMLvVstlZENvFiv/p?=
 =?us-ascii?Q?GFjMbIrdXMTDwbGM+mdz+fF76i5Wqn3CD85uF+lBMsmTwKub65SILwnT40Kf?=
 =?us-ascii?Q?zFS5GfZS5O4zGpawMKJEdj/Ja24WUb9uzA1hORCk3RpOMO8LhHGKSsnVASrc?=
 =?us-ascii?Q?2sN4YL6LTBLwwpzPLLhZpx2ZCmMdDEX3CF6P2vCTV5r1qbGEHd2ltpxThUaw?=
 =?us-ascii?Q?Gv7Ak/3khSRxEY03O9L0RTOUJeC69h2eqiXuv02Il1rp+4q67jvarWoUVC4w?=
 =?us-ascii?Q?f1ShqrdOCB/Cm5JegAiuvFh05TGuZ/v5L8SsaGHbeRHyISfSUFX42TMv5S6z?=
 =?us-ascii?Q?Ud4bViERZ2tulf1AGX8E06kukaMdtpjpvHYuQsVwyr5g/NhO785GtnhLoraQ?=
 =?us-ascii?Q?TcJPJQ+pS4J4vwCxSAAal+zau8rVYLwbt6I02jqqO+XCODp7FsxVEjTlqEgC?=
 =?us-ascii?Q?KB7/VpVObvHxULBlYic7S5jJ9lqW2242kwiV60nvzsPCV6drOLQlt9V8nOKu?=
 =?us-ascii?Q?XxG7CgK0yWvOiUJN2skXBIYn7Nnd3uvBbk/fvZiyQXenCVtfiEgpE6oGE5cW?=
 =?us-ascii?Q?Cw1N8UytR2wJbmgpBwuyOUHW+AkjAXYYo61qmAXnT+fe6vTgNhTm62OkGOdZ?=
 =?us-ascii?Q?l5kBFnfdeZ7a66LCfOEwA7y3bAL+P109bJ+1l4lQPJJG7kYXpcDO678ieUkK?=
 =?us-ascii?Q?hUXtbqsQwrzrEnGMS6+LeFle1cDZgH11MiBJv76xUOO3pl5ROqr48JNFYfE6?=
 =?us-ascii?Q?qc7bYDe2dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20078b9f-17ec-4570-0f37-08de6642be78
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 12:16:38.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIrQoj2igcnPrvMEmgzGIor/FnvbGuAAZgRO6Dhqstgzzz1g5Vqo1hXxmvc1kGufUVxRQ6OaS7XaJDz0MPx1hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-uapi-libc
head:   9f2ce252d5f1b625e013269265f25f86540cbdf3
commit: 6b07258ca2b6698cc22a5332c65e141c4972e586 [8/11] kbuild: uapi: use custom stub headers instead of libc ones
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602071507.QKmwioZr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071507.QKmwioZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602071507.QKmwioZr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarator
      32 | } __aligned(8);
         |             ^
>> ./usr/include/asm/sigcontext.h:32:13: error: expected ')'
   ./usr/include/asm/sigcontext.h:32:12: note: to match this '('
      32 | } __aligned(8);
         |            ^
>> ./usr/include/asm/sigcontext.h:32:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      32 | } __aligned(8);
         |            ^ 
         |              void
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

