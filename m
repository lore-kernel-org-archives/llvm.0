Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A21195
	for <llvm@lists.linux.dev>; Sat, 21 Dec 2024 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734741245; cv=fail; b=S6XqGcnBIw16HTKhqPO1BpdplwRBfuPY2KQ6xAvgb44Tk2WX0W1j3IrlC6D5IRoekE96+AsOA0KeRgYlEy4WdLmTZ8SRwEK1WiYuUgkW30vOu/CZ3Jcjs77RWNp6nOg27vf032j3HhFDW9ANJxGm4ZdOw/yHv2IF/j/OeGLsZCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734741245; c=relaxed/simple;
	bh=CMBvXtsyhMvZ7r4Ya//0umaORcZfDsgdIIISJ2sq96k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AaGosUNLkx5T0St4SzTLUAHPdFjkvG2VwJXa56q2KwzP1E+5C+OSGIPCdltWUyUBqr/NS8qcUPp8HFsPPVKuXAijsjKJNLeQhggLc5Wgra1U4S0Pwtmad2G1tnSRWgSuuwyGP6tqGbP/tOtu+XUdYg3evhWM7hgKTljxL9QVO1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxZ2g4g7; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxZ2g4g7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734741243; x=1766277243;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CMBvXtsyhMvZ7r4Ya//0umaORcZfDsgdIIISJ2sq96k=;
  b=TxZ2g4g7WgFM03SZWlUGt8hrcD3jx9z36HMQPjUiJxKG9sTXRTQ2NtvZ
   aEGZpvt+tqvIzv3W14zlL3UD3UMMxBPYBFu0jUne4QeweuT8cEW5ThgRK
   dZ9b/0j2IxfSruksMiEiQK34Lq2dE/65P+2oaTDRNR3RDfMYG5c81Kzs4
   McVGr8b0FDVENOSyl2fMISFIvRb82/tev+8VhSPZe4wlUESNdyJqlF2au
   enzTa0bM7x3ikC6KeLR6NPmYxRN4BTjsqXQ8jjECEN2T5LxmlkrV8NFCc
   MbWVCq/Bv5t+OrvaRugfflHzCJuM+H94yDlVkGqH/M5eskLvxlTSvs4rg
   g==;
X-CSE-ConnectionGUID: 8nAOLi83SUCjmqdCIucBzA==
X-CSE-MsgGUID: gbIcwdsEQIKZaDgFYOvfmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45902828"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="45902828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:34:03 -0800
X-CSE-ConnectionGUID: hNDLXgPZQ86frz5YNI9Nkg==
X-CSE-MsgGUID: 8scnqfhuSGSZwH9TCynEfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98415246"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 16:34:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 16:34:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 16:34:02 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 16:34:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXS2Gaqs8W9ohAyFuD0TXVM2xgUITzCtUeASNb62ifZhySdWrpfxj7qoddcML3XW18ACXdcmroJb4uVJb3sAf3d5YpeHJvxul0jnJysHey6JMEROrXeyfxG4I2N3qpjS4QKtdjuzq5cAjUpGM5wwuIHhBZdM8tX48G6C58BF64ZjGmvFmHkGd4RCJ954iQ4Hn14vHpwks2HLEk5cLvQu+X1ENlNHppxqGDdMiENgCEI58dD88MG4AB40mvF0z4Pss+rHzie2kdu3gzulj5LIWjCyygf8EC9HRp4ce2o22/nNUw/xjKGbGtqVlxlErH24SkYzIfkkQpbcjL7Tht4cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwhKav7vQo/oRAPVi06ZaUAq4qeM/0ogLgSClpQWwq8=;
 b=WdiMnqZzlPKMZDLKvgXdr9UhWRmSwIqSkLFPkXIEC+yvqUCFNHLkjOUpXo3t+O73Kf90y1tgI4QpTfC/UwESgCspnZIkLYkC7Efy+qW7Slg0l2g+qv/cMwzw4Pm1Agvj2kv/E3AFkQTvMdnMARp4l6VNDL9xpQuMSgwXuCsVyKgLbO91SBzsQHoEM/xHDIliRkAUuuyzBvxeCcBKCQfuFUmtzlGmyK0821d1SPtSqQnsTTvX3XpEaXAXKMBSwYQudqSxg2414vsZsdbpclTkQvQSfBiUZmIGjd3+xMQDw8iI9tnMyMQqoHmPG+nmjc4fzN+74tzCXI72WQsxHJECEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Sat, 21 Dec
 2024 00:33:18 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 00:33:18 +0000
Date: Sat, 21 Dec 2024 08:33:09 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <lkp@intel.com>, <llvm@lists.linux.dev>, <peterz@infradead.org>,
	<jpoimboe@kernel.org>
Subject: Re: Removing LLVM objtool warning filter
Message-ID: <Z2YMxZtiHCV5+w9H@rli9-mobl>
References: <20241220200617.GA936171@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220200617.GA936171@ax162>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cb4d9c-29dc-43ae-be0e-08dd215710b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m8qv2QOuNJ0+Et2Ro/HTXKpEEngE1ST6ZuQ3j5hiWFZZn6LAND1g8Qvo4ruD?=
 =?us-ascii?Q?zNFzIjzbJWWgagS8OAjLbrneLJblz1zVKzjvVui3p1kOb/A6GO+VJUe/QF6F?=
 =?us-ascii?Q?w67BxDK7uAe4ksALg5jV8b2mr7sU4wFSIZ8aQ+m8muKYQHz5Jehj4FB1+9de?=
 =?us-ascii?Q?bto9FJCL/YysvdReTCajA3s+T3kbvnXfXrynCBstrEjDIJbpdxEncWrUi+ba?=
 =?us-ascii?Q?4BKX/cE9Ik7PCtadoH8sqIebsHtYJVK8g+JWFG8UYDG/OCY8hYtvCUN3SG36?=
 =?us-ascii?Q?alg8mK7sKQldUsdNWCtVY+9QVOUia6TxzRCaCiG/ffXH9MWRPdshSVUl7r/T?=
 =?us-ascii?Q?wvS0DkF5k9MrzWtuSY/LJaQY9X8RabxB0pG+pwhZimzL74i3SUZt2wgnOAWy?=
 =?us-ascii?Q?kFysp/hN5ZP+n33mIGHocAkdEzffdj8seNQ/ssCx6Ay0H23B+2ZZxp6x6j5a?=
 =?us-ascii?Q?9kdblMKJpBPeDhdSonx5oMElyi/08GM4XRVUyBeAGLwWiKjtyvM3CKRRaXh+?=
 =?us-ascii?Q?AQj5UC3Q4TrSdTk36SQTAhRFwLrqmjJZg1/0b2j+S9KQ5sWa+6lGUe96QJxY?=
 =?us-ascii?Q?2MINC6VcUe4z43bn42Za7RDreMPj1wSEyEXeKWu+rqYrObj5osDFFm/IXH9x?=
 =?us-ascii?Q?BIxFNFT1PC6FDF8ELU0RR/Dtc6KeU3zS5BEyxZrWS8eWb36WE0svctQ84Krw?=
 =?us-ascii?Q?mOb6cJYhE45NXSMIdN9+p/DJmqO9dOrVYOpStYcV0Cql/qjl9a+VQpSD4v8O?=
 =?us-ascii?Q?auzIHj0vcX9DLjYITCExk/rTr2sYQ70a534gTJKG0sGKqnGLOV4dJWrmTfQt?=
 =?us-ascii?Q?/goYx4+SPDqgd9Vq1S47vvuSjMpSkmc9irMa3t+7wTifiIwvImxAm50FLudS?=
 =?us-ascii?Q?PPli99vNe0Fh/IpQo3RP3/zTTQr0d8YJdGoNw4t4zYHmHKCaW9ZdjDjnS/bv?=
 =?us-ascii?Q?Twc2LfvVy8rrjLU7BbK2p0F0xnhZZfZd41dWuzZyB7uT90g+HC64kmUbDiUz?=
 =?us-ascii?Q?aHOryf+tkTzCtcX4Ust8Jk+cyB+0evsh470sdgBT8T08sqri//2xdvhOmWrB?=
 =?us-ascii?Q?sNO9+BoprIWw7NX44w65VwZkbXqa69JdGvKltr+m2f3Ttc0kc+tQdCOut9FF?=
 =?us-ascii?Q?xFneYu7HxxvibcMYN+AWx+TSlxOQFW2xh4vaFES2MPlc4yHrUCbInRurWcwK?=
 =?us-ascii?Q?Q4TvI1mGu8UNGowhQFwQHvUVYPougW9SrcWfjdYh1sWBp0Ho6JE6dQfyT9iH?=
 =?us-ascii?Q?M/IYXWc3aFqZKYXgU8oTlVR3BB+Sh02r4BLyLv690CFZ7loGos7Vs3wg5535?=
 =?us-ascii?Q?DuFnJmeVTRpc1ifFqaIEd9XC604gEvvl26aI0qSweMFu/nbTqWR2lht+xLQV?=
 =?us-ascii?Q?BMCjfdD3KW+kMW9Yul4UTIYwLgsa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mlktJCALCT3P85xFE0nv3Wodl5ApmdpL+d4hHNG1zBWvfA8GzMc8T3WtZSK6?=
 =?us-ascii?Q?NAutzpZAHm2zLk5epyzQo861eqeuZCvo+vGy7iJyWjBDhpbcQWqWee/ihP+F?=
 =?us-ascii?Q?e/Atyv3TH4+XUCrLuWFjkTSG0o7so2XemWvrMV+1MIwKcIFvlPfqePreStws?=
 =?us-ascii?Q?hMea1M2EEhCvTdn5EZml3fI5NV5FISrunMth4S2z+IhXo2/LE9ALaJI6joYd?=
 =?us-ascii?Q?FNeRFE2KXWfRf1aG0DBWLIgoxeQFdBJL4lGO3TFeNVy72o75wwdwSS/8vjJI?=
 =?us-ascii?Q?1kIj9MkF4hUrrir4OlgrgThtjCbSnT3uKL4jF2Y1VKfzixoYV/r3zT4gFn+3?=
 =?us-ascii?Q?WIPbkhOFLqVmKaodcMGMNcLWOUivvOlyBt7wfnzgW2AvgirA6Y2EOA+vBHJC?=
 =?us-ascii?Q?2yz1xQ7IJUQfOFgVUqN3CYVyLpwIBYc4zHWcxCY/SK4CccRYQe70kdWbA0ON?=
 =?us-ascii?Q?TDo/RoDVE86iRf7qMw7gQgt7b1IQ3pv7G4WkWrb7qgD3cO0VADMtC9gVV+P4?=
 =?us-ascii?Q?7ROpoKuIWo+5U8Y3v2vhQFN00CDaIBl1N+xW4Pi7llQM4fj1Om602NAAn8cv?=
 =?us-ascii?Q?f8t9havHhl7iiMG5oNd2luvUzUhaWN8T7hL7cekec7WKB4EaiBgwa3dXtKEG?=
 =?us-ascii?Q?Rl0iEx58UtKhGQw9mwlC1avqGnAX7fhsyLBRIg+aSe99QOtkOOjCCG4dak82?=
 =?us-ascii?Q?xKZFOi9RRoq5QuFboqz7w5xDcP39CUywLnIQtx8CrUE7J59qwQW4Wk35GXiD?=
 =?us-ascii?Q?Fp4uV2hu5Y2Sp5BWHhG8DkUkXFezQrdERHCMZKHr1VJwamVHoNuJnA2hrkf7?=
 =?us-ascii?Q?twkavhGgC8hyrkLF8gdhTGK6/9mXx+VxQGBR67zFFjAO0t20CLvjQmLk+nE8?=
 =?us-ascii?Q?CW/Z70vQBOEAD63bpS6VSQIFis6mJanW1ATmzuuInccll7z1c6Bevx+q8++K?=
 =?us-ascii?Q?P4fNg0NyyGp7eauFtmg9Y6OpMg/i9i3bRCaIl4CFCO2KSPMR+mGtz1ny9LmE?=
 =?us-ascii?Q?vvsyoIyCyve4r37jLcixw75067Ufp9A9VCs+dAZmmPm/lLDjO6V1HLV+N+pQ?=
 =?us-ascii?Q?bjjaE3WyrSdziWLYM7bzafBjxMcd/JsoeDbuZ7/GhRR3FxDTapM8HD/uSCao?=
 =?us-ascii?Q?2i52K2g7RlZS0h5bLEEG7e7lOq01zcLsiiGvtSrSfwgmVbCqpOeU8cYz7BCm?=
 =?us-ascii?Q?AdaGp3NpDyIeqkZ64FsCJJLraYbG0VnX5W6NFVK5XjXexkFI5z+OpfHISxkb?=
 =?us-ascii?Q?9NmzemWKGsN0hYnSBAiHTOFyszNbxI0NOI5Xv+103VkF4zm08QmWyuj1BNq2?=
 =?us-ascii?Q?ygqXLsiv+dhuYfqgIsWRZ7oMb1gh7jKxw10wLrHohketkXPDQ4HedORAwfWk?=
 =?us-ascii?Q?LShXgT1tJlCdNyXO77nuJzyr4REA/aBBUqCyMCX303YIEWJpNfFcIXJ9a4/W?=
 =?us-ascii?Q?zdR68geceYDfWnCY9gpHcmwxifXLObiTMRhWSjzmtW7H3rK885ouJ6vxBGdj?=
 =?us-ascii?Q?IocrT4RxEGFIyKjxA18UbUVOyLf/hiieXTAHYUl2eJqMQNEK5oevCovz3OjU?=
 =?us-ascii?Q?pMQb26AvxVRSByjcKNcNLAHuCrLc0kHYfhKX8tJS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cb4d9c-29dc-43ae-be0e-08dd215710b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 00:33:18.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6jK+HFyFB7zzH65NLqRRA09GYiComxx2DidCvQj4j+7ReVMpEWNwh6Y5x/K4Ynj/pIoTk4UDkttjRPwv+YFAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-OriginatorOrg: intel.com

On Fri, Dec 20, 2024 at 01:06:17PM -0700, Nathan Chancellor wrote:
> Hi Philip and other LKP folks,
> 
> At some point, I believe there was a filter set up so that reports of
> objtool warnings that appear in clang builds were sent only to our
> mailing list (llvm@lists.linux.dev) for triage. At this point, we
> believe it is best to treat those reports like other objtool reports and
> send them to the author of the change that introduced the warning with
> our list on CC in case people think it is a compiler bug or need further
> help understanding what is going on. Is that possible?

Got it Nathan, I will update the bot to send out this warning to author
and cc llvm list, same as other warnings from clang.

Just to confirm, is it applied to all clang version or only latest one
like clang 19/20?

Thanks

> 
> Cheers,
> Nathan
