Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598EC7E;
	Sun, 28 May 2023 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685246351; x=1716782351;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/lDNRNYazzu29pxOXCp0RnMsXNc0OyMe13yM3RRLDNE=;
  b=M0WVVAIp/4IxNFp3zWdsU6C/9+/hW0NXzJSZsDI1GFQLUOLXMKpst9xr
   nqq8bgU54X880BcWvlnJLajYRoRp/qjiHZ0fpDZke/cW71aRU39fOYNZb
   AZxvdjSUmqDI/5jAqZJTd53kSPwibrQM5o1w+aZ5WPE41vvcYmBj8I9uW
   gll/d8cSLxsBpSGpRRe46dElrH5iXZsAmKpVFUdtuaxhvq2QAfB937u4+
   r5zLRYrbaAaFRLVAP2f1i3G/NppP4CbJzAnn4MwnOFtsutL/7zM/AIxZJ
   vnko/zJWNTD9cwkL0D11Rm8LMibUdneh/HhB7Ug2hDGs6cbdKwxHFEJeP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="357726821"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="357726821"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 20:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="736446848"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="736446848"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 27 May 2023 20:59:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 27 May 2023 20:59:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 27 May 2023 20:59:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 27 May 2023 20:59:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 27 May 2023 20:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHepL+HAeLkKH8V344aFWs09RTxN9Sig0Z20Sane2yN336gTInPI2xqXAUyPyAtsuTtQtALyeHWeO0WFfBC814XcSpF0jzimekRh8NCweMhkUPirc+y/+M15tcAgAmt1/Bl5wRZxVPbhEexiyqdvHjKJuXETAcN95VT/NiyJXG2Ti1UwaZSwfo6MhSnC3OfUAa50cUK5vU39UxJiB9t/psuEQP2IuaWLdmRMP7q1O0VvLWKvNuJhyzHG8Kegivd9m8EczqKVBStUOWTxN4FqTagaIrtCzp7Xgsud1PONlYnnFd+LHEERvMuQenDKl7MRx51RSg7q786bVeUYrZYuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY8tMLTHyJ0uLMQijlYl7phjdLRH1pF+jmzqLcXwjYQ=;
 b=F/+9yiJiBjoKkPxKLPZVwh1pp5yJdcv1//FrIZH+LqWOvDfCf5O1h9DhXTETvAQYGL7iz75Qy6LSTlLBOszArBPqXtc+KCRb5uvApCLH6l/48wXm7z1rqZBVlPu6MumltXnPeynP+XVF0T+24uXsT9Meel5x+NdGzXK+vA8Stj+YjuXEuR6zFav+zCnmxI+LZ/I/qkWQ4tksQBKfuCYWQJQDCV52E9lJS2/3eaz9wpNLNNZxXdtD5GHZCFON5zgAdNbfxoYaUlJObk+t6OLzhM05COkh5yvn5E6/PEEJ2BZQoKmV/bHe/xIaHvXzdofE/HwdEO/8SGg5Qbpm7Ma4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by CH0PR11MB5492.namprd11.prod.outlook.com (2603:10b6:610:d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Sun, 28 May
 2023 03:59:03 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2dbc:e5ec:2032:55b5]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2dbc:e5ec:2032:55b5%4]) with mapi id 15.20.6433.020; Sun, 28 May 2023
 03:59:03 +0000
Date: Sun, 28 May 2023 11:58:51 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>,
	<oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, John Keeping <john@metanate.com>,
	<llvm@lists.linux.dev>, kernel test robot <lkp@intel.com>
Subject: Re: [stable:linux-4.19.y 984/6017] ld.lld: error:
 drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not
 available
Message-ID: <ZHLRexILH7RVNivQ@rli9-mobl>
References: <202305251508.iFEInYVW-lkp@intel.com>
 <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>
 <20230526152458.GA395537@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526152458.GA395537@dev-arch.thelio-3990X>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|CH0PR11MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 701cd008-a0a0-443b-901f-08db5f2fdf34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxXv7I1vUMIPdRPIRXCOMliTH7wrpTV/X0f0Tc6Wcm2mirUoWJ1npO5ksG162Xg8cphapeHlEOn9MQrVfjX61Crrx9Axb85ZgL0hiUAzjER0hliYYMu3qHkW8X1CCb+CHrbqMSfJN8ygBGxsyiuN0HcOh7eB0bqSWC73J66LKlD1fahRZQAapSksTYMBg3skzgLAOZtzVwizN8vKrSz3Z8Dbt7b1XeZm8im49v9neeceTvwykzIMkF1c1tC9yPxztPlwnTVPtU4XoR1JFPHJesbQhAtVO7JuFf+1yFpj3yK33TPsVs3xXJFEIUksWVIe/S9Hg6Te4iYYBLRTZgICLoxGzqzeP37CXnYIwu6hDXuVq8SdxjMEFcUoVMOMIUw0CtT6Je7A+9Xw7qZ5Bx0AJPRk1Z2SdB0COy/gEVgv9dWKRF6uZQTH+q7Hbdyg//ElQ7GK0kLti70K+8b+qYPAsAzoVZTpr3tPCSxw8SUeWvjZEnIYhWSJGwHNqrKfD4wnk5GeYTmSGSfJPR+66hcUjdUI+3hr6Re0h7uPHExmtCzPqZlUVibwG20GvBlmTx+I6uZ2R9Vb//YCm90+HhX4nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(966005)(478600001)(83380400001)(33716001)(5660300002)(186003)(6916009)(4326008)(86362001)(8676002)(8936002)(6486002)(2906002)(41300700001)(38100700002)(316002)(6666004)(82960400001)(6512007)(6506007)(44832011)(26005)(66946007)(107886003)(54906003)(9686003)(66476007)(66556008)(53546011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdrVWNQYmZScW5wWUVpelB3Rm15RXdzb2pFakpWL3AyRFBrZUtpQjBnTTNl?=
 =?utf-8?B?RVNmSXVWQUhib3lZb1dwYzlQTzhZY1RxY0J0MWwzSXNkSU1VOXVLT2VjU1pK?=
 =?utf-8?B?ZXVybTZVZmFyWE1Da3gyN1p6NVFEUVVzRHUvMWhUUHZRV3hMS3IvbUh6WVRx?=
 =?utf-8?B?YnNsOXR3WWN5OSt1NWpGN1BsTGlLOHR2L0tMSVJLcHFGaXByaHdRNXBBMlhT?=
 =?utf-8?B?dHg2ZzVDdkgyVThVV0FPcE5BcVpSWnkxV0p2ZXQzaU5ORzhNVjl0T0FsSVFt?=
 =?utf-8?B?TGQ0RDEydllwTVpLa0lib0xQWlVwWXh6bmZ5V0FPd0x3SUFiWURyVE91d1lD?=
 =?utf-8?B?UXVLSmhBRlkxUDNObUh6WEpjdkhSOTdDRkQ0MFdsRkd6ZHFnUEVFc2F5Q0NK?=
 =?utf-8?B?Z1JtQkZrb2F3STkvcnJjL3A0RGpSVjFCalVBWHM1L2xzQXM5S3FWb2NjOXdn?=
 =?utf-8?B?ZnFCdDhpZkttditXNlg0QnlBQjZucS9wUTBWc1dxV2dnT1kzVnI1c3VORW5n?=
 =?utf-8?B?ek5Xa0NYTjg1Ui9jdktaUmZKZTdvczM3SEY5cWIxemNpM3B4dXJYdGxlTlVX?=
 =?utf-8?B?QXA4RTg4d25TYnplNTlXS1FpWGFQM2ljMmordTA0WHBHMnI1akpRbngzMWtS?=
 =?utf-8?B?djZZbTRodUJZQ1lIMkQ4ekZQWGQ0Yk5UdFM4TTg2N3BNSVJMMEZBNjVwR29Y?=
 =?utf-8?B?Z0t4eWdSNGZER2VhYUVoZCtLYWcweUJ3OTBkUXBxVk85Rm41Q2VqVmI2TC9I?=
 =?utf-8?B?MWVtWTFGQVoyRTR6a2drNVhzTEJ5RkhMdU12WFBkSmxsMFFILzdDWklpRW9Q?=
 =?utf-8?B?SlRFNDQ2Mis4WEhYOXpPbHJEdU9aZWFMVjhvZ0RjVmVKZDFOdlowS2RLWFVM?=
 =?utf-8?B?TCtGNlQ3R05FajF2UmF1KzlodVVLYVhZTFNWYlFiYk9vU2lrTkl6TFNNVzJx?=
 =?utf-8?B?SEt1YmVtb0F3czhZY2k1TzFxOHRFVHNRZnNBc0x1cllZVER0WFZ4d0hLTUM2?=
 =?utf-8?B?bU9uYjlBdElMeVdsYlBYUEhQSUkzdjA1RUJoT0l4M2k2YmJQdnBuVU9kejdU?=
 =?utf-8?B?OGtKcGI5d0ZpSWVFYTNBRnZSZkZROFA2ZnVrMlg2cmJxVi9JalkrS2UyWEg2?=
 =?utf-8?B?S252L1R1aXBJbXVleWhFTG9ERjJkWHJIa0xwSXZIVHVBMnNkNUY1c2YwbWFN?=
 =?utf-8?B?MDI3WXZ0RkIxT0hZWHNHaXhOakloZlRoWEZKbUx5ZW1HZEg0OG9DSXBaQTd0?=
 =?utf-8?B?TjVEMm9MYVFqTWh6NTVlZit0aGpBaHRiZkFhenlBL1BtYXplWE5zZksvdHBY?=
 =?utf-8?B?ZlRacWsxYU1mQUFqemcvYUxRSHQzOUd5NitRcXk0SU1xZ3ZHbU4wdGVoVTh4?=
 =?utf-8?B?bWhlSWdLSWVUejFidHRjRHlreGRRMTZLeFU0MU51bDBhY281aUFRRGo5RnRB?=
 =?utf-8?B?ck90L0xFd1BWc3RoM29zMEsyYlgyRnJvdkNGZEtuK1ZWLzQzSTltNEN3eEp2?=
 =?utf-8?B?SjFoY0VEQjluc1F6ZDdjbmJNdUhpeFBsRDVOT2gvUzFTY2FBQUhqa2pWaHlX?=
 =?utf-8?B?Y1dtZWpnY0VzcDlmUzBpU1hwdVMrQXBjcnE1SFZTZEtrdnJwalVuaytiY0Vn?=
 =?utf-8?B?L2NjSXVQa3BlWE1FR0FGYVc0TXdQOWJJZlFpa3dqNkQ5aGxXU3R5dmtqTFRn?=
 =?utf-8?B?QmtKWjYwSFV3VlZiZDFidzV1NnBtNGRtQjJPQ0ZpbWpCT29ubFdtZlA2ZjFl?=
 =?utf-8?B?VmNJUi9vYTFQeFY1RjlRcGRYMTZacnZWMEEyOW91TUFqSmN0VlBQNnExK3lm?=
 =?utf-8?B?YXlUTzIxbEd6RS9uN1FzMWVuQTR4S2d0WlR0eHp2Sy83bVMwT250dk11Zkxh?=
 =?utf-8?B?TFhZbThmb3NzT3BLVmQ1ZkZLMTdaRUtJUXFnaEdBaUJxUHIwaG9JalJiZWp5?=
 =?utf-8?B?Wmp0eEdpMXVmS3ZXQkh1OE1RK3EyWUcxZmFUQXduYURXOXdzbU1qSUpaNVVL?=
 =?utf-8?B?WHN0ZW92TnBuVXVJdmNSQnl4T3Fod2RTZEIwNWhOTU9zMy9LQ0lqWjRWQmdu?=
 =?utf-8?B?djFXTkZCdWVsN3NVTGttWmdWQTVqdTliZThKOVBicGRDdVMwa2xIcmZ2WWtE?=
 =?utf-8?Q?0XmIvpkTeR1R+gHbbmI3oMSki?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 701cd008-a0a0-443b-901f-08db5f2fdf34
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2023 03:59:02.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ2DNyPuOte4aWnCRWYOXV29V+2yYO0nc5Wx9K9zLyGSzyI4WONIg6J8ZcJG395Mlp65sCy0MhD/k0tl2sQskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5492
X-OriginatorOrg: intel.com

On Fri, May 26, 2023 at 08:24:58AM -0700, Nathan Chancellor wrote:
> On Thu, May 25, 2023 at 02:21:24PM -0700, Nick Desaulniers wrote:
> > On Thu, May 25, 2023 at 12:44 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> > > head:   3f57fb8b1bd06b277556601133823bec370d723f
> > > commit: c964b1bbf179a163084b1ec8ad094b8c8dce28c8 [984/6017] usb: dwc2: hcd_queue: Fix use of floating point literal
> > > config: x86_64-randconfig-x093-20230524
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >         mkdir -p ~/bin
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > >         git fetch --no-tags stable linux-4.19.y
> > >         git checkout c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305251508.iFEInYVW-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > 
> > Hmmm...that's surprising to see on 4.19.  I didn't add support for
> > compressed debug info until:
> > 
> > commit 10e68b02c861 ("Makefile: support compressed debug info")
> > 
> > which landed in v5.8-rc1 and AFAIK was never backported.
> > 
> > I wasn't able to reproduce this with ToT LLVM (clang-17); I wonder if
> > this is an issue with clang-14?

Hi Nathan, we will double check whether it is clang-14 specific. For now,
I use the the reproduce steps which can't reproduce this yet, even by running

	$ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

The clang version downloaded by reproduce step is clang-16, which
can't reproduce

$ ~/0day/clang/bin/clang --version
clang version 16.0.0 (git://gitmirror/llvm_project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
Target: x86_64-unknown-linux-gnu
Thread model: posix

> 
> Something I was thinking about yesterday is that binutils has a bunch of
> configure flags to control default behavior and one of those is
> compressed debug sections on by default:
> 
>   --enable-compressed-debug-sections={all,gas,gold,ld,none}
>                           Enable compressed debug sections for gas, gold or ld
>                           by default
> 
> Is it possible that the version of binutils that the kernel test robot
> uses has compressed debug sections enabled by default for gas? Although,

Do you refer to below info? If not, i will check further

$ ld --version
GNU ld (GNU Binutils for Debian) 2.40

$ ld --help | grep -A4 compress
  --compress-debug-sections=[none|zlib|zlib-gnu|zlib-gabi|zstd]
                              Compress DWARF debug sections
                                Default: none
  -z common-page-size=SIZE    Set common page size to SIZE

> if I am reading make.cross correctly (linked above), it seems like the
> integrated assembler should be used in this case... It would be really
> helpful to have the exact make command that the robot used in the report

Got it, let us think of this to share the build log, so far, as it contains
some debugging/tracing info, we haven't sent it along with the report. But
I think at least, we can extract the make command out as first step.

> to know for sure. I do not see a similar switch available for LLVM and
> even then, I would not expect to see the same issue because we should
> not even have the ability to generate a compressed debug section if zlib
> was not available.
> 
> > Just tried and could not reproduce.  Has this issue been seen elsewhere?
> > 
> > Ah, we have
> > 
> > https://lore.kernel.org/llvm/?q=contains+a+compressed+section%2C+but+zlib+is+not+available
> > https://lore.kernel.org/llvm/20230404161735.GA1703291@dev-arch.thelio-3990X/
> > 
> > So since 10e68b02c861 is in v5.8-rc1, then for 4.14, 4.19, and 5.4 we
> > probably want a stable-only patch for -gz=none.
> > 
> > GCC didn't support -gz=none until 5.1, so that might be an issue for
> > older branches of stable which might still support older GCC versions.
> > 4.19.y still supports gcc 4.6.
> > 
> > ```
> > diff --git a/Makefile b/Makefile
> > index 71416fde7348..e6754300021c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -756,6 +756,7 @@ KBUILD_AFLAGS       += -g
> >  else
> >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> >  endif
> > +KBUILD_CFLAGS  += $(call cc-option, -gz=none)
> >  endif
> > 
> >  ifdef CONFIG_DEBUG_INFO_DWARF4
> > ```
> > 
> > Godbolt only binutils v2.27+, but 4.19 supported v2.20+ (so I can't
> > check --compress-debug-sections=none assembler support quickly).
> 
> You could do
> 
>   KBUILD_AFLAGS   += $(as-option, -Wa$(comma)--compress-debug-sections=none)
> 
> no?

Do you suggest we can do this when using clang-14 to build or even gcc when
such issue appears?

> 
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> 
> Cheers,
> Nathan
> 
