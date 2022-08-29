Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E17360
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 00:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661733179; x=1693269179;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=azw/y9HVQrwcs+80xHu9Bgz7nmP2rANGCVCuSGgNfa0=;
  b=Ws8YQElGtb7q3h6nQlY1Zw3UTZOU12Ey0XbGPxY/vltapbp7pS3lJd2b
   fWe0lLQyGEFyGk15NTO9S8uHFJm0LRAn0DUro3TQJQpGLRXQ5KkfOxamK
   KSMj7EN5it+0zyOKQ5ARt9xnRQzHGOds0TGxNolWQzc7BSmgqc0QtmpfY
   mwdOn4mFzEtrlc1JGsLRnUg7sotIYU6RcHGuilKWpJoM11U0cJn9dvJhq
   DT2PrQNg0MlnQFA2em2onb6HmeAmlo/GZd5Haz5eQcxbEAZxMhtbCatD2
   NAGu1axnPu03Gtc7ROqZ/6Y0s4XKq7G6OGO/1GO3bHPCwMPeLSLAoLQfr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="381084586"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="381084586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 17:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="562033237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2022 17:32:57 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 28 Aug 2022 17:32:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 28 Aug 2022 17:32:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 28 Aug 2022 17:32:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwTgDUuA7Qe1nUiChzkhAYg6ZWJYefU0A6OFxbYOXy5MhYgedkUyTlHbQQUb1fcubSXGqJYfNnzEmy+Ns6zFkxuWEXznA5IzFWbZxSzEoVGdIrY4kUx1V6k3ztY8hRMwC8NAruO6gDo6mW97MuYgjoKrdNvDNExXCHQSQzIKdvCaCvYoKdCiUWBN86cuO/L5ZLvvjWwLpH0jqehM1feR5gSDQAlMy76zW1Mkbtwegu5DSiHwDGkMvj5S/AH5xVQb9WoecOa6ed9BbKsSrK6QBuybXr0UclaJqW7XZtCuQ1kYspNKkncmWCqTalXZ0cKBaF04hcRhfyyP57i0F6t+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knZq6o/YDROQjA/BjEUqb/0P2lNYegPpWws+Em5d7Uo=;
 b=lNkSc7FZ2DssCJ5qr2H38Al3MB4AbTqlRI8r7EFtIY2l8dCeaQY87RMUVXkApTWbw17hUo/p7SqbOo4RK4waO0F5c1FBkh8x0MxfUAsZM/TI7SL8MTMVevpEsbkO3iyKWCZ8ie3+UXdYkbWhwFxbLs5ljRuVUQYp1Xu0hrIJ8j8xp3XmARM3TcEH7Kfv+uZcQtJCEI6Hsip0/E/Y4eZ/7+3sScBVKlPGVqDge/2aM6lem1yitKzTQnhjpLlU3V1Nwle0F83Ezs9lO5c028dHoV0uYeJhfLYgwKsVxrur/iqh7cv4J5nFWlMWseqLHQVM9mPWc34j3pQ8lwWuj8Q36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 00:32:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 00:32:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
	<alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: RE: [PATCH 3/8] vfio-pci: Re-indent what was vfio_pci_core_ioctl()
Thread-Topic: [PATCH 3/8] vfio-pci: Re-indent what was vfio_pci_core_ioctl()
Thread-Index: AQHYslOh0JacNVJDzki1EaVIZgMKsq3FGPdA
Date: Mon, 29 Aug 2022 00:32:55 +0000
Message-ID: <BN9PR11MB527603E7F4A2F0B77D5EB1BD8C769@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
 <3-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
In-Reply-To: <3-v1-11d8272dc65a+4bd-vfio_ioctl_split_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0b4f09f-de82-4828-ae0f-08da895603fc
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gjeqvMoJb5wvg1uO27RjL0Nno5y9zlkUPqc0OxYj1Kbp/jKdYDZzOpncU27dDS4BNVWUR3wpV54TvaP1gGMic1Q+pdAAKotOpnTilc8TMaZibSnYrAOvJxhWIzoZSnLJEfLMS4ryQHqfjCluTdOWMkLZz8vLT8lNNiytyRki+O16+JE9BifK9rTRw+cBtFyqjFwQwFaLMKHXX/WiwuEri1xGdf310J0hcX/nrnQfK8VeuHadM5uH9NVKGLFo3QuWa0qG8N5k9ga0ebxjCwCHYUj7GIVIYh/Nvqv6shvExADSlQfHRyyvTax6mu6YAuJEUUw6a74kM67YvyspZg82JlN9SSpFYAk64c2Qcd2y06lsxJO/ViNDUi3Ki4u3i7B6ycEM/F1ltal0UoIj5jBo8lMtcfOQhjFPBxzXlOkRKBGpUjbsu0q5yIO+MsXI6a2qIJgliGd+Y653X4KVOyaF001jgRtzURba3mdaJyv36ZOQACwmPpBaYwhBMdJ3mi2JRR3gH0kWw7Qp68e5D+1OJyQUwzQ5GxMQfTQ9wYejwzn/r2rmgLIg6Npr9hiqHBGhRUTrkUe0sE9ALk/3iOnzXK+FQ5pd7eLvJOgisZn0MQJYX87TpXU7JXVXUro3qwosOUYb5vxRM0uPG5muitb2n2GRmX3M+UDhwtXwdLr+bPd+G88zUz94pnyHHYEqtxKvhxAEURcKR/pPlXoHDENb/b9zvKVq9P069m2CmA0M0ph/i3OxOw+oLXgLpya4mVT5bfHNRlehpw2NC0rLNcIyIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(366004)(376002)(346002)(8676002)(110136005)(66946007)(66556008)(66476007)(66446008)(64756008)(71200400001)(316002)(76116006)(38070700005)(8936002)(86362001)(5660300002)(478600001)(52536014)(41300700001)(82960400001)(4744005)(7696005)(122000001)(6506007)(9686003)(2906002)(38100700002)(26005)(55016003)(186003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?well9fK0AmeIhtByGdcqcI1xL3paomjXOYfhSefkzBsddLLb/GWgjMdcURvL?=
 =?us-ascii?Q?RWMJpLcp+MbxdJ+YaC2+r/aRq6yNSh4pgIVEvpFsLa3siT8MDVn1yU2TjqFO?=
 =?us-ascii?Q?gdEmr6zkwEwKFhf3TMOJBax5PTtUPoVFH8FNpaHHHLrqMsAU50pJauAdcLGr?=
 =?us-ascii?Q?4x0YZJOiIyoxtyDRKT/qIpf5bkvtczya14xAEmrtF6WiiZsNzw75xTXImZn8?=
 =?us-ascii?Q?M0FYU8FytTqhHoI9tmesHusOdWX1w1OJKSSRBqSWLF+8gtr4NqxHx0MPOhGj?=
 =?us-ascii?Q?K7MwGBHvtLBX8iAoYla+5AOtAKKYd9t4MD7QjMoOvHNSs0dZsYrvKlJFvLW5?=
 =?us-ascii?Q?FoY45Rpb8/NAllmHC81/ieMb0gStJLcdy7SoXb3H+VINLCqLX/ZmgtCqum3O?=
 =?us-ascii?Q?IjkTND9aydz10t/a+7yY1QEMnUd4djkHBd08zfeQyvG74FDLLQjFedGKmHbY?=
 =?us-ascii?Q?7hk4E2E2D+CandVOdVzUukXAYmU24tVVp78MBxw87DI44rItxoBKYOw9ycrY?=
 =?us-ascii?Q?cDlRYb2x5rYI8f/krIfjTLpT4gQ1XGjg2AoqA5DS9QURDctXvzP5aQ0de4dG?=
 =?us-ascii?Q?Tz/KztTnUef4eKhvcOTPVxCEs4MB2RBLWttyb2ZasQ7PiudRVuVx0BH0aWub?=
 =?us-ascii?Q?2INZcXc7BL7ka9epOzur+YlknfXXjLU+dVTbWzIiabkkHD9JwAAMm11GMv0N?=
 =?us-ascii?Q?4giB8jZuD6B01ICFaRx1cQ+DxTZcJNt6Pti9ikVIEQL3UmkjtAqFWx+oEj5k?=
 =?us-ascii?Q?vWEulcSgIfPYB6BSDMIV+MfRS+bOuSHRrZbC2KNf13iR/Tf1QdjmwsQ5gufI?=
 =?us-ascii?Q?m6JGanGLk4HiHs4Ayeqm9r38wrV8jsBRaS3cc11PRvVmw6mpW5dVk+7J7HcO?=
 =?us-ascii?Q?Kn/YwH4mA15L5nkyK+SxnvSXMsLKv6+exRSIHQtBIMyh2vyLsCNmcEQTSVrX?=
 =?us-ascii?Q?itysLzEaXZbk3sVDZrwQ10UZ+mfOM5hovygu54ELn1YLAX3CUl5E7wq34986?=
 =?us-ascii?Q?14JoWc9Wa+NVdR8CbH0gTS88ynGworPyj5zJTYH9nCssol5gr3K2hBOT/e4e?=
 =?us-ascii?Q?B6t0chpKi4wYZV2J9B/BZ7Sy9EC9y4+gv77bqPQ0ADpmPy471SFshwVohZpo?=
 =?us-ascii?Q?FLy1PqcBja5mQeznY7z09nVlYCoSCZ8h6cLuDD9mm8kP0pGMgh9qztk7I4ok?=
 =?us-ascii?Q?x+WGx88DhEaCyCSVyJokfj5N5b0UYcQvngIYrFbTewQNMBpqOKRzfA/0S51i?=
 =?us-ascii?Q?ufpHlfx3OVmAInlgughnRKRbG7vHjkccSsnhw0ZRN0gorLN89QgeisMQ2WAk?=
 =?us-ascii?Q?8xG+I/rTN6M7xxMFBge8zLGQN30qQ09OmZcReGcLQL1f7OfNZ+fu0R8Dxd6R?=
 =?us-ascii?Q?bisqNmw43VEdzhN5Hm2rsABYyiOhMYfWjWJ0o5wSsHc99Xfn2C8fgto2FUOs?=
 =?us-ascii?Q?xXQFroRxenWfeoOrZu4w604Cgj2+L+ZH3qT+vSi8MaE9GsyCO9FpksMD+hEs?=
 =?us-ascii?Q?LMg+i6tzM3WAV3j4MWfjTe9Mu/mtwk+RxtqdRTBGinDiIJtwMyVbs7O7jIug?=
 =?us-ascii?Q?Zr/7HTvJrEGUYS1oRNf7XxlP+YZwN4us3IPrcnBE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b4f09f-de82-4828-ae0f-08da895603fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 00:32:55.2805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/JbG2DNMHLOfOTH97jsiNBL8fEczK6Gf2CB+Fl2oBg/aCUNXAVPe0vnT9+9siI/ElPINSvVSe6ABENgd0Qnlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
X-OriginatorOrg: intel.com

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, August 18, 2022 12:07 AM
>=20
> Done mechanically with:
>=20
>  $ git clang-format-14 -i --lines 675:1210 drivers/vfio/pci/vfio_pci_core=
.c
>=20
> And manually reflow the multi-line comments clang-format doesn't fix.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Signed-off-by: Kevin Tian <kevin.tian@intel.com>
