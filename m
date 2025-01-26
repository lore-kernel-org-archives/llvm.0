Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95573FBA5;
	Sun, 26 Jan 2025 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737877274; cv=fail; b=bWjPTGxjN34ZH8wNU13OHP3igjlEvoKQqESVBoVvVJ/5N3waVMcZax6bMH1YWyI7NNkE+CjEgkMZ6kznzIACnwiJ4VjsakYhHvBPSlDxctu3ILBhpdyrTetW2nQAz/JmDMmRcg2MbsYbn+z4jtkyFwfyfl37kcqQyRBWQgt9QH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737877274; c=relaxed/simple;
	bh=AH5o/0ehF8bsNmQBO6ZGXNF14ouNL1oYqk6uBSyrfys=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r/KImVVGh/x1LHxKU2oNM7qhMI0/VuTNSma/riza4O1QkiKBaHWpS2U1YowbTbWBDzuMNcsrY/YJL6Jq27vqHnhnTOI3m+OctLOnWRYIq5O8Q11mB3PTDNDxFh/0+F/EH4qGCnLv5ksDGxBqoAj/QlzQbUGwc5yu0Qt4CdKyoMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vt3HlSJv; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vt3HlSJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737877273; x=1769413273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AH5o/0ehF8bsNmQBO6ZGXNF14ouNL1oYqk6uBSyrfys=;
  b=Vt3HlSJvE0p6EuppEeL5f1tPS7XljEnmTmP4D/BiVhCbrb+gCNcLHqOb
   Gf6fg1bP6Wyvw58A/rE4Xwdsn78nQucUtH62MffhCLepSTr7MGpD8oV+Z
   inA3kJESAUYvNy4tmvkQS3qoeOKGi4zKqVTOzkMeXE5CiZjRjT7RvTpqP
   oCwVuldU7NJo9GNy51dd8lDujiaR/HnscD7C+jQbc6WimX8QnsyzXiIR3
   Lmp1gkVs2SSLFjDtHO+YNggXQH9XmZufpAHRqhZEiFXTP6CF82SccwHyA
   S6UP51pqmuliiOQKKsXfUTAUad993RUniqNicQBhVKhaaKW7tm4Pf22qj
   w==;
X-CSE-ConnectionGUID: OUgyML17TF+wFpLG+wRxdQ==
X-CSE-MsgGUID: cjtC7rZTSAyNBLnYMFoirw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49019742"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="49019742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 23:41:12 -0800
X-CSE-ConnectionGUID: Q/v2HxavRFK/s1HI51In+w==
X-CSE-MsgGUID: AeDYILjmRrqiH+cWJMuZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108584367"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2025 23:41:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 23:41:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 23:41:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 23:41:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uzhrwgf3CJCmdDYf/LQ4qCXH8wn9ZyWwA6aW54zsWZGibiNDdYS1blBYPszAEPzDHQw1HWqy+fX7Nwl35UBBKHFzp5FhrBdtPi50O1tUJpO7L1i/2w32Yohuw6SihflV4JAfX7YzFYZ8oLyoaAvovwM85PWif3P+iJ8B4z+F+WBnvyFTbIXAYM/bmJZKKyvKyJnNbS+H2drpu/AJd6wdSsX76JV+qwtN9+ku+2U83tIg7ktPlzJ4TVIcjTLPrK5nUhZGinKKfvIVatO4i+cigfMWJutPXg0EgGN2yRZCGF/bYvZ8AiaxK/EUHmuoUsYW/YjseNNIzbgSOsvQgrBXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkpBXm7ggNvLIIY76lvr93DKex5+qlwok2xVdzm3pGA=;
 b=ACCleL4n13bAbhhxtIgB/fn7FB5LfWHTxYXaSpTzGOhHffXilywOUEzBIU7FWQXMeyIiJs+QGWrMVnYk9NhuwdFY7Lj9vhtbHGhAmxWmL9A17/JXVPWCBfxYAcdDGtKqoNnYvXk/ehYeiI7bZHpLmiPsfSIYjZOyIs9rJD9tq71Pt0Ea422Vyrv3qyNtkKZzvuvXQ4CMiqvUGcgkVEh+KYLmTSWwiqjkJL3MZmMUTQtskgXGmbmfA3BtPSXnKlzefde8pLWGhr6MA73AWNdSpFXjD12ZcbQPBbiBGhtZ/86AQf2s9fxlblR/6v45VI+PvWSyecrVahEjOV6m2GN1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6498.namprd11.prod.outlook.com (2603:10b6:510:1f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sun, 26 Jan
 2025 07:40:27 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 07:40:27 +0000
Date: Sun, 26 Jan 2025 15:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: [nathan:b4/llvm-trap-unreachable 2/2] fs/btrfs/btrfs.o: warning:
 objtool: __btrfs_panic+0x184: panic() is missing a __noreturn annotation
Message-ID: <Z5Xm4zop/xArOq0w@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f68daf-c93a-40a4-a310-08dd3ddcb350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O79hHFUfubXjzD9pkatixfha+XEMKWL2DnvemlZ29mUJgGvuCsstxDzPU8id?=
 =?us-ascii?Q?wNkYCJVbzA8J7tS2WM0oCgzeGPJjShRpjf/z29WaUWaT1aSQltJe24NyzcYM?=
 =?us-ascii?Q?AqtnPnzY8qsXbB+rbaZMOEYvDy9ccxNZQ/cyZUUlYrRd+0r06879LpPnQtKH?=
 =?us-ascii?Q?D88sGt/ToZR5wURVJoi2b8cKgmsj1FjBVlXnQYRKBVwGcdlIFAkf/cX4JZaR?=
 =?us-ascii?Q?iMbRsiDZjUyic2twp+AJ30148gL/cho7sI988EYE3/ZiYZcd9vH8Crd5j9b1?=
 =?us-ascii?Q?g2rFomfg8dw3qjITwjguuGRHh0232lGg1R4I/iHLr992B1o8Mns8sYVH7nkI?=
 =?us-ascii?Q?8Zru3WnQc9vve1gkZia9mM22xCacuIfkk+0+5RCzRANef/DMAeDKI+4cR6Dh?=
 =?us-ascii?Q?VMUgAukDrc4eIJc8eWbZHPKuWvMu8pLwdVhtp9eWZJheKJaJAUcv4ZGGGpwG?=
 =?us-ascii?Q?+mZXBZeVf0eH7xiA8aUHIBdX9RfhrBsvDL3hFbd3bsLVyPZ32+wq2jrwrWTr?=
 =?us-ascii?Q?YwNcHAEI6ACuPOng+8CGyzz9UJ07Tvm9bD/AKbCxZZzNOPd5lt6sqpp/Y0Ch?=
 =?us-ascii?Q?INaTEbd/EKMx5mdPftBjyFTYVjC4yGwUIOA79S9jfoZfT0yIJ+hSDD5vPiEx?=
 =?us-ascii?Q?E+J+K+dH4qHZWbEs0BzjgoDhJBxWQT2UcrzwBoCdnlDw+3j7vgUFC4PJdXlx?=
 =?us-ascii?Q?03Z6qzLAp8ChEnsCdpnuC3kb9OPYgZqmu9QI6UHKdtvicj2rv4jl/O9S76cv?=
 =?us-ascii?Q?5q9461Sp6ACl74UwJgjV/N+evSrXd7ngjPPA5ZNn/onNXnVQVZS2PSFGEN63?=
 =?us-ascii?Q?QNlJr1qdorwcRqXtKZaBDJVAtyBVDILnyc1AuNkYSFfdNiMslZQLvAA6xcGs?=
 =?us-ascii?Q?MuGsMqj5XtLFKRM0DfMiUcRvhCdazGW+VYRVEhIq1d6MU5Myly4xLk+1sy+7?=
 =?us-ascii?Q?Nl/bpJYJt8Z6KWXNnqv5Fy7azZ7SOkflcwbEJd0v10sAtHFa4Ixv/FTbmfK+?=
 =?us-ascii?Q?uCErBrp0NJQLt1kPkPzg89CHYeoq8vaNA3VdjXNvHCPDsZfO8xBtNXGTz5uy?=
 =?us-ascii?Q?a4gRkInUBbmu79Z/ntAUYlUS/uwOk6y54LrD5OaWHkiYMO8vfWoYa0glrY3/?=
 =?us-ascii?Q?YJ67hlyNqOa2aNBS6Ya9AKcYFnvCQU6zu/vQy8F8I3g4XlUwMn5EBDxWwiuO?=
 =?us-ascii?Q?L7CBTsdMQjH9J8rgbN+VAJnUnx1am305YH/jK1z9NPuOEXZ4fcobi7OT3MmD?=
 =?us-ascii?Q?G5fgCh8SLDRlDBaJTGnUCkXHZbkN6FQGbivAg+CYR5Lk1/8oVSQq0pyQjbJ3?=
 =?us-ascii?Q?Nl3/Y+spOvRwzAsVnJjSyR++DMglmkwXp5IkRKoi4ATxKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xsfpAapm8Nwf0bQGG075X0BlX1+X/rpRwiDeQXkFolJAQEZoHpL+sfPDNkTb?=
 =?us-ascii?Q?yQJrXF9iods01hIh5Rf2R4hfFUoWsYcS5/2/divU+/DbbktwRpa6X5LOkMZj?=
 =?us-ascii?Q?4LcwbKYPIK1eN/8P/7/tuKVSPDZGFsVaMUPPZdtAgk7yDewk04hjfzpkWAxB?=
 =?us-ascii?Q?BBMMOnjY53mwkL+y9wbPPbQMqurYCVY3x2paZ4UDR3sHeZT/0RtOBKokmtDH?=
 =?us-ascii?Q?g8dKacT+gzA5y0xsUePgGXOgQTKxaU6F+2nUdNBaye6AmVh1BA/VDsWvIQre?=
 =?us-ascii?Q?5gLTMZgUf7KMN0Te/mxKY2XO/R8zrj4xZFfxvfrslLb3NlSYfOeGC9MGn1Vr?=
 =?us-ascii?Q?/4NpQL6EEOufGfCBS4blDB69yo63r85hmoIjVukK2Nd0+Mj5DbIkqHve0FiA?=
 =?us-ascii?Q?W5rLAwA0oyukybmc29xe2sN8vn53pPRCbryjj6DYf44Y5VKBAIFBovxzFrcj?=
 =?us-ascii?Q?+uiNnLc5IaqUj6KyT0eSe3+XAkbvPSSxBhP3oHaKiIPVThEzc/nY2lIVGBNm?=
 =?us-ascii?Q?XEVx/aTJSkBQCZOSHmcqJj89o2NKPqwAQhkn2XscVuxj0ZjtOtczu0SyzM1z?=
 =?us-ascii?Q?/BMYXQNBQk19OlJkL9BaLZjeIZrOefSbAmY9ZOTJ2wPk7KuseHsrtc/koogO?=
 =?us-ascii?Q?EcG3IAKIE4pYUcIAFmDYxc79js00uM4dIUlMaRSRqbjvtgXcesKu+3K+IrGT?=
 =?us-ascii?Q?M0pSh+M7IzbiFVHKjGMqMZtI0ZgPvw4+WaKMmeDlo8YtTvVtKGTLTkJZa15o?=
 =?us-ascii?Q?hQGSixsBJV4YJl+Khe2Ai60G5eFxF4xdEI8EF+BXb/5D/pU8ZgZxBf1ml2mT?=
 =?us-ascii?Q?XkOMHDNBwD/ZKfmKl8mmHtypsUMHq58rgeF30D4oKti5W1At4PYMVHAjAAe8?=
 =?us-ascii?Q?MfD4PwNSxNbqgDFSVL2CtDVgeXuYrVgl8yRKsN5dIclrWCL8xBppNBUN8qQd?=
 =?us-ascii?Q?peRXxN9hgygJzbjmCEP6aDAUtcjTisC5yRhmASbhwtOXMs2+eRoHzK/wVKCz?=
 =?us-ascii?Q?lmNWDiHa5sGA6B12eX7pr2AjnlPzASoL7vU3kEmfCaDSJoUhEz/XzwOCbuQ9?=
 =?us-ascii?Q?wEviN1fco//EAY+7n71zc0pdIRKZveQU/m0go+Gm6dbq894mL2u7NUmS4NJw?=
 =?us-ascii?Q?raeljUly4c/gaTxC+Uqda+DvSu7uSPT+57kaxcHi+Xhem8TdnHCrNB0Xo1Y3?=
 =?us-ascii?Q?IV8j9g4yeyRXkJhETRNp9uctaCIkMGblJYVNys1N+egSY/Y7NInWPulh42Cm?=
 =?us-ascii?Q?alib/he8Db6sWoJGs9j9WwxYunusYYR1kYCiRw0vboGImqoHZFTk/ZwX3ksR?=
 =?us-ascii?Q?8m4iDEK7KWj4MrFboWM2+S82dCgbOUbGvB4yPB9ubPA4++hNYD3BZ7nrm0H+?=
 =?us-ascii?Q?oLtpAEAPZXOHILyXwB1wrLo0pEu9ZoVNgdbNNvXsIdBgAEz+pdq8lSSsjDq9?=
 =?us-ascii?Q?YPGNWD6Q8A9R066dZPXmM/HVLqUZUyqj7GcRzCrTiBJzqhHNj1aUNim+JfLB?=
 =?us-ascii?Q?z+LgEd8nK7AA8c1mXYQchqsxMcFhLygxtBJ8jI4KmbotvLFD7wEl5wGlI51A?=
 =?us-ascii?Q?GGtWqzhas+nWI/e99zO14JGgy0rJcB+ZaMsZZw0h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f68daf-c93a-40a4-a310-08dd3ddcb350
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 07:40:27.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+AVi5d+7bYmQSECukxSgiZx9Eq2c/usRZf881FEKaiC6Q922rz/RdqSl0nb5w1MmVmqFOQgYhqOMhwD3nyZXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6498
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   5aa3e312a14a904fe3a91d3e0366007253c52de4
commit: 5aa3e312a14a904fe3a91d3e0366007253c52de4 [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-buildonly-randconfig-002-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261433.b9lsAmjs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261433.b9lsAmjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501261433.b9lsAmjs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: __btrfs_panic+0x184: panic() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

