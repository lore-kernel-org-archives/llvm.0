Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4A3C02
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 17:04:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285FuQ7p014987;
	Mon, 5 Sep 2022 17:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=jAZ8hEouHUmpEOd9jJyhOEBbcm5aqh1HFxKxfOCiwUo=;
 b=f7ZyJa/ZiRm/fnpIS9USG10XyJH+ryrCl74C6P9S3U4cJsSEF9FrpHEigB6JIg77OMO9
 vToWzFv2uL3IF+fLNJIs2dJkjYQvKY5H0IZG4rxnSVr86WyeKYcv3FaLEY5URcD+Coj4
 WSuWX3rm/4NYbZxCk6ly/7cfqhpmHFnRly1c1o0p6mjfW9dfn5mdk183g2RmrkIRMRpM
 4Dx9ZdTeS60q4E22b8XMsUFJxawDb0CmNg5hyL5x4H+Q6yG6OP2kxpngQcvFifBfmBwp
 pZU0PBpGEZ82dtfSgCIifOCmpjXMV8tEhIe7OOqPT87TAhxVVG7+uo5Jxvi0xPCvwX1V kA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jbvmnd0bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 17:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKZZ0j+5Pj+Hfh2XbItbasIW1S0iqipT7ERmua8m5tR1Zw5BbUWrUGGfMboB6T7rTsNk+WYKzdKgPhEztVbu3bFe5LDeXDmHJZu1AMaU/NJL/MmWyMmwi/Lc8gdC2KRmEl7tYV5PPSajBciZyG35XGPz8JUhbph4jnlOX04les6sS8T9UXu0D7tUayfff2U+hBPVfrJgCnOyIJrQF8q1AuhgIsH8va8Olcad0XNamxQAm6O/L1srKSJma6l5WdHPK5gE/Dc4qfbVEwEakgDat9wfwuO2Xzzn0pXE0A+eURjRxZ+qLl0UAFcXkM+TnPQ//SwtavJhbn3ckSL7f1FwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAZ8hEouHUmpEOd9jJyhOEBbcm5aqh1HFxKxfOCiwUo=;
 b=b4LzWtWVBhiJA9aFRyvZfCFG/+y5U4V0c1GfWKKUixKxYCu19qmcflaycFp9eygSAB0GYJy0XToDmChgUzfLRHIN7OgqEQqRWA+b2xZTf0CjPgX93f0XaI369zvHOOhKDtJtZGSnKBv0F3KI/ix4c5dbwow9OO/xv7WW5kBTXkSOAo0qaeSReDwIljQGj2RbHEoXeutUDtEsP8WCxtJcZGDlMPwib4ELep3YMwajaPOY2Q+ZYvYZVJLz3crhvoOYNxG3mUzJKZ+eREBpCrpmWzlHbBCa8mLZyOx+kHsnnQom8is0KnSRLf3x07vi8Yw4SxclMz4eC3Yycxxfg6BxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by MN2PR02MB7055.namprd02.prod.outlook.com (2603:10b6:208:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 17:04:12 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::41a6:c2ff:ba0d:16ac]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::41a6:c2ff:ba0d:16ac%7]) with mapi id 15.20.5588.010; Mon, 5 Sep 2022
 17:04:12 +0000
From: Brian Cain <bcain@quicinc.com>
To: Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada
	<masahiroy@kernel.org>,
        Sid Manning <sidneym@quicinc.com>
CC: kernel test robot <lkp@intel.com>,
        "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
Subject: RE: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
Thread-Topic: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
 references __vmnewmap
Thread-Index: AQHYvt3ST2lWSPFE10upQHFw3JirY63RFCgQ
Date: Mon, 5 Sep 2022 17:04:12 +0000
Message-ID: 
 <SN6PR02MB4205AEC82D37030BE689CE02B87F9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <202209020450.jH1ovepP-lkp@intel.com>
 <YxEoo8M++9tyaLOO@thelio-3990X>
 <CAK7LNAS9BtiQ8oSX+oOZ8Wewaed+p7Kj8kaObpVddBuR308Nww@mail.gmail.com>
 <YxIcU9LW3OLHjAnm@dev-arch.thelio-3990X>
In-Reply-To: <YxIcU9LW3OLHjAnm@dev-arch.thelio-3990X>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 547c78b1-b504-4afc-5779-08da8f60a7d6
x-ms-traffictypediagnostic: MN2PR02MB7055:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tQaNfNcjGMB0oWa8Z/ERySangoGt3F5W5JQjPs4CyDBEhXyCiENgs5ZMxyBqG8CnJQKtYoZwWXnxy6iWrKAZPiVZgWMhfgaHm18IwTxKEHtFtFhMnhIxSR7GsWNV0xXuQEinp2XINp8IQUzL7ELK6cso22zaz9UpaouVOx5GQT/LrsZCnGcyMBirvc6y5wAIRZZvM6GB7GWhHQvolVRhhXsQaGiz8OK/o6V814LCEjfAN4pdgsCSn1F8V4BBGqIyJrKW1gPwvepKj7nsZKzb1X0bl3FUq/8hCiXUuWyWVzA6ZghUBDy5g9wWyEjKfU//+6G+3ag9YI4LdsVzcFWp5mzjlMTSMLlHSUcfUN3h3iNp1Pry65C4QzTMRO1awH2E+I+CzUuvmlENmWuwYY4ZvVeMCHbC+xWxsE1BAHPT1Ywjv5hKYNn8GVTFUG2EGvRBa3dLTeYDLg26RX7t+h2U/FFtV1XF3P/DnXVV9LO+M85ZCzOp5pOnQ8ERWhL0QRR39orulTLABUe2j2mjJ2RxwkpqTQbnlnMPKDN+xPTkmmJPCI5PfbBcLPnpidpyUtNuyDXX4OK3QKAKdhHcyq2wVn0O8D+cttd7xsPkxFDECgW0OL8sFDcG/QCU8IbsKDoqJKLOG+Z2XSFvSWfHtK0D64Gp5EjWsY+bJeagpkAInfctUWnFVl/X98qJM1ohmG7Z8lCKqF0SeLyYeJgEIMDLnpxvhpWX/RLImOVOzYl3HFwg8WK/eWakEEYdXNDhnRp8VYdzispZk4vdG2O4qdGTkcO0sbP1NqP/Lm/5ZedyDQpfs73flM/4wBhqBcXQ/43UBsakQI7s+RZP9ukUo3YTgw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4205.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(478600001)(186003)(41300700001)(6506007)(7696005)(966005)(9686003)(71200400001)(86362001)(55016003)(26005)(53546011)(38100700002)(122000001)(38070700005)(4326008)(83380400001)(66476007)(76116006)(66946007)(8676002)(64756008)(66556008)(66446008)(54906003)(84970400001)(6636002)(110136005)(5660300002)(33656002)(316002)(52536014)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QgDvr/JlCQLqTadlUWR8ZzguF7Ty4ap/Ab7Kq/Lb3uLXPlRZhiWU414DAG81?=
 =?us-ascii?Q?SLeQbQ2wOX+z+8v2LowpV/KljfcfQm3qU4crDud65dcuzsJZ4kz9x7epfXOo?=
 =?us-ascii?Q?Bo+JfP6L8OxnDsJP4t8wLi+oIcIxQ3u4AV9SuqOCIMq9hi6R5FGBG4vIZJdF?=
 =?us-ascii?Q?2dfpCy//jNMDOnkLW0+91piTsEU2jGfzIkpKFNn8WkylZlgyVGu1mKO28mIr?=
 =?us-ascii?Q?BBgH9MtEZwkOkPvkI2B1PU0GOmMSP2jjXeIRupbfNaHqzawJz3RexX1rvrUe?=
 =?us-ascii?Q?gFYSv8MMVmcyT54ZfLUK5p6mn+QC/VTq8DvjchTTgY6a7o9BYARzv47NG51c?=
 =?us-ascii?Q?EZDoURSNdLh1fIBwnO1VDI1W8gt3vO9lz64jn9HaGVvAWb5XcDW2fznYClj+?=
 =?us-ascii?Q?x+495j6zwfEFNPOH6Y4OeWySJsYRCHMdRBRv+fxIHri0jjtDWSJKIV74Aoc+?=
 =?us-ascii?Q?+wI1Br/rYy0/JGas4/x4mkyOyCojGDG123jKPr0CZk/ThB4kXVJLS+H1tQSc?=
 =?us-ascii?Q?6+rBQpG4gOjE6rGSdlAWMyrZYsxgXb0yZkhggYaBppDNHIUDp2GeRWYYmZxn?=
 =?us-ascii?Q?HGfD2dz3J3b11SZPmBgd3AN3UsBAcHUY9bKktKIJo1dGHLj99Wj9wr3qtfKm?=
 =?us-ascii?Q?0i6goUQkmCGst3+2K3odf7gE/cSkWOkRpVgxDFj4fv59A8j8EGHLGXBIOQW2?=
 =?us-ascii?Q?+fGl5hPtQL7/SvsWtASJy+AKNJgd/Gk5NAUptorBGbCAJkwJFjlba/ZkKECr?=
 =?us-ascii?Q?FEySNwERF4w4FsdIFDks/eL17CmeFfjO9/Qq2EgnuJfLpskQcmJ9la/PlGmA?=
 =?us-ascii?Q?CX5qc/Py3DbOgY+tjfAnlgBr5wEOgRLnoTxxfPIRETLbpHuyiajjjirKDAK7?=
 =?us-ascii?Q?VxntynedfOI4SGHW60tiN/5g9OtNtINcGig7JgRNnK0tWw9TDehMFsYWdPHi?=
 =?us-ascii?Q?5YmgKiFwQyBIctLGKuAduMu4V0sl7In1ahxLrOVwX1oqeJxlxw97/PGw4Dzs?=
 =?us-ascii?Q?+6F2IAvb1Icd9yKxrKDFJ8c2YjbvwMRwxXkRWhhrTtuDqAC4MAAV9G7PBlA1?=
 =?us-ascii?Q?jDzWFjABXJmPQgej9J6cT3N679O0UQvnwno8wCo93PEhIHVw4a76n0y98m7S?=
 =?us-ascii?Q?0+YuB3jlyRNgZKxYBfj2ggEiIdESVdyX9T7kpY7Y/0HqD1RsQI2QX34i0Znc?=
 =?us-ascii?Q?8mK8Ukv4ycLBWPWPlG1+utHufOYgbumUCZLCn6kAD2Cay4WOhipmJvXj8oST?=
 =?us-ascii?Q?3mlFzbmWMKBxKPlsV1NPygzDtsWore0cC2QLAcWi+BfeJRD/aWvPeZ1nbfWq?=
 =?us-ascii?Q?L/HDrPWtmAKIV6/FasfghqP2wqGtRgPmGsSWySWvm7QHXrw3NbWjqA5hh5N4?=
 =?us-ascii?Q?pHLHVoBKb7XM2ZpKA6MZGuorg+W9LP4lqYZYZZQygafygjlsNKdGJBvxEvvt?=
 =?us-ascii?Q?kSjBwdwK6/m2lul7vbOtZF0StSHmgj6zA42IdXWbmjo/haYAgbkRPTMBtJSq?=
 =?us-ascii?Q?sxC/hIdwp9ucncK2/dO4fmnz3FE2wfhS+z8c2apl71CjZjjadviW+XWY/7Y8?=
 =?us-ascii?Q?2bo5nkFn85eW9lveHP2BxywVrb8j5+lSuhndhrpz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547c78b1-b504-4afc-5779-08da8f60a7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 17:04:12.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmw/x+K12+jnOqteQ80f7PLov0MI4fjMBvMkpHxURy5WKYX28Uxwtndtp6T+Jy7luGXvZBdGK0OZegV6oDEutg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7055
X-Proofpoint-GUID: h7l19iR0ZXDr7dYjMpY1Bm1Sel1C_o_9
X-Proofpoint-ORIG-GUID: h7l19iR0ZXDr7dYjMpY1Bm1Sel1C_o_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_12,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050083



> -----Original Message-----
> From: Nathan Chancellor <nathan@kernel.org>
> Sent: Friday, September 2, 2022 10:08 AM
> To: Masahiro Yamada <masahiroy@kernel.org>; Brian Cain
> <bcain@quicinc.com>
> Cc: kernel test robot <lkp@intel.com>; kbuild-all@lists.01.org; clang-bui=
lt-linux
> <llvm@lists.linux.dev>; linux-hexagon@vger.kernel.org
> Subject: Re: [masahiroy-kbuild:kbuild 18/19] ld.lld: error:
> vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
> R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152, 2097151];
> references __vmnewmap
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f
> any links or attachments, and do not enable macros.
>=20
> On Fri, Sep 02, 2022 at 09:36:33AM +0900, Masahiro Yamada wrote:
> > On Fri, Sep 2, 2022 at 6:48 AM Nathan Chancellor <nathan@kernel.org>
> wrote:
> > >
> > > + Masahiro
> > >
> > > On Fri, Sep 02, 2022 at 04:41:09AM +0800, kernel test robot wrote:
> > > > CC: linux-kbuild@vger.kernel.org
> > > > TO: Masahiro Yamada <masahiroy@kernel.org>
> > > >
> > > > Hi Masahiro,
> > > >
> > > > First bad commit (maybe !=3D root cause):
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/l=
inux-
> kbuild.git kbuild
> > > > head:   67c0e0cf21cd5065fba45a6a00dd252ae4b9417a
> > > > commit: 0b1de512cba77e11bdf0305264c56ab61b23b3e1 [18/19] kbuild:
> use obj-y instead extra-y for objects placed at the head
> > > > config: hexagon-randconfig-r041-20220831
> (https://download.01.org/0day-
> ci/archive/20220902/202209020450.jH1ovepP-lkp@intel.com/config)
> > > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-projec=
t
> c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> > > > reproduce (this is a W=3D1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy=
/linux-
> kbuild.git/commit/?id=3D0b1de512cba77e11bdf0305264c56ab61b23b3e1
> > > >         git remote add masahiroy-kbuild
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t
> > > >         git fetch --no-tags masahiroy-kbuild kbuild
> > > >         git checkout 0b1de512cba77e11bdf0305264c56ab61b23b3e1
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang
> make.cross W=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash
> > > >
> > > > If you fix the issue, kindly add following tag where applicable
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > >> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text=
+0xd4):
> relocation R_HEX_B22_PCREL out of range: 2313184 is not in [-2097152,
> 2097151]; references __vmnewmap
> > > >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > > > --
> > > > >> ld.lld: error:
> vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation
> R_HEX_B22_PCREL out of range: 2313056 is not in [-2097152, 2097151];
> references __vmsetvec
> > > >    >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> > > > --
> > > > >> ld.lld: error:
> vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation
> R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152, 2097151];
> references memset
> > > >    >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://01.org/lkp
> > > >
> >
> >
> > Thanks for the forwarding.
> >
> > This is not a regression.
> >
> > The hexagon was already broken.
> >
> > It is just that it was deemed to be a new breakage
> > due to slightly different error messages.
>=20
> Thanks a lot for checking! Something for the Hexagon folks to look at
> then.

Thanks Yamada-san and Nathan.  We are investigating this and will report ba=
ck.

>=20
> The original report is at
>=20
> https://lore.kernel.org/202209020450.jH1ovepP-lkp@intel.com/
>=20
> with the original config file.
>=20
> Cheers,
> Nathan
>=20
> > Compare the before/after.
> >
> >
> >
> >
> > [Before]
> >
> >
> >   LD      .tmp_vmlinux.kallsyms1
> > ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4):
> > relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
> > 2097151]; references __vmnewmap
> > >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x120):
> > relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
> > 2097151]; references __vmnewmap
> > >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c):
> > relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
> > 2097151]; references __vmsetvec
> > >>> defined in ./built-in.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160):
> > relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
> > 2097151]; references memset
> > >>> defined in ./built-in.a(arch/hexagon/lib/memset.o)
> > make: *** [Makefile:1170: vmlinux] Error 1
> > make: Target '__all' not remade because of errors.
> >
> >
> >
> >
> > [After]
> >
> >   LD      .tmp_vmlinux.kallsyms1
> > ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4):
> > relocation R_HEX_B22_PCREL out of range: 2313200 is not in [-2097152,
> > 2097151]; references __vmnewmap
> > >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x120)=
:
> > relocation R_HEX_B22_PCREL out of range: 2313124 is not in [-2097152,
> > 2097151]; references __vmnewmap
> > >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c)=
:
> > relocation R_HEX_B22_PCREL out of range: 2313072 is not in [-2097152,
> > 2097151]; references __vmsetvec
> > >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
> >
> > ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160)=
:
> > relocation R_HEX_B22_PCREL out of range: 2326848 is not in [-2097152,
> > 2097151]; references memset
> > >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)
> > make: *** [Makefile:1180: vmlinux] Error 1
> > make: Target '__all' not remade because of errors.
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
