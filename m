Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4D17C4
	for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 05:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666243060; x=1697779060;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YWQz1ULHGETOsegOkpVFC9I6oZEYfVJnjMLK05TSJqY=;
  b=SfT1XdsiHUnZ9THyS9GKZZqf+/ILNyyeh6G++ISoSTldJrhf7KVYPm8T
   bA7zHlx92BG2uIeBBjOgast98FaNuKsAyYb2EBHH4nvEOLQyqLgbO006A
   2Ehpf9qAU4bEPhY3nb2t5DCHVVnBql1QC+b9nLmL1goIVSOtrlblYoZZU
   zIeeBGSu168TJid7HWYcrNU8fIDw0mXHl9B7Nc0myhdlyx8xsKhFRV9h9
   Jl8LvfA4SFnCNzoZ+G4plVPeUSxdSK421BuC/GBvmVwQljH1AUukG1wH/
   2iIBvfVunavUG5XPbu8RZXDRsCkDMSn3v/wOrlXkHhyjGKPtvMgC0IVEk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="370818134"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="370818134"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 22:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="772137885"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="772137885"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 22:17:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 22:17:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 22:17:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 22:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvDw87lJUj2LGEgsNYF41+6SG6aaTkkmfe5Y2Sg7Kymoda9NvGsGzOBCgu1dzvdisDFJKrVwIFlyiROc+pZ+FDxPHPAc2oCQeDz1KlwYN0cAIRO/9q433YEolXiS8wcf4f++1j8b92nvtx6Ce48ckrpyv2+uPmhtH8DZVH3d4B4l+xh0qn3GTyBrY8zjDkLIk0O+K6jdw9KsMKfsvF5UPlnUUgkCoDQYoWYBxx/P1kli0X+Rl3wRKRVf5xHcAF0OfNelAhbKmEaw1VDYgdJVAKR50FEi2VOEpan5K5JX8MZH3mbOABosLt1nqZtQq0JPcAry2nmR8f5TadukPO606Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G++18tEl84L7ErTJ1dBWc24ti62bR9oc99+1PuaNric=;
 b=UKpLLnd5WuGSGELh2c3BmZohqsGA1MKiUOhxFXDDV2qHvci1VQUZHH4/0eoDz/my2HZzuyONEgrKithkaKYNw0UECc7HWq74VglXIEbpFGgkSEb9RFJNwURS8J+saqdjfmBNNG87eJH9yc3REh7zH8IL2q5Pn6KFZnCAO/ddD2nLz2xFhXyav3bfQWcr/BlqWelyvF3btevmeUqlE7OGr/fixaa75U0HuMZIqt9AV5srxhs8Q2dEH+HPd6245Sl/ghdObLezXwsmswstGvhInrDEjYVsp3PaT5V+rIJ9Q/FRxEW7WV0q+NL8ajn+Kn+0bu46Z3LD3KFwFo2atuvTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 (2603:10b6:405:52::15) by MN2PR11MB4536.namprd11.prod.outlook.com
 (2603:10b6:208:26a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 05:17:36 +0000
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::348b:441f:ecda:baf5]) by BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::348b:441f:ecda:baf5%12]) with mapi id 15.20.5723.034; Thu, 20 Oct
 2022 05:17:35 +0000
From: "Li, Xin3" <xin3.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, H.Peter Anvin
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
Subject: RE: upgrade the orphan section warning to a hard link error
Thread-Topic: upgrade the orphan section warning to a hard link error
Thread-Index: AdjhHdAVfgOjlcrPRkiNErPHkbFg3gBODPyAAAJM5YAAANH1AAB3tuig
Date: Thu, 20 Oct 2022 05:17:35 +0000
Message-ID: <BN6PR1101MB216126260E3A9AFEE3F9CFB8A82A9@BN6PR1101MB2161.namprd11.prod.outlook.com>
References: <BN6PR1101MB216105D169D482FC8C539059A8269@BN6PR1101MB2161.namprd11.prod.outlook.com>
 <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X> <202210171230.CC40461C@keescook>
 <Y02zWFxC92VDSpdZ@dev-arch.thelio-3990X>
In-Reply-To: <Y02zWFxC92VDSpdZ@dev-arch.thelio-3990X>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR1101MB2161:EE_|MN2PR11MB4536:EE_
x-ms-office365-filtering-correlation-id: 1ed9cd1b-0900-4149-1cd6-08dab25a65f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7osUdZCBR1OyhqUsW0K1GBMkOhufaqiEqU14fnytazITyeQQfAHf2IwuCPn8TGM6mYJ9tFZgUyltB++N0Yrf+xEl7J9Yn1BrRuONPuzaF32PJWH90HbIEepArwFKywMAWecC9MsoSQRHI2sbEAGBEBqWq+Yeg0BEh1Ps7cejGuUquYiZl89M6t+bQ3Hokq7LZsRWjGHDV/ZPoQA3SY/tfDPH+S8VG6Im/yurSgZ0HPQPmO0tEKAc00UrprvMA9r+ShYt5jbJfJSiC5xg9SiTALr1z8b7Suw0l/uLYRaWJVH7srI8m8kMfjUw3ob7izTnlBo9s9/kBswt53MY3NAIbW/oR9+4p2x7hxLVOGzwPtCe3bybJT9Pm71usWdiGm4CkIYoO21dhH7t7V+5Sw0XoCWyOOvlnqKpfHPa1XUxQSumDu8bQSvDwiYHMH+GJYm2Kph6LXXY4GHeYRBYEhydbEGVM2tU9CjPX6YqIcitYZtSjnv+rE/CKVYiPs+oovlZD2QmCdq0nQsBHi4kmt+TcjIwB95yRdtBRxzBNGHGV3BqE+aiqEwH3Y8tO+ziWdh7C47qKcu/RDQBKEzZguScrogfbMCq3owZIyaJFd8Evvpmjmmg+9sNnILtVVjvzJfu4hkFsYH60hb12x9I0Ry81yuY7yMSJlmZG6LmpezL+Pp/jDiBpM2WyTxhC/6lSm+7LgdHXxd2Gyq9mjEyl1hm392g1rK1dnxykRdqI1QXbMJnR1ZF6/arVYGLqtFAykyV4qyQsl/pnjgPAysAZjjGgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1101MB2161.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(86362001)(38100700002)(82960400001)(8936002)(66446008)(64756008)(41300700001)(7696005)(110136005)(6506007)(316002)(26005)(54906003)(5660300002)(55016003)(38070700005)(4326008)(122000001)(52536014)(76116006)(66946007)(478600001)(71200400001)(33656002)(8676002)(9686003)(83380400001)(66476007)(66899015)(66556008)(186003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jT3O6sHtAb3xWRwQiB6xaU1YSl3QmqdLFJ+WaplCec/eD+6/IAu8CfP1kLF0?=
 =?us-ascii?Q?0Ag3bVC71XzXRLowcbVU5usW+u0OlD2zcYDAO3G8yE1mNSB54rk1gJLR03/I?=
 =?us-ascii?Q?8DBeMCZnxTpfqaRxK430mfnMRnG7kJguCxLFMwi5f1dHPtF8XMGLLpkf35T6?=
 =?us-ascii?Q?uv64yroXWUwNr5boXCaIZHz4Is1YWw4AHwOiruC1FMVbEkQ8xdYnh5UZwoR4?=
 =?us-ascii?Q?Mw+hkpiPigmDUk27F3M1p6aeamQEu1ctW1Gv1zTLEF4eJG4vYuSWq5fJ1nXT?=
 =?us-ascii?Q?zzBz/cXMn4T+tj+bV5UhsiLWrGYWqBpUSdUmeXguS5CCiDKPJneplplVilN3?=
 =?us-ascii?Q?hwOleCWSfmMEU+VEQfCMAwTNXR+gTR664kmA7ZrkMDoGB7H5QS/Wa2t2XnhU?=
 =?us-ascii?Q?QMGQpY6pP4V1CZj2pQsqx3IAGd9Boy6whOQkM2BO2Vp0MO64XP2tnQjjAowR?=
 =?us-ascii?Q?/OrWgXbk5COXaEITCrc1lm5vuGnKc6LdE5bzeodPPK2kQSUVSmuudQ1pvs7u?=
 =?us-ascii?Q?/K6GbzdXs/bC6WaKSc7FAamh+P7kxYMb2euqwuLA7yc+TucaPF+x+fcPJAa0?=
 =?us-ascii?Q?hQBAEoIifcw3UFy7NTrEzI8cw+N0G4kUth1kktiMxttho0DidzXUcu65d3Wb?=
 =?us-ascii?Q?EFaV5/U9PU4RsUnhwbTeJ2xuxjkm6NO/yX8CzUIet151sUslROQ3uG8ptS81?=
 =?us-ascii?Q?8hfzi3U7osqYZcddItlotSdDVeGsr/EpN371S3eX2YqGo4dQDpqMNqoAEcU2?=
 =?us-ascii?Q?jkRBe4t/vmuhSu046kF3s1tZuoWNLWZ4yWHVlUf0Z7zZKvKWM35ZEUSns5vW?=
 =?us-ascii?Q?SFRA4OMBwv8xVqWGVeir3EifApzueq8OhcYhzTi2wE5K0u/Kqhx+t2AzRgd9?=
 =?us-ascii?Q?ozH0gi36tli4LkDYWdkhbCHZ9UHgUL37iL9BnTHk+1bCUkndK18BjCjw34ey?=
 =?us-ascii?Q?3IuAtY/J9r+TIkgtFAfxyVrt1g6sspChNT5lXpMsJVOdYvtMV5SnAUUOZJ4y?=
 =?us-ascii?Q?G0cvPL5UwXo67ABHfq06ldDvEogwscyXXSbFCzg+FmmUqLrvisOaiUiz4Oyr?=
 =?us-ascii?Q?dyeHxv/VvciN4baANwjTY//jez0QwqwxLV2cjfw0boC9lHyeYq7Vc4ek67OH?=
 =?us-ascii?Q?SxkHkrF31H88Eo7i3hLSNOLZiE6b+liOSyifoFjRvtwk7U1+gI5OZHfAyLeS?=
 =?us-ascii?Q?HbRwVklzKLg6+i7pnB9xQiYs4zpbSJKnYBd26DoiUH0aZ7mvQF/VWAmyz92A?=
 =?us-ascii?Q?cwvdbrdaOlKN2ZGHOeyTiYxPN48XosX/sTgwq6HqtyzqUeK096WHvIwCpxNj?=
 =?us-ascii?Q?EqzGP1YJ+h8U1H3F+1HcRx4cdkIp2Nx7gKHhiyRyIUGWHmZwtvJP41LYvo5n?=
 =?us-ascii?Q?9y8l4+v2/DHMWh6/Z2Y6BkVs4B9EfquJyLVL1RbkhD818vOlYLAXz+3bJqes?=
 =?us-ascii?Q?lx4NR5VjJ8m8zBJ+3n/Sv3HMNoM6IDTOGLNnyF7N7Ft2h3ovghPlL0uEUuZh?=
 =?us-ascii?Q?xbIM7iEqha2dOob8e3Au3wfOVXpWXaCLGe8p7mZubH5F5m9bpJPEiIHH8Wcd?=
 =?us-ascii?Q?cR2vFRhOesX+cdknbzE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1101MB2161.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed9cd1b-0900-4149-1cd6-08dab25a65f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 05:17:35.3593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16Yrd/WKHc/NyClrYCoT8UnrHrcuiXBpzZ7tv/yzSGFWw5A3YuqNAVN30or3uMaxfp7cINq5TaJ1/hYYbFyNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
X-OriginatorOrg: intel.com

Hi Nathan,

> On Mon, Oct 17, 2022 at 12:32:39PM -0700, Kees Cook wrote:
> > On Mon, Oct 17, 2022 at 11:26:47AM -0700, Nathan Chancellor wrote:
> > > It might be interesting to turn orphan sections into an error if
> > > CONFIG_WERROR is set. Perhaps something like the following (FYI, not
> > > even compile tested)?
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 0837445110fc..485f47fc2c07 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1119,7 +1119,7 @@ endif
> > >  # We never want expected sections to be placed heuristically by the
> > > # linker. All sections should be explicitly named in the linker scrip=
t.
> > >  ifdef CONFIG_LD_ORPHAN_WARN
> > > -LDFLAGS_vmlinux +=3D --orphan-handling=3Dwarn
> > > +LDFLAGS_vmlinux +=3D --orphan-handling=3D$(if
> > > +$(CONFIG_WERROR),error,warn)
> > >  endif
> >
> > Yes, this is much preferred.
> >
> > > Outright turning the warning into an error with no escape hatch
> > > might be too aggressive, as we have had these warnings triggered by
> > > new compiler generated sections, such as in commit 848378812e40
> ("vmlinux.lds.h:
> > > Handle clang's module.{c,d}tor sections"). Unconditionally breaking
> > > the build in these situations is unfortunate but the warnings do
> > > need to be dealt with so I think having it error by default with the
> > > ability to opt-out is probably worth doing. I do not have a strong op=
inion
> though.
> >
> > Correct; the mandate from Linus (disregarding his addition of
> > CONFIG_WERROR for all*config builds), is that we should avoid breaking
> > builds. It wrecks bisection, it causes problems across compiler
> > versions, etc.
> >
> > So, yes, only on CONFIG_WERROR=3Dy.
>=20
> We would probably want to alter the text of CONFIG_WERROR in some manner
> to convey this, perhaps like so:
>=20
> diff --git a/init/Kconfig b/init/Kconfig index a19314933e54..1fc03e4b2af2
> 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -165,10 +165,12 @@ config WERROR
>  	help
>  	  A kernel build should not cause any compiler warnings, and this
>  	  enables the '-Werror' (for C) and '-Dwarnings' (for Rust) flags
> -	  to enforce that rule by default.
> +	  to enforce that rule by default. Certain warnings from other tools
> +	  such as the linker may be upgraded to errors with this option as
> +	  well.
>=20
> -	  However, if you have a new (or very old) compiler with odd and
> -	  unusual warnings, or you have some architecture with problems,
> +	  However, if you have a new (or very old) compiler or linker with odd
> +	  and unusual warnings, or you have some architecture with problems,
>  	  you may need to disable this config option in order to
>  	  successfully build the kernel.

Thanks a lot for making this crystal clear.

Do you want me to continue?  Or maybe it's easier for you to complete it?

I will need to find resources to test the patch on other platforms besides =
x86.

Xin
