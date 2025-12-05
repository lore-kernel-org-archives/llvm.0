Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE62FFF91;
	Fri,  5 Dec 2025 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933299; cv=fail; b=nX0G7J0cxP8deT61KR84Ubcj7vwFYtnmofo672Bi9+CvOJGk9CI3rGOFA9VwDqA/CkEJZofoRWahcGPKBQDW6w7KERp2bDnAxpxhoQYPLwH0Kr/t9+BCIKPNg1sb/xg8o8fo3K3pqDSPI6ImcnsXilFvGtftHIZMXfeOPXf04WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933299; c=relaxed/simple;
	bh=fxeRRgNXsKzkm6k29I8PiynTjLe5jleYZQbMvB+pVNY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qTgJef5D2B4Sf1YpVP+TgpmNoJI1NHzWPSWHGOEbUWBUMhhdY/6Kuq98fbDhrZDraVB9t9JctKjCe8yjoG8OaCmNP+1hSR1yMEU4S+camQJVKx92CROry6mRralofA5rhMHt3Eo9t00By7z8M8N9hNxVgIv7tz8WsabZmoNYT7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnm9U2+I; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnm9U2+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764933296; x=1796469296;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fxeRRgNXsKzkm6k29I8PiynTjLe5jleYZQbMvB+pVNY=;
  b=lnm9U2+I4LT+g7y8TVFqe+KyT7RYbD6O8bvyLuXXnzFCncJIUuiQ1vSd
   g+s08pqyJ9qIFHEPwZHkbabHLG+AiDPyXEqqHHZ5KNY17TD5n532wTDbQ
   NpJKQyME/om9zVv3ASNyCI7FrOUkegiIunspibDnpo1OW3nIPWnCDRRad
   uslfy2Sqa3GJw8ckPqWr6QbkPhKrwDCp7KLwYjfWL9a3ojkKjAeY4GiJP
   ysKehotUlQ1YMgc420J5rief4M5jufOpBwAK8kFjoaQIJE0BoAFOjMUMm
   n7KpoAosjiyfydd3wZzuatew8gTn/MtthoJRvpTP9Wh98tRlqm9sScFVQ
   Q==;
X-CSE-ConnectionGUID: XDoIh1+BS5+iOukIGeFADg==
X-CSE-MsgGUID: EQyxo460ReeuusPbSkXK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65967262"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="65967262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:14:55 -0800
X-CSE-ConnectionGUID: fhPtwNQOTNOiE3z6zvLPRA==
X-CSE-MsgGUID: 56C639jZRJuxLRsvVu5ccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="232648251"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:14:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 03:14:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 03:14:54 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 03:14:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChaLU4xHt2sxhJ60EBprkyzmt8jzTJB30pcp3Pio8R/jZXP5f3/sDTWsBTFxFaIMclMgtosk/wDBkayofzji6eAm1moYZuM9Rbd1Ym/7ShxbBJSdLZ3P25nExJV+EUjkkUswqtoFHpEeP2zr7w+aw3DjA8kB8zHeaBoUY8DRyp2vwta5Ov4aEJ78Gqqoq+o5zYwc63Ld2ld0qv2d5As+DbLF3mTbjjDGuo0613Q4J7IjWc6Tat/yGmfo6PSLL9dpTGxwaY+hsn5vs1pj15Qy90LF08bW1R2KPo11Zld8Mk1v0Y6QJpvY6h0TrPKYuIzWZDKqyHu7Ocg5HE6jTy9ZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCOGwVz1ukwJ4CNhHXfphM3f1TtDhKQ+BaYbLgbXWmY=;
 b=XiLIADKExsseHarZcMUcS1y5t8J3K/k73q9v2wZa8sj7GaqgTFYQI1U4LAoAHR4uQIbEqzxN9yWz28dbyAC7E8sdmZ1HFt7oiHub++SrthRxFuXRYvwseWfJy65MVk0daUMXYnnPtaGXdeKIGC7pdm9BwVJ+RBgw4H+ImlbgEQMeSvd++kkTwZFezAKpL7K0eRtaa9hBDo018AVN+1stEB/2x88UrNRNlb5jNBnF98BsPfBQRjxJ2OGn3ggITw5FMdZcSlzK4vSLPiB3eoN322jA8SvUMKCu1Otn1ZogFQ/M94vtSWwmDCZNaBbVQiKgPguTlQsWCSNrfz8eqhrA5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 11:14:46 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 11:14:46 +0000
Date: Fri, 5 Dec 2025 19:14:35 +0800
From: Philip Li <philip.li@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Daniel Gomez
	<da.gomez@kernel.org>, Oliver Sang <oliver.sang@intel.com>, kernel test robot
	<lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	Benno Lossin <lossin@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTK+m/oHeIDa7UZJ@rli9-mobl>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
 <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
 <pSndtrQS0CVdjpKHPwropf0h0SLk9DiwQwWu6pGGj7MEQZpbLkBctjfbcbmdn7tk4IyZWZUE1UgrktBDmJrPHQ==@protonmail.internalid>
 <aTIuMwbnGHRWrS9X@rli9-mobl>
 <87cy4tw6nq.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cy4tw6nq.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: f46f8d87-e90d-466b-9a64-08de33ef7f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnZFaHp0cENpY3N3bmN5V0IrQy9URWRJK05POG5MZDlKMzFBZy85Y0N1SWVl?=
 =?utf-8?B?UWV1MTVDNzNwblpkQlBzemlaS0tnV3RhZHBWTE9uMk5iajdWeXZTZjllS1dQ?=
 =?utf-8?B?SkNRRFQ4MHdodU5EV054Mis4d1kwVTB5UUZlRndkTmMydlN5SXFDUXc1dGhF?=
 =?utf-8?B?RklHdGtJZjBOS1hmbE5LVm9lWlNJaUxQV1ZqRmtpNXp2Q0didGN1MFNPTitk?=
 =?utf-8?B?SEpYaTEvUkp1Tm9lbm55ZWRLanZBaTdIT3duYWwxWlBhMWl0VnpLTGpmc09R?=
 =?utf-8?B?b1lBUnNKZ1YrRUY5OUY0NGR0MG1ybFFVL2dFQzd5Z1NtSVNjRFpjcWxiSHJO?=
 =?utf-8?B?TkgzdlQvc1hVMC9tMnVkKytEL1hSTnY4TE1yd3ZMZnhZa3AxT3BablJtRVVz?=
 =?utf-8?B?TTFhUmZLVTVQQlJVaUIrVDkwN0ZsdHlKYTRYaTVwNTlQQzZ5aENkc1BqalRs?=
 =?utf-8?B?a0phbFhTUm1lSWUzS0RBTTBQS3l2d0JCNVoyUzFJbExicHpMeU41Mi9OSjVn?=
 =?utf-8?B?T1hUV1MwSWYzQm5LeGNoaEVLVFNOMXhvNFZBVnB6Z0lrZTh5UzZSTHZlMUtW?=
 =?utf-8?B?RzkxN0twK2J0Q25MK3IwUkF4bHFTMnZCdVlCbUQwV2tlNXRJekIrSHVzenVz?=
 =?utf-8?B?aHUrOWp6b0R4a0VubG05ODVnaEg0Q2lGZm16ODJNUzUzT1VZRXcydExQY0Qy?=
 =?utf-8?B?WENHQ0t6Ykt4YnNSVEs0NERENy8vZS9NUVB3U04yaWFLVFV1TTI2VVlJaHpn?=
 =?utf-8?B?aHFLY25yOGM2ZjZXVENoRFowUmtvQUU5T0lseHN5NWdsM2pWYXNGZWNkclph?=
 =?utf-8?B?QUhUYTVTWjJ4WXpaNEp1R3hXc0dwRHZHREpQNFhaN081SUk5Qk1PM1ZlQmJQ?=
 =?utf-8?B?bmVkb2s5ZXMzUHU1RTRoUFVqT1pISjlEVU1ZeEV4dkZXeStzRFhTTTRGemxj?=
 =?utf-8?B?bTRwRlhLZmVMMEVTSDZ1U1NFSStCQ3Y3QUcya1NhM0xBb0s3dFZpNkQ5Y2tS?=
 =?utf-8?B?SkNCMXp6aXlQVVBFeGsycUFoZng4Nm0xOHpISUFMczQ3SkNhVDN1VDNjSmhm?=
 =?utf-8?B?RWZvaEFuYkNLMVJuVHljQlFsem9JZVVjRkt4UStPaGJpbmxwR0FWYzlyMnFS?=
 =?utf-8?B?OWVIZXRpQXg0MFR1WGpFcGpoYmx4WmhHTHlrTlhlRVREQzFZbmxvUDhUSnZx?=
 =?utf-8?B?NE5nejZvZWt6L1dWLzBhbTNOcUNMbFlMemlwbHpqRHEzYXc3NTlybVg0VXY4?=
 =?utf-8?B?UmM4RDZMdTlTckFsaDRpWHhSV1pwWk9vTjlubUtNV05CMEhOK1N1UU8xeXJj?=
 =?utf-8?B?QU1QVnYyUnRqOXVGWHVjbU5jMTIrWlU0WnN4UjY2aUNON0gvOEFCRHVRWXBP?=
 =?utf-8?B?c2N1QmZSbUcySytaUk95elo3YWt5ZHFpN2RTaWw1QjUxQVBxUUtTL3JKZlVR?=
 =?utf-8?B?UnNtMCtyR0lVdnkwOEgwdmF1bTdzWTY5NE1Tckl5ZW5sbGZaOVlTS1lMeTFT?=
 =?utf-8?B?cG5YYkdTVHBCL2NsVDJza2Nsd25yK1haUndUVlNkckkvSmVlcFI3Wk0zck04?=
 =?utf-8?B?eXF3L3RQK1pBZ291LzJwZVFsWEYrU3g4UmxmRkc5M2hzcHJJVzR6SlAwdzdk?=
 =?utf-8?B?aldvNHBqRjczM2ZycHN2RDB4QWxGNzNFUWRNYWVsMERKVEFFNXJiOHBkVnBG?=
 =?utf-8?B?ckdDMkEreXIyS1NDZlRWamoxaTZUSDRIOWRFa3c3NGNGZkl1cWF4a1AzaUFr?=
 =?utf-8?B?RzZ5bkduSlJVY2ZQM3NsVy85SitoNmxMMS9iV0pkVjBmamJEUzJEa2V0YkRZ?=
 =?utf-8?B?TUpuZzBnZXNXQmxlM25wKzJwOXNaWWZlTENqTkJLaTRIc1p3TUljN3htNC9E?=
 =?utf-8?B?ZmVKOE5qVlVsMVdQY2xiZ3diY0pnVU0vS2dHNDhtVmJkWTdLYXhPTUplYTFD?=
 =?utf-8?Q?qxHI9/Dp5ouAVKzoKNLZa61qAfs7evx2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVEQ0NwdkdIWGRBWEVoSlBkYUFxdEJkUUhRa2tFcWJDR1JSL0V2alNKbXRR?=
 =?utf-8?B?KzRPM3doN0JpRlpKY2E1T20wYWdIbExvTW92VnZzZnBGVmpQWVVZZk40WDlY?=
 =?utf-8?B?VlRsNWFsN3VVVEpHS0E1VXJENFlXa3A0d2xSNVVsWnh4NGxWNlVLZzkxbm5J?=
 =?utf-8?B?elVzQThlLzBVTnZqbUU1Wm1LS2tlTEtKL3FwZDhwR2REWU11QVVFcGZjVzhR?=
 =?utf-8?B?ZWxVZjU2UVdydy95ek9VTFpjN1RIVjh3dzA1K0U1TG1wTlpYMTRTbkhZM1Jr?=
 =?utf-8?B?dXJiMld1d2ZxTWZIME9TWTZoRllMczBnblpobUZXR1crVzFFNDhIK3B1c1V4?=
 =?utf-8?B?cDVMaWFaWlpCS0g5L2l5WnAyUSt4QWRDekVKUUY2M0JVMGVvU2ZGOUgyL3B6?=
 =?utf-8?B?YmpjVU9QdkhsTEY5Zlh1TlJnZTNaRmtubXdCN0RBajZZQnlDb09BV1pnWk94?=
 =?utf-8?B?a1A0amovdEhXTE84Yy9HNHA5dTM4VzY3K3AzSTB6cEFVWHkxUGp2eGNRenMz?=
 =?utf-8?B?MWhWTGl1WlBBeVpjVHdGN09sTUkrYTBnZHNNSUlyVmdSU3FuOUJmT25FVk1x?=
 =?utf-8?B?SUE1UUI2OGtPb09venRRekdOQXdjdCszdktveXNTM083U1dUdVRVT1BQV1Fi?=
 =?utf-8?B?WkZra1ZrbWppalFNeVNnRGxqMFBYQTQ4eXVTaTE0OGdmK3MrSXUwTE91dGVY?=
 =?utf-8?B?eS9tb1VoaVBpYWlxcVQxd1dDblJ5Qm9hcERTWEFGc0RwZU1pWUw0Y2pGVDZN?=
 =?utf-8?B?a2FyMW40T1k0UU9xVVZvRUlxWmUrWXl4K0NiUjdkd25wS1JERDMzelNRTGZ2?=
 =?utf-8?B?RHRKbTkwOUREa2lTbHdjc1cvcGxWeGtBdXdJY1Z5NzBpWTRKek9QT1VzcjNt?=
 =?utf-8?B?d0p6UUR2Y0M2ZWZNelRsUjdtMHh1b1AzYkVYOStDWUM4bnBhMXBiQk84YS9t?=
 =?utf-8?B?TXkrbU16MHVabmxVRGlxbVZ0dUZNc3lBV2NFdGRiRVdSdVVRK2tDYjdsa3ZD?=
 =?utf-8?B?VmtWbE4wN0JVVEJ2S3ZST3pHWG5KcFlMUndtWWkrVHZGTUQyTVU5d2RtUGxU?=
 =?utf-8?B?SkNVV2djVlVPeU9jOUl5UE1xSjFEZExXNlVMOTM3QUxJVmIzaUtrVjcrQTdS?=
 =?utf-8?B?UFlWM3pocE9IbTMwTkFka0M1blViSjZCTmJEMnpkc0oxZmNMMmZmRnJiWllq?=
 =?utf-8?B?c2RlRzBkbk02eWZsY0psZno0NnNmdlcwOWF5aDdTYjg5cUNwSVNwaGR1SlV0?=
 =?utf-8?B?VmNWcUliV3p0NTVHcW1vMUFSdUhpVE1WUmgvMkRKQVBCOXlEdzFaQXpzNXFk?=
 =?utf-8?B?WDBvZHpaM2pMTVZqeHRJYUZJTHBReGoxQXoyNGthZURMY2hLckV0ekg1UDZZ?=
 =?utf-8?B?aGhLYW1USDVHakRZYXJkUzQrREplcFVJc2FPd1BPendibEUvUWV1NEY0dWhZ?=
 =?utf-8?B?b0RybTVOenAzdndmeEoxS0RZYWkrZXRMRVB5czVuM2tRbHAzcmFlaHpFaFdn?=
 =?utf-8?B?Vitib2JzeURZaFB2ZUFXUldjQU9ZV1hMalU0dEhGZHRhOTBWby9vZGx2djBN?=
 =?utf-8?B?RkNXKzl2M0RubldzWUs1Ui8yb2Z2MU9vWUhUa1V5MGw2aDF0eVFWRXdwcHJp?=
 =?utf-8?B?eEhNdjVlc1pMNitRRi9tLzJWTDlzV051SHVVRUZYdENtWmcxNi9vMEdRQWRs?=
 =?utf-8?B?V1JtUEppZTR5Q0xWYW5KdnQvalRwQjUxWk1MT0VzeXZVMHlTbmlBVGhLVUty?=
 =?utf-8?B?MTBaejhTVEJLVkNsYnovKzlEOTZ6emEwZ2hMVDZ5K0g1L0hpdnBkODF2bGZC?=
 =?utf-8?B?NFAzY2drYkp6Yk93Vk1lZStCTkgveGZKNTBmalVpT1grZ1RoaTQ2dmpTb3Jh?=
 =?utf-8?B?VmtieUE3a0s3Wm12L0RTQU42YzJHMmZ4ZHozdlNROHBjR2JwRWhVNGhMZXJu?=
 =?utf-8?B?cUZxNHVUZFdkejZveWdyRjhleFRSUkZNN1oxSEhZZ0lMVlo3aWZjRHNRN0Nr?=
 =?utf-8?B?QUN3a1UrV1lBcmtxcTQ5ekFicFNyWCtwS3Bhbk0wSytEY1NsampWZjNBUjdh?=
 =?utf-8?B?ajZuRGd4UHpDOFVjTWhCcDJzcnA1a0xOVytQTXdrdE5xZktXN1VtQnV2OGxr?=
 =?utf-8?Q?QOdLVn1WjGIRtp2GSyUMG9OWA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f46f8d87-e90d-466b-9a64-08de33ef7f37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:14:46.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3C43V8tUkedapJy4MA6yC6tSGjfWUcAtBPInzzn+g9eFH9o4Bqjxpo+Sczrg0INeTB7TggNy1ELGEfJWQve9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
X-OriginatorOrg: intel.com

On Fri, Dec 05, 2025 at 11:43:21AM +0100, Andreas Hindborg wrote:
> "Philip Li" <philip.li@intel.com> writes:
> 
> > On Thu, Dec 04, 2025 at 01:24:03PM +0100, Miguel Ojeda wrote:
> >> On Thu, Dec 4, 2025 at 12:59 PM Daniel Gomez <da.gomez@kernel.org> wrote:
> >> >
> >> > + Any reason to use an unreleased clang version for this reports? Since clang-22
> >> > is not officially released yet, issues seen with it seem lower priority than
> >> > those reproduced with stable, released versions. Does it make sense to act
> >> > on these kind of "bleeding edge" reports, or should we wait until they're
> >> > confirmed on a stable release? Does 0day test both?
> >>
> >> Some people in the kernel regularly test with unreleased compilers
> >> (all GCC, Clang and Rust) in order to fix issues before those
> >> compilers get actually released, e.g. ClangBuiltLinux for LLVM, I do
> >> it for `rustc`, several people for GCC, etc.
> >>
> >> So I guess the idea is similar for kernel test robot? There is value
> >> on doing that, and whether one should act depends -- if it is close to
> >> the release of the compiler, then it makes sense to try to figure out
> >> what is breaking so that the compiler has a chance to fix it.
> >> Otherwise, if nobody tries, we would get quite broken compilers (for
> >> the kernel use case at least).
> >
> > thanks, the bot tests multiple versions of compiler for both gcc and clang.
> > For clang, low confidence ones will only be sent to llvm mailing list for
> > check firstly, and for other issues, we will cc llvm mailing list who also
> > monitor this closely and help check in case there's issue in latest compiler.
> >
> >>
> >> It is also why I think having at least a basic kernel build on the
> >> upstream CIs of the compilers is a good idea (it already showed value
> >> in upstream Rust and perhaps we should talk about it again in LPC for
> >> Clang).
> >>
> >> But, yeah, the reports can be confusing and reacting to them properly
> >> does take time and effort (e.g. I need sometimes to bisect the
> >> compiler etc.).
> >>
> >> Does LKP try the bleeding edge versions only if a stable compiler
> >> built successfully? That could perhaps help.
> >
> > For bleeding edge, the bot regularly builds and use latest code now.
> >
> >>
> >> Andreas also suggested yesterday in our meeting to have such bleeding
> >> edge reports perhaps more clearly marked or similar.
> >
> > Probably we can mark rust issue as low confidence when it occurs on non
> > released compiler, so it will not be directly sent to developer before it
> > is further checked?
> 
> Would it be possible to still send the report, but to inject a line to
> the report stating it is marked as low confidence due to X and Y
> (unreleased compiler etc.)?

Got it, i can add a new line or update the reproduce line from

	reproduce (this is a W=1 build):

To

	reproduce (this is a W=1 build on unreleased compiler):

I can wait for a while to see any other comments regarding this. And
of course, this can be refined at any time in the future to make the
report clear.

> 
> I think it is still valuable to get the reports, but it would be nice to
> know we don't need to scramble all hands on deck immediately.

Got it, sorry for this time's unclear info.

> 
> I guess one could also just read the report more carefully to learn
> that an unreleased compiler was used. But seeing this at a glance would
> be great.
> 
> 
> Best regards,
> Andreas Hindborg
> 
> 
