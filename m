Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17E3208;
	Mon, 23 Dec 2024 01:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734916720; cv=fail; b=V3ayUmuUO3BLl18oik+iQSKOTuzq2A2MSRxPwyQpbHB/LFF4W1hfwXqIxMmDKs9kjP781CDMhBHzz5FXBU1DIBD+d6OZzgXMFImWy3pTKx1vn5MfXnzhdKD30FuG+ovbiWtLwTrs4bTGSWdnrOeUkG6oMnewSwW0FkU1ajadl54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734916720; c=relaxed/simple;
	bh=Wyt0C928AVhCmgDoM3LCvSIIYeSGnZK2lr5e6P9YtCw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JAGzpFxMwCEzdFFyPt1Z9Z7HqjrQrGaacTx0pUs4DlBzULFXWViQzpsdr1qOOwqnwroG2ynUVrKGF9sYPmdL2q44UTLwX+jXugZhQOIqV0kqUL9ks6AOQvPVo1zyZljvS2HuJZC0BxtRWBBtPDDJVadd7t+TPOie5cJVs6V2R90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFIGZcbo; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFIGZcbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734916719; x=1766452719;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wyt0C928AVhCmgDoM3LCvSIIYeSGnZK2lr5e6P9YtCw=;
  b=QFIGZcbo3P93b0dWQNLG1yCjn0VDBM1tp/Xmh1fzXP2R3hhoz9dJW1d2
   c+DLsi9PkIsc+KFewwMP7GKzFyGyvQMxuFrFG08dQ8yWaFL7NUi09yfbS
   NP85OfEgVe0Jn28WCnZIcugVoJqzGYd04EZj/8xwg8LeW/Mbfh+gWjKE4
   wKwZblIlPT8Dfmlp3Num8wE6SM88MDR0ltk0zNWHoBy91aochOiKM4Oyg
   w5rC+28q91KwmfAycUJUYsomQhKeeNFtVkBsm9QUgdZYNKpIoOIvrCPB8
   CUowlpE2G8lQzz3jUCfS68PGxXIACcbNi30dU1fzFrOtGyG/8guJ5Bcsx
   Q==;
X-CSE-ConnectionGUID: SwlYo7JHQfuwJpWNksZocg==
X-CSE-MsgGUID: ceGgsFDRR0aiJgGQAv4/CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="34656768"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="34656768"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 17:18:37 -0800
X-CSE-ConnectionGUID: KjT4ycgWQYSzxbRwnBs3Ig==
X-CSE-MsgGUID: fT3LSk9iT8aLwCQx4LpCVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136398768"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Dec 2024 17:18:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 22 Dec 2024 17:18:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 22 Dec 2024 17:18:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 22 Dec 2024 17:18:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx084Wy179/xN8YQsPbdffCVsU/CyFdsl5g8NgqBkpLNeL2OkcWngWAdCE6rfUTlcLekP7g35BM1vbqghQ522ZRbycAx4LowTy89im4NYggPK29kSgNkW29CC6O0HIzLgV95ZZQQWjGSdjsQc672tbxl1RfyikTgSkQQFiAfYczbG5QthiqW5iuZDRR//1lMsSaTo8k0HXCCV81wxv36QN76e1lZ8xJ7k0eCb7sM+s+0c/iZ1IVFUkrfm28UKx30hK3/RMygSiOuJSBV4ZO0QuubPYweUxS6UJQEkZv0v6Fgj8fCR+4XJlQIzN30y+ybH/xtjKmsEsFj/Xzo5qS/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOGzE2xDqSt1FFkEkGBWPYsnMWt4GvXl1CWtOopEzxk=;
 b=RbDXi9v65O+xm1PUpa36JiB1p0YlwNtAcrgxCU03szXohk0xzbV0U+GkSDSrJlZmejK9h4jc6ngxq4zqK8aTitFtRa8yarv/oHqw71MqN8UQ+hsL0EIcZZ+bhAknlPnlyAOYVlaP8ocLRZNRxgYiLbmeoSU/drI1hH+kDLlrvVZmu17LKuZHaMh8sGGBpfENzbyZ4iBa6wJnSCjQ2vaCOizSKpQRjaBBI4Ca5xSMGTAt3fIp7ms+LAFsvD6XN67ZSV+6MutnPDs265asdeGFp2v166RQvpQjxo11slxe8mLRABBQR/Zkfu4YZOHunQHGydV04x6nNAgP/0AL3NagHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 01:18:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 01:18:29 +0000
Date: Mon, 23 Dec 2024 09:18:20 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Subject: Re: drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function
 parameter or struct member 'fw_shm_pool' not described in
 'tee_bnxt_fw_private'
Message-ID: <Z2i6XCqTXdp/cgcc@rli9-mobl>
References: <202412230640.Xkdah4yq-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412230640.Xkdah4yq-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4875e301-6dc9-42d4-9c2f-08dd22efb593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y/xBAYfFmnxxNeRatoRlhgv3DxiJOSnOoWPnAT4NZD/GcHjfRlnkK/Jzch7j?=
 =?us-ascii?Q?zEMV9lmiypANbcjgTB1pHQX2NlP6eJnc26xTaIjtoPHgUYVPc7Rd7u7P9slm?=
 =?us-ascii?Q?4siq4q1IWsCLZdxWjIZSFc7QCjLvTZfXX8z9a0jtqZCrMisAHMcVZkgp3VBW?=
 =?us-ascii?Q?JHCKdjoQgn7VUiVBu8yeOEuDWUXAIwIPrDyHYxLJg7Nq2DvajrWaVbPEbpyA?=
 =?us-ascii?Q?QvSjU8K+qv9LvInnJf+xN52OUFyOsw6i97TjAgPcVUA3xClTXH4CPGp3e4GM?=
 =?us-ascii?Q?ArhJgJGOz8nhoGi84ItYH4qS/tTr/xuRd97dH7zfXFyAM2TLGQIPgyttIrt1?=
 =?us-ascii?Q?HxrcDGzhLGwZEV5WYi5u5SdP/MaPTR9hbWSOgEBOQ6uhRmc6VPw6ljX8XWks?=
 =?us-ascii?Q?6HlQOc2Houh9Nhy34+AO7NqNdhpwPYw/Y1Z5rpBHCovr9RWCd/WyjhxusVjv?=
 =?us-ascii?Q?d2iY8o/2tMAYP7mf4Zyoyx+/i9TkMsa7z0/NKxIOvZtFB86TKetMjn3Rapq1?=
 =?us-ascii?Q?k69kP2NtfmUVfZcVA/BdkSaQrzksVjDwGSp8+vd2Jzh2rKOdpQU9tszLcyHu?=
 =?us-ascii?Q?HtGmCaDg41H3JrZL0Ep22PKaawGWdcCFQ+HiIJQ/RiDfDGStZYs+pVplo+TI?=
 =?us-ascii?Q?x04f+nf2dkGS5bxBX7JgPvJOBt59U1CBKQAPzQQvf4oXNya9fvn7t+lNTxVE?=
 =?us-ascii?Q?La7mDMNtDVnWFu7+AO/kcqHUFGQe8vc9iUgEB1MLoxXYYwekY8e8Xs7N+7yl?=
 =?us-ascii?Q?jVlfzJeQLVLdqHsRVj0cqz89KtovHTqsNOVtcrXdG5i4GYSCXbBtQkMkHEbE?=
 =?us-ascii?Q?VjQzu23rSVuWlBSPqJQHTbmondafiBnZNqD6/BzoEo5wlGc0qblm/PAIg9m/?=
 =?us-ascii?Q?1qFvXDokrCpIKz2ne/Br8pdZcQdEt7+JtTd6GN/GcHNEo+H3bKkfERQQYzea?=
 =?us-ascii?Q?CpNDsGp1fxLaAOu5wskKiR6UGMKAPRQsHq+UCNSDE57I9F2eJF3WH3lAH2IN?=
 =?us-ascii?Q?LKqq1j81mcX+A1VCKtBIr6FJyux/JUxB8rvoQWQFwUHNJjRiJGIDfDmjEAu6?=
 =?us-ascii?Q?urRdbKwrVH6q/dR5ihxq0MG5okj36mGib493+jUZD2Y+dZSzp2JQ/TJ5qXH+?=
 =?us-ascii?Q?XNN2y0sKADixHFN6tfvJgT5Me/QR2WYPjjP/jnSfPIDfYDYw//r9PiznGF/U?=
 =?us-ascii?Q?e5+kEJIADy8PQB7bavyaAvog+vAL2fGueWDX780l2Rwd4WykVCIDq8xOYDNv?=
 =?us-ascii?Q?/THlyI55WBISG6bZnn7dwl0L9gXV6z/rGIE1+Yy7TssxcKWNo3OAKmBjOVVs?=
 =?us-ascii?Q?KRh0rN9lJKyelW6Jlti6dyByZZwXp71DfZaOFmohNP7zrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uA+6M8yD9wuXrl26DAL1yW/KIwZcEGaV1v5KNKnBy7tpZsQG4pRqZExz/Cai?=
 =?us-ascii?Q?2ias83M22Q/Ufvd386RhwyBS+H7OfA0r4Yyjw0o8iAYpwrZH7cLxMI7zPLHN?=
 =?us-ascii?Q?8r3UuJUdBToz2THAv5hGc6KzOFNyiye2ZfLKv0oI23IcbBCo519DJ4oSJ3M6?=
 =?us-ascii?Q?clRcUpl9rwJqCnKDF3LRW8ONwZUFZtI8w5TyX4aWj5uizqCIo/1fayDuM8NT?=
 =?us-ascii?Q?wOnWqarnKrZrsl2P9SqkXLCrD5xWVs+m0zZ1B8/wOqXdtwZiUn4WT25yYTit?=
 =?us-ascii?Q?NOI+FeWbfjeMvhzg4pXJVoWS72IRw1nM9KgJLrpUwbdYhy9msieFWdphBaOs?=
 =?us-ascii?Q?hGxX9NR9kz2il/JyPZ+lF4TSBjP67LWMY7A6xUyH2FELX4kJSLn396HT/DfW?=
 =?us-ascii?Q?tuX4j6YFjZ3bNCJrzUBL0tOs2o92OaYoCyfk7DCdE0Oo++KBk2AemPWBdGc3?=
 =?us-ascii?Q?LzG/I6bW9RCBU/g8PmHQT94yNnS641v0ajQFMSAZg/XxIP2YUF5n/6hQBozr?=
 =?us-ascii?Q?f0P7PaPvel0vUd1uqUB1pXsOQjs1Lz6V2gGrU9GSKv1rk7zNx57/R1DsIwkC?=
 =?us-ascii?Q?hXNIrUF5jLoLeKsnnY5hfqyx1OsRgCwzmpp8HeA0xjgOB9H7Wl7czJ0QkN/y?=
 =?us-ascii?Q?IyZbrNtkxebe1NeJh2Tw8poQp55RGccJmLqr5GtoxiR0p5QsEpI285pzWajg?=
 =?us-ascii?Q?JZf4xQr7HcsS+URmGNX5kyw8B8UWb3l/POYt0ZAzOD8sXQfnt6VitMZvkYqN?=
 =?us-ascii?Q?pR4Af+SZchHBnPlXQr6O6JPqwROCai9Xvop39fcKJSChbmG/sD0WCJDGIrD/?=
 =?us-ascii?Q?uc+3GHRvlO8naksylsOzr/ILofv1o6OvuKyJUvBycT39qNksMqxIO18P9guq?=
 =?us-ascii?Q?5MZg1oh1Q2v3YEC5FAt9RxYyvt5pgtEkbkMPzKA7mconNI+p0ANleQ628G+Z?=
 =?us-ascii?Q?2oPNOL8IZUu/14JIY9Ijn8IslwD3I+mWWnVXoYEkoEJ29v4qjeUfI1cvAb+p?=
 =?us-ascii?Q?1lneUkENDV+G7HMOj4CU6AOsA6vfybcxKKr8vqISy3AQ3wM4n+E+iDyjyu1K?=
 =?us-ascii?Q?HasFdfzcm00jbT/pKdnRSR6Vpg2FXX6YcW6fVyNhLWhYRABBHSJKX6Fst5MV?=
 =?us-ascii?Q?xGEmXHwLoo0h82HEISI7xKQmS7aG+4cCl3+ccgyVtZZta8h6Qa4G85pigTXn?=
 =?us-ascii?Q?1rC1Cs89yYAX5A0sz3WVyZoQap9j4E6lY3LqQd0ruFGVTCC5m4ulHD0otAdi?=
 =?us-ascii?Q?fm0OmwG35mAO4/9F7aOvm22ZWJ+EkrMFWzb60lBN1v8wLvUwO0EmWL0jYIMb?=
 =?us-ascii?Q?5NHR5e7SugYO5MUSnUwm72rm7HBvPDogpLPfexRUFB0CKzufnfOgCVteyjgy?=
 =?us-ascii?Q?zgfn/wB8unHnAR22z9XZlgxgQAoK70pV1ekRvLQQUz8Uuq1/UUHcHuupMed5?=
 =?us-ascii?Q?/oqKgec1xjP6IPHAnxdl6gZDWmooQGv+dOBCBb+xE+yNsGHWib8gW2XIkx8r?=
 =?us-ascii?Q?DeZMVw1xzachHbckBznTQe18aff/Opu+h4GMj1fqHk6WxNgj9h/flmnKSKyF?=
 =?us-ascii?Q?xGIXYVFuMjAB0HWebV9tbcJXmnylLntZIw2NTR6G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4875e301-6dc9-42d4-9c2f-08dd22efb593
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 01:18:29.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urh3blxTbEAL7xQbyKiik3acCcKIJ6v/EA/N1g9twLdS3CaE1nB74VRaEW4JWHgbm31dM/bvQfNTuw4lNcoonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
X-OriginatorOrg: intel.com

On Mon, Dec 23, 2024 at 06:12:39AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   bcde95ce32b666478d6737219caa4f8005a8f201
> commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/firmware/Kconfig unconditionally
> date:   3 years, 3 months ago
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241223/202412230640.Xkdah4yq-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230640.Xkdah4yq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412230640.Xkdah4yq-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Sorry, kindly ignore this report that the found commit is not the root cause.

> 
> >> drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function parameter or struct member 'fw_shm_pool' not described in 'tee_bnxt_fw_private'
> --
> >> drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
> >> drivers/firmware/broadcom/bcm47xx_nvram.c:49: warning: Function parameter or struct member 'nvram_start' not described in 'bcm47xx_nvram_copy'
> >> drivers/firmware/broadcom/bcm47xx_nvram.c:49: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_copy'
> >> drivers/firmware/broadcom/bcm47xx_nvram.c:73: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
> >> drivers/firmware/broadcom/bcm47xx_nvram.c:73: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'
> 
> 
> vim +62 drivers/firmware/broadcom/tee_bnxt_fw.c
> 
> 246880958ac939 Vikas Gupta 2019-10-31  50  
> 246880958ac939 Vikas Gupta 2019-10-31  51  /**
> 246880958ac939 Vikas Gupta 2019-10-31  52   * struct tee_bnxt_fw_private - OP-TEE bnxt private data
> 246880958ac939 Vikas Gupta 2019-10-31  53   * @dev:		OP-TEE based bnxt device.
> 246880958ac939 Vikas Gupta 2019-10-31  54   * @ctx:		OP-TEE context handler.
> 246880958ac939 Vikas Gupta 2019-10-31  55   * @session_id:		TA session identifier.
> 246880958ac939 Vikas Gupta 2019-10-31  56   */
> 246880958ac939 Vikas Gupta 2019-10-31  57  struct tee_bnxt_fw_private {
> 246880958ac939 Vikas Gupta 2019-10-31  58  	struct device *dev;
> 246880958ac939 Vikas Gupta 2019-10-31  59  	struct tee_context *ctx;
> 246880958ac939 Vikas Gupta 2019-10-31  60  	u32 session_id;
> 246880958ac939 Vikas Gupta 2019-10-31  61  	struct tee_shm *fw_shm_pool;
> 246880958ac939 Vikas Gupta 2019-10-31 @62  };
> 246880958ac939 Vikas Gupta 2019-10-31  63  
> 
> :::::: The code at line 62 was first introduced by commit
> :::::: 246880958ac93989c97c73ae1e60b78b4c4c88c5 firmware: broadcom: add OP-TEE based BNXT f/w manager
> 
> :::::: TO: Vikas Gupta <vikas.gupta@broadcom.com>
> :::::: CC: David S. Miller <davem@davemloft.net>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
