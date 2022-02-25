Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B610EF
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 01:42:34 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OM8oNQ006284;
	Fri, 25 Feb 2022 01:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TUnLR51wZvLFko4aO3owTFU7GnVSyYdKcILWHdlkBPg=;
 b=R0P03RypFnxYjlBkYgUy6/mH7ylpJRRPrDp+qf573ts4pqIgai7Bymj995PXOs8O6Hdi
 6Go8eS7X8GM5FYbt/CCKfn8vl2YrO/SkF+7m9HciYSxs2e2czzVsddah5ruFQnFWlBPD
 gudTBFSlVAOybj8ArqV8jImGh15a4dXL5JFAbjTgwILcSLLPYV6I7OlUzA66cYaF+HWL
 pCGXJS/17QtTSERzFluLKDqj6NvtAFHXiYohcvpZahQ80t3ni14TN/cJEI+lFNRzdHY9
 x4H6Esb8YmkocsBrF7o0PxBTPcep0cOlREeVwQm46jDdrbMHyVThGla+DehSiBbHDMF7 bw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6f0vep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Feb 2022 01:42:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21P1egeh037728;
	Fri, 25 Feb 2022 01:42:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by aserp3020.oracle.com with ESMTP id 3eb484a3a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Feb 2022 01:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koA4FS2Mzy900rIcEvlhFAX1s/4SWFA7a/2Sm9ewZ0Wzx1YgbRnzFgnSJ22S45nsLf8U3MI5KuAz0R7TZ65PHEMaZOdn4FX+stuGWrOpmSL3QVNI+B6n0agSIkN5vB88jOiTfkiPr7YEAerUC68DF7TurLOXBvr4ipOFs9Sept8A6hwu4EaFNUCZXcPs6Lw9UHp6QCeWeZQpk/vpJ/Qpa48dBjMSH40Gqk+6pjXT6YvIlec5WKxS+YarXzYu2px7c3ap997pRDlp6AeaZaeInzh8AUQVnD8Fp3tGllC/XsapWnlhC/+JViRjB2lhXiNTfiX4yhdzY46227N7bXq6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUnLR51wZvLFko4aO3owTFU7GnVSyYdKcILWHdlkBPg=;
 b=Y3qUMMTQ8kDWegHW6JG93d234COz4EC7Ph3mGcrY1iGXgurjz7FLUB6GdYwashe2aMBojCrnDSzI02wPxwdxJpOLQQtLEXKXB7KpAGIJHMb4Z9ZEbrw38AyzZUpy9R8O5qoBzu+LqVNrhFFrzik2uccA9x7wQZ+YUfoGd8IHLRyBWXiXL75SLhFYCnqcO/1VCM5lGYLx1yJzhRnmd6uWIsFxhyZ9NMgEyY7HJfoElTk3ut4gGneLMd6bPm0cDYEIVlV71R6pjCCn0+CwaTfoN81WAS4sUWQDcThoyGnoh3soY+GpXDmUFWy4SfpoQI9XOBPwMopleCYf1usRiwSvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUnLR51wZvLFko4aO3owTFU7GnVSyYdKcILWHdlkBPg=;
 b=tOs9EPXBEMkAZcCK9P8T0goCoY4yxTcoGHWBnTnGWGAJo88V38DM9mBP3Fd/iLdHHVyTLgu3ArrkGUnzOBNUtW0JgbaIKTvadfC5vMd56RtLNyrwnv2ji7FjjqJOzIu1uu9zGpK2emNiH4yqm3ZKKHuxhfEALndYoCwf9s/VK2w=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN6PR1001MB2082.namprd10.prod.outlook.com (2603:10b6:405:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 01:42:20 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8df4:1db9:57f2:a96a]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8df4:1db9:57f2:a96a%3]) with mapi id 15.20.5017.024; Fri, 25 Feb 2022
 01:42:20 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6806/7915] ld.lld: error: undefined symbol:
 find_vma_intersection
Thread-Topic: [linux-next:master 6806/7915] ld.lld: error: undefined symbol:
 find_vma_intersection
Thread-Index: AQHYKVMtW/UtbmsRd0SMEZRdn5p+dKyjfyyA
Date: Fri, 25 Feb 2022 01:42:20 +0000
Message-ID: <20220225014213.nctqdkrlge3mbcx5@revolver>
References: <202202241512.jmoQhMEv-lkp@intel.com>
In-Reply-To: <202202241512.jmoQhMEv-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c5d42a3-3c3e-4221-a40a-08d9f8001046
x-ms-traffictypediagnostic: BN6PR1001MB2082:EE_
x-microsoft-antispam-prvs: 
 <BN6PR1001MB2082C3532851751D165192FFFD3E9@BN6PR1001MB2082.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5IxoukJGDAGRur43mVCyrLt/zIlQSqFiR0p8ZH1m4iZ2CXfHAteqBci4Da2XM/fCCBPK7rSqpIql3aJQJYzXbvn3TN0rCF09EVD+VSeGqauS3QM4Uwdelpnz0/kME9qf4ehh7Sa00+UiSlrE7QNH6/nxvyZR/+3oy8/jgwmzHjbZ2OIjchZwcT99sF6XdtAm//4KUXbzQ6CdIUcNppG/mXD9kTwVBUdvz7HPEw7SgTK5kbr6uuOuELvfT8AEebUKBbi/kPN1gMbZKhswA8bZxFbNAOH3ayXdTunqFyDWG60FehdeHtILF8Be8nGc1QVg6ep5wegK6HM35FFNPOi8WIRzJZViLIjbt3i0QY/r2XpoJK3xFV+9skX8O/jhxWc3e/L8oaVaHI2ElHq/Ru9Tw+VoHdA0sB5C1I9Ah0fliXTEJsBLbLD6mURbAVJZL1vT2OUcYCjr72gWvSZKseJxmK5fHHB8a4smPqV9vDPNVFvVz2zPQNTaxLmXnCTB/fXT8u4C4x67mW4F/GnxW6XjTPpZErqWGhoeYLxZEtnm+pJ93PX/IRgko3s1wha7o67AHANBfi2wn2SzzDkYwvVcoqaGnQV/vl50r01/rWOKXhDWAMdLhOYwmlrS2SvDNjUd4/pVntLd7SkOyyQMPt16kVaDVJB8xIEdLnXq7T3dzAkylj3x8cFfJhuY0ATHni8rVcUF7BhcVL1eC1XnUzCTC2N9x4gOxI+DYKkcyrys8380iMT1EFcme0EvmOr3JFjHWCA1OzPcVIVQd3uf9xbe/bi6PZqZNqSMYC0BKnd91t5ju7WxAwVT+/Wj54M7cGxo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66446008)(66556008)(66476007)(5660300002)(4326008)(2906002)(44832011)(8676002)(64756008)(8936002)(71200400001)(86362001)(38100700002)(122000001)(38070700005)(33716001)(26005)(186003)(54906003)(966005)(6916009)(6486002)(66946007)(1076003)(508600001)(91956017)(9686003)(6506007)(6512007)(83380400001)(76116006)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ORycFhZpGixaVQJ2sTIpHsmpv1acKF8wRGnOikD7fbU4ggWuw1l5uq4Fw2l0?=
 =?us-ascii?Q?vrfO034ocgwXOmXBwKZMv1q0YC+oqeIB0ARNHAV17XXm1KpCqPvTkCnFfTrQ?=
 =?us-ascii?Q?iSF4R9wVwljsirCD7jHcWC1k86JXxbvJ2jA8qc8VDJrdgzFxVc86YkU+jIkW?=
 =?us-ascii?Q?6bbsQv1WIU0dxk1bSaa9sTrhDZJkhCu9anAqh6RCSybgHXDyTKxgnVrLw+Ca?=
 =?us-ascii?Q?/5vv/2tbRclZm0dgDaCuMCynBge9G6qgGmGLba0kkvNp704OiplnrzGigDnq?=
 =?us-ascii?Q?zazjyYNytvUbJ6trtSp4wUYXwIBIsx2j5zWmjPvCorIRAqK4+FYbzY3OrJOq?=
 =?us-ascii?Q?jwTFcdRsdC9B6Xvx6e5nCD2bpGfoz0DN4ugeEwNLgejOYI77t7Pb+APMJORN?=
 =?us-ascii?Q?JnHRySC1tTFE02bc98cFKwOAOZ5YtKtkPGya9A43wqloeBEkKeZAn3sIm4A2?=
 =?us-ascii?Q?Qr83pj8+9ZJ+gOvf9RGIehhwNiTn8Dh8LPUJ56TnWx+nm2jNUOFFcZ1Nvee0?=
 =?us-ascii?Q?t2OjOUJ9bX8gzbyN4QZw66ELPHa6Dw1/2bQakVsChovJ4k8tl0G80Mk2Zh9K?=
 =?us-ascii?Q?sFpf+JCuTxZT3OrJC2z5UFR8yINxaOzwznPEWePO40G89/O+0xUhhfX85/kL?=
 =?us-ascii?Q?FeIvA8mHLFeQ/dJ2oMLrg3n20tvGJryblKpkBIZscwtiBPnoM9eqtnKYVZDi?=
 =?us-ascii?Q?xxJUkwFiFgGWrsGzNCcgAJn0H80hTQ5hKkqWTFo/EcW3Z29LzOoKpuFFeJ1Q?=
 =?us-ascii?Q?1/Abu2w3C5HpHnbD9JsWanavq7aanV/ivlBgrAAZw8Gn4Jm7FvUe7RRLmsJI?=
 =?us-ascii?Q?nazWuS31ruSFiQyvBWmpF1FMoUAF+sD/XGRBYMsSxhwAmBwrj6wE6IslFAtU?=
 =?us-ascii?Q?j31/PpVnrVyxzUtHuelmKl0/+OlTi6YV4ZTkN6LMbH1YT0cBc6r0txQc1TJU?=
 =?us-ascii?Q?IF827XO8hmLDoWAgS1KPOEbVboMKfRz8FRktOHmZcAwjqKMirLgpRoDjH1Ba?=
 =?us-ascii?Q?iyzO8bneB0EbjBpS09caGhhgFo79vEDWyILN0RP8f65cnOXHytqv6XeiFjE7?=
 =?us-ascii?Q?k+eo/QTkJ9yRkgVl8oX8peB629gUvhIhyNc6kXbj5ZXC12KU0ESVT1IBatCM?=
 =?us-ascii?Q?VsG2+72507t42XI+OpCwvGfPAMmLnMCRwGj9zXHPJnaUScZDpgpeRI+Pi58l?=
 =?us-ascii?Q?ghqUejhqORauRVoHEVMIXiZGy20SYAEXSeD6t7d2uGCGn2ForfvAq6JDqzed?=
 =?us-ascii?Q?QzQ+KsSX0LpvuG5JSyoq48nQ8pMeQ6v+cG+rLoi2wDJGi09II+bYsxyfL47p?=
 =?us-ascii?Q?z/igV7LPXd/MASsjMib30t354GYWAqbZInw3o5Dj/hHBmpnSoaPV1aATy/NO?=
 =?us-ascii?Q?JXAjL3mzQYkJBco+oW2tDYa8L1wzHs2tG+k+RRNV363+F2OmMnekELBmCFEy?=
 =?us-ascii?Q?iIbC5YyZBFxUsuehRDfJJjptGCR5UjqyHcVLTOSbAJHwf9ELwZjegMFNzQtD?=
 =?us-ascii?Q?uaK1HlWSBUSY4WIHZSj3MVtBQzVKrmGOUeZyvPijRhvxi3j0S0JZmjlfixY5?=
 =?us-ascii?Q?lQg1/FpWZM//E1u5h3GUZy9NPOj/C8sUKh3l/5UE34v2FsF0VnM3/pkb9dtX?=
 =?us-ascii?Q?BpG9sD9U04H2WdV08trlyl4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <801ECEF38497CE46ABAED8324DCBB688@namprd10.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5d42a3-3c3e-4221-a40a-08d9f8001046
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 01:42:20.5764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bt/IZULZpEJapimPJrDH4F6RqArHB+aE6WeJKX7qhHunVyXrvbnD9h1XkgN16oDAGfdr3bUeHrpWjZtyP1R+1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2082
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=885 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250006
X-Proofpoint-GUID: DqjDMiZyoYE195qX4DXKDtPujCtP3m2_
X-Proofpoint-ORIG-GUID: DqjDMiZyoYE195qX4DXKDtPujCtP3m2_

* kernel test robot <lkp@intel.com> [220224 02:50]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
> commit: af49aeae1748b573a3794a6283210928a9fc8d0b [6806/7915] mm: Use mapl=
e tree operations for find_vma_intersection()
> config: arm-randconfig-r036-20220223 (https://download.01.org/0day-ci/arc=
hive/20220224/202202241512.jmoQhMEv-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271=
fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Daf49aeae1748b573a3794a6283210928a9fc8d0b
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout af49aeae1748b573a3794a6283210928a9fc8d0b
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> ld.lld: error: undefined symbol: find_vma_intersection
>    >>> referenced by shm.c
>    >>>               shm.o:(do_shmat) in archive ipc/built-in.a
>=20

nommu requires its own find_vma_intersection as this has been moved from
mm.h to mmap.c

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org=
