Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26453D54D;
	Mon, 22 Jan 2024 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933662; cv=fail; b=J/tPFGbSto/tIJbr6z6sWVDSSCL1lFGlWDAtoiUCVZ1iAJPHp3ES6kCSg+awMxD4xAT2H53HbIALcPuEAzErRY7YPTS1Evw0u9AULsWnWFDAMfHvauTCMsEmDWgDRDQbE9amhLe2S5dn898gIMddznAcyc/3bOIVlt3luAatOYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933662; c=relaxed/simple;
	bh=r9paO3wN1XFaOsfV5t6fo+nvDNZ/mINi58TzLi963So=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n+Z6sIARZViWtjLId117wMxTU3xseR/j5syzsmGKzjDFxaLVHgdss1pSM+OzVO08KtlgO8baDoZbKVgs+/EuBqA7g1ZwPFIqMeqF8TE3jw4DfxVz+qi6e7TQ956SFEaZ6/DG1qBsp5FevW13GNXXxJB3oIJdJobu0iJi4H7mCmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLIkEuva; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLIkEuva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705933661; x=1737469661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9paO3wN1XFaOsfV5t6fo+nvDNZ/mINi58TzLi963So=;
  b=hLIkEuvaRzHZZh8tpuenxR2EAAbsQalugZzDJ29rRugwJ5Yeyy0PSm9+
   YdsINCfvGyVvEf4TGAsiOZZl55T2aHCk6Hobu6XiekQqbwASy4n5Y9LUF
   KzkTpdAgiTGoOF7A7ERrunvbby/RZ2AmpntSzh46GGSzbHF9QiTHir+eS
   9Y8j409t9Et8wbEGfBUssmivWxdQ0BrNe7EI0JBJBe6+VvwXNNDdpYyQR
   epYGAFOrfK2krAIJ9c7OpbXP8EHpCFm5Yc115dL3Ny17V0bqBrkt6fRp2
   vQMvMTNXVlFN0eO1Jfi6UpDVKvUWUFG0/aOXkv4fCQdtGux9tWvkOScmS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="7882810"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7882810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735175951"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="735175951"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2024 06:27:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:27:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:27:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 06:27:38 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 06:27:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NljabNW9PisTmRR2LHmxoywbh7KXU8m0GItZmmqui0JIAiv+hJ4Qi/8+CZxnsZ60AtiDsq3c0/xljC3ZgB31RmpwIoYo11iYvW7nruBFaCTGrFFa7EGOEBib+2qWQVe/vFh/w03vp5GAaVaaHZPiaHLvrFho3/188c2PiKSpNIwPQtH6L+45O4mW4cdjcp7t3Kv1cEhtrklXmY5wN9UiGS5WBYBV9GbQiu6H7fAvRlljqU+3c1Yz0bRf27/ybDZwVdR1+Aejpr4HDi7thiXfHgLFCICFTsOK+fTeql12LkRtqUNUyQNboEpMHd/W6JEP3ottBtY3lv3jhv5Hx0i5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF5Om/ETh9YSZLPfBRfDmKINQPugNomyzF6fkXdO28Y=;
 b=CVQj+yZRR0JdHS0ZHmpZfL7gpGLeisYS5FPi4iwLpKfd0htAAymHkLCqNOXzTmPBSL0aUCHwdB+ngBZ4s50TDw35m6qRW15VBZxAjLu5cd81sOnTl6ZlVCqtXdtlgtI4ksIgY/1rqdxhjDleZUXoAE5GqdJhiBRUIUfXxdthsIkC6r8ysl+YrqNBTtd2MdQjFlFtg8rfV4YjKQ2HhgQ/7OEE2itJrw3WO+N1GFKCY+sWK2C6kF9zEXAFYbdLbNp6UhVZKwMt+KmXRzxsG4vRWwYYJXmR0bwXz0+8NcWOeH/5pLxP9WQP2FS+MaZd3O+ETmhYZtSX4HJzOEI5zIZV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:27:34 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 14:27:34 +0000
Date: Mon, 22 Jan 2024 22:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [arm-integrator:b4/arm32-cfi 2/7] ld.lld: error: undefined symbol:
 ftrace_stub_graph
Message-ID: <Za57TWD92RQZpq8Q@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e7f0f2-f664-4f15-5eeb-08dc1b56458e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAY4xbvYgtOfdyp36ZDHrYQPzkbRadx7IkZbxn19fAMvk17KFh0aebENolHB7BlzxHnjpXUIqgceZZ/LDCmZKPKHwtwk3BctmvtogQq8c6L7deqsuaA/rtmZTnCvCgOcpdFNxZpbb78sp/sJpYW/pnWMxFXSyY4Gi9cSP8m/MBB5UI6wWsmXF1NRx0vA1V36fWs3N6U69s/dxcVWI+J6OiU06oT1t33PbKvZyzOOrpNb6qi9FRAgW0MGx7TfwpsPJjH2hStEQjsrBnV6hmCSfz+GPbVK+W/bttSN6VcRoOY4Fr+8joVbX6VBXysrlGVrb/nHS0rdN00FHOSy2NjPBK0kfZds3mQ+UO3bpMU+4uQvCVHYrX6CPtDOUeQOIgQauiNHL59ZR403yuFxYrRunPewPDvI9eSk80K8zzPs1C9EOw82Hp1RegFx9Zp9xl60qe5xd1o7NPq4YLnC4yM4JSozb4Ayl+DoJ2wp3nfATHPh8z6UYwsAIScIKIU/nMt/YP+gF2m2PorQwEOxg7N4H2ATF2zbRntm77xWRB4LlUQ6qnWc99vf2DgaTEXZgPK0YkiNhVQdFmc1F/BRjDg9ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(6506007)(6666004)(9686003)(6512007)(5660300002)(83380400001)(41300700001)(2906002)(33716001)(316002)(966005)(66476007)(8936002)(4326008)(66556008)(8676002)(6486002)(6916009)(66946007)(82960400001)(478600001)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/xg1X+FTpprhzpsxLmwGqzg5BqRBFQ2QXVX15m5RKmh/iSh+e6NOoey27s8K?=
 =?us-ascii?Q?Oa3Gn2GD2U7h4VJbpBDezsPWgIKrAnAYgD9kmM1BkCipRNqTcz8wGNNwZRyF?=
 =?us-ascii?Q?V2TvGPa53DLopRJeGD2j19fsMfrxaH4FlgZO7PuBqnP4ynaa8pp2fO+eeUbp?=
 =?us-ascii?Q?icYZwEjyEdpuOi6jpxuIVZ3ZH1dlte6qYYORZoltQFH/RbmRfeCPw0j6EDb0?=
 =?us-ascii?Q?YelNfdXTRRloiHOZMokwzPsra9u75opefkSoYlkbOEKDAT1Q4+dYkEzcq7Nc?=
 =?us-ascii?Q?m9wvF33rKKbhdNQ3bibJlfgUE7eg0tA3X4+Ptq64j1408M3O3Skr7P9n7nGz?=
 =?us-ascii?Q?+h7EWa8pqcZ0qGFGz7xfdu8+ghtTP2KXjCV72RkbxT48GYto+RKBiS5sxGr0?=
 =?us-ascii?Q?QH1sgTuTu3nv5UlwB8n4k3owxSrrQM9AVGGY6/QCNo1eMXBXvacrGDxEBq4G?=
 =?us-ascii?Q?vxGhWOq7PKJVyDmQJY85K0dxVQx5lUcVcWByyfX2DmtnQUUPmmGIDLseMZgt?=
 =?us-ascii?Q?VdVDN2EaEczimxbL0A0gQ/9fhud2iFUTRpVxTTz2xhWLON01NzzZcZCSwMvF?=
 =?us-ascii?Q?sd9th7Ga3b41KeepQrK0mzoU7tTYP+OypAgOxzdDQa9u4QpNLwlLDxsys0LO?=
 =?us-ascii?Q?qHabZhvp2NZWuSM0Q8bVpcDkZPKpKY35qRzZksSGwtjuT6EK98ii5ekpelLC?=
 =?us-ascii?Q?pixFCTsZT1KluB7eDH2duyVxxugDQc/uGQ7HCo2ZTe3RyKbwnUTqGcQAW6rf?=
 =?us-ascii?Q?rUV/280ptZNT7bwjQNQW7Au8Shl9P4b4x1uq2IZ8E8j+f6P9whk3fcATo8ho?=
 =?us-ascii?Q?6Y+LayN3pkJe2xl9f4bVzzXkZA+UgG5oklORzX7RarToj8jOMJfxh6fibDDa?=
 =?us-ascii?Q?BB67Ph7KxM5GhMFRcapIF5cZnQQW1OZ3WVbSSruaCMyXXlCLSG00ssqIDnDv?=
 =?us-ascii?Q?5YYpAHldEQMRRwWYgpn5WUGz6SQRqUn7r/uOrO3Jv4t7EPkzR2v/T+CXFd9z?=
 =?us-ascii?Q?zOyoMlPOmSw9JET7G+vjEp2J0Y6EDGVqc2wBpYwMpbMOb8dP2nQoqimDcDmZ?=
 =?us-ascii?Q?VNt2HVXY2J7MW+ObyOlHwoi+5T54V7DQqxD8U3GBnCethne/id6FMqsNOFjz?=
 =?us-ascii?Q?hVUBOdhju3iSiCe6QPXN0lvya7RzD5DtVrbpI1dGangAocicU7Pr5FOa0T/a?=
 =?us-ascii?Q?S8zUYrvng8KTO5qo28QnOpAcn/ZkPepOgXL3jG5PoQ+eyMcq3Qls8ex9myFS?=
 =?us-ascii?Q?Np/QDCUeJG+K24Nf/1pC4QY/u9ZFR2EY6fvJAyKdarq7J5tKe4+NEb1FU7AL?=
 =?us-ascii?Q?enbyI9GoOpBYS7i79j35IzuP0yN/kwWUIM+3kpkrxJP/zCYzFg8h0M60fv2j?=
 =?us-ascii?Q?mDYD0l8yp4sKriG2UOiqOBhyLmhsjNxvbKCm6J98B+Qk6euAbjzCcmtBgQfT?=
 =?us-ascii?Q?cxWyABDY4bPyg/6buY7yq3RU+1uIfN/S8onZz+JvSKhZsGAcb9Q9U4RgPUSK?=
 =?us-ascii?Q?6QwgHOWftb8vCyhNCmyee3dm2btGtPaaDZXudkfmUD2L8FHI/gVKhBDxuXlr?=
 =?us-ascii?Q?Gl+FddF57/5G9olY1Kx27K4yOpFavjknBqO2yG/WIIEjBm6rre6B9wsoMLrE?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e7f0f2-f664-4f15-5eeb-08dc1b56458e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:27:34.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rYckjqi7+j1GOXVZ7jZNtWMQXCtbVFdwwRHjCC/Yl8LKXxuzSnzE08ZA1gVWfCEjBIk0pI+9k6J4WDnxl2Ntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   f86148141d17044a48dc056cc4fe3bbcf946d5a5
commit: 5747dede14e284bef1e345fdd628fa22f7d83dbc [2/7] ARM: Support CLANG CFI
:::::: branch date: 35 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-004-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210856.0896ZDdB-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210856.0896ZDdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401210856.0896ZDdB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ftrace_stub_graph
   >>> referenced by fgraph.c
   >>>               kernel/trace/fgraph.o:(unregister_ftrace_graph) in archive vmlinux.a
   >>> referenced by fgraph.c
   >>>               kernel/trace/fgraph.o:(ftrace_graph_return) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

