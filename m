Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8947E
	for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 01:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666317487; x=1697853487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L1M6Iiaq2fdqO+Fb0bB0SXi2DbHDFIzyf5BfQnHCh8o=;
  b=a0ET+1Xe8ySrOLLTIbaEqBx90OLXice5HMScKsr5OZZItCXLMScjWF1J
   t4kYgTyKVsHn/hBa8FTmcezadMZTNqVuNfQUq8LjaHu13tC0HBp/Ki9xz
   8dAE+DqpnGDIjxQPe2aDTjEj86h4W9PTl9HtfviS8ZHrZ4bWnF0AWqVPh
   x6lRoJvFbJhOqGJgqRBrrNF+WESdCN/6+11tux0StwF1Mj0Xy6xGX8JOH
   SOsZvmm7oK0f83zZ51JxuLgRWZwmcS43R5iaK3xyONhkaSlIDchrHcq4S
   x30x19UN8KjRs/EcqLeJoX7EyD+l+UL08RVllig/0kFdkz6fnqP+R42eA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="306877448"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="306877448"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 18:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="805274545"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="805274545"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2022 18:58:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 18:58:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 18:58:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 18:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTNOF1bU3NezdagqnA0GPUzdXrGgZG5chmTU9n84St2RRZY2TWhqeSCtvrtQhUP7AKZVtwoIFFNLVOqldp8P0PMhL6amk/8yfeDvIjg11v244GsMlpyatNRayevdl5/r90SGwZYjHODi/RQc3ikz6fMDVx2L7syFtHKDq5gdN5U7T2hTBULA9V1h3va2JdGbnqlvhpQEaBKVnMJOvrINCaAvfqYTt/HN3Ya6bqKFTo+7tMovjevbY5Pt6fWWY5u2oajVxqxk/FXgKJ8DskfTITSGYaad0YbbvK0LTOD8G9cCk5T8QH58xmYQ/waDcoJ7TF1V0fpwqTkgWbi4tpzgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M72oUvtQcPK1AVtLfphBGVwrWRjCNi1M2QAuC5AHVDs=;
 b=DCXDC0O1FJmSQ0schmaf5yPGniHvDPtzBURm3d+jlq2aPopRLrd/ukAFMqmvuSN1zPF6dDX2xuei+4S/G9Ju3L87ayjnY0+689dRRiiWd8zrahnm0qOdZYySev3sW6Ezt1sAmBNMLamvKsfcN112zwsqegHD0muuuCeUcIsJGYGRACyVcCSu+WSZ/nyEiWzFx+8Qqp01e/h2KBNLw2QEJEDErF7AncDuTkMMzTBPAO3AkZqk2/sxjA6+zFEBErALftvc5NXxZFO9cxjKE4pfrxtfj+heH8JU4EAVAQpx8WwWrRMHD5YV2A8xZ2cpHgA4oglAxggsx09OT+Aqs2f1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 (2603:10b6:405:52::15) by MW3PR11MB4538.namprd11.prod.outlook.com
 (2603:10b6:303:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 01:58:03 +0000
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::40a1:5197:e1df:bb6c]) by BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::40a1:5197:e1df:bb6c%10]) with mapi id 15.20.5723.035; Fri, 21 Oct
 2022 01:58:02 +0000
From: "Li, Xin3" <xin3.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, H.Peter Anvin <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: upgrade the orphan section warning to a hard link error
Thread-Topic: upgrade the orphan section warning to a hard link error
Thread-Index: AdjhHdAVfgOjlcrPRkiNErPHkbFg3gBODPyAAAJM5YAAANH1AAB3tuigABrjdQAAEMzuUA==
Date: Fri, 21 Oct 2022 01:58:02 +0000
Message-ID: <BN6PR1101MB21611C12F9AE638019059433A82D9@BN6PR1101MB2161.namprd11.prod.outlook.com>
References: <BN6PR1101MB216105D169D482FC8C539059A8269@BN6PR1101MB2161.namprd11.prod.outlook.com>
 <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X> <202210171230.CC40461C@keescook>
 <Y02zWFxC92VDSpdZ@dev-arch.thelio-3990X>
 <BN6PR1101MB216126260E3A9AFEE3F9CFB8A82A9@BN6PR1101MB2161.namprd11.prod.outlook.com>
 <Y1GLLnYsEC8lYTdp@dev-arch.thelio-3990X>
In-Reply-To: <Y1GLLnYsEC8lYTdp@dev-arch.thelio-3990X>
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
x-ms-traffictypediagnostic: BN6PR1101MB2161:EE_|MW3PR11MB4538:EE_
x-ms-office365-filtering-correlation-id: 108a442f-49d0-4985-13dd-08dab307b021
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W7gugwY7FUfWytBU6W2WOhw/NN018m488Oo/k2Qfb5wwYD9ep0bcpEbD2sTxGYsio4EifiiJ7Lv7J/iXZivzlkmPVgak6SuaD1qXyuJ5uksJt+Sk6QTjp+ONi/eYHkadRBQDLwL4EiLtIVSuGSIHfjIXBVOoynlOLq3WM1x5pn05Vbk5bYBqw8ATIOl1ak1dfY4YbfJhALvWvv7Rlsivg+49KvFJeV3vY5fzGaTcqXmxmlRZ7X5L8u3AQRtCFa7WmWkNTsObgjPkQjU5XUEzmfrCBuHQSOXjdibq2cadChhawCmYfF+QThTa5Tksd04W09frS/gSLpccGTnNPXDYYACBlmDNg85VS2afR1vmJzNi07un5IwSIumOOohEWptfkL7bW+xN1ynS/vihWSVXPvPWJRIkRhxCy+9SwTVeqtf/p0tnn/HRG3YvGDZHK5Ju+MzQBCyT36hsVmBLpPIJ72IzO1lzFkE+LLHh/oTqMyBJoAmTFOIqHlFhTU1hQNR6cv84rkYE62hSclU1WC9s1suRWtoeI3yPvgiLs56efHzj+GBOBBul+EtdZO3kcxJ8SEbJQ9t9m6ukUrev2wLwZGYjl1NYebZHH5lN0dIIriZd9MOgbIzjRKcI1p8zc8I3XpBOdejFt5ZstWseCIpKuMB9wMK/JgjlFPs4/untPMKr1MFSKU5v/n8fUKtBh7Jt/tXssIXQJP1Xr10FWpVe+Qb2FEUxsRWOxvxEdTZikdeXs+UlJ7sCBd5STR9opF9IoV/U4CUhbnI/XTIwhtVNxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1101MB2161.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(82960400001)(186003)(26005)(41300700001)(478600001)(64756008)(86362001)(38070700005)(9686003)(52536014)(6506007)(53546011)(8936002)(4326008)(33656002)(5660300002)(7696005)(38100700002)(2906002)(54906003)(316002)(6916009)(122000001)(71200400001)(55016003)(76116006)(66446008)(8676002)(66556008)(66476007)(83380400001)(66946007)(66899015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8cLy0urdGVz7ukki2nOTS2PMrRIu69J6qfYs/DxzpeTLcUsV2esORAcsATxK?=
 =?us-ascii?Q?bqvJ/SAccgyGVANNIhnDHhZuvB0R7NqTrGLrnO6UqrUM6Xi7qDV7vWzkKY2m?=
 =?us-ascii?Q?rJZJkjsiH/Y43DENFB9TeVMnXx1JkgIPMCRKHvHfUiyJe63sxMcgjDQKZYbL?=
 =?us-ascii?Q?CGo35FSltHC4V6z3TAVCPefHO7RKzT4OF2fXfchflLIbh16sbBGugpECLyN8?=
 =?us-ascii?Q?NgPXpNRJ6VEQPhN3Buhx8kXqg2UMQkonLAJ9K1QVaqLFSagiWFDmcrfGPSP4?=
 =?us-ascii?Q?5Bwv1OJ98pWEx95Pr6fUZlnpCikYnTEnq41U1YBtj1fk/gRSOC1RIWvDBe7O?=
 =?us-ascii?Q?cxiS+PEYbV9mhzIg3f7mHn49f4jKwqQGfcJh+H66y/kMFuFNP4Oq90edh8SM?=
 =?us-ascii?Q?JAjCh6feBnf043lSQFY/snEs8JYPUzbQQoUsluFCEG7yZn5PpgBIoWIH3ACP?=
 =?us-ascii?Q?AfZRDaPCvz1VB/1t+bvrTGxvoDF9eXZSIKIIhI423Vi143+SwVimtG2I6UW8?=
 =?us-ascii?Q?b6dEYvERs4v12NsHeDISPfbSr3K2auZ4tIbjS94pTKovkCCU/jXkxt+r3wdd?=
 =?us-ascii?Q?Wm/FB07qG5RPzBuQ6fhtcaCj8XbjdH2B876sAmlsnW8SL2SKPqfoFm/EtMP6?=
 =?us-ascii?Q?J1AI96RuoCnooPzO/Z8k9ld6TO03Zu63hwhIf/t2b++uvDt9+ZdcUb+wKScy?=
 =?us-ascii?Q?pQ08pswHYch4XPdKmHL2sS4ZS07y4u3xIxqC9aSHv+nPcRuvJ6MFz3wJdHGu?=
 =?us-ascii?Q?Lqai5ogGMuZZgIi4ZLNdOzQCwsU6Ednpz+IqsAJ8xQoyX2jVJDiTMqjrxRcG?=
 =?us-ascii?Q?5DXx88oVHTKQy3cTTFJTIGVBVzrMjOyIsywLZIa7u1Wc5djc5Kxr6lcQP7Bl?=
 =?us-ascii?Q?bjh+lBnj9wyX4JsU97qIMmvg9KlG8ou2rPAdP2yk/+JlpF88kL+8VYZj7aLU?=
 =?us-ascii?Q?MAMh7BuOMOJEWcfp50XHZx9PG/hmHplTYWbpZX8LBJbIrQ/bPnjGkU749wAM?=
 =?us-ascii?Q?B5iX6LtHANm/91gZi62qrmgns7KXkc7w1UMt/kvJgpoBk6aWuGQod1PXuyyH?=
 =?us-ascii?Q?/4m8KXg/mh3PBlZBeKNZeWpgigykWA7GxDJTdIXqqoZ3k8gtT9J7luDS0ljq?=
 =?us-ascii?Q?+55oiYDb7nVIIsxOxRSCXNM7MXVawoLf/jdGQlRai5Nrbho5s/fbig8kLvD3?=
 =?us-ascii?Q?F4Mw1w544OnSNJcETzdhqr19OmlBUSzLCAqJLpRTPMvqzc4lsUNb/X4I8y17?=
 =?us-ascii?Q?4HXNkSfOFRBM2QCpQSKOhmswpkb44WrcTQ1+/WPrP6CQllF3ZRjPYeBZ9fei?=
 =?us-ascii?Q?TWODH4WA+7v2WTDLPT1mCzUbYPkFFPtzqLVtSlUvr365b3N46TfygB0ytf4Y?=
 =?us-ascii?Q?Rr9+AnZ4g8BDBYkkR5Aq//vf9dgXWPHwx4aQjos5B/Ki8ryTtnn1oV7MW+PI?=
 =?us-ascii?Q?TalZQlYjZSPo61Uf40E5iOGYONn6gWzBacpslFNLAZfbw/hyE8nFSHzTwyeH?=
 =?us-ascii?Q?r21AZSY+PFccv6sgMMR/AJ1zHCtL1EvB2K8MTsTF1l6tNlagT4eGTSjg5g/4?=
 =?us-ascii?Q?XNmQBsKqi7GCQiHGziU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 108a442f-49d0-4985-13dd-08dab307b021
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 01:58:02.7134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNTljnWM100HOpW/naRnCWvI4wMTPdmxLZqlNSLtFSm6K+QZ9ryg6uQP0aWD+NuGc/aMse/ZT4lZqxvydINyQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Nathan Chancellor <nathan@kernel.org>
> Sent: Thursday, October 20, 2022 10:54 AM
> To: Li, Xin3 <xin3.li@intel.com>
> > > > > It might be interesting to turn orphan sections into an error if
> > > > > CONFIG_WERROR is set. Perhaps something like the following (FYI,
> > > > > not even compile tested)?
> > > > >
> > > > > diff --git a/Makefile b/Makefile index
> > > > > 0837445110fc..485f47fc2c07 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -1119,7 +1119,7 @@ endif
> > > > >  # We never want expected sections to be placed heuristically by
> > > > > the # linker. All sections should be explicitly named in the link=
er script.
> > > > >  ifdef CONFIG_LD_ORPHAN_WARN
> > > > > -LDFLAGS_vmlinux +=3D --orphan-handling=3Dwarn
> > > > > +LDFLAGS_vmlinux +=3D --orphan-handling=3D$(if
> > > > > +$(CONFIG_WERROR),error,warn)
> > > > >  endif
> > > >
> > > > Yes, this is much preferred.
> > > >
> > > > > Outright turning the warning into an error with no escape hatch
> > > > > might be too aggressive, as we have had these warnings triggered
> > > > > by new compiler generated sections, such as in commit
> > > > > 848378812e40
> > > ("vmlinux.lds.h:
> > > > > Handle clang's module.{c,d}tor sections"). Unconditionally
> > > > > breaking the build in these situations is unfortunate but the
> > > > > warnings do need to be dealt with so I think having it error by
> > > > > default with the ability to opt-out is probably worth doing. I
> > > > > do not have a strong opinion
> > > though.
> > > >
> > > > Correct; the mandate from Linus (disregarding his addition of
> > > > CONFIG_WERROR for all*config builds), is that we should avoid
> > > > breaking builds. It wrecks bisection, it causes problems across
> > > > compiler versions, etc.
> > > >
> > > > So, yes, only on CONFIG_WERROR=3Dy.
> > >
> > > We would probably want to alter the text of CONFIG_WERROR in some
> > > manner to convey this, perhaps like so:
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig index
> > > a19314933e54..1fc03e4b2af2
> > > 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -165,10 +165,12 @@ config WERROR
> > >  	help
> > >  	  A kernel build should not cause any compiler warnings, and this
> > >  	  enables the '-Werror' (for C) and '-Dwarnings' (for Rust) flags
> > > -	  to enforce that rule by default.
> > > +	  to enforce that rule by default. Certain warnings from other tool=
s
> > > +	  such as the linker may be upgraded to errors with this option as
> > > +	  well.
> > >
> > > -	  However, if you have a new (or very old) compiler with odd and
> > > -	  unusual warnings, or you have some architecture with problems,
> > > +	  However, if you have a new (or very old) compiler or linker with =
odd
> > > +	  and unusual warnings, or you have some architecture with
> > > +problems,
> > >  	  you may need to disable this config option in order to
> > >  	  successfully build the kernel.
> >
> > Thanks a lot for making this crystal clear.
> >
> > Do you want me to continue?  Or maybe it's easier for you to complete i=
t?
>=20
> Sure, I think it is reasonable for you to continue with this as you broug=
ht up the
> idea initially! Feel free to just take those diffs wholesale if they work=
 and stick a
>=20
>     Suggested-by: Nathan Chancellor <nathan@kernel.org>
>=20
> or
>=20
>     Co-developed-by: Nathan Chancellor <nathan@kernel.org>
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>=20
> on the patch if you are so inclined or rework them in a way you see fit, =
I do not
> have a strong opinion.
>=20
> > I will need to find resources to test the patch on other platforms besi=
des x86.
>=20
> In theory, we should have already cleaned up all these warnings when we
> enabled CONFIG_LD_ORPHAN_WARN for all these architectures, so that
> change should be a no-op. More testing is never a bad idea though :)
>=20
> I can throw it into my LLVM testing matrix as well.

Good plan!   My pleasure to continue :)

>=20
> Cheers,
> Nathan
