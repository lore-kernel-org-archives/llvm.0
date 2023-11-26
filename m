Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A18814;
	Sun, 26 Nov 2023 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PM2Q/zwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701014793; x=1732550793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f768T/r9fPznVuFBBeRFAlDaL32QWxy3f6sTby+Az08=;
  b=PM2Q/zwDRLhltW4s+jYeiJqmIFovYUv1gTCduzQz+CdfFeVezuEOttGT
   JHZO+X9GwAJ82cI3iQ7W3eogx0Ux9kaLm5np/bsRrjOFLGo6OvVn6Am33
   PNp/o5zlmacP6DhkEYAhiIvjZrsz+otzcknXO6CpFhnZD+66EnEvARD6l
   dQcXrXwZ+5+IbWhuKWKrSGSRuW3czefli0a5VvkGcIk8UxxYyDr01Gzyy
   rKLNjsa7SjlTHVDSnJy35ZyrqqbmAjFk7CMHRMesiegwrYWXKMX2Pq//p
   ehzwtZP1fJRh0r9QTVkhD4NIR6CZAD5GFid1pQZML/+NbExc56pxeMa/T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="382980389"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="382980389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885770707"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="885770707"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 08:06:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:06:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:06:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 08:06:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 08:06:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPexqhGskc8MfN4T+TJBPiy7dndu3qg3oGx7QUhpxfweCVuCbYfuqMFfIlrKCXU/w4X7KirrXEij4oArWJxzCHH1vN9GUmalDQrY74Xz01i/2EQmtNaxZmu6Rrx3RKJQRwhxEbAMvVIi1jghf7XfznF3tIL7/4Auro1BxYCWT93JfUijHfQKlqR5IZiC0D2o56+cZmCXzsHeRF6RFcAL6HpHTce3DER1bBsKhvPgJppDDYQUBUK8ZssA5JAcvAxU0X+QnASmkkTO2J7rsC+UNL3WffbY5M2nBLUJHIDZaisEvoHoHKBYX/L3OJ7nXB0FglShvrVVCOckOr0Xmin/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxfM55Z5KLsj6jDZCdqmQj4Nn9es9GC6Oc/n3IFLPnE=;
 b=hbAOUJcoSJxzmz6ryf2vZR6ohLVBOiNve0zpvITcxEVZO6j6Y8KHib+47rVKu9yYZGsuM5wWq8KozYYg7vMuekrU5KPg4lx8EqvL4WZaFhwuWf1sAO+4jzsq3epRDbYxREmzANulwWg/XD1HZdPof/9Yrj/jM54CKt64Zu55LcAvIEH17qQplZJOwx55pFTOz6I5sgCRTo9EjUy7DPK0Jc+ysdNfniJopd7IOGa9CZTb11R70/XN9gOkIgD1G62W6vi5X8RiGKKGR2VBx5H8DAN8uEQnO3JPJtemksdO9cIbJfrLERI7QJobw7Kjd/yrsocsLG40pk9dbTOgYLhk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 16:06:29 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Sun, 26 Nov 2023
 16:06:29 +0000
Date: Mon, 27 Nov 2023 00:01:52 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [peterz-queue:x86/ibt 9/10] arch/x86/um/../kernel/module.c:undefined
 reference to `apply_direct_call_offset'
Message-ID: <202311251541.xeW8anBk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DS0PR11MB6397.namprd11.prod.outlook.com
 (2603:10b6:8:ca::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 037282dc-591d-45f3-e01e-08dbee99a5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P2hk4W5cLzNwpa9ayF9SuzM8rapVIkF5ZIh8bHAz55n6OOqVS80g1XDnPVDD6eMLyb7w9gRdngSOttJrO5VvOgH2WKpsJDhZAciDjHFc1O5df00DYLrolxE00RKPXqsO0ozj9dNstCT65HRkvmK1sDZtFLbN0UwxxJElQRN6hMKeCrhmf030FyzTJrhVafYWdVFSd3qCkjsBUVdeRx5AbeeX9FjyXhiVKI+thyCQwffuJmqqyq2q1MQwpy50FEMNhFayw3mjsWv0UcvkCaMvTWcoIDae24cBT3I0ak8NmD0ns0FqbR2007ThbN/AV/RjIwvv9eAZAKK/4tdNLoyISNodJceU+4yvOssFgw7eHU3F8aYr8VV0XdNLVF4F/MY6Dah+dfKZB/oxx4fDxnk3fsSpD/wesIhEeZuKIFNoyhpOkEQEeFg2asvfJRIqkaBiDQZ5f5C9fsAK89REUJPXtfiK3aFC/mTR0dEvBdsonhK1uZQBJMS3KgdP7xiLvuvOm2oUnG8vd/Wx87Kp3ZeOKzfyeZeg8f8mr21Apt2seTYK2z83HJ/u3dWrKV/O0nx24DCX/MYCttzZ5kJjKQ47uHZGhLvDWBReeLwWn5Du8IjWz3TltYi6jUiF68YW1FCtqxXNufdUlerP7W1GPT2kDTnyezL1lI9gSIvAmfi8JMBcfsqIn10xZ/dUs7b29Ypp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(1076003)(2616005)(6486002)(478600001)(6666004)(966005)(83380400001)(2906002)(5660300002)(41300700001)(66946007)(66556008)(66476007)(6916009)(316002)(4326008)(8936002)(8676002)(82960400001)(38100700002)(86362001)(36756003)(26005)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zRsoa7oSIxqoQsaqBkcbH8H1Ss256gsQKGZTov6/zhIZ/u30SQdws5pRztMb?=
 =?us-ascii?Q?1UX7nEgwirOxbGEv70uUAKvRa2oJynGSB4eFfJI9gxIVtXrhSUe+O2lo+n8v?=
 =?us-ascii?Q?3jVw5Y+iGKVcGmhTaE1xV+pn8p79suBV2agXvR2n20dvTBVdWXRbgttcCl0Y?=
 =?us-ascii?Q?1jGISYGEjqz1Xtpml0UERV8wt//EUf7bAETnrlEhraNH+rPYUIKBNIkVspjH?=
 =?us-ascii?Q?67jJsAPx2j/fnZSLx0EmaJx2NhPPjRuphKboLSnsY8OJDOPlKuzp9DCv4qQr?=
 =?us-ascii?Q?nd/tT8o+GMx2KF6VTO6keCLOhnfHRfR+tfB9eCnTFEPGFPvm8KW8NL5iVeRB?=
 =?us-ascii?Q?e7HBAVu8oDT40B5eo4bye30kfdgZuMNqnHFlC9Q74yshfj5sRE+XsrPraq84?=
 =?us-ascii?Q?dSQC2ebqFB6w58nqhgfxP28Sg5VviEpqUfWhukzFztH6ps7IznR+FBKf/TG6?=
 =?us-ascii?Q?bl7YYmE+arL6PXnWIqlFSXIvT6pg9+cLfN270A7shGRQ0fi6j1qt2ZmiEiT6?=
 =?us-ascii?Q?NZ7KAGN+V0RrJKBRE1HyjNkiMvgX5pCyYGpo/NT8cnD+A0O1dEatVmEReo7G?=
 =?us-ascii?Q?QKaGVY3fNQYBPY3FN9zsnw3OXTFRQLISzbRzMT8Gw1Y0M+cPP7ubzKP8A7xr?=
 =?us-ascii?Q?IcGhbs0MVCVgvyt1gHYifNFNSs08+6tIimQbOvqyqPl3pmIKAfAf/eZJhhv9?=
 =?us-ascii?Q?7YgDqsz/Noa3QK85TevPPwyf+lyprvRp2Dj+UzhyOKscZGk2shlutS0twwfY?=
 =?us-ascii?Q?mcNTs61mMDTE37784kNkKLwvN9zMsrc5rLzS2FraAIdM/nI0PogoXocwiqNt?=
 =?us-ascii?Q?UaBwuWfY4rGzY12i7q61vBqi56WaVL/lU6m+W3KhcpypyzOJtLKV7ScnhPF0?=
 =?us-ascii?Q?duig3vCyT/OyV5w72bRVWzvdHwRpTzdFNEgTcaO/T+Z4bT3gIR4XC+hY/I8g?=
 =?us-ascii?Q?dndaNB8W9H8HiAvNLJKa8vFWy6NPq9KN2S7R3X/oItMcBRZHDxab/yf5ejy1?=
 =?us-ascii?Q?vVNPr8o8PLGtn5puYp2fBvDAu7XCRsbE7UJ7QZFNf/Kn1n8o7hCr7jJOKsf2?=
 =?us-ascii?Q?ttbaEFCcH108GVb2yX49arY2bB43de+O0/5mnzApr02FhIi1GAbAfY+oZ9i/?=
 =?us-ascii?Q?UkVSIBq4hwoyJoKFzvmg+eReNj23IPWxLPuf1MeVKzM7DkRMjGwYBIsjnonZ?=
 =?us-ascii?Q?7AxvJgaOkNXbTwiOemjxbSeBu3SatV8q4zXh6A9EbahwFHVGk/pebeb4Fomn?=
 =?us-ascii?Q?+z/7qUSFo4kIpXXOqu/7xX+Zu0tp3RenV5xdPqG+YAXOH9TlxpJyQmfdIdE8?=
 =?us-ascii?Q?5zG739N0YNnHYWapb+KKdCKf0m/ZgkENtx7Ta+GtU3cevUilJXMRpVgJjlVN?=
 =?us-ascii?Q?mglemHIxROj4/Pls6BCEW3rM8gp+cqHmlm4p3OCqQkDqLCbvLedNH5W/XI45?=
 =?us-ascii?Q?RLCUldJitTAp5FAxCOKYTXwBbTmNmbuLA9Gd8OHxE39Ee+wJ/c5C9XAVG8Qs?=
 =?us-ascii?Q?WF+n1r08DfN48S737cTydZFft6MjYQjLdRYkRUZ7O4qHYL61wxOsOeAsKUqD?=
 =?us-ascii?Q?UDMWdY9ySlDHhyOEo75iFdGbvjhedzxpa/lnnAxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 037282dc-591d-45f3-e01e-08dbee99a5a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 16:06:29.2753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwQfvQldkz24jvJt17yZ/erBPHJEnb62JdCsSzaAndMuFnSh+yzl4MRxT1rfD8XoM7fd4Jg9o55M38uSB7tbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   9ba52bc66d03d8fa986fb5a6d5a026702eb90747
commit: f421d1db8a29dbc00303f50c2c01a495cd620a24 [9/10] x86/ibt: Implement IBT+
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251541.xeW8anBk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251541.xeW8anBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311251541.xeW8anBk-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> arch/x86/um/../kernel/module.c:(.text+0x53f): undefined reference to `apply_direct_call_offset'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

