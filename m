Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D022E52;
	Tue,  6 Jun 2023 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686082240; x=1717618240;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w1Y4uBY6dDruwpH5JXQ4BrjAxUy6xyTyb7b9lMc1d4c=;
  b=QwWj/HvbD+YY8scPbByQnWAyvfvT/IgHw47/5+BEM2QgXGKFdUeyb4h2
   CFYqdbHRu8Ceaj1KYGVF9H62aV4FWU4PKkkYJac676Fu+LP9mQcoS00Z7
   +iZnDTa6LDzXsooowS8iH2bARHduW6V8DN8A0y5kDN32IpYlNs4yF5TyO
   bmLW1UCTGtx5FTgRQLL2hI27F81bCspBn6coKrhYPiMCdiVTjs5RHPdzh
   clAWqnZ8RVNfOgRM6KKZWsEeH3MYmBD5SIvbU+EvJokCuF9ZXj6+1Ws1t
   +YOGSTiPhpETBbwj1XPir3zilMSB4jWw7VoQGX4YcqpAVjQk2ZEFp8TEv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="385102933"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="385102933"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 13:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853567908"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="853567908"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 13:10:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 13:10:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 13:10:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 13:10:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 13:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETvoyvzGsOxyirF2iLOJPF+oXsgJyIuonKu+1Bs6BSEhk0m94ipVuLhVNvLBVp6omHc6GpG/8T8Jleg8a1pqLNeaQBcNr0aZUz69cvZI2tirPmNM30dr3/drCmka1w7H7apvWV9TfzjXjVeyL5Y065ZoMNoJbvpL0ShCJxzEvSx8s1ETqRjcQrESh9U9R4E75u6jozlwoYhtVj1T8Nqdi5dJI1j6vKxEltMiz0C1C9bHoUSy+vxrHU538btXojJIHC/hzHbeGMyj6EIJOxYvqWZfpiyPa+3BDq3xsH4xdY2v8cKRUIYGmdRsCHYBibKXVHJCz7R2TiyRONDVkW7FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kibLYAp4CcyjCUgeihNdZFpLgAJ2DEbxOdnTIOPUXOM=;
 b=YhI/+GIlo4kpknDQ9Ttpe/fiyoDnQJ54t8cv/iVmBNECIidFvpWW4Wfp25dXEyc0FndVeV5fbE0tYt+uEVK7UL1ERD7h/A+frNOh89tc5V3IyGFgu9wz2nddoezX5pgovm/WN7h911rMAjqbdDvpid7+RvydwJwRhOIooF7KMRX0HnkSHH8YQPCbyg1s4iY0TcYKbdMH2C2Dqutnw2OlOCmmc4rM7nXk70xILVzs0BJ1djEgWOl98VD/fQXG1nHph1OUHY3I+NXXe2VSf4YxmJaXrPlLJhkzlfxgxHoucrT32cAASjTr7CWZTqTvygvLxm6y2Wvl0yThRdzTr3Cf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Tue, 6 Jun
 2023 20:10:29 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::95c6:c77e:733b:eee5]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::95c6:c77e:733b:eee5%5]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 20:10:28 +0000
Date: Tue, 6 Jun 2023 13:10:26 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: kernel test robot <lkp@intel.com>, Dan Williams <dan.j.williams@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 06/19] cxl/hdm: Default CXL_DEVTYPE_DEVMEM decoders to
 CXL_DECODER_DEVMEM
Message-ID: <647f92b2a6189_1433ac29417@dwillia2-xfh.jf.intel.com.notmuch>
References: <168592153054.1948938.12344684637653088842.stgit@dwillia2-xfh.jf.intel.com>
 <202306050926.zKn5BTKk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202306050926.zKn5BTKk-lkp@intel.com>
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: afd50fe2-d063-4352-ff77-08db66ca129e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //AOY3QB8+lZ8QJ4qE/HDRbWEKF2r3qyKK/77TrF9zGu46wt0yRRnBDhIIVIh5BDdRn1MOcj8nV6yheKIHj0UO52//tlEk+vshv2rARe0X1rhfqC7BlWheapWQnZbTjoV7/py1RWtg0lg0pOT3zmQ1Hozvvb7P+43YtEqMK74zVirzoEq8h5XTh4iCuIrIM5Vnhu4xm+Ghw+of/yxCleFNMMqR+HE31MjdqQFHEzfzXzJWM+HF+1Fxzcn08gfy8TNE6YVjgwOBOOxUHiK7jmP3DOFtnbvLzjqu7ABSdSfYj/iy5BeiO0Mi2LUOiQwqZxygJHrivdqamWEd1yyaRmms2RGl3AorAp5XI097+78bfwxFX4FbP0snaYzh+ql8uAJiWlB7rGHrVLzrSjNG74w9f0Q+flKXyqxgKE/hOAOzBFpfHLdmM+GqWeVQtGj3Z20Uq5zxjGSgsJMY3gZQUATSS14SpNDFgc3RXXzyIVygX5MIg5X5Td6mYZUZnz+54iMHvi0CKfNk30lytzjYhyh9aDD7XgBnKHVFxN+Wfo8wUUlgyXzEGo0OOqetu8g/SjassXmL4lOd3416h9Kl1iZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(110136005)(478600001)(66556008)(8936002)(8676002)(86362001)(2906002)(4326008)(66946007)(66476007)(450100002)(316002)(82960400001)(5660300002)(38100700002)(41300700001)(83380400001)(6506007)(9686003)(6512007)(26005)(186003)(6486002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGa65PjHZCFmqEJpCKQYhs9asowz2C71lry4DwdykP98hQu3h5NUeMRwhNY7?=
 =?us-ascii?Q?x79j4/vVDZ5UhG4XQs+wpZkLgVjIWZX6s19+5OymudbbFjjKyl/K7L1sNQX8?=
 =?us-ascii?Q?4+y0Xkpq8ddOCB749LQ4JVtM7/BAZGMZPSTg0ogA+p9v8bqr1lOBmbZ7JCdy?=
 =?us-ascii?Q?Aqof6fZQ5OwH7ayKg7LN/1TESZVyJp5lOXQPLaSc1QxOspfslssQkoyWsSuK?=
 =?us-ascii?Q?RWG9dqhGpU7xvqbrA3o/0MEikY/AaNrDHZLG4Snc0Pv/XLOaFb96u+/rzSXY?=
 =?us-ascii?Q?2hRnCXL32+RvnOCqXsc8vXaakj1VCu0c5SBYwKA3uZ9IH7/DNaYvzuhNmhDS?=
 =?us-ascii?Q?fVY4ukfwaolplW51WqUvs2uiKLMMpYFOlsVYdMeseIKOOWx1Mct5ChOsxOff?=
 =?us-ascii?Q?cR2Pham8cOcV3cWn2xHNCgJv37NyVWNGWfYknRU0Hv2OeO6AuaFQdpy1rNMv?=
 =?us-ascii?Q?bbu+kZIPcu1TOghsYUhefSncRyyTJ7o2fEN8qI5HTaUhOQWlfLBqledeZ+xC?=
 =?us-ascii?Q?HZkrAkQofvPqjWBqQg5Xh2xAjoyYuhJB7lRAsJlgBMAW6jAwEPrYLaFFH8Mn?=
 =?us-ascii?Q?o57UGRQ9Iu6QWldD3OZVFl4vSocaM5Hvpw3kahLYiJBHaIiq4nyj+XO7A5AK?=
 =?us-ascii?Q?r0DFHiNKuLUNv74vLTTh3WPDg1th0Eqy2UDR/AZ0yEQ9LaivVh6IezXHgHYD?=
 =?us-ascii?Q?qxPKv4cGp8KLyw6mAwgRng59f7UCm/qXjpemM6urggIfzt+0udRO1YF9k+S3?=
 =?us-ascii?Q?o52Iiz38M+ybM8qOV54Ijn5uYUi9tIjhNtJ6yupFHwSjLLH/MXJw58pfSnrh?=
 =?us-ascii?Q?yZKVz6mh1jBIeR0/w+IM9EDKxLROXU42olA54Ph8iJFeXQ+2AZSNeue1V+ue?=
 =?us-ascii?Q?QfelD9itmeGnNqgMC9hgUZAagJer4yRttTmVIy5HolVgQ6F/H5xtiRvhHFN2?=
 =?us-ascii?Q?ameEy4NQAVh+E/tpA8wHkVA6WhASAkc4BuiUunH8h7OLJlcg/AMhL0Qv9jVC?=
 =?us-ascii?Q?YoU7Tc7f8CyQLbn66WvKTvz8QDxrGP1IJOU6fwXhv58y733Qzixic/vtyNfB?=
 =?us-ascii?Q?q/BAZggpDEO9eJnPXj7JKA9aqVUSNS0qt+02Ebgv60vHjO0wmDCSKHsqq094?=
 =?us-ascii?Q?ge7tVn4+HqZvPp7ysFByiMD/+mdihXWwmrKkcRBM8tXkX5iJl8RIEqHZB/GD?=
 =?us-ascii?Q?IwbNT2mCJEayYcP5oqES2h3TyOOdQL8uL2QznXNh4Am8JOMoQX6aeDTcHY0v?=
 =?us-ascii?Q?xZWhVqAvyxdejJ0wVAYkLa0xghMM9XgARdZ53zUUcoAOYkdDdYqdfJZEDqbg?=
 =?us-ascii?Q?rk8PXaVpUXSEgJJEeS7rrEBedw9FnUhZSUCJvnTk+uT7yHnMYcyffWuQ2HHk?=
 =?us-ascii?Q?rTi1cCDxPtjHMgeD422GaxBoiYy5dlMdWjgamBOS5hJu++k4xGI3dXirdLkX?=
 =?us-ascii?Q?wA/zeHaeI9i2x/YZp4MsK2FZocBq++v7g+SaVd47aQc4BPiS13W6IsTkooKt?=
 =?us-ascii?Q?z3S0evOCY3w3L7jx9tCH08uYVmUbKE06TFiE0sBq2cccaoWzSPddrqm5IGVs?=
 =?us-ascii?Q?Gxh7y7JA0S71yMQguzkNJDQHIp8OFB5C1IgavKQm3w/snFYhoIo3jrGEQewE?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd50fe2-d063-4352-ff77-08db66ca129e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:10:28.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9/0/JE8qx3VuBT7rrUxUjOfc7lX7Lsegm2+1aXsuZrv6U2TrPRqDgYhUX3JpgWpVN0Fxc4x5V9EhzIOOcD01uMSZLwiBEVv/eu4Ky2/Xi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
X-OriginatorOrg: intel.com

kernel test robot wrote:
> Hi Dan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 9561de3a55bed6bdd44a12820ba81ec416e705a7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/cxl-regs-Clarify-when-a-struct-cxl_register_map-is-input-vs-output/20230605-073402
> base:   9561de3a55bed6bdd44a12820ba81ec416e705a7
> patch link:    https://lore.kernel.org/r/168592153054.1948938.12344684637653088842.stgit%40dwillia2-xfh.jf.intel.com
> patch subject: [PATCH 06/19] cxl/hdm: Default CXL_DEVTYPE_DEVMEM decoders to CXL_DECODER_DEVMEM

Will fold in this change:

diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index ca3b99c6eacf..be81fcbb4755 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -793,8 +793,8 @@ static int init_hdm_decoder(struct cxl_port *port, struct cxl_decoder *cxld,
 			    int *target_map, void __iomem *hdm, int which,
 			    u64 *dpa_base, struct cxl_endpoint_dvsec_info *info)
 {
+	struct cxl_endpoint_decoder *cxled = NULL;
 	u64 size, base, skip, dpa_size, lo, hi;
-	struct cxl_endpoint_decoder *cxled;
 	bool committed;
 	u32 remainder;
 	int i, rc;
@@ -827,6 +827,8 @@ static int init_hdm_decoder(struct cxl_port *port, struct cxl_decoder *cxld,
 		return -ENXIO;
 	}
 
+	if (info)
+		cxled = to_cxl_endpoint_decoder(&cxld->dev);
 	cxld->hpa_range = (struct range) {
 		.start = base,
 		.end = base + size - 1,
@@ -890,7 +892,7 @@ static int init_hdm_decoder(struct cxl_port *port, struct cxl_decoder *cxld,
 		port->id, cxld->id, cxld->hpa_range.start, cxld->hpa_range.end,
 		cxld->interleave_ways, cxld->interleave_granularity);
 
-	if (!info) {
+	if (!cxled) {
 		lo = readl(hdm + CXL_HDM_DECODER0_TL_LOW(which));
 		hi = readl(hdm + CXL_HDM_DECODER0_TL_HIGH(which));
 		target_list.value = (hi << 32) + lo;
@@ -913,7 +915,6 @@ static int init_hdm_decoder(struct cxl_port *port, struct cxl_decoder *cxld,
 	lo = readl(hdm + CXL_HDM_DECODER0_SKIP_LOW(which));
 	hi = readl(hdm + CXL_HDM_DECODER0_SKIP_HIGH(which));
 	skip = (hi << 32) + lo;
-	cxled = to_cxl_endpoint_decoder(&cxld->dev);
 	rc = devm_cxl_dpa_reserve(cxled, *dpa_base + skip, dpa_size, skip);
 	if (rc) {
 		dev_err(&port->dev,
