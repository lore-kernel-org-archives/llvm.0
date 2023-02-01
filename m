Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2133.outbound.protection.outlook.com [40.107.215.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F420E0;
	Wed,  1 Feb 2023 10:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mloVIEBJjsvaIfHTCYFLKJSe6ckXj9Ge5pe5IMsdfDhx4+WY8MvU6634NbnrKpUPW50Dfys/q5V+PHeNsuZLNzPl36raJ63huOp+RBkGyzzb/9nH6eh2ockhhNoTEmwnse+QELlASKx+qm+Z8fL6NRg1cFFfxGeVacDxPQeq/c1pr4NeNnl86Axlxn0HuLWV38NiWzRTI8rct8M+QTIK2dUMHTaWIRJJNB++9uEhwsxtk26TcrweJEMHpLSy/5eeeynuLLIAK4w2LTXbEGlmQLnmXrPL7/riLNId2i6kpwC580tc4l8GtLP+Rv0BRU2DuWEoLh/BgfvsuLbYegtzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Swdk3gCFh++VmXZ+kA7dCKv2B3Gd7hQQ0K2xvsfM4TY=;
 b=FH0XI3c5wxAnprPPhV8rZjOeXeIu+lV9IVqFOQrNj5tASjRfp+dsAORijp+bcj20ehfsA8koe4KtG3zHzolab90UvO26qwro0tuUI4wULcmDS8CpUooW9uDf2s0qafHhveUVtXupTZ1KYqSTC+X7b7xfMJS2eCCdbOCqW1UlWW0jmFBTRFWfeGottNTs0KkH+CTFNKKbYbrEHKhoXCNn30dnwd61YGXm9zahkQworaUVphSV/MHntnD7VXqSU9wWmz0bA08n+dJyGDP6ftMX60Bgh2Ry3U7z2dmAH7675YK7IxHu9ewA+Xb+t+i9CAs+gKon7pXarQMMvvrLv8wlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Swdk3gCFh++VmXZ+kA7dCKv2B3Gd7hQQ0K2xvsfM4TY=;
 b=qQ/6loKNMutw/0SnzNQG5Iq1lQ/uZn6apdfaG5okIZkCOcUQS+YE+90IkvfRe6UPqkI99UYfRBJz6C/19tbXhUs7kyumlx1z0fHfONtt1lk6VTzu9Fkn6FrvhYDImVOgwsii2b4sLHuCBxaz/3JmDXxdGjz8CGujo4dFc3vmVeQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9594.jpnprd01.prod.outlook.com (2603:1096:400:1a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Wed, 1 Feb
 2023 10:54:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 10:54:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [usb:usb-next 35/58] ld.lld: error: undefined symbol:
 rzv2m_usb3drd_reset
Thread-Topic: [usb:usb-next 35/58] ld.lld: error: undefined symbol:
 rzv2m_usb3drd_reset
Thread-Index: AQHZNingBLa+5rpytEq0Zg2mQSPR56656cxw
Date: Wed, 1 Feb 2023 10:54:00 +0000
Message-ID:
 <OS0PR01MB5922AF32F4BCFBA8F53A917F86D19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202302011806.QrzYCatO-lkp@intel.com>
In-Reply-To: <202302011806.QrzYCatO-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9594:EE_
x-ms-office365-filtering-correlation-id: 74f14d09-d6d5-40a0-ce96-08db0442a053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nt5Q4oL+fn45Ml0KouPGEii67cfQjUvTjY4jEwrwNFXmzMlUIZLBV7/s54dUMPG2eREyxB3Opd7/5t95HyGjjw3wKOje8ZiHKR7bsTTPz3l3WqNE5p5fSWBXUoALCf+3uUDmbjEMPoAROImdOlG/OS19c4UOLE6upyh7UezeDte7OliavLjYAwFVR0dypu/j4sxLGd6D8rvrT2XwB4rYSJVPbOn4tE9Pm4vK2FVaKN32OnEA9R8EoKrQooLw0sXwYEhAW5p0wh7tfJGCbtMl+kUK4XsykqLKRaBCbCMooCZX4HS8wBnL1qsjQ0fpwLI+ROq03C675E5dcSrFl/I8+07ULCylczjd6jxQQTqBenG+rzWyJM7W0vXEjKBqTpT4njD49Qh23vYEMAZNwFpYvyM1gCEIMNpE3XQF7PNBgdUPspcVLimAuSBTtYyjjg//Hi5Nu1cB39rUunasQBf3iij+5vRQLTeydEjgaPqYt7DVO0szfFaHEnt3jUFevt/A55glFUkN3jbYU9Nup3suayb/xSIrCSUrRhDBYxa5ZvaROEtS3yBzvXRfqyP9Yag69jkyRx7wSW4eBJllnl5SnhVfPnMDq4cY5mzpiv9G0RfQQZPYHZag4w9TLWAIAqArFf/d5W2u1T60DTeBhdutleO6TfNzbbeGG69j+jVLwKbxA6jcZa9L89p+R5ctSH8t7rBk4OtMEYsf67y/vKgl0LRXwXbsRnRwm8RfXA+BPZ4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(2906002)(5660300002)(122000001)(9686003)(38100700002)(186003)(26005)(54906003)(76116006)(66446008)(6916009)(4326008)(66946007)(52536014)(33656002)(66556008)(66476007)(55016003)(8936002)(64756008)(8676002)(41300700001)(316002)(478600001)(7696005)(45080400002)(86362001)(38070700005)(71200400001)(53546011)(6506007)(966005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qjXSY173cNZMCfN6+/3BSwL61DEUntBMTYG7qOsWNG6OiyDxZPx9phxHM25L?=
 =?us-ascii?Q?wOrg3a22c+JecajtJsz5CFwImSbjJ4v1QIYQvRjZpFWFUF7pWOvvvOgOSLRL?=
 =?us-ascii?Q?uFwHKDLWbquTgOsEgIMSD7r6O/HkzFGu9lC58nmM+tU7JBORDT3r45cGoC/F?=
 =?us-ascii?Q?i6jEMZMWt3Up9AZwog4EyV2aWKTd45za65doqR02P8NyBrPfJbwFJjludwvq?=
 =?us-ascii?Q?ZhSqLt+enqcqsVq+x2ECjCGxS46oSBtgxl5N5X7nqGvX56ScLqamYpr/XeNk?=
 =?us-ascii?Q?MXWztB8sLfAN2+NdbmrDSI0b5mEeAQgGo3YLWMZfQ3wIZmSJZ4RJaRBE2IR/?=
 =?us-ascii?Q?KmVFYZuIEMDsl7JsUkoARNmuOA569ioUWPdPKAewFavQk34uSXsGD3nwRDEX?=
 =?us-ascii?Q?OEP+V7jw2ARDS9V3P4Zg/jGk0Fp05LJvswpfnkbnAPcRY8V/e2D2LKjfTiJR?=
 =?us-ascii?Q?ExAJik6hXEJC8bLza2jAud89WtRfmLWA63q6JaVvE0sdjp/JiWAD/wsr2gRn?=
 =?us-ascii?Q?5lUvLNIbs/2C3QY7nxJ8V0tiQNYuKc+sxbpWtACEW1hgGI7NUVTb8yPsumOx?=
 =?us-ascii?Q?GKyOXqSJbv4evv5RT/sTZwgcmbedNBTB2hB3ewttNTIyEIf6zv950lzFRkZK?=
 =?us-ascii?Q?k74kHi977Mi5E813kgpE+315fGi9p2Gzzmz7GMHA1336PpJxjP6O9P4NC4UC?=
 =?us-ascii?Q?5N5ord+ODFCiBIcOGWdTals2y9ODmL0DnqnzWvJfdiSHMz5ZxUEDxOA+qRmB?=
 =?us-ascii?Q?Y8CNuXLDuSPT137ko3UoPneepx5bRNO5w1uHf6ZAYuW9/EThmTvik1pTARmA?=
 =?us-ascii?Q?AwiHX93RSKDMKVe8fgwD2MPiGj6MYdFysIyly9x0x09R3nREteTJX1OeBEWs?=
 =?us-ascii?Q?/lTnyeMQHSvJSpcT8LvsxvrwY+qXTSTiwPM4cFh9uKCAA68xfOPmOdp/+1KF?=
 =?us-ascii?Q?B+3rPi5BbcUF5t7Jg2E0WerZUIwn/KElA9uVTIa7Na6TwvzNaxaEU5wDRgEr?=
 =?us-ascii?Q?gxQXY4/zZc6V5+591ussS8BgO8geK70kXXbu8ME2scqmkk91xSfgqfIMvgus?=
 =?us-ascii?Q?/cNCD7MKiKI/8JQID3qHkQuxhLr/A+A2kIQ7b1DjmBiAzkP+Ba686UFokVOW?=
 =?us-ascii?Q?y2fjP56fqmnuejzwzPJuxxCjLalxz11iO6Qn1kVVdjM7a/20rdQkICLCJIVR?=
 =?us-ascii?Q?+1wZAorHDYQIR0C7YgmZzclr6W2s8d3LffVP/Yu5gZuPSD3QsOxJB8bPSVSp?=
 =?us-ascii?Q?qUqlAmoOF/CvJOSIxD63OxyX1UX9pYqCFbOQXYNofYV6zXAte4Dx8ueH8XrA?=
 =?us-ascii?Q?VjrrRU7JwNwg9RXeqYbCn/d952VtoHQlQ8q4J7QGaDBQ1UvM2fP3Cra5JQVz?=
 =?us-ascii?Q?kqIkRwPfYqDoJMHCT+X7/nPAheUeDXd57RvZmm+fcnC4/jx+1nsMljIiMSBa?=
 =?us-ascii?Q?5Bvp+zQIENwdCYoFMip2DnXixyCoS7rrT2HfmSvwaL1Cb2zCbtvMVMybML6f?=
 =?us-ascii?Q?p39l6YWal1fiTaDyrhCpsBe+YnoMT/EniU2iG9MfcgkO0H3OmbwfEF1C4vSK?=
 =?us-ascii?Q?5nwTMeeR0l1iiNx2Gus9PLaEQ1rbptW3T1sYmSfopNfB/EPUaw8HxZhvTng7?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f14d09-d6d5-40a0-ce96-08db0442a053
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 10:54:00.6631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/g/vR4F2fchBCcQb8zfVLw+ZDjua9YT/mIz4hqf3MMmZ6UYvQ6RIkberRcBGVWo36/ofhof5sN/DN1HFAnQIKPocuAiYjdaOKrQ0pdSoms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9594

Hi,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Wednesday, February 1, 2023 10:42 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; linux-
> usb@vger.kernel.org; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Subject: [usb:usb-next 35/58] ld.lld: error: undefined symbol:
> rzv2m_usb3drd_reset
> head:   45bf39f8df7f05efb83b302c65ae3b9bc92b7065
> commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/58] xhci: host: Add
> Renesas RZ/V2M SoC support
> config: arm64-randconfig-r015-20230201
> compiler: clang version 16.0.0
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
>         git remote add usb
>         git fetch --no-tags usb usb-next
>         git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Darm64 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> ld.lld: error: undefined symbol: rzv2m_usb3drd_reset
>    >>> referenced by xhci-rzv2m.c
>    >>>               drivers/usb/host/xhci-rzv2m.o:(xhci_rzv2m_init_quirk=
)
> in archive vmlinux.a
>=20
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>    Depends on [n]: USB_SUPPORT [=3Dy] && USB_GADGET [=3Dn] && (ARCH_R9A09=
G011
> [=3Dn] || COMPILE_TEST [=3Dy])
>    Selected by [y]:
>    - USB_XHCI_RZV2M [=3Dy] && USB_SUPPORT [=3Dy] && USB [=3Dy] && USB_XHC=
I_HCD
> [=3Dy] && USB_XHCI_PLATFORM [=3Dy] && (ARCH_R9A09G011 [=3Dn] || COMPILE_T=
EST [=3Dy])

Arnd sent a patch[1] to fix these unmet direct dependencies.

[1] https://lore.kernel.org/linux-usb/OS0PR01MB59227F6D1B7C28E6316A5E3986D0=
9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t

Cheers,
Biju

