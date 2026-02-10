Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9733A9D0;
	Tue, 10 Feb 2026 08:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711196; cv=fail; b=eTFH1VNjtEISZF51IZNdWpgWYTYC29zFMOfK7aXTrD6ZniUzr+6+8l+jxtUB4XRUgN6k9E84Q/NBD6llHGhZij81MQ0Tg+VVW812jaYGsQwYsZhAXsvxqRkWKWMGUKyedxehMv01vaCjrkN56CTyTmvnkdYb5PylqR/UHq3YZa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711196; c=relaxed/simple;
	bh=LdbgRyJ6pUTPDrrbNzrmfsp+hP6xE3zdJl0nSRt7+N4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AFpSX+UgBQAvd+YMxzgU6mUh/7EDLxyDgCSAaHsOcvEJHyEVI6MVVozZpo057pUt5k4ye64r6Ok2sqpGLt5g1mTVxDUUC7TcKpHbg9k1D/yJUKCqSJaap5AO23vH5tHZkuh3Tsx2U0Np0lGk8wgT9gYPT3Q86NvDDWEeRyx9uNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/AHazE6; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/AHazE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770711196; x=1802247196;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=LdbgRyJ6pUTPDrrbNzrmfsp+hP6xE3zdJl0nSRt7+N4=;
  b=n/AHazE6iQWeHK3wRzEy++hODOPk9teKTy7/0FdrSGEDhsZ8P4s1uFI1
   q6l4b7hbFOuPXqvcQnpcnix7nJpf9RIBA1JHMIokqnhLpKDkC/preZCMu
   RqHwEMG4xY/nZsW2yGlx9W3RLYO+GvCQ+kZDIf+7BEmoz1Fuy+iAs9qH+
   h6SHuLT71HHm5QIshWE4saKMbKk9tYzqIiha/Vf1S6ROR8hGZSx1BTkCo
   pc58axpGm3TEzQHlrcNHstfBvxavlyfoCGfuwSbniVr+fO/46yaMLKJ5h
   Pvk9zQYkWELmxPrDFEEhubbVk8Mc6j3Sb8GrYU+QGIJZyLTEF5RTekYlm
   w==;
X-CSE-ConnectionGUID: iwqG6UnmTOOBTNLWcaYjxg==
X-CSE-MsgGUID: wgcwX1CESgeD8GBZ+v0j/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82471549"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82471549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:13:14 -0800
X-CSE-ConnectionGUID: N1IPXhcbR5efl3VhodrSqA==
X-CSE-MsgGUID: CnyuylHMTTKAHeGQoVITIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216355608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:13:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 00:13:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 00:13:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 00:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWnXSGXwI2O/hUmbWbNmPuxM6js/sOKfSYQN7UeYpxP2Vbb8ZZh1y73gTxtofGV6nPoZ6wYHoUu/ByzVzJ2Z/9xU3uZf/f0MMOJBdxgb9xREKGFVO1xq/aBteOiisa8QlYA9ciP8VsS/fjupC3oSxnY0MqxU7RHfiJfz0IjvJoobm04iN3oBzXHwLCwNxSN7uZb8QbJ4otvw8yH9Kaq1TD9kTsQSwLN5Q7DwuHRbQGaNFh9bdU1P+BFE+RK9qTZit5aQfLtuPN4bDjidmCdRxwDAk48r8BtqMT/WcReIUUdoUlCBfAalNGOVMQCAhDEQPWILbpTtx8mH35ai926qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrV17adOzfqjfXI73CdSmewlScEpXzpORo2pAs3pjMk=;
 b=io0Iyi3cxbJVgSdvBkArggjgrIv5MlDiRxC59I+4fcZG2c4uXUs60cmp2SQo2bneMUadPpGU5V4taLCUMdNm7M1aruXPmPGD1md0lJ61favKRUcg9p+5YBwfuVyK5l24Jr3jNQ8y9nKDWnugzfcNU59iTHuTYpd6R6juP3CHUkqumOeuKQiZtqDXmZzHVTnClSDwd7QpogYxPmSglVFmmDqck1WhpJ5Lzx7ZDRf1QZf2XkEPnKu18vCW78u3o1zLw8hp2/fut6AwPeY9vg3O3fKcCSqfXe2PlRX9+L9RLb6yFZ8FkSPP2pKTk63qEzt0ZKZ1OiU/moKSxl5PBH583A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 08:13:10 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:13:10 +0000
Date: Tue, 10 Feb 2026 16:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v3 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <aYrojvF/KylT47pi@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260209084820.57298-2-sv@linux.ibm.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6e7dad-900c-4230-f7d5-08de687c3ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ivu+2VwSD3TPQuMPfFPatKWoZMiYMuu03xsYZKgVNG9jP+Zfl0sIIwqNf6mG?=
 =?us-ascii?Q?wu6gA6xfgSjjnrD7u3UhTBf9N++wd5ar4mR24QlRaodh82Ryatgq8ZqRnekO?=
 =?us-ascii?Q?rUs1LunxQuLk7t8TWAxI13xi/1mU5RkIE4Uka4/ohQF1Lln0ph8pJzPdLpLM?=
 =?us-ascii?Q?+J9689gTwvmk2H+LVEviD784cslResFCk7F6LW0wGgpXJBCEoHq+O30rydcA?=
 =?us-ascii?Q?z938k6x/vRNY1wnF45ANnXxDBqafo0/CXLfXOBE/+M9CpBvQeCZhuGbKpi70?=
 =?us-ascii?Q?78iKwHZsQVzMFBiGuKZtV0Ba7X1ZFLllsVQ8zNY0ioVmw7Om4rxtMBWtARaG?=
 =?us-ascii?Q?QDPuVjXsp+1LqQB1tAiWrDsyvGTmdI4aWYCSjReBYKOiLZqHowisZINVY+l8?=
 =?us-ascii?Q?SnvH3reoXyHGptcMIq8SX5FDqw2gQEh6wpacyoeDguYUnU5Euh8zJdKsu833?=
 =?us-ascii?Q?5y8j4m76Ucb7hdnwgy3BoLCSFcVnqpx3RN4eZQLwNPoqlwhMdxyZrqS4kBSk?=
 =?us-ascii?Q?viUOMnG2QQjzPiGstNEgp3KitOAehX9Pqn4+1SaRMUK3t7HH5zbmuVnNpoYb?=
 =?us-ascii?Q?076v+abHc97wZqGUZwiybaMciqgz71v1qpczs1kGaCijmaFVJdk7aBPL4Fij?=
 =?us-ascii?Q?ck2R+EA5wrIWkxPJmHlYJTl0mbe3VXvE770N3EhOxVW8euaPKumqhfaumQyw?=
 =?us-ascii?Q?2tc2bWCd7WsUgaVVtP4xB/4X8J8lZyzjKwt2Mmh4cZfiwatn3WWjPCGW+Hz9?=
 =?us-ascii?Q?kwg/X+l1tGs04xcL+6XjG9lPTtYatrOHcTVmWSwTZ4wMObR3aqtjmC6Stgbw?=
 =?us-ascii?Q?Bkg2tUWBZXaYZZydY2bN5GknEw/wO1TiybuIINaKglPnSwLeoS9apaBSYw3E?=
 =?us-ascii?Q?HHFxqFrCMPnKp6TomTKsl95dhSiqJvitQczi/hs69ZOwSWDjRlxKkZCVu+OG?=
 =?us-ascii?Q?LVSvaN22YXbjInrQpIXEqe/ODZ9trTTIj4S5/sAzHFvBCmY7kigcq9ZwJRgN?=
 =?us-ascii?Q?kgTzUsw79j/JvOaIQCGJuVoyBgqZHx1KVUtsXUx2beB45vw8bfWo8Ck5JdRb?=
 =?us-ascii?Q?YQC/zaJLGylw9LgobGuKWFYhV2WNO+znOuFEoVSSPvdMv9cWL8JmanzDGe/c?=
 =?us-ascii?Q?D7hPcSBN7J0ucEpZhDPOtWHp+f7fdLgiNYdeCBlHn/0Qvl+3M5XrOHgEt8h4?=
 =?us-ascii?Q?1JuDGm/Sf/CWR4WkmXFodlKLkftpRR4O1Tm5yNqLtBDZvyaV+JTzm/o8i/Zi?=
 =?us-ascii?Q?AKVvA21bMatN4WU5BZjUaS7UxLjLBrdvRqa61wB1I9AxGZn2+XS/l2Q80PsU?=
 =?us-ascii?Q?miaVTxQR/OrKUfT/X+gBmu5goTVySMyhTIloB8vVJLkixxZQghMNrN48CqMm?=
 =?us-ascii?Q?JFSeYn4zqV5nnXsU+PPOpE9XPm4p7NM2eZi+04794mvxGLN7BJl0xuONCrI2?=
 =?us-ascii?Q?1wGxQAU4MTN+nVCOK9gGt1sR+pDhSnORlvxZ7HHl2pTY3NlYKttBNkrOyVCp?=
 =?us-ascii?Q?V/qjaA73OBArjXA31Ft3HpRpJOQSODyfsB3j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?166akKU94wUsYFZkfuIUy09y97WsXbgsekYKrCPkQAuuGgHjhnW3BsuOu3rw?=
 =?us-ascii?Q?piHi467+kLhh5OKbVUUJetO9viJ40SM+oazGK8S8064BMeOZb3n+9ygPZSG0?=
 =?us-ascii?Q?TxqCX+LYlOY8pB5S9Jg87rgfd7eZkNi5iwZWD0hj1PU9irw9rzru9+Ah4mHO?=
 =?us-ascii?Q?uIcDfi3TycIFeNuX1U5o/N9DgcUmQBp8L+VRAmKZeuE0tNh4fUErBWEcmi81?=
 =?us-ascii?Q?2ydSjfgCnKAajIz8iG8qitNu68zgY3qJj7Xh6fzwLiqZQnWmfZxswisr47yB?=
 =?us-ascii?Q?pgE0t2KQGu/Pg6r5HnZTeELPlDCxGTD8gMAcvfbbiPyewhbTz7BPuzVYcCtx?=
 =?us-ascii?Q?6MckD+gtiYaN2hwD6KGrXKMQrSq/C0njQvYWKe47jZKTz+t4vlV2U3yXIa6e?=
 =?us-ascii?Q?Jni3yxU7eZH0aKGHaP9TYKRIULqvIoWjErqyp7Es5mrkM6+1n37UeM5OOs5J?=
 =?us-ascii?Q?I9QzUAy6btDrqMkcPcHNXts2CDYsmbxXnRF2qDoKsZlNxI5EfNtbmugSwOUo?=
 =?us-ascii?Q?4bXnl32MEIF4om+ZrWKMB4yQOnmskyBh6D3dWPvbJ61zLszyD7/wdKRSYj/j?=
 =?us-ascii?Q?JmJA4iazqanTVsaV3g6vvJJvMY/uC2SpUOX3DgQy3w9DdFovhqwpvensc4QY?=
 =?us-ascii?Q?mrImMoi/yqquWi0sryhAedRs/rR+nwbVH6/X+CmJWocUz7wiyNa6g74egQcb?=
 =?us-ascii?Q?Ye06M03saFlM3yIskQUEDMFckxQKWcNg5gae+PF4vJ33Am7nM3w+QBkw1zWx?=
 =?us-ascii?Q?pbgZCb2IjlKIEUKspPP8VVDSF3Jnz1SPyr7Md/SWmAjsPJt1HVUolzfIU6ls?=
 =?us-ascii?Q?qRn1WgXtjXALhASbX1+/OhQN4u+f67Jg2xhlI0dn6UnX/IJRMAjK4mKO5Yeg?=
 =?us-ascii?Q?nz/S7r33pDJrq5+kYWsrarCfROPOJIF0Er9tHQKgFezr/uP8UAeduS9/5q0q?=
 =?us-ascii?Q?4sn4hrS5k2D2rc1EKMAwDP5vneLrckeM4QF86EswC3+LdsUk0Ojujw/s+AIX?=
 =?us-ascii?Q?IzTF8qzXLCfj4+6sT3k8gw+LkV3MF0ZrAhnqdicHG474u4isnBbFU6jAtYVs?=
 =?us-ascii?Q?pBxtoMRSPnDsykQM3Ur7FwAbpwVxwb6AN4MSbOpNbVKoq2rOk4wGRQB/FrxQ?=
 =?us-ascii?Q?vvh7iyXLrBKDpF/XUz68Yj+aXiyo6GryZ4wFlL9lCRlGfEJ6x0CdsT9lPY7k?=
 =?us-ascii?Q?7KJOVeat8R04GOE8ACTwGlBeOuuq8qq6qWgGsromoO+8Y3oJzdkq32fTk2SN?=
 =?us-ascii?Q?BZFaMOYRHsFY+HsAjcxbYX+iClTTN3eC1ESEgCx3wLLjrIHV5xd/XS2dU2sE?=
 =?us-ascii?Q?Cka4Rr8LH9gybB/qwsinC2J5RiRu173YR55N2OUy7lfa4ocOe+WMbYwyTTXg?=
 =?us-ascii?Q?HB1vjmRZQvEsVg/CCyYadzktacf3MwBP+a1BUr1jQp5fCN94K3dHZEsvG8mq?=
 =?us-ascii?Q?MZXuM01+tahaCOMH7tztsSCOg3vIQKudSc1ikroEHVBWLAGWEpA2qGliprMC?=
 =?us-ascii?Q?SuoSIiHjfF1Hs7FZBY7eu5eViiZopM1/edsSQDL3xzTgwV0ElUvylXN8uPY8?=
 =?us-ascii?Q?vuwtT3WAnkMFo7GMARBMHJu5FwY6sLwp/elMmWsxfQ3J8/qojLuw8UVg0x9v?=
 =?us-ascii?Q?biwj1IWNoluA2izZLnkyN64LCVWo4LMZVPkNxHh68TcWxvvlH7PrZb71sHBB?=
 =?us-ascii?Q?aeH3c7WHOUpeDnoW7KLF8VGgnjFZ2UyyWJJ6TbizBN8H1/RM3gLVDF9JvawK?=
 =?us-ascii?Q?hjdLxkVMaQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6e7dad-900c-4230-f7d5-08de687c3ad1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:13:10.7504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC5wxpivZlPoDaBnms317jZ/8R6Np2gaBmTyco+NSy1CzXhgWJMO7kDVHQ8lbjarHUDwJ7bDkFQm+8OnJdc5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
X-OriginatorOrg: intel.com

Hi Sathvika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-powerpc-Add-build-time-fixup-of-alternate-feature-branch-targets/20260209-165156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209084820.57298-2-sv%40linux.ibm.com
patch subject: [RFC PATCH v3 1/6] objtool/powerpc: Add build-time fixup of alternate feature branch targets
config: powerpc-randconfig-002-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101507.3iIWJO45-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101507.3iIWJO45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101507.3iIWJO45-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/special.c:289:9: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
     289 |         size_t n = 0;
         |                ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:86: tools/objtool/arch/powerpc/special.o] Error 1 shuffle=3996209845
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [tools/build/Makefile.build:142: arch/powerpc] Error 2 shuffle=3996209845
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:104: tools/objtool/objtool-in.o] Error 2 shuffle=3996209845
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=3996209845
   make[2]: *** [Makefile:1483: tools/objtool] Error 2 shuffle=3996209845
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3996209845
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3996209845
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

