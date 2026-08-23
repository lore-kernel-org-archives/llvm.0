Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90134371053;
	Sun, 23 Aug 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485540; cv=fail; b=mWL+RsBv75k7Mjtt3fbz/pG1UlDiNqWAsyztJt/G3Ebd/uwrouRZBMEQLGOcivZQB4msg6sREG9qbSejZp3W9zwbLO1iVQzNcQkPJBTUxAkH4IS73eHIAJ3zCMo9EAuO2LkZG2/f5aaX2GntmoKSekaWpiCleekBVyE08qDd9Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485540; c=relaxed/simple;
	bh=O97WcGNo6GNokdZnJuEUkIz0hUwUtR5XhrWZJ6B5Dl0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CZ2SkiEgZcbqWp2/gHJzfVh9x2+ktkiD2nr+FNnG+cyyU8BPhCurN/YjPmLmvi/uHTSlkW5wJT+TvKaNwcj8P6ZfClv/mWO2x1SD+G6em8+/YRJy3BNQtVw5kBwPzFtwe+PFkx4i+ijHnTBXG/SXIldm6S+22hpSg0CXzbad4g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoS8o06h; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoS8o06h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485539; x=1819021539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O97WcGNo6GNokdZnJuEUkIz0hUwUtR5XhrWZJ6B5Dl0=;
  b=UoS8o06hOHm3tFkJCuxcLA75Z+AOl/eOg7onGt0shd+iwRxVZo+aQ8ar
   JuLQmJhto274dW4D2GMELn2V1b5DHWnfGhF4WtX03mAlYZygMw76tOzMe
   /2WwACIzuvzB5MUHbOx/TVFW2SkGHrGxEbZU3P2WJOdPTEe+K/LRCtSGi
   Q2WBSoTGB7LiidGZQAh6aj5ktfYKJqs8wEnLjiO6um/B7qdV1somd226f
   ltw05jBW3CVKNMrvcrLIQLwClTMZuj5qR0icl6IFLLifjipxAHNxBHJOj
   t/tSy9BgIHkTgAyMHCYOtQOkozLMdcQ/m0F+7KZBzH+NUPOqZFaf7No9R
   A==;
X-CSE-ConnectionGUID: 2CO4FvfIQJKYSuKGmUu6Ng==
X-CSE-MsgGUID: +RDaahPvTxWTvP4qE4WD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99119022"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99119022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:45:38 -0700
X-CSE-ConnectionGUID: 8wYes9aRQhqURLTmfHpbXw==
X-CSE-MsgGUID: cTC52f4KR4eDAmYhFHxFag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="304949663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:45:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:45:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:45:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRQsK9esjJud27mFdByTriX5Q3fq094tWGx3sHGogzYaqJfkVMXC8tYozUH9V6OTu6ZE9aSDs9yEbypLwQdHWfBpa6KZqaiVXQ+nLQ/pRd+9cGpsuNEkOF+0htQazOujSQrt9RRLS0BTNnDlMgPifL/NHZJQfj6sIG9YQHjWiJyHmGxLcPqBkwQNmx15sGP6RIcmL1MdzrelMCd4Lsi92ssa1+3uFTlkmrEXKgNl2W4aIeD4hyFuQKFk6SUj5Raw630kwykILfOVL38sz29ddG/gCzOREHLaeWDWt+ecZ4BMcprnO4JvSx8dArwekQ25WzTv1XMFzQVwfeMRK5M0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LBZ3DKtuvU35vVGrUDSwN1rG6wS6RPR1uLM+2avkbo=;
 b=FkY+HdpJp40aKgyg/C9QebdR6fzNIf5Ewri4aMdoVpNuUzwfaHPpzD4yAl+/JmfEpAUiPbRhvOO7FC4qL9m19fwxbbhlgFgC9gI1x5QcZ2nuvgHsjHl/Ffn+cHUSFapxel4pnrFRJyuSOCmOQ2/5IldMwYgSbsWXkv8RVj2EU4o0+r7DFEesA55PHj7EEvKbMB3mxwM+2RswCAioGKY1HxBmoTJtLQS26Ora1QggrpvmAs0NuqR06lgpK8PIPWm/uOMCZRWTpYDvAugkHR2i3XcYCTmnEaB1vYN7YDDdVcX4Fo2vVRXDF4iFjjpJfrxGf+ifKRvMZ/GzGnlB1BL9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:45:30 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:45:30 +0000
Date: Sun, 23 Aug 2026 19:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@gmail.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Jarkko Sakkinen
	<jarkko@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Alec
 Brown" <alec.r.brown@oracle.com>
Subject: [linux-next:master 16504/16703] include/linux/tpm_command.h:515:2:
 warning: field  within 'struct tpm_header' is less aligned than 'union
 tpm_header::(anonymous at include/linux/tpm_command.h:515:2)' and is usually
 due to 'struct tpm_header' being packed, which can lead to unaligned acc...
Message-ID: <202608231539.1dlIoONA-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc98011-4cf0-4674-ce20-08df010c0834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: SSGvZTSMYH2WVIjMyH87n1RqGqD5UHPBTu5XTr5P4Xj58jbpH8OKMmSC425zZUhshzah5XZ96LNYu67vN4D0HN2AMQzIylVUtpJBZ5TsKqWsCq3QewidmSJUSQ5kctXEUum+uvdkV0TZsTbRDJuZH4PlLVi8qMVUwKdNYPX+/gwBsxVwrn1lSIaplrAUYk96q0ru7Nt/zOok3x7exS4KHBG3jR+PGeFQuJupR9LWaHTAF5AeTDBDNnN120gRaWyNj54UTPXZWID/E+EDwXYo/mxSDIr1+1i8wZZL389vVsot3JwGF9s1eu4F2ormupDtsjLVHm+Kz5PVWtxBAxXo/g6aje1QLyjtpPcT/Q2o2BOVB6b5hnnho1w8Hr0CRY7jV9/SxKDYhxpLw13ZtePGGbZMO13lzlWyulIV/mCy+cE60vqtF1BjIBb0SnT6sxKe/NVwJ85PQPJi6AP9qx/5hqqLDFTf+Fj/EKb2qxhosCPyWzX5IDjjG+dg7Hf9T/2QkaVqMxqjpdCH/gDCIt6opOQDuWJSE/CH+zz3gy8htL0A/j0jzGq9IcYPs7dwt3+x6xyBm3Mv3rTexgjQI3tZhQuiO388E7ZS93NREy5aLoFcRIlQ7VKUGIji7ZKP32MCJqECnlF7EnrgCArMwiCPmwfCU84xfD46jORiDvdDEVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZHq5lLJUKTzViFxS+aAGt0H6HadCbjhQUmGuA74SyshcNBWp5+l4ta+aXVf?=
 =?us-ascii?Q?RX7K3m7m+DoJRkekmA2aFopz5CoGCOrf+WtsmZM/iUPCnsriMoHHMc9LorTp?=
 =?us-ascii?Q?dSzkx943Dz3kKb3DOsMXh0R/o5HEOz3Tci7FLLsSN2jofnrXXHA6gWTuux4q?=
 =?us-ascii?Q?+mLkWf+W3mha4kJBP4wwty7xfL6CErgziTQtaM+/i8pn7WYlbDyvxEtiE/Ed?=
 =?us-ascii?Q?keWzALFS9E9n8AODt2SQUysV+qGKZqF641XpW4//jc+OzsKyIvWUsZ7kIvOi?=
 =?us-ascii?Q?L5uiQ8R0sapIK6UE4ywmbOyI5asdtqZNOmLGC+ipTthcYOfAzKUq/T8hMWJS?=
 =?us-ascii?Q?ZSCNV+MOpv7KRdvxhoRnAxq9GidVayfKK2rCqF6UWE2K1K6/yPgcKkXumQM+?=
 =?us-ascii?Q?V8kmHAv5bpvLqsvPT0h2G9gbbUI06k5Qb6rE5OVrA6TobQP9DLnTQ6xmg4kG?=
 =?us-ascii?Q?NOtw1mZfyHBj0gLcO2J1wYRtNzmvz2JZhlQDF4PQV9BAJKROvCPEYePL8dzA?=
 =?us-ascii?Q?PwGpo+aNoOUBRR6BBmAqrMd9A4ef0idlbTxYNg3qqIhAbT33Oo2/fvebSGyo?=
 =?us-ascii?Q?CwJGz+ZHDUJ18+8TeWE6qLTWDUOMvljuUw+JvenighVj1D4N/FlyDSME4kz9?=
 =?us-ascii?Q?RQjV+tTgOlywKzESJ0IANzcRLMEGyC2A2x8GE3osdC+O4r7ZJLR4S87BKGcS?=
 =?us-ascii?Q?cVeLiJ7k+ZNWsk5O/TzwL47qJvLHPdztSfBsgQD/qU8rHS31VmjdNiCbPcTu?=
 =?us-ascii?Q?dA7akEfJ9pai3865v0t+3Jz5T4xo9lbklSmCsw3mgKxxDwWST+38yG20+bGF?=
 =?us-ascii?Q?LotGFzrGKA2zLHPR31kU2bTIR4Yr+nbd3Ummbrg0ooOyPdlXcn1RooGLjU/t?=
 =?us-ascii?Q?KbtZjmiGS8EutMZY165oRdJUMBzPNvR75RJXe5lZGPz7TTKYWR+q239YHoGX?=
 =?us-ascii?Q?v+SzPCNoBhm5QukVpHGHaM16vKHdvhFdUhPUcaOySoPD1ZsMECUrTUAfR6jA?=
 =?us-ascii?Q?sm5yRiYZfAuaALeDYTVmayJ2mSlOZWMCwVvT+i6etbTDrc+3TP/NB2rV9TVH?=
 =?us-ascii?Q?c4DFqUzFqLUfebQcKbvTXjlw3oS2PT4ZgP0Bw3dqWIjYBrmavKZnbjh/ClOc?=
 =?us-ascii?Q?d65SBhrwvNsEg4aaPyX17OcyedPkBg17aYLvTh9rq3A4cFof1Yu/Ns3R3DIi?=
 =?us-ascii?Q?pYj3g4AfzrlYlRLCAoGlFmMTi0ty4jBiWeRaE4WZHL/6RmENFkUxRE5quNMM?=
 =?us-ascii?Q?rUesd3O9qtMTQaojBsfsy9AZrP7CrqcTfypu5cee5TL9EzePStICEm1vmXub?=
 =?us-ascii?Q?VOImQUyoFN6JzXkbOQJClFSIUBQ+Y/locDzC/ahM2p4vw6pGqMhzAGfB34E8?=
 =?us-ascii?Q?bTrXWVo+cLKnOQ1FZjhT7z2z41N1KCY/Bud/ZQpS8A3/L/zg24uWoK8mPxQh?=
 =?us-ascii?Q?ooD4109NKXX5/XczPSaTGAyBhRqoIUf7hFLJNgYi0GiJoZXUNJYHNJL0kOVT?=
 =?us-ascii?Q?PWYY9PPcQ8ni2rIfPwLYaXxT/RTvFiMRXV76hBhJfHN1duDSzIbWP5wUyqSe?=
 =?us-ascii?Q?mM80LlBPuojO6JI2mwUK9dMjz102Z0NcdDASGFafeL2pDCtbjkweUWcC3Gps?=
 =?us-ascii?Q?7wiX5ElB3YiUJdmyACcjtDblNZyi6JC8QjwXPWR8QOX4UEhxzfLO0LPNvc2G?=
 =?us-ascii?Q?FoPMJsI+fZflQ0ubdVf4yvHhcV+DIqnJJyfOJIrdAZsufzVlAR1P4XwYqjNo?=
 =?us-ascii?Q?Z23hOyISqg=3D=3D?=
X-Exchange-RoutingPolicyChecked: J8/wNanW/3voMSzgOQQyCY5DcZrkrmoBzkRcF3JpwBDufbUsRNixHjwx+K1RT/CUqiPn8OaiPH/z6OduZ+A/cLjwogY5+rT1vrlsj9eySWgQYFACnPvw9wbkeOZg6wZusHGWt+k2PoLThXYEw0sEhNFhikjJ+Ssg5VQNU0DyRLX8Jr7fQzPvP3VZVcqr9vOo1j1HIn3Ys4tuEqR3kEtluK3AZhD6fJHvOOMKNuCsOKwDc7jVtkaWzkneIH9u1VWQeWfMu4vjTR7BoGDNVnaVS6c0Ce4vk1L+9yTRBXJpixarDpvWxX5mOa4nMfr/uLJGUYl7/SA71Smz0MKq0stLjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc98011-4cf0-4674-ce20-08df010c0834
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:45:29.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqOzfLKn+oec9CaJn/B01vaI0SngTzTp0xATjBA5kdWfnx6bajQqFd0444y07dKT2zdDV1GeRliUbUFweo/HQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   903c1cf6dff9964e71eda98a39e2e5d442050472
commit: 80d179c799e06db3a0ded6fdd71f292d9bef3fa5 [16504/16703] tpm: Move TPM common base definitions to the command header
config: arm-randconfig-002-20260823 (https://download.01.org/0day-ci/archive/20260823/202608231539.1dlIoONA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231539.1dlIoONA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231539.1dlIoONA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_i2c_atmel.c:23:
   In file included from drivers/char/tpm/tpm.h:28:
   In file included from include/linux/tpm.h:28:
>> include/linux/tpm_command.h:515:2: warning: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at include/linux/tpm_command.h:515:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     515 |         union {
         |         ^
   1 warning generated.


vim +515 include/linux/tpm_command.h

   511	
   512	struct tpm_header {
   513		__be16 tag;
   514		__be32 length;
 > 515		union {
   516			__be32 ordinal;
   517			__be32 return_code;
   518		};
   519	} __packed;
   520	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
