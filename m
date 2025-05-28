Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2323CB;
	Wed, 28 May 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438490; cv=fail; b=ixjoq3gg5Dxlv9qYcC9lRoWt/Zt/fVSHfQLfO8mn0fMNnUc82vOFHv20rM00ZGCua1A908ojcWnvOxM5PYjFTG241zMK78N8X1KOqeP8AKM5jD1RVdQbNw6giS3cGuEq9Rx+gv6wdrG+iaEFcUtl3tW7kIM9YrlcICMEEWim2Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438490; c=relaxed/simple;
	bh=qWRVUTWGTZO6iDW8BxNAOdjpfnidFbA/paa2wTFP368=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lZUS9jQmF/eFhNOWt7LtZ37wotfDn8XL4pChskWAGDC0StRqyOAu/oMH6DRjLMBNBtsVaRBTiGrCWJYp74faUowMG4uy14BRqMhkQdZt7DoXWRAdTZj4b0/KSJJTf/12eK6CSX0h47DPkD9izeeEIOGSS+T/SebfNfQbsdG0qKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbJnyNEu; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbJnyNEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748438489; x=1779974489;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=qWRVUTWGTZO6iDW8BxNAOdjpfnidFbA/paa2wTFP368=;
  b=MbJnyNEuWK4aiby13thmBf0na2uXGx4hAUciqE/H67pie/DovRT8BNz4
   gWGpnBLQWK8Sx6S91cX3ovSThZ5/mrGi01phB8EwGU23gQjBZnYtRosYe
   CKH9XbKwIZlnSRo72/71WCOgeAiZDsfV8BeeLAnWQwiMSGRCFlcb21xtC
   vIfifeeqSUvV1KjenRW/nqwVxjEru67zFSdlLYye85PQY0lOW3kRV8t8c
   /jfuI29p9bMkJX/L2dE5p3Euk/taHDarew09QzXsNH7BP99D7BM+umuGv
   LHSBBJBzLC/+j+4kprpfXGxK8TGyxLYJlyEXDywHcnLLSuHvtAVY/tK15
   A==;
X-CSE-ConnectionGUID: lbS/tZwJTaKPxKWaLCeqjw==
X-CSE-MsgGUID: jMwXS9RTTtOgUijAAKR2Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75852574"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="75852574"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:21:29 -0700
X-CSE-ConnectionGUID: tSmtuHz3Roen4eQiR/ZiAg==
X-CSE-MsgGUID: udizNgzfQSmW65lC3OqmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148368512"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:21:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 06:21:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 06:21:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.62)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 06:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCK5i7Lyg/V2o8dNUkuzCaQo9uLRU0l29IEPbagJy0v3c+8olrMOdmFcysS12yRkXjOZBsP6wFxqZsD61brx+2rrfQ/03AOzxQAklHlRNQOcb8Mi2RkTuupQjpG+iLJLGX2gTh4nQF0iqMIeW056tfolbO39yd+rv521bBmxIB4T6/zccOatWW3GVUB1hDtMyCLGtsL2MlE3PK2UGK4WOa8TgHbJ/huubgAEEN5wUnYqaazePgzExh4zCrTSJMen+OBdEBThXcVUW4FCyjtbq+Qa5tZMfbg3Ip25lNjkCiVdk5z3G2jhWlfVHflTpCrtTtTSSjLy1GFybg8nfgUk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYbbeSpzKIFLP4eY2pC1AKBZXoE7KqH8kw1oILQzyzg=;
 b=IXvxQAo/JF9sYhjluoFuol+YmDvSKEcOBV/ZzcAwahqUv+9hOGUHCw5ArM7YRtCycZgOCRM2BmJg0jUF6Zmc2rEOiTcSAhziI7yxC4XWRTyrHYFIND76PXx9Zhsa7EEhjs+jm+pTzSwDIG4o2t/LMKNNB25NP10QrXykX8eCYslLA6DQLQOgQ/KLV85GuA7uGyjJnueUxoEUiNe121qZSWN/KPm0H4J3jY0x9VlSfiQDNPIqrBuJWV/QFrDPx9B9wWHD+YL8dZTAOnF44cMzAX3KSq97OCujK8ceMPrw2A9JVk9DnHbjUwuLTmlq2AeFnmUaVsdfw+z+f0QBqGlxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ5PPF6806D69E4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::831) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 13:21:26 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Wed, 28 May 2025
 13:21:26 +0000
Date: Wed, 28 May 2025 21:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another
 makefile
Message-ID: <aDcNzoM9NF3SN+WH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion@kernel.org>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ5PPF6806D69E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 019ed727-a56d-44e9-8fda-08dd9dea8c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EImbUZ+Okjyd4l74A7EWL93M12sdlGxZmG94sFADTTEh63nVKrzjakxOcJE6?=
 =?us-ascii?Q?THztJMntPZbI7oULQu520NqyB0EbNFNxLB2rZCLLX8ORoeYBYbJnhstf3V3H?=
 =?us-ascii?Q?YvUGLdvGbaGVInhiS+zyebg+tth9IF8Gj1EzjrN9TuV7XTdlRcrqTkmnIEvQ?=
 =?us-ascii?Q?/5IW/qiV91jO4xLgaxXBtOmMHgTUhuPKh8FlAXdETZKyvJ1eoIm86xycy9pr?=
 =?us-ascii?Q?RJ1h1MelPlF1DKbWJBbBZeoEpqIr9NPkijwb6JSEws+KyUoxFEo9Bk+JCqKt?=
 =?us-ascii?Q?THZvb9Rh1k6QxqB9AD3rqj4NcXH3QuUNQLwQ8zHd109GYdhRiRXx7wPrBiy4?=
 =?us-ascii?Q?YyaccqRsAxfe1KWc7zkHJQDEnU3HNpqGfsdTPqqypvpzjEr87reIvstC6tWQ?=
 =?us-ascii?Q?d6ekKBbIbU2rjX/8qqMcUAwwz3U36Oqxsw9kJ07gjB8BJ+GPSD5hVaMnOKkW?=
 =?us-ascii?Q?xJtkNsHRYqasAbSfWv0kDNkjyirlVPVRMzD8IaW0uuI+2ftO3xZNy3CKHa8z?=
 =?us-ascii?Q?hgeof95aBKiLWKe7QyIg4mwcKBrJUieUv4DDKzhEj+JHlrCI5J5iss4H+Cmb?=
 =?us-ascii?Q?MqGoOiq530rxf6MVhMEIAOD2qVbQzWRrGNApcY1XmjF/NK9FMcmHBFR2ik5a?=
 =?us-ascii?Q?BgSp2Xs/aWoS5tp9ASqUXEl9gZ3bt+UpCz5YMTl6LC4ZpQ1dmBZkrAhNal+C?=
 =?us-ascii?Q?gv5yYbmFTf5TsNttAI6JOVPa9T5NJbYtFGjlzX1vs755KjyGVCC6ZGeV39gG?=
 =?us-ascii?Q?qlh0chhEcx9rRBcq1ohDXyw9/Pe+YWJFPclzmGD5tXFP57geEdyzlNDW5WHK?=
 =?us-ascii?Q?5iUxHREz12D3DLoXXCESgzXu8ieLNJAHXHuhD3EJeb/f2WEHh+u9Kj6QlUvr?=
 =?us-ascii?Q?b5EWqszVJd6n5JvDWtdY17j1wWEyw8e6Btur12ajFsm/p7y35F5QK8MR/kB9?=
 =?us-ascii?Q?ZCi3h35gtLc3trjIwdxZYOj4+o0za2+MVQOUBzuTHxBZDxvjlQhGebJAZKed?=
 =?us-ascii?Q?hqLlnX1DoYfh5pZt5f66Lca7gfKmUjRb90VWECtkudXtkfLkF+eIfEb8RXRm?=
 =?us-ascii?Q?MAam892hp3youITRsGvp0acDUw2JmCfVAYD+MHNqrpgKH1q6y6Wv2hxPw6VE?=
 =?us-ascii?Q?reo1dWknBTxhoi7SxKRARLxF0/45HVSq7dAZWYHlJT4KjbpnyYrQvPTQH9O5?=
 =?us-ascii?Q?TsM/RsW4q7sgGvE0GC8WaTFEVB2zqX+W+6PDlqJGQEPY3agHikm+JVGS0H56?=
 =?us-ascii?Q?KO+glF0ZT1KOTO5RTuG+JFf3Gu8cHR9gN9VSPicuOejC8p97iXYCheVG3JEg?=
 =?us-ascii?Q?q7SMrWgERAlvu1JI9PEG0zaCcTkdWFJiesOoKI/VRn3P30rQx/JaC2ScbvgK?=
 =?us-ascii?Q?kLE24LntI3f4Bh5cuVuFZDPm2jMR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVQVkc4IsFuXuUcD+5ho6qN1CeaDVqSh2IajYwjBYubZB9UUkHYblq78kBRM?=
 =?us-ascii?Q?msGBUDR+OCA3/xLcGXr5rgsJ91Sls2do8+vpQbeMyRMcCHxtviACElrX93Li?=
 =?us-ascii?Q?WkuQdOFVuoMqn4bGTMHo5h9LALYA4k+2IWiRw2HRJf+Xcqv+W4wWYuxglUVk?=
 =?us-ascii?Q?lscvkbJ60vE/zBJqV5cHADOMLVRT5xmBIYkrRi9xhxIB46BaegVSYKCFh0O5?=
 =?us-ascii?Q?DiZhSgeoQBeehVcnYoF+SHSgqJT231aozD2rdR8lMF7RI6MUKv5Wz9eK8q1D?=
 =?us-ascii?Q?JwxCnDU0ahGWFRI09JIWy35i1fokgwqvS80hhFUfv5PBm/U6ZzIrVK1naoOr?=
 =?us-ascii?Q?biCqnOJNNWHvUeMRPGtbDf2/punmggqtZ7T1OhCfKy1gNbxYQH4urOdJnaQ1?=
 =?us-ascii?Q?ed7KD5QkTMGk+Fv4vQTvL1AUbZ+ycv/K+jKPahYMFOVF5lTs0OnWLaL+yJ0F?=
 =?us-ascii?Q?hrXv1lxZAHMO+FD21OraD731qrgEQ3At+tk4F4mn0PgtwezytzekMrw+i+UA?=
 =?us-ascii?Q?HH9ZohqIYk53VARPkYAkYk3rpuYcDuQtghKKlJJFnYoCyWtLK8WyTEg6J3Fe?=
 =?us-ascii?Q?8LVPigyvpy+BhIfrzIPVX9shSV46PEEh73am6YhNLkyUMIwPXP5enF2fPp6A?=
 =?us-ascii?Q?Cjc7vbzxd81rpm1Xb2EgKqQG8YnHP2Tdkl+Eh7TB3FGBeO50GvScL5Ydjn2l?=
 =?us-ascii?Q?KmKJE/B8kS9WBBQqmoIuz/gfXg81pccwVURRN3TGTciC6QisOvseDrgQfNAB?=
 =?us-ascii?Q?onjIXkSdtMHUZJsFwtZNTp/A/obvvd8B3tnyDY1inCgtMw3b2y8SoV711UEV?=
 =?us-ascii?Q?7qpMyOpdZ/Hcpn3JB5yKpCm7lQTvj7FTj6BfcWWMIzbY0fK+4hW+UjgywkyG?=
 =?us-ascii?Q?rmbxGA/QeE19wTgnox2FYoV8CCw0OboKgN9nWMIS7w0eU9YvelxFOdhRFf2p?=
 =?us-ascii?Q?IWovtNox7M4/1v2fEshzn7hw+BVgYML0GqUt4GwuzQO2/6+KRmknxQqJQSCL?=
 =?us-ascii?Q?qoIf9uE6PXu0ooh5aQWZOkEt2YUKx+MQ4nL8/haCuomoJiqyRIBhq34GG4cL?=
 =?us-ascii?Q?TJmHG4QUvQgQhrs4tVpQPgSTsC5qdcAM5Zhs3seHAczKYMkvJ3Bs+Ohjcqmt?=
 =?us-ascii?Q?j2vafovUd4ygzrl4NA2N0yEYTHQXOkB0BafmGawvXJdmK2u9vffzFGQZvYff?=
 =?us-ascii?Q?501yzU02TScEkITHo9oFmT4+OZ43dQ1bybOw4Gi8dZQH+ULrcfGxJUSN0z/H?=
 =?us-ascii?Q?pmYH68HmCPvLORx8CbD6iA6zKZR+V4TfEGyyO/6dS72J639oXRhTslDRp0ba?=
 =?us-ascii?Q?t2pSBlTWuulFIOA5ho3k2QWBnCgUUuGiw+7X2MoqotyHAmSItLrOS2EB2anl?=
 =?us-ascii?Q?3Kwvgv2wKGimcy/YM8YOFYLrTpHjzQxNUoANgX3D5Zu9InemhgXEgI/1vSwd?=
 =?us-ascii?Q?Zk11CvKPiAZV3NJXEaM4PdDVaDk7HbYFLu3AwxRkqVQHRVAaZ5erMiGNIaeV?=
 =?us-ascii?Q?XqzHDKeSMpyzFP0/n6d0PEent54InvPXX7fbo7/gf/sRemmQeEiySco/yX02?=
 =?us-ascii?Q?JyiwqprkqHToDXm9Rfv76wiqxwyLNB++XUVbeTHS2mztGn2Cm9sKA5lXXPFC?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 019ed727-a56d-44e9-8fda-08dd9dea8c2b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:21:25.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWKzvv34hX84+i7xyLymVphfCKdIA8iBpdvz5Imxn+LtIPe0MMRCpGGJT9z9JcGmGbnxHIDtltswdm2l+Hej1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6806D69E4
X-OriginatorOrg: intel.com

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250528]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Gladkov/scsi-Define-MODULE_DEVICE_TABLE-only-if-necessary/20250528-020814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion%40kernel.org
patch subject: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another makefile
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505282010.7mkEeiON-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'modules.builtin.modinfo', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin.modinfo'.
>> make[3]: *** No rule to make target 'modules.builtin', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin'.
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1909: modules_install] Error 2 shuffle=3457807955
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

