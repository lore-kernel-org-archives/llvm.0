Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D337E;
	Sat, 27 May 2023 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685171712; x=1716707712;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8xRzH6laYiIzKkJ1oRdmt/gQkHE8rug3U6JmEITP/Yc=;
  b=iH5W3QOfcVVYh/X/qjiG8+6mcr7nQIUM+OE0RyurpixGahtn5nPUMaBt
   Em/SoDsJhqEHn1JG3Z/WKO3HR56D8wxpPLQROVXDqZ8I1AQV7qhLOR0xP
   gJ+lfgpC27RoVWoIROE8JREGFWZO2nXwC8+Fw4GDx+YuvCJ88mNd4tZdq
   VTJU9oQlS3sHDA9KEtCor1eGayE4na9jyQR2jcMgkVukN7M3wkNeHsfmf
   Iqcd0cZa+ZyOhUcJrqPw2xrY9s/cw5SkJnQtz54vhE7h7Nnanzw1JDqFg
   KVjsT5BpAS99/ew220z3fucn6xdx7pr6oyF79HNNnqkp1AKN7t9owvTmU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334730302"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="334730302"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682955330"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="682955330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2023 00:15:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 27 May 2023 00:15:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 27 May 2023 00:15:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 27 May 2023 00:15:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 27 May 2023 00:15:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWkVLD9blYOsjMgWaTadz//U2vN7kh1pYGgO+mwX0mjfgyhXvKaZjlTuXadr4KFz2ph9KNP4yKA2s+paXLtjXvQ6v6Mlvbq8NM71qqhXYC0j+6zBVAteLWoLrkKcNqzoAhIWSGTHuqxetjvKgEYi/1wg7XeZftTsVKcRfeJbA3HN+35vJVA3LrNda4NaFGEACICuDMSPUmu6eOxGmIUtKc2Y5+ljjAbduK4jpSnQaBTnH13rUgYtxeXNpX/uTCzCxFrauLidRcnNp6W9dZ4YovIzFvMbsnRynUIjThsGhMLw1duxkbYwZ0XaS4mFkBNeP/TnFUPOKljB6z6li3+NQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9qIW0F/0g6vHOFJLow84aXHOtRgsXbdBai0gNyyqIM=;
 b=aipVTKy3dSScIXaR7Tnp3UIa4miKiNKEbpuYbJlNl+ziNJ0fM3sf4n35E5zbxZgU5+Ntp5wfsiXsJFJqUQFBlAmVW8QwJ8gqVtPjqkZdenybR9J7oaw4izSiHJ1WH0uK8L+QUW5/UWcddkyHAc2EaAmSgzLHTaae7wcfbtcJPlEeshztY1wNV5+bwanZM8IX7JMkyhY7ws+z/pnHZnwxZB+jA/kMPTCkOpykpY62Cn+KdWkNm1z7CHQZ3xtQb63t0thzoyDtjgGS7HSAU5+QLwq0ZDd9jAOowMIVpi5WhN5fPRgVyi85w71eVT6uVAeW5dmX0OlaGDNohwA+A5uEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Sat, 27 May
 2023 07:15:03 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2dbc:e5ec:2032:55b5]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2dbc:e5ec:2032:55b5%4]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 07:15:03 +0000
Date: Sat, 27 May 2023 15:14:50 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot
	<lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Damien Le Moal
	<damien.lemoal@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Sasha Levin
	<sashal@kernel.org>
Subject: Re: [stable:linux-5.4.y 1809/9999] ld.lld: error:
 lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not
 available
Message-ID: <ZHGt6lyQOrMfQxUS@rli9-mobl>
References: <202305260739.yrWlFZTF-lkp@intel.com>
 <CAMuHMdV3wFeBBK64Q5-pGcRVP12Smhmaon-Em0cQREjj2duLEg@mail.gmail.com>
 <20230526152730.GB395537@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526152730.GB395537@dev-arch.thelio-3990X>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|BL1PR11MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: f245facd-0b37-4244-b9a6-08db5e821636
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h02VIpe4vuFwZ2TwZY3gipTe7gSmK7QALPZT6PQXIGDAbJtlgEPDDHCKMmnJrb+l4Pb/ssbDsZ3MM33pHdYn0AwBbMPHmp3y+3De7GCeMLprHl3e2KRm/MkEPgdoWcNLAYHCG/NUJb+TMKScTJ75BW/7LPuhNUMt0IVFM2GFH59jSdLl2djKRNue5k9oLimrzi2lLNIMrykNE2YlRLwOkNt70tmDGc6bo/NrtisOY7eVcagstukyboV1oiC1Givh1kCdpZV3qkj16MOYMX6WgogBoBwyq5zXD6pFVRWLbDDausYLoPHAHBusx/1m9kwlg+pXf0i2WRqTq4sAL7GVl8d/4uq9Fz2gwqRZH7CxkvClllahGQhPvf2n+j3Wmd2at3QIWtWn98bTVLVqBHTtU5nXSajqkhx9tFABevlta6lRI0yzuJ80Rh6+zBjN2SB3LwVLeqND8OUKn0RM97YBuMkfXI/bMuvZDvYLvNaAL8EOM1Qi5Om5eu0ltxzCdr8lMp2XRmDSV2k/VG9GvA/OcweJNPuUeidEfCcRoJ7qfE1ePcoTpuqubigOYqGcfxWrHZ3KBmoPwmmHsFf1YPOb4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(4326008)(6916009)(5660300002)(82960400001)(8936002)(86362001)(33716001)(2906002)(38100700002)(8676002)(83380400001)(44832011)(316002)(41300700001)(54906003)(6666004)(478600001)(6506007)(966005)(6486002)(186003)(66946007)(66476007)(66556008)(53546011)(9686003)(6512007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklkbVByYnBtMlNkaEU0V2MxSVVlcHFYRnpCSkszazF6RzVHMXZKYkUvbTBO?=
 =?utf-8?B?ckMwWExkbTg4bWpubFA1VHhxSXhlTEtQQVZWaDQ4RDlaNk0zekN4RE9rQVlR?=
 =?utf-8?B?OUtCY0tUVlpPSTYwMnBxUnMxTTBYVEhXd1NGQVgzdmw5WjFBU1BEVGxQcTE2?=
 =?utf-8?B?TUNyRzJNQmVUQlMvY2h4OFpqWlZTL3BPdWdFQmZxQitLeWxrMHI3YVZleDBC?=
 =?utf-8?B?d1E1Y1pJU25xRXNqeU1TcUFRU1VFQ1VBZlA5eVJuY2xiSlZzR1pIYWc3QVdF?=
 =?utf-8?B?czJndG1EbHN6UThRazUxWXhMeDVRdzBBTFpWZngyUkZjSkI3UURCbHNNT2Q2?=
 =?utf-8?B?V3FGNzE4b3h1a3hrK1RVSU5kTUk4TEN5TXlWSDl5eGl5OVd0Qjd5RTdrN3dj?=
 =?utf-8?B?NUJVRWcyYkhsTVRkaHl0Ulh0OSt1U2R2YlpaTnkxSit4ZndsdW0wMUJGM0gz?=
 =?utf-8?B?VUtOYlYyY01CVllaTXNta1NVYXlKemZ3YjhrNVBrZC9ZdVFpWlNaTnVYOXpa?=
 =?utf-8?B?WnRjOXRNWTZlSzFYR0xnbEJWWHNQVEpZTWVtdGVHczJJTFIrNE1tK3J4RG9w?=
 =?utf-8?B?YjZxT3JuR3pFbVd4cEdKd1VCcjRDV25BNkl3NE51SHpUTXFwRzk5cWZVN290?=
 =?utf-8?B?Y3RmeFhxcEJtNUZGWmhTUDdVSkFBdW41cHJMeGJxWUxyNmJwU2FTOTgwY2hJ?=
 =?utf-8?B?U2g3SnE5a2w3ZDJNSU4yYm54SEtNRUpRL21VYktsK3NGZ21YRWxTQjJOK0dN?=
 =?utf-8?B?eCtxaGNiWVcyY3VoK3BjOFd4SEgvNXdrVXdzVEtGemRiL2ZzNS9uSWd2eERp?=
 =?utf-8?B?dHp0aEdBVmhYQ1lTeU9PbndOamhSQ25EQmVzQS83QWE5QkRFOWxzcDM4OTds?=
 =?utf-8?B?c3pIdnlrVEVzYm5ZazN5bDhjMkkvMzFxUm5SV0lrUHdwb3dyV2pVTnZIZXIz?=
 =?utf-8?B?amExbU12U0d0ZVoyQnNtK1N2MmJuaURtMVc2ZysveXhKZElkazNaSTZFMnZS?=
 =?utf-8?B?YThFWnFBSFZxR253THVTZFpNTTRiTjA1QzQ4UFNvNW00NVE3WGtaOW93OGQr?=
 =?utf-8?B?clkwVmlJeFVTRkkwZkJIa25jbE1VQ0dmZlVmem5MTGZ0TFN4YlhMd0pYQXJq?=
 =?utf-8?B?b1BMMjkvcTRsVThPYmdjaktZZTNnczhNQU53WHZCanFIZUxWcEhidUJVUTRV?=
 =?utf-8?B?R3EyRjF0SWliVXlnTDNRaUJETElrQ3QyOHE2L3p5Z3NTUVhDd3R2YzZRV0Vk?=
 =?utf-8?B?Z3hnd2JNNXk1M09CQ3l2YXh5QlV5VFB3MGpLNHcwUW5tK3l1NUZBYjhXa0RD?=
 =?utf-8?B?Z2gxcHMydWcyd1NHRFRrRWdnS21YU2JUQVVZYk1oekwxWjlzenh0ZjNLeUtD?=
 =?utf-8?B?RDkwOFIzVjY5SnVxZVFPb3pnV203UXJUeVVEM1dJZTBaOXNsMW9Md0R2Ylht?=
 =?utf-8?B?UlAvc3hSK0hUWjY0T1dvRmxnaWV2TFpabTF1QlRXSHpiNWM1VGMzNXVBRjFv?=
 =?utf-8?B?M1ZiRTUxOFlhc1BYdmpodmFYZE9BZHBpR0FEZWZ1QlRxK3dRdTY3c203MjZJ?=
 =?utf-8?B?NnRpbC9Ic0ZQZGswMkM5YkgvQTF5eld5aE9WbnNOYXBWdHRMWFoyVUQzUnhG?=
 =?utf-8?B?QUlNdjJQYjY4UVFoN0QvQ0ZTZFF2NmNnWFh0MURmWEpBb0YxS2t2cXU4aDUz?=
 =?utf-8?B?c1FuZXNMVEtNYjFXS3dWUER2QmYvN3VJTTJ1K2FHcGtIOTB3Ly9RVU1ZbFZN?=
 =?utf-8?B?ZnR5bm9aSE9pbThLZHZCemJlV0xnakQrZG01VE1ZakFtQm5seVhKVVU4ck51?=
 =?utf-8?B?NEljMmcvRTdXeXVmWHQ0WkF6dG11TlBjVHBMdHpvZEllMHlydHZFYlVkNjh5?=
 =?utf-8?B?Y0w0ZmVOc0ptVXFRY1VCNzdzWXlEQWRkUUQ2QXpNQTZ6Vjg4WisrdHQ1RGZP?=
 =?utf-8?B?eFg2cFY2bHA1QkhtTThnY0NPK1dOU1hRRzB5RldaRUxkWFZNdVh2SXdlQTBK?=
 =?utf-8?B?YlF3NGVKczd4eHN2cTZEanBYaUdveDNkcUMzbHhkWU0rZ1kwSkttVVJUQjJu?=
 =?utf-8?B?VDM2OFB6U3pwUEdWNHU4ZjkzT1FQcmFac3FHSDFDUmtMdUlYZ2k5Qm51WTY0?=
 =?utf-8?Q?/kuEbdFRFf+xplDa6/EVChd5H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f245facd-0b37-4244-b9a6-08db5e821636
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 07:15:02.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCu1PLx4GzjuEutShiVhXWybYWZ/HXqvnXtIXIlmX94wfhxEVrbNBELU8V2+c1O0LXnkepM7Q6Y7DhNo+sHT0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
X-OriginatorOrg: intel.com

On Fri, May 26, 2023 at 08:27:30AM -0700, Nathan Chancellor wrote:
> Hi Geert,
> 
> On Fri, May 26, 2023 at 09:04:02AM +0200, Geert Uytterhoeven wrote:
> > On Fri, May 26, 2023 at 1:24 AM kernel test robot <lkp@intel.com> wrote:
> > > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> > > head:   f53660ec669f60c772fdf7d75d1c24d288547cee
> > > commit: 11420c32c1b49d0f900c4b20bc77c963c54086ce [1809/9999] efi: EFI_EARLYCON should depend on EFI
> > > config: x86_64-randconfig-x071-20230525
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=1 build):
> > >         mkdir -p ~/bin
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=11420c32c1b49d0f900c4b20bc77c963c54086ce
> > >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > >         git fetch --no-tags stable linux-5.4.y
> > >         git checkout 11420c32c1b49d0f900c4b20bc77c963c54086ce
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash lib/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305260739.yrWlFZTF-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: lib/fonts/fonts.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun8x16.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > > >> ld.lld: error: lib/fonts/font_sun12x22.o: contains a compressed section, but zlib is not available
> > >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> > 
> > This looks like a toolchain issue to me: the fonts themselves do not
> > contain compressed data, but perhaps they do contain some data that
> > coincidentally matches a zlib compressed-data signature?
> 
> It is almost certainly a toolchain issue. I do not think it is related
> to the font files themselves, there are many other reports of this same
> error on other files. There is some discussion on this thread around it:

sorry about the noise, before the bot resolves the issue of its toolchain, we
have disabled the report against this error to avoid further false positive.

> 
> https://lore.kernel.org/CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com/

Thanks, i will share our follow up in this thread.

> 
> Cheers,
> Nathan
> 
