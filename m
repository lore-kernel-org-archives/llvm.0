Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D83425862;
	Sat,  3 Oct 2026 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038708; cv=fail; b=ITF3vkNif9gk/PexsJzZLeSHfXHg9iz82fVnJi4TOFVPUyQ7SbwKgaMb8Lq0KeKi+oPVhytm7MtGWK3dHMuyvmv80fO6lN/Ck+6pdKEwa8ETwfUUQMDW/N3D6FLAq5qh/eOow4NSkc0NBFAyXwyx5qNm1ANrZQuMhiqODWWL8DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038708; c=relaxed/simple;
	bh=oDRjosYVx5gq2j6eCGR9tExxrjIxPTdZaHOsQIGfMfs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RTrKAXj+H2lceTJrDaVYDEeCsRYrwYHvLjspSAPa/q0XAYszGLnWIjvX9IRKumcgSR5Fb7Ch2d9ESq+Q8jY32DqW1ZNX33Ym22SmxmcS1zIrQUibSUTjhds6p9KVjhotYbTLhGjCEOVphYpykLh25SzA3fET4DnTMq47c5CEYOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzjIHixk; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzjIHixk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038704; x=1822574704;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=oDRjosYVx5gq2j6eCGR9tExxrjIxPTdZaHOsQIGfMfs=;
  b=EzjIHixkKqyJM+TupYHiVQzdoLGQlYHxfCbThudiLj/pNkk6AZ9zBNez
   Yn4cM1WbI3utdOOheKAd8+958DvBLytZPmQ5EyJWnvHtaA4IY205y6DDu
   9dWyQmejTTNCvqihviNWV9kbsV5UlO/iuq0fwpBglBIV3ApdB6cpQH1Zu
   sQlitlVGfwdMndw2xCjGZetDbRkqtIAbUGbfj1qQGIjlvz+Qk+sF8Q3wq
   J6Mpef16o+IRMOpEi05QR4fpkjNXSaV7X+uchGI0BGZ12+kd/d075K+/E
   0Ijw5/7p/eF/OE4argx9pHDmf2fKWbgElnbNjb6REPnuWpRKT2uHATQzW
   A==;
X-CSE-ConnectionGUID: SyhASyxTQjCFwWjaDIsXBQ==
X-CSE-MsgGUID: 9Thcgq8jSky4U0OAW/Jy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90808007"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90808007"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:45:02 -0700
X-CSE-ConnectionGUID: QUoJJp0jTkuzWQvuL1U09A==
X-CSE-MsgGUID: 6ir9ORl5T0KdcBy9FILraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="444614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:45:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:45:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:45:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O392grAL5o3u4vVW2VpnuESfi3ABIInMg9ZKyeDXvUIUfqCnRevV3F9Zw/qrf2IruB+9Xy/HiP892S2R31Ea6n3R6oXRZklMKU9KUZPRS0ScLljDZfYpEJuum2VP0XRnuWad5z7Ditfe64+7XBELt8Xc1JRpBE5GQ0S50J4IpN7qXnL8Iou7C5BBqTKuR56xnRX7GrJ31MjsQSMWCHmfmWrquAe6Y8wfDLOWB9GmplT9ElBBKnJu/rw4X22li8m/TBz5Mw7J1lg8HN4az/l+OHr9ncUq9CYYlZbpX5/aRHuSaOADIrUL4Cdm1np7aLyCmPjvYoXXu/ZpwC6RvVR2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtANfYimP84JV1fzQizfajt5l/n7hMbEIs0VopJf5/E=;
 b=P7PbT3MSIeNwtaTTdWAt7DMPXcsJ2mJ5qrB9323UBpz9+3eic0eS4laIfrIiEm1X/WYzAE4FLoO72OXD5aMpkbbA2e09qLBz338aPk8vD5+7Oac+Tu41Tc4skUJ25QhY6s50vlr2x/Z+8ZO2cxp2SIPeOZSohlWCI14iRcrQd8XvuIQL2dkFHtQB5faq/iaGOry0Hq+Ox1Q+/uE2YF3LJh8cbwomtuSGfl1g0yu4P8XC4aG1ufkEKieG6gjPitOAA/8QvhuH9WtP2jKul42edVDM/Ph6RwEtRYy8skLM3g2ZLrLwQMDRAdU4kfBaDMXOD0Dlc3m2pqag1yjhAeY9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:44:58 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:44:58 +0000
Date: Sat, 3 Oct 2026 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>
Subject: drivers/net/dsa/rzn1_a5psw.c:212:24: error: initializing 'struct
 a5psw_of_data *' with an expression of type 'const struct a5psw_of_data *'
 discards qualifiers
Message-ID: <asEU48uW9bTibu0G@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::11) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: c6232329-77f8-4af5-3a12-08df215ce5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: woDdmW/9GctmztJ+9XJAkYMdJo9XpoRHs9n//vUNT0dfVfmfDckVhshcd1TQcC1+Oun5GvHFx2hCCb1wsPKZVps3aPSoc+N0cGWTlol5MhX8dEZQFH/afiAYiqIdUIPJOHSWvE7lYqsb/Cxzqka6P6v7/xKzZBtn1gScyfiiI+phGoOdW+zTgZdvb564p4WVbt7VikMb5WVWmZ3Sr74HLME+qcH/g49acvbaqV9xjkQ4lzc7gVCcNRklTgu5jQoGF0E2kDFFz3mXbvBCWLdTo+Jjyf1KyMHUeIamx+0xoSImfgBBSOy95BsqUWu5ZIl0odA/0a+gRpgQXH/j/E/NuWTUj/nfAMD/OuXDE87PxCE3PJam09yyUsWlzKInWIOQ/k3D/eLifXt2Lp+iezloRbLmwiM5F/L5PrIkh8nbTtpkwPJheJGEHTlsctF579udJQB3v2kM2Hp2w+14ZU9YPcm8uhWPKDjqczM/ardH9FiN4DNFTsyrhbhy9GADOkYHGwDPaE5t2MlvEwXscRXl4h5LlHpnoT/UgjtX/86bDmH93T9zFdyzkWsHonhyZ4nk5ZBtYY2wOZyvOHY0w/+IsGkOUvLcOPLsremLIYDEsWyQnkGsXoGgwnrCX0zlkBCE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v0gR/oijBeR7rwdcRsgVvUVHbRmB7gPB9sGdwXs502gcvQCfYtrP4LCrLQ?=
 =?iso-8859-1?Q?HsNaPjniBbbBNbtdQ9MlncecRDFCZVgMEe4e4sd69lE9vDlqt+Xgol0XTV?=
 =?iso-8859-1?Q?aFRvO4krgYTHHMDLEIttyJOzGeCmj9UvlbZo+Pay6gts4/yanLq+G22TEM?=
 =?iso-8859-1?Q?IWNNDahGBmIM6t6MzdhAsGAmf0aPEog420zwln+IUwWnxhHheO+U8HYUm0?=
 =?iso-8859-1?Q?nv6ZseBQGbPZI8M/vCXypAegb6nRZh3hRz/y4F0zdcggjDNL1aAqizAai+?=
 =?iso-8859-1?Q?9wJAicrSA7OvklfNfQY2B+zKqRec3Z458fCdmLccjeq/tgersBzr8WWX1a?=
 =?iso-8859-1?Q?4P9GHm3Q1EFf8oxAG+lEqNL2WfyVWIV9FUIsNKCJCO3YkuMsdepFE9bgOz?=
 =?iso-8859-1?Q?1x+l3KpXBft3reXtmWXWYboS3EZ436xFbqa+K8Nu2mYnOCqJbDQo8W0W/4?=
 =?iso-8859-1?Q?ogR2L1taixHPQLApMpp+6C1+QMUgR95eld6oLlA5rWdPnnzDHx7ByhgdES?=
 =?iso-8859-1?Q?/NatB9P133D+SZ6dp6BOurKyC42xNT16UISp85aRTtLkEo6mP0w2ZdvEiY?=
 =?iso-8859-1?Q?e7GUvWxhT4EzFXMMMvatUHChOM40rGr39P2//d63knTTm91wh2vpPSjRtP?=
 =?iso-8859-1?Q?aWclvhemvE2VpilVW89YKe+gzlnUajQlueIW6SVFrPoFSUKaZuWr8I9bcm?=
 =?iso-8859-1?Q?0o0tKMw4gfsmMpYzjcbGrQGmGbobufwTy0fEFRj8s7EkAdsmCym2liXJf4?=
 =?iso-8859-1?Q?299ULkraPS+H0q7cV3DqQC/Brg7Vruop/4Sikwo8qLvJIb7w6Sk7jOaZSi?=
 =?iso-8859-1?Q?CWez1azzTj/+DxoDWhjUarFDEef+hjYptihqw5RIub4e2OfDQRmJx078+c?=
 =?iso-8859-1?Q?Cfc1q6H9nAdTwLoHWp8X45SQFc7NIP5HlBvMMHojmsoPpl6H4HdnedpLGQ?=
 =?iso-8859-1?Q?9JyOZxhZ37yodMmowR5xYLwDyttB+TWD4kBEIrYQO7x2q1vRiPY5gfHGLs?=
 =?iso-8859-1?Q?sBZr5T7CV0FM5ada5VkxLeIf1LooL5jDjome4C5IpevH2r/oYAztIohYw+?=
 =?iso-8859-1?Q?6YS3nn+4hhS2goDGbPIeVvG3+yqGFdOqqJha3W3o0qnrLSODEZM0ZrvcBF?=
 =?iso-8859-1?Q?yG6CR6kkKD4oSXPRJML87koTLazhrnBmWNU02KkqLBvYUlRrYtoCMqiN5e?=
 =?iso-8859-1?Q?Cr4tcbDJ9tmphA5ZbY48N+K3ETaNknmPrllbi/yMMptasjToLueUFbSVzV?=
 =?iso-8859-1?Q?a4N51Eu3vY5Qt7tO32BnmRjqgUo7wGFCaLSkd/NZ0pFJYbQbGp/bUSvAom?=
 =?iso-8859-1?Q?wGewLq2Nz5ucUILi7VzddGh3zeoNFQ3wHeBuAdzThXDYqjavPy1d6GYsKt?=
 =?iso-8859-1?Q?J7wRkYpx1tem3nTD5OpklPSDKi2PZX//esAbW49xz9oTCdBVKGf7XT845e?=
 =?iso-8859-1?Q?vrrSHlpdMFPYuMfCmg45gwCCyof2mvAH9JxjQHNczXgS6i05M/lVf1mc1E?=
 =?iso-8859-1?Q?mpxSR44CqwxCGxpwSReZIYfhzx51F2biy3lZXPbeQDLO4MwBpwrwAfvI3t?=
 =?iso-8859-1?Q?ooZwNrrBulZQGwDsckTGOdPtVlB8DXNlnLqmHhK/yf+r0Z4Z0SqLAnHZ3V?=
 =?iso-8859-1?Q?MiPahjshF2Z+A/sbfHGFtZk1rbL08fDkzBSuJEKP+kC/5I+/ejg7pnXM4u?=
 =?iso-8859-1?Q?LRBeci21Nx6kFWx0GwNqyeyaOKSkB8042uKocMCZAT+xz9XooLlWqJ3lK6?=
 =?iso-8859-1?Q?q3QnQijYPI4Wk9P5VtojUHBaj7idOZUeiaLQoNWgJ1NiPWToLTKPgx9dFL?=
 =?iso-8859-1?Q?GR9Cdwnrdw=3D=3D?=
X-Exchange-RoutingPolicyChecked: ow6dqTqkpkktDDS/lJxKJZ8leCcg8e0L3UzEJS7ehBVHfq0Q4wN2uRQ3Jd9YWtj1djAqHo3Ge/GAk4x7XVuFIrUO87nWo8x090fdduPm+4EElgvFJYSqRWzQSyKGvd5mGNgc17Fxf64xwWxqYz8ov2yRK2aNSS+qjsWMZ/Mb5iSyaZnb/X/zYoGXbhYg6V9UTXop3KVzNMNrOfdOwCwQKTQ3Dk2JcSLJnEYoyXiiOL7agUPKZYtH+D5VlhxNp8t8Xy4XEH3XoVsZtz7zRaQ/3z68C9v6pb+6CmhMi9XWGthz8qb8Fznqys5hynNAG3pvUtpLLOjZBSvSLhZ8wCLuKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6232329-77f8-4af5-3a12-08df215ce5d4
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:44:58.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOmbfdBPhgD9cFCCON5LB9h9t7eqz/VRWDZT4ihIW6uYo3wKnbDcT2f78G4JaAZKq3rQTrNS0DS3fjNH62XlaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

Hi Lad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/net-dsa-tag_rzn1_a5psw-Drop-redundant-ETH_P_DSA_A5PSW-definition/20261001-164314
head:   467636555a7aff5e3f2d57fbc61f81c19a28bef8
commit: e3604cddc3c79985021de1aea0e3f482ab64022a net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021252.YrOjM8eB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021252.YrOjM8eB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021252.YrOjM8eB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/rzn1_a5psw.c:212:24: error: initializing 'struct a5psw_of_data *' with an expression of type 'const struct a5psw_of_data *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     212 |         struct a5psw_of_data *of_data = a5psw->of_data;
         |                               ^         ~~~~~~~~~~~~~~
   1 error generated.


vim +212 drivers/net/dsa/rzn1_a5psw.c

888cdb892b61d7 Clément Léger 2022-06-24  208  
888cdb892b61d7 Clément Léger 2022-06-24  209  static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
888cdb892b61d7 Clément Léger 2022-06-24  210  {
888cdb892b61d7 Clément Léger 2022-06-24  211  	struct a5psw *a5psw = ds->priv;
e3604cddc3c799 Lad Prabhakar 2026-10-01 @212  	struct a5psw_of_data *of_data = a5psw->of_data;
e3604cddc3c799 Lad Prabhakar 2026-10-01  213  
e3604cddc3c799 Lad Prabhakar 2026-10-01  214  	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
e3604cddc3c799 Lad Prabhakar 2026-10-01  215  		return 0;
888cdb892b61d7 Clément Léger 2022-06-24  216  
888cdb892b61d7 Clément Léger 2022-06-24  217  	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
e3604cddc3c799 Lad Prabhakar 2026-10-01  218  
888cdb892b61d7 Clément Léger 2022-06-24  219  	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
888cdb892b61d7 Clément Léger 2022-06-24  220  
888cdb892b61d7 Clément Léger 2022-06-24  221  	return 0;
888cdb892b61d7 Clément Léger 2022-06-24  222  }
888cdb892b61d7 Clément Léger 2022-06-24  223  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

