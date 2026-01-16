Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5931D730;
	Fri, 16 Jan 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560081; cv=fail; b=UE2elove3Rce82mP62NYwU6JlnWBE3US9PFH2PEA0mc5vTGu257qcfy7nikOxMBCvsYUfFIwGz1cTzCJ+O7UabFyv+Nyc/IQreX7ohavNeh/988rGBn4fXnopQm/Fmz17sQc1j2so/CK9PjNfy7tBfyokOn+vZ27n2E9/WYxY/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560081; c=relaxed/simple;
	bh=eBMA6XENpp4Vy809WnHmWyl6SmenGYbKRSL1VprR3YY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=riJIRUwbh7hMOPPjQhUhLlvN/yI18KRNLw/Q2IlFG3A02eQZKUgd+5Z8eLzu4mknB1LcrC/+QyyuhL2EhxHPqkJcC4nUV+ivuYYIbzy6LCjTnWHRF/WWaRzFeNundQMB9oT73kRXLQlT85vBj9BBwwbvo47CEAOL1hhdE4Jue5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrLq4z0Q; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrLq4z0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768560078; x=1800096078;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eBMA6XENpp4Vy809WnHmWyl6SmenGYbKRSL1VprR3YY=;
  b=jrLq4z0QWtxhjQJPaVmI7F6jHd/nxpjUkrk9YZUiKSOl00ZKWgagwEtA
   CwHqOjPV3lKM9jye/rXMViYEsZ4Gx06BUY/dGEOa1m9myRjSOhbcNN+r7
   nCvd4jmF6KcAxPwg8BhCDld4JDfBrHS7nnGC5I6KJ5zIFBHK6C0XzHAkp
   kfVIL7cXOALoOBiPs1rRr8qvYBVw7EI1XZ9eLusQC0orSUXB6q595gbx/
   hsgJMX5iFmd+C30+zYR2CVVqO3R0a8/69mtPI7ViFy1kNUqSCSMXfnbuU
   A0t/cNl8pfaMO9puwVo79pcw9S7w2qGKCtnhnlAtzMrkmdG2age7NcYJO
   Q==;
X-CSE-ConnectionGUID: Lq0xvtbqS1mSpIdn4GbWTg==
X-CSE-MsgGUID: FRzVHLhnTFCiXAq9VDvURQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69965407"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69965407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:41:17 -0800
X-CSE-ConnectionGUID: Rhm7cNj4RnaZIhlxtSLsYg==
X-CSE-MsgGUID: 4S2d5jI2TjmCR36i9UiUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209696745"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:41:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 02:41:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 02:41:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 02:41:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EizV2IDsMGTNwye6tJ8PN5YDsnFWlvRTiG//Kzx6+SbNvjeON6nN5K5i4Uww5KbR/4QJvzTO5DfX/2XoZ/YynXR/NKf7PM0LvkSHc4jcTw86TRpxrgOphavvYy6i1xmDBPZezMgNM69NQA34ypXq7rP/Hdny0z7nGA6mwns5Lu4xi2cpznt8XZRltdPZCtV1TNMexrR7holvfK/0WTt4Wf64bGIg2tQoFc0dPOAsLMTMXzwzjuvmJbdM89oCAPh2rKmkToHlwMQbjERyNC28uNn05rdxXvxbuO/WZilZYbzLg0U6LaYE2HY9cusnMB0fAoA9r52HJuF9ARrEOjCPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuNzKY55SThI6eRGyL5hvKQvwEoBVVNFtOs+oE+sxXk=;
 b=c0aFQRhnWTDI1jZ/MWhwffXEElIPu4qY9EhAasToV3nKyPX6sml/JR7VlZPj9RkyCQBrnSi0WTaqgI750BX4AfymlQjyIEmqAlnOE7I1tZMOBNvEsoRQwo0FSpP3OHbx4Gu1OsgIgKh4HQYNkd8aWaaiYPhSkl78G3Be0+a+5eXSIGkHVd3GQmqv1noAS0FWvfleLT/72xPdh7+jPV2jmt8U399cC7XAgM3IeuJCep0EaAmqev9EB+M5orBgBQW4SSOo7Fofc67gAJzDR6MLJUxBFkPDXfO1InWGPHfzOfobNL9b2/GTOagqYFjqk31UXpbvY3JNgH7eXqglepsXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:41:14 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 10:41:14 +0000
Date: Fri, 16 Jan 2026 18:41:05 +0800
From: Philip Li <philip.li@intel.com>
To: Qi Zheng <qi.zheng@linux.dev>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU
 pages for lruvec lock
Message-ID: <aWoVwYxCKIDUtj0H@rli9-mobl>
References: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>
 <202601152057.xgusZpKm-lkp@intel.com>
 <a8128951-326d-454e-84e2-8b7cdf797b8d@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a8128951-326d-454e-84e2-8b7cdf797b8d@linux.dev>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA2PR11MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b3fc9f-1fdd-42b7-f85b-08de54ebc562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SMdKHoE6k58sd2oMjfmQBrOSlbtqwngqjybFy1gE45hROp56zKBK3iYBpUfp?=
 =?us-ascii?Q?2Zt5UvzyksgmzNo9a3YUpHmw1NZiwn1lLCSpwkexgfqiboCyHDtIVygBnRDC?=
 =?us-ascii?Q?Vo4tvri8UBLm8XsqTM7rcl0rL2V3bJAajAnwt0d+DtSIxQq00//HGhlHcvhz?=
 =?us-ascii?Q?gTk9ZNCM14sSwclwoASWtXdzdn17ya5ZRUI6JZS9RwrAK39wcrsqCSMgUah0?=
 =?us-ascii?Q?dWLte4o2FDKYmgK+iSucnF8BtTwFrNYq+XLhWugxfnWNbhmX5DqHqtVvxTK4?=
 =?us-ascii?Q?H5GgPIFjTboctf3GR+cCiEQAuwuKFeId83h++CRZsrg4yeOU2GWtbbcafV25?=
 =?us-ascii?Q?+pGrTZ7noPiojcobyoPlaE5ZQVKOX0mkfCdl3W44BkG2J61xLIi+A6gsboDE?=
 =?us-ascii?Q?8ilvrb0MwgTonqz80fNXiq8KIGGMrMmhmWgegoAlcw7borF3il7sxBGrhReU?=
 =?us-ascii?Q?uSdxhjv8o46+AhGsZZWr09yYT2NW+J5f7npM8NrPo+3gj8Eu84WL75NsVqzy?=
 =?us-ascii?Q?m5qUjh3513j7OvIMQSPMXPeFEzUGe62+AudNktBEsaS48pxvGCg/mwx3gBvq?=
 =?us-ascii?Q?+wjcEt1maXQhlX1KUJ7dqXlGG7kgz2KaTHTyHwEUOGQCaI9T3ucafVKjYPKT?=
 =?us-ascii?Q?ihi6h99OnEsbfvYmVPiIbxEv/uIGuPUCsWApuqmXDspHK81NhDkHscoZIFfP?=
 =?us-ascii?Q?N8CDSfACk1DNU2yIKL1CoytvvMQOW3GYZZmlXdCHbwAHEfbjVYMrT+zMGLb2?=
 =?us-ascii?Q?fcZ2vMr8cK/YI+/drNo7SBh/mERSctNdYCdU3PUkS5JN3FunQuPfUzColNPj?=
 =?us-ascii?Q?/PYFxo7OonSetvk0TzsrxOOc0TVdhhS7DZdqfGg6BQBnURObeWmPSkUCLZYZ?=
 =?us-ascii?Q?/wmdRA6UONKuFHTI+1R5OTIVQHNYAPcX8iaH0uJe+NPzUbokDf/8TJQfDlXt?=
 =?us-ascii?Q?b3f3nL9msehCnWtGVT8DTTslmWurf1JXyhbhdVsrkxx6xogzMhJChCBl1JpK?=
 =?us-ascii?Q?MmFFkC6Q91NNnwaYu2956W6dWIv2G5fAKzRbpcE4CNvtg2Awc+jMWRTu1sVz?=
 =?us-ascii?Q?Fsg9suGzNcp9NQ1Y9CVVpKFQGhkM4b6bae6dhYupx89Sv8P3Kh7Trevuvvpu?=
 =?us-ascii?Q?D5LI1nO6D1rQ4M4saEDgsItnarEBpUZ56upKdkRXwylcOwZ0r6jGMHKWRZLn?=
 =?us-ascii?Q?5Y12m6PdkMTgdpm/4NKmszhZP/mJTnKhDfzJJ7y9TfMbmbHIJwZAH4lndAfe?=
 =?us-ascii?Q?fUUFwvMCKDBk4JJuDZh8/ij3ZukvIw6dpLRlHSREA61kJFlI9T5A3WwnLjxz?=
 =?us-ascii?Q?qRURrZDvj1vO6mjd4cYAFkjWuvGwfAWXEt+dD2pWOkHlUF7oRY1nsBPBI6eg?=
 =?us-ascii?Q?y9njSROaFF1rqDDmjlJzthQHdhRXYHBi1BRje8QetE7p+ttQAkLqSDuqAt9K?=
 =?us-ascii?Q?547AOaH+7zfNauVa6AXtQa3GyI77CdBOgNapaBsafMKq5cdGYXNjVJUjUJEZ?=
 =?us-ascii?Q?BoW6y9Z4EHJ7464La7DGwEIhsxSrPjC9Y9vAXscJbj+a0sdFuJ7r4iVDjTZR?=
 =?us-ascii?Q?zkRP4FyqtuxJUMedpQ/CXE2LI5GK7m7PCN0wXzmV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qexKiwDTo6RBSb0jx5Ne2c7zP8Foaa7neTWAeCYNs8f2aBlQ/Cvh8UXQSkzL?=
 =?us-ascii?Q?kDxDRzToMRsN1R5hIk7vuTqjziHRzFiyGZ7r/ue88I6QYVpUobSZeiPbadfv?=
 =?us-ascii?Q?SR9VeuWQrSbYbPkJmxqB/96xPBwnmT29r7YxAK8mQxsuBUp1kzJ0uGLuOG+y?=
 =?us-ascii?Q?t11j7MW1ZR27vpcRUBiOSQVm2//FqHS1+pepi53ZwAl4T1busuoBc/jAguE6?=
 =?us-ascii?Q?qL5QsbJMfiY2XY3o6otuAMyZn+sGm4hFfnoYM7xC6EDSSJl/qApCoVL2jbWH?=
 =?us-ascii?Q?BrqVBu9k5js3qQEDBODtV+F0KC3raq2Kmjdp4SGycEVPW9f1wHVQcaTwG7OE?=
 =?us-ascii?Q?xNrNibLjyDOx4bvS+23fuSe8t8jvXTkLXxyjuTnUBO0WCmO5i+HBBPxQTTkT?=
 =?us-ascii?Q?nVC215dnn0x2vhChJAuK88zXjVIcvVdpmvOzzlPEm6odqeuwxY4a16Q/Fytm?=
 =?us-ascii?Q?Y5FPdXp1qzGDq2t3eAGVLl0QNR1pHr8GqHkbQu1UfyNrAbls9WfZqg+kJotm?=
 =?us-ascii?Q?15v/9XbhkSR1nuJoass2GmfHmPg+JZrBhjD6R8pwKYv/F60ITQTOdK1bHrIq?=
 =?us-ascii?Q?wElEsThmcmdLHKHvA1Bj1zquy8SFY3NXaM3nVNc9omYhvHIi9yahLTQcetrx?=
 =?us-ascii?Q?n9WgbqavMmGm68xOKVS+qDFsWGBi0BMnwf75kxX984TJI+33mlrtcNa3T5SE?=
 =?us-ascii?Q?ehk7/VeZu57NQ7u5X5zJTSchXi1GtD69tNRvhNRBiwUJEbBNNUC7B6tLUl2Z?=
 =?us-ascii?Q?zMyBXGSwLHXwK9G3iqO03xgo/oY0vUAdWHdY+XaT/ypB969okrLeoBz5wTcJ?=
 =?us-ascii?Q?A3jFW4BYACF5Dd29iBy51/fDJqIrTRu2OSTr+xeSoAUPXoWWd9OdqDyBPSBf?=
 =?us-ascii?Q?5+8422loZXDZ+9Ks7zDIH8i5kTuPyoKVzzLoezlLAEjXq4EQ8gSfda6sPXTm?=
 =?us-ascii?Q?ea9kHsR7lohzYQqiTVa8Rgn6LjChw7NXg94Aug74GSNEW10zhyLZ/M6zBvH6?=
 =?us-ascii?Q?6RES6Iort3Tyo3gP3XuOYWBCRHd/AsMyiaOm+nkCBKhxm43w8alzCuWwUNAo?=
 =?us-ascii?Q?JPwwDyyJSsB8EgTg11hSW7zm34bps3oUXiWn8hppt3nMHIfOFou8J5MVM2v9?=
 =?us-ascii?Q?shym3MULImrhtmCvNqFApa6ZHS17dQeBWhVunNEYJ3AyVCi/JPcm+mYTZr47?=
 =?us-ascii?Q?A7oRNbllLoBlv4jeRWlM3CPSDZcdJfIBuNOrtsQyh+RGm699xkg/3uMmTcaK?=
 =?us-ascii?Q?u6INns0a/++44rGTbb7l8EytNNvstp9XcTcvqL7zGjmjgfNTDOTX2xGKGsPD?=
 =?us-ascii?Q?YYclkv/IQLLowar9DDiVdmLjuDxZlbjc7YDkR0judWPbTqyU1yDjXP+t6HQl?=
 =?us-ascii?Q?YhrHDSc5fXkQ9OMwwTrC9IXHAwYsjP7SUzzPf33/Yq6roytLTYf0wuAjmNQy?=
 =?us-ascii?Q?DRITzQijZ/vn3lDXY/oOZAQAuyRJjbR4wQENjnWnDTlWJy/6gnp1djUZ15MB?=
 =?us-ascii?Q?PfIV9MgOCAsn3mQ49WPIzkqjo6WyrtMewfMT10fdyjHKpVr561GIawyMW7w5?=
 =?us-ascii?Q?/n5z6UkNpOn84TTXcNb0bbELnzFqQi4z9Qbwe38kIVo/5NxVEgElcawCyGOM?=
 =?us-ascii?Q?V0sEbi6+aVVo2kuscMIKy/aEf15+uyc0/Ed7gtwkFPcTqDP4dVOJwNsGrsoh?=
 =?us-ascii?Q?eWszSvMoqx3U6sSMYVTsQ3R03F15c6aFTNCx8TZoUmocnTVeNavV1wrRHISS?=
 =?us-ascii?Q?GitXMDPxXQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b3fc9f-1fdd-42b7-f85b-08de54ebc562
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:41:14.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09mcRs43YNVJxkeMeXLd0jaSZ4w7eFPqV0RhFvRDDXgFF/9eqFdkNIGrM5gA/8xqfii3lbZE2EjKYmrdFrW/Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5035
X-OriginatorOrg: intel.com

On Fri, Jan 16, 2026 at 04:16:31PM +0800, Qi Zheng wrote:
> Hi,
> 
> The compilation problem I see in the report occurs under the following
> configuration:
> 
> 1. enable CONFIG_WARN_CONTEXT_ANALYSIS_ALL
> 2. make CC=clang bzImage
> 
> Could you please test whether the following fixes can resolve the
> compilation issue?

Hi Zheng, is it ok to give a try to use the reproduce steps in the original
report [1] to verify the fix? As for now, we haven't support the auto verification
for the on demand request yet.

[1] https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/reproduce

> 
> Thanks!
> 
> ```
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index e0b84b109b7ac..f28c5ef9bf604 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -742,15 +742,9 @@ struct mem_cgroup *get_mem_cgroup_from_current(void);
>  struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio);
> 
>  struct lruvec *folio_lruvec_lock(struct folio *folio);
> -       __acquires(&lruvec->lru_lock)
> -       __acquires(rcu)
>  struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
> -       __acquires(&lruvec->lru_lock)
> -       __acquires(rcu)
>  struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
>                                                 unsigned long *flags);
> -       __acquires(&lruvec->lru_lock)
> -       __acquires(rcu)
> 
>  static inline
>  struct mem_cgroup *mem_cgroup_from_css(struct cgroup_subsys_state *css){
> @@ -1477,38 +1471,10 @@ static inline struct lruvec *parent_lruvec(struct
> lruvec *lruvec)
>         return mem_cgroup_lruvec(memcg, lruvec_pgdat(lruvec));
>  }
> 
> -static inline void lruvec_lock_irq(struct lruvec *lruvec)
> -       __acquires(&lruvec->lru_lock)
> -       __acquires(rcu)
> -{
> -       rcu_read_lock();
> -       spin_lock_irq(&lruvec->lru_lock);
> -}
> -
> -static inline void lruvec_unlock(struct lruvec *lruvec)
> -       __releases(&lruvec->lru_lock)
> -       __releases(rcu)
> -{
> -       spin_unlock(&lruvec->lru_lock);
> -       rcu_read_unlock();
> -}
> -
> -static inline void lruvec_unlock_irq(struct lruvec *lruvec)
> -       __releases(&lruvec->lru_lock)
> -       __releases(rcu)
> -{
> -       spin_unlock_irq(&lruvec->lru_lock);
> -       rcu_read_unlock();
> -}
> -
> -static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec,
> -               unsigned long flags)
> -       __releases(&lruvec->lru_lock)
> -       __releases(rcu)
> -{
> -       spin_unlock_irqrestore(&lruvec->lru_lock, flags);
> -       rcu_read_unlock();
> -}
> +void lruvec_lock_irq(struct lruvec *lruvec);
> +void lruvec_unlock(struct lruvec *lruvec);
> +void lruvec_unlock_irq(struct lruvec *lruvec);
> +void lruvec_unlock_irqrestore(struct lruvec *lruvec, unsigned long flags);
> 
>  /* Test requires a stable folio->memcg binding, see folio_memcg() */
>  static inline bool folio_matches_lruvec(struct folio *folio,
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 4449d1f371a56..77a6a9fa11981 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -328,9 +328,7 @@ extern unsigned long totalreserve_pages;
> 
>  /* linux/mm/swap.c */
>  void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
> -               unsigned int nr_io, unsigned int nr_rotated)
> -               __releases(lruvec->lru_lock);
> -               __releases(rcu)
> +               unsigned int nr_io, unsigned int nr_rotated);
>  void lru_note_cost_refault(struct folio *);
>  void folio_add_lru(struct folio *);
>  void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index c303c483f55a4..8907c9ea33bbc 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1313,6 +1313,39 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
>         }
>  }
> 
> +void lruvec_lock_irq(struct lruvec *lruvec)
> +       __acquires(&lruvec->lru_lock)
> +       __acquires(rcu)
> +{
> +       rcu_read_lock();
> +       spin_lock_irq(&lruvec->lru_lock);
> +}
> +
> +void lruvec_unlock(struct lruvec *lruvec)
> +       __releases(&lruvec->lru_lock)
> +       __releases(rcu)
> +{
> +       spin_unlock(&lruvec->lru_lock);
> +       rcu_read_unlock();
> +}
> +
> +void lruvec_unlock_irq(struct lruvec *lruvec)
> +       __releases(&lruvec->lru_lock)
> +       __releases(rcu)
> +{
> +       spin_unlock_irq(&lruvec->lru_lock);
> +       rcu_read_unlock();
> +}
> +
> +void lruvec_unlock_irqrestore(struct lruvec *lruvec,
> +               unsigned long flags)
> +       __releases(&lruvec->lru_lock)
> +       __releases(rcu)
> +{
> +       spin_unlock_irqrestore(&lruvec->lru_lock, flags);
> +       rcu_read_unlock();
> +}
> +
>  /**
>   * folio_lruvec_lock - Lock the lruvec for a folio.
>   * @folio: Pointer to the folio.
> 
> ```
> 
> On 1/15/26 8:34 PM, kernel test robot wrote:
> > Hi Qi,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on next-20260114]
> > [cannot apply to akpm-mm/mm-everything brauner-vfs/vfs.all trace/for-next linus/master dennis-percpu/for-next v6.19-rc5 v6.19-rc4 v6.19-rc3 v6.19-rc5]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-remove-dead-code-of-checking-parent-memory-cgroup/20260114-193921
> > base:   next-20260114
> > patch link:    https://lore.kernel.org/r/0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch%40bytedance.com
> > patch subject: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
> > config: powerpc64-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601152057.xgusZpKm-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> >     In file included from include/net/scm.h:9:
> >     In file included from include/linux/security.h:35:
> >     In file included from include/linux/bpf.h:32:
> > > > include/linux/memcontrol.h:772:14: error: use of undeclared identifier 'lruvec'
> >       772 |         __acquires(&lruvec->lru_lock)
> >           |                     ^~~~~~
> >     include/linux/memcontrol.h:773:13: error: use of undeclared identifier 'rcu'
> >       773 |         __acquires(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:775:14: error: use of undeclared identifier 'lruvec'
> >       775 |         __acquires(&lruvec->lru_lock)
> >           |                     ^~~~~~
> >     include/linux/memcontrol.h:776:13: error: use of undeclared identifier 'rcu'
> >       776 |         __acquires(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:779:14: error: use of undeclared identifier 'lruvec'
> >       779 |         __acquires(&lruvec->lru_lock)
> >           |                     ^~~~~~
> >     include/linux/memcontrol.h:780:13: error: use of undeclared identifier 'rcu'
> >       780 |         __acquires(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
> >      1507 |         __acquires(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
> >      1515 |         __releases(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
> >      1523 |         __releases(rcu)
> >           |                    ^~~
> >     include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
> >      1532 |         __releases(rcu)
> >           |                    ^~~
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> >     In file included from include/net/scm.h:13:
> >     In file included from include/net/compat.h:8:
> >     include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
> >       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
> >           |                             ^        ~
> >     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
> >        18 |         unsigned long sig[_NSIG_WORDS];
> >           |         ^
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> >     In file included from include/net/scm.h:13:
> >     In file included from include/net/compat.h:8:
> >     include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
> >       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
> >           |                 ^     ~
> >     include/linux/compat.h:130:2: note: array 'sig' declared here
> >       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
> >           |         ^
> >     include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
> >       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
> >           |                                                 ^     ~
> >     include/linux/compat.h:130:2: note: array 'sig' declared here
> >       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
> >           |         ^
> >     include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
> >       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
> >           |                                                            ^        ~
> >     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
> >        18 |         unsigned long sig[_NSIG_WORDS];
> >           |         ^
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> >     In file included from include/net/scm.h:13:
> >     In file included from include/net/compat.h:8:
> >     include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
> >       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
> >           |                             ^        ~
> >     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
> >        18 |         unsigned long sig[_NSIG_WORDS];
> >           |         ^
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> >     In file included from include/net/scm.h:13:
> >     In file included from include/net/compat.h:8:
> >     include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
> >       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
> >           |                 ^     ~
> >     include/linux/compat.h:130:2: note: array 'sig' declared here
> >       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
> >           |         ^
> >     include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
> >       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
> >           |                                                 ^     ~
> >     include/linux/compat.h:130:2: note: array 'sig' declared here
> >       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
> >           |         ^
> >     include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
> >       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
> >           |                                                            ^        ~
> >     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
> >        18 |         unsigned long sig[_NSIG_WORDS];
> >           |         ^
> >     In file included from crypto/ahash.c:26:
> >     In file included from include/net/netlink.h:6:
> >     In file included from include/linux/netlink.h:9:
> > 
> > 
> > vim +/lruvec +772 include/linux/memcontrol.h
> > 
> >     770	
> >     771	struct lruvec *folio_lruvec_lock(struct folio *folio);
> >   > 772		__acquires(&lruvec->lru_lock)
> >     773		__acquires(rcu)
> >     774	struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
> >     775		__acquires(&lruvec->lru_lock)
> >     776		__acquires(rcu)
> >     777	struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
> >     778							unsigned long *flags);
> >     779		__acquires(&lruvec->lru_lock)
> >     780		__acquires(rcu)
> >     781	
> > 
> 
