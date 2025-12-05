Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD53D1448D5;
	Fri,  5 Dec 2025 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901165; cv=fail; b=NNQ4LJB1LOc7CmlFttIEUYlaMruknXSzp/LbEAINDLOpcccEmbBcxbuLTy3oXjvD6QRQ3wVb+3u49tmDE1i3nSrb7ubVCmwjDzT++Wok8NHC0x7iMvyNt2lKzsMcdJOQgd3z73pBIcUpao+GigTniGHYK9xtO81LUaThLsC1BnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901165; c=relaxed/simple;
	bh=i0qUaY9qSM4veNpdY95HnDQ0hp9gwof9u4ZuNRtGf+o=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aKwUsCsFaCU31ulpdwEJxv75WRy05fI/PDXpjlcUAfbDk3kTdjcqoFO9ioIEjObe6K7Sw0xZdIfyUftNi8K4WlfMQEkjhqqc1ZjR5u0e3Znq3DvZ8r0qKM0KNMEiuGPjV2H8OeIw+G/YzcfqKsX/+WJDbS6oKoj7iJFNgQ+Wloc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKsrPzzo; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKsrPzzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764901164; x=1796437164;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=i0qUaY9qSM4veNpdY95HnDQ0hp9gwof9u4ZuNRtGf+o=;
  b=GKsrPzzo8oHNCtzwpIwgVRHkPI5egiGENR11EebIuG/CctIDiG182HB1
   OEegORlkoazdzTsbZCuwBFRmtyXd+WhI24YcNufdOaPKj16hlz9m0z4ei
   +SYQC8AMVaMzO1DvZDWVTueMdLyM4OkQad+WaqyOA+9i53u6PEHrpg2pi
   SnRTba4XMEvNdLdlbOf9mCdnPRLYsd8TZ0WUqjaVIn6blsKnhylb6gQq7
   VlkBo8XyUjXTvuiYeF5rA7T1tfsu9E20Zk5X6pWtBqS4r6aQ6BuWcrEg1
   kaRZg68VzIk2JOo92HvyDfjgcQ+//ZuLn+tJl40upNv/M93x7k/DcLIlN
   g==;
X-CSE-ConnectionGUID: Dl+rAVIGQa+1wbY9NtGmHw==
X-CSE-MsgGUID: g+oM09eOTuS3lILYCljgew==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77620333"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="77620333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:19:23 -0800
X-CSE-ConnectionGUID: YFRCDpHlRSq/2JJpD+8arQ==
X-CSE-MsgGUID: cBakasEeT8SAZmy+H7VPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="195048144"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:19:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 18:19:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 18:19:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 18:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fti7xfR1ECUhLPxFyfh6MBKwNPgs60km9SGgOLcgid+t9B+Ye8jzm6+jUKMX0IH0WQYTFPpIg4ggQXE6/QogJJ19VAk25WwsPvHaSKUo+L+HnxAWgMcvzSFLJRTmWbLVza75W6fg1G6e0xch2e6Ims3EAI8s6uklpaOSGlYEbFgIy1POIWgvfQ8T53SQ4LUZX7g1koNKoiHZDsMg86ys6qNQbjh+zh3mwFapLPYZhC877ozoPSxsUno/5VqIQnGrBJcg3HEp7ikg2SYOoa5h1LIH7dmaFbA3AowcXu5ZQQTlYfbIdyqkeHKElsHpfuUAcW+kKy2ZzKW2XNz6xEzNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGoAovUbY0AOvxJdAUY6fB39hwElhNTcESjQI4k7nVw=;
 b=B7951Z6yYYtirS0lSDPzL1MAfbm9m2q6QBf4M0eAScXccfJsb4ZYSdviy+0MjkHQxPPhaxlZNOjBZ4lM8I6cgo7pGp2XwqDmgncltej5ZduJ9HF73H0UZ4jne3blhMYrczhTpq2NyFlgIQepJtQGXIEnbaCQsDmfElPTcVfK8vx9Qs4VnmhSexNmDvC5pGOIQXKATs0NUH843ZX8laanMSnwaK3MqS3BdQtS43jkXCrfVaX+TZbcAsCItvjbFtb8GdB1rl5EJveKAGdtbhE7erm8XMz2Bcog5dWXgo/ok0WuAnsY+RmZ8GeRLQCBjaK9Oiq3L3igYaYD4PjNqa0Duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6856.namprd11.prod.outlook.com (2603:10b6:510:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 02:19:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 02:19:11 +0000
Date: Fri, 5 Dec 2025 10:19:02 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>, <philip.li@intel.com>
CC: Daniel Gomez <da.gomez@kernel.org>, kernel test robot <lkp@intel.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Benno Lossin
	<lossin@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
Message-ID: <aTJBFhiv+4AB/EzA@xsang-OptiPlex-9020>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: KU3P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: efec2fae-cf69-42b5-7943-08de33a4adb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qxGLTHyZJq/nWMhrjpwyZ+mmmuP32XIR7KKufPrKnaf/JwmJ3xuWqiOSbhyO?=
 =?us-ascii?Q?1o2YHpkCLXTRsRqAd0OM7MhG5h7UP1vAhE8We1/DqpAvQDTmZ+rk2lbWMx1r?=
 =?us-ascii?Q?8Qwwy2+UxjZ+q2USVEqqZAaXSOpar2pPbgUyJcldE4tFjNAxFdRzz7hOAUj4?=
 =?us-ascii?Q?5jtUfhWXeiu4Coh966Nt4VhEpZJCfc0zlO9+TOvtI1ABnWHocDfVZku/pkHd?=
 =?us-ascii?Q?NPm7vFyu9hFJCYWGnNaHb/gyll0Pu4sR7mLnRYbXWtWvC9eVYPTE0dKjbGp9?=
 =?us-ascii?Q?x6PS0/5stotS40GzV1s1AD6XGtsIj/It3RC5fnbAaPU23SQbp2cHGlTmPq8E?=
 =?us-ascii?Q?FEzgE65p8aRx3cOBwhfLot5WVL+ubgyUjLrfzBDDqAcuNe2OYgswQdGRzZVi?=
 =?us-ascii?Q?9GwbBNBx5gsYEe0e22CsEqfoOZSYwH5TtvNnLOV48vODu3gRC5uFany/9aIR?=
 =?us-ascii?Q?f0ea8X0XnVgEnKezBIwHu20kmL4sT17ZZ4XY13lHiSYd7wchTW2bdZgz/rt8?=
 =?us-ascii?Q?ZBbM5MLT+H9qFYCWU8/dhOF7BxvQzrnfkImab84Ppv8NXWoKqDya2fhIgXok?=
 =?us-ascii?Q?UJmkjrae4MjrkO6U/AsdpPo0KoA8x5Rm3j7FhtEGhT343e4c7JybXJ0TjXXy?=
 =?us-ascii?Q?zbi4eIlc4Io5/ldjc8b7FH5hgg15xSCG2g7gZVhIS0lp9Qnx9QFB8I92PMd3?=
 =?us-ascii?Q?Jo6z4YFj8JebkrAO9NVp/RWjOhdtJKG/khxqO0GTcbJWATYrhDJEOPPpSahF?=
 =?us-ascii?Q?U+EGxdXL0zy5pojpEJTXFVR5Y1fwPZuZZ3amtKEkhoKi20t9UfhkGGT6qwxv?=
 =?us-ascii?Q?v9DQn3bapEfW5715EmoPZ1NVilFdrzl3ofr4ZWB5HG1+kvGhghDFbRqCiW+g?=
 =?us-ascii?Q?xDgg6yg6BKekKf7cmGd/SB+k30eZvw5JGEDOCGgSdprF0DvoLQ8dx2anO99R?=
 =?us-ascii?Q?8ggWVfteCj118UPeWipDEBmu34jw3yvtXtUuv31kehlMq+/iYjVsnBkHbXQ/?=
 =?us-ascii?Q?Q6zW7zB6VNgT5U5kqzTTM9Bm04AaIoO5OUzftmN4KvtVX/2ukXH4lrgTuAyZ?=
 =?us-ascii?Q?hqSyIds38MEIVn6Eo8jIvEe04lnuWbuw/rPHChbAskQVwKD8JtLhawMRwLHE?=
 =?us-ascii?Q?JC0SVDtyrXYLOkDF6wgkCwNIn1Zpv+ZkP51OOSfWKQka1La3w8soA2mkfxOW?=
 =?us-ascii?Q?oRUvvB2fZxxhEsgUCMUepujsqRGlt5478oLEoLp2N4NdTrQvhdO0iuO0z5Fr?=
 =?us-ascii?Q?bkS8X1nAoEgkxOMWqScRWKsqQv0gHCqSByGGyHfAvnTIWZzNkbRU5h7lWqex?=
 =?us-ascii?Q?sf1ECy7p9WD7AXZJG9r/g/AmnTMUcubEsNIwSZDAjb1kwDFbLlqU1UXrnTPr?=
 =?us-ascii?Q?73r7WGGarkO8EexLkuohHYctGlsKEP1s0krG3id/1bfAaOjKm1XpJbEFB1g7?=
 =?us-ascii?Q?t2bANmokV80giB6js7XaZpVk+5rVRa4a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4skkGhdeIVo1FOh4bY7cVk1gkA6mK/UviDwz30x+v9eqgCzVnTgBycfQd7pB?=
 =?us-ascii?Q?RvBsSLBFGOPZwKkG0jXk8uGLSuURcMUocBvf10u+Qga6H/TL98hPvvOUoeCw?=
 =?us-ascii?Q?Is1ttHvVJ5nL2dZL7yNJV0Xj1dFFrO7FPkvMRzyF6kSrNuPI3Ry29Xdf5c9f?=
 =?us-ascii?Q?vXlz03htRy2sE0tvYi7gghBzwVW7LAMBBQ7hWl67PvhU8/joJwHh5w7GFeBu?=
 =?us-ascii?Q?LxIWSYDf2ZOSfZvaIFBQmQuPTKhmAUC7Lg96xrQh1wDAXZy2qTvEg7JUpucv?=
 =?us-ascii?Q?jPKvkszzg3cgl7INZUv7aFJdMWc8zOnn2GyTr5WbhTRcv9yV/fhr3T+2++Cm?=
 =?us-ascii?Q?pPYyHLAAngwV/p3z6dxBnDxr2E9CEM+iGJZ+l8Ln/6v8gf1ZD4/8QRjhzovH?=
 =?us-ascii?Q?cl+g6pMbEQ2Rk5iF0LlkEP/lROz/gZJVqtwT8+5Ui73UMfqcj/XL0GHAnG+t?=
 =?us-ascii?Q?yw+W+Gi7IkXGhvx5uG9xtXl+dXkI2YVuic5yBrwFPfxgEvgubyEsq410d6Kg?=
 =?us-ascii?Q?7Xw1/YKwnfkaK49G2iltEm3UgChgEreVgahCCW5TEvNcCwjlAhyPa+Zwr3hF?=
 =?us-ascii?Q?sp1kAUtwfrdi9wW80B456x08vN30rDCkc8uveUntO8d4+MHx+TzbfOUfOsdr?=
 =?us-ascii?Q?z5/3B813VfrxHPS7/jOqsTZJf+2vLjZE2M042+nGFQKwMgigjjjcrClBBswk?=
 =?us-ascii?Q?s4OLD46tkpEoVOh2qUTuVvBj/N6Hrf5FSzVQJ54JU8NfLOlqmLjTlb7tmaC9?=
 =?us-ascii?Q?VDbyrpDZkI1w1R8YUbErlufTpZUY/1b5iTRB2auEWdARkd5H7C6cgfyedqEp?=
 =?us-ascii?Q?6cfpoNb9M207nXQGdxcfXeqVuRC36B6iKM5M7uExokeJOLHpkRN1FhTjdoa8?=
 =?us-ascii?Q?zLPf4YBUPPM975bk2E/X79DzSn+B/JqwseQrBxZaTUuGsGeU3Cy+QOBGCoB9?=
 =?us-ascii?Q?q0pVC8uEK8dzfZ7TTeMdTK+mzyYQxlkk0TNDpQYWCLyi+0g4ZmJrzkB64hvC?=
 =?us-ascii?Q?hM0puH1Qj/lt55MAITZ+s1e5YpoZTpBJjCfP1ySxAWoBMMrj6nCeaCClgk0X?=
 =?us-ascii?Q?BhIvkljoYqnL6NwmVcToStLlhQMy5LYc7kkq0JMiu0F1Jh3dHT/BAiV9Bm6C?=
 =?us-ascii?Q?w2TEuD+SQuneAZPkSq/Xa/v5tMhgya7pN+uPek45/B07hrLwSJR3Kca2RZ8t?=
 =?us-ascii?Q?zox35zJD43QndQR/ES7s++VZAZFa79PNSleADCz4e6CLmN7EuT6u6o+UrYKo?=
 =?us-ascii?Q?/uZbRFboznfTo/6oF4qllJ/3hy81u1N3UalweMx/JfZSZcDlkdZI0KS20AzJ?=
 =?us-ascii?Q?XOzwV1lYtgYMiGgbg+OswqMbQ91k6iWuX3sKNwsqWwo5ol+ULfkZKcofPCg9?=
 =?us-ascii?Q?T6TFLc4AjQztMqHN94IuteNHg6GEcKOrijOVvQ0FB/Fv9XK7hXntNEJN6CQE?=
 =?us-ascii?Q?CbVAsC3qf/cWKiGQKpeKl2AxCjCTtur84f1ftWVEkxW54znHp4z3RfuOn8Mp?=
 =?us-ascii?Q?T68NdEYctNK1SH752xi6kNGxkOVG5JYoacWK3EH1zjEl5iuLsPsThkxOipiD?=
 =?us-ascii?Q?jBG/G6AQHZbaD6QwREm3biHwwXNtaUDHb9fuS/ZOHzHdW6P+qRLWCiPxwYyf?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efec2fae-cf69-42b5-7943-08de33a4adb6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 02:19:11.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLrD4gTy0U16A6Vs8rYkrG0EDc7BLgTbyrgQMct2aAvsl2y62jm3BL5fdZaLEAccBHWuIoF0vj3Lgy2+dDVXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
X-OriginatorOrg: intel.com

hi, Andreas Hindborg,

On Thu, Dec 04, 2025 at 12:47:05PM +0100, Andreas Hindborg wrote:
> Hi Oliver,
> 
> >
> > we used 0.72.0 when saw the issues. now we upgraded to 0.72.1 as you used, now
> > issue disappears.
> 
> Thanks for confirming!
> 
> While we could see from the config that you were using bindgen 0.72.0,
> it was not clear to us where you get this bindgen from. Obtaining
> bindgen does not seem to be part of the reproducer instructions (or
> maybe I am not looking in the right place?).

right, for rust, we don't supply instructions how to setup rust env for now.
sorry for inconvenience.

> 
> If I understand correctly, this issue manifested only when building
> bindgen 0.72.0 with clang-22-git. Building this was next on our list in
> trying to reproduce, but getting to that conclusion took a while.
> 
> Anyway, I want to ask if you can include directions for obtaining or
> building bindgen in your reproducer instructions?

hi, Philip, can we do this?

> 
> Best regards,
> Andreas Hindborg
> 
