Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC313446C0;
	Wed, 21 Jan 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008661; cv=fail; b=edoWAR98GCfAzMdmLPh7obP+2sAQptlEkEYr+SlXxmZDt4+CDqo/o5GOYe3Y7Wlk3Y++OChwjTk1OZwYYB+naNpusQoMpQpYtQGt49bXxiuQ2U7vWvGIg+LGJ+c7Z676P+8J/rL+OMqQGSsm7J5tZgYUa6XRWv5mFQ96EnhSpQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008661; c=relaxed/simple;
	bh=tVShzS1sHiWoroGf/s947+lB4V3xLAVOOUp6Lx+yXVE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EQksUb3gWyM40mvJ1lOPismNAei3yJOJh0a996P+etEV0x4B2WZJqOSyGyGwe+TgIblzDmVRE3FRsagLOdLvH9rGc+mIbjcocANRbXCj27k6I+cKfjIc8bq72HHW9PimAko0+bbqOOruSQXiFSGnPP4hmstdEr3LbwosJiLzwB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0s6J2ym; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0s6J2ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769008660; x=1800544660;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tVShzS1sHiWoroGf/s947+lB4V3xLAVOOUp6Lx+yXVE=;
  b=n0s6J2ymlLkjcGg3KRA5Kuu0GzUKNEEBsnrhVgx8AYdLHsgE1ZfBoSsr
   UmCFgvARQhPisqaffahPktpI/4i46jUFgFlapCIORbYBNoRpt8m94UOv2
   Ashm6alZKkV0o+ZC237ysKamlqOVNgJNKKXv2kz0SFKNp1eakAsVFuYBi
   AVa56I3LIM7iGAnrMnlng45mgRp1hDytyQwlp2LNrKlMs1M5aZ81QZkrZ
   vOwW1A8M4FEfOR1rfLvRX1nC87ya2arXE2R2tQAn7HfjTtzLUCdVclD2A
   xVgc2SlVdl9VAEB6BT/4BPCzSWcHp5kDHmjDCEPCAxAoaMY6pcPJv5Bn/
   Q==;
X-CSE-ConnectionGUID: R0CJ+wxDQzOVFiBX2V3LYQ==
X-CSE-MsgGUID: rB+sPCehT+mP79fibjaiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81683134"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81683134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:17:39 -0800
X-CSE-ConnectionGUID: kNLMZ2SmQWuAfrf/vyYURg==
X-CSE-MsgGUID: qBgLmvl6TTS/tFjvNUvG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205727683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:17:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 07:17:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 07:17:37 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 07:17:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7YyrUH4GGZ0iS0KPx/pkwG53N5EjiYUQ+47PjCE/Pg2HikanJKIEsAVWTLQYadamgHopCiHT6zjKwmLTCyWYBD7Ue03CpoBfAqr/j8Uk4a2OmxTZ62gvX0XOb/NG+RwLYghJ4or4EWqQBYcWfJku4MtO/VSXDODBpCqbCO+4YTBnzYao+VsQQQcmG12r5fnWlMzKhxcqai71sVXpv6P4M/aqqPF2xRJ6IfC5VL2nsVBVqYfERRpXmLC4NJ0LEs9wWUHmNMblcPy4c5v0qmGLmGEmrQVvWCi1UsqqTlsZPfIwpjtV0Fh6Y/1m3Wk18Ch7OKvaduEXZZ/uzOyE4hpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOODaCwQURF2rkGOtSVLJ2LP9exEW5finzXiGDGPpiA=;
 b=fYfBFJ48vjxRRDdr+bcyo9eGyvtZT0kIE5rAstvIkabrwm7qJ22wRXPpjzPnCm0FSnRZ3CBtkJXFK66GlAZFDcCo9fKSUrrVgMaOSB6GXZUlP712dOMhfK0qy3HRk04eLm46EhT9BH+4D44g+Hu1FJttG3rsnzwD8QHjnfSVIVRJchi4JS6cC+P3kl+bZPSqKXdmL1CgJwygbJS9cnCcrjUnHo6zkiZmvkwD07Vbjs1nrSSzkTW6iK8elJcXFIzjdZG37ce3dznBxl9cCZPNX3eNu8GH8sS51xndGlxHCiySL0Ghi1SwP56Ulbry01XF7em/RtGPvvm7c/xJlklk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:17:34 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:17:33 +0000
Date: Wed, 21 Jan 2026 23:17:22 +0800
From: Philip Li <philip.li@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: kernel test robot <lkp@intel.com>, Marco Elver <elver@google.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>, Bart Van Assche
	<bvanassche@acm.org>
Subject: Re: [tip:locking/core 24/43] mm/huge_memory.c:4055:8: warning:
 spinlock 'xas.xa->xa_lock' is not held on every path through here
Message-ID: <aXDuAoDeFOhHvHAP@rli9-mobl>
References: <202601212251.RuHvsKd5-lkp@intel.com>
 <20260121143100.GC166857@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260121143100.GC166857@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2bb9cb-a426-454c-95cb-08de590033bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ca+P7FjAQnR3WPy6ZID1EtsqW6A3Zo58bL4fUX4+4+BSzBgcyQ0kyKI/ZE4x?=
 =?us-ascii?Q?ifq6LV1PBdjwbvdruUlI9vcgWaWLjWdzQy/IhvLWfRNQeRTypYlipgblh2wd?=
 =?us-ascii?Q?xdHCsXRDUekyD9YNN5dTR8IjqzTWDdjIgiJWnl2n/wMOm8WCFargydVlucGT?=
 =?us-ascii?Q?enz7i5DHZ21oFb/+4ojtVcLauj6jyQfMK4/hFysCXHHnOxXKcOwexMXFAxNw?=
 =?us-ascii?Q?9p1zgLehC+lpWa98gkMqxsA85MrrFVBy7ZjyxgcHJvb0DRTWpwJbDHiI6c41?=
 =?us-ascii?Q?KHR9+5p7daCdZjFwcNpMdsaukOUz6ipoDGgMjc3gkJGNOVCiLY00XC85WYj1?=
 =?us-ascii?Q?n5OmusYW5VkYmANOayZDDEEh+vKlhHc3JTYDcJzOuKhLxSB7A/ZwkzNZGQuO?=
 =?us-ascii?Q?YNfdYtIE9I78ap2UEZJtBgKVpgP8mBf3JYsUXJwBInBP1sDbogl0A0W2fQYQ?=
 =?us-ascii?Q?0dL5c/Yn4Wcx0pXpdhhq0a2G+sTsKmWp/Fq1q9ifJrxQtmxQgsv7d9QpyVMm?=
 =?us-ascii?Q?sKsJSLyrGF/ETTUzBBz1VS8lKqpww8VdwtZFktWe/4B04pOKz4RX0+mOJSQp?=
 =?us-ascii?Q?tshPRaIzKo0KOQo7IKnLh+RWEVd9al6Yy5mx02k/1Q3cn/1OiCuT/J+XnOOc?=
 =?us-ascii?Q?wCjUQs2NupNJviiBsIsE/Pope/i3oE0j67n3n3x0j+HyeMwlYyO2MVDOzlvu?=
 =?us-ascii?Q?9eqfICx+ZUszTaYfe0pjqVQGuVVu1RP4XfMmmjJsK8D6Eym6JeWg5K2aAvG8?=
 =?us-ascii?Q?LUJNNqAHffZS6poL9ucapxCM6PARMCAnwUgjI/jHbmpZMAs9Y8CY3wsk1twl?=
 =?us-ascii?Q?j6NzbPz9jbrW5WGac9coweYYkEx5ReAidFg2GWdS0pqFEBUV+y5cH7eEFlz9?=
 =?us-ascii?Q?2vKDG7JtzBCti4ujehJGhyuGt5AJ63wGUCb0GNV+3tqG3GOl84Hg9N14bVJy?=
 =?us-ascii?Q?UUsq1+6lXTjVU1boezdZtaBN/9H9dBePVlIRZiJGh2ZXSPgXUdpUKtCXbp6D?=
 =?us-ascii?Q?tEmCfXF5+beY5W3EKH1uYQ6X+zDmLSzzKFDAkm9C1FGyRTfH2Qo/+4y1J+pb?=
 =?us-ascii?Q?XK0+TU1v4g0Buf2kYu5E1hnIAcMnmN7htu32/VmlqS9noRY4kOgWaYP/t29r?=
 =?us-ascii?Q?RB9GWYnZ0X1GdqCFZhuohA2uZNZB8g6p2GiWd9VyZtAgoCKruvQ3O0rL3jDx?=
 =?us-ascii?Q?Vi1gpg/KIOlVZ6qHgJaf3fuPojYeVJwFS2rOt0j+11FjW75mrJbzgo350kEc?=
 =?us-ascii?Q?YnKDxbEe5Q8Au8GfhEbzlWVGoZgaAo8+8suA4Jv4kD9QJSm7STo25BFHG5fU?=
 =?us-ascii?Q?DF8eTW4PjfpX5Vh2M+WWe9FI3GbDaW/5EqMYBEfoGUwrLf2OD6yZ3/slRUcu?=
 =?us-ascii?Q?l6gzzrvhoetoZAnR0zhb5Ah9VTKZZ6xWQiTbL6WUuajIVSv9QEPvlxFad8mY?=
 =?us-ascii?Q?VEq1QTIYgMXm1z5HmTbfNm71ffPdF6cwLbfBahtydVYT6c8oUjV42aiCeSFP?=
 =?us-ascii?Q?eCXNTYiF6NkCKKJORvlSUtZVybrfTE9o9YOCExaVbqVd5fdl2NT3rWZMt0x6?=
 =?us-ascii?Q?LhvXGUcegS4DD5GxITRZ7b8EYf3gYuEKWlZBfRid?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtqt7U/+x0uXRlBhORz7MB5lpUzPaDV6gnHurCcgpDLi1xstjAApS/ps8BAr?=
 =?us-ascii?Q?2schTypV+dcG3egFs8a3yTeN73067hBXTthVBD6/IluxDJIIj3qGDocnC2e6?=
 =?us-ascii?Q?tY/J+LrvfCRRMf6MLmQd17vrShf1X+HchD7EdgmlreZxBGUSgCZrKWK0anOV?=
 =?us-ascii?Q?VNo/nLMTKTHC+KRtzQDkkctugT5LC1fXuG4jwkx73ofwCqiWeye66SnY2Epo?=
 =?us-ascii?Q?yUSNq0BmGb0f9ROjIricLL+eiIwAlBTP6To3iOJ1dM08BI6wBvt6mjbFpyHz?=
 =?us-ascii?Q?7qS6kDwj+rZ+PN0kf0V2hDZFtX74Z/emTSBqTGPm+DUj8RrOOrrlYJdjwmgj?=
 =?us-ascii?Q?5nvI2BWN1f29Z8uXOfQIFsaqCNmJrWTUr41PAGlYwZJHvLS7mVBP6/4xnDYZ?=
 =?us-ascii?Q?n0SA9cUIaxPUF9Rijkwl1AXT1kK1fRAMC/CoPeUusfvpxYqVgh49UqrvE1rH?=
 =?us-ascii?Q?xcLsfcOKFgMl6l6dO7zZbQ7wTujmS++l6skPqbsk2SpHNesYk6SQrKYPpXZO?=
 =?us-ascii?Q?KMiKp3ivcd3g6UwlQs2/p7OOqhfhmCWrxV6wlkmOvz9GSivdTX5WIifrg6KW?=
 =?us-ascii?Q?cdSn/91M+klt2fzV0hwJ6LrBSh0sm9VrGRTeXNlsatj8TzIzg4CswO+8kQCY?=
 =?us-ascii?Q?nrOVDR65MvdCAr9xNUe4AMMWIg8rC3QGLeOfDyyfmaNK63OicALci0g3lNuY?=
 =?us-ascii?Q?VOL15gxk+kL9mGZFpVl8klxiuE4TwzzbufitBiRVXWIiMgK8bLWD7g8rodol?=
 =?us-ascii?Q?P+epSf3egoz0LrNoqFGMJV15wsKQucp9cvDVInYz0IbzADl75mFPTzkNt7SC?=
 =?us-ascii?Q?vodbH8gVBvhKrwHMGJDKgi9S1Z1shD4GuVrMDsn8gFI9c0CPlBnvfsRbZhn2?=
 =?us-ascii?Q?cdR2WYHUT2J3DioXetBacWbXnsRVWcYnxmGyOfTxQgYybMR69xiaGZTqSFEn?=
 =?us-ascii?Q?5imvWFj9o96+zrVthnRYToqQLzOBFRqYZGHcxRmW2oiUULlj4/EIKwUG4ojv?=
 =?us-ascii?Q?EaZdmrPoM8qGIbLr1h+MBAieAyn2o/L5ztLlydt5ZD95be3OadWM6HIiiAwm?=
 =?us-ascii?Q?06BKpVDH3/kL7xPwIQmIGbw+zNf6f04UTdAI+VArAVIBW6JCy/M7ThCnmHCw?=
 =?us-ascii?Q?f5Rt6VjIQUVugSPDQoixZTfEVkdK7r1EbBFrw2aiAspCza0G4SecAJR+DiXu?=
 =?us-ascii?Q?JTX64UDEG3K6bsj3BtPUyYgX14wOCwjkp7ceUKJ2kd5448dt+JI9pXZUhAJv?=
 =?us-ascii?Q?fyTDR0JkOk/FXplAqsnboLfQzKxFKEoWwjfzd17VSOWSa9qieMdIDLQ/52o1?=
 =?us-ascii?Q?MiENdD4+BtdwM+lujmwC4ZHUHBhb6b0amCFI55Vxwd+QQGNq/LSKgmP45Eh6?=
 =?us-ascii?Q?OK6THwquCBQfoBXAIvsyyoLjTBR3YW9kut64jwZ3UbJQEXuY7YY/yrLt+UnL?=
 =?us-ascii?Q?vRJsnKSM6lvQj3es7hHfGDAGrc4Xaa+aiQf+UhvJhNnd07WaZRMVZZ7UhU9X?=
 =?us-ascii?Q?cnN34shCimkhV+ld4f79gfJGN/B9JvrpZgUIPVFMDGKHhTSq0ichg51mxQtl?=
 =?us-ascii?Q?2OW0bF0DYoaGyB1ReRHK0XE38UBPJd9Cxm31IKpTIMs2KHEwi4k5slAZHA22?=
 =?us-ascii?Q?fuNqKzOkUCB8pBqDJne8bL/wE0EpGiuAUqmItHC0OIE4O6VF9JIbu6CWP8n1?=
 =?us-ascii?Q?+W2ocfpjcqILCXhXkGzGCljfA4CWYShFiIF/lqDDQpCYvdoaUNKLv+nkY7bg?=
 =?us-ascii?Q?FySxT/3uMw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2bb9cb-a426-454c-95cb-08de590033bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:17:33.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5NEdMqOe2m3RWHmOCOmvrMvACZBGWgAEVYHvSo9Fp3uUKfZNzang1N/6OAGWhNBTuLjOgY1ZuiO1BghKMyyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
X-OriginatorOrg: intel.com

On Wed, Jan 21, 2026 at 03:31:00PM +0100, Peter Zijlstra wrote:
> On Wed, Jan 21, 2026 at 10:27:16PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> > head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
> > commit: 6e530e2e31191d88f692e6c8d3bd245e43416e4f [24/43] debugfs: Make debugfs_cancellation a context lock struct
> > config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212251.RuHvsKd5-lkp@intel.com/config)
> 
> Again, that is:
> 
>  CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y
> 
> Robot folks, could you filter out those configs from the randconfig set?
> At this time, it has no value reporting these.

Sorry for the meaningless report, i will update the bot to disable this config.

> 
