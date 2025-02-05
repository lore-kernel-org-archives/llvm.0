Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A4D1519BE;
	Wed,  5 Feb 2025 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765176; cv=fail; b=kIwYg4ME88votbPQJDsOhgVDsozXtUIz2x4soi4igvBIwHIoRyt4DQrbqsso7HUiv2du6ji7eElnHQMgD0VrMQP+gn8oTZ7KShAAjJEFibYsEl7rlLedRQBQgZqWjc8f095SPzN91nBi6FyNDRHJlagN7rqrdXBI/HdGH9aeEtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765176; c=relaxed/simple;
	bh=I2rC/pSXzDmYi/F3FOkoTpIRZS6YxjytJx7r/q1gE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vlj2aTtfGA4Z0covQ7ZlbOhmrYoXMqW72iaN3os4x9sDPY2+yBzhmArJPqHVOIu/3y2jFd3UBDukzlrd3xtrKZdAymo+Te6eD9FDUIILY/gg0ggK1cgse82MIDErcdqmcW/0vIoSHOoVxnxRJnKVw9Q1v8dehABU+d0gUqxstp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AozQgbOQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dLBerE6y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AozQgbOQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dLBerE6y"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRi9g010340;
	Wed, 5 Feb 2025 14:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xpg4s8VmlWZhHxII6L
	aT/7mHgcOKYXsMyV8nm5SHsmM=; b=AozQgbOQEwLJyTNLVYeqS1+l5vfmBxsuwE
	BrgpLcrWm8udkgEjklf4h8q0OskvbdlT0k29F1Yb+H+NRaVN4TuswvWmqHmkGPRt
	SgH9RW6QyxJPJ+EYVCTkm6x4eWy7PNiw9G7Z/B7IgrpzAnavB0bcyQYyVdoKkLNL
	ShHQtkaZtAEcl3JJKBibLjQZQ17Fh7SopjcmF3Rf9KDQCRT/SVJkkXqmnDmPhe5c
	9CRTMDRupVgB0RPPlfMK9VDsEP3ZnrFgD0rYT5xpsGHSaAeYXjbooxB5SKlK71QX
	Hm5MxGnf2xSy4i/VXwngLXl9yYAtQjEHJBelOQ8ifHFEf5FAMdVQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cghg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 14:19:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515Crivn023549;
	Wed, 5 Feb 2025 14:19:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gjcvmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 14:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJHxlhWQFYdU4+EdNmwarrSWglxt/sTe3yP4zX15ctwY/YDc6ulHtz3xHvTDx2Yv5MDAvk0DWqz1ACZpgwwnPiMRPdjiCpDZw977NEJ8txV47/QcveBBW2IcHcfKBqbOmy24lIw91GXpPdlTPcmeZ3in2YJDmsEMWGyUtqmjJpDzdAp3rpEtpDJQlD0ep6jEAfajNOkHHO4XC/yoTI3kP0BimHqExTpUGjF6jsAq93eYo4gdZF4g/AWgeaDaZlZWAE733F+TawsoIddVXRO4sdK4ML2x0MxCxZ7eJvyXCGBiP9MJEWqw5DpIKVY8gL5PVIBjmRAlAig9dIKdEaR8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpg4s8VmlWZhHxII6LaT/7mHgcOKYXsMyV8nm5SHsmM=;
 b=pOJA5V3ALn4EBIT0alS8WSfyxBsa1zO5l1y12Z1yOPOdmCVVNPZSG8eAawtHnp/ZRE//KJa34lx3vbB+86Amyc25rCfAH1LQcIWlhZGnGytF8/UgrOZu/Pg9Ca9PzlnDrlwfHBx2/OAz7xBoP/F2ahknySCgmCtmzRcH9PsNhA/FfiBppkEv5s/JoTWCpJeqI26TqPMGJEgpCdtdzEkgmp1AXg6bhurRLyKvB3MwYvxCTIKLj7YNfuP7UuEHsDD4w2mwRMBdifn9DVKU/cy/11DR0s3nh0b7jpwm4iCgYQBU7H0azEq2VnKGnabgQTU+hcaiUCXm7m6QxfyxndCCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpg4s8VmlWZhHxII6LaT/7mHgcOKYXsMyV8nm5SHsmM=;
 b=dLBerE6y2uCICBedVpW6ekMGlyaRhb2zZz5jrfv0Y4w/k9psYvWHYzJnp4LNdq12Nt4NeXux73fiDXBZT6vP++fmvSjcmsUXJz6JB7A8GChPaGth+8TYE6yGKQQhoWYaLRiNkaUDKSk3JS122JLVHtazziMq0hYqHArNa5k9fA4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM4PR10MB8219.namprd10.prod.outlook.com (2603:10b6:8:1cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 14:19:14 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 14:19:14 +0000
Date: Wed, 5 Feb 2025 14:19:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Christian Brauner <brauner@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev,
        Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.all 10/38] kernel/signal.c:4091:3: error:
 expected expression
Message-ID: <74f1ee66-5369-4a16-89e2-0914ec48eef4@lucifer.local>
References: <202502052137.74NcNNI2-lkp@intel.com>
 <20250205-backen-warzen-9f601999b5e1@brauner>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-backen-warzen-9f601999b5e1@brauner>
X-ClientProxiedBy: PR1P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM4PR10MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c78383f-7aeb-41ee-3549-08dd45f01189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Ga3Q5Ney7j8LGdn/WHN3iE5jzlaL4zA6YrcsC3C68sL9gsu+FxHBOnMbFf0?=
 =?us-ascii?Q?fdU7UlneiCY5OWE4/lJBGIFO8ZmWJl/16R76LNY0QlicMmsE1ch9Jl2gBlhe?=
 =?us-ascii?Q?DJIbvj7RLqdwtDJxCCVNgnmGrS9AhgS0B09mHd5rJFGgmNYs0OwiTHf1bWtf?=
 =?us-ascii?Q?xMYj7GT/iLHqvyGQa9Zwu3qatQKQl/rFr2459qk9UoPyJMOePDH8ESdtBtM9?=
 =?us-ascii?Q?u1DMruLdYWeXWxLv0JwPjVyiOA+Vd5Q+oQfuiEcTjNUFnsE4QdhKYn9RT5XW?=
 =?us-ascii?Q?96NnmJvQFAsIALwQ8rRacowgHGI+YW0UG6UwuNrjYhtrPVlMPFPho9TyuhpA?=
 =?us-ascii?Q?B2gtgEOmOkD5jrgWEqDSRfHjoFwaLOXZDpN3EPp0LxLfcKn4Kdbop5vo7wwF?=
 =?us-ascii?Q?MBpVNqNcP3VILG2wfKrZlT5bHh/T1GA/lZ2ZwTSUyx4vfRzspS5b06HLsBrQ?=
 =?us-ascii?Q?Nbl67cWGNKpcXUHXvWrmEHDSqRWmptRpxSgxWL63MKfl7jhmsgDyOGWHPkZZ?=
 =?us-ascii?Q?L70nmofM7aMzKfpm/4bY6GMnmXSaO4W1eM4YaB4Y9Usm8J6ljiv6njYdViS4?=
 =?us-ascii?Q?b0hQAxHDlrwaBQaCVaEABBtKQgZWkmauspMn/hBauJq/pOrTGNjt2InaMJWU?=
 =?us-ascii?Q?+2FBaxQGlFXPcsO6lRlI4tL82xSwb/K4QVe4CtdAIPkhQj+3vcHCVCwF8dD6?=
 =?us-ascii?Q?5UDVI4dXyXOiMR6QzG6g+uUxJB8+wdLwv1jWXychgBOUQC8JXUd91q65/B8U?=
 =?us-ascii?Q?/C3M4N46YOU+jlYFbgv3TPuWkaHCuFylBAnu6eR7mtzUDjrI3pFS9KCxO/id?=
 =?us-ascii?Q?cS/Lroo/IsSXU3IZKNO6rIdIO8br5jU1rt8TY/oVwohKHog899UGAKpbRLql?=
 =?us-ascii?Q?/eOyCgBLelTHBy07WdGQuxsBlolCdBb8gKPnQSrSwklpzCRgRmVixlzhFVx9?=
 =?us-ascii?Q?Cxak64pdrMQYPayGjbjVuvFflnu8AmYOpz2x5sLP9zK0BrgTnZJz104slWMC?=
 =?us-ascii?Q?Em8OwsdxoeOD+FxX1jBIVB4C2k/jEkagdCyucQ9YgH8jwLfa8Yy1uxLBuiQL?=
 =?us-ascii?Q?gdIARouk4skM3ELVm2AozU4wMBL4cYsh1Ts/70HkOc1Cxgk4bVupJZnSPLV2?=
 =?us-ascii?Q?Hy5EOWqH8p9I7ScIQp9NcboLDeTSzD2JaOPw5OXhYp2HNtyLXXFvnS52bvsJ?=
 =?us-ascii?Q?EU5b6wgnZtIeW8EDiEodJ5vWEb7lFcyJUQdD6P7jGfhbIl3rCeiGODn/5QTG?=
 =?us-ascii?Q?8VwpBxYfOIZdbZktsHyxTOyQyCQyajgPHe30hPyZOpdDb4AoID6cxrjGGzd2?=
 =?us-ascii?Q?xTr9mUeQ2jUtgdxHYQ7e3RIbZiDAOPbk1vvv2h6uCwsuzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UG9mR+CKAxHMtKva1PJ2blFTP8FJtbQANWqrbUZCpWZNlwHDp/a8FBjoryYj?=
 =?us-ascii?Q?QRIIr1SM7iS4Gdf2ZntV6HCQAK/6YdwozM0pwuomtMCXQvIdffr2VqmzW4yE?=
 =?us-ascii?Q?4Ve3lPDtnqjQqwqi3p529uYfH0gHKYOAE2ZQyXSp7aPUbYxbalyL15YiKHzE?=
 =?us-ascii?Q?hohhCRAVOThh4fi9s4E1hQtOmm8zA8ytIIWQeOBbVlLN8ezVqgftNV8IZLMz?=
 =?us-ascii?Q?61ZleGPZgvZuj9lEc0yfP83HKHir1JILzXFGirYs2GuzS0+1V7ZIgkEHAcAc?=
 =?us-ascii?Q?86KXEVgAt16Gih0NfuGnmHaLeE2/4SDyGHNteEJIKiWR0r3tRq15KW4aOVGh?=
 =?us-ascii?Q?HLE/O80fBHMXODTAdehbyS2QhplrHL6hCuEhS7UMrv8rxVhxhkLacUDpZJw9?=
 =?us-ascii?Q?rjxh52SLDhK0p2KRmV7FLCtubhfs4gfRWDhF5PNEoSvTx2qOMEvAA1UvZ1kX?=
 =?us-ascii?Q?ay2imF1jxm7vnS1qv3qWiguKH6yVjJ8RB9p5czPJDKQgDUnokfPXneXnqgav?=
 =?us-ascii?Q?9/gnQysaNvPJZF+QqXrZ+t/pZKfqOyDNBs/YgxpQqZaSB53wsmgBzP0QxLu+?=
 =?us-ascii?Q?ic51iL1vaV4NrQTfBlOx9wnqn9cXkFCojDdNPwXaVG5HEXvuckGEJpqwgazm?=
 =?us-ascii?Q?bWRgHZCFvDFoilNpxPI8eEpREhowNQ8BwD/9Ado18H5QTlz7unjhBa9GDV0d?=
 =?us-ascii?Q?rQkZGKbnBkTf3p3GCeqXDa6ZfCBB/ZmfPa3PSnuET4I5r8sztWHNu4qkGs6U?=
 =?us-ascii?Q?t2P6ELlzZXE45Tl909A4gl6n+h6sL0fWkOFrxzNtDOqsyg1Bo+do7IFiRP/2?=
 =?us-ascii?Q?g/jug6zA19E+joE7tXnAko3+Jlesj1GpL/PKrFH9f/zqtU1/yb1nbHxd1mt7?=
 =?us-ascii?Q?CgDSQmECwp/7xLFvBkodVUl78KRipUPL8XrFj2hIr/O+iVSYbSFyoBPeppfb?=
 =?us-ascii?Q?NkWkNbKDbAJMteszjB+0I3e7FEu2pRqNbk/zkHytnevY7FxzWKT2MHlLoxTR?=
 =?us-ascii?Q?Q3rUDcV70VNrz8DVFESZgiNXRmbN2aegzIqWBIb+Uc/RkfflwwP+uZ4zC/zM?=
 =?us-ascii?Q?tFsk9v7TaoUbNH6traOhpXAUrQaE8wp782sDRLLHLlm2BwPOb2DS1Sk3s90p?=
 =?us-ascii?Q?d13HT2YEALP3f+QT/Fwzn4vxxxziwhbbwWD+Leb1Ou4ydHWbNM2CV5Jrpss6?=
 =?us-ascii?Q?8KOwpg2KuV6VKmPSH46j6HX5YS2NfvEh/vLwBJdurmOFhP5ObTxb4zKEjDhX?=
 =?us-ascii?Q?eksEj9iV2fyERu36RQxyYnqk6BPIjCAp+RfVBi4Wjs4ZxYFmEVwakM+WGAuX?=
 =?us-ascii?Q?qvmlzOWyN2T+0d6zoyBTYUdBQHKd9h53aJ8zLwgbr/S8/2FcDsP+BqHhhI7X?=
 =?us-ascii?Q?EO/i6tQO+/xsVQPqfDX4tDOZOYulmOHXne+yq5GNZIj0DTx0jt6b1sOdF7zl?=
 =?us-ascii?Q?80S/bBLi4T7Iqa57vxlVUNsBnolifHn2XiIyvoALsF0NBdbSIO1bfjofkyiL?=
 =?us-ascii?Q?UHc7wUzeDItLjEJU+n9csa0QmSYg4tUvWuRqXsZFHcf8ovOotQLM6gZLudw5?=
 =?us-ascii?Q?lDYT8C7sGTtf9+S9aMLbfiLzjJGrLAjUH2AONLJgFbW/mQ5FuQ+WiapTEME0?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PXHq+lZQSk5j9dwu4ZAfmYAnhzCBksLkyu/Rt6atpjkgtyxdQO6UTZKHkfACEc8PRFi8ucQplUEGS1nI6op/TwAx0xiCDXTevEzdACIHAE6RT9m9/UcAOBMnJBaZRQ0hEntVX944lvpZOaAeSnA/arDeJIDf69M8T+0oqnUgjWq6BXbsE7L/mxwbYvGvxCKmanD0gesVdmhp7tTDtvxS0G5ggJzM6O86xoYc4+YaNbTiXKJr8sI3Jy4ve9r8ro6W4aUNfbmTFkxwrdn7dYzEi1VhH4otkC34NXSSuK9XRWfbVs9OiDP/jA9B5iNfqLBxxjc/pX6D08+KiOZk0dEYiPGZ5e+d5509/VZ3/E5UWyUbJYDUVD89TwTVtWTokI2inKHUJ3/sm2ZlmP2kkV84/iXfjUZPU31Ri9CTmLp8TwaKxczCmhTrT+S9eNDD8vjMDGpVj1+EeRrN3r4fAxUHZJBouKk2Che4QMkuSAHsU9IrhmtCgYc9maCM4+XGfyhrfiA0ye+2rb65rLDAcw3Y/W3xVkpc8euds/vX+RhOBDGzWJBplO1DCANhUNuEfOgLNVqvyWJFJZ+4jjqSfpkwPUJMjPbhflp83AYqx5Kgn6w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c78383f-7aeb-41ee-3549-08dd45f01189
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 14:19:14.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR4Y1Ziq4+l5fxh1i8DxyDOonC8x1XltS6WPeItIdvl4KKCmQRPXxaZmr8Isgainq8DGNUwu5bG9Q6Du2KHKekkaIzxKM2Ckt1VsBPSUXoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050113
X-Proofpoint-ORIG-GUID: bZdq0ykZtu7Nlz7_Uya4Kxt7lGoBbGaI
X-Proofpoint-GUID: bZdq0ykZtu7Nlz7_Uya4Kxt7lGoBbGaI

On Wed, Feb 05, 2025 at 03:17:46PM +0100, Christian Brauner wrote:
> On Wed, Feb 05, 2025 at 10:08:56PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> > head:   d740eaae6bc3aa29d1440413f482b153264df85d
> > commit: e6e4ed42f8d8be56bec57c864e07437fc887a366 [10/38] pidfd: add PIDFD_SELF* sentinels to refer to own thread/process
> > config: hexagon-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502052137.74NcNNI2-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> kernel/signal.c:4091:3: error: expected expression
> >     4091 |                 CLASS(fd, f)(pidfd);
> >          |                 ^
> >    include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
> >      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
> >          |         ^
> >    <scratch space>:140:1: note: expanded from here
> >      140 | class_fd_t
> >          | ^
> > >> kernel/signal.c:4092:16: error: use of undeclared identifier 'f'
> >     4092 |                 if (fd_empty(f))
> >          |                              ^
> >    kernel/signal.c:4096:30: error: use of undeclared identifier 'f'
> >     4096 |                 pid = pidfd_to_pid(fd_file(f));
> >          |                                            ^
> >    kernel/signal.c:4104:15: error: use of undeclared identifier 'f'
> >     4104 |                 if (fd_file(f)->f_flags & PIDFD_THREAD)
> >          |                             ^
> >    4 errors generated.
> >
> >
> > vim +4091 kernel/signal.c
>
> This is already fixed. I forgot to add {} in the switch statement to
> make sure that CLASS() has a valid scope.

Thanks, was pulling vfs repo to investigate as we speak :P
