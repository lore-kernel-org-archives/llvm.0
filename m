Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102221E9E4;
	Tue,  1 Nov 2022 17:24:43 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1HE7IQ020881;
	Tue, 1 Nov 2022 17:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=yYmQTMTHGrSBCsqB0/EHfgR82d0Y2Zrhh62/CcBgjZA=;
 b=JArYe9GkRetSJhWN6Fo8XxQcCegUfcpuHVXodC4XfuSfxuZKiTOTlEY8p7Zb8v1rCGtD
 7iouUCSxmtCwmT5C2cpEn62mDqFwWiIf+Y83eCenicNyjKq0N7H235+qHfKC9XHG9HIy
 Fo/hEpDKl86rhsosYdmESV15ls7HVcODn/MolTLE4mn8TRT7qXVQzxIFhAtvjm9dwZI3
 9e9ifihf2G/hEKj3TcEoGLbDtS6L9U60iSw5UzKngQEqWGm/YYJ0II2cBgITOeGTW0zo
 dQdBqFtcD3nASMPW7f+wpoh8hsovLM6135j/I3NhoN7SDroOEfFoNl2U0PNi1zICrm6M Vg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgtkd73u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Nov 2022 17:24:35 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1FboX8013923;
	Tue, 1 Nov 2022 17:24:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kgtm4nhmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Nov 2022 17:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAwCJcVQwNLHeXDXpW0XXgfni+xTQBYvsSc7kuS5IRSW/LlqlikvEKEDMJem4/oM4eB8g8mtxPWM9oyNXtoUuatPxPwx9pF5Zsj/B4kp/gytMLX0Vtth4bPHiwumExShlswsjohOoLDBBCX/7hgPBPR+8oo6KYz15YbUPH8PXeLPROqIGUlM8dQQf0Q90IWm79ZSEhepawKGoHWiquVs3SWyGUqUSrVMAcaUpdeK2/18FSAEvxGebRCQ9zXssqYGJPf40C6mAuRguhZtAdS6ZJx67H06vEOhsaOuqZ+RauHok4fOr7HwqR4TQUHu0a8NfQZu8HNacZvgYTCZXdAwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYmQTMTHGrSBCsqB0/EHfgR82d0Y2Zrhh62/CcBgjZA=;
 b=I55VR6MSmK0gKyn2KF0dWsnRDMuZVkIwqeTGYpP3odO2Cgs3VKLXxbBUoU3AdBacI/yG1MHol6xrBxfkcEct0Zjee7RFqus4Nt6Ne9puaEyTjDCwHlGbywCBrm28IOeNz1kUui5igWTqBnwewOVq83OEtAQfeKJr+ayNpUa3+9wqimgq9cImwuT1VVc4tW67bYoRnMA4i6oaMAm3IqE01CwS0GRBNGpm7p/bxoYjeIkvCZ8fRjDeiwukpMX2d+2af0Ng2VgYJgttCrTOdPJH4TWnp5k/Hqa6iwogjsrveFXURHkims/K5DK7rpKvuPqov9ETTMag1BK1mnME87OSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYmQTMTHGrSBCsqB0/EHfgR82d0Y2Zrhh62/CcBgjZA=;
 b=pvnnSd/mbUhVAm9GL25PSWI7mIujoTnhb8zjiO8ZysvC21W4Y+0aDj6MkhGtRwCY6Luqf9KzZKR2W0y4XZcICV2aPTayjwvpzRHFKYn9deOWUa66/ia18O3UfRf9L4CA57pc3Y/lBoOj2myKv2dTbJMEdU0/l8XM8gFK7lpZ1iA=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DS0PR10MB6996.namprd10.prod.outlook.com (2603:10b6:8:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Tue, 1 Nov
 2022 17:24:32 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f378:f1d0:796a:55a1%3]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 17:24:32 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>,
        "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244]
 lib/test_maple_tree.c:453:12: warning: result of comparison of constant
 4398046511104 with expression of type 'unsigned long' is always false
Thread-Topic: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244]
 lib/test_maple_tree.c:453:12: warning: result of comparison of constant
 4398046511104 with expression of type 'unsigned long' is always false
Thread-Index: AQHY7B04Vgz+XyEn4USEeGFj6ybT2q4pI8sAgAExlAA=
Date: Tue, 1 Nov 2022 17:24:32 +0000
Message-ID: <20221101170854.43lt42yokl34vemc@revolver>
References: <202210301224.r9RDzf4K-lkp@intel.com>
 <20221031161048.a2fd2ce1c210b9cd1a499cb4@linux-foundation.org>
In-Reply-To: <20221031161048.a2fd2ce1c210b9cd1a499cb4@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR10MB3022:EE_|DS0PR10MB6996:EE_
x-ms-office365-filtering-correlation-id: 1054bbf4-602a-4419-dc43-08dabc2df0f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 elh6WlIBGkJxNC3IgsOY2cLy6+W2ZuBOeQByEz+XqvxkPuGBFXaXiNVOZWCL7gEFs+jA7Rh2KzbSpYPBnImYfSaFacmSAGkzAGlQkEoheZNpJx+ltr6Cui0GL1T/xfycdzA6Jz9mZFGx6/T6dBsb6nPHxPntQjO/PWpK6/X9WY0uMox5o/TZHQQ9b0U4GrZYGgFRi6R1CjE/uEm5RQ3cx5pMW3prKw/eMYicS99MuznH02bF4B7ZXcAesDz75YNGkiCYTaS9rJPYE+9KcAi+QfdjYwnhki7k05UB+ZClJ2ZO0WyikXOVX8Tb/gYfjK6/BVKkcc8cRK4AX5gGnwoTKRgLlZTiC/mYGQTauvvuRh7skLdP5ASm0HSgx3dDvvWnQ9EGnFtjP9XnDvDTwmzNZQN6VVFOf9SObNQndEN3KFb9J0P1TLMvERio7Y5LJe89rtnesxOkxMxbfyHIfJrHN2aZWDzmLe2NunSARFcXiIUwwoyvodWbkOzpuDsiWh+95E56qvIYaQHkUnCaoUteGRb2hua6MxSHNFWFVLR1uhc3/LyJc26cD4a0H9Hp8pRiUASXPaD4LPGsPqWNfOUMegptxTgna3K76KIRLqKxJaUArMh8jBpQzIdOYnpyeXYM78UopPmwJjAjOJ1NRHSx6HGDz5uJQbnDrl6iI5qfqZAZXV8CAjFs87BDtdA7Tj/oT2XYts62ODwdpGpIifcusQJHPYkYQyG0VdOnX9IBBCaYIlPoj3Jukp96DfY+5PeYqIcXfr4Uo9KruSuLlx5seX2YgUY4oSgErXaWAXkSii8ZCEvKTs0ZaoAs2Wjf26z1i9X3L71FdRZtrihjfr4H9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(64756008)(1076003)(8936002)(5660300002)(38100700002)(4326008)(2906002)(86362001)(6512007)(54906003)(9686003)(41300700001)(83380400001)(38070700005)(66446008)(186003)(26005)(6486002)(6916009)(966005)(71200400001)(316002)(91956017)(6506007)(8676002)(66946007)(66556008)(76116006)(66476007)(33716001)(478600001)(44832011)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OaewwzW0FnzxMiDvL85GKN9pXz55P1gxiEqG1yctnuDQXLkxIvJ9P5sC0wD3?=
 =?us-ascii?Q?OcqZBYRJRG0uRs5D1dRvUnPR+1OiTrKHM/ZzNAKTS1Wuy89jWj9IoErSMflM?=
 =?us-ascii?Q?A8kC+l+tLnuKPt5Tu3Sl3bAsDPxuB1UWSHRGH1Y2GfD7TJHfcCqABzRuRTeb?=
 =?us-ascii?Q?Tjg1N24r4QzkQN/NcNF5ENF1qK5lK8mmon43Cvbm7ncZNCuP/HPrj1P7WGNj?=
 =?us-ascii?Q?um7coZDlX/eLE9o2kSG8jGHRQOAEuGPQsjmlOCslY/9ERsNoQlmiUb/zU3/P?=
 =?us-ascii?Q?p3Dv+HU9vJpkWtykFrM4JPMxLkythPjzXmslJc13/kHo4jCNZdzoAT3nwaqh?=
 =?us-ascii?Q?rRv0FEdTmEOc+S3tG7hc6W8q/9mxqlYkHHv+qNvKbsRhN1nq05lwy/0AehWr?=
 =?us-ascii?Q?zjkEMnh73KUkuSOV0FeF3Ilh85BSUvtFQxVRGSUgZw5au2xdGcLsz0qq6DGo?=
 =?us-ascii?Q?1/QE9Mc1uth5DpbXqT9Q4mBivPNsxSsRnx5a3T8FRXiJsR1F6IdbONO3um4h?=
 =?us-ascii?Q?ObGseXCbw+k7HQAnBVGDLfYRQWaJuTBAP+H7rogDouLX7z9z5kJC079dl/G5?=
 =?us-ascii?Q?XpWAwRVNhZAz8HFBSakY6Ubl20V/j9wY2I5WXSuekgwc6XiOMEkfU5It/3ec?=
 =?us-ascii?Q?JsW1cuwBQ2IkMpR1DQi3DZXz1lF/RYi6x6HcRhX1rYEzDthwBFP86eCyEj7Z?=
 =?us-ascii?Q?YJV2tDT1WU9VQ9wnyDiatWOd2Zrqq1Fu9PFPhhonhcGw4nQQxLyNqdzeowhN?=
 =?us-ascii?Q?NY83Gr2iF4UxTKPGZOIAZtO+7yS8kh+gqItUBOdn+fM+1S2itBDewGAUboYa?=
 =?us-ascii?Q?C1vs4fqXLZwaB6CfcV+/VV6P95PVmwVGbhfIoZsQLD/LKicjEW1LldClQ8FT?=
 =?us-ascii?Q?ZEckJ8DCIAEbkCcYtE3SSQUhnotSYDMgcJQl+7x10+IzyV5LA1ZVOmFKVwFL?=
 =?us-ascii?Q?/FPMtb61FoWComwEoeJPZHtFJa1ZJjCAnorPhoaQ83TDdLHARhpSFO2emzMT?=
 =?us-ascii?Q?4zYhkh5JxNGDzBHUATIYZKiPElNuAXA3n+IZ1AfkpWwKzgxoIIepfhbneKW3?=
 =?us-ascii?Q?8dBIQnbG5DgJ7W+pMpjHnplvMmviUGrkGCzniMc2+S6/uxfUfMNH3KbFbEsv?=
 =?us-ascii?Q?6sRsKE31KNC+O9DfuzkC7w09K/qfw4t0Ju+WQvO1uKPiBPK0HwnB489ovZ3S?=
 =?us-ascii?Q?r1ZPm+v4co96eDRk72jHktBEy0LcEGsM9VRkl7urJ3idCgiRyXuIvBYyeIxE?=
 =?us-ascii?Q?Jmsaprx4effR+t19h4nlOTBnTJdmu9/7Op1FbbiDuASJKJC1ZZS1SAovUHRR?=
 =?us-ascii?Q?lxjr+Vv0y07NrMaAnUFwY+mbO+hIQh2exZd47ucaQjIrNxPSc2PrYCFnqY+q?=
 =?us-ascii?Q?Ih3+pKmVIATsAlNKf2lDai0ttW3dF+GGvAz8reS4zWcqy9Xs7lUHY9yxqjqK?=
 =?us-ascii?Q?vrqrVUwRr6b3U8ldNvZV9u6cty+4QzMBTN2xijb3OseoO2aUZ5rZNmXSKtp3?=
 =?us-ascii?Q?1Sy5FCJySw7Z5UmUnFeF0xF0yppPQbMoTApDM3YEEuKOXI6SK/gxS4LQdT+N?=
 =?us-ascii?Q?zPjwbvyc87SB3Zx3d0QYl3oizaFdLLy8BLHdKZTvC2eboP++/I4g+qoUhdal?=
 =?us-ascii?Q?wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBDB1EE187812147ABD92FF0468DB8C6@namprd10.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1054bbf4-602a-4419-dc43-08dabc2df0f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 17:24:32.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iM1leFcH2WzoM3wkkylcTaHkkmrymYaIyKvRH2wyQtfN2FtzEfKlbWoGEycZBMrmkbC0aOqnpjymsJ/OemzySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211010128
X-Proofpoint-ORIG-GUID: LsB8RTBiRaSmZ2_-1uvYK5Q_vwzGimsk
X-Proofpoint-GUID: LsB8RTBiRaSmZ2_-1uvYK5Q_vwzGimsk

* Andrew Morton <akpm@linux-foundation.org> [221031 19:10]:
> On Sun, 30 Oct 2022 13:04:16 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>=20
> > tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> > head:   eecc1f68b7ae1e677dd01b728e58de61a2f8ae71
> > commit: d9c0ca7c6a02830de65fbc684cf0be7e6510737c [46/244] maple_tree: r=
eorganize testing to restore module testing
> > config: hexagon-allmodconfig
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 79=
1a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/ammarfaizi2/linux-block/commit/d9c0ca7c6a0=
2830de65fbc684cf0be7e6510737c
> >         git remote add ammarfaizi2-block https://github.com/ammarfaizi2=
/linux-block
> >         git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
> >         git checkout d9c0ca7c6a02830de65fbc684cf0be7e6510737c
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash lib/
> >=20
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> > >> lib/test_maple_tree.c:453:12: warning: result of comparison of const=
ant 4398046511104 with expression of type 'unsigned long' is always false [=
-Wtautological-constant-out-of-range-compare]
> >                    if ((val =3D=3D 4398046511104) || (val =3D=3D ULONG_=
MAX))
> >                         ~~~ ^  ~~~~~~~~~~~~~
> >    lib/test_maple_tree.c:496:17: warning: result of comparison of const=
ant 4398046511104 with expression of type 'unsigned long' is always false [=
-Wtautological-constant-out-of-range-compare]
> >                    else if ((val =3D=3D 4398046511104) || (val =3D=3D U=
LONG_MAX))
> >                              ~~~ ^  ~~~~~~~~~~~~~
> >    lib/test_maple_tree.c:182:19: warning: unused function 'not_empty' [=
-Wunused-function]
> >    static inline int not_empty(struct maple_node *node)
>=20
> Thanks.  A 32-bit build, I assume.

Yes, it seems to be.  I've defined CONFIG_64BIT on compile time of the
userspace code, so it's a pretty easy and ugly ifdef fix.  I just
haven't fully tested it to send out. (module, in-kernel on i386/x86_64
(at minimum) + userspace radix test tree on both)

>=20
> Liam, what's with that 4398046511104?  Wouldn't 0x40000000000 be clearer?=
 =20

I had the hex and changed it to decimal so I could easily search for it
in a tree dump - it was more unique.  At one point I had it as a comment
next to the hex, which might be a better way to keep it around for
searching if there is ever a bug here again.  I'll include that in the
patch.

Thanks,
Liam=
