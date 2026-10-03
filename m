Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50A342C80;
	Sat,  3 Oct 2026 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038237; cv=fail; b=lEyilTljLxIwCDN4sY6MgGmxUlADgqRpNO5TtNu9HtGOIVem/gkk5gHQZpTxoQA3PjS/91wxWAOcD9QeOLPNiTmSgA/NAkiKUSyvZh4czPI/GYfdH7xFcsliPEFKN7U+wh+Dd+T8M8+D8axOBRnQFsZZPd/vtq7XoWyELSa9Wnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038237; c=relaxed/simple;
	bh=W+tzg5kYPGgqS7UKUjddPmeOMYU8UZniQHlg0odYyMI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=njflEfDTUNVBHhLNWnAfmEmxtE9yyo/FYXmgDSBeAAbdTPpgY6VDVjrk2YD3L6vMZA3AN38GzKfvy974KAFCBGNs/EW9MlBGXOmMTeTSRY84eh/XNKcyiu2DPwyCvb5QCyJmAk3/O2N1bsF3OTrbfrKQZC0T0mKrtQ1YDAnBA1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2iEwHTs; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2iEwHTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038236; x=1822574236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+tzg5kYPGgqS7UKUjddPmeOMYU8UZniQHlg0odYyMI=;
  b=e2iEwHTsYzkzq+3dN+4xSThrXWF0J6Ht5z7RjBtuq9xCny3lOEPBMxXX
   KkQOWMecwVfF799Er10D/aAGwQh7jtogcPLLECHlvtuMPkFnTg6ecWpiK
   1NsXavsPVGEKN6hH/PD6c7n+UGn8m2RwAimi3mNzEG6iR/GJNRwN/dkUE
   LevEDm3NnoRj2SRDlBoRqUN2PR2z67oaBNitwIvgklclCz+IRqYzbdDc7
   j1j7+pcWuptnhparHCl0FbdiIuH3kMQK4GOxRNBCtlXTveh71vjrA/6Yw
   0mohFMRSGRDtAoeHeNy8vJ9rRJdoF5yovTAWHdF2+ikZa2cmI23v59d9b
   g==;
X-CSE-ConnectionGUID: qekZ1uAIR1qi8Alo1ln7sA==
X-CSE-MsgGUID: cNYgr+N4QsmcHf0T0EUVhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90807827"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90807827"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:37:15 -0700
X-CSE-ConnectionGUID: icI1CzxpSKScp/m6jHYsfw==
X-CSE-MsgGUID: UfqemyRGQFetiLr7RIsyPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="443630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:37:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:37:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:37:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG64yQ9Lnz1xD1BH5jbXmbe358Qh0XkUUB7GRMcDrmOgD9KRhDoUmkgliYeNEbX7dKvE+75RPf5bHaB8AFxEolEjkMsb8Sz/1jPWJtLqrDFltGtQ71ZUaQec8LM2yqcE0TwaNVojfpxqbi4yp7PvUnwncCaFBKq3SMAel4hckL/eVEZSSwp+9GibajL62+bFmbYsQV/p7+mMxBUqxZ1MIkDoyMRYcchUktzJV/mp2TkPVXa9FB4chyLJDz10Io5E6LcjbgVxKmKypYEEuLW8YqBR2n7DPNrtNrUfiSZP58PME55VbWrZTCa8UmkjSrfjXECCHvpLtgx03yKShZARtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zi9iuxe0QOZv1a8xv91/G901ARL2JnYfO5+Yw1IWSg=;
 b=xkMN9rwdPNUUQbdzz0Gw6KhMJ/kjjANx19MdXaqUvp4o91cHdIroZyYUWDAjbBreyoxe4xwyqC6ph4NcEFcuJTcrqD0as04cHew42BTWdDf8UDEKjWBpX9yp8nGc+zWpr1YasG7oTPFkc27cZPzE4hUT3vdcHYHi32uxOcOS2Ddz3D4AyWOTD+Z7zxk8we0cJ+q4KfOVjFCWThumXbAB1Htv1tnadU6OUp5EuyZyJaDafvO5jr+V6fj5/UoOtcIUTNWg0S1u7VuZW0D49vFhXLKgXz9iu0vJYLOG4cUYf5VM3hBUcqP8j0TUdGyLkMUo5scsxhwFWVFTBXWSVFZljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:37:12 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:37:12 +0000
Date: Sat, 3 Oct 2026 22:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>
Subject: ld.lld: error:
 vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x684): unknown
 relocation (801) against symbol prom_entry_lock
Message-ID: <asETELtvZGs1YpaT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b448fa2-173f-443f-0577-08df215bd007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|260925021311599003|10067099003|260925022911599003|260925021911599003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 19l+Q4VWDCKd2sLugg1kkNJ+wC3rD8wfQArfotH1kyzd1sKF61i8NTznepJaYfGqfBmor3s8gkgnE5z8n24bDr6ziDQ7hEWc7uXySMv01Q609JCAmDpzEWLXIFWZmfMpP5UT+yaLbKsWzgeZOWkrithObNH0hHUE6/JOJFd4GjcdchJxd1+8Sy6h6glS5T1CzGeZh6+B/Da5cAZ8kqBgKq2rZAzSeHf0Xwso49U+fjD4oc52e2WRwD9mfGgUbz5I7eqTyRFqZLKCI3vwNMGpjtAEcVcrtDE5VORiy+mIjev7m4BOqMZt3T2jcdQQ9JrGz4x5lWZoJAe4JpEyJZAzbToUAXCPVxLUw0is6crViElw8eJ8Il/d22HKV5IjJeJjTz3/GHih4Ghkuk6DXvSS5ahXS2101Ll40kBYlFsE6aftif8Viz5HZpJ09Sv8IFQ93dySlu2SGJ6O0x4mbVKrF4c2mpvSLDXETtBtxH28/kAmK4K2ekOBHfIFYhV0j7h8Qsjyo69w9THsImCMhIV37AEVybu+pnIUdlFZqrOPyaVX5MPCKFFaYks0syLetdIdqa0EZ3Om0LJp0eJTNWpNuOp2EcF09KttLUudVAvaByw+gvFT63sJO/dn4ZHb2rN3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YN3NSi4J4AE1ISEOd+ZAIjrOKwBGM6rKGDM6ZABAi3u+Ff+B3LJuSFZ99AkG?=
 =?us-ascii?Q?cQivaM6yUuVnG8Kjt1Zw9tAe7IRz2V7noG9JZC5EpQlqhJwjrbhDG412uChj?=
 =?us-ascii?Q?1IB6uwSnZOo4f9tSI2jn8Gx/vyyiRTida5wzPg/EbbchB64RKHezRBeeXUsV?=
 =?us-ascii?Q?JYSl21ceD0D2kYpZGcJsouNtMDzryvnmiuEamfSKkmjMdgKhkuPzDmS46PwC?=
 =?us-ascii?Q?Z7H02k0l3btRD444IcqrqduWc6YMWBi0mDh+BwRSLb7iUpNJzwGYFczYVg5u?=
 =?us-ascii?Q?pwVeRzzTWo5hdKXBO4W2fE1V9e0eXqzeysBAppUQHHvxVMbBdgORGWpebNi9?=
 =?us-ascii?Q?twjtTKJLLqaBWk/mYpW83KvkJfNOmpjtk4c9gdbqZBDhIjU3FltfYxJ3Mx79?=
 =?us-ascii?Q?/qQFPfPh1wcTNkBK45Wsb8/8/kciRvSkp7LZ9m55+gOTJhzzy7AYiDU5jmBt?=
 =?us-ascii?Q?ZlRbppnmZXh3hKEiYS97dsyCDiGN8+Wtz9rM3LXLRH0tuis/jFOQTh17X4zO?=
 =?us-ascii?Q?aUgrgRV1eFGefz6SgOYXzSO9rQu6ENrELXoyqsyCd+tVO6KgmItSoxfPsl9f?=
 =?us-ascii?Q?YbbHtGWMlicCsRex/vKQ0SG1hUTIKX39Ley3iQL9hnODQwLTA2UPwOr+NAKe?=
 =?us-ascii?Q?1u9YzWkWH+pQx8H5NtnhnPlK/PpdEpIqUSwSc2tJsWr3u1qUp/D1lOikfBSf?=
 =?us-ascii?Q?yJK+lVVSfg2C/FL58mvgNWt2Fo19+TBKbwYfziS5hcMjFyUT40QhvS94WsX2?=
 =?us-ascii?Q?RZx1/P34BgVKb4rMR4spElDCV1sBOg4qo8tzLATeHHo3LDeM2cI+58C76ZOI?=
 =?us-ascii?Q?X+Xztroh7zhwVdhQFyduoXpb1UCwyH502UFz3tgbnlNB+IawrD6mkUf8FYDG?=
 =?us-ascii?Q?YPyg6vhRl7NF2D9P6u/Sn2VGxkSA8FQJZ3gFVfyzQRTtI4Sz4vmpKCWBr9RJ?=
 =?us-ascii?Q?pk0uHEp8dl0Ap5htMCft/L5BDjdiXMOh7DrNlQnADaPsZibbM7GQDMARtPUe?=
 =?us-ascii?Q?uZH0FvZvQyja4hlFYj+xeiyObc9aiUgJ2pMZzHzLLYGfFQjXUMBaDFROBCt4?=
 =?us-ascii?Q?xxu6/D2aSlW09tyVgGFmE58w/VhuYfP/eCIOxhW0NcY8R/1aOWG7+umedYIJ?=
 =?us-ascii?Q?wdySk3Sh3j30mMQr7gRrYQikkfFE0Q7AGffVp5bTg3rso5rvoy/uZ/pmqIbC?=
 =?us-ascii?Q?njE7SHUS5Is+WEoDC2oR906E1Nx1qJg6KOxMA2PJMilamvkT3LKjmexwJgQ5?=
 =?us-ascii?Q?y0dw28JspgAOaIgCL0dd5eCXCiwVa311AH8gQnlH2aKfyrVTqiz1GlAwO/ln?=
 =?us-ascii?Q?Nu6uG8DmS1CxYClAvdZ+JJnMjEaWomDMs5EDMRVj28ZokJZicpSxw0mvP2gv?=
 =?us-ascii?Q?Wf0kZ+jifx0TUuHtVL3DBJRpYZuDio8fYoekptGbIlWCrnK12LpD18qkla5G?=
 =?us-ascii?Q?4we/9UCbPltG4rm/WTaGhfrEQufGC20KM8UUDqojQWu5net09HNgs7tjMZDa?=
 =?us-ascii?Q?t4AYXZ81ZEL8+D0N63u1r6t5hweJsqT8vCWMDNKa82uS2cHGFSy0xZWXcsmj?=
 =?us-ascii?Q?9vKr3IIRgfqzbyouDyEVWti51b6IlE5A9rLMUHT5ROt8UBumnuJNg53sw68a?=
 =?us-ascii?Q?qZfabkYmqrCN9y13lxM20S6DRe/2CZBNgmA67a9x56qsBc3m6WvVcG/jvAkn?=
 =?us-ascii?Q?UXv7/+/g/2unyRyro3//CYhu8TdLkGtjpurpBgrggQHVC9lTxZtVFpQ/nJ+R?=
 =?us-ascii?Q?Rr8ul3HDPQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: yYQvcaheKsfak0CCyy5W8f0TH0kI0f3eomZPo2wBOENkIDmXWRfiQXyW6gp0fgiZGFyeewkq+bJEj+KMvIp7sIdnZCKkggEiHh75ARI15TGe9ihhO07/Lnd2zuL1vf51AQx47UyCBiSVYEkoXtqYkqAxiwY5niCQq1pcw+0qXlrFeaFL48BkV1cNWVHORsrc6Gvmb2e1DiZvTZEST2TrZAwuVzrHRjSzpCOxQ9L2Io4qmkaIK48wjetTjaOUPkbTGR0Sy4MAG0QDg3OEIoQpnBoe4QKWX8xLBjFIdQj3mc5ek+f3M+CtCANrPyh6XJzIVWHFh9owqIxg0UsnCvPL8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b448fa2-173f-443f-0577-08df215bd007
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:37:12.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Hp/98dKIJGai7v4mrhB22A4V/E8wNCF8lL/YCBE8F1ncHIRin8setuW/5YYRQDwiuY3XkhuF78m4ofamrAfkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

Hi Magnus,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Magnus-Lindholm/sparc64-return-from-the-generic-clear_page-implementation/20261002-181423
head:   36c6f9a194a35dc53086ef2afa50bd6e9747a0a8
commit: dabe506a4d60b648422055fd406f41fc50fed87b sparc64: honor queued spinlock layout in secondary startup
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20261003/202610030802.2e9fM8jA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030802.2e9fM8jA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030802.2e9fM8jA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x684): unknown relocation (801) against symbol prom_entry_lock
   ld.lld: error: vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x894): unknown relocation (801) against symbol prom_entry_lock
   ld.lld: error: undefined symbol: sys_call_table32
   >>> referenced by arch/sparc/kernel/head_64.o:(.text+0x20fc) in archive vmlinux.a
   >>> referenced by arch/sparc/kernel/head_64.o:(.text+0x2104) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

