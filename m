Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D431381AA8;
	Thu, 30 Oct 2025 01:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761787778; cv=fail; b=rMtT0/Gwzg9bX2l1/X+Eb8FB69hHUS9CcQ4Mf+Wy6UMx2fyCYLRTCNZRNlqxFxYPlBcX+ELTtLiLjcjr3PHs/UNMfheusO4llIXn48o/rrRg767H3344nhneikMtpWFVJ8WUfKfry4+bkRj/qUnO7w0fDD/swQpbVhqAeKpYM0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761787778; c=relaxed/simple;
	bh=j2Nlyc0hW0T5W0AxGqICE6rsD00fZJ3aDQTVZ54zebk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eBagpm41kDL8ZrJUTLeLcX/Qd9K8CaCj6CJMAHuB9XgeeayEaPpG5n4M54K4PSIoRw7J/E/6kOtY5ptPNkXkHnPjcQ3Xft8Fd9JER7ArO/PPQxEXG8i2jaIs6meuQ5SQInhfT05+OsdeqmVt2yK4HH4n11f49GIZU0Pd2FOzXwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4w9bYyz; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4w9bYyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761787777; x=1793323777;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=j2Nlyc0hW0T5W0AxGqICE6rsD00fZJ3aDQTVZ54zebk=;
  b=M4w9bYyzOcigJB3+J9Jy+asf2TorkFDjR10k2lX5+U81Uuzh8Fu0pt29
   AKI0aF7lXrznMwSXQE3WAXcxzTiKCEfHdcQn1lGl0dBubUMES0YEMRtiO
   aTPkdvxIZKvimQ43fTd/oqwL/iPveu4T0coa1vCtAx0MkOirfCvwy/mhY
   Y6q5VblPVDoYguemRjpNSsvUNQLYpeEdxcov5sBc9NTkBB/oXbo+7omCg
   0XLiOahzDN3Rr3J5eNbF+RrRB/poydy8fzYZ8dHySZQTAvmO/7LkVK5j0
   2U5f5ZJ4vmJR11k/hi0W5jvCRKjdSwQZ0Yg2CgbRkygLVKDq5DwMk7URZ
   w==;
X-CSE-ConnectionGUID: wyxhXcHASo2IjH3GkWGgVw==
X-CSE-MsgGUID: 8uat9VYBSeSmxzWn3++UZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63824950"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63824950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:29:37 -0700
X-CSE-ConnectionGUID: Bv75U0x5Ttm1pbzaIgjOgg==
X-CSE-MsgGUID: v0aFDNd3S5i6QWvqV9+cKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185514859"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:29:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:29:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 18:29:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pacge4qBckZvOKu4OH7odnYI8SeLNbfuDi6svdJJSgDdT3smdqB3BKbf7xB3D0CqpDfY0hGf2TiOThEDAkIl/AdBmIe1NR74YYWyFFL3idgRIrGlR8gdqQ+GuqoQCI3pdUkCrQDlC5m2b+KElXTfhylFGwI7IAMd4AApx+9XjmTUTodMkuG535k1gyA8w7/jIAKexdIA4i9nqc4uyL2O2Y6CQJCZvrCymVS8Iup2nwkKD687UkFHrqJrkH6M733lWPNY+us1oUePdjIngiq0uVnTwatO0dnELHh5naCRyhXxapR14J/SjKihl+B9Kr5c9rzrdPtrW52df8W2g/Z57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4M/Ugu56WRaK8xvayE6qnQCxQbAqdfCdQ6a2yGl9WPw=;
 b=rFM44sHhc0z8mZb4ZOO4X5lL85pSIAAhSfsS6F9/EC4nqNO7KDD86VFi+v9ILx0M2oi7VWlupb4LXrieUjdqYs3Eku94YJYjSPz4FDOi8SiT5ZcRFUPf+sX4qz24FScsNCmKPBhLuLnA+nRS5FOb1fkjhIkROcbQnmuqX5boqGztTY2IF7QcEqvmSjewztK8sCnvXHyitnlhbufCdBTCXxBibx82mLSE8RhvDRA8djLFpmlhAWhHLC4p3fWMElhkoXwZqtOAaAf5H/uAO+flZUGZpptFFjRR3wVV/20kMgSYa4ayPXTu4WdhxGVdY0N205mC9kusABzqN8/VvXhnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DM3PPFED6629EA1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 01:29:28 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 01:29:27 +0000
Date: Thu, 30 Oct 2025 09:29:20 +0800
From: Philip Li <philip.li@intel.com>
To: Chuck Lever <cel@kernel.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <aQK/cFZWpGbJNe3I@rli9-mobl>
References: <20251027154630.1774-4-cel@kernel.org>
 <202510290603.8VO4qUQT-lkp@intel.com>
 <d45fdc26-ebdd-4515-a15d-6a9302ca965d@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d45fdc26-ebdd-4515-a15d-6a9302ca965d@kernel.org>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DM3PPFED6629EA1:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd71ced-f81b-4e29-36a1-08de1753c44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y1kbIuy8MK3NF8RFzzwMbXvJIWX/9jNesGT0lwe7UetMbjZIFWzcmmC5nhjP?=
 =?us-ascii?Q?KvxDwWHOlGIkWcR7TakXhR3BbfT0um+VWqlcp+RtHGbc6uRVCiw1aZNWz7zw?=
 =?us-ascii?Q?hYKPUkMM4Devq/JGPDvJzhSE+DTgdBjtlFS/XaZo4sna+6SMi8zZz14b/bPS?=
 =?us-ascii?Q?w3LAxJfRscY+3z9OdlnHqUDDdT1POtEGhwOhsAL0XCWpDb1ENHJfrNTwmlCJ?=
 =?us-ascii?Q?zXH8YXwYIyVbO7kxR5v1d5KkOyl1yc/WBrW1DFxyJov2lyCWmwk8LZ1qlHU2?=
 =?us-ascii?Q?kqcX4+HyARSdAf11G8/mwwLy+ZZnSbN3LRVgP84IfFLF8GX81urv1kKEfuxq?=
 =?us-ascii?Q?o+B30wM0sc1e+mQX+uoHsqauACLtxRSKZYegrESZ/GTsN3V1zV/0LoU49C+E?=
 =?us-ascii?Q?ez/bSUwCyoGt5KDtirTAn/mU/OvJjFPM7MSaruEFzLEyxNwBeN/9KLiTqEMZ?=
 =?us-ascii?Q?G1jv9rnAH9T5Ocf3EI2XJQrz7yr/R1s6vxF95pTY3/egzp4yQ9hDfSi+eyka?=
 =?us-ascii?Q?TlqwXFK+cbd3Xsdyhae/51qmOgwKG+6atBlKtIRcPQGjXF5ZwDLv0/qEA6BN?=
 =?us-ascii?Q?h2IYriCjFCiyjhvY39Oy4VIE9y7wCgOxRPD3NIr6aubW34HWK1TfroyF9vU4?=
 =?us-ascii?Q?qVo1PnZXIk467KFN1g1zGPQaGwTg0tkIYSFTu3wJg5fAqDnxVK20+g0wqGR2?=
 =?us-ascii?Q?OL+7klgCuqgJOylZIBmTx2YMGqZWoUqNve4NEYZEtlNqHqt8m6IqhrALybDI?=
 =?us-ascii?Q?Hfnq+W08PgcdYxxV7Vk90DpNgs95md2iQb9GJzi4EShvXm8LLzf9tpkryFjt?=
 =?us-ascii?Q?LlE9OF5HTr8gvLy24f4tAFt/XWsmkeKqdczYJ0A9U4ILsgcJ4+nBoCciwqrR?=
 =?us-ascii?Q?SGlj08xAPkakhJyKlHiK3nZGXOt9aWUQ/dovYOCIcW8qtEjRwuWZGP2/uMcS?=
 =?us-ascii?Q?rF9JEZeaYhdgv2VQuL+tRFtsOb08PSLieFaTTACvjKcxhPWrrtDJBb8NUuOn?=
 =?us-ascii?Q?xEEsyMV8+X6Z3dKAM2Xr2ea6gZTrKI9ZyBdLMyMVpXvJ4DkacsPAccO4KG/L?=
 =?us-ascii?Q?ma9niNKTDe25pE1a+Te7cDpK0k/WZB2UIFxsGz+3XqopNI7YC1aZsDYq2jiw?=
 =?us-ascii?Q?gGxWS4TG4x9eTdjxGIYwutIO6FVMIkm0XAcXf+g3fGWXYzwDvsytWiPAkI/1?=
 =?us-ascii?Q?1hbd51Chz0ZvqNS6MOYKQ0q3/ss7J61R9f/jpsQ2dYX/sGhXPWCwrMkUOExs?=
 =?us-ascii?Q?vEy36Ss44hxK5LoLSO0NzZYuBEhY5+X9Up8cjDJe8ldeMGXHAwTDewCsXTh9?=
 =?us-ascii?Q?rdMA5Z7bqJiyQ96Ieahp6FB3IrkPpvBIaWqkew7K4kCE6T8sUzyMokiKZYGN?=
 =?us-ascii?Q?VVaHaIhYMo/vOwXKZsWSP/Knl0T9txQvcDay6IztkGYbPNuVIcxI73yZUmD0?=
 =?us-ascii?Q?oaPpJLiUVx/QiqcTSQwry29RYVxK++9o1VpgoYpjsPmc/aTjSTN4FA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NvIoiUaVzvhVCXG409EYafq3v9E3JVXAZnbFkmP8/zHcgV+oeoojRfp9hRfw?=
 =?us-ascii?Q?/YvDjrwsJpzxeKwMMLQXnZT1ELuQBRt8X82YtKnVmq1jXg+tzmgbD8RA04wY?=
 =?us-ascii?Q?vO5fkd2TfUHE6WUiw7dLt9DbkQW4S6jZT1tEbd9PS9j5nUrjKU4YDHAaNQ3g?=
 =?us-ascii?Q?2rKuV422wh5XDaC0UfcDVmknzuptVJwORRcvbf7buRdDjoF7fS6uMf40oasb?=
 =?us-ascii?Q?NFpZK3USv2dC7CdUKREL9q4Zm4eob4kKIO57oaE5g5ZmEkjPJUVqkw4r6hGI?=
 =?us-ascii?Q?IyRXV+Qw+tQDfUjGDBKr6NxTtZkhntOVFoLOwPckTz3xhFh9vtXvWC6FhyHu?=
 =?us-ascii?Q?P6XTE2f0VzRdRLanEb0C/cY1VYTLvM7qx3hrpqh0dL5TWWLrBpm/q3Iw+WS3?=
 =?us-ascii?Q?rd1IYbiNqbF6zyf+3RHwRFeNDFdnKJh+8VkT/amPVeYkP609UxWNthYpsPZ5?=
 =?us-ascii?Q?KbRKcZjRedDNQE44edywEepUBlfR8F7j+mWy45PbqB8D3ef5STPQ1Eu9PPEt?=
 =?us-ascii?Q?LWYqEHND2smWpV1Q4YuAkwtn5dZT8mgrphYSEaYHoHVythG6RBeymRv+0roe?=
 =?us-ascii?Q?uThWEBZWvoYayA769VtVkbSD3d3KhiBwbmkMOfex4rwUWG3CnsF2ZPSlv/uV?=
 =?us-ascii?Q?0BBAPETSDRbhbYJY817jJylXTIEkCb+TMB7XcyJ9KMV9FVHGBYM9LA41gWwW?=
 =?us-ascii?Q?8snnJjebmEb8mwZD9BcAaToOMu8NomQ+xqy91RSmZiiQIskKzazXXVio4JpC?=
 =?us-ascii?Q?DeZSD6mBdh9XeBBo5kxM8Z16Dks7GFL9Jm93RXYCwE0zeoLPEF6VTXyJ7lYW?=
 =?us-ascii?Q?9/qj2Pcw/k3wO/UMvdTXBnEzJJqNCeqZ6XwNjZ459In3NqY6KvjhIyZ/lDTY?=
 =?us-ascii?Q?K5KsN5V/sNFigwglPduACNqwdZbih6nFIEUY+1/1janTNQyi1VOTb0eaM4+s?=
 =?us-ascii?Q?9nlxMTE7+GObYrZZTjJ5YDUr7Fr9KFWCvOv4EzQHeFISuw2gfuJtG7komcWq?=
 =?us-ascii?Q?zH5wleB5WCRgwvlzOBoC+X/2KrJa4Vh6q9huLYfR3LRthxfvW5m2ReplLTtr?=
 =?us-ascii?Q?A0GG0aBsV2SZYs2QYI8LCGW5b3COFBjQiaErlOPluQkwaAjFwyuJz8cMpcJI?=
 =?us-ascii?Q?lG7uLKavIPVnQEdoxw2e0zgUAd7aIzzrX5qDbBsZfbgp6EzB8d2Hx7lA7vFo?=
 =?us-ascii?Q?pA/pAHiDIl3vLX+hNfbCQhvETAy3jdb2YuBsCQqGRz9lBzFWoG+1Jhh5DWJJ?=
 =?us-ascii?Q?zD0ngQKnBV35cpLTt8S9Sca8UJEaplbdQOcmymWrpbOssjY+WqXqRoP3rKte?=
 =?us-ascii?Q?gPD1Ic8lbJPGKKbbQCOdurjHLZ80s5Rjr0iP3WRUqFnHstRWyDS1mwGYisiO?=
 =?us-ascii?Q?9YUR6T3t5tIf54tmyETDhGregN5RD4yKAREEJbtWNk5wJHmnQKaUNEBV/YzY?=
 =?us-ascii?Q?oXbI7vAtJIAKhH8COkSnKBxA/exSW6wtUYyrZxv1xT/mXT2x/jMdBH/Ai3cS?=
 =?us-ascii?Q?wtDHjL6fCuhFsRNJKF4WdjO4W8o4OBHaSuLUHdU+TeV0D0P/Gvi8Wr8ni1SK?=
 =?us-ascii?Q?2IQ68kANBQbiqPz/9ou+M6dBdBNOSXnqKB6/lMA/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd71ced-f81b-4e29-36a1-08de1753c44f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 01:29:27.8963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnI6+t7hDiR0VsaVAEI5pnre470nUIml56VwyXWV3KGoiktdqMp385Vl0T0JzSQ+Qbrf4LrTPtjYtnKNclO5FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFED6629EA1
X-OriginatorOrg: intel.com

On Wed, Oct 29, 2025 at 10:10:46AM -0400, Chuck Lever wrote:
> On 10/28/25 6:56 PM, kernel test robot wrote:
> > Hi Chuck,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on v6.18-rc3]
> > [also build test ERROR on linus/master next-20251028]
> > [cannot apply to brauner-vfs/vfs.all]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Make-FILE_SYNC-WRITEs-comply-with-spec/20251028-000506
> > base:   v6.18-rc3
> > patch link:    https://lore.kernel.org/r/20251027154630.1774-4-cel%40kernel.org
> > patch subject: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202510290603.8VO4qUQT-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> fs/nfsd/vfs.c:1455:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
> >     1455 |         case NFSD_IO_DIRECT:
> >          |              ^
> >    1 error generated.
> > --
> >>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
> >      109 |         case NFSD_IO_DIRECT:
> >          |              ^
> >    1 error generated.
> > 
> > 
> > vim +/NFSD_IO_DIRECT +1455 fs/nfsd/vfs.c
> 
> I'm truly at a loss. Why is the robot attempting to apply this patch
> to a tree that does not also have 46c42fad83f5 ("NFSD: Implement
> NFSD_IO_DIRECT for NFS READ")? These patches are in the same branch.

Sorry about this for the wrong report, the bot fails to recognize the info in
the cover letter to use [1] as the correct base.

[1] https://lore.kernel.org/linux-nfs/aPAci7O_XK1ljaum@kernel.org/

> 
> 
> >   1374	
> >   1375	/**
> >   1376	 * nfsd_vfs_write - write data to an already-open file
> >   1377	 * @rqstp: RPC execution context
> >   1378	 * @fhp: File handle of file to write into
> >   1379	 * @nf: An open file matching @fhp
> >   1380	 * @offset: Byte offset of start
> >   1381	 * @payload: xdr_buf containing the write payload
> >   1382	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
> >   1383	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
> >   1384	 * @verf: NFS WRITE verifier
> >   1385	 *
> >   1386	 * Upon return, caller must invoke fh_put on @fhp.
> >   1387	 *
> >   1388	 * Return values:
> >   1389	 *   An nfsstat value in network byte order.
> >   1390	 */
> >   1391	__be32
> >   1392	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
> >   1393		       struct nfsd_file *nf, loff_t offset,
> >   1394		       const struct xdr_buf *payload, unsigned long *cnt,
> >   1395		       u32 *stable_how, __be32 *verf)
> >   1396	{
> >   1397		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
> >   1398		struct file		*file = nf->nf_file;
> >   1399		struct super_block	*sb = file_inode(file)->i_sb;
> >   1400		u32			stable = *stable_how;
> >   1401		struct kiocb		kiocb;
> >   1402		struct svc_export	*exp;
> >   1403		errseq_t		since;
> >   1404		__be32			nfserr;
> >   1405		int			host_err;
> >   1406		unsigned long		exp_op_flags = 0;
> >   1407		unsigned int		pflags = current->flags;
> >   1408		bool			restore_flags = false;
> >   1409		unsigned int		nvecs;
> >   1410	
> >   1411		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
> >   1412	
> >   1413		if (sb->s_export_op)
> >   1414			exp_op_flags = sb->s_export_op->flags;
> >   1415	
> >   1416		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
> >   1417		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
> >   1418			/*
> >   1419			 * We want throttling in balance_dirty_pages()
> >   1420			 * and shrink_inactive_list() to only consider
> >   1421			 * the backingdev we are writing to, so that nfs to
> >   1422			 * localhost doesn't cause nfsd to lock up due to all
> >   1423			 * the client's dirty pages or its congested queue.
> >   1424			 */
> >   1425			current->flags |= PF_LOCAL_THROTTLE;
> >   1426			restore_flags = true;
> >   1427		}
> >   1428	
> >   1429		exp = fhp->fh_export;
> >   1430	
> >   1431		if (!EX_ISSYNC(exp))
> >   1432			stable = NFS_UNSTABLE;
> >   1433		init_sync_kiocb(&kiocb, file);
> >   1434		kiocb.ki_pos = offset;
> >   1435		if (likely(!fhp->fh_use_wgather)) {
> >   1436			switch (stable) {
> >   1437			case NFS_FILE_SYNC:
> >   1438				/* persist data and timestamps */
> >   1439				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
> >   1440				break;
> >   1441			case NFS_DATA_SYNC:
> >   1442				/* persist data only */
> >   1443				kiocb.ki_flags |= IOCB_DSYNC;
> >   1444				break;
> >   1445			}
> >   1446		}
> >   1447	
> >   1448		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
> >   1449	
> >   1450		since = READ_ONCE(file->f_wb_err);
> >   1451		if (verf)
> >   1452			nfsd_copy_write_verifier(verf, nn);
> >   1453	
> >   1454		switch (nfsd_io_cache_write) {
> >> 1455		case NFSD_IO_DIRECT:
> >   1456			host_err = nfsd_direct_write(rqstp, fhp, nf, stable_how,
> >   1457						     nvecs, cnt, &kiocb);
> >   1458			stable = *stable_how;
> >   1459			break;
> >   1460		case NFSD_IO_DONTCACHE:
> >   1461			if (file->f_op->fop_flags & FOP_DONTCACHE)
> >   1462				kiocb.ki_flags |= IOCB_DONTCACHE;
> >   1463			fallthrough; /* must call nfsd_buffered_write */
> >   1464		case NFSD_IO_BUFFERED:
> >   1465			host_err = nfsd_buffered_write(rqstp, file,
> >   1466						       nvecs, cnt, &kiocb);
> >   1467			break;
> >   1468		}
> >   1469		if (host_err < 0) {
> >   1470			commit_reset_write_verifier(nn, rqstp, host_err);
> >   1471			goto out_nfserr;
> >   1472		}
> >   1473		nfsd_stats_io_write_add(nn, exp, *cnt);
> >   1474		fsnotify_modify(file);
> >   1475		host_err = filemap_check_wb_err(file->f_mapping, since);
> >   1476		if (host_err < 0)
> >   1477			goto out_nfserr;
> >   1478	
> >   1479		if (stable && fhp->fh_use_wgather) {
> >   1480			host_err = wait_for_concurrent_writes(file);
> >   1481			if (host_err < 0)
> >   1482				commit_reset_write_verifier(nn, rqstp, host_err);
> >   1483		}
> >   1484	
> >   1485	out_nfserr:
> >   1486		if (host_err >= 0) {
> >   1487			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
> >   1488			nfserr = nfs_ok;
> >   1489		} else {
> >   1490			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
> >   1491			nfserr = nfserrno(host_err);
> >   1492		}
> >   1493		if (restore_flags)
> >   1494			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
> >   1495		return nfserr;
> >   1496	}
> >   1497	
> > 
> 
> 
> -- 
> Chuck Lever
> 
