Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FEB1C84A0;
	Fri,  5 Dec 2025 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896328; cv=fail; b=FXU3AVCJkq0Kt0Hwse+rQ02HsUE3Z4KG7UcoVaeJjwOnypnHfvw5sno7U3QRC62K7wpIkVuGPp8qL7gSHw9/UrG9dkDhrSYOoppUTrvyA0HyYRpew/BhMi8fLYZtvZwevyvVgB44Dkx6mSB0Cvd9+9ZyuFtMG5l2vOSPlJRwmWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896328; c=relaxed/simple;
	bh=haOsbnU4AGZlqvu3oaKbMbX6Na5jkWP29f05NBW9pGM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cf8Q30tf5E6/XVr5hcQHn6NBVGPMke2wjBwuqAj2MoH7e2z7C/gp2THuXHBHr7aEkwobFObNKBDU4he1wpmOTyIEvnThc/p5+sumtFDah4sftKOxbKwrsCMfkpi2wSdaT5nngzX0/vjeHpZulOgAB/j7yQaZDbQ2roV7hicN8CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsIvrwNS; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsIvrwNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764896326; x=1796432326;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=haOsbnU4AGZlqvu3oaKbMbX6Na5jkWP29f05NBW9pGM=;
  b=MsIvrwNSFc6qGR86l240HxWeP+ILALk3L+6KCoMO0qlyDcIiNyiHYGXM
   292Sb8MjndO1pzgBU8m/Hf88RAuAtzaLZOfGXzGjzR2pKlVu2X/v1ZUKy
   GbRqeYqssDRTvtGxRXnzF+PNgXFezClEx21pMkRk8IhefVgrsyYgS/1h7
   vfGlhySFncIwN3yAQ4KY19g4PmVrgDCSTdyOv4VOrt1Eb/1t8JFbSoHlC
   Vp0QIUGrWWVGe1UqfeNf/KfK1v1GgCLE7EmTpxi+ywwB6anozUFzTLMts
   EBVN0ZD+63pxJZG4iy0Kn/B1hNoGGKHJkGfbln4IPHhNmCUI0BiFZEdqW
   A==;
X-CSE-ConnectionGUID: SLOcOjKtQXOAUeapcw4PTQ==
X-CSE-MsgGUID: br5kLSKUR9my0xy6gSeODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77614013"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="77614013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:58:45 -0800
X-CSE-ConnectionGUID: j16i9+o1S1ehPZlSG8ESKg==
X-CSE-MsgGUID: kqM0gcIvRLmN9Qb9NCSaTA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:58:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:58:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:58:44 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu6IGdokP6ZyUBouuFcL8u7nWhlKoUGN54tojPzjwJYdlhvvKyjHrgJZZyiwi5ijMbyTALMOYuMC9PiwVbp/drDiOnHOJDQJgi+VI25HmBrnSSDYXGgHpDGT43tqjHu1JS5C/t1Zdo+5tIKM0tITqQHB2ZJV1cFsZ8Vea4I5KtjhO4skj6fSt5mOGP7Xx/fhTbl7UVmNTXJ2yn5dFXRjP+J6wl7PC7oawC02M4d69uV2L8NV7EZHEs6vrRPMApkJE8WLDJhbQVxNKbZ1ANM11kdJfVevyHBqDcmyOuM0CMIYb9jvHZpnBnk2cLhDONVNGqVvoc40UuFaiEK8He1AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6gv2zyrtxdS+CfCrSAcm1VkY89jv8kKN58LxPaQbhI=;
 b=hNVikn2OXO79vmxsKY+DKtMFlAn9q91kRSIsxTaE0BpOURwQO+rZKVyG/vQ4r2zFOKg/sySYmJdCY4l7ZPSAAP68sONB3Ay5CLJ+jwIEetNvjySMafBkq58AqHfXHpYotTcT4POt73ZWPT+1P/PgPg6ZETesLUjIHQdggT4yHnMCxjRSoPVYaGExXhf05AxkqL2jCoxdd1d4XgAXqJpyaMGJCgAxHVaofQXPIdr1b6jiMcqSGIeAhLRaPo7sLixXvKdao58Ft501gMWHLw2x7cXLcJViYxxJm5pPGueir91V+gmZPMboqR+bPqWSqnEMYTVw/o9+BXDIw7VKlyck3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH8PR11MB9460.namprd11.prod.outlook.com (2603:10b6:610:2be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 00:58:37 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 00:58:37 +0000
Date: Fri, 5 Dec 2025 08:58:27 +0800
From: Philip Li <philip.li@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Daniel Gomez <da.gomez@kernel.org>, Andreas Hindborg
	<a.hindborg@kernel.org>, Oliver Sang <oliver.sang@intel.com>, "kernel test
 robot" <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Benno Lossin <lossin@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTIuMwbnGHRWrS9X@rli9-mobl>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
 <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH8PR11MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 677525b8-b8da-438b-f43f-08de33996c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXF5d1NVU0JpbEozMGp1VG0xeERUOWhVVUxXNkpYckRuUFVJcUZ0dnl6SG5x?=
 =?utf-8?B?L2NodnY0WUdtTE5tZFpmaW1oS05UYTNxN0ZhNE4wN2dtakNJbG5NRFpKZUdr?=
 =?utf-8?B?eEVCdGZ5WTVFNlpSeWNUb0wzY3IwazcwaWxWL2UzUFlUalM1cXJNZ0prQVAr?=
 =?utf-8?B?MkdRYnhaeCtIaVhxZmRzQTlqcEJkRFRhYkpJVHhlOWg5SFBiSFpsOVZhWWJs?=
 =?utf-8?B?UEY0YlRuaWtDZkNwNkVvQzE4LzlnM0hEZWlZM1RaY3VWbFVLNitZdUNvSTU2?=
 =?utf-8?B?cklDMFBwb3A1SitwdExuRjJmcGtzWW9BQzdmRkt1ZndMS1A2Y1NxN2FqU1RO?=
 =?utf-8?B?R0pvT0IweGxEQnZBVFBOT3BralNWam42amx0K051K2t3N3hEdE5jTVZsamZk?=
 =?utf-8?B?TExHeDhsczRiVGVha2lqU1hpZ2ZabGp2VisxdEsvUkhacEJHdFR6V3h2REpJ?=
 =?utf-8?B?TENURjlzYTdBYW5EWG1rdWYrSTJXYkdIR3RHZ3dZM3hzNi8vUE5ueWt3TmJv?=
 =?utf-8?B?Q1oreE5MUVJPL0dvVFpLY0NvVTFrUFRMdTY4OU9XMml0UEtBTW1kemF3VUp4?=
 =?utf-8?B?ZFFvSTUreWY2MmY0eWxPY2lsbGRuT25vZDhwK3c5QTRyOW4wS1J6ZjBSemQv?=
 =?utf-8?B?Z3pHVWY4ZWM2VEhiTVUvTUQzYk1UZlIrQ0VLRHJZSEJrUVZSazcyNzdsdFFD?=
 =?utf-8?B?RnY4eE4wWnBPczkzNURFUHI0bUYzTDVlT3Frdk1WV1FMODRseHhTbzNJKzNT?=
 =?utf-8?B?RklKS2p4TmhuMndDRnExOFdsb2JQNmIxNktGaTNxa0Z4cUU4SXRzQ0hEWDR1?=
 =?utf-8?B?azhMVGxIYTlIc0JqSTZrSTNjcm40YWxmTW1HN0srUW9YKy9TbUhzRG1mUEda?=
 =?utf-8?B?bzBLZFdOMWFneUtPQktUWGNqWUNFcVR6Q25IazhNUWlpLzU3NDVsdE5KVHgx?=
 =?utf-8?B?KzhkeElSMUxsYzFueXpaTGRnTTJWVzlVRmE4Q3dCU3cvNnlueiszTkVHYjZ5?=
 =?utf-8?B?WEMwbmtVUnQzQk44a2FMNEN6elVkQ3lrbWJ3SHBidFd0SUVDZWc3U3BQY1dS?=
 =?utf-8?B?ci9CRnhaL0lSSDVZK0ZIS1RUZGo0bmtsT1RoS0dvNENzY3p2VHIyWE9Jczgx?=
 =?utf-8?B?aG5MdklWS0o5UExuc0doSUlpZmVMWWVmNUJJWWZxRnl1NTdja2hzcTFzTWZh?=
 =?utf-8?B?RzhVRkx2dktyV0F2dWNKWGo5bC9jcS8zZkJtdnl6d2tKMTJWK2dBcXFQRlIz?=
 =?utf-8?B?V0xMeWhMcUo3Rno0TnBhVGZESnF5Vm1KVE0veWhMNS82eEVubDdMWElaK21K?=
 =?utf-8?B?dEhpKzVWc1cyQlBQdFpUZXBOSE1Cb3h6YnE3b3BvN3BSZjUraUx3cStnTjU3?=
 =?utf-8?B?WkxNYmU3aVpBeTJiQW1HSFFnU0g1eS9QOFI3dWpyR0RVVzJsb1pWY2NXSW51?=
 =?utf-8?B?WWE3Mno5d1lRNmpQMW5OZlVUb3NUMGovMlZCSzkrcU03c3I5TjQ2UWM5RUQ3?=
 =?utf-8?B?UnFreFNMK0hhRXYwaW9Kc2dxYTU3KzRQcHIrdkw3Y2U2WmtQRkg4dEFMbEJS?=
 =?utf-8?B?NmlwTVpPMlh3WjVtajZteTBtdjRSeCtIQ1BsZjlsOXZZY2tXS2hhSk93WUkv?=
 =?utf-8?B?VzRIUVJ1STlHZFFNYjZ5MWYvZGlPdFRwWEUrQnphUFRrZHNJcnhQaEJ3RDho?=
 =?utf-8?B?TTR0cHYwZmhDa2FaOTlLWTZINVF0ZVNzSmF6UElrVGlZUy8zMjg2aUVzYXVJ?=
 =?utf-8?B?cW9yNi9UOEhwY3Zib2QvT0owSWprY1ptYThhbWxZOXExdFlDVnlNalBLNDdo?=
 =?utf-8?B?WEtBb0VSUU9VTk9PUUFya3l1Q1ExdUovSEVMQUZrSzd6NEljTy9IS1k0ZENH?=
 =?utf-8?B?M3krQXo3VHJMUE0vN0x4ZWVxUFZSdlBtdVpxbTdESG4vaEdVWXgyMEtFTnl5?=
 =?utf-8?Q?stxqPUKqkxBkKY9q9O3mp5chDb7bK9F4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnJXU1lrWlJhSXhwWUlFMXk2SWhHcFBUTDNJOFZEYnBtdVpkb0pLN0RvUXlM?=
 =?utf-8?B?QzlVWmxBMnp3bVJuNDg0dk5PcXptdVlIb3JNNmZxVldlVnRsdzBDRzdzODl6?=
 =?utf-8?B?Z0JkVzRDblNyVElpZXlvS3ZBcTdrNzBNMVI1ZWRyUTljOUpoTWR0YVdVUGxX?=
 =?utf-8?B?czY0S1Q1SS9Db0JJZEVSbEFiczRYbmNaaEQvd2szYzFEcTU5bTA0dldoMUF2?=
 =?utf-8?B?aXlmZkFDNWhkY3RCRWd6eFNxRnZYM3Jyb04rcHY4UDFoU2cyVWt4aHl0OS9Z?=
 =?utf-8?B?QVVNMXJYbVRIc25vTmRiZFVjSEl6S0szeTRlZ0pRd1JZczFXTkg2VDJSVUFr?=
 =?utf-8?B?NWdFQjFJWUwxbDNCQXNpUXJ2SXBQRGxZcG1zQmFKbmtZOEVCeGZjM25IREF4?=
 =?utf-8?B?RlROdkRraGQzUDk0bXRNRElNaUVHMEJXcWMrYVlzbG5xbWE3ZzBmanBjcWhY?=
 =?utf-8?B?VG5aS0VNQzhZTm1uckNEQTM0ak9Ib096azQ1eHNrWEJTbDh5SjFCd25iZ3Mx?=
 =?utf-8?B?citWRk9jMXc4KzVmNGVWVnhEZjNIS25wRXJXb250TCtYMU5UTHZzUmxid0Vz?=
 =?utf-8?B?dDFYaUtlMHFUU01OWlBsOFBIKzkveVdES2M2dDRiL2lqeHVnUFRhbXJFK3hr?=
 =?utf-8?B?bzdPUjV0UnFuaytGNWVwZCtvaDhFNUFWaGVYVnhDdStCNWFmWEo3VkMvVk9P?=
 =?utf-8?B?c1NpU1RBQjYzUFlCWjIvMk1vaU5aUzlVNlJZbVNvNWZNUnlBS0hHeHV3KzdD?=
 =?utf-8?B?NnZvWFlVazArQ1dJdkNUMXovMWdId2YyTzJGbVhaODBlZDV4WGw2WEluRmFx?=
 =?utf-8?B?bWdrbFdZR1FVNzBXYVI0TlhGSVhpdXBNZ1UwL25GeXZQNXg3UDZSb2dXWkJC?=
 =?utf-8?B?dHVHS01yY2gzaDZFMFovLzcxQzZ1MHl5RVEvMEtubG9JZjllNkh0Rks4M2Fz?=
 =?utf-8?B?WXp5NGtKY1FubU5pYk1pQ3haQjdGU1dqa0FLRjFoc3EvNHVoeDRpVSthdnNw?=
 =?utf-8?B?Ym0zdVFrWFBpZThuaVdFRm5jSjZTam1kTXBBMXFpY0Z4eGRSMnc3Y3pvc2dK?=
 =?utf-8?B?TmtSbThXV2ZjYVF5L3JKa3ladUdDWTh4dmw2KzlRTVk2blRMM3NIaWxQWUVj?=
 =?utf-8?B?M0tEZmkxVDZWdmRLRThVSStpL3Q0SDUxaUt6cTRDL25FWWFLOHFxOHJoVnE2?=
 =?utf-8?B?MnpTL0N0bFduRlUrSjI5V1N0VEFuVjBxOE14VFlRNStyUysyY1EyWkxreWRi?=
 =?utf-8?B?TGsvN01lSDB6MUZ3REIxNHovQzFpSG1KUTJESllxb25lcHNHOFF0MXN2YUFE?=
 =?utf-8?B?dzQva1dRSCtMZ0I2amNEdWlFZjlsY2VLSU1tNTFhdW9sZlVBdjNOS1UxSVQw?=
 =?utf-8?B?NHpBbDlYWlFiNXhrSGxSdFRaSXkrODJhS2lrVE5hdU9VZm9XbEZMcmhyUVZj?=
 =?utf-8?B?SjhoSEovSkdKd2Ywa3JYVWd3NHdsT0F0YkhvcHY5NmxndUxaUmtaWGxPNTNL?=
 =?utf-8?B?S2J4a2dwaCtiSi9QWW5jYnV3RjNSSWdCQ211NytNaUhZYm9HM3NmdVdaaWtM?=
 =?utf-8?B?TlArcWpQaUozV3RNb0RFR2w1SUVoZFVuZm5uOWE5WHBqQkQrRlNvcHRSUDJo?=
 =?utf-8?B?UDZiRFcyK293U05PKy9wMUdmN1ArRGVmOUNlaURyTWN3eTRDeVB4ZUZuL3dn?=
 =?utf-8?B?TmpMak12Rk9iOHBBUVhobDd2TTJlbnhTb0Z3eTh3aHBaU1J2blpHWDg1bTdQ?=
 =?utf-8?B?eVJmVkFwQzVZMzIrQTdmakNIdGl1MEJDbWZKamVSRTBVTzdXTzJHZk9qcWMw?=
 =?utf-8?B?Ympqa25ZdmRoNEliT1d4TVgrVUxGZVIxLzMwa1M1N3JVOWdPaHpOQTRNTTd5?=
 =?utf-8?B?Y3E1L2J6b2lhOUpOaTUrdUVuY2ZsdDJ5ekNZUzRIdG1KS0JvWk5MeHNkTWl2?=
 =?utf-8?B?NXdKRlc4R0JrV3pkK1czQ0d5MzhTc0xVaytaVm5KRkl4ajVxRkJkOG12SFBT?=
 =?utf-8?B?RUtFcWd6TE5SMUREUnhHU2tVSnA1WUwyM0hmRDlkYWxDQUk4bVhGdFArcWNn?=
 =?utf-8?B?MzAzdklKWTBUcC96bUZBYlNVd1VlYlpOclQ4djdOcmQvam0wQmk5UWR4L1Fa?=
 =?utf-8?Q?unZm8bw/+VKhYG0e8X5ki/fYK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 677525b8-b8da-438b-f43f-08de33996c5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 00:58:37.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8nLospFNTpEpaysJOGiv60jNa3nPG8LeROg+v3H0j7PUV2rXZfihNmiRInTRMt/vGQGNWG/dWfOVLBElXFHIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9460
X-OriginatorOrg: intel.com

On Thu, Dec 04, 2025 at 01:24:03PM +0100, Miguel Ojeda wrote:
> On Thu, Dec 4, 2025 at 12:59 PM Daniel Gomez <da.gomez@kernel.org> wrote:
> >
> > + Any reason to use an unreleased clang version for this reports? Since clang-22
> > is not officially released yet, issues seen with it seem lower priority than
> > those reproduced with stable, released versions. Does it make sense to act
> > on these kind of "bleeding edge" reports, or should we wait until they're
> > confirmed on a stable release? Does 0day test both?
> 
> Some people in the kernel regularly test with unreleased compilers
> (all GCC, Clang and Rust) in order to fix issues before those
> compilers get actually released, e.g. ClangBuiltLinux for LLVM, I do
> it for `rustc`, several people for GCC, etc.
> 
> So I guess the idea is similar for kernel test robot? There is value
> on doing that, and whether one should act depends -- if it is close to
> the release of the compiler, then it makes sense to try to figure out
> what is breaking so that the compiler has a chance to fix it.
> Otherwise, if nobody tries, we would get quite broken compilers (for
> the kernel use case at least).

thanks, the bot tests multiple versions of compiler for both gcc and clang.
For clang, low confidence ones will only be sent to llvm mailing list for
check firstly, and for other issues, we will cc llvm mailing list who also
monitor this closely and help check in case there's issue in latest compiler.

> 
> It is also why I think having at least a basic kernel build on the
> upstream CIs of the compilers is a good idea (it already showed value
> in upstream Rust and perhaps we should talk about it again in LPC for
> Clang).
> 
> But, yeah, the reports can be confusing and reacting to them properly
> does take time and effort (e.g. I need sometimes to bisect the
> compiler etc.).
> 
> Does LKP try the bleeding edge versions only if a stable compiler
> built successfully? That could perhaps help.

For bleeding edge, the bot regularly builds and use latest code now.

> 
> Andreas also suggested yesterday in our meeting to have such bleeding
> edge reports perhaps more clearly marked or similar.

Probably we can mark rust issue as low confidence when it occurs on non
released compiler, so it will not be directly sent to developer before it
is further checked?

> 
> Cheers,
> Miguel
> 
