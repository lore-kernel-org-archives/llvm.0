Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69F7468;
	Tue, 22 Nov 2022 15:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKO0f4xD2FxdGYDf9+kXaQ2PQByXmK9CnRnfkZG7J45a+YXL6n5YKKlH2ABynTffon9RDVEP4pP5EvcZ6ZtEbkLX324qIs99e5SifgXt5HlwBIX09h43EX4FwSkBndP0k6hVz57wOPF3JoqLSc8EJmp6uZIPbdG9pHkw0jbtrh+WMAKMg6dBdQP17n+zZcmQ840T6CFezxcfAAJF9CpMqy8HBPcswSTcjiIRFBYLd37TPyCyCUliNibHdyrmwXEaCwGxdBY/eu+6oS8KfXcaU5Xv+8B6WRtSx7ZJj6ToBQEJlEhiFoZogFYJ/kPpJdkSYG2H2fzBvf6YHsBTB5wUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TcA3nb6AuzCTlDNcIe1Ib4TIzY6RggAaKhAytm6ubQ=;
 b=X7cVBrGBxVfrLJyut5RSHD75rITZCLlxlc89Z9mJuwg4ZsFrhh+q+2cqYe0PUVVQ6gB2zWNUvwBVi6hxKeTmJ3uQmFh2qc/KLKQiAHQtXiyTMervQE8MnlexlpWYUvszmD9v6kMMqrel+fHVDFrNScOEwBQ7t5/iMiFgLCd361ZrY4YNXeT4NjqghUAX7Lkk0Cpi3AAIigmqBibJAkuNxSczfBwGcp9FeX51tyJ79Fe7WrYFQEU2YyLuZj5JK+wy1EDDeQO7gkq3UIq1MVoG8ZzBa09/HMkQBRlT11PBIonFyMumdMwOgd/9oVOR9xFCKgJ4SQxV+Js0swtGho1gBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TcA3nb6AuzCTlDNcIe1Ib4TIzY6RggAaKhAytm6ubQ=;
 b=QwxE6B152BYnRo36WN/n/vJPbELriNmokdwd5UUymfzltZN7UqRmmjViL5yY8atpqxxwn50yc4VAEQ0UXMWpFMCg4uxOLuFj8nRenA3SZp+CtnPAyXsu3byWhIkdVnN6u2SvIBFH1NccWLQvsid+90hKoGKuW1uiRL6O7AfmKX8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9987.jpnprd01.prod.outlook.com (2603:1096:400:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:17:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:17:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Linux Memory
 Management List <linux-mm@kvack.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [linux-next:master 5636/9540] ld.lld: error: undefined symbol:
 drm_of_get_data_lanes_count_ep
Thread-Topic: [linux-next:master 5636/9540] ld.lld: error: undefined symbol:
 drm_of_get_data_lanes_count_ep
Thread-Index: AQHY/na3KLfEYVdzLkqNRabEqSQ13a5LDIog
Date: Tue, 22 Nov 2022 15:17:15 +0000
Message-ID:
 <OS0PR01MB59222B2AADF54D1E41D81897860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202211222131.H2kT55xh-lkp@intel.com>
In-Reply-To: <202211222131.H2kT55xh-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9987:EE_
x-ms-office365-filtering-correlation-id: 87276a57-11dd-4b20-0dfe-08dacc9ca338
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EXm9O9THHkaAabaLCU1gvfJ885gfDx2MhKjlVpcMErmor6tf6fU1036asOpG/I7UUnF23CAGMhDUk+FyDBmT+CWQUz4MWqx1uQjfHOnlqrxjyWZv91a4CM3VWRxgcAVN/gPrrsZ1zzSkZYgRBhKqwX93GsGwIxO6TIdYE9ZmVZBxK8R4yhYd2KoCgZu6ekAoyKPIirvdV16+rOauw3ID8UNqLRLGxmUvuCPn3qz+i4JzNnIxH70HK+tHsCcE/9MLnHgSeU59LEo8gpb/32E6M4ujdzu4ZnC3fxAdS5M97ltFmur3ChDUXZL6Ix7TipbfpEuivrgP3SCxXjWoAw6E3MgBH3MsvghCW15rmvjljcsyPTYEL0P/sYXl5QoCumqxDKD5DMniMZi6d3HU6Rf1N3QFAXvXcrQdoMN+aliWbn+dFRoHS82T0K8wakU84uPZlMzSJ9iBOgkKJ3iryCAaH/iFQssHsys3GuWAlfp8/2M10R0/w5qoQi5Du6b92WBUoJrDwtVJMqsB3QztNyX7YK4Kgewhfw7+EaF3ZjJzL/D9NOyoA8TOrcIfk92CWzLh+hgVNQmASBtCZmY+LNqdVrJyhstKO6fpHSKF/xdQudN1F5dJ5RiAA+0pme7s2CLqCfoMjhzzq0/BSwtNcyfQHaBHy8x3a9rKrSXRD6bBEc6plYkHjCEgK8i2dn4k+NFEC81tJc39hjT1p22nertCgEAbZInwz6gv+K+e0Xcp5ig=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(122000001)(86362001)(41300700001)(38100700002)(66476007)(38070700005)(2906002)(52536014)(6916009)(478600001)(8936002)(5660300002)(55016003)(7696005)(6506007)(4326008)(76116006)(66446008)(9686003)(66556008)(66946007)(8676002)(316002)(54906003)(186003)(26005)(966005)(71200400001)(64756008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UzwtvTOBUxNNC+nuAZI8zimYCdYIA0iFV41n5DDn2SnD61CinoqU33HmWg38?=
 =?us-ascii?Q?vcrw4yJAk2zGGUmC7/qyKOOvEbvAeMimt82+vMAw3FcsJ+Rhb12xwsVS2+Of?=
 =?us-ascii?Q?6qoGsWf4c5/k9tRX+9sX+nnZ2m81YQ4RY4WsHoUmRuxS6A2pBqPXBVzZtvTi?=
 =?us-ascii?Q?qn5vh7els+KgQY06LaLEwgMw25TR7TMHBKXAXbMFG2frZQzxCpQewLihpXdd?=
 =?us-ascii?Q?5zO8bb2wZAoo/1WA4jZ3WMVLdmUF2wkRG9zt3as0zxLcSSPqrLOfyhHJONAF?=
 =?us-ascii?Q?+PCxzuWyB+H6CHHZxX1IsKtOHIwRiyRYM0x1dfMyny/pziIRWJonechCAxsO?=
 =?us-ascii?Q?AIAx0Kc1uLZ8EUVAPapXaknMsunVWygXS8JMf6dAdViIly4v8Jnfgj34+Lzp?=
 =?us-ascii?Q?tgPS/K0/RsB6n1wooTdsVxo0GJzDzS8AcK1V3cRfLvqd9UrYcvdovwDR30bd?=
 =?us-ascii?Q?YsgSdM4fBchDLo2BkX3YnwGV0MMTBdS1guKds+i/l6S30QJRhH2UiPqKyzWT?=
 =?us-ascii?Q?CCysImWqC5lRX36COHYj5Bw2fOLqtzenRm0hzAueFRYcfEsIFeg2NqfsdPqH?=
 =?us-ascii?Q?UoDMXXMGbb89UlCOZuGfNm4H7Xu3sxLDzCtRlU4XqJdmz9vum6uaXzpUHVbz?=
 =?us-ascii?Q?Gzw6CcOJ+Lmwsv6q3UY+bbkiNWOXtUJLXH9zwYV4u6TpVUBZPTYW54+RjCxk?=
 =?us-ascii?Q?98lixMk6nzrwyIHvbJRvXNltrC8PgPcpWQpVseGAdS3jFZtKoqz4dMNZMbfK?=
 =?us-ascii?Q?ebSGaA3Fx2iuCv1VadvE1V2/u4IEnVwsGne247SKo7+HFPa7Tzx4TdyKmILX?=
 =?us-ascii?Q?pYG73uAQZp0OAKlYy4+y/adimArxorL7Q9r/iMsmhRTBVmTHaKMUkkSXIOjI?=
 =?us-ascii?Q?ehjb6xVmDKb8/6CnBMgjYHzVa8OJ2212YxvfvanLF6Xna4iTmnwLCCR9zGbR?=
 =?us-ascii?Q?iVg916tvxH2/crAfsXidaW7DAmswvsiy1QCyTrHOeNMN+0ubiNd2TbUs1r9e?=
 =?us-ascii?Q?eis3jfpRjcw/gaDcX8d+245ufHKYkob5sdO8JiT+EZDjzj8pm9jdoMoKVZbm?=
 =?us-ascii?Q?t8BVJhrxhEke4pkyq/XgWPQUi8MtfuDTzhntYJuTfRkjfzaSW4rYewrEfjqM?=
 =?us-ascii?Q?e6ZuZv93Bzkn5Zi/rud6g/3M+3Zga85Jy5kOX4qAZFvQhGQ8mT5H+4hQHgs5?=
 =?us-ascii?Q?i4270yxk0/AzzHPx2MjBiy1/RpgAz9GIg28OH0q51b/yatpf6H4dQE1oX2nJ?=
 =?us-ascii?Q?sQEqAy0A2wo/+n3332WLdoZzxRWHFWeHmR9lgwHuPmoHkC8X2Dl24mH/ROiY?=
 =?us-ascii?Q?jjH4LwAEkW9WxDM9xXtetoEWiZe48T7eIbKoGr5ZHfrV4Mx4WjJWSyQSuWM9?=
 =?us-ascii?Q?ixPw7dLFDgTOuEG4y4iccyHIpNxiaHq/eAlmrFW9xiNJPkxUOpsI5lYXm3iA?=
 =?us-ascii?Q?9OqlOVmJAnzuJCxt2NuVy6fsBx97yeRTHByCGHzEMb065Ob5m/cUeYFyFW26?=
 =?us-ascii?Q?e2yo6h5cuKGcjcWYPZ1cl4oxhO86vI0ZT21tTnK9S0lozjLUHwBYi3GPXUfT?=
 =?us-ascii?Q?Ai1kuZDIR4u+tRWfhwOxfcaeGT6XSeqWZ7Y0G1kXhFQ8GULRvTy+xjvWWSnX?=
 =?us-ascii?Q?Og=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87276a57-11dd-4b20-0dfe-08dacc9ca338
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 15:17:15.1358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lc7B2y0SxLM/dHwVS4jg1mKNaiZJNHc/l6HsiZb7x7WzECUyjOl1v4W1My8kGdTcTmGZPPipmVJccLaEKfz4PPAoWsk/0d/E8gMkXHKbzIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9987

Hi kernel test robot,

> Subject: [linux-next:master 5636/9540] ld.lld: error: undefined symbol:
> drm_of_get_data_lanes_count_ep
>=20
> tree:
>=20
> head:   771a207d1ee9f38da8c0cee1412228f18b900bac
> commit: 7a043f978ed1433bddb088a732e9bb91501ebd76 [5636/9540] drm: rcar-
> du: Add RZ/G2L DSI driver
> config: arm64-randconfig-r026-20221122
> compiler: clang version 16.0.0
> reproduce (this is a W=3D1 build):
>         wget
-O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
>         git remote add linux-next
>         git fetch --no-tags linux-next master
>         git checkout 7a043f978ed1433bddb088a732e9bb91501ebd76
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> ld.lld: error: undefined symbol: drm_of_get_data_lanes_count_ep
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_probe) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_bridge_attach
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_attach) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol:
> drm_atomic_get_new_connector_for_encoder
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_atomic_enable) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: devm_drm_of_get_bridge
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_attach) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_bridge_add
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_attach) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_bridge_remove
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_host_detach) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol:
> drm_atomic_helper_bridge_duplicate_state
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol:
> drm_atomic_helper_bridge_destroy_state
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_atomic_helper_bridge_reset
>    >>> referenced by rzg2l_mipi_dsi.c
>    >>>               drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(rzg2l_mipi_dsi_bridge_ops) in archive vmlinux.a

I was able to reproduce the issue and the same fix[1], will fix the issue
here for clang compiler as well. Can you please apply [1] to avoid
repeatedly sending the same issue for different compilers on the kernel tes=
t robot?

[1] https://lore.kernel.org/linux-renesas-soc/Y3wVLU01mHp2zozI@pendragon.id=
easonboard.com/T/#t

Cheers,
Biju
