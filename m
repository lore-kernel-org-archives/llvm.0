Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA653184F;
	Mon,  3 Feb 2025 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738562086; cv=fail; b=eHgwcOAvmcj9U/P1uwndE9rV3KW5Fhhbua/4SWqgM43yRJKuTPU4F+YoUgSXlI4kv4vCnG9wzk3pRnvjd7I0/yPyrga7DYk9pgghs5xY2HNiWOzJLvZUwRgp7pml+y1DbyFyzHIqt+IIXBof5cqBq1Newmo2C0iGUopErz71vcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738562086; c=relaxed/simple;
	bh=+sG47izX56F9oD01xBN7feb1k6CVND+jrpCU2LIjYI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uNxK+Rw2Ih8PYcBQgVaL11uPEf5tyBvSQliwHumQBnOXg6TTHm4ohDGpqGODO2TDuHBCi1sdpw/AKf3KGzO3mLRuyhyrHhYzOxwASPj238XZqP+Seqo0rYkLCKSf99lOBNTHhS/qVICsRJVZyOBPVsIGTcSpeW5dGSGkUMwo9zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hjXkwelO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=isL/nkZU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hjXkwelO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="isL/nkZU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5132lIau013021;
	Mon, 3 Feb 2025 05:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Ah+FqVk3qjfoQybbnm
	Pf8a99xesc/wszbqjGoeuAsQE=; b=hjXkwelOexAgHomygV3ftgVdk3SZneuCEN
	yHYIvyH4519avxV62wnKCXxoDJxb8v8HEeUX88Nm3U7uzC9G0wcsEzh/bbvXxIjP
	ZEL4tOoTy7m9TTgwq50djNLfKDAVpV6y4KWcrSPgZTKL+6uHVcyGlARN2jS+hpTM
	8vPiVqT4J033gwwzE9ts0ABjvK4ZjO2jLHtrsqD22Z0Ial1iPvnUX9cAXZSHvUwI
	SMOwQakl4ipHSV5ZYULFbu9HjjkD5H/LqM2JlG8GgHPePd1C6tuP0gDZ9AYnY1z2
	+1QrtPe7rlmIjWNqEBpsw+7phcWxwAm7JNg/41yZBxlwJ+QOlVHA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy81pfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 05:54:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5134XDSR039174;
	Mon, 3 Feb 2025 05:54:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e5yphj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2025 05:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vyt1E8MprC87ZEJTpcOL1dNB2tL6tHYZmlbp8CoUVWTlnRebZHDr480W+RZKNgjXOfccwx0Ap7H1PN9TYVH7zcmJGaCpgXa9PBpsr6aCz+Fam8UUpbl4vSQ6707tmbHfJE0YDj8YPPWHVpCxyAsEWpt/7HbpIorC+fCDtI0QMbDq/DMQtV3o5HEMJ972rW1SVMf1xWMpxN2rjptp+H82ZqW+pjDbbHWF5Msk0+q8jrhbdW4CJTwYuV7+jae6BcibO4J0maVWEl/ZdSmWSPSHpmH0GrgysplRcziwblnUnOLze8G1j/hPr4smdQdn+Ml5RHnBdE1Nwk50F/PCqPh2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah+FqVk3qjfoQybbnmPf8a99xesc/wszbqjGoeuAsQE=;
 b=cETAl35DjuzuxRXTSJoxU5qSrwl+LRnKl2lSS2P69NzeTyx3dfaMCsekOZ5zJH8J6R22CGxSIqzqNngME0pkPmu1w6oMRQJYoqkzFHPuMJaPPbDpluKrBAd3KfkwN2YdhQjE8inbpW8zfUxVYYBFffDmDg4TGKPRiX4Oak7JQGZyof7yb8YaNH89Kv1omeAyo94fyaH16jz7hjm4gnpu8k+B0Bcs3r5Ewi4wMrMaEg0lMamK4e3O0GrjV23Ss7l9MARPWQ6Q21RWo0FYKFjFXlv1SEEebh4VLaSvtI6xuZ9Y49Qo1UiaA7Vecgh2O31dfLGxsvecejrKFoFfRAF3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah+FqVk3qjfoQybbnmPf8a99xesc/wszbqjGoeuAsQE=;
 b=isL/nkZU4AZ7+IilqMb9VX98nYurCp0zHslFJt+H/tQHKgc/3/Xbgf3MtFobva8V74l7wBSNIlmqQjyCvyS7V8PgT3BHqmVuia4wxzOQDPWIPn6Ug5E4btOzS9ZIWQOOliNEd+geEK4rtO/upvt8VMtXguNPMtYattKT2RmKzN0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA2PR10MB4635.namprd10.prod.outlook.com (2603:10b6:806:fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Mon, 3 Feb
 2025 05:54:34 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 05:54:33 +0000
Date: Mon, 3 Feb 2025 05:54:28 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 75/80]
 drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared
 function 'mapping_wrprotect_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <8688fbb8-29a4-4288-9698-a718f3573fe5@lucifer.local>
References: <202502030356.JNL7I49s-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502030356.JNL7I49s-lkp@intel.com>
X-ClientProxiedBy: LO3P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA2PR10MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d6ea77-6a56-4258-522d-08dd44173bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPYOFyw9u9jEDewOtTXnoGS9WABZ7aZ2kfyJZwfmA4VtSAOiNPLuDNq/79ji?=
 =?us-ascii?Q?QS33MzqzQmGlV3Zk3Uip5ECQbYV2mGgYnPq+6aRWO3yunjGeWcuVO6sV//zf?=
 =?us-ascii?Q?IublupSusYK/qffhUB+PDluaK+KuYXoLf4CsU6meEDSFS4sE/Q9bzrMdkFtZ?=
 =?us-ascii?Q?qjFvd9oEWtci2w0pZ+u9uQF3E16kvEZQPVbB6eI0QrfzQsyfhsAMYt/6VZ2s?=
 =?us-ascii?Q?o+vt1b4Ib74PY4ao5d9UOACadK/1tJ0hsQdMZ7masaqH63caN6uhqAtBO934?=
 =?us-ascii?Q?4BiRO7HO8qI2SbL2mqz5A49bc6qaC2xvv+manRKWOw4wo4c7IWY6Y3fdC9pw?=
 =?us-ascii?Q?NUdNz2FXiu4Svk5WVDJe5dYH1Qs1//Vyw0cS7YCchjYJoPMdmVbRWrWa1EhX?=
 =?us-ascii?Q?70EE2ESPYkYsFlN/BQuhzO7av4WGA8ArR/KA4DHvHOLlMnuaPZXyy80gTNlF?=
 =?us-ascii?Q?ANg4AKwFD28H2snSygthzEoxQlerfCWxUaVLX6uDwoUPgWFg0juzlssE4qIA?=
 =?us-ascii?Q?7KNmHgL3eAJbede88T99L9K1rgXSTBcPPZ960SBX/Z65RlDHclqqAuym+Igt?=
 =?us-ascii?Q?8pBhjFQ0wAYWf+7AhdKlFlBwr6adRNGfigfc5CLrGvu7CI1SP36H/FHV5Kim?=
 =?us-ascii?Q?LQhdS1YyLU5kKoRXbZGnJVF1S856bFyXEFEjxvG9htzJKm6XzaKokxW3ooRF?=
 =?us-ascii?Q?Kw73zCRgIr1dDP25yvJwXsaKj56YNCBKUuJ3mH8gnT2z7TwDTL04uxjEpfaZ?=
 =?us-ascii?Q?xf7CxwLK8JaFYU7AH39WYVMxFXowzzPBfaEcxP75iAmAyrLrioBdLjAmY+xD?=
 =?us-ascii?Q?m3yCESH+1EUJqUuLfHEul+Q7f6a742frayLQjwFoTFe3NqYhoZ+FQcId1g3f?=
 =?us-ascii?Q?3vi5LaqC3lZz71UlnZ05+w/7TK872E7lMebvPuClXauFEJR7cded9wWSlYvj?=
 =?us-ascii?Q?0h2PSq05UrDVkWOBj+JJPZRELJZ1nLOX5Iv0zW+PrtHTjvnxljZ1cyrOmhwr?=
 =?us-ascii?Q?T26LNABMpFLKSApI8LtLRYSbWl3wScxcmS7E75gMRyFXryrbRoQaOWI3DLhc?=
 =?us-ascii?Q?g0ZTxLDX/X3wzmK0vYjO+ZutkHy0DlsH0XEYyseV3a/vdDoEYa2RIRfMPeYJ?=
 =?us-ascii?Q?sydJzVaaSg4VwSOlu7X8vIoH+eYrTJdLu7VYI9YAVwLADZYhHrNWWrx6+8nb?=
 =?us-ascii?Q?oQ68Fx1VXgvlzkXojx2BOlY+6IPwi9bMr0bWEXDF0TgB9YvMSg1gMmAXJhGk?=
 =?us-ascii?Q?ic22aea+7Rx7odGIRr5/n610TTbLNvXrR967BEnlz9D1zmod4f3Fhh7HxGnG?=
 =?us-ascii?Q?cb3CUtKhYuMgU2Cf4jPQ3Q3SeZtxNc5GusVUljK/bj6S5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?842gi+8R1nWCBgcIBnYxKRIHetu7BS0/cOmWHlVNomVuBG6D+ULQzrGvoADx?=
 =?us-ascii?Q?OyqAXYEkLZi8Du9PNpRaRxmJjd8icH4Ju3QEdzjDAqEZ5sSPJifTPMf9n1RU?=
 =?us-ascii?Q?uJX55cemyo+chf8SrUnsMTFvYJSHun6S0YpGEWC2hkibnqHndLiyP9LcuOwo?=
 =?us-ascii?Q?cf5HG4ZUwKyZW9qkMm/K6SA5Cprd/br/jujhU3NcEwbGZ0IrDSqKv8NCX8a/?=
 =?us-ascii?Q?W6VDYIuQDYM5EIudJd/vcV3p2W5/hH+wJwDiVGfegTkSyLbAHHeNs4wUPxzE?=
 =?us-ascii?Q?EBL8BVWL5vestmXyfeo00EUaylRAXzhWf/k+cdhtsxSZPtGv7Mq36290xIlc?=
 =?us-ascii?Q?6fow9yIWxXasBBcC3Fh22IkPGZa2LZpD2DRmcgObvRirfG0ik4Vo/cuuomG/?=
 =?us-ascii?Q?tOAOJsvkdrurdVV2Fr5WQzwBKDkahljH7mkEg/RTqy57g1W+IDS/DEP9y38D?=
 =?us-ascii?Q?F8GkVwU6JFkgKW/23TnWrJbOW8XsW8vNsGylGqps4eEbb64SkaiZ1DYILVse?=
 =?us-ascii?Q?QQEwfeF5jjhb4QRLxLeP22YTCfb1mB59ba0PFwwtob1AtXiIs1bKeDI5RPo4?=
 =?us-ascii?Q?HxP4Ud8NflkJc64pYz3CqEAIN29szqzVXHJ4vCdNpZ0Pdp5E7VDQ/MGuDD7T?=
 =?us-ascii?Q?OAIL8NQ7bvyj5iEfRwChw1T3+SaC4VZT7enxQ4ONmWpicWTNAnUjzqzTMjb7?=
 =?us-ascii?Q?DWvnipJ0/WnW9HPYpYMXhYrHeYXLYU2FTxLh1caw9ACUUo5geQsGGipcRdZ1?=
 =?us-ascii?Q?cwj8MlRYoOTIScd42/vlNYpTjapaci1asAU2jkFmuTLA5S0Y0O1C85w22Am8?=
 =?us-ascii?Q?PM5WFn7t1UK6Qordh2XK7TO5oUJrWeaXv7QTWYPFNDLNTnui99dvmX43gDCW?=
 =?us-ascii?Q?l4yjCP53NJkZlauN0T2q7k+aynvzpAsWH1+qFTT0cK9ISA2NRe4qxJC/KGWn?=
 =?us-ascii?Q?/1eWWkrZGJHTIuldyV7Q5MNYDGCpXSeEgF0OYWfm+wfe4sVf/SXfNJ1Nd0rZ?=
 =?us-ascii?Q?5YUtbgaY9oZqLrHrckDwiUPMKU6eznwpynhun63N5C9R49+Mq1hQNrujMXMn?=
 =?us-ascii?Q?4Bw0ccN14CG0OLK/zQAIKbyKWe+zeIXz3WWTXxSwgdVQpyiMnUhMI71KQ0EF?=
 =?us-ascii?Q?IrFwZW3CzIaU6FgTmktEn2XeeZbzmtbk5UHNIVFN79601TlNnmIwZAFsNKfU?=
 =?us-ascii?Q?8YkRwmXJND3ovFcwYvao3ONcQbQHiKCrjgxARYaNeTFYBy7nNHshrNlIPSlh?=
 =?us-ascii?Q?Kx7myu74V2PBGz4tBpWJaIC/fc2DLLQfEHO2rBPAlrSdl/Qu4EJM0PVzSikL?=
 =?us-ascii?Q?gQ+3dS8a7N2uI01/2peg++I4LPSm4R+41BrZ0lz0DbkIdZsA07aHh+Iu/CKF?=
 =?us-ascii?Q?jaTlw0F+MqRf0DLmYbJ74yl1DYUpCu21alHEV2IRC0MpPMCM0amVi4vsAhQx?=
 =?us-ascii?Q?Hu+ciWlw67kzYVqaO+lvKv4I52BK90GVLUycb706rJ2hTRcdFuYmoJjLthxE?=
 =?us-ascii?Q?eG9PNwsthbjzNsnRwlyTUVeb4XfeolVygjfTPRso9hg9+o9OG1wp1/LGN4of?=
 =?us-ascii?Q?yYq8r5/gI/DV/TyCgCuMPP2JtUzglr9cCZkQ7TPcrzreJkcJUz05Gj6MPZnm?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eMSrW068xfpkX6ExQOthu4/3nJDB5pAFDEZ+7zH2UVLcyt7UbPleRJC4+ApZ2w8wQcOel+0SlVLm4aVCgUAiu5wa/o+svKaBabgwj0J/zuegxT7/ObsQFIKrWrdxJxkhOk0Zpv83fXD6MKARibW9i3uachivUJFEuRFKPbI6Szh5YkIjqEum66SWGcar1B+2Guw/OqAqxFCiYIXGUvL186IDL9QyvneqEBowZwzZWAgiSRunah3+WhonjFVjWseBcBF3STvZKLzv/OCdLLVsNIzWnO3C6z0diAtcSeUTv/xtMUG7N8BJCAFnEoV1Y8FHTbPeyEZgx50otk59/P62IRbVNcfK75zan77vP3j14oAvfiNdvm5Ci4YjjWgUHwYc2A98hPIKSLH13SmU6jCIV/yH462GlZAZGlKys6lCifn+j8O3+J7jfe+T7n9SRpR/TqfK+givPq1mG/+BEpp6bkId5iQNyZEnTOiiLVUF9q9vnssYLMVlTCDsyYRaYcDARMpP2PhJdZqVbtGh2tug9bX06HrVqDjUs0zYGkPYPmBpUFQ5qrXb93NAbGo8KmLdLVjYcwUSEETU3R/GZ7+oNDP1+vwS953el78bOMZyjKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d6ea77-6a56-4258-522d-08dd44173bca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:54:33.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/yZXgP+v4AKiW2PMuZsHvkjBQd3+mOe16kTuRan1aKkr/Ph7O6YCOwXmjUOaw8aDUHSas0jIeXor56LSCSPHwwaEo3XJIBb9wmD14BS8pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502030049
X-Proofpoint-GUID: WVBXaXg67NZIVztsVEGjt_RQSLLHPnLR
X-Proofpoint-ORIG-GUID: WVBXaXg67NZIVztsVEGjt_RQSLLHPnLR

On Mon, Feb 03, 2025 at 03:35:48AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   7de6fd8ab65003f050aa58e705592745717ed318
> commit: 6a9318f28d7e371692838677c364145fe04b1093 [75/80] fb_defio: do not use deprecated page->mapping, index fields
> config: arm-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502030356.JNL7I49s-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030356.JNL7I49s-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502030356.JNL7I49s-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/video/fbdev/core/fb_defio.c:272:3: error: call to undeclared function 'mapping_wrprotect_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      272 |                 mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
>          |                 ^
>    1 error generated.

Hi, thanks for the report.

It's a duplicate of the previous one, as the build bots don't seem to have
any ability to de-dupe reports (not sure if entirely feasible either).

It's because defio, a mechanism that explicitly requires an mmu, doesn't
explicitly express a dependency on CONFIG_MMU, which causes randconfig to
generate totally invalid configurations.

I sent a fix-patch to correct this by adding a Kconfig depends on entry, so
this is addressed.

>
>
> vim +/mapping_wrprotect_page +272 drivers/video/fbdev/core/fb_defio.c
>
>    258
>    259	/* workqueue callback */
>    260	static void fb_deferred_io_work(struct work_struct *work)
>    261	{
>    262		struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
>    263		struct fb_deferred_io_pageref *pageref, *next;
>    264		struct fb_deferred_io *fbdefio = info->fbdefio;
>    265
>    266		/* here we wrprotect the page's mappings, then do all deferred IO. */
>    267		mutex_lock(&fbdefio->lock);
>    268		list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
>    269			struct page *page = pageref->page;
>    270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>    271
>  > 272			mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
>    273		}
>    274
>    275		/* driver's callback with pagereflist */
>    276		fbdefio->deferred_io(info, &fbdefio->pagereflist);
>    277
>    278		/* clear the list */
>    279		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
>    280			fb_deferred_io_pageref_put(pageref, info);
>    281
>    282		mutex_unlock(&fbdefio->lock);
>    283	}
>    284
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
