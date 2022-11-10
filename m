Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097C2364;
	Thu, 10 Nov 2022 00:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCY5MwT/QISiByEq//9CMAQdb3y5FYQoFOAWR6rmJqlUCf5yZJMlFWy4izAiLLyxgiLLJiRzsa1p7ASaiGsYlqPj1Ew4IColc3mQYKiiK8foa8C3g5XTG61u+fgfLVme8QuZIl/BuIG3SNJPysa8mDMwwXN+xoztcLU9dAIvDiqth6ZOPrJQ9zeEmmefw5t2cnnelfN51a4qxo1Z12lRF77e3u4Y43I7pSzgW3MOzq2ufbQD12t94QSzd6s4N0rCJ6Fd45mvh8ffurIUWKcRaoZQlB10cRInXwX7nhm4i4NMi+7A7f2X/d/7KDIoPm65G14Wpvj1pXsR/iP7VS3jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKDj6HKyczSB7tR6J7jELHFKu/0rYNM/IpTZJn2SVus=;
 b=PVLlIkzM+NzirxDYytlVqX5eLbMY8CLOXvy7uMDbRE6KUUQhzl/WUuqvZVEfNakZ/NrKFqusn4HqWJIHiwilio2AfhRW2GNEyRzS7WkLp8UL+FrAsujMx/y39W54jMdhjS4rlnrbql46NKSdwGKBYze5/Vp3ewyWyDs4Rc7LrGQHItAzZbDucoUIkh+IwbnLmAiX6a/qL4rm4dgqDl/LL4BpIcL7jEJcL083vUerwDIyaOrpV21RZFa+ZLyLUPprGEbL2MC2h6Mtj2bJjGbRPh0MkZukOVhyUxPqKoTE7RfXSb1V2OnogIbDUKq5fJDqDSJz4Dn1ZNjixjUeVQBMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKDj6HKyczSB7tR6J7jELHFKu/0rYNM/IpTZJn2SVus=;
 b=DRNe6DXsyjQRvOKAogMVydNo3IQC/vFO0foUoL1bXFHLPaGpc+ZFUsBWDCHy1n2jBFEPmrJTlqkRxYbnmqelvbofLK7+CEhQThkzhdhSwzKFiAppne8MM2SDYWajj9vsNt/AlGguAdWU6GhlpEW4a38Eg1QgPCdLthhvFgA0fRk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB7801.jpnprd01.prod.outlook.com
 (2603:1096:604:17b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 00:53:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 00:53:04 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: RE: [linux-next:master 4222/6614] rswitch.c:undefined reference to
 `ptp_clock_index'
Thread-Topic: [linux-next:master 4222/6614] rswitch.c:undefined reference to
 `ptp_clock_index'
Thread-Index: AQHY9EalS6oNTt+rH0qn/ZWE/JNRR642yYYAgACLM/A=
Date: Thu, 10 Nov 2022 00:53:04 +0000
Message-ID:
 <TYBPR01MB5341B9171A808C9C23EC63E7D8019@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <202211092229.qTe1ff7F-lkp@intel.com>
 <aea446bf-0f06-4636-9ebc-acc2bdc0c30e@app.fastmail.com>
In-Reply-To: <aea446bf-0f06-4636-9ebc-acc2bdc0c30e@app.fastmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB7801:EE_
x-ms-office365-filtering-correlation-id: d1da3a44-d8d7-482c-bd71-08dac2b5ed13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 adKoZ9pDq1KdWkEeEhAIzd6dZ3TqtZG9H4xF6aTqIwmQemRPNRWuruvPH/aPAYVRKKY5ASd4WQBqj84ktZ7YcKbkKMPsjC3GVl5oO5/dqAi80vRvIu9MeJ9h9KdU7TiFkKOckQstvHKleCHvd7zNITvWUM6WmSqU/Zad+LaHbSvZ+NaHtr6lKqRj1WL643ynn5vSr/s89TPrp7vxVg5oP9zJtLfseC/iJ8L3TffrwIO5araVDeXkvD7IQ7blKsfZ9iahPllkfCH7nG0GdKQc3+JTeL4h4zqJ+xNuQNJoeRbrkvH9+Hn0QYUZAdwDjOvqjb8b91Y57hJrOl3ypV6lISG0dzcLWsrKIr+F0RyZc5tVz+MSSbX3CWKkKhv5r1Dgc1QBEwharTRRkL6MnIJujtxjmUQQKOLxT7MPEYg8G9iU9N3giiys6S/RSIjC+/XbFbnQzXRtJMA6bnHfjocviXk7IxHWi6qLJSKtkF5sJ64rwiToplcNuwjtxoPHFWOZqhHaYFtKKPenXLCH/OjL2u2u3vbZSQ7ZKrNXULcPq2ZHYv8vI6uisRH9bpWmqflZzxQHQ0PdVIaIwgKnAoALv2bq84mkbn2iSpiSwSh8lu3XXUIkqeZkfbAzs+Q0F/4hKfMg+3dUjnvJ5VNR0dPBg90Em7wVTiZYbIzPQ/xo5yo7yK2on2TIdiQGofKh/s+UHgI7sOk4olhZIKFN9ZM6JXry9huFlPNk5l1YQYxLfU0UjXIQvs8vHq2oQpw1Z8YklXxIs67sB3b5sV2eO48q4g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(71200400001)(86362001)(478600001)(7696005)(66446008)(66946007)(6506007)(66556008)(64756008)(4326008)(316002)(52536014)(5660300002)(66476007)(54906003)(186003)(33656002)(9686003)(8936002)(110136005)(41300700001)(76116006)(2906002)(55016003)(8676002)(38070700005)(38100700002)(122000001)(83380400001)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oOMQg1Vu8ikRrfZ5R5COdehdrcdWRoMGpI0FgQ+q9d0kh9pTl8wN3+spUOet?=
 =?us-ascii?Q?5ISf96REI8Hai5tAMrryR+a3hMs2bxUnI1PoTFdxE/RMtYMCT1TsFf4E3CGj?=
 =?us-ascii?Q?Vqr+MkIULIJKvLazT6vlJ94uDSnOV+jRhg/ogMCY0nshDUnvUK67t6Qs6HVD?=
 =?us-ascii?Q?YlPkYjRtgqEK2XC4zebmhSA1/iP3K5LeI4WybL8eW/Yffwc9iIaJno5/4mAN?=
 =?us-ascii?Q?LADoRKF9d0PFTjJ7YhywWiP5mOI7Mk+FRXAPyXGHhQenDeWTDhKi0QRs8mHh?=
 =?us-ascii?Q?mrxmQTcUaD9QBEoXAqd/u7Ppf12jmHXcyyS94mP+nlM0y13eqv3sM0tVPbfU?=
 =?us-ascii?Q?lGB9uYFRfEIzX0J/1esRmTBZySxSwGNBsknsRqjaP1IQqcUCxkS+t34dNZlW?=
 =?us-ascii?Q?qKXIRt/vVHMW1pTLAGmMHNSViMKP2BcprqS6U2USxBzG7Mz7TYpS+Eti63qJ?=
 =?us-ascii?Q?jKqUMNC2YHjli4VR9jsxMF2nNxn3XNJLQ/PPLY+FzxuXGS2EpSet0lziBneq?=
 =?us-ascii?Q?N1xfQdM1RMCe18q4XDbdCASwjzi8uLfV3UqzqO8EZuMMpwOAy71gAob4jpUm?=
 =?us-ascii?Q?IMSMvBbTm9jdlKV44IKVjH92I3vPt5kQpRFb37EY6LeHmaagoccJNe6yw8ik?=
 =?us-ascii?Q?YQIAfC5zM0cNhx4kw5YoSk3PhsOwD+4L/WJp6enidNdg3qYjMNFKijW3jOTO?=
 =?us-ascii?Q?7ggJTD//qXL+IIzAIBmu2qB9SfplmkLZoQgEbeGwIOd8Y3eQWGrx08llLnQf?=
 =?us-ascii?Q?9TG7zgepRPHCpC7wFrCdc+RnU2UrLbxEqi/23aJJBQlvY/QtleyOCdNEnTVV?=
 =?us-ascii?Q?818EDkTo1PA3idwkYNiJCvQRpKQUoWtrhGTLtDuPjRNWYCgWKdz1jseRxKTt?=
 =?us-ascii?Q?sOsKW/KGJJJVVEUsXTnNCmletSsx6BwMmM0TSRjfX5kYY0iKEa3OQApTiMKu?=
 =?us-ascii?Q?noBNEo+3OLn+IvYCjiUdCEWcAOfz85DWHzByybkV+G+a80Z6iGI5YMAqvjU1?=
 =?us-ascii?Q?hDjo/haXEXvLiurmzIPamoMTpvJClABp8r84D6va8PJk5zbu9JxMOu44+kEH?=
 =?us-ascii?Q?pUzhw8D3N723dMgh+vvGG3CsjKUJG/CdI9Z/XWtPAx/v9BuIWHPRir4tQEi8?=
 =?us-ascii?Q?Ikib2oAmLAk3ac+qIYZ9E6Z1Rd7CDnF5UXx6K9+Ee3clUoiXEEFvunvaXCe0?=
 =?us-ascii?Q?wug0y/afMbxCARsgZftDMDzHZ9wrXv2xqmMO7y70hgS/MaVuGhD8s1Xpe1sW?=
 =?us-ascii?Q?ayxZ49/UFBJloXGZzuvgoji1OtpTSzdt5Vem0XfWUO7u59cxl+n6Ed2YRKF3?=
 =?us-ascii?Q?3HZUc3+TmB8CTZtq/Qdu+BgaOJo/ryXwytwiJalAlGJklcgav/MuMd2YniRz?=
 =?us-ascii?Q?Uc3oWTNZ+dWIGX3vCTB0tz3IujJN1Hxao2J4bhs5SZEMWXDqpAHtWcWs4X+i?=
 =?us-ascii?Q?/HXJTH4rmS1+b5/J+sFGgcu/T+Zkm8l4fHBSTnXtLg3/lTBi2T7eVnu3ngqt?=
 =?us-ascii?Q?5fiHuDRK2VmiyUJ4n6iOpOM1SJC7tLYEA9oBf5T+1w7UUxkdkNNaYyNoDMTw?=
 =?us-ascii?Q?jMtJ8sSrnrQEqgif8YPazpa06ASLHC7n8BmrAtz3ZG82jIlyX8mgys0m+491?=
 =?us-ascii?Q?fNpnqlrBiMQBRCJC5280gqqOwoywyy9B1g5EUWg0VNODWrWodgYG7in7WbAe?=
 =?us-ascii?Q?GkKUCg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1da3a44-d8d7-482c-bd71-08dac2b5ed13
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 00:53:04.8397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZGyB0Jr7NuLF5i8/ZZsgoJVx8wCDxwToOkasJlsM36YHMWxB38JYeB4sUuyza5b9ej0s9zupV9+ML1OE60fJdnrt2kOrwBHk0NRNg4wgUz1gilNakQc2tJfhllrITGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7801

Hi Arnd,

> From: Arnd Bergmann, Sent: Thursday, November 10, 2022 1:34 AM
>=20
> On Wed, Nov 9, 2022, at 15:21, kernel test robot wrote:
> > tree:
> >
> > master
> ):
> >
> >    s390x-linux-ld: DWARF error: could not find abbrev number 4453
> >    drivers/net/ethernet/renesas/rswitch.o: in function `rswitch_get_ts_=
info':
> >>> rswitch.c:(.text+0x2a28): undefined reference to `ptp_clock_index'
> >    s390x-linux-ld: DWARF error: could not find abbrev number 11
> >    drivers/net/ethernet/renesas/rcar_gen4_ptp.o: in function
> > `rcar_gen4_ptp_register':
> >>> rcar_gen4_ptp.c:(.text+0xd6): undefined reference to `ptp_clock_regis=
ter'
> >    s390x-linux-ld: drivers/net/ethernet/renesas/rcar_gen4_ptp.o: in
> > function `rcar_gen4_ptp_unregister':
> >>> rcar_gen4_ptp.c:(.text+0x198): undefined reference to `ptp_clock_unre=
gister'
>=20
> This usually means the driver needs an extra Kconfig dependency:
>=20
>        depends on PTP_1588_CLOCK_OPTIONAL

Thank you for your comment. I'll send a patch to fix the issue.

Best regards,
Yoshihiro Shimoda

