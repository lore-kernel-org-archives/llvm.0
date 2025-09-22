Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864B28A3EF
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758578087; cv=fail; b=SvWgIPTR6QAYuz4Ks5qcUXHYftXLWgG4dcEh1F1JrXOiREx7RSAR79T9tRQycepExcYl8eT/WeOFIi2l0ttwTm1KZZgQb+/eOocSVEG5ThO9pQAZ0oNOlMA3AoxUGS9JjSABZ3h6iZiyv3OzGqNapg405HsgFJgVmmPHG+TP6ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758578087; c=relaxed/simple;
	bh=S/STNZYPVJWKC64Ce3jJQxm0zx91imvJRIgRDRbGKSo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QRf/PFmsJASElRitaj2KIo3ArXpZr0LSuCFnHk3DADI2jO0YTguMKHvQikw77yOCvzbTXtYYQDXfXiUbx4kWHd1tQmu9a3NlGRyNIaTfsUGHIQg+U3giqcGRKCgq1JGVIgayHafTYu8WP87f+9BdXX7kXN5UmAPlWNafMDEwt50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzVWNVU/; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzVWNVU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758578085; x=1790114085;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S/STNZYPVJWKC64Ce3jJQxm0zx91imvJRIgRDRbGKSo=;
  b=PzVWNVU/9tC8DXpiyU4UHinvdc0gltX8KPFBqQC5w4OWYYn9CmhdjEAi
   L8nyILXiCpWcyCoNmsMzgppx/o8KErW63Jpy1ptgP9u7SD3MlxO2US4Qg
   UK2Pc4OHy30gPBWLoWZY0Vj7YGpJj2P1aDUgQOkkRxcF443635xdnzPEf
   C0bNP1c2ngMopdzl0n2pS3b0ogYpQJfYeYgNkVRVw5GFpFGNro6NqudWd
   7mtTfAc1HeSyXjAgtCi8A64kLcSVzCH42RMCayIiGU1X/507Hizkfxbaf
   FSV99HRTTVhQzPj6uF4yRDvEOCspcyhRAQv6kHNsxVbXVdVxOQa8HxfF2
   g==;
X-CSE-ConnectionGUID: d72BsE36SjGbNnRAQLz6lg==
X-CSE-MsgGUID: u+nlaJ/VQvGLVA4OzYEOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71957113"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="71957113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:54:44 -0700
X-CSE-ConnectionGUID: 5FZDlh+ATo2JGGcYN+/ejA==
X-CSE-MsgGUID: O5XGtkZDQfaSJbDtdASIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176158644"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:54:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 14:54:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 14:54:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 14:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnOntFzx4s4gydWtm76jH/DqmMNwLC3W5goUBfFqQkFLiqLU+HPWO71pHw1Ww4gKYggih9RZ4h4hBgm6Bgt8oZHcuA5lDhCeFZSDmBL3bfvc6FDTYHqDw58BOgMXSZmStst0Ts02qfexH4RFSQyo+IFTFUMsigYR2gZE49xs5jrSjmGWpQyDWsqGNkzIDOBWhvQ3Bgp/+5CH9nz02m5RuQblVuGg5EGrgU+uIjmVSz8e7EGnW2s4uqh1NA1E+87qN4jPE2rsVF7g3vXEj5MnQ8As1S+gxstmw9nxUzR1HFhDjUx8nYo3q8I7xJSaUX2roDlFqVBtlNtoCLbixWdD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAPdx9uoTtVqlhHXbVcR4dNvCojaE/Ce/Ot9/QDYeqg=;
 b=nGI1+t0yCFf26Th0dT0WozDPYhQY7t7qD4MbWda1/VEH7DrE+gbvMKqScVa1yu8LurjltLFYrfuXe/XUSJvULj6Pz9oGC+wxjUU2r27WX49p+LCONFYIKxAx3k5tEfZ5/mbmO+dM4PajXE3HN8vXKwuTVk0o8dhV+QodBCXOp/nu9drV2RkkbQLJnDHFiOBXPed2NK5U42RK1KRbK5dzrhRQVf9lSZmfzR29JTNw1xfrAXMgpYT+UA9vkl5rhRjQAEj+YDA3K3I9pJnKLl4KnrRql9qROZNwgdBnXIUSIxEfbls/f6raHsJc+T6Xfx1ku6nv9Z9tLQSx8ZBieL/GOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 21:54:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 21:54:40 +0000
Date: Mon, 22 Sep 2025 16:54:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <llvm@lists.linux.dev>, "kernel test
 robot" <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/xe/tests: Fix build break on clang 16.0.6
Message-ID: <xj2pqfu7weibxyhxh646q5ovvvhgwjoluasucn24rleyd6y66k@d5gb4ia5lvi5>
References: <20250922101207.192028-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250922101207.192028-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 057df3f6-cb0e-4c1d-8c0d-08ddfa22a1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DGVsTtoN+h+BJ5B/vTUCDbZkowrYPWgvbnk7xBjtkPiQg8DAqJjPQelkfJ8Z?=
 =?us-ascii?Q?Q8uJzJO+jjuyKkBgeV6iWdZYXiHf3JvvXPXSzo3NBifTjNdEDta4wrxYozdh?=
 =?us-ascii?Q?jBHyXVuwIoUsbxEtqBeQ7zK9v18iAD1nc0G9QL8DjICAvg4ZnRL63T4UL+PM?=
 =?us-ascii?Q?QsCfwmMuYAQYl3y1rPOk0C0Lx6wokK2TJSLEk7z7lR6KmuEma6Qr6SgE/3Wp?=
 =?us-ascii?Q?dAS7O3X8OC6nhAjzxrIliSapK5DCslTmS5PDS0XsbJo3sbXskIwYoSl7W+88?=
 =?us-ascii?Q?WNKbo/+ppDcSpNBiW0JA/nXVEFsq7X2PivipIxqbV5YozgUOzACMvs2fm+Dl?=
 =?us-ascii?Q?Il6Vvecj8WLCINpAqbCD8/v1sJviOPCm1IIWi/CcSbbi7NB1INlp9AZ7bXKI?=
 =?us-ascii?Q?L/BaWNF+bhvZTUL7jebJJnftGxBZ5BOQ3GR1paQIfWutT6qK9D7c1fdorQGa?=
 =?us-ascii?Q?zAXvu8vtLuLjNq1onj0rDD+YWPFxzyHbX9Dbm9y3UvruLOKeaL3yzVEw0QqZ?=
 =?us-ascii?Q?OcIYw5qi7wKTX+gsR72fTXGmVREJalpdtrTC7K7CkzvtnTLLNbbv/IJ2nkFR?=
 =?us-ascii?Q?VW9HVXUFIqwMr9+o3cTj9zykExBBC0OzPlWPrzZI2tx5y7cqOsas7zQKphnC?=
 =?us-ascii?Q?ifbqQBtFJJRs/io3saDwcfBl9tBYh8g/qaskpyrudXveUCLRzaZ2iO9Q1gzh?=
 =?us-ascii?Q?SYQFO1UrsQxGuRxMSKDnwMy/AAm8AUej8rqctGqtWNvSlV4Y2uoZvd5oamu4?=
 =?us-ascii?Q?ueTKuURZo7P9zdox/zv5p3sS3y9aWGQRtW2DNJc/jL+x75EOkeducXWlbQdF?=
 =?us-ascii?Q?EUikUyNpR4nplwOrSAMntHakWec1wqV29n22rfZKv5TFVefgPidQ97i/B5GE?=
 =?us-ascii?Q?ZWPnEwS+A9OjEk+if+znfi2oYYeXpWCXtXXlwslS5wxUMWw6Yip8eKx0w6Zp?=
 =?us-ascii?Q?zu1J5c3m9VT/EZPkJZmRXFMIgJCtBxDVZkIxL3cQu9GdCfgEVQoZWK1B3Hrf?=
 =?us-ascii?Q?lwP36HpYxadPRuYWo+0Dor66iniHiUlut+7Vbi9b+clSnkAS+3fZ1uZO+6Gi?=
 =?us-ascii?Q?0Q4Lu6P08OmgZnnap7lPmsZMr/ix4sjAYgten+mEJFqxyMSsrmDWlU1iTDcx?=
 =?us-ascii?Q?/la27AYOvqZXAnNYkojrGpwRVSDgCohSn5l/xOBK0tZTj7H5LJs45zKyq332?=
 =?us-ascii?Q?SPa/S2PkzjuxWQAC2W04BpdbTdULyl0n24q8MhCWcMZT4vshOQShKJ7rvTIn?=
 =?us-ascii?Q?kYrp0QnIXlPv1V5if180rC0i1RLCBUazYFt2hFalpDAC0KLU42cCV48YoREP?=
 =?us-ascii?Q?q+T+cTHnIyMMXkTGr/YjTp7Ziy1bPQTnWM9qjB2nFXA/zRGYEKez7O88Oeer?=
 =?us-ascii?Q?or7cA8YX5YRO1fxdI1y3Xj1WRfLrrlMjCRXR8Q65SuDcO5i5dXkJYLNkzVd1?=
 =?us-ascii?Q?lY2nX5nYk8c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zInjBm/DtCdaAMl2l9He3xYa2whnT1UWfCJ1MR7LY96N+Weeg03wYgAGdlUA?=
 =?us-ascii?Q?HubRPCgEJsK3b7uNwJswndtqXn4z2uDCZ/q+Id3iHleT2Dli/ETGeyPcynsj?=
 =?us-ascii?Q?LPRnLq3xbZjVFtCmlMjSHNJI1h9aGhNegylCn/gcvzG39B5znCkFBhSF5c9Y?=
 =?us-ascii?Q?pZ0ZXxD378qU5t1BLUfoa1LIKKoRRrU4//SWQEBkr2rgO3QYKISkxgu7J6XM?=
 =?us-ascii?Q?2sWrmhWGhTB00C6ahb1yBEfVfpIMGcWf4NiBuM93m3V2NFmfuwUkBZcjG2ef?=
 =?us-ascii?Q?qilxzpfgq0cLJfRTQm7WOlilZAMRpni28cXEPjIP7XbSKnUA7oeoTGLleMNo?=
 =?us-ascii?Q?8UBznciIkg+UYh6AX8GhbKE+hhSYCtpSE64xvf8cKCWBAD7zn8oj4qSyYNkQ?=
 =?us-ascii?Q?CDSeFjdgOI0TQ5A/7Zg0O0/zKEZ7TGT+eC3GFnBDWnso7QFQaTxgWBDIxHyy?=
 =?us-ascii?Q?Zw/xLPLz/SUruZHXewRhFrkblfyEhPYBL6TonUwal70TDkzz1kZBEAD8i7mg?=
 =?us-ascii?Q?lAppY5kdwEgwOdrElMexSsGWiBsxcKUECyCNReCN4pNcYec0cODGEU+z/4ER?=
 =?us-ascii?Q?kc3OBptVFUSDiSLolPSWNfmyFcdXMgRVOCeMOsKXvPAC2xatzCQiorD76kjf?=
 =?us-ascii?Q?zjwQsiPlsQV9eKaBcBFB+l3eFRtzKEB81jI9SkwQi3x+XhluDk01N9EhP8+E?=
 =?us-ascii?Q?MzNNXC+inXLt8r6IBZ5HqKCX/LXfxx19himk3K742PwDOiZct8gjyzRdG2QX?=
 =?us-ascii?Q?KKPJFCVPB62Kpyf9ONaL8aLCjLv7IziAumhdazorgTGmw0+PttKI4XooO4ls?=
 =?us-ascii?Q?vXBllpDrifkheRH0ANjx3aCW6E9KhyX+85GEbB3F5C2LnYRdJPert/R4EdTa?=
 =?us-ascii?Q?7SnpIwz8KerrQBbBS+hSS+rorsh1hdHoWOvNpqSccjnFFLISpU3kwVvxTIM2?=
 =?us-ascii?Q?XEMvIv3qJrNQIwmsHmRpOl+B6NfTnMH9CfOSsnptRDWux3W3tQC/a+FSBTpi?=
 =?us-ascii?Q?M8BdFAfRe6+//37Gx7aLXk2nhFmwzzcBSOBhhDMkVE47cyfuu94enWNH24r7?=
 =?us-ascii?Q?ClKD9xqmzY80er0ayL6yc087QPg/KbzjMumOhUq/i9jqxQyGRlWaVPZqk+kV?=
 =?us-ascii?Q?+4rDIJVh9UzeEWpGD+vKxq4Il6dBJYsF3HgHlhb3GqOOuWT2Bd3zRDOcEwu/?=
 =?us-ascii?Q?uikY4ZAwLn7yBov0OItnST6lIEQls9efjTT77urase3PsJou1bQKMMYs1TvK?=
 =?us-ascii?Q?DS66d3vNz1ZWBetUjztNKvkzoSR7ZJ/IciXg3HlfumRxg10ntgatPZaphTaf?=
 =?us-ascii?Q?Sg2VTqqUwfo82GbJ0PTe8ejmZxibD/3+B+CSC9h0XSVzQCrGRXTTxya8FILO?=
 =?us-ascii?Q?rcm5Lb2cExas72dNsncGgT+u1CEbj3tc+uGmejnBbpCyzoM7y8AQVP234zXw?=
 =?us-ascii?Q?sh7J+LwAKWXcDn2dqGwQyhNTI51pw4YUuXvCKN7QprmLDfgUKRInuPvivBRV?=
 =?us-ascii?Q?YeoBm+rjS3AXrOVeTZD0BYXlF9H76dcfXDXN2xxH7qIUdVuLkAdpSTAMljrs?=
 =?us-ascii?Q?izEr0+xGNdnMZYAyQiJp3SdPYhKg+qFbmxmQs4BSGDuTy4TARW22VBmPafSg?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 057df3f6-cb0e-4c1d-8c0d-08ddfa22a1b7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 21:54:40.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVYg2HJn1ga88IU8kIvivnLYcd+PshgQZ3xn1OWx/9j+pOike7NbPxNHF3k3GIhwaGbipYFx/IoVF0yXVLgqhiczTbQIS7IN/QQsFltaXS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com

On Mon, Sep 22, 2025 at 12:12:07PM +0200, Michal Wajdeczko wrote:
>The following error was reported when building with clang 16.0.6:
>
>   In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
>>> drivers/gpu/drm/xe/tests/xe_pci.c:214:2: error: initializer \
>   element is not a compile-time constant
>           graphics_ip_xelp,
>           ^~~~~~~~~~~~~~~~
>   drivers/gpu/drm/xe/tests/xe_pci.c:221:2: error: initializer \
>   element is not a compile-time constant
>           media_ip_xem,
>           ^~~~~~~~~~~~
>   2 errors generated.
>
>Fix that by explicit re-definition of pre-GMDID IPs, as there are
>not so many of them.

yeah... but maybe making it like the gmd would avoid issues like that in
future? In drm/xe/xe_pci.c:

enum graphics_pre_gmdid {
	GRAPHICS_PRE_GMDID_XELP,
	...
};

static const struct xe_ip graphics_pre_gmdid_ips[] = {
	[GRAPHICS_PRE_GMDID_XELP] = { 1200, "Xe_LP", &graphics_xelp },
	...
};

static const struct xe_device_desc tgl_desc = {       
         .pre_gmdid_graphics_ip = &graphics_pre_gmdid_ips[GRAPHICS_PRE_GMDID_XELP],
	...
};


not really sure it's worth it, considering we are likely not going to
grow the pre-gmdid number of platforms.... so:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202509192041.tQwdE4DS-lkp@intel.com/
>Fixes: 5bb5258e357e ("drm/xe/tests: Add pre-GMDID IP descriptors to param generators")
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Nathan Chancellor <nathan@kernel.org>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index aa29ac759d5d..0f136bc85b76 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -211,15 +211,15 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>  * param generator can be used for both
>  */
> static const struct xe_ip pre_gmdid_graphics_ips[] = {
>-	graphics_ip_xelp,
>-	graphics_ip_xelpp,
>-	graphics_ip_xehpg,
>-	graphics_ip_xehpc,
>+	{ 1200, "Xe_LP", &graphics_xelp },
>+	{ 1210, "Xe_LP+", &graphics_xelp },
>+	{ 1255, "Xe_HPG", &graphics_xehpg },
>+	{ 1260, "Xe_HPC", &graphics_xehpc },
> };
>
> static const struct xe_ip pre_gmdid_media_ips[] = {
>-	media_ip_xem,
>-	media_ip_xehpm,
>+	{ 1200, "Xe_M", &media_xem },
>+	{ 1255, "Xe_HPM", &media_xem },
> };
>
> KUNIT_ARRAY_PARAM(pre_gmdid_graphics_ip, pre_gmdid_graphics_ips, xe_ip_kunit_desc);
>-- 
>2.47.1
>
