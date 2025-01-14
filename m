Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B3235C1F;
	Tue, 14 Jan 2025 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736834218; cv=fail; b=KTAJNuzHs8vFetGqR93qczzW45JGBvXwTxiZvffvwlDBHDvEIRNIMPFkZHlLS2PhO07Y6kj/DUjumw2qhhpybb0Q/Ks9bYUK1dV1PEt1r+TAs1eDUD9M6wwkkC6cCZtQ5kAjw0SWhQbPUE+oIWa1VIw1cOR3Lq/Jjl+pGr7UtBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736834218; c=relaxed/simple;
	bh=akyLF7+CD/JfiOSoTEAxPZ3xk01MlMHAC8xG+Pk9dUQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WRyWvYQotOm40egFadlWkw+pkSGNzd8gobRawVEf2vY2CER1MP1PdyLlTSH1lqTE1d/Bt2+IZyQjxMC1TyxdiiRqLNEdqXkCUOsjFPiMCMxJY3Y/3x+iGQcOtA1kEDj6xkkVAV/t5hdMmcDNsiBndF7pvPO1d8XSfjs7gv1Olvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVE8i+Ot; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVE8i+Ot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736834216; x=1768370216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=akyLF7+CD/JfiOSoTEAxPZ3xk01MlMHAC8xG+Pk9dUQ=;
  b=AVE8i+Ot1D9MIU9BbPUmjSEsY1ZagQpaSrvZnOX86SQhoacc7mbXlqNL
   pTi0oEGnJ7PhIi6K4wkoPw/e4iQGzsXuuTSSjg6WMle471lmhXVNGVT6F
   3frCjHVpZGBeum36g69q1oEGwlasrNCOoIUbmlPJVMnUYFdosOK6u5atW
   8IetjDe987vsm07Ej1OR7Z3pCs7oLZjf8NGzKtpq1iLL4azxFf49SI9T+
   NAT3D8oNJZ7f+Kr34N3ErXUg9SUWmBndRKjEx9XZk07ltqeOiRNmiCqd2
   L669xGZqvQuoYKQP+Mc7NtZyeNU2CH3b6ScaF4aRuGNT8sFDmoIa9VKRx
   A==;
X-CSE-ConnectionGUID: AB2twCmCStCcqFpUvuIpHg==
X-CSE-MsgGUID: VrxfV+MtTxOGHoChrnjjvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37278253"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="37278253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 21:56:56 -0800
X-CSE-ConnectionGUID: Sf0A28aHSdqhtStO/tOvSw==
X-CSE-MsgGUID: UgM3lZHeRL2WSL9SLI9q/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="104524639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 21:56:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 21:56:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 21:56:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 21:56:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3sA6eFRKCvrggr1f2HDGEyHwIe3yuxRL32vDep7yOnvpaecjXs6AaFOEpQpZiqdwUuTcFurhmkP74bDoB8a5lqYwF0lKnAD1vxVw1TZHwJtVKavDWxCnJNptN7WFFAtx5/m9aInUAuL85Mup7R/wC2oMIQCs0rLNEFaLibyGQhjn7EkUpHCDQPnBgqNOJtDzpqv2HqnZhbibY/FQ3NXJQrLZV/6LQNLROcUZVE7fYIxkyCOGQ3F3hvnb6+2IQEnCHBjP8pgAfZ8vlUsfiqyFH2e1v0anWZgwzG03m/kzYXwanfkI4DNyyHyKu69ThpCAOMU8NmjyObZTIV9uurTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cGy6DjtgpP3SpGOtN9KguuyX0ITq2FN0Fpo64EVXCQ=;
 b=SNTD2zIymSGOk6jIc6JQ6gF3I4/PQZV7LXoRO9CwYjz2XU5PkucSq7+q0Zlg8ljDySdj7tXNkvygN16/5hXcKExk9yIImwudpUQjWQwz+1kG2+aHDnxcUGUyukFI/J54seywVAcJ1gNDQHvL7v/z6AWhy/E+2EaC67UmW3AW36gin6d9WOTaKWQlzCHGTKcFU4DfwG6jDDJsmSHP7GVqD8dIddYgcakj8Uf347syKzMxE4XdmJ9QB9rZr1kqkwbduGHgeB7OMffIOZqGnwVRFdn3a4oAzW8F5ComMt+F8bnNlzlvULybu2Tn6A29+TymW9kqiemzrHOvtbYdMpi22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 05:56:38 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 05:56:38 +0000
Date: Tue, 14 Jan 2025 13:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Josh Poimboeuf
	<jpoimboe@kernel.org>
Subject: [jpoimboe:objtool/core 2/2] kernel/bpf/core.o: warning: objtool:
 ___bpf_prog_run+0x0: <=== (sym)
Message-ID: <Z4X8j/qJj7ib0vkh@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 2deb4ba2-9fb7-49d8-59ec-08dd34603602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Dz6wmJ9p/gs2/4PUdOLChqAgULnj6iJoKNO4cgNo+XeZxm5Yi/WtbcTh5l2?=
 =?us-ascii?Q?gBSvTgI/TpHHJCnG2IOrty9t6pHG8Y0X1SHDUG8qKRpomQzU3mAbRvncKH58?=
 =?us-ascii?Q?B+Kl6/hayqTAFlefo2sNN03WjhyocacBih0nDxVY960AAvc7NTkWR5Rqhrg5?=
 =?us-ascii?Q?zE4nnwZiLh4q7MZcrfAcA0pDWYjMqoGOmWBZbhKr/lOBDdSXVZ3ez8oU15Yc?=
 =?us-ascii?Q?/3JaWuorpu2PqzHTVo3vf6qYxKP4CZhLlzy+0KXsu2M3ncTqmXuwpHF5La4x?=
 =?us-ascii?Q?PlUA4p+9zbDTbN/Qn+vIAh38QBmDr2TMGtNvuG/F298VeQ2ZU5JY9h2a3D+3?=
 =?us-ascii?Q?3uweccPVdK3azZKad5/01QgbYgk+4RHaqqs3ypFFFjUB21vx+Reb/s/4GBdk?=
 =?us-ascii?Q?+VgvTESGh+TOrdXrq+hZ3vYMuNNK6AjcX0Ug/V4jHKlzHB7lQ8TRTjX/ksd1?=
 =?us-ascii?Q?jnsgMgjE5aGv+cR6vZS0LeW0Y6bct0D5IMCIfIIztQIxevAyAQlCwWh4uKQ/?=
 =?us-ascii?Q?XUuQelPJtMtgtioCOxXgZK6KFrYCaPMtNpbAMDxI1Gui2oyt2sdDhraExgKX?=
 =?us-ascii?Q?APg77DA5LUtp7ju9VIF0/qpbVfbx5roIa0Ob/7xD2aIoz75lxjopfECCfccZ?=
 =?us-ascii?Q?/8cdNt0019hfXkESetbOzRdxSOIZuhxLCH/MTZqp6TEa+NETvlgTTPJUrpFU?=
 =?us-ascii?Q?5NKcxBsw2TIxyP08l0jW5NURtjj4GOkvfg8hK+Is83Al9SvO42TJqCXNxQmz?=
 =?us-ascii?Q?5P+XN3O7Xg5cGycViJv57FzhbkvW+Fea3oG7MJ4Ro6cRPrrrpxcibwAw39V6?=
 =?us-ascii?Q?lS8fAO54cuMGSz84FRdh0b7p8q0M7AoH4GhDS1yHfYDZEtel0PYDstyA6M+c?=
 =?us-ascii?Q?pB7XaCgtGoDs3eLj7XXeM/NcalnL6qrPkNagwDnt6CfjrzDvSKPRdNiWqoOh?=
 =?us-ascii?Q?ahjQvruP+/o864218OBwJn0SkQ5ssEioZO+znTCJ9z5JgH2pOO8Q7WUpfs7M?=
 =?us-ascii?Q?eJ2PWmjaO54MfTJkHzYcmllELadCC+ufczhuwJzdG/9qs5pDZYAKiC1fR+WF?=
 =?us-ascii?Q?1fVLZnK3Yh6IkWU4Rxotla0Xdax4QVNaiOx0M54w3SAyZCurSagJbE6f30Zt?=
 =?us-ascii?Q?0KS4NFG9kQii/WwY3gxZsFn9IqQLO6G2bdLCPNtbOl1489rdbbJaTKcw6M4F?=
 =?us-ascii?Q?Snbp+pPkRvSZk2HbyLnOwUnliasFlH5gz7rfJZlhMQodEmKjxP3BgBJRqXHS?=
 =?us-ascii?Q?05ddLrzhCuZ8M1A+uPOiUfaRHunTW3PykUPeRCKFcEzLz/km4j63twkTHads?=
 =?us-ascii?Q?b1/djyZl+TudgXcgygsvH7DQhbIEl4XQ8wT/PH5OCy0bvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qahGEXXx2WYYXEjaj3z9cSwyDOd6gA0AupXy0R2cCob2z62A7umAzZ182mb3?=
 =?us-ascii?Q?7tfbegO7ODbhm80c+TEjw3+vC88m2vTY94C8kHWFrz2tZ+VRaV2gEh2u8Qn0?=
 =?us-ascii?Q?FKMDlThoydAtK3uNjZsD8P79sNGy3XIXpS3lfSO7w3cp72XGRsva2aFM9DqZ?=
 =?us-ascii?Q?FWD0Fay8UXU1dmSjfddcyxRRAila5WEN2iFpIZSusqskJwLrB3FgLdwWg22m?=
 =?us-ascii?Q?LWX5kxAX4aLn+ixp1jAzE/F/m9yiHM15WMs1/R4eVRdZJa3F6kE696cZD46H?=
 =?us-ascii?Q?ZnJqRCqpWOr8cXByUX1wZnszGmbLsGK4+7dNpPyfTDIY10Z1Vyh4jtz2G7Dj?=
 =?us-ascii?Q?E8VJJ5y4KbYr3qdUu1Uec9dPiOw1HZPUDaGZPh+6qzxRmmeLKcYTGNZkV2Sw?=
 =?us-ascii?Q?CGWDj7YA6c9YUu5fpzI4KkZ+4QrgAb9lPmRcs6bBoSjLfNPDEV3I6k86jy1w?=
 =?us-ascii?Q?81qS3zwPh1uTRkMNK5hlaSuBJBNpV7rsl8iujHyeT/Gq4dx7i2wiBu4liEMm?=
 =?us-ascii?Q?GWIM5TCH7AG7K95K7Q9O9iRYJml7Hf3ElFJGNWp7CAIsGEhRZtZrllLVQIOp?=
 =?us-ascii?Q?6jAsAviWlwtpMc5zhFZotCfQECYXE8+JPg3SuWfkd5vRQz+TckMjGKLq+uWL?=
 =?us-ascii?Q?0WMqc083GJUR+TVuN1chdNCHL2o8TZFoY198QpBF2VzOBo/l0jWy7Gf2uSZe?=
 =?us-ascii?Q?3J6/begoQ4QaFD3XUOET94AIBwVw1cElzo89VWQpwCdXgXfxm8b5XMfcuuU3?=
 =?us-ascii?Q?O12U9SPqpq0AsDfk7ImHZ7NEjCNWOQ7goNP6lcqVd0jO96F+lRr6bI/+XYMC?=
 =?us-ascii?Q?0fxcUgs+4IEg4NcPALLTKJq0TWosMGxlUNnSvji9xKUj/+0MQRB6WBB1zyaT?=
 =?us-ascii?Q?VPBp0b9lfVK4Qekx0F4T/MHZ+8J96Z1dpQpMGJKFLZ5LXAgDK1Wqf+eQxSOe?=
 =?us-ascii?Q?5zlLMfrnzZhyw333fuAgl0ndXI7gnmW1fim3ShQTIUQdasFm0XNaOrC3aHPb?=
 =?us-ascii?Q?eUBVZTx6tMxcX1OsJZHZvAO2FLYXxIT9VntRGR5HWqE0QWN4sHchEeupGjvW?=
 =?us-ascii?Q?do+KF8tm7IzPJS9AOYtozu8cuttZmSjxutJkG8Ntxl8iqjv0PeIpf93+PvZm?=
 =?us-ascii?Q?KquOwftpaPpxcW3V5NuCvOobpgL5tHhd7gMyKMIhGmuJ+wndNVBIg80OO0tY?=
 =?us-ascii?Q?bXjKPxf6yZngK8uGc9B0a/8EalKQ1dJch17d3WZwmkv3DIvkfy1bG58t+9pr?=
 =?us-ascii?Q?7EohNCos3dDIuhYCNOUGD8Tbj6Sr5JOCGNGaYTAO8x4cGv5q38ZB5F9GZWzn?=
 =?us-ascii?Q?VUJVLyD3WdzIWnfyEJ1BsX7IffllFegFw+tvnk8M30bxUrSe6BjqAMbSApOh?=
 =?us-ascii?Q?PETaVptEwmGqfjPK739xQzzHsbICuIdNqJzAybFrzW/5W81UgG9Fmi5jmB8B?=
 =?us-ascii?Q?dnsygX9y3d0WhswqzVlb5aCQ+LgOoplVhIhoeasd14RszcWjBhQ5JG9WQKHz?=
 =?us-ascii?Q?NJ1mKL5Vv7ep41n+kQgoeRr6WPINjyBKykFy7gZ7DJ5u+ogqmEZLYp7/P8S2?=
 =?us-ascii?Q?Dzk7Fq65hl2SBYJodmo9n8VkTiusNbJkqOeb7qBvm1IuCIjds6d86nWmTm3p?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deb4ba2-9fb7-49d8-59ec-08dd34603602
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 05:56:38.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmpmOeE0Qmd7SM7ZkkQemYbY1EkytLf5WLUY/i9+WVhY6zM7/icktBaSr3Aq7KFdweXtCNnOQzIbjrOYYMV5rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   ac40926f7804fc679ac1e6f3f2529d37d7a5dbbe
commit: ac40926f7804fc679ac1e6f3f2529d37d7a5dbbe [2/2] kbuild: Add option to fail build on vmlinux objtool issues
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-buildonly-randconfig-005-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141306.GYbbghj5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141306.GYbbghj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501141306.GYbbghj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x20: sibling call from callable instruction with modified stack frame
>> kernel/bpf/core.o: warning: objtool:   ___bpf_prog_run+0x0: <=== (sym)
   0000 0000000000005310 <___bpf_prog_run>:
   0000     5310:	e8 00 00 00 00       	call   5315 <___bpf_prog_run+0x5>	5311: R_X86_64_PLT32	__fentry__-0x4
   0005     5315:	55                   	push   %rbp
   0006     5316:	48 89 e5             	mov    %rsp,%rbp
   0009     5319:	41 57                	push   %r15
   000b     531b:	41 56                	push   %r14
   000d     531d:	41 55                	push   %r13
   000f     531f:	41 54                	push   %r12
   0011     5321:	53                   	push   %rbx
   0012     5322:	50                   	push   %rax
   0013     5323:	49 89 f6             	mov    %rsi,%r14
   0016     5326:	48 89 fb             	mov    %rdi,%rbx
   0019     5329:	45 31 ed             	xor    %r13d,%r13d
   001c     532c:	41 0f b6 0e          	movzbl (%r14),%ecx
   0020     5330:	ff 24 cd 00 00 00 00 	jmp    *0x0(,%rcx,8)	5333: R_X86_64_32S	.rodata..c_jump_table,"a",@progbits #
   0027     5337:	48 8b 43 10          	mov    0x10(%rbx),%rax
   002b     533b:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
   002f     533f:	39 48 24             	cmp    %ecx,0x24(%rax)
   0032     5342:	0f 86 04 15 00 00    	jbe    684c <___bpf_prog_run+0x153c>
   0038     5348:	41 83 fd 20          	cmp    $0x20,%r13d
   003c     534c:	0f 87 fa 14 00 00    	ja     684c <___bpf_prog_run+0x153c>
   0042     5352:	89 c9                	mov    %ecx,%ecx
   0044     5354:	41 ff c5             	inc    %r13d
   0047     5357:	48 8b 84 c8 e8 01 00 00 	mov    0x1e8(%rax,%rcx,8),%rax
   004f     535f:	48 85 c0             	test   %rax,%rax
   0052     5362:	0f 84 e4 14 00 00    	je     684c <___bpf_prog_run+0x153c>
   0058     5368:	48 83 c0 48          	add    $0x48,%rax
   005c     536c:	49 89 c6             	mov    %rax,%r14
   005f     536f:	eb bb                	jmp    532c <___bpf_prog_run+0x1c>
   0061     5371:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0066     5376:	83 e0 0f             	and    $0xf,%eax
   0069     5379:	49 63 4e 04          	movslq 0x4(%r14),%rcx
   006d     537d:	48 01 0c c3          	add    %rcx,(%rbx,%rax,8)
   0071     5381:	e9 c6 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   0076     5386:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   007b     538b:	83 e0 0f             	and    $0xf,%eax
   007e     538e:	8b 0c c3             	mov    (%rbx,%rax,8),%ecx
   0081     5391:	41 2b 4e 04          	sub    0x4(%r14),%ecx
   0085     5395:	e9 73 0a 00 00       	jmp    5e0d <___bpf_prog_run+0xafd>
   008a     539a:	41 0f b7 46 02       	movzwl 0x2(%r14),%eax
   008f     539f:	83 f8 01             	cmp    $0x1,%eax
   0092     53a2:	0f 84 fb 0f 00 00    	je     63a3 <___bpf_prog_run+0x1093>
   0098     53a8:	85 c0                	test   %eax,%eax
   009a     53aa:	0f 85 a1 11 00 00    	jne    6551 <___bpf_prog_run+0x1241>
   00a0     53b0:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00a5     53b5:	83 e0 0f             	and    $0xf,%eax
   00a8     53b8:	48 8b 04 c3          	mov    (%rbx,%rax,8),%rax
   00ac     53bc:	89 c1                	mov    %eax,%ecx
   00ae     53be:	48 89 4b 58          	mov    %rcx,0x58(%rbx)
   00b2     53c2:	31 d2                	xor    %edx,%edx
   00b4     53c4:	41 f7 76 04          	divl   0x4(%r14)
   00b8     53c8:	e9 70 01 00 00       	jmp    553d <___bpf_prog_run+0x22d>
   00bd     53cd:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00c2     53d2:	83 e0 0f             	and    $0xf,%eax
   00c5     53d5:	41 8b 4e 04          	mov    0x4(%r14),%ecx
   00c9     53d9:	e9 57 08 00 00       	jmp    5c35 <___bpf_prog_run+0x925>
   00ce     53de:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   00d3     53e3:	89 c1                	mov    %eax,%ecx
   00d5     53e5:	83 e1 0f             	and    $0xf,%ecx
   00d8     53e8:	48 8b 0c cb          	mov    (%rbx,%rcx,8),%rcx
   00dc     53ec:	c1 e8 04             	shr    $0x4,%eax
   00df     53ef:	48 3b 0c c3          	cmp    (%rbx,%rax,8),%rcx
   00e3     53f3:	0f 8e f3 0d 00 00    	jle    61ec <___bpf_prog_run+0xedc>
   00e9     53f9:	e9 4e 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   00ee     53fe:	49 63 46 04          	movslq 0x4(%r14),%rax
   00f2     5402:	48 8d 80 00 00 00 00 	lea    0x0(%rax),%rax	5405: R_X86_64_32S	__bpf_call_base
   00f9     5409:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
   00fd     540d:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   0101     5411:	48 8b 53 18          	mov    0x18(%rbx),%rdx
   0105     5415:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
   0109     5419:	4c 8b 43 28          	mov    0x28(%rbx),%r8
   010d     541d:	4d 0f bf 4e 02       	movswq 0x2(%r14),%r9
   0112     5422:	4f 8d 0c ce          	lea    (%r14,%r9,8),%r9
   0116     5426:	49 83 c1 08          	add    $0x8,%r9
   011a     542a:	41 ba bd 5c 3a 31    	mov    $0x313a5cbd,%r10d
   0120     5430:	44 03 50 fc          	add    -0x4(%rax),%r10d
   0124     5434:	74 02                	je     5438 <___bpf_prog_run+0x128>
   0126     5436:	0f 0b                	ud2
   0128     5438:	ff d0                	call   *%rax
   012a     543a:	48 89 03             	mov    %rax,(%rbx)
   012d     543d:	e9 0a 14 00 00       	jmp    684c <___bpf_prog_run+0x153c>
   0132     5442:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0137     5447:	89 c1                	mov    %eax,%ecx
   0139     5449:	83 e1 0f             	and    $0xf,%ecx
   013c     544c:	8b 0c cb             	mov    (%rbx,%rcx,8),%ecx
   013f     544f:	c1 e8 04             	shr    $0x4,%eax
   0142     5452:	e9 8a 00 00 00       	jmp    54e1 <___bpf_prog_run+0x1d1>
   0147     5457:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   014c     545c:	89 c1                	mov    %eax,%ecx
   014e     545e:	83 e1 0f             	and    $0xf,%ecx
   0151     5461:	c1 e8 04             	shr    $0x4,%eax
   0154     5464:	8b 04 c3             	mov    (%rbx,%rax,8),%eax
   0157     5467:	0f af 04 cb          	imul   (%rbx,%rcx,8),%eax
   015b     546b:	e9 e9 0f 00 00       	jmp    6459 <___bpf_prog_run+0x1149>
   0160     5470:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
   0165     5475:	89 c1                	mov    %eax,%ecx
   0167     5477:	83 e1 0f             	and    $0xf,%ecx
   016a     547a:	c1 e8 04             	shr    $0x4,%eax
   016d     547d:	48 8b 04 c3          	mov    (%rbx,%rax,8),%rax
   0171     5481:	48 29 04 cb          	sub    %rax,(%rbx,%rcx,8)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

