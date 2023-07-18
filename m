Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0ED50F;
	Tue, 18 Jul 2023 17:10:48 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IGuM8h016716;
	Tue, 18 Jul 2023 17:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=+EIdaP4SSgx0j486fZWGF/FAUyy0lqnUr+5vSWFlh1g=;
 b=KrM290lHb6p/J4VQ3MO0SQWEyonushXtY8jnS9VPZnmY9WzIYK48CWMJQMgfHKLn8dPV
 QAbh4THPHUiW86hzASwEm+aFR2PHvhg79xvNkdaFIPcyV95CN4geMTgwbV3uzmeavM0X
 jCyqtRoYkTvE7QiBllPaOM6DNjG+KXt9Q92mIPlDLbQWJCFZ+tcqRdoJ07gUjUmbklyH
 AdCMNUY4Va/JpwfiRiZKjRYf6fJYr3AndDXObbCBUUljKN/G/1DeKBAOhT7mRnuzpjeG
 tJlKMXTo9dpQpo42zOv1JYpWZTAzbz99hRSuZW3yGsDXfIaPgoMyMjdpYttqC4KJZ/Fk Kg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3run785k4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 17:10:31 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36IH3jVI023902;
	Tue, 18 Jul 2023 17:10:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ruhw5nqht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 17:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGyKOo/xKF7CpV9J8wafma/mxJjw3jo9gOYxqzwOWOVbJtz2krTI7QlsZmrbVMZje91h7kxYJACGIAhqXGTtyRzcmcZjpJfjFD6T2svx/gjAOCaDl2GlrQoRk3Chp5Z7ueC4lEGhd0ZnccuHnjcWdAdvsA6QMG2ahqSUC2GJZa271Lp41QaifMdLdKHOxmrm03lWn1QByfCYqmXvt/ytnyiJwszkkHNvZ/j7/kGL4pOs0eD3XAXDYnD2sCuWo6Mi5QsCgHZjS2wxI+9+iP4zc3yeXuydX7LsqmT2pDAt/lhKFmIeYHQbj9wuCshJ80gK6YKYrt2tgbAMT/hF4S/Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EIdaP4SSgx0j486fZWGF/FAUyy0lqnUr+5vSWFlh1g=;
 b=aO5ZozNFEmnZDeyEXqJnCPSVKvTVhqXMSJjPr/C/f/yEkDusO+jjV2p3YLPB2Kke6Tcdt03y5uIcVZcnouHFNKgg/wDsgR+K+ANBD0jrRUHtyiZcdwtZvuRHNZEzHpvKaHyH6Ea3LmG9KpN7OPHftsaqi/APYeiSa8FCEP/QRzhRHwi3T6s9DTQY6tILTlzb5mAb5TWMgOEYKXWsHMJhvVUXY5VdQ/kVNF2DxUs/L0VpLKNfOFzeBm3/x+LGysblhBAjJoZ+Np76HmIq94GdCQcXkozXa6vnynLxHb7bWr2H1l8mYn8yYyR1b3d4Z6hlhHxdw2gIrdgeQEqb9WiCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EIdaP4SSgx0j486fZWGF/FAUyy0lqnUr+5vSWFlh1g=;
 b=YQuMbOI4YymjVuGmttTe8H+jwMl5+IyQcghnMczqSITsr3qQ9Qxap0J1Da5rnT7gikaPcbYwnTAijdY3VwACNz+dmz322QOshB1lLYLbLiFryCs2v7EoTnCZJSRJPXKbWjGKfHQumXAukvVXpFyrVDK1etpGUJYuQVD3drlfsdM=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SJ0PR10MB5663.namprd10.prod.outlook.com (2603:10b6:a03:3db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Tue, 18 Jul
 2023 17:10:28 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::26d3:6f41:6415:8c35]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::26d3:6f41:6415:8c35%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 17:10:28 +0000
Date: Tue, 18 Jul 2023 13:10:25 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 209/215] mm/mmap.c:2430:29: error:
 assigning to 'lockdep_map_p' from incompatible type 'void *'
Message-ID: <20230718171025.vn67ydtjifawkvqo@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
References: <202307180750.Dk6xL6nG-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307180750.Dk6xL6nG-lkp@intel.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SJ0PR10MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2ec1b9-81b0-4fca-e8d2-08db87b1e23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eLUYN05yJf3lRERll4oHF8T31Qaj96A1Ibk2Ymw7yddhlaAONxVTX3oACjRa4oQ1dPrln2z0Y8C1MB66j+d02xVpOorv5ZqzmShxDVAgFsNUNKgYiFDUpzfqfp3T9+zI2RxdzEI1nTsUeuFlYEjo/I859Bk+M+yvbBFXuwJ+xlhg7f0md6+ldTVZlSRxpllre7G8TO+/zgefphpHMcpqXLg9GpXLJ8rdYLj3Yvnbn7/vg9aJybbuHBaQ2S2RWL4PI6KnvqSDkfi/OS6A7mPAG5l4U2YWYIIUFE2hQ1W3e3X3uiU1nOqrajoFbhnQgsaFRuPxgewPesYG6YChlkhG7Id7UMXSfX6RKIeTvYsgg4b3XlDaxS85qdWJ1BBUdHnITtKDBXiHRqLCrCxOKu/rzwZoQBwuDdEHEQN50DBkTykYTZlzGbIKgmLU3046kKxcPM4IyvxakQw2BkebL+jNCm6PuoYRM/5OtP8oxMx6tnxmfpZoYfMESFDzsScki3plUBC07W0R9v0AvuFu6fw4fdijjnDho7hp29fSlvunS74=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(6666004)(316002)(186003)(54906003)(6916009)(41300700001)(478600001)(66556008)(9686003)(4326008)(66946007)(66476007)(6486002)(6512007)(8676002)(8936002)(33716001)(1076003)(6506007)(966005)(26005)(5660300002)(83380400001)(86362001)(2906002)(4744005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lv5a0da7mh76eK0k98NNvW8lSreDqU40Q8x750cg4BHXiWQpSiUICt+OQSsZ?=
 =?us-ascii?Q?XjxWDsFibrCr1tdvupd0FqwKWvWXt5JQZrsFmj6j1sBdMHujHZt8OU857tYJ?=
 =?us-ascii?Q?5v1ja/ClgvAkwq8KemiViVxLqIZFO3pOU1UcM+kNpGqNWBEQ7ldSZeqFOdB4?=
 =?us-ascii?Q?pxf6TOD/2kx5RqM0zaoatLkzPJdyA3bi4+zqTLc0I87B6G6A4WGSjoswXo9L?=
 =?us-ascii?Q?GzZVb1y2Kji2TQ8Yho8f0ixPxjoOH3j0vMXS5YoY3qZUwKyTjaxGQ2h8HiRP?=
 =?us-ascii?Q?X+NMF0DTDhyDtPtGa9CW5APcARntCSOQWr8Ds8tocQnw6X9t5vT7w1Fk1lZk?=
 =?us-ascii?Q?0gcGUxpazERXz+Ds9dEPp1hy/ikQLt1aQqN8qPsYS60RXQfAZO8bq0iMwnuj?=
 =?us-ascii?Q?iADu2nI7fh9C6Q2OS/cay9yQ8QhvedY5rXbT9wke1/ZPtsEqSDPUOw9fX31d?=
 =?us-ascii?Q?Sxu6BGC9otRv/jDkbo64GjOMCuZdF0YluYRAfYfmp8XS3K6bfe1Hqa/QLiyE?=
 =?us-ascii?Q?b8A2RivqbfaH/Z2mKrBNBddmTUaYr9Vl37VxYN8ux2r35wt2IZupKpCTCl9C?=
 =?us-ascii?Q?bWTcWSYnUPjaLkAmMmRf6MaGI2BPcDhL3S++kbHVpLq+X+09knlp8SRuKUmN?=
 =?us-ascii?Q?k/kLCHd2YdGvD7i1lt4MQO+zDaqmjnui3v8zeL7r4rUEFMswb1XVL7rXXSy1?=
 =?us-ascii?Q?IJIanvBwU+zI47Cqo0M1mJ1ZqoggrSERW/yLFpaWyu+yI6Jy4L2Q3JU1Li76?=
 =?us-ascii?Q?UVtAWfTad3WZkFMComjHny3pNo9vTmN8QXQTcC3B19bS49R1xs88lhuydm0w?=
 =?us-ascii?Q?8di9+f0F/7FO0+G6moeMyCEMLlagUnkhRjw+j3BWD5njMIgMUD1h5X3sbiGM?=
 =?us-ascii?Q?GqYQXOmXplsg6nNtMTP1gvgjLo9mEoHLlZpRSyxDMdjSlQ9b4zFqZFFB3GmU?=
 =?us-ascii?Q?eOge45bJo61ypYrGJaaUkuzxsmwR4XQ97ar04IVSAtyt4FJKGm6lkLepF8or?=
 =?us-ascii?Q?nEARbzw+QQwHdaa5lc1dr9+IxIS4LEUdNrVxwalMqbCpNmkb++v99jem+Uuj?=
 =?us-ascii?Q?8fkw83qo5LUd/BOxZfdmjkngqajgqoIHLVR5tgAbVhfhniGisCdAWkNsSTzG?=
 =?us-ascii?Q?9tqeUcouxDVLgzjlwldPohu+yaJExAswqkpP++Zi40Bq0OpzRLsVocSEFJ1B?=
 =?us-ascii?Q?nEtPoReAoAbcbkvQSqgMrT5lQge4VOHDH24XeSrRREbHwjYpYlYt1Te9afUs?=
 =?us-ascii?Q?jthBw+LnUVfmyugE/Db/bdKyCsUWT2r6JCcv5yjJifFb4izoYan9YHQ/NRgv?=
 =?us-ascii?Q?kuhahacJW11QUJIalab78m1eUnvmoaKPw/PQrsecuUJ6QiQHDppuoJSiNLY7?=
 =?us-ascii?Q?y4UPBjmlmkPNxtQ4NcxXnF835Rgop0qMRp40kJTrwB/+RZ8YVuWy2yD0QjQn?=
 =?us-ascii?Q?STMeFgPGDm0DSUO+Rk7mKokX7DbCi8ZdHqADXXGXV01XilTC0v0NndG+OQno?=
 =?us-ascii?Q?rSY4GzlnfMMGTYTAvcFcWwbn0blgeYgOd7NoZDemWYQAip35oESNyNK/v3oD?=
 =?us-ascii?Q?arpxRU8cfqNY+2nzuUvhQZOsXKWutMr/BLUX+uDoBgAAdfijcVz9j3LVPzXq?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IcyWVk1It0SfmQyex3zfcyYEjEokMbUi6FbSUBi+nys28LS3xeLepYfe4oJZn5QMUwFJu1Wmf/27Vzu4fQAWI2vEavO3uD+o/wcY6StRzDZ+led9atA5Y1SfXujUhFtN08AFnhTUoR744swO9xmwRKfAclz4fLaDgQASlhhPRE1iO39J07cxvKrl/0bFr1kxpG7LGOquG4K7CSCPlAD1+WyIVtr96A9xQH51qALYPiysoA/moCCfULFn6k3N6s4d5ie2FGJiyjvO6139UCNHnMO68Mjhl4fvMUIYJre1BThtSKyZTcZSjuS5o6NUXVyjIN4GWJigfSbIURO/LVgS7GBPi+LCaWjHp5GeGQ6zjGxp2pj/aZPoQ9SNSJ7OFldbPGFYQSnnzRVV3VO0cipzSiR09lwk09SQBUfwMk5QushSsacSBW56EOwkbvmFsxUjhH1+9zMEylkOcpCL/EGmYMpc5KL2zao0dKUiErroqb9NT4TQMSpXg7hAe+8XL2D7c9ruNqfNs7/U/1KCm8sbBsfSWLavCrudIbj+0wo0lu4xSydXWo5O01yeTMzYvkM7N9m5dp6ZeQHfPlvwTfyktiPko2c49xiMKbdaGebNKJZykIV3c1vRDIc2PP4BpjbZaFe4ffMq3GEP7OF66OXuZQSfYCrkebvk4L0GiRM/NUL1iQl9mOPw6qdn8HHqk5tnDxn6XdL9DZ38Ppwgc5ofdHVvRr0Nlo4zxYx1dwXEkpFaTmibQZAXanCpAlLEsqiczHEUj/EM9l4O8z5goryxQ8wMY7r98WK7dC9iFACvDFD4gXeMR49I5FcKD6hGHOx5F5joi0QaVAuZTRq1rcHZSpiLra3frNfAQ8YcEmVjFhrKVwDof1Qx6HmM9V5HcUtI
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2ec1b9-81b0-4fca-e8d2-08db87b1e23b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 17:10:28.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74hBfX7HSOIdkuw8V59pDeLyoemuVBtGminLh9+RvH74P7FH9NMBgWlcDQ/cLOdnVMP77rY5xXXsJJHTNYpalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_13,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=996 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307180157
X-Proofpoint-ORIG-GUID: 13sA85ueEIb3ok7YnMhfmdbI9toIgWax
X-Proofpoint-GUID: 13sA85ueEIb3ok7YnMhfmdbI9toIgWax

* kernel test robot <lkp@intel.com> [230717 19:36]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   75ac3c8cee9c94691bc9001fcfb6214ae812bfa8
> commit: f40b24c7c416b304b93115d66d02dc54e5d2f7d1 [209/215] mm/mmap: change detached vma locking scheme
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230718/202307180750.Dk6xL6nG-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

Just a status update on this..

The above config works with clang 16, I will reproduce it with the
periodic build of clang 17 once I locate a copy.

The llvm repositories currently don't have 17 [1], so this is delaying
the reproducibility and fix for the issue.

[1] https://apt.llvm.org/

Thanks,
Liam
