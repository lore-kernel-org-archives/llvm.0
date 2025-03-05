Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688743AB7;
	Wed,  5 Mar 2025 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741154211; cv=fail; b=oGEmURu/KAIjjPtaCKrgOSwnrXa08VNhmJYbN83LRuU8yAd7E4W5jUbC5AC0Hy7Bv0zrQUTHHsVY/sC7UFKxZZ6BHYeXKID0hE5y9QhqQXlDmwDiUuS1+rESQX5osFfI6F0AV6osqTewbldzeStPmQUV/zDjOqtKD+XJ7Ea7Yds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741154211; c=relaxed/simple;
	bh=Ly5agLde/ONyuY1mbpPEFSpE6+BahkMMKH6EZGCH1rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DoPiD1hbtx9BmcM1d6XbVpGTaXc+MJjneEu3l32/pWxPs7fICwvYEIM6tYMGNTQnacqhHDZYf7fdLzFXOfGCp/r7YVzaOOd9ZSbZQ4ygmX/4EI8W3mdlwjx2SPKNCnYc4/VeNfA7ByNvt3nl7PNNTwR5rUc99qeyx2sWRikLsrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ff6hhXAE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nv/lCDXC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ff6hhXAE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nv/lCDXC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255NB6X013525;
	Wed, 5 Mar 2025 05:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5Jn1ybnOCIDnWz3J3f
	+/6CdE3SwT0mV8ERkgQpGCEuc=; b=Ff6hhXAEK4ZyvXQKcufmSXYa8WKn45ZiJ9
	/NalYsOu1POQb73bNc+NMgb5rokf2fuKiaFtnZYMVvhCUP7sCLFFHIpTy5N8BRDd
	MF/1Xu6Y8jETXl3pPsTIPgXh+fgzGMf/UCunIhX5/wtMU0km0C/2xYeUoPYGoZ+l
	U1D8Vpgkhf9buQZ7qFMg/sdoghaAEewAqXmCnaEx2dXfYTZkSzYmKGgglpl87YK7
	vqqUWbpVwmbtu6T7kMlBXEkvo1FV4YLL12UqhxukNylfAnORwZ0KmWFXui8Z65Lt
	Z6v1U8cBt2kAL4V2Gn4uDdhkEqYpq7z7U7VQvevyVni1q2V9Nq4A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8hesmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 05:56:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5255UFJT040345;
	Wed, 5 Mar 2025 05:56:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpg77kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Mar 2025 05:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1Atf3imRJIqT/xt6E7AMCgJ7nRHz9acu217qXQh/902PuNE6GXSE+76N7V6wfN7sv97FboxTFef4UwfULz095v+iVPq4Gk+VPQcA7XNkq1e24JpweqVz9b6vTsr7FDape4qeiqsbcWBAaQoQauQqbDhhsbEUqZDbcO0OKffOLE8FW1FbbMXJsQxEb/uJKphBwR/s/5LYEiHGIZMIvKmLI9ngOAV44o+aZ6KNxtVz4x+LvswbRUNyURMJhZhG5CgnzusscZ2MpftC2bNv2zaCDbfpjSW4QXx6+sfVQ0unuvDw7KolM4H3TsJaSe8zXzfeQ1HpVMaoNvd6/g0Yb0rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Jn1ybnOCIDnWz3J3f+/6CdE3SwT0mV8ERkgQpGCEuc=;
 b=x4ePyF05MQrmxlJf4R7b5VRrdKzMRdREA3sWhdSBs0pRjJMH7S7JW+yMOYPJyh2BVAJiy3EMG5I6i9X36wcDI/EUKCnq0FpXGJ3qytrgiabeDa1DBlzOsaqvw0aOMBWOGjCoCNrVi7/1V6iAexueESBx8Irx4DkYirNiFgfwlhTi+JXT5vO6E2WPu9eQCRcEmK1V5TKmuy/8tEzgl8ELpY6BncUqgPQd1r3FzkDoxjjWNdFIiQV1D3JFV5jKhtf6I5kigNNuI6R3qm7ZuCn5xRx1tyK7oBj+QgLsF3XaEBZrY5rv5niO91op3foa33zY3P6M+NQWkPZ7yRMWm4FT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Jn1ybnOCIDnWz3J3f+/6CdE3SwT0mV8ERkgQpGCEuc=;
 b=Nv/lCDXCdehP5iMyqSqvCiWH/v86YxmgmXmyNsemrn2SlSkI661Nz4Jk/FFWYtAwTEErBGsDlMFs/kbORv9QZ8YgNkluWGTT+RyfycsBZF7TTATiWUcPummR8csI24Jx/udvc9JWaW/6z+4XfkXAVmlUUuo7muCf+WWANRBwjeY=
Received: from MN2PR10MB4112.namprd10.prod.outlook.com (2603:10b6:208:11e::33)
 by IA1PR10MB6073.namprd10.prod.outlook.com (2603:10b6:208:3af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 05:56:39 +0000
Received: from MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c]) by MN2PR10MB4112.namprd10.prod.outlook.com
 ([fe80::3256:3c8c:73a9:5b9c%7]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 05:56:38 +0000
Date: Wed, 5 Mar 2025 05:56:37 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 400/415] mm/mremap.c:908:7: warning:
 variable 'err' is used uninitialized whenever 'if' condition is false
Message-ID: <9045c9d7-ab65-4d67-836c-a633a89e4779@lucifer.local>
References: <202503051356.jJQQ0DoR-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503051356.jJQQ0DoR-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To MN2PR10MB4112.namprd10.prod.outlook.com
 (2603:10b6:208:11e::33)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4112:EE_|IA1PR10MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e78c0a-9a99-4d59-e9de-08dd5baa7ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cs0Nm3p4ptmZdNSM+njWpU7oBu4SFAxUp7VcNM0pIcQXihCxiV3/dNAbtMhO?=
 =?us-ascii?Q?pRUkmn5DiMElNXVhCxofswr6IHzmeceFKI8/PhKis6qE++c76IKCXmTURCkD?=
 =?us-ascii?Q?KyRYIQ3r7D6RRFdXKtEKSiM+P36zvWoPP7vgE9Ew3pw3x9fDsObEbRuwss6F?=
 =?us-ascii?Q?Irf4Z5kHkqK6IQfr68eGRSNulVKfh1OATOs7G11daNzTdOF2wfEE+m6NGIPH?=
 =?us-ascii?Q?0B9wCTAEIvu0iR5Tl1LI4b+wmujOfl1yPOPMxmhPtzKRFFnR91klku/0iJWj?=
 =?us-ascii?Q?QCljaCQbdXgQsKY5b6XYYKLiHFZB6JJFLd0oY4NxUcnNEDt3elDdlt+VHQ8n?=
 =?us-ascii?Q?gY8/iZNagV3JZAdpOqji15yzjN2WFgJDv/FHMwen7k0a5WJ3DDz8DSZjUYIC?=
 =?us-ascii?Q?Msc1gglZGkJovG+99Mn00PIsP+c1ar15tabmn0mGzQu0mZS0TyYWDs2zIcKF?=
 =?us-ascii?Q?Eyk/gNBRQSWblO1VnlgI8UQgiY25gO0VFRppU1Q4UebyQnwLL1SFRrDvJP3L?=
 =?us-ascii?Q?/eJQS5Eb82Acpu6C/J3NDw6Xb2ByJYglRq08+aFYQHa+xhzLnZu6khTosvZT?=
 =?us-ascii?Q?15ieRxKDfsPmMzY6mMqUoeQG0H4SyMaTTCQAV5LETaM/3AC/iDKHt6D86YLf?=
 =?us-ascii?Q?5pthofWpJy8s7fYCtxjXhSSLrnVOFrTGpiL6tW+150hCicyiTIsNRxX5enyO?=
 =?us-ascii?Q?FbBUqpWbG8ms5hrjN/fHbgKVioWuiSE05/SC5Ed2yY7u4QIcdOtw1hY3236Q?=
 =?us-ascii?Q?m9x+JDVHJlOGhPQNdkMu5y3Fs3uBVwHw86VlA8wpEY2VPgO54LEJ/zAMGC2f?=
 =?us-ascii?Q?WcxIkUsj1h8gCNs5NP8QT6qpwYZAET/PmndMdP3xYA8TU6KdwfTgsegykVf7?=
 =?us-ascii?Q?c3NJ8Sezvip7QBxfCEtaDSEJ+iTGLtyOvehaoemAJshvNzspWeW4xOxVUEzO?=
 =?us-ascii?Q?q2ricPUPn2OCfMrokbIrGcmzimGNIeWoaY1+t0/V2OJBxTnBJCaNMahP5AN2?=
 =?us-ascii?Q?Yv1EMF59CmZJUfySeYOIhJVUeN3o/wbLCFap0FMZHPUXPhX575HuKawokwI5?=
 =?us-ascii?Q?QTdKF+pksh4ybSPzsP+0YlLqtoNJWOm3vBDy2ekWuCINZ3UXkTXl3Lpp9sV/?=
 =?us-ascii?Q?RvhqEgxoKCESY50NPtZbMeltyDsTjmcPKZasz8UIJCBdABcsx3iSaFhQYbsX?=
 =?us-ascii?Q?53SFr+BOyw0koB6gPeY3VF9mjhlH4XQwAJCOC9FOJa2c2Fse9KBKY0BNZdC2?=
 =?us-ascii?Q?jewHjKCF0pCjyGXjVN+G0rIv7iDRMtYANDNs6XB1v8+S153z7IElsQFND5eO?=
 =?us-ascii?Q?jub0rJYBpJH/Jp3T8eBFj4SZImq4kVLpSW5NUpngCmhpBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4112.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0+boAyDR8+PPVF6RQBz2ghMtElv6sMNGmAYNYRtNCF6r+2a/hkH1oFdjG8lJ?=
 =?us-ascii?Q?NIfffTN7aInrWurTzKOoLCHDIZiSGwPQ0jdVYULYSWpwB90+zMmMSjMEdU5z?=
 =?us-ascii?Q?42H68aiJ7U8KhNnwkTFzrEV0IZN6K029829bm4O3vsk/hceQsSFH324OixK2?=
 =?us-ascii?Q?kVIYvUgZaSuX/SkCXCblwQFAMvitUl2+w66o/VzkOx7Gl8vtz5KCvFJ4HasA?=
 =?us-ascii?Q?uuhWr9mACRkpdkuEjScXUlFOTgbOnb6G+IysDvx3fAk33r6ylQpIqTdqNDJB?=
 =?us-ascii?Q?bsrbAmYapdHrQH74ETMpi7S1y2QynPYsB8JrHmg4qVh6oNTKDXn4gD+1qrgT?=
 =?us-ascii?Q?k3/Gu/2chd9CT4blX840O15qOZq59vwWz9tVpBbCA4XQew42wUNiul6Ec7I3?=
 =?us-ascii?Q?dNnRA6PDvFMFcxXvFbtJ2brAPBoW2fKwb7SAu+meEARyAJtnzlUXiSLqV68G?=
 =?us-ascii?Q?hKRI2HPochT5E1LThD9oVU4BgVgAmoHxfyzHbIlGNO7AuDRrSHG22yY+q3WT?=
 =?us-ascii?Q?0sZh02sAZqidKFMSRavkIoeCpKrl1fMSVRjRVT9qL5enorksaIbzS1IuiMGV?=
 =?us-ascii?Q?P82X+kks1sWaLJn1tTyi+S+LfLJnzmnI39oxprhdAJ3gxoX0LScnUfYqbPSe?=
 =?us-ascii?Q?65e1kd/UHI+HaQ/R474oPq/mv2rj8zFu8keLkS+q2oHHNPC1wVvCXXlELBOK?=
 =?us-ascii?Q?kYB/xvCsXZVHawfZcVFa/E2R8CARLrxzItOstBjUCtPemT0NEtK1qAu2pmeY?=
 =?us-ascii?Q?vLgMEDu5i1VB0ap6rBSkCQ1IkAyPke4iWKCr5cIhUt7TLt0RsA3gY/g7Sz7M?=
 =?us-ascii?Q?YgLfjOMsE7TtC5wW3NzHztfsWl4ppa8jY58V2RY7NlAPhmlAREQEBuJoU6/a?=
 =?us-ascii?Q?zrmFVIfCRH/WGVG7xTu82rUCyiskcNG4q1AlOA7fdONEd2LkXH8B91QJYth/?=
 =?us-ascii?Q?nkhuoIZatQJNlVBTm4gDqo+W24g5UpoZQznJ0wNdhacJmpIYUYUtX8wyF1I2?=
 =?us-ascii?Q?lp05spNrk/0DD0PaFGhf2EUwMwJX2Ilye0MPJ/jOc/vO95jtZ338X6OpvnZ2?=
 =?us-ascii?Q?YvZfudsSThfrcekaUWCxCU0klbLD6VrPfLEffirV7p0qoGuUDgRmrttYOcnR?=
 =?us-ascii?Q?bzGGggX5ncDb5xtvac6d9kNTpsbtUV/J+HEvWNZ0VxdR/8BaJFHxJFRM5w9p?=
 =?us-ascii?Q?6ghIKKye7ZbgBzpgD1eKRxODR8Ey7CT7e6svmehrbCIZG7tnT8iNN9JcfrP9?=
 =?us-ascii?Q?pSxd8QSPHUtp4M+hLydZST/wY3aGMvoHDChHZbM4EUVUf4uTbqRbDv8VMcjg?=
 =?us-ascii?Q?yZeE0PnPwlXFsarYnuOUYpBPeIr8wlqaZM35JoL933yRG+deSRL0fGvonLlb?=
 =?us-ascii?Q?k4urcpxnEQ0djWdKHyIO8FhBl/DGdYuwqxOGgpIfV15E3WOsSDfJrdwA3BR2?=
 =?us-ascii?Q?Ihf4hGhOKCXJnRc2elbTVSaMIgaUiYDI7+Evkl3ZbZT+PaBchxff0LA+3TZw?=
 =?us-ascii?Q?k7TR4VYSeL34IwzZNMUZZthvGbA32ZjCb+czFhWeaqI0jfFZ0IMGeciGucWO?=
 =?us-ascii?Q?9DZz4FDpDDQ93dQqy1LjQu7KS0ZMEzUhF3PE+aSEs4e9L8XR0t+ZX2pFxOEP?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hJS0S6TCwVVlCA1BasQ1hotuqh5kNv0u9FdRXfb8mTkSNFSDmeSo8qOc+V7c+FvNJ9CTXz4Fbtd2jAX1Wrndhl3gsg2O++xurSguWY69XlPsF/N6fDzO/++CT2maVi/FmnR8BRoIoVCBpR9xrTx25xHMIEAHqx9PgKm3zjvX5WHjNguScDOEcdrWBaXfiCJf3/pZGVpG0sL7fzA9k2DR36165zPoZQXL1HJl8VT1GHnCowttU/HxnLK0WAd1Iwp+I1K5w2QLDtQDYU4RLCweiM2Ut11D1XuV+gHkkrL/RvKdtU5ODJ9Rk7u2dhNupqrv+POoLqIy1T5sHSixo2Zu/uGO6GDLWOqXdhgc+d87v8HtWO93wLHIr695aV8AIRmwaHFDPe1KNW1SeBvNlRrJcrJN8J1raftTuzVGcZDW4ZvC0IdQz3vo/z4ag/S1DVuBW4UydAmDxKU27+aNM5/kNllKry5GeaLmzWK/PrmsGIjVLUDxdt84CsD87HGkokcf29PZM6ywgsjazebCqmfLG7khiRm7lZhxApsn2k38MMNdb43RHBv9c61r+w/uw5YVt2QAVpVHJQ4c0BXDADxvPk/NlXcy9VWx9TVI2EYO6Sc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e78c0a-9a99-4d59-e9de-08dd5baa7ee3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4112.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:56:38.9133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUy5jteIXtbcjnXi3M/2V79adoXvaBVlVjtY/Qb4fh2c9vvZ205S+di0MglArVD1EP/1tjC60vOUCZNERRzKrso5wMvPgwWzr2MMskomT84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503050045
X-Proofpoint-GUID: uXHPhCHtpaV_1DaEMIUbDJv7yBGrbHmS
X-Proofpoint-ORIG-GUID: uXHPhCHtpaV_1DaEMIUbDJv7yBGrbHmS

Apologies, Andrew has already issued a fix for this.

Thanks, Lorenzo

On Wed, Mar 05, 2025 at 01:16:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   7b6c5895bb9ac3aadddd51108b7bb3bb1c7f3110
> commit: 3129f7896afb86e411c0b59a553fbb4053db4012 [400/415] mm/mremap: initial refactor of move_vma()
> config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051356.jJQQ0DoR-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051356.jJQQ0DoR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503051356.jJQQ0DoR-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from mm/mremap.c:11:
>    In file included from include/linux/mm.h:2321:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/mremap.c:12:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
> >> mm/mremap.c:908:7: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>      908 |                 if (vma->vm_start != old_addr)
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/mremap.c:910:8: note: uninitialized use occurs here
>      910 |                 if (!err && vma->vm_end != old_addr + old_len)
>          |                      ^~~
>    mm/mremap.c:908:3: note: remove the 'if' if its condition is always true
>      908 |                 if (vma->vm_start != old_addr)
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      909 |                         err = vma->vm_ops->may_split(vma, old_addr);
>    mm/mremap.c:895:19: note: initialize the variable 'err' to silence this warning
>      895 |         unsigned long err;
>          |                          ^
>          |                           = 0
>    4 warnings generated.
>
>
> vim +908 mm/mremap.c
>
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  887
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  888  /*
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  889   * Perform checks  before attempting to write a VMA prior to it being
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  890   * moved.
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  891   */
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  892  static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  893  				   unsigned long *vm_flags_ptr)
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  894  {
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  895  	unsigned long err;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  896  	struct vm_area_struct *vma = vrm->vma;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  897  	unsigned long old_addr = vrm->addr;
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  898  	unsigned long old_len = vrm->old_len;
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  899
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  900  	/*
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	 * We'd prefer to avoid failure later on in do_munmap:
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  902  	 * which may split one vma into three before unmapping.
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	 */
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  904  	if (current->mm->map_count >= sysctl_max_map_count - 3)
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  905  		return -ENOMEM;
> ^1da177e4c3f41 Linus Torvalds  2005-04-16  906
> 73d5e06299195f Dmitry Safonov  2020-12-14  907  	if (vma->vm_ops && vma->vm_ops->may_split) {
> 73d5e06299195f Dmitry Safonov  2020-12-14 @908  		if (vma->vm_start != old_addr)
> 73d5e06299195f Dmitry Safonov  2020-12-14  909  			err = vma->vm_ops->may_split(vma, old_addr);
> 73d5e06299195f Dmitry Safonov  2020-12-14  910  		if (!err && vma->vm_end != old_addr + old_len)
> 73d5e06299195f Dmitry Safonov  2020-12-14  911  			err = vma->vm_ops->may_split(vma, old_addr + old_len);
> 73d5e06299195f Dmitry Safonov  2020-12-14  912  		if (err)
> 73d5e06299195f Dmitry Safonov  2020-12-14  913  			return err;
> 73d5e06299195f Dmitry Safonov  2020-12-14  914  	}
> 73d5e06299195f Dmitry Safonov  2020-12-14  915
> 1ff82995731667 Hugh Dickins    2009-09-21  916  	/*
> 1ff82995731667 Hugh Dickins    2009-09-21  917  	 * Advise KSM to break any KSM pages in the area to be moved:
> 1ff82995731667 Hugh Dickins    2009-09-21  918  	 * it would be confusing if they were to turn up at the new
> 1ff82995731667 Hugh Dickins    2009-09-21  919  	 * location, where they happen to coincide with different KSM
> 1ff82995731667 Hugh Dickins    2009-09-21  920  	 * pages recently unmapped.  But leave vma->vm_flags as it was,
> 1ff82995731667 Hugh Dickins    2009-09-21  921  	 * so KSM can come around to merge on vma and new_vma afterwards.
> 1ff82995731667 Hugh Dickins    2009-09-21  922  	 */
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  923  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  924  			  MADV_UNMERGEABLE, vm_flags_ptr);
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  925  	if (err)
> 7103ad323b1ae3 Hugh Dickins    2009-09-21  926  		return err;
> 1ff82995731667 Hugh Dickins    2009-09-21  927
> 3129f7896afb86 Lorenzo Stoakes 2025-03-03  928  	return 0;
> ad8ee77ea9db1f Dmitry Safonov  2020-12-14  929  }
> ad8ee77ea9db1f Dmitry Safonov  2020-12-14  930
>
> :::::: The code at line 908 was first introduced by commit
> :::::: 73d5e06299195f4df82832cfc4a3a0c574c1e473 mremap: check if it's possible to split original vma
>
> :::::: TO: Dmitry Safonov <dima@arista.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
