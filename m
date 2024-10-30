Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F01F4FCC;
	Wed, 30 Oct 2024 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299852; cv=fail; b=HKSYjnKSZdtqkHBppnTcixXn2i5Uyy9AA7aC8eL4jtQtF+wzq4HceISNcYBNVzxTCkQbTwfTOvM7vZYqUTiJNQ0cMeL29ynBnOKUlC6SZ6G4slH9JZtcLkvvGAq74r5u6Rb6QiKQ1kLoHqW7uZx7PiRFd8nrALFG3aKwmkhWfyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299852; c=relaxed/simple;
	bh=Cxfi6VM3ucRfC3xmRaBTPkK32+1nshq18nnyZztqUUU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iQaOrzJHbz4hoThw8gAhLy5Ds5T1Czi3Z3luI815tf6s6zmyfT41esoUqYe/D63q4hB/4f8QUHOMSeETCL6LmI09Q6d1apsoXmBA3Z0YJ6ckqY5Gtyf5x0ZA/CFBcopCz2V5fgeXghzKF9ROxr1xcA7bHozQQWPDtbGZohMrLMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWEggKkm; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWEggKkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730299850; x=1761835850;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Cxfi6VM3ucRfC3xmRaBTPkK32+1nshq18nnyZztqUUU=;
  b=GWEggKkmWwv1ybPrQoxHYR/quSHiE8wnqQ/EHrqskS5Q2qqQT2640OM1
   uMDQ+B3ogWMw47RZ/6BbwgeZmQg3J23ekudUhvTIb2Dqhu7ktQaGS/CDV
   KbGLakQt/iFw7mLKzpl2Zjvr0ZgdDv3PagYfxXmPVGICrfTuCs/KwbyJR
   7oo2fMZTOTRYFRkh+MJczHFYjOQFVnb6blK36y2c37mQdUuqOR40ir2aT
   ZP6PQtdQa/2j9aGtmBoQTOOm4tzVy21f8HTFIh+3ExCMDanW745mLcrKY
   whfW23nzEDQCo2yAedZacP4BCp5SEncU5BrYZie7nT7cnhvcBSQBNsz+T
   Q==;
X-CSE-ConnectionGUID: LcZTTEuuQZm0iwI6alpJRA==
X-CSE-MsgGUID: rUciYsNRTfiff9N49+JMSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="32843891"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="32843891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:50:50 -0700
X-CSE-ConnectionGUID: ODXpYtCkR+OF0GUuEpLzwQ==
X-CSE-MsgGUID: otHPDKGQRQC2+doI3fQdLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86269520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2024 07:50:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 07:50:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 07:50:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 07:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSvmv6ELCQ7pl3u60vu2nj2frf/EAOaKp+9gWCk2cc5aJKFMMlnPnW/VDboLxA3Zd861/ZfCvp42Yx51fito27srQZ3RRlAqU3IUIGkNNqwMtYb+JcYG3cX5se2BVRZ4lIWnCAZbndtBRUFfFjM1An/iB8A8Oz8fJ0AwQ9ZXVtXN4hgAAQSv7RU7JyHJQfjeypudqJVe3ANQMmsm/2Y0Gah7BJeIddTIHxC4EGhrPuCggCGGi4Ralyka+Hqi/Zor3GCHzXDxK/hcfccp72BOLbGhJgn7GzSj9q7oG1XYnP7+3uGfimt5dqd38JPQnxxQxz6jXOEyhEyHPNO7C04mUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/taZ1yDL4v/OQDT56y8/U15Y6K1S1tKkC5xlM3k+YE=;
 b=TK7m7fNmXdvWdOVhZQU3K3gjGZGeX0VnHKzrGIjtzCBP3hsp9JCLGAsYHPFMCvcya3GusoT8hpY9DAsszUDBfIZr6yVV6trqe7jQhsoycLZJdt6M84KGs+L4M1APM5B5HHo+7A77y7OFc/7vL2nCo1P5kLr136uLxnDk1V+FlfgmEyXesUSDkNZlJF8FTq9AgMETA8aN8hN+Sla4ccnyQRkQayRXXPY3zMeKZDDG+CuSgU/Db3XKZ1yHXmrIzmFtj5/n5opFuuMrDAqN++9gfBicmODGMzr89qVxDw0i9HemcVEVKKb7/023m0DgJWcNSx3gQOmh69m99wFZ7+C+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 14:50:46 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 14:50:46 +0000
Date: Wed, 30 Oct 2024 09:50:42 -0500
From: Ira Weiny <ira.weiny@intel.com>
To: "Jiang, Dave" <dave.jiang@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Ira Weiny
	<ira.weiny@intel.com>, Navneet Singh <navneet.singh@intel.com>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>
Subject: Re: [weiny2:dcd-v4-2024-10-29 9/28] drivers/cxl/cxlmem.h:755:35:
 error: use of undeclared identifier 'regions_retunred'
Message-ID: <672247c28d533_3ab9829427@iweiny-mobl.notmuch>
References: <202410302001.MMV7mxpl-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202410302001.MMV7mxpl-lkp@intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SA3PR11MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f983f1-31e1-4cc5-afc9-08dcf8f23cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?69iExMifDvevClfhDVisXgvov+HujGz5wa5JDiqbbE2MbY68f0+R82O1bJwI?=
 =?us-ascii?Q?tr27at3uAPAhsxUziVCyk8fAkZ6ks7SFR/DML7/hd/lcm2PUfdMN5nyXz/E9?=
 =?us-ascii?Q?HBl2s7xT3aswUS/etml4IS0rlXrZSw1I+IIlCRHhYR+dO1YdOQD4K1DUuiqt?=
 =?us-ascii?Q?+a0qm3B29WPci38KwQUCa1SE0UoHtyJZlk31WLIvx3Fe6vw+6OoP4GfMlG3C?=
 =?us-ascii?Q?GK6onMS8FEs74iaydPCnDH7AXLoFtNoy/ZUQ7Snws+GlEmYMxXlAAu+c2aXT?=
 =?us-ascii?Q?fDu9OaI2s1GIFdBVpOvZuSYyRRaRhyDL75HYnSAUJeUmzwbJeYLDyVR2EPeM?=
 =?us-ascii?Q?AR3+0cB47lINswp5biCy1n/ZotE75O0Zcw3onxCAGQ97Wlx2H0SHEUd9NbED?=
 =?us-ascii?Q?qijZZVzcIbvqyzjTDymyte7CGDj3L2GH9yc+0N6QF6k3mYAQwwzkUIfWIAk2?=
 =?us-ascii?Q?na0peNDeV2/tNS6udUssj1wjmTSf0t6Gu+T1JFIBsnXqFXO55M4olYKxum4q?=
 =?us-ascii?Q?XDoV2s+ZAOfZqPch6A8sGFgTKH2e4QzkjyNxAii2CXzJLj9JUpn9LGUjJoqw?=
 =?us-ascii?Q?d1PLYU56DxIDg5m+BYr/fkJTPfbupvAy3ZoIVNcN4AIoDtB8DdCVrKdFT2tt?=
 =?us-ascii?Q?OIuCE8VvMj0EhpeRE2fugGNAfcHoPiArhS30uo8FCCZpaNreMUzqojp3BOdT?=
 =?us-ascii?Q?w033jniuQ9GlFnkKLeZoE+tG7rAoY3zCLR3UcCIbL1XL0Dvy+KTyqFOJSmDW?=
 =?us-ascii?Q?eKg+CPwB36I11QSdrIHAoPT24Eoyo2PprVmh3+9VRZ8DoAFPV4D1DSK63npq?=
 =?us-ascii?Q?GWjIH/Sc7OphzoG+NJizTkDyh+RzCU0tztNebdy709FiuRCknfvBy+EwKsu3?=
 =?us-ascii?Q?ndnwdkDGVediK3PYQVcJ2wYHiVl3atiKiPLg1FmsOmkNsTo4trsuEMB+W4Lv?=
 =?us-ascii?Q?SFbhL+T9pcwBa2lJvk2DlkUEZUPyOSb9fawki0P4wZHnjZ1Xb+MmTHawmcX4?=
 =?us-ascii?Q?C8jGofsUjW6DDXpufHOcU8lfLC5Ei3RPUJp6jey6dcP3RXOFr3A+iBpjsKqu?=
 =?us-ascii?Q?NQjJPsiZX7I9kXdHCUuiu1K7dcii8/NtNd+2TpkX2E1PMd58PZLpU+f1D58M?=
 =?us-ascii?Q?gU3j9qH0s0Awful54of+DRKhJ4asn0IXDdmrc2KeIQ76uwsPWWzU3u/LMX/5?=
 =?us-ascii?Q?DGcEJMv5GpCr5DZwg+ewQ8hgefxHr4GJQVNdHLtyI9YeJ3IXaSKmyY9uNztO?=
 =?us-ascii?Q?/Z2jkvRk36lWQYXeRJcHy/hyq/PfXC/UH7yk8dLFnGXdadTjwM+1VVUV7IVY?=
 =?us-ascii?Q?LaB1t+7E6AMlT1Lz9mMtLu5+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OAE+3anK37eeUkw9lEXYEhd/SNjlOtEmYUD2MKPvhGbBQXD/WxKz+QgeJJBU?=
 =?us-ascii?Q?KmX5PMh5fQK3XsLpTzvuFt0CG9tGuu/lF3Dm2nUO8AXlBzGW+YZvs9CztQBC?=
 =?us-ascii?Q?WhfgTOoKJouZp5W8OlaAU+7VdSQuszSpAyV51tXv4wWl2AbWflrLe3uzChNE?=
 =?us-ascii?Q?L0MP7f92XuwcJGpKC6xt1IEReuoepbYJCMZzqJNw2miZj8/ZmYWT3z0Aqxp9?=
 =?us-ascii?Q?zaeitxakwiRLZCakZaealO0/Be9uv0PAZUXKr+7BBjgWocsgVbza+MVXTWCy?=
 =?us-ascii?Q?L0Wx3y8cZSlC0I8cfxpB5r88fNXf1GtpEWtTrabp5IQwC/ybdxBO9LmDSkAw?=
 =?us-ascii?Q?rBRF5Fj1f4RLQblrECDWuAodywY/B3Dqbc1bwHWuFUEbUMKEG7Bo3piLgmJc?=
 =?us-ascii?Q?RiUicxpFBGdoJ+pDbGXRGwuv1ct02bt0zORSL0Uhw6Hs+Q3hKH8fMSgeaFwm?=
 =?us-ascii?Q?APzL8ThlUxM/pAXvQ7COcGCN8PO0BwkXGJs6hEjkwTkfpd79on1DbY3hnuWC?=
 =?us-ascii?Q?mmCFVCUApTML5AwzTBu6yXwvO3vMhn1cSL2py3z2P29YCmKwvBtduFJiDk7c?=
 =?us-ascii?Q?sLahkpfRiEaplDe/wo8k0ZYCyC1h8pZsD2PcBF3JYVg8mdEvAb/8bSpwscW9?=
 =?us-ascii?Q?hDV5xbOd9EsG6p9U73uyA2yPxbwHSCs0+XzxeT5UZYRbz1g7ijs2XFHyn9EO?=
 =?us-ascii?Q?fZA50RkvhEJ8dxeTS6LYH9JUy8FfeoPZBIvYsyr0YZ3cRs2I+2NfBVHaHhiD?=
 =?us-ascii?Q?/pO22y61WhOOiX+DqSudTV1HZSNJmMjZZpBb6qYVGSORBfSC9t9sH7Ef7ZkK?=
 =?us-ascii?Q?n7nBq0q+CzpjTrCLNCuvdL0DbxOg3L80ZUIq9jSDviQZ7nS7Uc3d4tQ8UwJI?=
 =?us-ascii?Q?4A+s2PV3woDp6JOEAHAnuCSjMsxnLTsjv62YgnixUASpc/EFdyNUiZyFAjjM?=
 =?us-ascii?Q?MeMbLXlvcFmuONa1ks9McU5wISdd/lm+gIvwCbL0Hcl01m0kqvWQcBcxA0UM?=
 =?us-ascii?Q?3ga513x6UZiz6/9Z8ru/KkQG/Q/bh3qP/E5pHyH31/P0Og38/bKbxGfeC+LX?=
 =?us-ascii?Q?NUNpKQ1EkpWsq18NAZU/8tcRGpXs3XT6/6RQQ4OVkGW4yNQzKe8ryRUpvu2m?=
 =?us-ascii?Q?NCIVOBKBzKhBQ6oHp90/o7APjIYvjojaE6ECyopC8zOujIQ+ZkEmOdyjnr5N?=
 =?us-ascii?Q?89kUc0jyundqOzYWhBuGurq9LQ56E3cEGhpxA2wulH2m3KwRbi6I0VRh9GEa?=
 =?us-ascii?Q?PZoUtRYzOtQo2TlBSAzNB5Q//VdWzteMmOKSaKpgQWsyDfD1/wYzKPvk84Zj?=
 =?us-ascii?Q?M0dhmqT4nULLEV1LzZ/rFv3pByULDKXp4k4NZ1d3BvXqMUu7h9VNBSMXiVcL?=
 =?us-ascii?Q?suD/NCa+YGUjUuyZ7w86J2t//HdWAGtApohtLbzt754kyU6c5YBpjZQhO336?=
 =?us-ascii?Q?XZeBPtOyjfFRaDp+4j0UkM4lcdsQ15fJsWs/Pm5G0u3CJMcDwKOUXFtwvDkW?=
 =?us-ascii?Q?Xwoini6hbQFrgParxLpoxGdAhYpg93F1eZSlAzET4tuhnT9QRtjoaGmZrLLY?=
 =?us-ascii?Q?eMV5YOH6Hpa8ytt4n4d5OGt8XqDc6uU99QzkfQfS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f983f1-31e1-4cc5-afc9-08dcf8f23cab
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:50:46.5061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmF+AJnU09jWBI7KrslH/mvjj09XpE5k4mjUp9nBA2GK2xwijzs+xFMxaxptWDMlHvqTDsL7iEg5+1eozXNmHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
X-OriginatorOrg: intel.com

[snip]

> >> drivers/cxl/cxlmem.h:755:35: error: use of undeclared identifier 'regions_retunred'
>      755 |         } __packed region[] __counted_by(regions_retunred);
>          |                                          ^
>    16 warnings and 1 error generated.
> 
> 
> vim +/regions_retunred +755 drivers/cxl/cxlmem.h
> 
>    740	
>    741	/* See CXL 3.1 Table 8-164 get dynamic capacity config Output Payload */
>    742	struct cxl_mbox_get_dc_config_out {
>    743		u8 avail_region_count;
>    744		u8 regions_returned;
>    745		u8 rsvd[6];
>    746		/* See CXL 3.1 Table 8-165 */
>    747		struct cxl_dc_region_config {
>    748			__le64 region_base;
>    749			__le64 region_decode_length;
>    750			__le64 region_length;
>    751			__le64 region_block_size;
>    752			__le32 region_dsmad_handle;
>    753			u8 flags;
>    754			u8 rsvd[3];
>  > 755		} __packed region[] __counted_by(regions_retunred);

I'm not sure why my config/compiler did not catch this typo.  I'm looking
into it.

Ira

[snip]
