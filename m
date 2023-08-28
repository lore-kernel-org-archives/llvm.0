Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB36AA6;
	Mon, 28 Aug 2023 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693216679; x=1724752679;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7QVQD73MrL6DPMwsTqsiWUQQgDyNscR0OKcS/1IcAF0=;
  b=KtGthZXWUF/ZFjdZZIVA25sac1FbtLnmjT4EZvFkP+tJRIp6T3rfu/Mr
   tEV276LdbfRPKLrnnjdFmhEopuPx+GZNYFhels0/nbDDb1gJQMNCBJevK
   hDTeQnbZVEy5lrTPQaoKdDKMunoviz2c9e5pxY8DUi2qW5cksId8rzl29
   6i+GLbqAeuU2eRQMXewDvgCNdSSCZS+WD9Qf3UrZjpfS5uKS9MIAr61bq
   8AWvYc+CUhJPqic+qc/Wqej3cIRup0BNAsnghF+S3+22EADIFe4dbXl90
   tzIDo/bwUKR6zUUqSKwietDRLxG97DXl0yGtdeLbWSmAMXjq7gi93LWDV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372470427"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372470427"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 02:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852780948"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="852780948"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2023 02:57:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 02:57:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 02:57:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 02:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK7dvDHyshQo5J0RBE8gXr30FM/D/mkCtjqi1oPZfnnOXuapmWPdR1Z3j8mkfH23XlUdsb1jj3o2fc68vYynhhvcvWrvNYJG7n/KgoeyPK0y3NATSHdQph87aF/7r5ABL3Xwci27eFtWkzoSIWd/082EKyH/qZN36Au+UCF0/forc0FqARfzqlH3vYTGHh11+zUQnVaK+Zqz8hF7vYoAIiEbB9gth2G8/YG2mq73SzVKGbv1rHXqSCteDMuCtuSFe4mjWE8Seg3s8fgiG5WOl7abBTcjS7v2hUHry+VcDrvUsB4OdtwM2DubxwnjJS9OgV+YKQu+KqhuHPswMIbIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97r7kaniEqnY2ZdH9ZiGm77L1HH8mTlgqH6qK64iNm0=;
 b=dMu/+D2mKz4dm4757v2pIBgcW7PV3f27ZnbMEjEexF4D9GZAhL0ynmOxWsFoRGdcfruATqbLlFIIry0641UDeDw54t+L7DibPR4zLw3y+UhJpRopczkK8w+BY6lCeYUtsYO0SGFaTYgOyI4sHR0ECua9MH0/sq4YVQ3AhcqaSqiVHnDvxoU6/Cy31QtY0kSdMGrGMzXtaJcH5UkxFcJCzLcOVnErluaTZBlryS0qs4HjSTjwKt/SYUej4re4jfEOKA8/+mYMpvEdXKwC5YZUJLFSRax0ah7cvT6frcwnr/dNqx/il8RiOePCXeqxph9Y+tyEt2LnRk3BrQiPSvvtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 09:57:56 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 09:57:55 +0000
Date: Mon, 28 Aug 2023 17:57:45 +0800
From: Philip Li <philip.li@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-6.4.y 600/1652] ERROR: modpost: __ex_table+0x222c
 references non-executable section '.rodata'
Message-ID: <ZOxvmQLitZwHyX9F@rli9-mobl>
References: <202308091247.i8jNaJgR-lkp@intel.com>
 <e74c2316-60d1-245f-c671-5cd19c3ef42c@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e74c2316-60d1-245f-c671-5cd19c3ef42c@kernel.org>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|CH0PR11MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: fd613f9b-6e59-487f-1b08-08dba7ad4055
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5SuRAGwQ+M9Z/NmDW8pLZX8kELHAwVjhn7lcLXzTLZvi/NaJTtNUQW8n5dQjsFKaTT0MzxSX6O25gp6MmiAWtMe+Vpsi6vvxUbCH13EUvX1aqSoWl2JDnMbrE8fX2Yr4kd2MS89QZZ9w3T9aI4+gBdf9X/itFzdvW8ncjjhhhjcUn4j5plLMPX/zAYQ34RfzHcRVBrs+9+P9PzSB7zEkNPvtvUZy67uszEsDAWTqjRiP6zswgU8HYT7GzGhiauceNpZ6ORJABIkDJO9h3FRqe0QK3zAc6m43CL22ye6OF0oyXQr19JHvEVeNxdbz7JwNDAXbl+hhn1MljRpsLzAAXOlGlPSY+5m7vbTUIKlo7LQai+/QSkMlOBNX5lsn6AlvZ2jfTzDFuMGxa3YewQEHjXtfJU1psphbPnMerK6DpuXwTyeld5UsdQfT9cjD/+sUhvZGASnPjrzbYInvF+H3QC3uD7OYee4HSlS5GFyMP0h13OoNcBR3tN80WZQj7ySREly6ejw69fl6eUwZ+8u59axV2caQlM4ucjK054tJDYAeH+kzxJFIhH7bU7IjZEBiKLgkPiXUpMUosZddo+LtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(83380400001)(478600001)(966005)(26005)(6486002)(9686003)(6512007)(53546011)(6506007)(6666004)(5660300002)(86362001)(2906002)(82960400001)(6916009)(54906003)(38100700002)(8936002)(33716001)(316002)(8676002)(66476007)(66946007)(41300700001)(4326008)(66556008)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gUtA9d9KkwX0Bxc3mGi73gKcqfN3+6JlbmQCmha1xLv7AEFuvettaQfFjuVi?=
 =?us-ascii?Q?P+1Amj1gh7I877A/S84V+DHw/w2jjXzbg92c1hHfYVeO4gu5qUhOSpMOwSjE?=
 =?us-ascii?Q?i7lID/Ank+cba6a0MilkxbmIzXfrGqALc4P1w2VgrBsY4PHIepXeVS2s8mAA?=
 =?us-ascii?Q?3RbtMXasArGPSTp4O+STpawxHd3jzrZ4VhN1dBTzk6N9He7LmI1xa6H5/f9P?=
 =?us-ascii?Q?UM3QnV+if/ARtkwl5v0RZznCsmMBCpbtVt390NRh/KyThykRNFpjo3PCAZ1e?=
 =?us-ascii?Q?ksn636ZEeatWdMRSR9+6SJ4IBm52F1bbvh9Zqpo6S6d4aeniPPaplTcs7Qlt?=
 =?us-ascii?Q?3CHBQvN9lWKv0gtrG7HYc7MS9gTnCodPIlr2hfv9h0FWiQG/lHR616tQulvA?=
 =?us-ascii?Q?omd16gJQE5NP/juSgAPVzS4aOJcT3TuJeMewuOCQ7jPwjq3bvMFK7HdOkhcV?=
 =?us-ascii?Q?btLuwkye/Gd4gsDiycXqQgQU3G+zprdWrYL9r0pQEEa0EPq1FB90a6IuuS9p?=
 =?us-ascii?Q?CpXJ1g/ZzpUZFQKncu+M7y6+Dg3eOhuZaG/jD3c9OuavbZAZwqKYmtnqz81m?=
 =?us-ascii?Q?Es1HXpzIepxGJeme2bjQjEDSCU9ijHHqi0iK9dYsckYMuxfNDfA8S3mgXwyJ?=
 =?us-ascii?Q?kEVCSoL3NnZn2O/ZQH7VKWt+deh2fEduo+uUKMPTX93OCJ6z7nQsobNW+uV5?=
 =?us-ascii?Q?qnbBqa3EnZuDv2xMfG7wRO/qB1IeFWf4stBcCn0mQ49SkmsYwA1KPJHCp5/A?=
 =?us-ascii?Q?G7sNlCwvltA0NaFw+EH9OJCHegzTzsWBq8RjyucFzh63gFiz6K4JtNgrLDR3?=
 =?us-ascii?Q?Oh3Viii4UjuPqS9pfwSQvuMkc76QY7Al0pKye2vfaWkBQ3FqzQI83N/keGRM?=
 =?us-ascii?Q?Redla1gYx+kBRgVEYOY85AD+FHeoT1RrfrFF5I45oGu1xJu5x+mFLbfoYXBv?=
 =?us-ascii?Q?2qOS1o82op8qvMX1Hb7d4H+V2YwtvDyIID/ZTdrw5MK3Qh1cMf4bsxqPRpIL?=
 =?us-ascii?Q?gKtmWCeZYSG44i43N4oYrCeGLBJMfCq+sIig5KqmFyd6IPnYHmqaIvFTdSaX?=
 =?us-ascii?Q?r/d8sn0iV5QIS3x9iZM6wgylrtnYCg55k58i4rlRHuQBezhrLKmW1VXsd8MP?=
 =?us-ascii?Q?QD7R4+P/vsE22QDySBQ1EOYj+E4bqfHCdIzFS6EkN+3UdktWX5D3ad6rOUg8?=
 =?us-ascii?Q?nEJuU1HrVQ+TpFKwdv2ogXRc70dAoVz+r7vWisOCO+ArTmsoW05Hl7y0OBsU?=
 =?us-ascii?Q?bWWKDRD6wxydHy6pob4v/3VfTvmYbco5hjO8nl4gJcMIFbmP6a9222R8Ut4K?=
 =?us-ascii?Q?PSFzutiLXJfyRS9AHUOJwcx6SlkadJysrJa+Iby4kNcbpuTi2iQQn9dwLy46?=
 =?us-ascii?Q?hHJe7OqTaEr1jpe/2cWgsbzgiZSL2ZKPx8y4Or7GnaswqvvNw0behT4M2f6m?=
 =?us-ascii?Q?NgMhnKo7jPElfweA8jN3TZ4a89L9t8wbnkPf2/HhC7bqtqd85aEqzYDHaLZ3?=
 =?us-ascii?Q?WZj1tsqCYO8OGZyg4Hdr57tFZVh3jar/X1NBMDnQ+c+XU3EWJT12ffaV2YB1?=
 =?us-ascii?Q?cg6oM7KEY1U2EFXCPKvOBGlaAyhhlmDbxrgBjDgZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd613f9b-6e59-487f-1b08-08dba7ad4055
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 09:57:55.7323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvHxLuZICLRpRuTTAFyI1zEd3GBSFXzOSUo3B0Z5CKSARdO5E70LNPNpOBsye9nHEG306fYrypaz/hUClpZ4bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com

On Mon, Aug 28, 2023 at 10:46:09AM +0200, Krzysztof Kozlowski wrote:
> On 09/08/2023 06:07, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.4.y
> > head:   38ca69782268c8e9578ba2f1fccf931f643eb8da
> > commit: 884756f0203f9478391389465f8d6184223572be [600/1652] w1: fix loop in w1_fini()
> > config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308091247.i8jNaJgR-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> 
> ...
> 
> > WARNING: modpost: vmlinux.o(__ex_table+0x2248): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
> > ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_str'
> > WARNING: modpost: vmlinux.o(__ex_table+0x225c): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata.str1.1:.L.str.29
> > ERROR: modpost: __ex_table+0x225c references non-executable section '.rodata.str1.1'
> > WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
> 
> False positive. I don't think my patch caused it, but rather just
> touched the file thus the same old warning pops up.

Sorry about the false report. We will adjust the logic to avoid further
false positive.

> 
> Best regards,
> Krzysztof
> 
> 
