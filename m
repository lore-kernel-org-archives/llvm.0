Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B17B
	for <llvm@lists.linux.dev>; Sat, 22 Oct 2022 03:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666409997; x=1697945997;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Db7rVlV2NHxQiAGqOldhUjUanKwyjXD8u0gu7wxomb4=;
  b=Z6ljnfDibsm/7UKPDIsfXzS2GYRNa8LHMiJood2h1ZfCQyECX3IxOATt
   xRMlbycETIFPdo2Fs+KzvSiBd+Zku0Y2kpDwJfQiaNe+5t8g9IeEA5Ddy
   kQqtlGG2V/hOguhi7ZgU9QLq0bz36n+lV9Xtos0DFbBKtE3dFlW1fldGr
   Q9T6EmfOLDVF8XOmox1wYfz/HZBQr/G7S9r6YGgCyfo9OTX/CLE/8vGE9
   8+mrUERJyrULMyPdJ1xvD1x+qx5BQTm+JEbkzOG/SPwJtiZZjyWyX8Vid
   8XOcGkHpYALSDC/ecA56UJl81Paf7foUjm17lNo8eBEhMOCcLBQ8T6FO9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="369218597"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; 
   d="scan'208";a="369218597"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 20:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="608611872"
X-IronPort-AV: E=Sophos;i="5.95,204,1661842800"; 
   d="scan'208";a="608611872"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2022 20:39:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:39:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 20:39:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 20:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUygx9ZyrdpMizrAo5HS1cEi7FRd9vn3Oagld6JoIQa0gtu+LxcSTItesMK9qGBsECq3fBT1i2A5TBCYzX/XRA0UYU/LM0r7/S7PR7lbiUx7xeU+xuHqoYFHr99Bn1YGNcqPN69jJVNA2o7IIZjY4cVIirWMH9q5o3uSOi0j1dSf3DS3FYQDNSmT5IoTk0ulWUrTV3G8Sw/AMp8fp07USTI/p1BmROqvXr3UOKohUQntlXdyk71uUpvCSgLTIDLhrx7lJhZGHnZ5cms4w3w2joZ2qklskIvSvZF+JefnCorcdbbUfjRlYvwpmiCNsTA+Tyg2BjdhTJeXI8kt02xqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay6E2Nukz3HGHdWWDBlPTpyZRMv6xu+4PoI74ft1SSc=;
 b=WDggL8uxIKt/pwAWtCOf9N5L6k5Mr4pwllx0Lw8rHM9JzJUkfbm43stKI8Gwvn3yQFWbRbTVKQIecwJ65Y4IGjrnqk7wk2bnWniYdBRDv/EbK90RM+jUo99Akj+wa44Unk3Ck4j8GEJW2TtxQNWjWWNZUUYG2zOca0aOcmWMeE3nAFX9t286kIi7YNTueFMLf89/y27WGUCHCTEfUWcnM+gx1lLCTUgl1qbCTigkc+5Q15bi412l6XA+6MzFJnF0yJjTm5Gbc42BuRx6r5+przV1BlJruMVeL3fWGdhsch3+ogySsoXQUaMp3W6qmgtLKbu7ijFijQzgRKyNlmELUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 (2603:10b6:405:52::15) by PH0PR11MB5093.namprd11.prod.outlook.com
 (2603:10b6:510:3e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 03:39:51 +0000
Received: from BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::40a1:5197:e1df:bb6c]) by BN6PR1101MB2161.namprd11.prod.outlook.com
 ([fe80::40a1:5197:e1df:bb6c%10]) with mapi id 15.20.5723.035; Sat, 22 Oct
 2022 03:39:50 +0000
From: "Li, Xin3" <xin3.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, H.Peter Anvin <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: upgrade the orphan section warning to a hard link error
Thread-Topic: upgrade the orphan section warning to a hard link error
Thread-Index: AdjhHdAVfgOjlcrPRkiNErPHkbFg3gBODPyAAAJM5YAAANH1AAB3tuigABrjdQAARqDs4A==
Date: Sat, 22 Oct 2022 03:39:50 +0000
Message-ID: <BN6PR1101MB21616DCC665F0C7285DB1DD3A82C9@BN6PR1101MB2161.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: BN6PR1101MB2161:EE_|PH0PR11MB5093:EE_
x-ms-office365-filtering-correlation-id: a99231c0-bec4-4ea0-d3aa-08dab3df12fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 476peuT0EJu4FDxChzpwMDFhY+TBb3NfIlB+ykBhKBTVoAwcMJSjeRQTX3ilRfZKCtdujWXwY5/M48slyQwKbWFE+Rm9KZ68jSsr619ykQd7m6gg0Tazip22WaA5jdPKqjfHLzsLNa4Wto2bRDKRRoFk6Xdb+lEZk1BJRsexyZxBoDZURXD5LkezZXsO03rMBy73rC8P8gGBJqhFSkERTbKfZvkIUShDS3TYjxjjHMNesJhQvr+95S4CzOKv0bRLF9b8fK2nLgv5rXBl45bqHExsD998B1hvyxXuysVi0/6NU7rWp+yuqwtvge6z13y4waAYHqX8YfXhzHKg97uolsVfos4/Dsz6n4MEm4yjjrZkxKvd4xiDr/dVQ8Tb3Z2fecR5mFUmgPmoWN2EteO4uhpr9ENRrnq5Ggiz2/UbSYR3fYKG9Dnt7cklkU77wG650ab0l0uTd4SvsAN+r31XvNp32BhUnsNEeZcl/1mrnaqhjOmmDCRmRm88wZQqTt7aIGJSXHa8z5tuyEB6ki/DBh58ISNW7dvQ5XTy4H74K4Oc/B8Awwtq2qSmD2Bl8dvChBy3r8DBink9TGqALGMr6fIY97e94HXTwveEyOnOUWtxi0ZXy/SsQwv6CjP1s5/TnVfGqDBRFmH0dZGGXSPz9pgX1t1eosbe6g2zYUPZe7Hy5UI9JYxKGVOWv5t1BSOh8wfEPxM25BX8V52H90cQkV4EZkzh9wxhAkVPYywXZUV7NqloeH3yVfRvWYx8Tx7Dg0EMbnK2O2g6y65FmNenDZB1+cjW3QYWrlM8CFkfyPg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1101MB2161.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(82960400001)(38100700002)(966005)(478600001)(186003)(86362001)(76116006)(4326008)(66946007)(83380400001)(66476007)(33656002)(8676002)(64756008)(66556008)(66446008)(54906003)(6916009)(316002)(2906002)(55016003)(38070700005)(71200400001)(122000001)(8936002)(52536014)(5660300002)(9686003)(41300700001)(26005)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d1yHQ1IsP7dxRyzvM/3zK4PIYUEhp6R83YJ2EfJxL0dTnuKP+tJFzMtOVjzm?=
 =?us-ascii?Q?asl1OZlzjQ1HxU1bCqgebYUv8Z5lHbtyQ7qOVG12j5nS5CBsiF1HF6L+KQvc?=
 =?us-ascii?Q?RIM/u6aMowiQon0cRoLDSJneHdQpOe7DqXfJ+vGF7YWDPcD4gCsals8bparz?=
 =?us-ascii?Q?7Z5ShYMbph1c+mBJi7+8IDJTyce5C07xvD0GW6v30tIIuZwReIRzA43YNgAN?=
 =?us-ascii?Q?2ZZhabHXou+J184S/0ZA6RyT3KCwSakNk4KIVVef02gqagCVbJs181v6MihK?=
 =?us-ascii?Q?vpb6CrvmcogJM0nda2VDnc/yaDAoGt07Mo1FW1LsveILhYl9dXWiZfNDK4Ln?=
 =?us-ascii?Q?OUJNTTaTbEOFyLmdMHD3NxCSUWhMO9nVVgCZ+VsJeqHqtDc+xE9DGSR8ul/4?=
 =?us-ascii?Q?Q98iWYHwvOuXxPNxVwa+jfnSuovG8CLUxjGB03aQc4fgy4DXIDENZbM/nGRr?=
 =?us-ascii?Q?eHnbT97HdvkbVOZysmm3Cd6h58JGgF+ZASEFTy9q2wKLPPc57FgwlnfDK959?=
 =?us-ascii?Q?YHQYX6s1aeKJr6Y6sjRq0GBvJFiwDF0P3aeMRoAqx42GsLdsMkvfnn+0RSQ3?=
 =?us-ascii?Q?bzZAv6uBeBsdU8eOT98HMbZMNmgIsDonxjRlXqTaHFyc1DNeKngebYHLjQxH?=
 =?us-ascii?Q?GyiyuhahYoAsxWBVr+xzjXAmFP2SgrhsOHx6hW1LyKOeWcTQHH1S6LDkIbl8?=
 =?us-ascii?Q?FFelRHI4XP/HQcpxq0IbpkhYgqmCPpPgopQdMGn1IgwdBonVwuFiI4u48f5I?=
 =?us-ascii?Q?UJvwXTkVBH/SeZ5/lNpRjQbw6VuLPItzr3N2dA2CZJDrUhg8xifjTQ8Eq6y5?=
 =?us-ascii?Q?wHs55nL/UF0+unCd7H2JwVpadT1XCiN2HSyoCu19avm36mHU8GGq/ZdxNJjv?=
 =?us-ascii?Q?tiwtc6njJ+haUll0vMo4F6rufw+qKuOaE8LA+vVw30G4oz/sTYg2zwloAYTY?=
 =?us-ascii?Q?7BvY7vWRl+ke8qV7LM9kpOjTlhUDuqRlmQt6JkNXAP9keZVGCkrtN5cronfF?=
 =?us-ascii?Q?FU7hXEv5EAZxRoPWd+dypHHKCWcKCWg4nTe+XzsOWlqhlsgy9l4jZ4qmboH/?=
 =?us-ascii?Q?l/n5dkxe570vWQIfD8OX3+kaY0pQncwVE4zQdBWY1l4dU1edzMGKCCQ4V2FF?=
 =?us-ascii?Q?qOnKqsZNIXGRnaODnWhwIVo9IwoGXY/c3KqbZuL4VOI2oCn429rYyZJndygy?=
 =?us-ascii?Q?b65Ujm1CwR04fiLiVYQ2xeo6IQ/blZAySjfokBoCPqQuWuQeL8dZ8KatyZ5I?=
 =?us-ascii?Q?QZdbQ9in9DvkOWtSyUO235YWyolHpBkaaAkI7VwQTbOmj0AA+AaVVqPREcpJ?=
 =?us-ascii?Q?2fbl3RvRL2vhBizpd28Jhk+rj8HG/MI3NXhrmY8DHnzU96surfmFfQamC8Jm?=
 =?us-ascii?Q?T1vYIBYnHxzoGSZMcbvqMWTqPDxHF2/4flyyK5BGpnQG1XS82crM7WNyE63P?=
 =?us-ascii?Q?VuZi6i8NoZAaY4XercgFKx6vGmOfG6+KQFP9Xu/f79fRqmIySGuygVEtLZRg?=
 =?us-ascii?Q?iql7vZMz47JkoABUDnlJt7sBkU/NStZSWYbpK/2gl9vR164mLX3heefWdwzw?=
 =?us-ascii?Q?eqeAnSbxuO4wWtpHO1A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a99231c0-bec4-4ea0-d3aa-08dab3df12fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2022 03:39:50.3384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgQiPe+JFkcbv3tBanE5EhlpANX7slOk71a2xTBBvMF3A3XlyOJj2GLW4evpaVnplnl2EK1fiBs/h+crr8PEGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-OriginatorOrg: intel.com

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

Hi Nathan,

I just sent out the patch
  https://lore.kernel.org/all/20221022030519.9505-2-xin3.li@intel.com/,
It's mostly based on what we have discussed here, please help to review it.

Thanks!
Xin

>=20
> Cheers,
> Nathan
