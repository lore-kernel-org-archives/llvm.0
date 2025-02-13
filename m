Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84408206F09;
	Thu, 13 Feb 2025 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739425923; cv=fail; b=HXpFk/Y3ieGgm2AZbBSRdwC8tcb59FOXZcoGIao9NdO3NMMC9Y5BjmId3B9bUG8IHA+2gW1vGNWMdUHjE7GfaFr2OjtbIGFbLcEO5lRO3LaqxOirjca5GzsIaK36Z8KxfoO36a78hfJNPrL5ES6+p/bKZNdPHiAVdO2hRh/KJvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739425923; c=relaxed/simple;
	bh=Wb2gYu+K4ByynPG8YuvLaeX+uj0W2cWnn8q4785Yasc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q2E0FAfTK6C6tLFkHtWywRIScWf1rqkT69XG2opOnO6Wp+K2XkJJ00GCqZV3RLiF9hyTvqU3UkauqkdR5xb3uCYiF6K1OM5I9UduuB1WA5bX+W/Ws7IDhBxUSZBYkkl/Y5d6BpxfeQCPrvBc0pTxmFQr4vSaSqfWSbvgB8Qdb/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lay57N9D; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lay57N9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739425921; x=1770961921;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wb2gYu+K4ByynPG8YuvLaeX+uj0W2cWnn8q4785Yasc=;
  b=lay57N9DmlQuprWf3YoG8bAW2NdT4Ae/AapPEhMzIPiSQRdYicWK3jD5
   raNpvrA3kXQQSU17mShV+csJqygprZbfKYaW+X4UcksfPAo2pEDMy3eof
   Fc+WLSt7eGcw77INNIzrbBynK1hyBbS0pOrrwur0+hMouUd1gKT9AiKtg
   qGc9w9Fbs7TMTJWmhSwHtnSyxNxqPa1tMraFQJjmRIL1wUHpGep64zZVD
   BuX4XTPK7lb1tfIoYhUqfLcZlEXDwvrymiZWPbYGI/yjCfGH/aBoQ4kYT
   Gh+TbGONrYdB98fkOuvjmP7RYh27Et6w4ZjpjehHJmWotD2goFQMWhPad
   w==;
X-CSE-ConnectionGUID: A2jba5AvQmeab6zgBe2eqQ==
X-CSE-MsgGUID: bov3rnshRN2W6Tnj4I62sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57642949"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="57642949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:52:00 -0800
X-CSE-ConnectionGUID: BG6f+/LmT/GrCC8o0u0kEw==
X-CSE-MsgGUID: +PAXGWJ2RKuCgGUjXtDurA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136283604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2025 21:52:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 21:51:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 21:51:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:51:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7HkF+pdP50w9ShHCF//5BDnKhKu2PtkVX92px5imof5ildDdFE/BXwBM3B4J6jV8swVetF0AzD0lwu3CqUZyml0TjyeBq2V/iFTY95oCCh+chsppFEkjKrYt1pBz3AXOhdu3gOWNWnVjRoSNeC4s7Obwj9AtmdT8gcVsHYedotCEg2MRh2VYHDiXLq+4yXpK1oZ1QCPPvXS69PeUnk1fF2M0y9eRRDueLxPibrQKFBdmJPpwh9mfF2qo/hUVRmREqIenbupeMSYzjffOK7QRC4wRYjh3U9AVwQoJ4BiVwR/sMoqkUg8U0wQ3r3rvp3NxB196H5fOAjHV+xwwlDuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJYOLybl0DFbWTr3oREfMlFSjmXB9BJUWzEk7NKiSXA=;
 b=iib64zm5xxtaLgS06e8nG1/ayU2e49lTWBDiuam++xhTNph1MfNNOqCZCz6OsKdGnqlXlBusF0mX5wgJ7ZVADw60etEvbmX8l5V6wyjpVxhHrCPJ4ert5MrBQIAjt8V9ZLF5izWFRFCzwrekn23OQYmX7KIM1TzJ8HxldQQmP/GVF7IqIm4jPoLmnex14n1cpHDrIkNVCxWHJ5GhRXrUIEmAeEdgDtm/Y6vRCcNtBGK08B6eUDZi12YHzE1LU8b0g5oIT1AiQSVS+/b0QC0Uu2HRcgzJAKaRE5Wx1P2AbVrHIT1BZZrMkEaI91Emdr1LlGgLYKsu+Hi82inmW7TACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 05:51:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:51:57 +0000
Date: Thu, 13 Feb 2025 13:51:48 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <oliver.sang@intel.com>
Subject: Re: [paulmckrcu:dev 82/82] kernel/rcu/rcutorture.c:2453:110:
 warning: format specifies type 'unsigned long' but the argument has type
 'int'
Message-ID: <Z62IdAeMn71eHNqu@xsang-OptiPlex-9020>
References: <202502112058.rTKa7Z3A-lkp@intel.com>
 <555c789d-5fe8-40d4-9b72-3490baa5c9b3@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <555c789d-5fe8-40d4-9b72-3490baa5c9b3@paulmck-laptop>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: e1382d1e-0390-4afd-ba8c-08dd4bf286b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4plo8ZjVMmY6fgVhjwfsgyRHID5ojUGBgGgKD6SeejzPnr9mu8pLs0G7CjMa?=
 =?us-ascii?Q?ZQtoXOEVmNha6wtikCxuk4onwPyjBCfYbIKPh+RVN7VlmweRl2wqUCftLDsH?=
 =?us-ascii?Q?/yQHOwxNYdJz6+0lnzMPeRXPzFVwBFAFtgA9/k7dFhArfeP0zdiYO2W2kLQc?=
 =?us-ascii?Q?fOLCh6R7Qs0afi1U2FDzH3Hsv2zV09z9KFF+BvixunQ2Iko5sTQ6efFxlkLv?=
 =?us-ascii?Q?p2n3GDZEuiJdOcZDUYkAv4J8XH3u+kpdWncA+gROq3DO7uSSpjYa6CJmP+Hv?=
 =?us-ascii?Q?E00B3JVgRHK1aEcl6DS0stKrAfOltM/xLRf5L52rY7HaoYnIjaw5n/kYe6l/?=
 =?us-ascii?Q?rIfFRdhdjv/vhUgU/us7PROJKVuA5RMHelkDXKerJjI7puzkiyt3JXBj6x0w?=
 =?us-ascii?Q?uV2qBmxZZa4zz+fB5ASPm4Yd2rBfx6TF3om19o5e5A0cGfvEyDHURiXb+45w?=
 =?us-ascii?Q?+FkmwSjEJZJK5Vk/sGp1F+AEdX0Smi4b5ES4q9HQ3vMPSZ6hul5ma91pFnrP?=
 =?us-ascii?Q?I27Q1PfRcIyACiw2VPo1q0bU0vXh9eGOY2E9kuF3MKDcHX+emMy9ip0WdPqL?=
 =?us-ascii?Q?ZFEAcpR6/oT+Uyud8RhpwBbkDU8z7sbnyPr/vYl7cl+b0Z9ANnRrGuD8o3LI?=
 =?us-ascii?Q?uBGsDmqcYfSZ8Evw3lYQFbmk4vYPLPnGpm0PoC/WBDkNw0RM7KBcPLbylbDU?=
 =?us-ascii?Q?KEvPxPvaTcJrwb3pcjfs5Zhd93kTC7tZhNP0Gld4SVfOXMQVLlERTf8hHcFx?=
 =?us-ascii?Q?V6PF1ERuwyxtqv2VI7+vPqCKTNyYBYWwK90De4AI3l6WdJ5IEO5k1GBvsHrO?=
 =?us-ascii?Q?w9bHwUN7HJVN4YdXGwHKonJ0H+OwXrcmFIGUYR/tqumY5Iyrca5lmDDii4Zy?=
 =?us-ascii?Q?vnawBrGMHUTuEiEi5HpwbOuoddbt2N/GPSSLhDXwZ39vhbSwCeVo+ZPyzfkE?=
 =?us-ascii?Q?B4+xt8tE8yiSOPgzAng3acIah63xGBS38dmyYZt5N7OseBmVuxY1qbTmuJF9?=
 =?us-ascii?Q?rWFz8JDe+97hHva47SpecB7EUuiqYy6M0rBhdNvcJHkmpV2G+Wdk5qCg8sOJ?=
 =?us-ascii?Q?V9fLj8oPdEI16+R8ceuHmqAmR/OvABVWw4EjDBsIOdZqvZTo3pOZD+Em1QDR?=
 =?us-ascii?Q?+FNfEuX9UC/eq4Er2Dq6ayaQBs1k87CwqMgUK0AKm3qyrBDJl+sORD3kqzSp?=
 =?us-ascii?Q?FM3XB3AeMhrFdZamwXJDmLfWZHnRQ7JYQrNqK1Un/kX4dUgEi8YFxJivI7rI?=
 =?us-ascii?Q?7xlC1L/eAJrH7Cdrs1wQUONb69qB/DRNOkWnHJTvENrxV71NgXUC9lc/QPKo?=
 =?us-ascii?Q?T4wulgPpxZtI70jjcqpF4uUHStlQcYbgB8BLGT1D/kW02A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0rX49zA77R7kWO02SuJzOCzlvjjv04SRbH7cT/GO6hcEUthx6MbZu9COrvyf?=
 =?us-ascii?Q?rmWheVp4PISVGe4FItlLsg8eYn0VfsREbz9nRZzySxuGLDlZ+j2IyfSFwj8i?=
 =?us-ascii?Q?uKwxrSG/eBL28Xbla2lQMX5qcPSaZgwPAatwylXNKB6z09qf0eqBkvMnN374?=
 =?us-ascii?Q?oPRPFHPLbaCuYg2wIaip8NFT043Nm+q75tkSdH6uWvcp1WoINVoBbfu/Yu0o?=
 =?us-ascii?Q?+AEwoIlzHWDo068FPbUpih62adSvAac2hEalHTxrnSb3+lBBTrpvjhyHfMaG?=
 =?us-ascii?Q?l4smOj2p9Z/OwAtPa4kNdhib7TTiV6Z2ZGyi2pjQuOXZ6Q/wkm3DkBTsvYrS?=
 =?us-ascii?Q?HpTcTh/mPKqXxCxrxOSIfAnN3sGiVnqWM/O2g+Oc8UhL4H1InGyr3j4KaibV?=
 =?us-ascii?Q?GaB5v9wCrzyFSkCw0NztnPWUqtqXSf1CeCHuFq/d4o89c9GhT9O6kSVMDsdP?=
 =?us-ascii?Q?1WjjtzC8SwwYCkHAESVtBDPx9gTsu55YnalbWT3URFdVZLZgqA7IZqBbb6rF?=
 =?us-ascii?Q?2aC5Paf4tCii4UAxoUyCiquYktT/4lE6eq3uJcUHmUxuR04a43iiqFvnkS+p?=
 =?us-ascii?Q?WcpxRjFIVEY5hwT5LT+Em/Hhexft4IvUb7zeEQNPHsujsD8Ia6w9ZFYdesmk?=
 =?us-ascii?Q?Yc1dzKe7Ptn6NXH7/+2pQ5mRJW42RXuS4sRMlXFsmMW3DJMAFHJ9ET0sOS7a?=
 =?us-ascii?Q?z0qi349EV49rSPTOn2sYErpffX4JvRobZdEvIPcA+o/PUQuZAuuivWD8NzU+?=
 =?us-ascii?Q?eNMkivgMq5mm86Bls6EKIcdQgvXACvNVJ598rTQSUTw0TI2J4fYOV1fR2WWz?=
 =?us-ascii?Q?AZBRAQ2IgUv/83aVPbEM/TOwl9krHxnEsmvyzRR6kQdcojpwioCBbMhmLEuz?=
 =?us-ascii?Q?l5D4fdQ29fB9C4wRjAcnn8gL9ncUbdgXcwjCuyQCgu6u63n8zAaE12iDrCPQ?=
 =?us-ascii?Q?CEQcsBFCWmNUxnvCxti6pgM0l/3/9oj5VbfBjkb6zDp0BVbVvJ3J4xfH7Mdj?=
 =?us-ascii?Q?Q19+08yszS8+ppDhZiNhsWt7BTbL3Pt+uzIuzaNVCzSFZxOKrDZ9sIgnyLSi?=
 =?us-ascii?Q?r0Vzd5h9tjwcFuX3XLK3sKVSv/MpzhOHauLLYQWnt9sAuSSg2Us6rHkas6Eh?=
 =?us-ascii?Q?3V4zaQWsGDwRoV0GUhNIljw/7xJOgGFYSEw+LP34mQ0kQZnnyFqQ5fO53cmW?=
 =?us-ascii?Q?koTjhe9wH7yOHtvfrL9d4DE4goxD7JkPB3QvIy80wlxQI8d82UyM/JVb3T2m?=
 =?us-ascii?Q?CQva2yVdCMaoYGhBOB7VYmkAzRFzSR2zZF7m6fqk90a0ZMmDwY5b9mYMwc13?=
 =?us-ascii?Q?TT/BK1k2ZjkReIHqkzAgpKnj+RJherP2UxQ6WJA3NMrgCPj0siUbBZ2lRUTK?=
 =?us-ascii?Q?dHk95AmUCu+RJ89N+uFS2eoX0+xTCiG1af1mnHkJGZAPjO1yfBPPwlZ6tenr?=
 =?us-ascii?Q?GY7hBnkh5lTw7KSf/RtD62oDLEDx4NNiCsD1KG1sbKOHj4YBYPvXf08NRLVn?=
 =?us-ascii?Q?6txruFFcBGFU2yGhl8RhOMeedqt2JB326fmoRTzERa4lmaqBisPAwv7d7uPC?=
 =?us-ascii?Q?S2PdDHwpsBsYUUttCb4bE6LrunJtCtrraDpWB7GOT9FENgwZhHYF26MCSK6O?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1382d1e-0390-4afd-ba8c-08dd4bf286b0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:51:57.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t8QH5ztYvJgOURYnvpn8s/vhd73gLVkyjUjReOq6LkCsvb+yver5Ts+dyuGdtZ5CTFBZ60oJcrGX1uPqTtUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-OriginatorOrg: intel.com

hi, Paul,

On Wed, Feb 12, 2025 at 02:03:27AM -0800, Paul E. McKenney wrote:
> On Tue, Feb 11, 2025 at 08:37:12PM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev
> > head:   31c00ec5301cf02af354d57007bf0d79d5aef1c5
> > commit: 31c00ec5301cf02af354d57007bf0d79d5aef1c5 [82/82] rcutorture: Check for ->up_read() without matching ->down_read()
> > config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/config)
> > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502112058.rTKa7Z3A-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from kernel/rcu/rcutorture.c:47:
> >    In file included from include/linux/oom.h:10:
> >    In file included from include/linux/mm.h:2223:
> >    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >          |                               ~~~~~~~~~~~ ^ ~~~
> > >> kernel/rcu/rcutorture.c:2453:110: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
> >     2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> >          |                                                                                                  ~~~                ^~~~~~~~~~~~~~~~~~~~~~~
> >          |                                                                                                  %d
> 
> And %d breaks my build.  So this is presumably what %zu was intended
> to take care of.  So does the diff below fix this for you?  Either way,
> thank you for your testing!

yes, diff below fix the new warning we reported. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index d62f1c787bd6..b4286136a052 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2450,7 +2450,7 @@ static enum hrtimer_restart rcu_torture_updown_hrt(struct hrtimer *hrtp)
>  
>  	rtorsup = container_of(hrtp, struct rcu_torture_one_read_state_updown, rtorsu_hrt);
>  	rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> -	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> +	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
>  	rtorsup->rtorsu_nups++;
>  	smp_store_release(&rtorsup->rtorsu_inuse, false);
>  	return HRTIMER_NORESTART;
> @@ -2498,7 +2498,12 @@ static void rcu_torture_updown_cleanup(void)
>  		if (!smp_load_acquire(&rtorsup->rtorsu_inuse))
>  			continue;
>  		(void)hrtimer_cancel(&rtorsup->rtorsu_hrt);
> -		WARN_ON_ONCE(rtorsup->rtorsu_inuse);
> +		if (WARN_ON_ONCE(rtorsup->rtorsu_inuse)) {
> +			rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> +			WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
> +			rtorsup->rtorsu_nups++;
> +			smp_store_release(&rtorsup->rtorsu_inuse, false);
> +		}
>  
>  	}
>  	kfree(updownreaders);
> @@ -2521,7 +2526,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>  	if (!rcu_torture_one_read_start(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1)) {
>  		cur_ops->up_read(rawidx);
>  		rtorsup->rtorsu_nups++;
> -		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
> +		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
>  		schedule_timeout_idle(HZ);
>  		return;
>  	}
