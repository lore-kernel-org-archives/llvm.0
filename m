Received: from DM6FTOPR00CU001.outbound.protection.outlook.com (mail-centralusazon11020026.outbound.protection.outlook.com [52.101.61.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B46C2FA;
	Wed, 16 Aug 2023 04:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDTEOs5VH/epHkgVKInjKsZpPkfsQ/CrgH5QX8DIQrgNVP9ldg0W6bhn7R+ZdKQH02PcgUwupuOqTE5ZO05D7/9o5HmMnpoRM8bpu5MeCDWFLkWEv9Gy87tl4TMUrdyAJJEOGd08lkBj1/8DodoPiGHvpmwXpX1us+L7FXQDZmdbfO5qNrZmXzjCAuGOMx4daDI1a+sPeJfGqI5K8pgN0qSAPYdUmhH4ny1QFbYj/9jsj/m9EznRFeqMNauFvvcGA+7h/0ClfA5p5cUKD02It9qpi1o1PtRKc0ezvb63d0xB2/IbXTnvkWUSL9yfvBXNAEPafFtIUkuKHBw68CkLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjAD5mq9j7BOQ7KkHoEELPGPX8UT5Zyn12DmzkQ30TM=;
 b=IA4aVFhmnlWhHUyxLhgpRV84e9QZ2EB+ke7E3o/Ll2qQgT5r6OpekuYftDE3BGiJRjvN2Qpngofse758Ha74ksXfEWhE+z6w+G/bV+oFEXDdjZIJMRMCZAs29zxzuLkXBM+bA+9splYKBb/XhWtl+aUd3LxTjyBWMnR/ZdMpXlk0bRHpm2c+5HdoNZNBYSBNjaIY2EgecmG6OaFRXBHZQ5a4xoBa1HAItljMrb+qAkRG7uAFVyFRugKZPvdEW0T8xAz/G7fw3EZEUSI8l1H+monNZyAQfgIbP/k3PpEUv5vvIRy3vDYOg5mCoTMSNGhG90j8sc4nxxLIQYGyj2xD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjAD5mq9j7BOQ7KkHoEELPGPX8UT5Zyn12DmzkQ30TM=;
 b=JEnP64nuF2KakOm+eAQ2tbI6MSenw9q36sA+pDNlVfPvPka2xUTuL79kRly4EcmIw0R/q2RmGgziAbuGeGT46ed6lHvtQ+Du016RgSeDuuvOXyuhfv8xv4CSG9HWMydhS8pIQeklShzXoSmvEoQ5mDX6M/SyB/wrHgilbuHs9Rc=
Received: from SA1PR21MB1335.namprd21.prod.outlook.com (2603:10b6:806:1f2::11)
 by DM4PR21MB3611.namprd21.prod.outlook.com (2603:10b6:8:a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.4; Wed, 16 Aug
 2023 04:31:08 +0000
Received: from SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::b05:d4ac:60ff:3b3f]) by SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::b05:d4ac:60ff:3b3f%4]) with mapi id 15.20.6723.002; Wed, 16 Aug 2023
 04:31:08 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Kuppuswamy
 Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "Michael Kelley
 (LINUX)" <mikelley@microsoft.com>
Subject: RE: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0812 10/25]
 arch/x86/include/asm/mshyperv.h:79:6: error: call to undeclared function
 'cc_mkdec'; ISO C99 and later do not support implicit function declarations
Thread-Topic: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0812 10/25]
 arch/x86/include/asm/mshyperv.h:79:6: error: call to undeclared function
 'cc_mkdec'; ISO C99 and later do not support implicit function declarations
Thread-Index: AQHZzyoBoYYs0W/TPEmSC3OYxqRjBK/sVhDg
Date: Wed, 16 Aug 2023 04:31:08 +0000
Message-ID:
 <SA1PR21MB133501076B6D08E5ED8AEB41BF15A@SA1PR21MB1335.namprd21.prod.outlook.com>
References: <202308151133.DHoBw5oO-lkp@intel.com>
In-Reply-To: <202308151133.DHoBw5oO-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6e7e2eb7-a1c4-4a9b-8752-e875f4f383bc;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-08-16T04:29:07Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB1335:EE_|DM4PR21MB3611:EE_
x-ms-office365-filtering-correlation-id: aae5ac29-cdc9-4a8f-1b17-08db9e119caf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0dh+mkBaUS/3AucByOXcxYeDayiIeRutt5ZQshc/0dYzv+uTAe3Jpk14mtgIddxLN5naGdkb/WfL7PLLIPI8Pgl4S4Q8L/o/HR4SnAhDDGdyqW955cq0XtJFdS5UITWBoFYCqMN3+dNB34LaQQ39ax0BOEXZmOapvYYVb0aaZVj6LIn+SJZBuQRQRsfijKNKjojuvkfKzhdoYZZsoT4294lkp588b2jybDFiqa1Jjpg8/7D/Z+Oiej8DUzBhY8btnCJVRfAchEO3YRJD9zj2dLEMs1Ux7z8YH2lsxOqjmpH7vTorKVMyWHxIAbKgeJAdQL5afnvPzlyvMq36U4wIeVUmETISuXNkgXtPiZnRf5GjCyTfsBR1ICe+cRgvKgtCvP28cCNV36Wd+uRA3UduyEN0BAFS/mTKbhWtR8TRBsAIkpSw8PJfQ1j6wJxIXg0G69pu5xdxKJj6HEAKcMPOruKeJ+e7df3Vum2lq7CLXM7fG1u8gPxjm7OsXBd5jYK06/YJtbiBTV8CPa64m1NdcZAluuG6QLlRUq+lUkm2tM4YIhzXJHvjZlKKOY44cqZjXIWeIuqEacDQww5W2nmK4/WU7W/mUAz1tal5Dr6b55oEdlaNb53nXaKKFaEojQq4DvGmFzFenFGwSHTT8La8jWUSWyTMujqRYn9a3uotiMntE6/Kf+aeVdv505/VvNGN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR21MB1335.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(186009)(451199024)(1800799009)(12101799020)(2906002)(66946007)(76116006)(5660300002)(8990500004)(316002)(4326008)(6916009)(66446008)(66476007)(66556008)(64756008)(55016003)(7696005)(41300700001)(54906003)(478600001)(8676002)(52536014)(8936002)(966005)(10290500003)(26005)(71200400001)(6506007)(9686003)(53546011)(107886003)(82950400001)(83380400001)(122000001)(38100700002)(82960400001)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ciDoDvdlm8JfDARjaGBnPlV/A5Dr14B2oJgYzyx2Mn0bbOnIztCBMPXqImaN?=
 =?us-ascii?Q?VtCXEozQEYk4qqKCF4rh6Dd7WfDbcnOjaDIDI8+y0xLNDdfo5shpUs2Rpjx2?=
 =?us-ascii?Q?TWdWy47zEyBt/a5h2wR+VojtASGtd4E8fJf2fGDInAaLY8ybN3FZKu0c7kk8?=
 =?us-ascii?Q?Dq5YceVpff7+P4t5OQZEQrmTbhvcY64+cZb50I/+zMjQuAY0EHcCMoQyeDkS?=
 =?us-ascii?Q?m4XQTRqxnX6mK3XzQEmMHJi1djzkornRgcKmBDL47s7iueNPtWt2rh/nj02K?=
 =?us-ascii?Q?mK0kDPwyacTpovw0hsX5BlKWED/q8JNFZsKYtkn5swF0umfjGoOFN+4XfSJd?=
 =?us-ascii?Q?CV6wiAQeYSc4mdRLB0Hr6ga5w7iZ84GkDa9ivzOm1O327x/WPJqgvvANcV27?=
 =?us-ascii?Q?3a+waNK8GnyrKvIoiKv51d1lXoqQw7N0XwB2skk/gba+PlvAEHly7+rBI8J+?=
 =?us-ascii?Q?mZsoT5gy+a0L68zljV6a5RDKHWVfNZyBoxE/mRhjhHIxO44jYGDzd2Sk9QqD?=
 =?us-ascii?Q?5SerPzp4G6s/gD/oHScaL5K8/eU1kBBcTFg3c1FKMprhO6K9a7z0pQ0IXI0E?=
 =?us-ascii?Q?cH6wgaYDyRFOU2Ks47q6VcOftJWCwvHEbrmJzieSAPiP2aqhfdPslwh4U/3F?=
 =?us-ascii?Q?GQjnVVxp57m05fhzi1fwUnQb4HL/AJuP8hMOPIYb4niQO3B2WC6QNDr5z/2N?=
 =?us-ascii?Q?s0/PDWMDcugbua19qu9zc/DL4s9Ub17Dvdzh+hvXMslkllPwkLj+k7RorfbB?=
 =?us-ascii?Q?zOMLBC+FLE+A3W6i+Zeq9f+FvD7unQufT79snlXrQCGBJMHb2Rsm5Z0qP5vw?=
 =?us-ascii?Q?SpfghgAWP+19SU3fELRAFjJgSr39GR69cxLXYTAHcxnIEZ/YzjkDvRi7OVJo?=
 =?us-ascii?Q?5omGdMAZ7bSIPWAUbQvS/S22j/GDoyXTOE6FvwRXwRRFXhoehui83hn84Bvq?=
 =?us-ascii?Q?XxjTKQoGqqoSe8kbpyiAhqF7XUkgp1Wj9QgZ9IiGivPSL81wzMPyQ0chFdpy?=
 =?us-ascii?Q?Fm7XS7xvAGIs/wP/pspB0LfFmCWY12xh799GAYx0YAujBKXUqKrtaEK7NuxQ?=
 =?us-ascii?Q?Z7OkRWZwgYaVLGcesGFCv6ej2i8uSwjpJU1NAGg4CFNn/5FrXb3PJxKcL6J8?=
 =?us-ascii?Q?nJG7K7t2N7P6nSxr0oqcKrEQX14UciwfHXep4Y/uJYTPkDXWy9GoDLfJQ5Rz?=
 =?us-ascii?Q?YQXXFS4MUkuUjJe9uBx/K1ADXSlAWdHlTqOOKKq+GjKt84AYPccLNDSAC0M0?=
 =?us-ascii?Q?oXXlQKMb6xQhR/R1mSBueCwZ542Qgf5UWq8oOMDL+yPOaJ03md+0Fos1/iiG?=
 =?us-ascii?Q?cp4fnf4zhxShev3BTgL10AybPNxArrFtk7cWcks+FuHktic2THo8TWKBFhZZ?=
 =?us-ascii?Q?EuxI8c+ujRUBYmtBo8e6TB1dJi3/9n9mXie1rr6nGJAkDGLYkU5y4yoyD5sr?=
 =?us-ascii?Q?KJJ3PE2dlQ24PXZ97mPNNqrgkoJUlO+2EFZGKKd5/vbWsXzmf24O+rKB6bDp?=
 =?us-ascii?Q?DyiF8GpxaaXABYaY2lgU6giY6/kD7eMc331K8SZz8yyAM2H/XdEU1XDR/Tlo?=
 =?us-ascii?Q?k0KMiWZnWKNBa1VRgwSIiOYwMd9hcFbrA2VZQTu+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB1335.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5ac29-cdc9-4a8f-1b17-08db9e119caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 04:31:08.3091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuVfiq9Y7OMyYkLDSltYp5/1AuHZBCt38tUyAel+ukdIQzM/Wdiy9H0SA1sHZMZYQduSs5EvncxWmS1L0qS+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3611

> From: kernel test robot <lkp@intel.com>
> Sent: Monday, August 14, 2023 8:38 PM
> To: Dexuan Cui <decui@microsoft.com>
> Cc: llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; Kuppuswamy
> [...]
>    In file included from arch/x86/hyperv/nested.c:15:
> >> arch/x86/include/asm/mshyperv.h:79:6: error: call to undeclared functi=
on
> 'cc_mkdec'; ISO C99 and later do not support implicit function declaratio=
ns [-
> Wimplicit-function-declaration]
>                                            cc_mkdec(input_address),
>                                            ^
>    In file included from arch/x86/hyperv/nested.c:16:
>    In file included from arch/x86/include/asm/tlbflush.h:15:
>    In file included from arch/x86/include/asm/pgtable.h:23:
> >> arch/x86/include/asm/coco.h:25:19: error: static declaration of
> 'cc_mkdec' follows non-static declaration
>    static inline u64 cc_mkdec(u64 val)
>                      ^
>    arch/x86/include/asm/mshyperv.h:79:6: note: previous implicit declarat=
ion
> is here
>                                            cc_mkdec(input_address),
>                                            ^
>    2 errors generated.

Thanks for reporting the build failure!
I fixed it by adding=20
#include <asm/coco.h>
in arch/x86/include/asm/mshyperv.h:

https://github.com/dcui/tdx/commit/fb9aac5cc1b36b17e0d82b3b47eb3f6e21c6d128=
#diff-84c3fb70b04b0abcd169a03c839a53c4c3ae304009f37fc92c599c1c7e644cb4R8
