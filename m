Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100F3C17;
	Mon,  1 Dec 2025 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764554426; cv=fail; b=kNKm6QcnblktCuGzdIwGM+8Q3sdLAmzEWRLo108ho7Zr/3jMwn0mF7gNF9U0eO6lzZNChCDKdmZWRNATJCOjEgsW6HAUZbmdgF9BW4ifzFtSzhlLnmBuZgNy/Iyi9oVnDnN0rqdDt5Y1OLT39TeQ+0HJjBE2ZFHe0Y2QaZI8Ktg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764554426; c=relaxed/simple;
	bh=zWnW+U19hF6Wv4l1Nxtz/8xVxBQW1TQ7byFU2sHTMwg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sx0zwOCqFSPBxKgshWP2duKfcOUL/rGaAvLsM3G+KlKCOWvaNkhH+wBWLkzmNHFHNyHHmZeolQzV1AFnB/u1dO79qFRCuqVlwRnfY699/+o47NNMgmfz9JtW9VYzNwEeblDy4rJEnIThVk8dDhyuU6PCL2lkUGN6us9aBaWqGwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXBW5kln; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXBW5kln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764554424; x=1796090424;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zWnW+U19hF6Wv4l1Nxtz/8xVxBQW1TQ7byFU2sHTMwg=;
  b=OXBW5klniQUOK9twSldKeRXQYrrYl/AekAXKsGCX2JS5aJPdmmLSC8nj
   OgLzuvzEDrqdi8ef9vLBRQgLLRIq0tR9ukxP5hpLVLFVT1V3DgLnaWQUS
   hsqucokSDGRylbHXd424pNwCCOUYzUIXd4yJ6cmJ0B893WOiGjKd48Bzo
   DM6yRBpl5DqITc1UjMmDhGLCR9Sx4D+ADCWuXS4aq6eyYSw7ye3qjV970
   CCKr26vBGJDi1TIO8Cg56XZ7Bet7+nVI4vWVnFkJCuVwinv+rZJs0e5tk
   JEf5P9AeVaI74fqXkjQoi3QdsFVVT7fswF+qK9j3YjHF3YjY7DxIvCr98
   Q==;
X-CSE-ConnectionGUID: Lt08UA/FSheUfSMGZu2+Dw==
X-CSE-MsgGUID: 070KtmZjS5esTOeCvQ+wMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77588452"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="77588452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 18:00:24 -0800
X-CSE-ConnectionGUID: Ev9MDQ4vTMSAHko+Lios9w==
X-CSE-MsgGUID: usHoIBk7Ro2iRne2ydsMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="224906408"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 18:00:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 18:00:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 18:00:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 18:00:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ythNlcXsOKbmYZmYPh6jaNuJ0mOPkYzGYrY+Kq/iJD5lLm5Wvexs+Ylny9iOBbER6JQZ2WQGCrC7x/wUeYrkwanxDI0wQB6SuAI827yrTuPtreRmy5PdRWNUfJ067ela8byyitbiWdMGYYNFMvX8qF+DBJHLma1w+K85p79sdACoukPAED/ZD3CoS+OaRL1RdLQ84kzmrLxMAJFxOOBaYSpgNg0yg/jNiGyr1nON+x7JP6rDUmt7VMi+PBWBKa6uEbNpjF531srd9wLjze7ByMF5evgyDfiWcai778JV+Hedgv70Ovg0KsUcMWAOHGbmGGaATEYUtyiae7ouMdRSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhH5wbpSfzlpXMsl85NKePhRdG5o9G9UngU3rtPLMu4=;
 b=ug9mwaQQBhuNJO5muue5ArBmdhn74V+YV1FzhGzIOhavkGDeDD/DkZXPbyDdnxYb94Fw9HAFocyIw825jTfO1GDwrWSE/exveVhvNJG2W1EBHY5g2WIbB5LdpQ/KeyXupm7QSGk3oH4lfg1N8/ix+iyMSNFj1pd7GbkdjoYmg7mQS42fFWoX5HIHBUuZOkwXp/2CHEfvUMm2OQasV++zwYG/aW+6/UdvsTi5zWU100IugjaD9WT0PRF80cgE14brmm/buxEM0jjkSg96V85PCI65FkPw+dnGe2rOKHteGUBudepxn70W+5TQVeWnrwXBjZOc46h1rCR9ayIkgxJn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 02:00:16 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 02:00:16 +0000
Date: Mon, 1 Dec 2025 10:00:07 +0800
From: Philip Li <philip.li@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>, Jonathan Corbet
	<corbet@lwn.net>
Subject: Re: [lwn:docs-next 64/66] Warning:
 sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <aSz2pyrJvGiVi1nv@rli9-mobl>
References: <202512010746.EPe9Xcp5-lkp@intel.com>
 <4d298cba-7e61-4933-a765-1f8a60b8f0f4@infradead.org>
 <aSzktTVhHy6EQUg1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSzktTVhHy6EQUg1@rli9-mobl>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: d40588cd-c61d-45f4-fa62-08de307d5f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3p0Rxok5D1zaAvhJ8v3I7sC7wOB3dZXdgvhCTum6f2AoZRVP3e7AcK54niqC?=
 =?us-ascii?Q?GPgsutXHP4PpyI58Qw6XO3d5zVdX6br3/nncKqvZY3Z8Skadv4RXce+Pq88j?=
 =?us-ascii?Q?+GarXqUkm58PenzjbM/couSIcRegdNGnzfwuJrQjPDez+6V5fjRV7wxjGry5?=
 =?us-ascii?Q?t8GqEOwT4ooK2AwEQLZC8umSs63rMHRQG0DXHWdvkmzaUNxKf3cGZE2f53YW?=
 =?us-ascii?Q?vjs91o3TjQpm+lVXZP2uFVjoO9VS1sApOfBHr1I6HJQCCw3r9pIHF4svLmN6?=
 =?us-ascii?Q?1sARAVhUBH+bIhBKk6aUOT3CCe9DtSVyJFUoM2d5rtbJg+nxZm+HG0fKO/as?=
 =?us-ascii?Q?ZKV28ctdQ5dYmPNXKXOIqbS+j2SuP6k43+WCvUKsL+prVfb9yWRfxNZkQfdr?=
 =?us-ascii?Q?DNwjASV+E5+CaBAWn//L1ro74KWef512c1bMSfZHZXjMY7QqIrKjDT8FvjtT?=
 =?us-ascii?Q?fD7OmsQ4tJS7XpJvqJtJDsgfiPFxcvdrjoX73bN0YPc3shCI8k/IjBxxmgFW?=
 =?us-ascii?Q?68AeCtSJRIn5ymJDHv0wg9t/LSQs0ifvDtU50+Fk7CsDotX5QYJGKFB2R5R1?=
 =?us-ascii?Q?JMMw+HI6kKJbKoOmFtj/HAuR6/mGI6Kp5ps/7if1JfjJ0oBZhjGbsW3IJUiJ?=
 =?us-ascii?Q?xTEFeH0H/9jxXtTrDXCV2qRrI+Z6kIKgkq5tR/LqpvG8xS9hywoRmX4Na7Hj?=
 =?us-ascii?Q?rgibuzo32tD9xcITBMuPfUg2beZ6Zq92mDpSX2do5U1rjwECs+hM9V5a+iUK?=
 =?us-ascii?Q?GUoB2fgG67N0SHAuHXvc0GBL7skwMGjXFhr4Tu+OTYL68g3t+j/kXTJQ2/6s?=
 =?us-ascii?Q?XL1VA3jZcvBgFv0ZQRKT7f5fI0tyRzXyh3KdZP7jb5qb/3WQZ1sTs1oYuiGN?=
 =?us-ascii?Q?sybkw0PC9DajW9QG/eDox+e5e03lFX45vlslo42X3f3fzApxiDQeXxM35H1I?=
 =?us-ascii?Q?z8PpNeZBQBhQ0V8ao6FBSTA/1dhIRZP8WXGyK5reKqIOWNBGA03SeN3KgEAP?=
 =?us-ascii?Q?6xcYzCYyfau9AV6DHnARcaz49xmeoMRpOGgPf3jIrole4fJinfz1A9f1QihD?=
 =?us-ascii?Q?a3pVfbrERWflLKMZGlBdqmtCXrFcp9d4qaU7JbRaE7+cySeKJbWZ0hgi7AB3?=
 =?us-ascii?Q?rfIUi3PyVS7Kn8984SQzlzkyAGJ2KXgOvSaD/Yv6PO4N2TRsEFeejZ8m3E01?=
 =?us-ascii?Q?Ubmqg2l4bk4t6jYtstA/FoBe+D6tGlIKIdUwWomAc23yGNyvaSqwW1V45YX9?=
 =?us-ascii?Q?CYW3kxgjZx+rGXjMTfurWEr5X9Wt0pG4LfOcFnum2ODXyeVmbPVXmNlbn2Gl?=
 =?us-ascii?Q?fedg7tHwaeMHOD9CNRKy/+z+vlBs9Eh/DhR7d/z90DWSlqX+DSx8LDMCVcEK?=
 =?us-ascii?Q?KPYgcCP35VixATQLGUuJhmYD5XsyBDCHxpfdHMWcdIEf69GsLKOn6yKeLrSW?=
 =?us-ascii?Q?66rr7sylgwtADxmeUDJThNX+/2EC2ZwZ6Mm9IynVEc65IcOqixSitg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fVhPxTDZYZab599LQ0Ng48Dzv01wyBwt+7HqCPn4xFzugAH1bP8KdvOraJRe?=
 =?us-ascii?Q?6JGqwv24dih7qokdsGty8NZwV4ead08mtHxPvhQcCbWUnLjwK+v2GGQBJfs0?=
 =?us-ascii?Q?G2bv6I+gK0l63qzF+meA2XrGlFJqhtG+oOihmxZbeAMuhECj/xT76B3Sctdg?=
 =?us-ascii?Q?cRsOR4hf+q+gXaJnzBmCDCJE7ti4ErqjIgyMmAfXuw7cZQA8KkmT78NbBVVk?=
 =?us-ascii?Q?ab7SMgbVZLQGntF1u99nJw8tkc3xb56nZNZh/E/BisLxtqTdSKnvmTvhwHEk?=
 =?us-ascii?Q?C4vkGBEkUrTB0wms6DvxyIDtd5Ju3+HdkNEZUtWK9Z5n5NYYt1AwVoTCZ1OX?=
 =?us-ascii?Q?1bxrRx/VPY2lSi832BQZXQbQ8URwKwNFnZgWPASwBfbiUe6vb/Lwgmw0akrL?=
 =?us-ascii?Q?AXvlPX9/EFB2Ui20cihGTZBa6x3bfp3cqAPyFzDlW/tojbQxbaGZNXhLtq5O?=
 =?us-ascii?Q?uv/P4sJ7A6VjB2avAdIE74JwO3xqS9yNIsCmCZhAiis7Fo4DjQ4Ou2+XsnMU?=
 =?us-ascii?Q?P4MY3+BwkYjDG+9YSymkRL2EkcqYNx1k6SCF0H7v4bIr7crdK7LDZJSiRMxa?=
 =?us-ascii?Q?AKBXiCLHT6YNdQSpXF2OJw5stm59miJbqIOALH53QDgwCgR3huqFngujLE4V?=
 =?us-ascii?Q?hGIbieFpCtNKlS2s0q/wvX4/UsqhWel69ZU9IVz3aNr5Y9kRwIe9iisfnlEE?=
 =?us-ascii?Q?ibOWjwQe6pQIFawQNQQZW5Rx2yWGCTutPPjA5ST+pkuPJFWS/CwOfLeoZoO5?=
 =?us-ascii?Q?Lks7Md70LrxzCl5ip5iGvxrV5FL0JGIylCduV1t2mT8sHq7C3EXGq3P9HtXm?=
 =?us-ascii?Q?LJp+9zYeYR4tTWIFifXiGBENp+Z1Fxg6Q9vxc7S0G45gg/sWQ6VX+aiJdQjY?=
 =?us-ascii?Q?pE7ud+jZl2V79490DMu5tV4cQ0eN5YhgRNgKSnWceZ+RG7Krv4MROa+wKScS?=
 =?us-ascii?Q?hAa1HYF3OziW7oA7SHiX+ij0ZodprReghQdd4TfvMpCQ2U2I9lzKzVGQB+CY?=
 =?us-ascii?Q?NDTivSiJynzvGr4za3G7iU6nwgqQO2lRoeR2zUZ9xNXkHrPM5MiQ4U7U7jHR?=
 =?us-ascii?Q?NCRh9bWttBtHV1nVKboTah2H2D2ruRG7ITFJ2rrSE4w5nRJK3UMRR8KiO3Je?=
 =?us-ascii?Q?6hXhKtTjGNSWTuuSaCZYLwG+SkuJlQBEdZCq+wVHPXwLnn4X1CgheZlxMxVz?=
 =?us-ascii?Q?+QirTNTS4Ydpq7by4OPBb2kR3tUzO7iQ/FeFV9TDGDE/SZr1BXjnYkNXc3fQ?=
 =?us-ascii?Q?WUFkwjsGExpTIplHLMJnqAATRUTNcUYcbe3kr6UZ9zW1tqjleH2v6r+t2a7P?=
 =?us-ascii?Q?v6ozx94apIIxGWHwiCLEseyXS28MRYH1GTdbF2EZaQmcxmmy0mEAvONF/zD8?=
 =?us-ascii?Q?JAc1vSFiZyZBvkTJmo8ot+b7yfngudZyVmYJj7iTDTMZuPkWFbOFHyTad+eq?=
 =?us-ascii?Q?YLGfIAK2PBSkqsgMaDz64OQ2So7MfQ+40gpRnNskLzQqGWAYoyqP482OMR8s?=
 =?us-ascii?Q?9qXN8GeErZC6C23dpLHhijkEqNLR2A65H/YlD5gChRaltnqvf/gYWixjDqbX?=
 =?us-ascii?Q?DUicwuPQwrZ7CC5sqiD9eOzoaJP9ZOs5S7pKd5o1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d40588cd-c61d-45f4-fa62-08de307d5f6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 02:00:16.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHzQC1x9cjcQTmeADxjbGIQn1QApOGKuZ+WXvIy8ctknmvbHrJlrLJi769nhoM3uwKSJZQKRMZAioKmnSAMdqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-OriginatorOrg: intel.com

On Mon, Dec 01, 2025 at 08:43:33AM +0800, Philip Li wrote:
> On Sun, Nov 30, 2025 at 04:20:59PM -0800, Randy Dunlap wrote:
> > Hi,
> > Is the robot an AI?
> > Maybe that could help explain why a commit that fixes spelling,
> > grammar, punctuation, etc., causes all of these kernel-doc warnings--
> 
> Sorry about this, the bisection is buggy and identified the wrong commit
> in this case. I will further investigate and ix the issue asap.

Hi Randy, it is found the commit slightly change the warning output from "Refer Documentation"
to "Refer to Documentation", which leads to wrong judgement that considers this
commit as the first bad one.

I will think of how to avoid this kind of false positive. Sorry again for the
confusion.

@@ -1179,7 +1179,7 @@ class KernelDoc:
             #
             else:
                 self.emit_msg(ln,
-                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
+                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst\n{line}")

> 
> > all of which seem to be valid warning reports when I have a quick
> > look at them.
> > 
> > 
> > On 11/30/25 3:12 PM, kernel test robot wrote:
> > > tree:   git://git.lwn.net/linux.git docs-next
> > > head:   464257baf99200d1be1c053f15aa617056361e81
> > > commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [64/66] docs: kdoc: various fixes for grammar, spelling, punctuation
> > > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/config)
> > > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512010746.EPe9Xcp5-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:6 Cannot find identifier on line:
> > >     * @brief Text descriptions for playback output source options.
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:7 Cannot find identifier on line:
> > >     *
> > >>> Warning: sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> > >     * Used by ALSA kcontrol elements to provide user-friendly names for
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:15 Cannot find identifier on line:
> > >     * @brief Text descriptions for capture input source options.
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:16 Cannot find identifier on line:
> > >     *
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:17 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> > >     * Used by ALSA kcontrol elements to provide user-friendly names for
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:100 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_line_out_control ='
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:171 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_digital_out_control ='
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:259 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_12_control ='
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:330 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_34_control ='
> > >    Warning: sound/usb/usx2y/us144mkii_controls.c:408 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_samplerate_control ='
> > > --
> > >    Warning: sound/usb/usx2y/us144mkii.c:13 Cannot find identifier on line:
> > >     * @brief Module parameters for ALSA card instantiation.
> > >    Warning: sound/usb/usx2y/us144mkii.c:14 Cannot find identifier on line:
> > >     *
> > >>> Warning: sound/usb/usx2y/us144mkii.c:15 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> > >     * These parameters allow users to configure how the ALSA sound card
> > > --
> > >>> Warning: drivers/infiniband/hw/mlx5/umr.c:986 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> > >     * This function makes an mkey non-present by zapping the translation entries of
> > > 
> > 
> > -- 
> > ~Randy
> > 
> > 
