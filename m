Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9469C18023;
	Wed,  1 Nov 2023 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hI9fZjHH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IOyYU1hH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1Hilgb006462;
	Wed, 1 Nov 2023 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=BqPqh/DJw6n+BVQ1aLGp2fQcOhAokJ10PfnsVHYwWlA=;
 b=hI9fZjHHxkcOgX/ixzTYdkq3npOk0la3bRdci8+MAu4/3kJR0qK3o7mC/Uu0dEm1B+fZ
 9cop7IPFroYImCa8GIG1YWJexObLShd53KU7Z1+oMqScKiWmnq+MXFtOMzrrNFSCjIuu
 1Rs/YFAXbQB8BL+2IYxPANMsqO+q7g6p53EOL3ab6Pq8gIUTKnHbSfwYy8AFyKVLREFr
 8rGDUTSMmD/mOdlZGdZoLNF+qvNaE9fEnNA+heafMitTjUERK1B6HqXI1JtXmBZJY+lM
 CFu8duuq11g5rcVcLDTNdnWwcoT1K1cmHegcAyPPtbqGTw3yGYtuLQWZVbxk94sVgdVC Vg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0t6b7wse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Nov 2023 18:10:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3A1HKNfY020069;
	Wed, 1 Nov 2023 18:10:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rr7f953-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 Nov 2023 18:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+r4aOLrBtUNXLG+j5b3eV2XEoolSHRfJtlvVCNucIWKVtLhGKV5kbR48IAy6UJK93ebVTEYkhRnghjQI0cNg7APlMEBRbgYo8UYIVBLhHTX8VzBjjZBfQqLQbz2qt8rRdplOiI6wyLKNoOOiUpZVWzbVzz/KG0RnCoQNLvncTs/zHv06t23z+o49aJEbs9IA9jrbMQ0sl6FWcoMc5WhSkemfegNh0Ct9SSWl37xa+2rc3pT/gxcOaGoYAhKPAjDIupDg6LBWzc0PL18B1gte7eGs95NiZL2/8C8tGLSEnP8Qlk/RCmOd3x0R2eXJlPDGJ1kscVontFOE3Vp99GeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqPqh/DJw6n+BVQ1aLGp2fQcOhAokJ10PfnsVHYwWlA=;
 b=UDjyXhRvB4vHUi2J0vLSBQznzD4MECjhttoFH0uxJJ9B3CL7mdzQAyZDQ3KFv4w3XDujlL2jxyMYlA7MebZRvjDZQbjpvZ0ZaQMR4BidaCfIQozfQ1YbeyZS1lYh1QR8IaPc89WxkY+14LmxhfbOkyLBwBdrGlQnqATKiGmcoDYz2w9xSQvDD+PwI4YX0b/DMfs+KXY9Ukzsj3uwhkheTWkuJT/CH9gkqYKnZ2OlmrrD+ZEzeqsDI+afCJCod93gIbbN3sHhigzswrIr1tcK+9tbQvRq1csqgcJebgICipUn6zbGtCYkX6Zy3TLpMpaqpSnwr/k3SwFTdSEDlBP0Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqPqh/DJw6n+BVQ1aLGp2fQcOhAokJ10PfnsVHYwWlA=;
 b=IOyYU1hHvFvUeNTUp1NUFWtdPJJ4xWuGp9/NCLZx4yUpNFQHt56sgSBMYKCjeCklTRwJxDJPHVlkOi/eT6Yu0Dw2j1wrBruIYuEsxgThA04KADSncziQsqCkaJbRsvDKa8ftUdfgD1EtZzU5To+Fi2UC1TGSL/sj7jS7gQvhHG8=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by IA1PR10MB6899.namprd10.prod.outlook.com (2603:10b6:208:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.44; Wed, 1 Nov
 2023 18:10:19 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6907.025; Wed, 1 Nov 2023
 18:10:19 +0000
Date: Wed, 1 Nov 2023 14:10:17 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [vbabka:slub-percpu-caches-v3r0 5/6] lib/maple_tree.c:5524:20:
 error: use of undeclared identifier 'MA_STATE_PREALLOC'
Message-ID: <20231101181017.neolf35sfitd2z4w@revolver>
References: <202311010201.ktEJKmQ5-lkp@intel.com>
Content-Type: multipart/mixed; boundary="wvhi4t7qq2wtv3me"
Content-Disposition: inline
In-Reply-To: <202311010201.ktEJKmQ5-lkp@intel.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4P288CA0057.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::14) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|IA1PR10MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: f82e8c96-92b9-45f9-3058-08dbdb05cecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oW8xmQ4me0MTOiHo8XsNOxK5ohaBLdE+2ST1rnQ91aoPFlJOOngnu3SKd0TWr2ty/nq73Y2RiYi5Ka/XPlTaYzAUEGKrIEREHblLsVuvwP64zuJG9kghO6TmBmWtYClXyTkecgHD1ql7m2gWoA74myKO5V2OrHKflcDkvkCfsX6GuJQ3fscGH3zflt5Y3fFjqPJhMsAgoBdIrwfUesyC18Oh0X6ujx/xbeyZ2LSVo2s8TjyBAi+71mBnldbQnSaHN+dF/tsG1GFcDDXpFztyOW1gecm4kiU/TRe1mOiFD24IdPYSdsUJQ+mMfxQXRx/6u9/clxUwfnBYtRHWtmlB5uKg1uEdVQF9yNdONDSKPXsC46qkhOfMzfV4F09K2p0j2tW+IUEg2xpycAa4Uj+r9htBkGQm7FnAgRcGn8GlY6Tf2gJ8BCgP805c6wh9MyBONIA0DpcryCJ99P9BYzf84Klju4A2/Yif9TU/QHwF1WFHNqm0oSGIYBp9ATbdiBJWevvYYpl+1ZjChp1AratGq4oQSFxpgBFZ+Hc/d1G4oR5SGOv1lmk/CayZKa2dKXvZXy0oRsk2ewc9tX0JclgpU1SMYRDs5iFUbuZCqwLsTRJx3qqaxyPzS/aPUWXo1W9PWmnGUgL6zb5rVLsAGoVC1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38100700002)(44144004)(9686003)(66946007)(6506007)(66476007)(478600001)(966005)(86362001)(66556008)(33716001)(1076003)(83380400001)(2906002)(8936002)(26005)(235185007)(6916009)(6512007)(41300700001)(316002)(8676002)(5660300002)(4326008)(6486002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bLeG0woq4JVn6oz6i2iBgS8Ckj4oLFipW2m5LRXTiEDKKVPXymXqLrfMIWd3?=
 =?us-ascii?Q?9WS2lyOaqCh+wG1w1JIs77mc8e9M5biF5NFSSyVFyhFe66LitnMJX/CZzNE3?=
 =?us-ascii?Q?yRV/LwWXzTbpIrsXnRywM1hXliRdI1zI4hWaa+1nedM7bEHYdEv2iT4Azcm/?=
 =?us-ascii?Q?4GPT2qj+PTtrJmz85HIT6xl4uKh8afkOtdJn1yccTqguoxywsxrauIGxyVxb?=
 =?us-ascii?Q?GMNH5t6+Vla3sfd7MggEyAoM058OJDK8SKmEe6FcRMeGC5lCOQkpbswbBGg4?=
 =?us-ascii?Q?5i96RKF73ZM5+0aBGm84kwPORSICEPsEgY0lR7WyzuEAjY+WNQhN5mWWwzgd?=
 =?us-ascii?Q?4VufmHM7eeAIwiU84pYebT5iHdx3wK5AxKWLCmvwPJIRSgXBrRxiFfywfL0N?=
 =?us-ascii?Q?CONt59em02Yr/FW6MDx3eXw5rTbRZZtYMTw64Lc6BKYtYQywaloG2vaDeEkj?=
 =?us-ascii?Q?+MZcm4mMz2fN/ZibvZlap5nNhWPB82l7lSLuiTggw4YPp/L75PMk8ynZB4ZX?=
 =?us-ascii?Q?OuNdPk6UZhz2aVXmdXNQLecmJK703LlOCeJAu1WHdkFc1uiOvYEiqWDYrC8t?=
 =?us-ascii?Q?KhkxT3ecOCVpsK0JfS+IDH5WQ0ykU6NxpQEkUsrkUz3R6Y57aJ+d7NP7pnBF?=
 =?us-ascii?Q?3prkERaknElRWz/rPkPeAcuVCc5fFun0QLEqYCEoBTyr1P2N3kS940Glnhrp?=
 =?us-ascii?Q?CZc6p2ZfG38zpMBeBiTkW1XQ1EQkctQ1irOCfPqdz4SLN6JMxPuISuawfpCL?=
 =?us-ascii?Q?hT2gZsIxNzMRNMFgUICzBo4YFgtfDN2kFJtPu7Y0vAiWGvn0eF082PSNPgDP?=
 =?us-ascii?Q?E3otvHwEj//hbVSSZT/L2OWO6ARSbX91ikTapQG2/rGSzqD7riFFEq46AoKv?=
 =?us-ascii?Q?AweqilHOFsDEM1/XhbezAKY0ilDhyQZVEz1KFZOFq1EbiGArJWIEvClJ/fRY?=
 =?us-ascii?Q?QHRSrUhtnQVAUmstXHISc+DSgbbyRHrEFnB5CQQrJ0tEGI6h5CbsvrcJZeZY?=
 =?us-ascii?Q?rZhm+O+HIHaYeaMAJinH4a5QboRASST2lmwb8Mf7kfVOic6imbHPvnjELNlx?=
 =?us-ascii?Q?yCWoTo+Sp/w8KIX9mAr2VlYU4xnCSboNIXA5p2S08ICX5lFIt5ah+/A0+mZh?=
 =?us-ascii?Q?ePLHbNOIHZo/lKgmWRA3epvfEg42pwN2rqaclfzhoUZ/DrPRXOW8I7iVD0CW?=
 =?us-ascii?Q?NWv/Na46B2LAlCZCXpUKp8kkaLAmQIi5xA3YAh4JIsweo3Uco3opSWW/NhCR?=
 =?us-ascii?Q?aId3/hfL4YJUFPeeNZhRhMVEIZfiI/BUxzPxzWSvvCXpkkF8tWroa37awrH5?=
 =?us-ascii?Q?V9TFr6519NVWGsS7BuaFiYgnO+Ob4eSXqTSNcZOrAApvRpfUVbuz6ufiFaFF?=
 =?us-ascii?Q?WgFAWJS4b84nZxxxeUHeM8UJSNvMuqLu2azIQqzP4SYuRzrmLSvyXijUwurc?=
 =?us-ascii?Q?k3dqJhQK1gNSEMozTk854CBZ80tjJEgXD2Dxhl3MdkDUfUy5liq0u6iJkT4c?=
 =?us-ascii?Q?gkbESAjBEjhOB3Hux6UQkncfL7LY3E7fwl+LvfjBTw5FcKbMXoEOk5+ACduV?=
 =?us-ascii?Q?rcIi9zNFPndFKrHkkCU0jc8IgpYnjvor/m0ZRmnIxvG6vfZjy9A/N9Xnc55F?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6yxh/J5aNCYWTs1GV9kqa9k2QbbAqzZMazn+fXpKAIhrmzqOCwPLEZiDlyG52D8aeum5c17TeYZsL2Z1eF1qlzo5LLrrCrb1SZp+vMsl4aOGdRBr948nXZQwZPwc+vu6KtjRJkvuesv+KFUw+8ZBGSmght2rC5PMA7zWakDGknK1CSUKuqNNvOAnYqbJSaSo1UK0D/89iskSQOFjo9jhI74pwICyjyEeJJZ0O8FMReQMt+gqCS3G665ZKsDBCnR80jOcZQAa3+KO4dmg2VlZ8yGVe3sn9sSMj+uSu3+/CC9bhEJJGGK6kpN/oNsdDGmWl5Milus7HbdDq0xHx/s14DU5yIKpmC4/AI5CH+NpRq5on8+K6lG7ocHgfot8dF3/Ewmdo9+oj4P3DmB939oj6wfC08YioCpgxgnqLBlHSYtcG+jYlcThPVBVhejvaE5VzLIwmQDoqR3X0k/6CRGgucTWaLer5toIXwe1RX+q1zBJqcLVndUeKNOMTNezd1ahlp4b5xNx3B4Gv0Cuo/GrwVs6ht5FEF/omfjL8gXn8V/DK6f0DV2Zuvsy33xqrNrqP/gUeLLjJQK1axIopa5DaPML8psC+NmxYCVyeTaSWYODFLSNBf2emaCoSQKqu9Qj62Qm/9kVcBSHbBM1kKQ2Ld+GVsnBRKl6fQGsYHH5YJ9yz5gd8W7r+TBGocKGSxdJRwFv36JM0FFNm1EcTp50ycKXpFxydysjfn+56tSq+apUbxf8wYxUpeAI7D3BX4wCYNqj0gqJVHsVrzCmVZ83BHgUpgchByo2olOkKESmJqvpeybWXSesFzLSQsAO7hQ6
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82e8c96-92b9-45f9-3058-08dbdb05cecc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 18:10:19.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7KKyYipCerWAr5JHMdLRkmlWywfydNSA0H6J3vc9MOBGtHbBugBhsfs+dJIiPBiUY8DyAIPfnYNVS+gWgXy8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6899
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_16,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311010137
X-Proofpoint-GUID: XkJBb2CESbK_KG0OyV36KC0ipmrG8mjN
X-Proofpoint-ORIG-GUID: XkJBb2CESbK_KG0OyV36KC0ipmrG8mjN

--wvhi4t7qq2wtv3me
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* kernel test robot <lkp@intel.com> [231031 14:37]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v3r0
> head:   dd3fcb0bdf513439374345254f4894675bc88e68
> commit: bb07edc43f9f1a6119fa114f52d14df3f87e3241 [5/6] maple_tree: Remove MA_STATE_PREALLOC
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010201.ktEJKmQ5-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010201.ktEJKmQ5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311010201.ktEJKmQ5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/maple_tree.c:5524:20: error: use of undeclared identifier 'MA_STATE_PREALLOC'
>     5524 |         mas->mas_flags |= MA_STATE_PREALLOC;
>          |                           ^

Ah, this line was added between revisions of your patch set.  Please
find the attached updated patch.

Thanks,
Liam

--wvhi4t7qq2wtv3me
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-maple_tree-Remove-MA_STATE_PREALLOC.patch"
Content-Transfer-Encoding: quoted-printable

From af838134b03fb25b664b118fa15f01c78e68d91a Mon Sep 17 00:00:00 2001
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Date: Tue, 8 Aug 2023 14:54:27 -0400
Subject: [PATCH 1/2] maple_tree: Remove MA_STATE_PREALLOC

MA_SATE_PREALLOC was added to catch any writes that try to allocate when
the maple state is being used in preallocation mode.  This can safely be
removed in favour of the percpu array of nodes.

Note that mas_expected_entries() still expects no allocations during
operation and so MA_STATE_BULK can be used in place of preallocations
for this case, which is primarily used for forking.

Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 lib/maple_tree.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 124e837b3153..81f4a4f45751 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -68,11 +68,9 @@
  * Maple state flags
  * * MA_STATE_BULK		- Bulk insert mode
  * * MA_STATE_REBALANCE		- Indicate a rebalance during bulk insert
- * * MA_STATE_PREALLOC		- Preallocated nodes, WARN_ON allocation
  */
 #define MA_STATE_BULK		1
 #define MA_STATE_REBALANCE	2
-#define MA_STATE_PREALLOC	4
=20
 #define ma_parent_ptr(x) ((struct maple_pnode *)(x))
 #define mas_tree_parent(x) ((unsigned long)(x->tree) | MA_ROOT_PARENT)
@@ -1263,11 +1261,8 @@ static inline void mas_alloc_nodes(struct ma_state *=
mas, gfp_t gfp)
 		return;
=20
 	mas_set_alloc_req(mas, 0);
-	if (mas->mas_flags & MA_STATE_PREALLOC) {
-		if (allocated)
-			return;
-		WARN_ON(!allocated);
-	}
+	if (mas->mas_flags & MA_STATE_BULK)
+		return;
=20
 	if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOTS) {
 		node =3D (struct maple_alloc *)mt_alloc_one(gfp);
@@ -5526,7 +5521,6 @@ int mas_preallocate(struct ma_state *mas, void *entry=
, gfp_t gfp)
 	/* node store, slot store needs one node */
 ask_now:
 	mas_node_count_gfp(mas, request, gfp);
-	mas->mas_flags |=3D MA_STATE_PREALLOC;
 	if (likely(!mas_is_err(mas)))
 		return 0;
=20
@@ -5569,7 +5563,7 @@ void mas_destroy(struct ma_state *mas)
=20
 		mas->mas_flags &=3D ~MA_STATE_REBALANCE;
 	}
-	mas->mas_flags &=3D ~(MA_STATE_BULK|MA_STATE_PREALLOC);
+	mas->mas_flags &=3D ~MA_STATE_BULK;
=20
 	total =3D mas_allocated(mas);
 	while (total) {
@@ -5618,9 +5612,6 @@ int mas_expected_entries(struct ma_state *mas, unsign=
ed long nr_entries)
 	 * of nodes during the operation.
 	 */
=20
-	/* Optimize splitting for bulk insert in-order */
-	mas->mas_flags |=3D MA_STATE_BULK;
-
 	/*
 	 * Avoid overflow, assume a gap between each entry and a trailing null.
 	 * If this is wrong, it just means allocation can happen during
@@ -5637,8 +5628,9 @@ int mas_expected_entries(struct ma_state *mas, unsign=
ed long nr_entries)
 	/* Add working room for split (2 nodes) + new parents */
 	mas_node_count_gfp(mas, nr_nodes + 3, GFP_KERNEL);
=20
-	/* Detect if allocations run out */
-	mas->mas_flags |=3D MA_STATE_PREALLOC;
+	/* Optimize splitting for bulk insert in-order */
+	mas->mas_flags |=3D MA_STATE_BULK;
+
=20
 	if (!mas_is_err(mas))
 		return 0;
--=20
2.40.1


--wvhi4t7qq2wtv3me--
