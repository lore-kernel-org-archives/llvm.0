Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD2814
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 13:41:15 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252B9mGH021180;
	Thu, 2 Jun 2022 13:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=T+66Y/xnwdCtG8VoIVTDquPg0wd+t7qFeafoFwc+Pko=;
 b=Cm0nNZ19yUg6LguRNShFbAwTlbf/C8y2YhZ/sWxZ79iCWK6t35hOtvIe8CrPpTkOUFNE
 CQ9Sfum9uf9CJpB7ACh6PzEBrNHLO3pkGLBvR+SYm1HDkRrbB6wXzNaXtOMzshUyBC0A
 uoayFpEsiGCKd1U/5PryPEvY0LUOKBY9KiVneB+at3yDxu07+jhKrF6vsRzURiI/7KZa
 j2j/+eli1xYe41HuStEIl1R+j1nmCG/vkJeSOmttQXDptx5atLuH3rDvDIJbv9aZekZ1
 mRx6zynhWjmaWbp4lopk/IbRwLNPDH5EXKT+5Ow6BbdZTYiq/nJsL+orV80GeLeS+pcR WA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcahtfbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jun 2022 13:41:05 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 252DaGSd019966;
	Thu, 2 Jun 2022 13:41:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gc8p4wf55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jun 2022 13:41:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlEC4LNWJC+suTLniScRBKCGTPp4cWYCmjNdZnHpnxaAZWtNI2leYt0gmmKMvENDDx9dWcqboVarM8/YrQS2xrL9dgxO0Xc3iA5aZlVMwi8/QeCc6p59/+XGWQI+Rkq8c5OpoMJPQs8ZiltAA1nG3McwsDF/En+Cm+41jfFZiJEoGvMIoJyGKqSLY0D+nIsht2K7k4tH31dRAsPDsIvG7vkuFEyxWCboEeirYEx1PE7NDtGkuBfmE+11CVXoTp+rlQzkX2SRRtSehHuxDRo2Rd2vGaKdIWPlwg6ydRupEwsgJUshATAbz8Pheah6f2OVzvyhvcGGtAvt/XibQieo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+66Y/xnwdCtG8VoIVTDquPg0wd+t7qFeafoFwc+Pko=;
 b=KiSj9ibwY9J7gJorIK/zvZCFMODmJsfMs8aPCjBp39U5Kx1yjmPKcTI9rBJeCnwlqKLGM47YfrnvcR4jDhYfP3gxrFJI0ZqzewORPI+GXXPELG8jWyK9CSGqfgUk87fXsikSZdJDBz1dz3TlWIhlU5yFvE6MhAiaT5ngEYi/8/CAQUZmKDtxBvApGWG9J9G5xFyaiyhnxZEJNZXL7+3aVh0q2WDfISNmKC68gBraRmcur4JeaGIdcJ2QtHYo/ljxjjxthc5CVjGot9EB9LoE1Aw3WBxDb7m6aSn8vJaetiFLkbaPd35NWmFiw6p97vb1xvMgS2JtA5z6lOpUIJorYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+66Y/xnwdCtG8VoIVTDquPg0wd+t7qFeafoFwc+Pko=;
 b=nTdqdgxb4DbO+g8+W+RclyulVUvAPQ7jnzVPPk1h6AgBFRtlKa/JJirPh2/dIFOac0FVQ6j0GUcw0XADsaZ3wpa8/5OXoXmlwcsrfchq2z0Ttrst9kG5zFzQ0kVb4SxRCbHkNq04GEPBzinLrdkFYj2fdalO64LnNLUoRtZ2oA8=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN8PR10MB3553.namprd10.prod.outlook.com (2603:10b6:408:ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 13:41:00 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::e1df:2e42:6674:313e]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::e1df:2e42:6674:313e%7]) with mapi id 15.20.5293.015; Thu, 2 Jun 2022
 13:41:00 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: kernel test robot <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org"
	<kbuild-all@lists.01.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 14545/14705] mm/nommu.c:1081:28: warning:
 variable 'vma' is uninitialized when used here
Thread-Topic: [linux-next:master 14545/14705] mm/nommu.c:1081:28: warning:
 variable 'vma' is uninitialized when used here
Thread-Index: AQHYdoQn4zqDEOR1uEOnjASBXUDaC608H7mA
Date: Thu, 2 Jun 2022 13:41:00 +0000
Message-ID: <20220602134053.cyuvw7ema33voakf@revolver>
References: <202206022121.RYk2Zgc9-lkp@intel.com>
In-Reply-To: <202206022121.RYk2Zgc9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f3b16dd-fc43-40e6-df1a-08da449d87c5
x-ms-traffictypediagnostic: BN8PR10MB3553:EE_
x-microsoft-antispam-prvs: 
 <BN8PR10MB35539F9F2D2D91830784A12EFDDE9@BN8PR10MB3553.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eqt2JxEcTsp0bnej7FWMvPj6/dL66yYFvzNRI5VR/67vGzCt3fuFFR3vo8pVkv4Qvb2khGfhpBQaU7LKqNkS3bnk2CLEUz9xUaZmeALWDcJOOgD+zMSPcCr3xt5vWOHM3AzLyJn0jN3zVK0BmAIK1WNxMjpUfLyq7soU5Zu4pR3XhQc4rnGX/yYYrUwV8RZtDEV04BVz/5/pgwgrOynoqDFr5qnszmV+y+UGdDfveOaxqOzQ4D4DQvm/jQUya9HnFsONk8cIaWOsStY2BKqeMKXKwH7in0Wn+7xDcSCMg1p339fN849BC2Ju4ZpVP+BgighFszm5DzD4MQDS7HfheZH/YokSWV62xml6LhXfTq8Gl9wRGeF1lNqeg+KaI4EKu9jG4nZbZwxeH2vBcG7Jy/983zfJkJKO/E/rUhrIczYpJsvop7vbIX7GODxV21gXMyad33KyWDLJlVna3VQprl3UFt3BIO5M7BOMC4yb33wK3OkBBqvbVFQZNOJsy8UEDI0U4gE/HG06HQfvHXU0a4w++Ym7ZBfPmI8R7NFCpmlgTHEe+yKY850mecw59RQxTxai+BCqUwykRc2QnvhZ+QYyu0ut0b6pYlyfB3ekYH7H/HeJJhFdCrwKYvaPWlZ8AQTfpC6ztFJA1oElLKBf9SuVpzuxb0TQ+2otMKGOJ/j6+vHkYP91WTEHiMpIQwwOFkr3L0nC3LwVxJGuVj2VC0O+KKTEqEi0wX9A7NMGrIoIT+zKgTQ94hOveMjHT13ZYP5WyH8/LnyzIfMFWWTm6UdpO8o2he8I21bpUVPLh9XPsVMbKX+fW093F1z2/9hl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(122000001)(186003)(6916009)(6506007)(66476007)(66446008)(66946007)(66556008)(76116006)(91956017)(33716001)(316002)(71200400001)(54906003)(64756008)(8676002)(4326008)(2906002)(5660300002)(86362001)(966005)(508600001)(8936002)(83380400001)(38100700002)(44832011)(38070700005)(26005)(1076003)(6486002)(6512007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nd1IUXa3ZKxWNNPq/Yh020qHVHk+p3I5XNdfH42cMZEVEbDE3/aJGTTBfqk2?=
 =?us-ascii?Q?VHYDXpixUeDCvNha1jMzS3cWg8SOjnRtxBSoOMkPPjcnYWG7VErikSfrKaE5?=
 =?us-ascii?Q?3s3k2kh6qaLm6R/XcP5UZtAENUX/gHJ0AHykQwbn8rWdxndFxE0fa1g/t6sv?=
 =?us-ascii?Q?3NzP+6EOXpGknWaY9Q6P75vt712OzhOPj00VOit93F9MRrZkZpPqQt2PcRt+?=
 =?us-ascii?Q?bRZ6foDSOx7X4nywFIR8njw6NNYlPk6xx/Xckota3nyFjr3R/iYTvEWSKz4M?=
 =?us-ascii?Q?LqvfR95EIF/Tu8LLITBS2ASBTKr2TVcnjvLacBXh0g8IjldKxcGedohFRwFi?=
 =?us-ascii?Q?Q8v2hYTF4qvLEinetZLIxRh7yt20z/YosjmOBDozrdwkUu78O11DnyKDgQVV?=
 =?us-ascii?Q?jY3VOaojY/QGGLoGrmGTMSdeqBalKsKn194MwKjQ6mqIAqmrx+Yqof0wpr+h?=
 =?us-ascii?Q?DPE3M/xLwnfU9jGS4Bzu5Sx5CyxXmxgH5t/qbjgdU1avv7HJpf2ynVzrOCXE?=
 =?us-ascii?Q?2a9uCJGFGIwj5NozhgaRWSWOIOPwYl+L/VEOuXwdWWg7MdFOYufZZzz7WNGn?=
 =?us-ascii?Q?JRVdQG3Hgv0oR7F/JLa0CpBoi6zNvEs2VWygYNv8nFfqzgsdDR12GQkjoCYz?=
 =?us-ascii?Q?jMWr1mz0NrEt1KCkeWQvGJIFkrrA6AEAAEeoAD1cJ652V4Ru8c/KIFiErtf4?=
 =?us-ascii?Q?6vY11Gr4xG7ju2AFgmn2Xykvv0pAV+zAcsPJUtVkGp8ibBf/Ijbm+c05HXAv?=
 =?us-ascii?Q?sGoJd4eXVQnC0rS3l6Y1D6rBmR4LNuMJz/aG1flFhAwO5hktNgXQ9kzwXtyi?=
 =?us-ascii?Q?clAKpK2DycjkDPLeG2271rzS/5caHgOX05/mNnU+wlvCoPDjLI/rCT1jg3qG?=
 =?us-ascii?Q?h9cxNh+lCngm3q4BjpYh9hcGP64+uxNSoV0vR8fJSUAPlCmzvHXvfFbVXIQ+?=
 =?us-ascii?Q?rv36V66wNyQHSs+wFdbFYOd90+OWfubV3JZVt53o5828xf6NlTzBNzWZ7W4v?=
 =?us-ascii?Q?2c8Pp66g4bh1szBH1ZcNT9kZNtbJfzxDbIYXDPXdx+MM5yxPYwOE3bW1O4IP?=
 =?us-ascii?Q?iE1ENqaVGWDCRPW5vT6VkKz/eZahNcnKxMnH9zulGiUUJpUnmc5z3EginkxI?=
 =?us-ascii?Q?ZvkjTlOUsK0kB2MNschD6Ifeq0aD3VXCqiHlrACVCye+aj6tGZWETKINxd3u?=
 =?us-ascii?Q?Q9FX2vVF7XsP+zIxUfEkQWchyfNo/Ge2IrJzQ4hF6cq/IO+9OC1uPLwcyifU?=
 =?us-ascii?Q?2ZnhHi9jZFGZkghGdI3TlH7Np/vOQGDgmw8vZgQorRJsNFVoh2bOzFVtHXt0?=
 =?us-ascii?Q?sQ/MXDS2isS46HPh+4RLBH41aQsTSfejUdt7S+AinbEQeCtWkjq0NRTb/5UZ?=
 =?us-ascii?Q?z0/G01uNWCK1f5fpbHpGIFnzCYxH2LviIDSppLiq6ww6AM5dp3kRDolooMob?=
 =?us-ascii?Q?ppKVzrl3sYUZsXSOZHiiOfIiM/4rtL/UOkrKA0G0M7wGQnaI3HNM2bNZsYyn?=
 =?us-ascii?Q?bzAFhWQ7lcWwggtCJdNC+5qge+krNSzdFYnlrPQvGrxE64jWvmoEpL1Guz5x?=
 =?us-ascii?Q?7e5QFXCxdgu4xJZeAon5t30n0FjcH109F8HcvieXHUbFNR47BR9Cwv3ldwvy?=
 =?us-ascii?Q?I/6jf7lsL49/OooTkcpUfStn2Wn8beJRwaydBI+AeL0Rcfz1zDJ2ErORYr2m?=
 =?us-ascii?Q?wQvvgQApDSKQWKV9Pd/YN+jbpDqtrkZ5J2Xr2flgjCYUf+RlL3m1/VUSiYr6?=
 =?us-ascii?Q?cH139c/RZ2kQwi98cXephl0S9vV0GiI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03D10EDB8BF37F41A97B5F5DE245F6CC@namprd10.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b16dd-fc43-40e6-df1a-08da449d87c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 13:41:00.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6+4CZuKkhSI8qniEVQYRVRgA1dbJLWaaog3N6QZcU7YXYNA4oW7vZlIZA7/G+Mys9sUKtEf51e0WETshSAmVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3553
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-02_03:2022-06-02,2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020059
X-Proofpoint-ORIG-GUID: 0FsNh62J8UwvSkn3oPr3FUQISKSdz_ot
X-Proofpoint-GUID: 0FsNh62J8UwvSkn3oPr3FUQISKSdz_ot

* kernel test robot <lkp@intel.com> [220602 09:24]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2e776ccffa840ce53ee1c21bde54cbe4bc102c3b
> commit: 32355b99dd92f9751a482463d7e239fa06302bc9 [14545/14705] mm/nommu: =
move preallocations and limit other allocations
> config: arm-buildonly-randconfig-r004-20220531 (https://download.01.org/0=
day-ci/archive/20220602/202206022121.RYk2Zgc9-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364=
c76683f8ef241025a9556300778c07b590c2)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D32355b99dd92f9751a482463d7e239fa06302bc9
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 32355b99dd92f9751a482463d7e239fa06302bc9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
>    mm/nommu.c:593:18: error: incompatible pointer types passing 'struct m=
a_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-Wi=
ncompatible-pointer-types]
>            prev =3D mas_prev(&mas, 0);
>                            ^~~~
>    include/linux/maple_tree.h:468:33: note: passing argument to parameter=
 'mas' here
>    void *mas_prev(struct ma_state *mas, unsigned long min);
>                                    ^
>    mm/nommu.c:594:12: error: incompatible pointer types passing 'struct m=
a_state **' to parameter of type 'struct ma_state *'; remove & [-Werror,-Wi=
ncompatible-pointer-types]
>            mas_reset(&mas);
>                      ^~~~
>    include/linux/maple_tree.h:505:47: note: passing argument to parameter=
 'mas' here
>    static inline void mas_reset(struct ma_state *mas)
>                                                  ^
> >> mm/nommu.c:1081:28: warning: variable 'vma' is uninitialized when used=
 here [-Wuninitialized]
>            if (mas_preallocate(&mas, vma, GFP_KERNEL))

mas_preallocate does not currently use this variable, but in the future
it may be that you are storing a NULL which could affect the
preallocations as an optimization.  I will fix this by relocating it
below the vma allocation.

>                                      ^~~
>    mm/nommu.c:1055:28: note: initialize the variable 'vma' to silence thi=
s warning
>            struct vm_area_struct *vma;
>                                      ^
>                                       =3D NULL
>    1 warning and 2 errors generated.=
