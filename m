Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A571E2614;
	Fri, 20 Feb 2026 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771606645; cv=fail; b=Qdes/1sWBd0Nb7r071DcgStIrcNN8QIBgXMpzySi5+HNhLKJPzgZuLWHVDyUHTrVnz9XBDsULo9V+0KkPhZeBctyRGYBogwD3DtPW/M81L8E1ZZyubAv2xtiZMYCVOY2p8+RuRACosL17U7sZ6A9xUW6oT/6P5ttYZ87wWIgQaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771606645; c=relaxed/simple;
	bh=kBmOS2dK5ussmHGFYlGUjSw2nWn+Zkf39ZTGtYypl5Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OdF2Lg+v2roNoWVsueFYbfaHNLZs50OqKio8d05M0KMFeXHs5edxs5Xc7TzHH9vEO1gL5KcF57WLwa7YuN8hnWIdfpxUoFJi+80TXWXuxyJViSN43kNfDwPqOyP2FM3lfdRHQy7YfZCAZf/t7ytc/2TNcqfM+d6XQqlLaxFmt8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElZzJ/Ft; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElZzJ/Ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771606644; x=1803142644;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kBmOS2dK5ussmHGFYlGUjSw2nWn+Zkf39ZTGtYypl5Q=;
  b=ElZzJ/FtVCdLXTdbOG1tVdLIhNX8LHydaB3FbjmISx7eKdpE5xmnMFV1
   WAZ8whVK7gRnOm2qqXiluIZoMAE9dM6786UNxkbogfkYNRcjbYXC4dJBj
   JByfssGryrwPXLKJsm6zKk1kX1HGjIQ3YTdVOIuDw9RzXLFEp9aXkr2B4
   IYJDVht6DFDNumizIc0lpdE5vq4sO2dyEmwRyrJK76YlgZ468CNctLpqS
   Gu0WnsT10c+iKC29AJ1+Yb2y2tmpjU4mRXPoz8PFGPoKU9eQSgxw6PYb+
   h11KQ1Rszg8OharP8P8x+ag82fXlBiJ1ZIrpUyZK9Gx4KN3OhBsczI821
   A==;
X-CSE-ConnectionGUID: 7q31zYqIRWaH9vBIa0EH7g==
X-CSE-MsgGUID: Tln2s7SfTTeuE9d50H4FYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84061588"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84061588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:57:23 -0800
X-CSE-ConnectionGUID: B2mw2ATmSq+wmvcoEp4JAg==
X-CSE-MsgGUID: wDsCW0NCTrGmfAu8JsfJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="252590601"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:57:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:57:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 08:57:22 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHSiCEXyheMDn4c1L4LRKbGV2E+zfMDpVE3hx4abrvyXzq01YectQqQokoA7Xf7mtMz91QtjZ+Sp1su/2LTq2oso5vfuz1kXFEFxK53gtP3CEB8lEQmVtCb6sThUo8ct1Fp+4wmhqmMedHw6f4h6KwVk9gPFIkgaZQWIXx7QnBCFtcviRVxjNhkPg8CuoipfxCbSBPDhOJEBXb6QlLopQbOqp4xJMNrVBA1LkAldlcDNzopIznGIFk8c4v/dNwQaFtuyG9vVaaV5cQ8g+NN1N2S+MpMkWs1AMVl15jk/xpjytjQ6nQCKIePSDOfWqTCr/cuaAGGcBCQQ0+PNbKJ1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpdtGNKm0ViWl6ihcxTWhjFAcdCTtfrMIJvTCMiBBoE=;
 b=Ldit9PGVGUwd0HYlkRxjZkDLVwZgQeFPKzluInp+erMiP7OgbFIgITlUndtbMlmg4y6SESKgTbHeVIkzUKR4gdPeZqU51yoLCT9CkbtLd8NuW7z3mSxlRwkBMvg8vEZg/BM9WHgqKptb67AWHUAXol8hk3Fdj2EDc71aC4J7Ldvl+KBjTwtW7dSTrYfzrwuDQt/Sx1n2MHha8sjgDX3VHdeJD43tNan8cjKfr/hyQlEDvA/LmfITtZX4ucxwITE+bbbd4qp/CgwA3ce7u7/dvY4Ya2xY0CbO/3jxtAv7XUTLWvIsIJoimHEoFWLoDAvmoLFURFRQ76/5klUKKpN/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:57:15 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:57:15 +0000
Date: Fri, 20 Feb 2026 17:57:09 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/4] x86/process: Add a debug interface to change LAM
 tag width
Message-ID: <aZiSQYFvn9fh4ZCY@wieczorr-mobl1.localdomain>
References: <5ed38af72848015f3417c462e624e52891dc14ed.1771589807.git.m.wieczorretman@pm.me>
 <3QyTbSImgFjKLKtNfoE6LooYImznDvO8uA-HraubBa9XRHjaJ84A0qEWwPRKdyz0gTU6i3FRAvbrOEQMpaencw==@protonmail.internalid>
 <202602210040.C4PVoS0u-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202602210040.C4PVoS0u-lkp@intel.com>
X-ClientProxiedBy: DU7P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::32) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f49300-c310-43b7-41f9-08de70a1195e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CWXKnfr1qgqNYRUTwxiKW2WbSIDA1wPerDTgOcS8HiZgUjoOnBTRtTD2b1?=
 =?iso-8859-1?Q?BE5VYUoQ4YIeB1wgK9TZco2sHGXSgc7RZ/T2JbaSGY4ZNusGTNJIpnQIba?=
 =?iso-8859-1?Q?d0m6TipVHHp4IP8d61MNbg9FuInvG+3BvV6CJsaevP8FI9aX/UqmTWFFTl?=
 =?iso-8859-1?Q?HW2rCJFf9kGCRFNWZ3e7mlF6Sbxb3qDA5E1g1KIW75+VGwY+68UQurxLop?=
 =?iso-8859-1?Q?xeOwgphox/0hy+xyzWZGfSHhiyhF3LAX7ym8VGHtO1m4AFj5geFpwikGaY?=
 =?iso-8859-1?Q?rxbZdpYAzsMjkdXdgdOjpsfjIElRDQsNmEmeNjPodj8JD7+jcEUEqlJBTn?=
 =?iso-8859-1?Q?ZeHU+xwsN2Q8kuYhOlH3aZsdmnXV4Gc4Wizqkc46/E+h4iu4Lf+Am6D49F?=
 =?iso-8859-1?Q?0D+ATehYWbD+4xkDIeq+Agi+xIE84iF2WLuGZSgzFde/JVIJUciNbQfH7v?=
 =?iso-8859-1?Q?Ba2dd8B76mY4Z0rQRdWub5bX3OIacVxYdnwvL1mkDpjw5bQEqdZTGaKmbL?=
 =?iso-8859-1?Q?HTVuDLdnCgIuDmXkZMR6YmMUFnGzHhqCxqPmsMbZQyD5ErPxshEjCMbnPS?=
 =?iso-8859-1?Q?Zlx5T8prt7x2NqGx2q/T7h8UkL8vON1qYL/kF4Cj6a/d6m9OD8P8CITTRx?=
 =?iso-8859-1?Q?96OXrCMf7GtZu8x8iiVgyy3fQbZ6MvlvYqzRJ2O1GH1Pl551rHeX57uuAj?=
 =?iso-8859-1?Q?AWTe+OAN1T402SR2TkbCFn/xwhAqGX2TxLHS7gvYgUO97V8ZiAJuPPpkdr?=
 =?iso-8859-1?Q?E58byOAjpZD3RHMyxClCTpiE5LXKPVYxuWbV7RSWRKhbTgs6BVVquup8bJ?=
 =?iso-8859-1?Q?MvXWQoegK3dwXTVrxvEM89DzoCFnGtazWK9DY8BTnGYdoEeipj8rCbBuCx?=
 =?iso-8859-1?Q?LbFQtRWerFWsTbWWvJwk4XhbTWinJQ0qeBS0XqWDkOW6PjanrLh/998lxA?=
 =?iso-8859-1?Q?SMPPjYfFVcaNAq0KZ4v7Os6PnWxJVhbVMWLIryCFL19PQscBTclqOJZ1lp?=
 =?iso-8859-1?Q?ib47GGnMjkyDG58xr3U9of6r0i98J8JmV8Qpx7WJf40yyoQhZ6urBZVQJb?=
 =?iso-8859-1?Q?pkTZet2iSnimNftGKYiAJuiw1tJyI7fpVtUavvrcKuI5iUqrVGM3CNT6pm?=
 =?iso-8859-1?Q?sHCLmrVTvrwKnUxOFcbCOLeBW2h/HlcdMs8v1NodMUuJNr+Gan0Nsq2Ztt?=
 =?iso-8859-1?Q?NFr5iw0TNPJcYoi3uRbUPtUYTvruosML/bRQQwC8THxMfMSxOP49eWv7Ii?=
 =?iso-8859-1?Q?8Z4TmbokgS5R+h7VVJjWd8TipdQi5UVJ1aFfVSTJx36EJYLURCKfitxaUE?=
 =?iso-8859-1?Q?IPrJuCuhUS3E+B6toopQdNsgfT1GQmiRt5kwF57OaX9cpAFvrKJGvmNRuz?=
 =?iso-8859-1?Q?qKnGZUIChKxOuT8vJ2UNAo5N5inCxNpvPtGuu9dcYq5Tr8cV6hpa8Q5ikZ?=
 =?iso-8859-1?Q?EKL9JgdHj1Izu/xypOiEOKEdlyc9p9zRrRvsI3YQmPOo6QQ86eMZhpBacc?=
 =?iso-8859-1?Q?j+JLTih2LVoVV3Mvv0rWMauPLAyV8SiUjN8zQup9KirJJF1fR32fWfYjjk?=
 =?iso-8859-1?Q?ncFqnoGTKvQKcmrAMGZW+L8403Q9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KHosrldtjxdMv3raN0sLy3hlllhqkSfqb66IKPfZhEgI/ie0XE+dRMfsNc?=
 =?iso-8859-1?Q?T0fOiDW3tkRIPZ+E/w8LqnVMeJjeZfGqPBkig/Kz5laC7f74iQ2BIZGMjr?=
 =?iso-8859-1?Q?BOOx2QIhtfegm4Qzxfrofr6GD0LqtykLO6NBHowA0LCrxub/dDNyxPFKyD?=
 =?iso-8859-1?Q?HaL1VFwFCweXLeDeWEvwwy+UtBdZS4vgWbx7qIzzukwfvWwCxWYQ5OE7Kj?=
 =?iso-8859-1?Q?3mpzGPvA18RAkHIbARK1u4iGMRECCWrdOuhOSiE9Ab7h0t2E2mpGAE6G5n?=
 =?iso-8859-1?Q?1PmbXxJ/aVLqbTmEFxXVqHM6umkNTjXEJr3J6qjbq0PJonArnRt7Sjh9AR?=
 =?iso-8859-1?Q?TtKLaeyud4OvSDemh3HJt4B/PjWRJ3n1N4cPTh7jBtm8RnekgTqWoiAcXK?=
 =?iso-8859-1?Q?OMCGAVxp1NGOY8iDuMEyAR2yYAU63ngxkGhEFj/l27Q5MUnBldIT9+1OPr?=
 =?iso-8859-1?Q?u+yddGWoM8Q50jr2bd0waiRnPgkrsmsSMctEd0F5toCNqZqzeNoLFu7tBP?=
 =?iso-8859-1?Q?DV+IUr/JBktGcEaiCiGUxNM550lPgcFgoF7Wl3pVF8BQlBzrrQhRFqqLP1?=
 =?iso-8859-1?Q?YwqyYbz2ZveJsYpmK6DG9o2ubAPeCnzg8Tw0AJQ8pODUVAsYsd3swkHOsf?=
 =?iso-8859-1?Q?SvUZM6xswnKOVdNy2jMfNWyuqyBRZQespi9vgTUxtWiLx7uaHEFzxtn6gP?=
 =?iso-8859-1?Q?ypPvVtBHLT1IATugXGsz97V5s1CKRvpKNDlwWdOyuhzhv8e3ZnWeTSHnIN?=
 =?iso-8859-1?Q?z5RV//yXuFzw10vRrZmNcXNx6FgOxqfNg+L4z/aHzUcIzmzjF3SS9vvwuq?=
 =?iso-8859-1?Q?QrddLmeo9ADO1HVo+uIHab0F3TL6eWLsQJ+aCowXjqydIqKAhlxvIkRUPe?=
 =?iso-8859-1?Q?HUglCaCBbhkHvqRq6PuEGMM1hGUC3K2DfslKY6HtBd15GhmAGpi/45t7fH?=
 =?iso-8859-1?Q?XNW5c2xI/iT7YUYCWu5dWAj28ekqvD1uqMIK+xMhXC04Zmju/JYriCXrCY?=
 =?iso-8859-1?Q?P4jqK1FK6PfvFgGgFrFkz0NXRinaQY3cdl3fJPd7ZWBq12M1Y7fIpv9I6W?=
 =?iso-8859-1?Q?IZEGVK4XRdGkuEhcHakwiGjqEB4csts7gnRoc9QAsZcj4v6oVfTCUNhL65?=
 =?iso-8859-1?Q?TrtM5nVinGd5bny4BI69jTkMWy5RggYw4G6+1CcI6LV2VibzxYIv9TJXyy?=
 =?iso-8859-1?Q?7ffX1nlqDCc7Wo4vVXPuoYYjDIlN6Vo8/Jd77qIicwehJjHbkNJotrSVz7?=
 =?iso-8859-1?Q?tRwrOr9PCd4A1YJ8SqA8PD9eSmBzSD7kvtlu5QovccG8J1eon/hHPRmogE?=
 =?iso-8859-1?Q?yNlQC+hBWhk39MiX+OTGxg3JjbgKdqs9jCfq5/5GpF/0sAGd4VqjnIYO6c?=
 =?iso-8859-1?Q?VsP6LZXzIsZjGePCj8BrrUG6I8GYyiwpdyjbitaGPL47xK3tXnwVq/dkMh?=
 =?iso-8859-1?Q?mvmEJPfiq6h1Zl9JTFdzDlbvl/Kt4CV/0LRidfTE9yYa5ZKj2TNXZ6am5o?=
 =?iso-8859-1?Q?9h5c4U7n5EcbY9twHnE7ROPaa6j6+OqUyeLbeECUAP2WJUOXForctCdPH4?=
 =?iso-8859-1?Q?OTCJgpHrlwXvYlPXzi+suaHlnV49xd34XmXvDi3OFdCK7V7H1sB5dye9Qt?=
 =?iso-8859-1?Q?H3IlT+g77CgQUvc3WBFvpwPMOZt6h7FbokpjAjG0F6Rkr51Og/plzUjXa9?=
 =?iso-8859-1?Q?e7yXnfzF6/2Fis4xZylOePFrFuXnou+5KAmv1Ms4/Y5dWuNmBTDRBoQ3DK?=
 =?iso-8859-1?Q?7R88LrcEG3vjqVTeWUh+zwJTD12pbgVATMQRkdfnX187rTEsdW0KOIBxaf?=
 =?iso-8859-1?Q?jD/UT4pzoPskU9f5W2ZLydS+MNi/NAADq/z/A7Lt2NqH8xo4bslX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f49300-c310-43b7-41f9-08de70a1195e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:57:15.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVZ0VxcAzP02z60Ynj1ZfOtswQYhmyCm4gZnKDdDI4x84pffZ/hyZitsn/Yuu0hSDoe0yqeSxQJcMk00o//PX2P1JfaK7DN0ROVhlsfr1Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com

I'll correct these in the next version.

On 2026-02-21 at 00:41:41 +0800, kernel test robot wrote:
>Hi Maciej,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on tip/x86/core]
>[also build test WARNING on peterz-queue/sched/core akpm-mm/mm-everything linus/master v6.19 next-20260220]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/x86-process-Shorten-the-default-LAM-tag-width/20260220-205155
>base:   tip/x86/core
>patch link:    https://lore.kernel.org/r/5ed38af72848015f3417c462e624e52891dc14ed.1771589807.git.m.wieczorretman%40pm.me
>patch subject: [PATCH v1 2/4] x86/process: Add a debug interface to change LAM tag width
>config: x86_64-buildonly-randconfig-001-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210040.C4PVoS0u-lkp@intel.com/config)
>compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210040.C4PVoS0u-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202602210040.C4PVoS0u-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>   arch/x86/kernel/process_64.c:812:8: warning: 'sprintf' will always overflow; destination buffer has size 2, but format string expands to at least 3 [-Wformat-overflow]
>     812 |         len = sprintf(buf, "%ld\n", lam_available_bits);
>         |               ^
>>> arch/x86/kernel/process_64.c:827:6: warning: unused variable 'ceiling' [-Wunused-variable]
>     827 |         int ceiling;
>         |             ^~~~~~~
>   2 warnings generated.
>
>
>vim +/ceiling +827 arch/x86/kernel/process_64.c
>
>   815
>   816	/*
>   817	 * Writing a number to this file changes the used lam tag width. Valid values
>   818	 * are 4 bit tag width and 6 bit tag width - the second, non-default one is
>   819	 * meant mostly for debug and shall be deprecated in the future.
>   820	 */
>   821	static ssize_t lam_bits_write_file(struct file *file,
>   822					   const char __user *user_buf, size_t count,
>   823					   loff_t *ppos)
>   824	{
>   825		char buf[32];
>   826		ssize_t len;
> > 827		int ceiling;
>   828		u8 bits;
>   829
>   830		len = min(count, sizeof(buf) - 1);
>   831		if (copy_from_user(buf, user_buf, len))
>   832			return -EFAULT;
>   833
>   834		buf[len] = '\0';
>   835		if (kstrtou8(buf, 0, &bits))
>   836			return -EINVAL;
>   837
>   838		switch (bits) {
>   839		case LAM_DEFAULT_BITS:
>   840		case LAM_MAX_BITS:
>   841			lam_available_bits = bits;
>   842			return count;
>   843		default:
>   844			return -EINVAL;
>   845		}
>   846	}
>   847
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Kind regards
Maciej Wieczór-Retman
