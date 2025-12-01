Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA22032D;
	Mon,  1 Dec 2025 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764549828; cv=fail; b=hGibtggKHnIv7UA6f+7YhOAMYLfuKA6b+ViRZw7LdZMJZtzfmu7jz/24fVjZuSyiXjrnOJSmxPV1RkjqJU5sLwI9XSfzGwu8MyAoHE4u+4FdBq1dFPrNj66AI3hsn46xvw/5PnwhdFOBb9QFsYOC6C8WJxgyL44hnl7TJaJKhcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764549828; c=relaxed/simple;
	bh=aF8g0PnbYXMuzzHAr8xt3bfZlW0ahAf4uk4DePpqZH0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eKrwIdmG6WQl4LrUzBZyxrbLA5vuFX0RzkDIC0SLiydsV8AR7KrT40kZxHk4GH7OLu6kYUfc6L9s57bxyueiRjSW5qc1r01BcbbogxvBc/GhTiHAnmLP8lzCaaiGBp3LOaL5cbd8GLb6JF6+jk4cIlaC7df8FAWvPeAe6xE8Mc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSIL3kAx; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSIL3kAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764549827; x=1796085827;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aF8g0PnbYXMuzzHAr8xt3bfZlW0ahAf4uk4DePpqZH0=;
  b=CSIL3kAx9ieZQC/Fo6lnqkrDDSCjlWho9zNFjKjOZh2/ydnn8k/r91kP
   8/ZIq2DLNXBbZYlPA+B7Nvl/2dkqwIyEhVr/J1AbX13H1y/tNZpYqAUy6
   JK3Mf1jHeo9X6yqasD+YIJWSgsLQ7LITllMnvqJXBrfdYsKvhmVzUP5q6
   kyrhR2QqE3dq0Wc2Lz9qfAU7Avwzgkja1gYnBRAyuaB38jlOKsbUYnqzN
   jhoPAmANXQGt37jHj+2T/ydLHGDzJl+2g7m0+9RZ7gp48tHHIdPGOdYdQ
   mX3Y6YSx9FKpQcYxyVZ11eBWQU7N85bOSRE2eOiXN8Q7AsfJpWIV1N8nb
   g==;
X-CSE-ConnectionGUID: q6/GvJmQQ6ugUBt412nwfg==
X-CSE-MsgGUID: fHibFqgTR9yfkg5MQynmPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77583815"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="77583815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 16:43:47 -0800
X-CSE-ConnectionGUID: UaHi0oKKTOSDQm9x98h61Q==
X-CSE-MsgGUID: UVftlTiPQ6C3zxSwwUFKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="193599733"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 16:43:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 16:43:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 16:43:45 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 16:43:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g85i6ftn1Ljcsay6PUnhyiOzyhm6FfSNRDGvs0yf3+nZm3sOI2SMbmi+xQJdWkqzFhVE9N7d99HOW6SG5xcV2XTIhFPFvZ+CCcFKMUoA6u3J7ESj9t4qdLq5VYbFHd9YBYcJpjQWy0FK5E8d8GW4lIJ9c8wWFwxttM4xOhAJLwJd1BhYfUflOyU5geXIREMCn8QQwOd/sZ7Ee/053Mc+4AWNrgShyBgxuu3GaCEvFsaZFtKpOJnZk/WHT+vwk7+0QBrjVWSvc7qoueTk8a/RT15xg9Mgf4fsz2FhA33ulK9IounQmqcjBuJloIdYk+ztetIz79zisiWc+U62v0L5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+PQEdTpkvXfFnY/0sdS7kJtVL+jK+JREIZO4sLgTbY=;
 b=MfxMbhl/dKMLfUfnq4MIS5CB07MIz08JWUwjIRvkEiN43A+ikIrRGOwecqyJeGVfbxfQ9cONZDJVRQbYktjtiZh2p3zcY7Rvc5gWzAzRofyk4HTyhbz5ew11YzgiQRHsHjtd2MTCrjcwBBtNCtiEFfoeZs9gBz1nSnlFEZMeSljTbPemYhSHF7jQ6ia3/+tZasd0A1qjV4avEvukfNqOHjq/dy+JxidbsPJMkhl8g7JG/RP67XcRKHjDLXD0rKcyoCclYtTFzZnf4QnZGJMnY3p7uTnp1gTerglTK306cN/c/VBEVPGXOK4rKNLvVdNDXuEJCJVgfWjGrnAOwL7kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB7317.namprd11.prod.outlook.com (2603:10b6:208:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 00:43:43 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 00:43:42 +0000
Date: Mon, 1 Dec 2025 08:43:33 +0800
From: Philip Li <philip.li@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>, Jonathan Corbet
	<corbet@lwn.net>
Subject: Re: [lwn:docs-next 64/66] Warning:
 sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <aSzktTVhHy6EQUg1@rli9-mobl>
References: <202512010746.EPe9Xcp5-lkp@intel.com>
 <4d298cba-7e61-4933-a765-1f8a60b8f0f4@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d298cba-7e61-4933-a765-1f8a60b8f0f4@infradead.org>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA1PR11MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aaec9f-055a-4721-2f90-08de3072ad54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ep5LeFbXaC71LTmAYxBmdiiYdgZ6tYkBS1c1LO8l4iCrrqYei33FMUl735p?=
 =?us-ascii?Q?cGrvmoNvp+IZejezgvvbHcenllsP/lhRce0bdFq5T6URsLv4Xe+L67jEAq34?=
 =?us-ascii?Q?5l0KWNQOWPv5IIVYPWCB5tR/SE/XJ38+lfRGUXY8onQ/3x8VLdAobG90YVBZ?=
 =?us-ascii?Q?Lr20qKPJiUgpBmyDByzVHXYnzHk41HqFKM6F3yjrWa23QdVS7/0YJF6nbEvr?=
 =?us-ascii?Q?j9QcnNNqN1zreH1ARIRY5+37w8sWkfCkUC1CBEviegbt+Uno1IFe0oZmWbdC?=
 =?us-ascii?Q?r7NAuB0+IfL82NjBWlR55pWvIsNdL6lJbzl4qlLdMlgAqPfIbh1Xbh9kbf/o?=
 =?us-ascii?Q?1UFLr+/1VqFjEmLLOmPVrxUiUXNpMZUY9EGYlO0QSnKgoJ205drzORyduh3C?=
 =?us-ascii?Q?dPXjyvY03iYS/BwgFDAdHhzhnETBfX7NjuYMT7X8ciH7DaJk/64igT8DfuJ7?=
 =?us-ascii?Q?6wpDq0HmIcJxu4JONZmo4q4WUkm5kKr+I2jqbwq861xElNP+MF9d+arvOnD0?=
 =?us-ascii?Q?GekkkLOfwgpyehVOEYhSNSUGzgehr08E03wiQh1P9b+ibuvkPORDAjWYePCL?=
 =?us-ascii?Q?3izJ9y5Z+PYP9DKC1hculvkm7GDagCCsKBOD2cNbJuda9odXTFbXyejjNquJ?=
 =?us-ascii?Q?L50vj8lidazha8mFF6pr07kugnw0rr3Ui+chYzbMrUCMzhJf+b5oNMt0O+PH?=
 =?us-ascii?Q?8y11yvjZpr91CGd5S9Hfq/Ryv07Q4scHW3qzXqM2i8Pz7DH3W/v9Id8ELr4e?=
 =?us-ascii?Q?NGBy6yTfHwI1O+6Z+IB/aGFAunwjTu14YEvZCkeahYcyPxa+AMRRt6fmYns6?=
 =?us-ascii?Q?aCh75Qrn0vEbfdNw9QD8IT/qYGRJXqTvcjFTvdoZ8WII/qsPpnndHZBQ26Wo?=
 =?us-ascii?Q?Wn7rr79eGfxIKL1Y66+ZXejTbTMVb+syl55b+tq4ojeCN7my8L2JeelD/JCs?=
 =?us-ascii?Q?rL95H9gm6zGHd0lla2oji8kxWDtEmi0h9QUFNGRGaKD/LdjEgFLL/XiwaZdK?=
 =?us-ascii?Q?9x9Yn+J+JdSDZKwErCWfk0e7UKEBIHgN1ErnOWJJtxms6WXUuKtgH/RHKqUd?=
 =?us-ascii?Q?ZIifF7HX79dhgB2csaviusuxAFws/s/7DtFeoalBNfoJMMLnWw5L2GaW2Gl3?=
 =?us-ascii?Q?PfXOHW9h9KijSVlYBsCgWKZEX3IfXqGTw4+C1ttpFo7lkr24IlrIGZzm2j7w?=
 =?us-ascii?Q?lR08htNzlcvXwebiMxzRQ5P/sE1Tj9pdXJNd/xqqKJSF7VKH7k+k8JSc3wR/?=
 =?us-ascii?Q?pVEmfUbY25rBo1vD5h0chV91gMkfzF4K2jXi42m72jwYMWV67oWLrsHnI51g?=
 =?us-ascii?Q?arwx0hsifeAa4oAb5fYWxjui6AQz1AzdQL7jjLE+7b+caWu10fJ1qFSrjTf9?=
 =?us-ascii?Q?uDk11PMCQobVNn11Fmp32nPvsLwgaNUQp2dN7kAf4DlU9vte7N7njVPSPCOJ?=
 =?us-ascii?Q?/h3Gbyy1nUb3C/RXI0TPYCzswUNNsZkIL/wFSIHdkvyOY1rLNs8fhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3u7Lf9J3IqBmHpnTrpAgXVj/+f8Volk8w/h1i6B6QGQSa39KwgmPobpptjCu?=
 =?us-ascii?Q?P115VJcuIX/aGLixrPkNF0BdZI98lhnQ1/JDc2V7Vd6Bk8/SOZSUHFjSD+W7?=
 =?us-ascii?Q?PPKT+UFPG+h5NCWsMWkbVVTM7Mfp7orPr1Quidy2Lw5JwtJvTuG07+1W/FkW?=
 =?us-ascii?Q?yIgFZ04L/+k1+E/aKzkYtKcPqaVbPBHRyeDUrB1bZ5ynWD+myXMmR+wFOCug?=
 =?us-ascii?Q?18RXx8epC2FkLvpa6bTCGyACS9M9trkUVzAPPc/dNGbxewIXBU9cjJBzL0sm?=
 =?us-ascii?Q?kk1OkH4vKsUoVk5sVJ9pH+7LEFzzDWAz5IeVF9jQEn7HbyXlmD3NVbnWuHd+?=
 =?us-ascii?Q?Vn2F4mZR1GbjZRdbEt7/GdAWJz9ItChZBYaKfWeV49Lm8b8PRHVza76sVoDF?=
 =?us-ascii?Q?hgQDfiErqMFLV+pO94jNDBkx6hPC6yq6VH+6jNkBHmkMUEN5yjjNhZuKcwpw?=
 =?us-ascii?Q?/zD+iOV2jIUGDvL9UAIynV2azvoatI6smbImAGk/MGS6lqdHM6BhJH6h4iyl?=
 =?us-ascii?Q?kCUv7eE6A2lIN5z6qdkW/Ph+gfNR3NsG2u4R/ETU6FqznqwEyaq0P8zQZo1p?=
 =?us-ascii?Q?zUAk3Uh1uGsvGDPt2Ob31fiqz8A/RmoyPuOZ33B6SbcIH5/mdqcFpyHfi2U8?=
 =?us-ascii?Q?W28oRNik1nK5KYCtT+kgdyjn/o1OoTRHg1DFollK3jlD//ekVs1IxfTKNIZ/?=
 =?us-ascii?Q?gNQ+kHqaCQiXCQLfGhYQhLZlctYBu/+ThOr73WbnIqw8FIS66PkP4qwKhaYB?=
 =?us-ascii?Q?HYkcMYbRZxUdHKtEBHCgeabavSEgu/z0gqEVUVDS9f3YBHcB02BaHuqLbmaG?=
 =?us-ascii?Q?843TzWkU0g37QJ93ixoaXKfgYmalNgKLAxGwJciYDIRWU3DyzVSxQd38Qcch?=
 =?us-ascii?Q?qiMoy+hH7G61cOfd/vfTKdLWzBXDEi6GxemcgHYzCJ8+zISCj+reY7pXeFBv?=
 =?us-ascii?Q?uren4OJfJG5Ld/foMNg6IYApaeB06m/4Sa3MRS6o3gWmarlNBL1yH82MvdNS?=
 =?us-ascii?Q?iHS7+Wp+74hvxxGX9m/oLIT2AgX5to727Sl4yC2PfUkBOsGOg29i7FCAaBXA?=
 =?us-ascii?Q?ltHxIfXoRLmr19LfXGa9CmWi3EkuojvE2h36NnyvRe217r5U1bOSusAr+eFU?=
 =?us-ascii?Q?dNxpD3SfDuWzMBXJA15MIDSehvfBDClpwgWi2iV99r+MTksKNo9xCny52D8u?=
 =?us-ascii?Q?A52cuGgWwUUN0qB9jXaDnOok5xJCkiYTxKnkcgTGG8Mbz5Mm2CWn+0fLCjaZ?=
 =?us-ascii?Q?sleSD1nmmpYhe9ooDjtP/vppP+rVB1mti9W+j48AlDjTmTNR84DKXwP8Zcmx?=
 =?us-ascii?Q?zc8s/SQlY1tUfqkesZGkWp14I/Glc2dFlvvLK4mzGr71BQYzUh9GJW8Z+dlC?=
 =?us-ascii?Q?Jjo8gOnYEumE/wjTZ+u557SPdZeaYr4aed92z6U0iLBM1+/uJfXXvE5mU7L2?=
 =?us-ascii?Q?Gc7f06HMT1n4PFikDda8E8mFRu6q1zOozW8F4Z8phkv9X4DTXbzMfT+RSV9C?=
 =?us-ascii?Q?cJPllo6vMZNbjFpekEQ1oTtnZeA3N5TR4drn+loRnkjszC8YxA2WPeXPtK2Q?=
 =?us-ascii?Q?9BzCL1pxo6fIMagTgm6BRpi0Xvwe5sj1qcvJSm4c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aaec9f-055a-4721-2f90-08de3072ad54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 00:43:42.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jFMlfa0AbwhvcO2GjiI7vr7snsqFMkxeoKXY/lYJeSNt/RQvC0ppEaA74zyXdEX+TJkF4Hx6uENu1XETCYmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7317
X-OriginatorOrg: intel.com

On Sun, Nov 30, 2025 at 04:20:59PM -0800, Randy Dunlap wrote:
> Hi,
> Is the robot an AI?
> Maybe that could help explain why a commit that fixes spelling,
> grammar, punctuation, etc., causes all of these kernel-doc warnings--

Sorry about this, the bisection is buggy and identified the wrong commit
in this case. I will further investigate and ix the issue asap.

> all of which seem to be valid warning reports when I have a quick
> look at them.
> 
> 
> On 11/30/25 3:12 PM, kernel test robot wrote:
> > tree:   git://git.lwn.net/linux.git docs-next
> > head:   464257baf99200d1be1c053f15aa617056361e81
> > commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [64/66] docs: kdoc: various fixes for grammar, spelling, punctuation
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512010746.EPe9Xcp5-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:6 Cannot find identifier on line:
> >     * @brief Text descriptions for playback output source options.
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:7 Cannot find identifier on line:
> >     *
> >>> Warning: sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> >     * Used by ALSA kcontrol elements to provide user-friendly names for
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:15 Cannot find identifier on line:
> >     * @brief Text descriptions for capture input source options.
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:16 Cannot find identifier on line:
> >     *
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:17 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> >     * Used by ALSA kcontrol elements to provide user-friendly names for
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:100 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_line_out_control ='
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:171 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_digital_out_control ='
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:259 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_12_control ='
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:330 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_34_control ='
> >    Warning: sound/usb/usx2y/us144mkii_controls.c:408 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_samplerate_control ='
> > --
> >    Warning: sound/usb/usx2y/us144mkii.c:13 Cannot find identifier on line:
> >     * @brief Module parameters for ALSA card instantiation.
> >    Warning: sound/usb/usx2y/us144mkii.c:14 Cannot find identifier on line:
> >     *
> >>> Warning: sound/usb/usx2y/us144mkii.c:15 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> >     * These parameters allow users to configure how the ALSA sound card
> > --
> >>> Warning: drivers/infiniband/hw/mlx5/umr.c:986 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> >     * This function makes an mkey non-present by zapping the translation entries of
> > 
> 
> -- 
> ~Randy
> 
> 
