Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE807B
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 19:22:10 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21QIT0o2029567;
	Sat, 26 Feb 2022 19:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=a8529uLpqyNAb+yngYgFIqS2OiJW+YiJnFvkLikGw7A=;
 b=jw/aLigv7GjqnOlRyHboeocMrugGbktJf3IuJrzXDnTKdnxbkHn2smZnko8yVJRpcOXQ
 H0iF3hgxKlp+hZ4CqYIdjtXXXgZ+077CCWM57Obnv+pldwJ1uzB98aGonNMXKpKH9jak
 66pALLKfMgAoKT87h7OGFE8DtReaz66X0XaYHB7v5YrcWswbk8ijiH7mi0XD9H15tMT1
 5tqLgycb0iu1DPia7TVslZtfKI23PpcCkp/uTl2glB7AsZjzCyZZMJ0yFeuFhS4cca/V
 L/K2ErZVOZz0Ps09oO6zGota3FzNMz4hRyCITBNll1KqiCo0Yy25bEor+7VG2b+7Cly2 9g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3efbtt94tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Feb 2022 19:21:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21QJBw8x187619;
	Sat, 26 Feb 2022 19:21:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by userp3020.oracle.com with ESMTP id 3efdngvex7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Feb 2022 19:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akkk/SfSpVhfQWL7SWMUOkdOBTR1A/MuParVCQqyZ2QD+wUP9pCmbM04v6q4ry68WEMdhx41DhDpuUIGWrTOZ6RUpB++kgf1hbGecfRQNbkFEvY6PYan7JNUSFbqsNajYzWUIh710bk1Bco0qVtrjuhgG+VMuquqNPrnTau2r5tLlyTHOwXR69qH1hPS1w2jVAkd/0kAD5fb5DAFDJehOk2NFkQBvsjAAu99TrzLECoVNkNd2ko0mr9eRZv1ygnXjWd2q6N1b2XpkDYWpPYqg0KWnPdHnQtbVSMPhaGrisoZOaMrSe2xtdZdiDHr2r+mTa3C0WQCT6R1lX7E51P7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8529uLpqyNAb+yngYgFIqS2OiJW+YiJnFvkLikGw7A=;
 b=NbvK15ixRWQlOAxQ7+w1NQW4BhmqlGySCY5FTSNVxo8MWOsR1gWf9zMRmEZMmpv07NPse/QGUi43NUgR9aMmabvl/ez5IZQgAhxjK3t/F1eRJSU8RJUkWpKdrL0KaqqGTr1TMn91YFjktJ5CusV0D4som95/TixwYgcs7afnaJY4BYIQxSOxGaxHOzK53tbzhrfGUNAlVicBtbNGFZRGbhqC3ZnbEL8HmtLMQLPEc8EuawzxmCEq3nAqLOljbKlZpAwh84ytwPihxMWKWdXgv7VqLAqA9SqoK1xANdNMk3c/s6/eJ8kKX+pISpvWcMzjqlpCKsiNREcAEUgbMYBNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8529uLpqyNAb+yngYgFIqS2OiJW+YiJnFvkLikGw7A=;
 b=zd1yQJv2UAp2KOcPoDv+5kYRDAp1SJb2CdW2XTjuhmCBUASi6RByp5Ts/8SYIHWzLH8SXXdmtKDMLAzMoF0DH9MMfzjJiKvMc9M8q4KbNGgmS5r+mU8Vnb7e+p1oLiVJjDlXgDvbcT15SAGYuiPv+pgj49ikvpFhcviXwSqGxjw=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN6PR1001MB2209.namprd10.prod.outlook.com (2603:10b6:405:2f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Sat, 26 Feb
 2022 19:21:37 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8df4:1db9:57f2:a96a]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8df4:1db9:57f2:a96a%3]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 19:21:37 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [linux-next:master 8608/9128] lib/maple_tree.c:473:7: warning:
 variable 'shift' is used uninitialized whenever switch case is taken
Thread-Topic: [linux-next:master 8608/9128] lib/maple_tree.c:473:7: warning:
 variable 'shift' is used uninitialized whenever switch case is taken
Thread-Index: AQHYK0UvncFMXOQaUUmvHxEheU0S6KymNY4A
Date: Sat, 26 Feb 2022 19:21:37 +0000
Message-ID: <20220226192126.h2yjv5gjy3ytmaf3@revolver>
References: <202202262240.NbkCh7vR-lkp@intel.com>
In-Reply-To: <202202262240.NbkCh7vR-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fcbd301-2ea5-40a8-cb6e-08d9f95d358a
x-ms-traffictypediagnostic: BN6PR1001MB2209:EE_
x-microsoft-antispam-prvs: 
 <BN6PR1001MB2209DFEB2A2050DACF3D5D59FD3F9@BN6PR1001MB2209.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +80PwC4N2QBxl8HE+54YK4YwDt3ADEpue+SP3kosRbnPZjDDOpOYccoVis3GbychXHwsyzGtI5zMRIqfC7DfHsFJe8B0Snwt6njh07xbf2fklI9wXw8DaFSQaoMaWs7cLzkk3NJuD7e80DWCYENcosdBJtLZQ3X89lsBb/JC2lpCOGCx0zTxtIj9nv6j3JpVVOd6X76qYlGw4wMjbim2lUAgeOnKo2MxXga30TCIOUdXj8dqTVbPQ0ZgfNSQH3XF6EIuBYRjDhfg1dz44tmNU3pwIzQ/tTyFeWvbdGUSCHFlg6SQNYlqR9N1NuO0bsCqttefd6qLDxi8Tcda1w9jzLa9fEynD8LGbiSC5gEICzJU17BN2IMEFisJDDAMTshHHQZlWEurM480VTzJHtKF7IqpRBloVoe5PN1SE1oBNRhs6ChYP+6KR0VPKI8vN+AF9aPBtO03qAsUFUnzra8mvsBbQzx2YuVL91xfbOiss6VGvirtLupWhSpa42A5L5ZZcaCLRrNkxow+bjWCKz6Txjv+sJU5bbJOJlmb1qRxzb9XBbdpgDM6LoNgyWkEbD08RZiBH9XB2qF4T+V0BOy4GNJ28pH3H3ejCkvh0se1bQ3YQpkN+KoH5MCDRg67CR4YdCbF855awrsmL+wUwJdYSIyzi7nn5L54AH5bQ/NQiz0j6XN1LXOwGnqJBMqdCRUoraFiTIWu6OtNB9IVGB+1sSdFFVzxPDqUC9uF0iWOGRje77a8PyzqdHAqg/SQM6JtHdrMxmq9rGrPlB70ESUie8KL3xgLSDHl8w2o5p7T2earoreR5PNYulu2hpQOtP8p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(122000001)(83380400001)(38100700002)(2906002)(186003)(6512007)(26005)(33716001)(71200400001)(1076003)(38070700005)(966005)(44832011)(5660300002)(8936002)(8676002)(4326008)(6486002)(508600001)(91956017)(64756008)(76116006)(66946007)(66446008)(66556008)(66476007)(54906003)(86362001)(6916009)(316002)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vwVIPZ8u7Da/k0QuBiZjnxTHth+cAmP1WssTYVYkp2ijXBi9iU8C9sM9ZRUe?=
 =?us-ascii?Q?weSfQzaAL8rif0USB91yT37W6gafnQ8s9PJxOrgiCITWmPhLCKOrFSZLOrmn?=
 =?us-ascii?Q?Hp8JM7qUeokfFhfeJgIeIyN/a7uDoZ9sAE5Rj8Tj3zcK5Wal1CzRQUoIRVIp?=
 =?us-ascii?Q?dh0G4TWoI15jgRD9mIwvahB/zE8YgQuiS+0CTuG7Gl+i8zzDRpraoxC3v/NX?=
 =?us-ascii?Q?IwcDMfFpaJ96io9CpR9CtmU9DLgIWVVX+jdEpodTU4PTXxoqFJhiBhk3R410?=
 =?us-ascii?Q?pKuKzuJaiwGuKV8l0lEgeYi5Q2znq3H52NVPwLFGjUp15nLxi+ewGoqHOiFI?=
 =?us-ascii?Q?gTgFvl4Vpu256RMYlAkoqkNqZw6Pg6s31kU09YQkrlRAU/jdY15nOuxLwGBN?=
 =?us-ascii?Q?xRWoAPrSA0sbL97/InQkuLSpEPrAvclubgvxve3DPQIzCNtmf6XwPaCU++rJ?=
 =?us-ascii?Q?zI7r308hNTwvMqNIYvVBDR5yk8CyOYLO8E9Mcjasj57VXlgVlRtAlXXKGC+H?=
 =?us-ascii?Q?UdOju2uSFdEqXUmj7yjsVM3wEFK72REWXIjcjJ/PuR7Gz97zd5mzZE9D9WAT?=
 =?us-ascii?Q?abg7uu6C+SfekLjtPCgGWFrzv7mlxjncYgIr+8wvz81LOUPWg8zVWQcp8+lg?=
 =?us-ascii?Q?U/YggKttYuGW5uIGh9cwsHa3w8AfSmKXnUZsQQtMfg+ZkG0yfK6V7RVqR4Dc?=
 =?us-ascii?Q?zft4hGbaPYXLVQ0gJ+FmE5cL5L9f/ezvvRWLO2a81ChRcN1I6E6WwEJyzc4c?=
 =?us-ascii?Q?ZtTPJf9CQBPgBHUrlSkRqTIZfm7tiqNMb8f3No/GAIM/XzIr3a+b1/LhJgjK?=
 =?us-ascii?Q?SPDoHRXJ71/9kixSmZao7jmwCcAiZjZQipW7z6+V69h8QPa8txhYkeeYD/MJ?=
 =?us-ascii?Q?YqDYkeGb9eUMxVeg/R8fOTdjChJBFyu5KcN0PAMtw1CSESeoCRU5e8xOQghu?=
 =?us-ascii?Q?i7zvaDaAFKlgI30ILV/JLc9XcUA1JGImFtKJahFmrSTYNBacia/fpZLTuCTU?=
 =?us-ascii?Q?LJfkdbvTtMINBvtTxaG7CIFGKeD409vNAzan7yV6hMB9fYACtDBVwp3DuoIt?=
 =?us-ascii?Q?77lKJUJXkxUEs2kBM9boYhyNbt83sf2UrHccACn10sGgm/yifQyQjvmeUEHQ?=
 =?us-ascii?Q?Ocb8B9GUlDYtwh/Dr6jJWXHl+kAEZDk2Ywbrr+U2t2oJs13XhyEuNlFS5a5U?=
 =?us-ascii?Q?o3D6y9xuxDJ7L6g86iCavN0XZXJbDMo3w9r8BWqZ9Dt6TGnUM2HlTLzxHVKx?=
 =?us-ascii?Q?6+Pa4hxgZnDrAvnKuoL/cuKCAMBcOWg4ZBDqG/hLknW6dIkoBstBazO29XLt?=
 =?us-ascii?Q?RjHStQ1GIYsBwKQKMXRcovjyx27BUwndQXaSc0z/CVXUfTelmI0NMoFFeLne?=
 =?us-ascii?Q?6b5aF5Pb4qcdg4eHm0BYmf+qmpyAOivgo23o+TcKMEboGNd7PIeEZh+/QURR?=
 =?us-ascii?Q?QZqKdeoQe1lCSNi7JkLUg1XU0QBN0QiL8tFZ/i8kb6wxWOEa34so8ZFwNAWb?=
 =?us-ascii?Q?vNGD0q8qUE4+Nf22JmwLQEPLsdIjpqcY37BkBPikqHHJgMPNAhXMjxPtEDKH?=
 =?us-ascii?Q?4uEpd9QSWuAbv7TQPfXQ5wSu9Lnd5t6lHn8fgRwLPAjZEEJL79ONk8GaJWe8?=
 =?us-ascii?Q?KfUVeHkOfc4RM3kgYwVXYyo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F99A9DE42A4F31428AC19F980040AAB3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcbd301-2ea5-40a8-cb6e-08d9f95d358a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2022 19:21:37.4417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IEAxzdAb1IYuhk6BmlVLsZXEyFjjy7rT2kly9C8mriMI76KFoaBeIKmL5cIFjhGn+G/mAQsbwNdzA+/sjblQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2209
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10270 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202260138
X-Proofpoint-GUID: sab9nU17UVK2H0qvzbnJUep3oMPxohZL
X-Proofpoint-ORIG-GUID: sab9nU17UVK2H0qvzbnJUep3oMPxohZL

* kernel test robot <lkp@intel.com> [220226 14:15]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
> commit: 564eadc47f5f72d5fc25b3740452e4fb61cf694e [8608/9128] Maple Tree: =
Add new data structure
> config: mips-buildonly-randconfig-r005-20220225 (https://download.01.org/=
0day-ci/archive/20220226/202202262240.NbkCh7vR-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271=
fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D564eadc47f5f72d5fc25b3740452e4fb61cf694e
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 564eadc47f5f72d5fc25b3740452e4fb61cf694e
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> lib/maple_tree.c:473:7: warning: variable 'shift' is used uninitialize=
d whenever switch case is taken [-Wsometimes-uninitialized]
>            case maple_dense:
>                 ^~~~~~~~~~~
>    lib/maple_tree.c:480:18: note: uninitialized use occurs here
>            val |=3D (slot << shift) | type;
>                            ^~~~~
>    lib/maple_tree.c:474:7: warning: variable 'shift' is used uninitialize=
d whenever switch case is taken [-Wsometimes-uninitialized]
>            case maple_leaf_64:
>                 ^~~~~~~~~~~~~
>    lib/maple_tree.c:480:18: note: uninitialized use occurs here
>            val |=3D (slot << shift) | type;
>                            ^~~~~
>    lib/maple_tree.c:463:21: note: initialize the variable 'shift' to sile=
nce this warning
>            unsigned long shift;
>                               ^
>                                =3D 0
> >> lib/maple_tree.c:473:7: warning: variable 'type' is used uninitialized=
 whenever switch case is taken [-Wsometimes-uninitialized]
>            case maple_dense:
>                 ^~~~~~~~~~~
>    lib/maple_tree.c:480:27: note: uninitialized use occurs here
>            val |=3D (slot << shift) | type;
>                                     ^~~~
>    lib/maple_tree.c:474:7: warning: variable 'type' is used uninitialized=
 whenever switch case is taken [-Wsometimes-uninitialized]
>            case maple_leaf_64:
>                 ^~~~~~~~~~~~~
>    lib/maple_tree.c:480:27: note: uninitialized use occurs here
>            val |=3D (slot << shift) | type;
>                                     ^~~~
>    lib/maple_tree.c:464:20: note: initialize the variable 'type' to silen=
ce this warning
>            unsigned long type;
>                              ^
>                               =3D 0
>    lib/maple_tree.c:5547:6: warning: no previous prototype for function '=
mas_wr_store_setup' [-Wmissing-prototypes]
>    void mas_wr_store_setup(struct ma_wr_state *wr_mas)
>         ^
>    lib/maple_tree.c:5547:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
>    void mas_wr_store_setup(struct ma_wr_state *wr_mas)
>    ^
>    static=20
>    lib/maple_tree.c:6175:5: warning: no previous prototype for function '=
mtree_alloc_range' [-Wmissing-prototypes]
>    int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
>        ^
>    lib/maple_tree.c:6175:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
>    int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
>    ^
>    static=20
>    lib/maple_tree.c:6210:5: warning: no previous prototype for function '=
mtree_alloc_rrange' [-Wmissing-prototypes]
>    int mtree_alloc_rrange(struct maple_tree *mt, unsigned long *startp,
>        ^
>    lib/maple_tree.c:6210:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
>    int mtree_alloc_rrange(struct maple_tree *mt, unsigned long *startp,
>    ^
>    static=20
>    lib/maple_tree.c:76:28: warning: unused variable 'mt_max' [-Wunused-co=
nst-variable]
>    static const unsigned long mt_max[] =3D {
>                               ^
>    lib/maple_tree.c:322:20: warning: unused function 'mte_set_full' [-Wun=
used-function]
>    static inline void mte_set_full(const struct maple_enode *node)
>                       ^
>    lib/maple_tree.c:327:20: warning: unused function 'mte_clear_full' [-W=
unused-function]
>    static inline void mte_clear_full(const struct maple_enode *node)
>                       ^
>    lib/maple_tree.c:837:35: warning: unused function 'mas_get_slot' [-Wun=
used-function]
>    static inline struct maple_enode *mas_get_slot(struct ma_state *mas,
>                                      ^
>    lib/maple_tree.c:4599:19: warning: unused function 'mas_dead_node' [-W=
unused-function]
>    static inline int mas_dead_node(struct ma_state *mas, unsigned long in=
dex)
>                      ^
>    lib/maple_tree.c:4621:21: warning: unused function 'mas_first_entry' [=
-Wunused-function]
>    static inline void *mas_first_entry(struct ma_state *mas, struct maple=
_node *mn,
>                        ^
>    13 warnings generated.
>=20
>=20
> vim +/shift +473 lib/maple_tree.c
>=20
>    448=09
>    449	/*
>    450	 * mte_set_parent() - Set the parent node and encode the slot
>    451	 * @enode: The encoded maple node.
>    452	 * @parent: The encoded maple node that is the parent of @enode.
>    453	 * @slot: The slot that @enode resides in @parent.
>    454	 *
>    455	 * Slot number is encoded in the enode->parent bit 3-6 or 2-6, dep=
ending on the
>    456	 * parent type.
>    457	 */
>    458	static inline
>    459	void mte_set_parent(struct maple_enode *enode, const struct maple_=
enode *parent,
>    460			    unsigned char slot)
>    461	{
>    462		unsigned long val =3D (unsigned long) parent;
>    463		unsigned long shift;
>    464		unsigned long type;
>    465		enum maple_type p_type =3D mte_node_type(parent);
>    466=09
>    467		switch(p_type) {
>    468		case maple_range_64:
>    469		case maple_arange_64:
>    470			shift =3D MAPLE_PARENT_SLOT_SHIFT;
>    471			type =3D MAPLE_PARENT_RANGE64;
>    472			break;
>  > 473		case maple_dense:
>    474		case maple_leaf_64:
>    475			BUG_ON(1);
>    476			break;
>    477		}
>    478=09
>    479		val &=3D ~MAPLE_NODE_MASK; /* Clear all node metadata in parent *=
/
>  > 480		val |=3D (slot << shift) | type;
>    481		mte_to_node(enode)->parent =3D ma_parent_ptr(val);
>    482	}
>    483=09
>=20

I had dropped the setting of shift =3D type =3D 0 in this case statement to
remove another warning of the code not being executed.  It is obvious
that the shift and type will not be used in this case.  I'll rework my
BUG_ON() checks outside the switch to satisfy the bot overlords.

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org=
