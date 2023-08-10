Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCBB20E8;
	Thu, 10 Aug 2023 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691654696; x=1723190696;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=66gfqFNgnsHL4RSoN2AnFErt3BFpSBYXqU6nVo/hxs4=;
  b=bcJ4MuFPjjC7SoUu3bUAcx1kCxDr/mhfNPZZ7XN1Nt+XfAOOnTud6Ux3
   oTYqVQw09JYokba4FVDaaF5vJstL40ihXaTSv+PbQbKlSNmC93HReAGzl
   TA7PfEBW1/bWXA/5IargLcm2NRy7D525BKp+gdsGl1H2zEOOV4VHHi54l
   ef9hGzHywXRadK4ysAiQ/xb80Js3PIapi3TSF2orkYYx3XNiNQdNOB6D/
   CpRQVJ7F9eGU4ylTExjBzH30QU0TdzsITCQi6L71zK05kB7dFZSmX4t0/
   blQim6K/TGCWQaBDv+alLb7uuV9l/iw/mVmyY5SaGPuK4sRDliX5hXsGZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356298802"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="356298802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 00:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846278274"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="846278274"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2023 00:52:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 00:52:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 00:52:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 00:52:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 00:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNeNgF+18qRSjNc6GIFrjs1lWoZRPqumUcO31Eqh8HuFYbKuWM3+97jjvQpJ1c4Di2wprR6g77Y7x2Mmarf/LpXRMkzc37iXmQc88Fcbt259xgf/ZwyEen0Oiz1fb1i4wTGhni1ftw/cneVRliS4rVjA3z4A0a1INI71MwrABXyTBk+kCDgsbqugZHqBsvgg6SVVai1OUG88opqDRReg8rMhwk/TONsVPT5leM6kW7VDNO+csmYNXPyazdn2jzGnz13UtJPvS9U/UhiYE/lZJG0apmTvdpe+nfW5YpstUE5xD9Q8PCuPSuvib3Pt6qqIyThDuuXZspJD83V5DLVhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L940HY1MGASZZlSbDnH8HUQnzZtNj3woPWESx5ya+qI=;
 b=cyCydvGi5t4jAaqsNPHdg1FIAvgn2EqH6PPlVe6UV0b4Yz+D/ZXoxatwqN+z2Vese+z5+QSdsOzE/8m1u6QWUk7QQJfJpE8Go5nkkM9b/p6Jbi18PlVbPHj8xVkaGTHFF2ie0R+jEAkwF3TkvDX+QmlYqUjnSxwT2aCvHtW6L8PusY7P6h5fAX4RcvhYcKxPjoFSgnpuCTWaiZdP+sEP5e6sPsTfz4OM4yo7KZeP2grs73jLZC/xYshkHbYPsyFr+Q4XFiDSW6JW/SQGxb3+Pmw+hrhFwb0zqBzu9W3zTPCc5A2T9f/DpfXKhNPTHO9zKfj6QEEJp6ncq0Szt7p3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:52:08 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 07:52:07 +0000
Date: Thu, 10 Aug 2023 15:48:02 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Nathan
 Chancellor" <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, Conor Dooley <conor@kernel.org>
Subject: Re: error: A dwo section may not contain relocations
Message-ID: <ZNSWMgFF529bGy14@yujie-X299>
References: <202308090204.9yZffBWo-lkp@intel.com>
 <CAKwvOd=c94gknBq7TUsQEyC095+1iRW540=xD3zRkf3+Q4vn5Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=c94gknBq7TUsQEyC095+1iRW540=xD3zRkf3+Q4vn5Q@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 080ba06d-8e8b-41ed-ee38-08db9976b1fd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kydmcNueutWrn322sXLpfhQFFFzME3ybz02pUypHjEo1JPscWYxWvTv0aUhegWjkMHN5B9FNGP7Tzu+GZjTdMgV8oOedIKwZsqXy2WJtTqsvOEqmAfDoK0erHVmUHmAxjsRnDtTo22Th31kXfIk7sO3V1aB8gsRJi4pWhAmS5cQgk2GOXrK+9d1AVdfuSGMpPGnelWATKLsXp48uMljciBG8QMn6fq2t+V4Btu5lkGajAt0VLx5xbH0bpDL42nsy1t2g1pcwnOY+2hKtwJaAIZThUFPAE11AcsiVhFAZfKqkGc3u7j+vROgycGbmL1KHGOEcYbkte7+Pz7/enYwVupkKz4BcIzqshjg+teYBGOQkp7r/AU8gvJHFgvDdDkPL7IPAcExAKbs29ypmffLZZ1oZl4+4SvPEtIzG2j8t1DrrKJ6zvTasXVv+Pxouxoq3jPsTBfUzGYlY4qErY600pCEglvBlAhETRBmVxd6xrENfIKODiYbXi/Nb7k1U7WhTUyGNmzJlLuFQp6aPyS4KECYWWHWjJXiTmtc+LpnjMjwNOdyvrBo5oxzqfY0sf6j27AdLzBapOjKcjoogr/T66w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(1800799006)(186006)(9686003)(6512007)(54906003)(966005)(4326008)(5660300002)(6916009)(66476007)(66946007)(66556008)(316002)(478600001)(6486002)(6666004)(41300700001)(8936002)(8676002)(26005)(6506007)(53546011)(86362001)(33716001)(7416002)(44832011)(38100700002)(82960400001)(83380400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdwZnQ4S21LSjBZd1UxaVBGM1I4SmFUNFZuTEVnSDVFeTZ5T0xjQTg2aHF3?=
 =?utf-8?B?NVIwdURTa3dITmdhVkVBcGswNHlPL09uMnBVdFlTQTluZTVTQ3B6czRPeVNY?=
 =?utf-8?B?UmFQalAwbEJ1NVZyUG52RUJIaTR6K3p1aDMrMGora3RGYVpQcGpGNk5OcHpy?=
 =?utf-8?B?UEIyY1YwNld4RTRjOFJmcE55YnI4eFlES1ZPWjR3R1dOU2d2OElVbGFTOUdo?=
 =?utf-8?B?UE1XOHM4cTNDanBDZDc3RjdCblg4RnhEY1QzNk1qNUYyNWhnWFcweWdja3RP?=
 =?utf-8?B?aENxN2hlYUJ5bXFiR3FuUXRRdXV6WnJkN05NSWRRQmozdnMyM28zZVZzMWR4?=
 =?utf-8?B?K0M0emlVc1NiTnNnaTdaTklUVVdOcXppNzBJclpXVFQ3Um9UU0kzTmhBSWk0?=
 =?utf-8?B?bVo0eGhPeDc5K2t3RDFycGdoQ2J0OGFYekFOV1ozallVamlaSXJsT2FOWThL?=
 =?utf-8?B?WW45MkZ4WEs1Zkx6b080eVRNdHdZUzY0a2pFWHhrRmVJbEZKQ1FwcjRtL3J1?=
 =?utf-8?B?RklkQlh0WThpMHg3aGdibWplY1MzbUpJckg2MGRkNEpyc2xJTktiSE84QmFQ?=
 =?utf-8?B?RHoxVGxKS09RckE2UUo1WkUxaXJKdzFyclRqSUJIRHFDTERvSjI0NGFLdzZ1?=
 =?utf-8?B?YjFva0g0dWxYREhmRUw4a3JOTVZmMVREaFZYOTlKa3dkUkxHNFF6cytsNElO?=
 =?utf-8?B?WUtNdVUrSUpMWlRrNTZMd1RCb3A3WUpOM0pPbU4vLzIyVy9MTWRrT05nVHpY?=
 =?utf-8?B?UTU1OW5vRzYvM1FNdHdCRmhmYVF0NGlkTXBFMkVUUUdHWDMzbC8zK3NBei9y?=
 =?utf-8?B?UG9IMmhFQkhwWWNTOUg4dy9DcEs1ZWRaUXZPano0dXprWHZqdy9HTGRuYjJL?=
 =?utf-8?B?b3BjN29rUi9RWkxORGN6dVZ4cnF2Z2VDNm0wdzVpL2o3bHppOGpoTFovenZW?=
 =?utf-8?B?YUhMSG1kaW1GMmJCNjRyZG5ZYUJEcGM3cFVFVDYvWTBEcnVqRjhFNHRlZU9Q?=
 =?utf-8?B?QTl1djdzMnUyUHhXNW8wclRFY2RydFZxTkE3NzFWM0JqNjQzTE12VWkydmVh?=
 =?utf-8?B?My92Qm5FTDFhWWhpWGkxbjV3TWR1UGlvZjF0MWM3R3pQUzFQL1N0UkdYcEZW?=
 =?utf-8?B?TFdLdkxwMTBNOTY0UVc5bFlFc01IRkRvODMzZ1pPai8zRGRoRkJPYTZ6cVRl?=
 =?utf-8?B?b09RYVBIU1RrcUxTVlFpS2g2dldSb2dyKzV0VHF0S1I4WWJYR21HVHhZWWdB?=
 =?utf-8?B?UjVHbS9KVWJzWEJHOXBWM2VJWjJhM1JCeFlpdCtMaE4zejlzZnAvQnZGbTVm?=
 =?utf-8?B?R1pzRkdQcStNNExzR2Y4QTNCWUsrN1B1c2djN0NKQmtBb0dHM2VMajNwUzJZ?=
 =?utf-8?B?VDJZWlRTeW92S2hPQnA4Ky9lYlRPOGhSMHFSU3M4MWdPRVFxaWhYSWVJM2ZV?=
 =?utf-8?B?em84WFN3U05lN25YMStyREYxMFVkL0V3TGYyNkN0aUZtY1ZFcitGd242VFNv?=
 =?utf-8?B?dGllNlhYd0ZIWmozeUN1TXNvUXRpYjNLOSs1OU9PaUk2ZXozTFBaYmk0RjZB?=
 =?utf-8?B?aW9iZ0RFK0tMenN5aHVsYUxPUFhqQXlBZForSGJPSnczY0lsbCtXcjljM2dm?=
 =?utf-8?B?b2dVczZ5b29lUGE5d08xMnBLVGNhQkl0aXhkSDJOKytSRXZPbGp2M3hHT3pG?=
 =?utf-8?B?azNHUktQbklsN0FpY0pwN21md3BOdzYwTEJZMkJaeEpWcVp2R2xhSlNlVS9z?=
 =?utf-8?B?aTVQYjc0K05vcjN3ZUxNMkNRcEY5aFZDZlVRVldSaGdwYnR4VGY1VjVtMkJ2?=
 =?utf-8?B?b1hyUzJJcXc2VERaMUZnRU9iWU1qSEs5djdYb2gyQndjRmZRN255MGx6T1Bm?=
 =?utf-8?B?REVwU24yazE3SGllTzVjYU9CbDU0dnVLK1VyS3RnYVhkS0RXcHV1WVpzVTBL?=
 =?utf-8?B?cXQ2RVhCVlF2b0EzbkZvUm11TENLcXMwejN2bEFrMWd6WExYWW8xNVlYcGlq?=
 =?utf-8?B?Z2J4a1cyU0lUbklXS1lpOWoxdFF5ekRnV2ZZeStyb25HMitDTUtmVlhrSUYw?=
 =?utf-8?B?cUlpZ0locEpITVVFOWYwc3ZWazBxakhMZEV6MnozTkRqUUdKQWU3WGtuUTd2?=
 =?utf-8?Q?hdi27pFz/J88JKlxp/IQiYu3q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 080ba06d-8e8b-41ed-ee38-08db9976b1fd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:52:07.8691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idA9e+FsuHy1nRaLWDzluxzoH4bo54ifqhM3HWJXKSlfDMWHWZ0YTzhEIHEZCX/DrX43gHWeOXny80AcZSqWvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
X-OriginatorOrg: intel.com

Hi Nick,

On Tue, Aug 08, 2023 at 12:46:00PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 8, 2023 at 12:02 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   02aee814d37c563e24b73bcd0f9cb608fbd403d4
> > commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
> > date:   1 year, 5 months ago
> > config: riscv-randconfig-r001-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090204.9yZffBWo-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> 
> FWIW, I wasn't able to reproduce with the provided config and
> clang-17.  Perhaps this is a bug for older clang releases (the bot
> tested with clang-14).

Thanks for this info. We re-tested with various versions of clang.
clang-14 throws this error, while clang-15/16/17 have no problem in this
case. We will consider adjusting our compiler coverage and remove the old
clang-14.

Best Regards,
Yujie

> > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090204.9yZffBWo-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308090204.9yZffBWo-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> > >> error: A dwo section may not contain relocations
> >    fatal error: too many errors emitted, stopping now [-ferror-limit=]
> >    20 errors generated.
> >    make[2]: *** [scripts/Makefile.build:288: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1 shuffle=3686795728
> >    make[2]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
> >    make[1]: *** [arch/riscv/Makefile:120: vdso_prepare] Error 2 shuffle=3686795728
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:219: __sub-make] Error 2 shuffle=3686795728
> >    make: Target 'prepare' not remade because of errors.
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 
