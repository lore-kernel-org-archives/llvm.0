Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CDB748F;
	Fri,  5 Dec 2025 00:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764895899; cv=fail; b=UlzebGfVMzOD6ql7UmUPKQfQA6CStdh+eZB/fivfKP6Q7j0kaiQqmhFI+3J+dGCviIT4c+m/meN1xu1QPPlmD0hPmJzBl0SnYXQ3oCYNLL9p/O+OZu6effG/Tb7n13rM24oYpchbom3q2bVOZM7gJvY0n8DBRjd2htC6X2tIsKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764895899; c=relaxed/simple;
	bh=YjGQRLZBTKibtZwJNAswPl8maPnFZH09DeKxvqHQhDI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hCzE2NSfHpKwUUIM8jwpMspOJSC9IaHktyjaho2ligxUeK9/uKWT2pWrfqgwkGvhS6ZP5kn5uOQavfIYZnOE2+KNWqhLJAnUQE8eqVbxSr8J9j7vHfsVUBfZ6h8Q4kQG9olCpIS9oc2agfcmFzuM6OJepDu+QQLc413vZUv24fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLK+HUBm; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLK+HUBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764895898; x=1796431898;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YjGQRLZBTKibtZwJNAswPl8maPnFZH09DeKxvqHQhDI=;
  b=aLK+HUBmia3Q5i6jc3/jSC30RQcs2En90zuvZnDQdUfq9YuPRrsGN3mx
   R9EwvgGW1ahHwwqph5Ri6YXXBfGRh2O80OwiZoXrJl54UAm4iY4P9exYx
   z9gXIyIQGfJgwEaMBDNBTakJTaSldz00AEc8Gh25CFpjvVC+jf7Tx/Ua6
   ybcHdgjEAIDRpDYxlVMERArkW8iRBxB/+Mp2A2pPYiemw8vJqVlWZOhNW
   vhXQtHQUmgTLtmjXUyLhMwSJexsC+OnSsFd8pCW8Y9rbUmKDzKNWfo4mC
   DCb3iQTR1TRESqNLBIiUnCBzxHLHLiuWU3skQptP+Ho8wDsFrMDc/HF6p
   A==;
X-CSE-ConnectionGUID: bcvkYfgWQnK75U5001tlbQ==
X-CSE-MsgGUID: 6rm3Op8dQluc+7qiLmmgKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77613568"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="77613568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:51:37 -0800
X-CSE-ConnectionGUID: LPKbTpOMT/a1BbTNIg765w==
X-CSE-MsgGUID: nKY7mUyKRT6Bks8Bpxgs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="218486997"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:51:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:51:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:51:33 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:51:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE4NlcIc7j7YnFswgaSmldQZNZ/A0Xxkk7F9BJaqS+rPXs6UKURqG6/m8wJsj3nCO1zGSCkCVkEu4rmIrwNrHfh4vvuUjr9w1MH6zm9pIHeO/HVwgLYkke/2GXKPyVYihkp+NKQZDyKTavNSyv9rG52nW1dXIlf52gPu0RmvzfOL5x4xIBpalTUNo6GI2OiipTWYsHa97RPsKmVoR/hEItnf+ypx9hylfdetSF08CT9AdSJDOLrpFgZrO9Y+xwiEBZyV/WCFf3fQpzaFvWD6JgZlPTgKCopRQwWlZWe2eRhDs/bItWoIK1DWHX367eACU5SAt2PzuYvOWZckL8+bpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83WmBnDRLYLBKs7ySHzc+Xg7xyTpoZhN6cNbTOSliZw=;
 b=skQGtmiy3AgzAK/7eeghDuNau4HK4gaLx9v/MVj3lg7WXm87lDvkdqu+j+J7syReoPhUTfOX289MCsY9FJF56Yn+IGyB/8fmkSp1nD1VlLtiuW4ahjlE6ZSksvFUihglJeycn3nSuZAuziRBqZUjCiPZqR29dqCoUOaoZHWC3Ks/SYl7N+CtGNxRYj2Qao8Mti/gzdaDsSQ4OxjgIyWA49l/g895Aho7+Ogt2Erbrt1nzAeh8NeSCLi5e+oP6eHRG3p03J6UbRzubMNnp12p7BSX1wFr7cm4LrNTA+6YW0xj5VMYmkVgtWQcqF8p90Gq1cmLWlHnMiASgqAnxtzFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 00:51:31 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 00:51:31 +0000
Date: Fri, 5 Dec 2025 08:51:21 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>
CC: Andreas Hindborg <a.hindborg@kernel.org>, Oliver Sang
	<oliver.sang@intel.com>, kernel test robot <lkp@intel.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Benno Lossin
	<lossin@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTIsiXMzcmBXBKRV@rli9-mobl>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: b957a3f3-f7d2-407e-5d53-08de33986e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qOczjux1njUKyR1dJFvzMlu7CfMYiZJ8Xort75KmcJEaY+4fHKVa641y5CXf?=
 =?us-ascii?Q?6wQRjr+eTW7oA2n8VgEbEIpPBxhngp07bWo7/1jLfxPkR8J5V1IQl4cvx0Gw?=
 =?us-ascii?Q?vvTK/JcP2EKIyZHyhTKVturQsiWXDVPhRVFQTWSR/CxGYQDyUzgnj09DyJd8?=
 =?us-ascii?Q?9dpQARM/PoYL9Q9+EgNS5U+3LvFiagviZALzIfsaHeJhCoqnlJfXpAuZaq/m?=
 =?us-ascii?Q?rSq0PRfVaI5xVzdhAbyTB9pR/A6B5rfJez8LbmunPvUrNnxavYZkkyY14bkH?=
 =?us-ascii?Q?ZuRjveFFB6PM6lUuI5dlNZu4R46c46CPrUE35MccDKFaZ98NgHlIvTubHvMp?=
 =?us-ascii?Q?JJwkiJQtydEBqRIjkk6/0qwFrBoMaTZnY+JCWt30uoEgsHfD9FNYG+7ewtQ9?=
 =?us-ascii?Q?BXjmXwfSi1DoUino1/9b36DToj4talEwECe2lU0c72Y92R5SMP+6EsVrMCHx?=
 =?us-ascii?Q?mKCInRRFX9fbJ+VUamTFiCocvXenyQGUWFs+A+payzNvDmRKGUx0O+/qflK2?=
 =?us-ascii?Q?MPSrv4BcVQExk97k6J2sNobH7dGgLNX4Zp6/wbRrojHtqiUgGu95hBDfJmwL?=
 =?us-ascii?Q?rQt/UbWak0wmzKsM8beABY5oWKUd1zfvubWfvr4GJ9Lj1we/MfKME4nnvYUF?=
 =?us-ascii?Q?njHDDCFbfaXSIZN7VOP5g+7rEh+m6h55RscZvYeCAigw6KjsfWbToRCSc1Ts?=
 =?us-ascii?Q?HIvAlzoHQN0Uy2IdcX1irSqS+/8Sy8CZP0bp28tgomGJFHW4bBqQAGjGRtC0?=
 =?us-ascii?Q?V1SfHY0mUgbsmPNU9TxEXct6UUqM+lxDS1K6oDa3hg7NpL5Y6AWvVxvn2xUB?=
 =?us-ascii?Q?M+WdKf+iC96y2DGmPi1zHuzcaRvL/8OqHo0b81qAanHR+75b3jBbQ/kn/cEV?=
 =?us-ascii?Q?CugYZ3FQjsWIPbwGi6YY3TQWBZb/AHpYWemCwqsy2gDYKxZxn/j8OZyjFu2G?=
 =?us-ascii?Q?mTDVcJvOh/kH/lmuapj7HZQyH/1g7EmTG4/GCCV0UjUWjaIAjuYAyTMLLev5?=
 =?us-ascii?Q?tF/C2kYQHuASGBy124myl7NpeUUE1ZGZfifT0NkHKN0msMY2BkTwuXwralut?=
 =?us-ascii?Q?LQGHguYUjISF9KEWzs2fQ1L0uXnOzmsD51+RocquBG4/I4Iem3E8gJGIEsR1?=
 =?us-ascii?Q?s8Tp1Vvl4podevZSOuTw6PlrAB0HfMLmH0pyXFRDmV62Qpb2zBcjxVGkqyJs?=
 =?us-ascii?Q?xcXEBTv1rY1reLdXlqIVKpj0/jJA3OKc4zM1/IXJGjzo6AnOHhg4i5tJ9m5Z?=
 =?us-ascii?Q?Kp9fIOTTMPvFDT+GVHoYyIx+toLy3uoar8EDV5Zn+dgAWLANwrTF3hLz2aBn?=
 =?us-ascii?Q?H2/yBUOQfQoHWjqNre89Her0YFpqG/ADE6vth929O9LMQdwSNIOGPHatiu9O?=
 =?us-ascii?Q?2k2MXLPkIWKTUf3ChQOVewaU4dkGNQhimvT1GfzbUyIx7sd5vL2zilPLypkW?=
 =?us-ascii?Q?ydiUY8Vc2eeL+9Uqbni/GkKC06mULDBb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LLoHkhluw1sEV/4O+gwWufv7t+sjUAnNepPnEqTF9bQPplCob/h4L0YdI6y6?=
 =?us-ascii?Q?yNSXWVTtym4i0MRPMSrSQljsbPWpT8cAbsI6tIn81gvETNlzufbfU29ny/sm?=
 =?us-ascii?Q?vkfVKlXFXu5G+LF3z55nVhfuCEv9o9sCuruio3PuHbogBpmid16k7snYBqgr?=
 =?us-ascii?Q?3uQKmrs3etCvDR9iBRotZHtQlG7MMmDTLexVVYPA1ZDPmyvrQMSQTBjthegG?=
 =?us-ascii?Q?aE1jkQNDpzTvPuYJ46ez20itLjS0QZtK0PjySz/FF5/vR6BZVSS2RCiYejcQ?=
 =?us-ascii?Q?EnRQM0c/s7E50asrbkuXBwwbV/R9zM3GBTBxnKhfONHPI2s/BuWEWM74p4wy?=
 =?us-ascii?Q?Ipk3PAssViWt92eFxReBXuwxqxhtYHnH1J8qXAzH5YMPx2ZzjMXIw6XflBme?=
 =?us-ascii?Q?6mmefWlsxugjJ6VY90UFcpPtnFpSGBs37LajPzpXl18eKtkMbEQengg2oQ67?=
 =?us-ascii?Q?P6fMWIdHAQDkvL8nfePBM1WuxX00GCaJLGG9M5DK64sDEUA6RUw0DHuzQpqv?=
 =?us-ascii?Q?oVFuihiNf14tj0ldR9A+78ygP/N73Ir1uPB/qOZHYKb8MKwVNeIz+3HH//rr?=
 =?us-ascii?Q?yFjY8paLF0Hcvj01HTYD8Ws0oEoeVhSUsAAzLWT4dlFvoDDRePFLaRp6UNuV?=
 =?us-ascii?Q?RDFnNBsdn3Yx8SqT/Dd6VF5gpxmGP/tBxrwDb4H17x6ba9lBZovX7jIG5jzc?=
 =?us-ascii?Q?2yejMcf9YP0pQMOoVlhPOXiwTliWZ4MkW4drWJHwsYVd27rKTdg6gYh3I4st?=
 =?us-ascii?Q?3j/GMPB0ghSJzlvIACkctGfDDRyQPomeny3ueurXWoggaIpnTDqS5I5UJEDI?=
 =?us-ascii?Q?l+XsqKR/QxJFvGrX2OR+9EKc3SJMROVNHIfi7NIeupOOzBEpaekb1T5RJ1pO?=
 =?us-ascii?Q?9nl7AcDih3RfXg+YrcB6WOwNSJpVwn87dFeVY4J2n4JUuRM048PVb/fG8ste?=
 =?us-ascii?Q?trIvoUiFlQ5OFb9YRLzm1iZMih9eKxOP7CLP6SdxBN0FWfNLacE8oJoT/oWd?=
 =?us-ascii?Q?1A+nj+LP2HMIE4nh2hMgv3rWa1hnXWJukoeK1fIJk4Xfly/pgLR9fVNBXC1S?=
 =?us-ascii?Q?lSW8X1GzAdtptDbrkCcCx+Ikhk9ZPAxWHqpmwvsL01hMCfJGX+c7LnOwFd4I?=
 =?us-ascii?Q?mgV2rqt8Kq6ntdNAe3BFxRwmB5AbcScnnZZwwUKqRo6G8E34I1LBSR9NdMym?=
 =?us-ascii?Q?sYJYf4iAZ36/DC1JKal8kIhHGoi9FHQAyF8Z0udiaZABY/GONV510X0iLwTR?=
 =?us-ascii?Q?Jxnu9a5/D3IUdvzCvct551QImk4RkoX9LdyWwb6C6WELgD+oGTaGjnTIgMlH?=
 =?us-ascii?Q?Lm2R7HhZAmwr0bryXt1Yj6sk9eODE/lXe7PctTvnXFbDVuiKLT+MuJSdxJ0h?=
 =?us-ascii?Q?AplO/40u9XqTNDUUWoIL9MEmglePlLm4C8vYw0H954K8e+0sl3MrWPfKZYSI?=
 =?us-ascii?Q?NqnD05s7ve4AD+T3gAJLsZzNEcTC8guPzdLoVcXl6iggZxj2Dyt5TrvKpMm+?=
 =?us-ascii?Q?B1OJzlvR7YAkaIX9tdRs4phVY4f26V4jV6mLNpa2llGOh1/SnofNl8Cjit0Z?=
 =?us-ascii?Q?0Ipz9vA1IvW84XUuTziJEuthDv/jKXkZgXnLAftW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b957a3f3-f7d2-407e-5d53-08de33986e0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 00:51:31.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3N5jgmRMv9EVQ/IpmoUGGQlRCjIsk5a6J+66kZ2dTsqoa31ft8ninwb8s8bmUaLrvbVfG1dVoR60sEiZuvmWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-OriginatorOrg: intel.com

On Thu, Dec 04, 2025 at 12:59:02PM +0100, Daniel Gomez wrote:
> > While we could see from the config that you were using bindgen 0.72.0,
> > it was not clear to us where you get this bindgen from. Obtaining
> > bindgen does not seem to be part of the reproducer instructions (or
> > maybe I am not looking in the right place?).
> > 
> > If I understand correctly, this issue manifested only when building
> > bindgen 0.72.0 with clang-22-git. Building this was next on our list in
> > trying to reproduce, but getting to that conclusion took a while.
> > 
> > Anyway, I want to ask if you can include directions for obtaining or
> > building bindgen in your reproducer instructions?
> 
> + Any reason to use an unreleased clang version for this reports? Since clang-22
> is not officially released yet, issues seen with it seem lower priority than
> those reproduced with stable, released versions. Does it make sense to act
> on these kind of "bleeding edge" reports, or should we wait until they're
> confirmed on a stable release? Does 0day test both?

Hi Andreas, currently the bot will test multiple versions of clang including released
ones like clang-20/clang-21, plus the latest clang from its repo.

We do have some patterns to send reports of low confidence to llvm@lists only or to
have manual check before sending out, probably we can also add some guard when rust
issue is reported on unreleased clang?

> 
> > 
> > Best regards,
> > Andreas Hindborg
> > 
> 
