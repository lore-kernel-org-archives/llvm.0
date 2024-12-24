Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2493139D
	for <llvm@lists.linux.dev>; Tue, 24 Dec 2024 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735000174; cv=fail; b=X8rGDPkCLW0JMk9vVyJr3UVKmjS5h6oRwwL37qrTR1+NclrLj+T2ju+SDIuAhuNP3g7K/Z9eC+254Juuzh4/WxDfyIx8G5Iw6Elam6CWOTWNy2+AdoRWAckqzWT7Fg1IIrvINYSxF6AULTFNDp08fb9C8dFYr2AbpFaAALF/dos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735000174; c=relaxed/simple;
	bh=ZwWK8U8LrQ3Il0XRLlv+LGQER+q5Rv2OTCJCQgQj550=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dt9IegA/StyAKxYBdEh2ryiwJmfKwwODlLOjoQiktITpSwqmUCYURVs8NiIcG8vMt/KHGEndz+jnSnKubas5TdhaYOBwPEZ8+dviOUZWSS9ErJkt3KgTBbYokWUpB4nuxzKzq/OtCMsFQ64NJaLDHYWjWVlAxP2A9YXo6OHkpaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CICXI5yN; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CICXI5yN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735000173; x=1766536173;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZwWK8U8LrQ3Il0XRLlv+LGQER+q5Rv2OTCJCQgQj550=;
  b=CICXI5yN6A4MMIQbRh2Bx0V4BnHep4wVlB8bdyk/J51w+HSP6F90Z546
   ZuZK5deOOJSE/JukKuTzmaPvrWD8fPFwZGOtxMcB+MtjVih0XBucaUqSc
   X8Cox9YqK3Zywig8xFF6y9qQ2+bwQDtZeQT8WH2BXcpMdYk5OwyPXNM/w
   KdTBMB8PIG3xIroGiK43IcB0whvjIbLOPnHh5UHNri1eLPICqMgalT8Xy
   I8e4P6Qs4JSUyKgsRqHwGuzXN1Vd1LiZeSCnpSca+sUbJFDTbSk/3bYV6
   LPAp1m8XPk72QhN485vSYcsTvwqxgGgvGqa6edJGcX0/MZpRUVSOaNc0V
   Q==;
X-CSE-ConnectionGUID: X6aL7pTWRueWjTOrsvdCXg==
X-CSE-MsgGUID: cgDByl6lSjiTWt1JqwfmEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39147969"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="39147969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 16:29:32 -0800
X-CSE-ConnectionGUID: y2RCDwvpTset0vpeZFaz9Q==
X-CSE-MsgGUID: entHXTKyQxCr8XcylJZSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99810599"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 16:29:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 16:29:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 16:29:31 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 16:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLuWHOorI4IjJglMt4M77UgSWpbSe18lTXveSA0u/nYUXShQMk5AeWIhJ+wR5HUWx5RH33tpUdIXTT2VAhux2VAJxIvl6Rg/XbR9cT2tehQ6Gfh5o77zwu1Axo8odLmRel5c2qql7AMuZiOrBkJek+k/RLEGbycrJk4y6Rwjm/JzqP96ftjR+LJqZ4fVbIGRBQu0tgkJNuImY9m9ZgLVzQjQZFa5rqU9Gfw/5ey35zvWAjngredsMTaOjTXpuBaZFOkCGtdPptmGwW2hK/BNiieg2sfTdCGegK7LrD+fcJMEJ+Zl0CAF7/ABgRk96liPoM+/x64HyUq8SZGvMY72JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4CzfDR34Tc81IEDhGBLHD+Bm5WQwEA38qF9zuLxiPc=;
 b=NUZqoXz4zo7hCuJhvF4N8S8T26IgFZskCpW5bW586rdU7JWP/xHfj16hzHkfley2s43+E7j7sgbPtEiqJJeX9Uzr2A0tYPGI0nG6Y9HIiUnlTcd6YqYhyUOGBw85aDpzW5/V51lovDO+b2zGGXJ1zBkwnBWCgelUne3qqxvO5BtPeWFGY8b7i4oR2prqQA1xOY4L6nxieZiGI1TME/UK4ejRJSKNGGsRRSD2MgqjmebSuMtYfDh04zpkiJjU9k+AnS1Gr0eAVX1e6WpBHmTajadhGr0hniDRfGGcjUbp4S9p2f6addPF6fRmwzxURzqvb9YrCeI3Q+n+qgcee5Q0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 00:29:06 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 00:29:05 +0000
Date: Tue, 24 Dec 2024 08:28:56 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <lkp@intel.com>, <llvm@lists.linux.dev>, <peterz@infradead.org>,
	<jpoimboe@kernel.org>
Subject: Re: Removing LLVM objtool warning filter
Message-ID: <Z2oASFl6XIkW4fOS@rli9-mobl>
References: <20241220200617.GA936171@ax162>
 <Z2YMxZtiHCV5+w9H@rli9-mobl>
 <20241223213447.GA1188382@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241223213447.GA1188382@ax162>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: d1777735-0266-436f-d2f3-08dd23b1f947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HWbnhS89tHE/FEB3LSSDwAKFUketGXxA0pPFEpuR4PM8jvl6JbqAbLVI/CNw?=
 =?us-ascii?Q?e5C5o6PI9xpY3Gg0GVpsSqo01U1KNsBbVtOAAM5748KWsGt78inIFZDYsUhs?=
 =?us-ascii?Q?QYVakwMkHfP6y6MPNfiyMi22FQAbofEEhJCSS69Q8RyfYVQj2KNJ7aCAbn7V?=
 =?us-ascii?Q?CbLmlljghGy908ZkIQ+fL5w9muv1XNeg1l1mxbmHksqw7v5859Vpy9yAJ6Ya?=
 =?us-ascii?Q?s3wqr7jgrgYqiJt86NpG1tWX+CwETpVJmT49Fij4BgaVRDh0LzGDDXtnQ0Rr?=
 =?us-ascii?Q?VraJRcjfwXAELsq4nUbu3XeYKEI24uh+ww8Ot/pgb//htLHwA3yuho5goJDm?=
 =?us-ascii?Q?/O+mraPIeGtQJMh4/RDSZfVgO4pcPWPAxeFJvNDYklUq514skXSbDgu2zf3a?=
 =?us-ascii?Q?1M7fnBEXMlng2MME2fAT6V3NZp4w86T67HOZlqoYr+2z9pl5RqxFjXPHLaUG?=
 =?us-ascii?Q?4ayv/k3d3S8jr8EsHcUD3lcePk3loX370fjOTCZA+eH4FdcF7jnApOdI78/F?=
 =?us-ascii?Q?X/eb1H5G/AYG15CXppMCs+Ajbwdte5/O4D9p6C/srqiqe/t00YnglD5V7kpd?=
 =?us-ascii?Q?Hca7HHHZn2UN6p3imxawoKV43gV1sLDtE86f9WEt73AB/GTE2UNEymWwZTuo?=
 =?us-ascii?Q?1LvnIRR9DB9VpKwwKTHITrWPDqMyyQ1WeuS72DRelbajwA7DqtfKojVofEPG?=
 =?us-ascii?Q?neEtiPFe7TLAcjoI6dun+Z5QazRCn2yv1pIVTKAm5EZpTwiBYjripPotMF1g?=
 =?us-ascii?Q?b5GI8itY5Tdwv/D0XGFrmVvmZTVYnV7cAidv6dit7JTS+2eogHdTz1TM0TCJ?=
 =?us-ascii?Q?plh02MAKeaPVacsRqX8rQHi3mpFErXoo/SbFTq88T3UR511qCaP8pp8Y1l34?=
 =?us-ascii?Q?3H8ifQbCL3yW2QPFG6gr1RRGnIe/Pe1RI8HHUZPCJXWICxB+RIlC5Zyuml6t?=
 =?us-ascii?Q?jjtX7mpprAs1IzGMDGkQz+ZH6ADEP494SGZ3Wpj9RtR0+hLw0tftGZvtXrea?=
 =?us-ascii?Q?L510kYhfPBkU4MF0fjiesDGxpK1KucgSi89aV8rbTLmeoaUmQzo8NowiyGha?=
 =?us-ascii?Q?pWMwdtW1QrY2NazQJ1YA9LUIU4nDVB9B0l3X+zQ1gYlMRJog+6lqk+H1tOpp?=
 =?us-ascii?Q?N8+tAx+c+56kIBaK6X1kUdsDs68mgjPb82dRKS4qjtjDA+d1an+/ebXU75K1?=
 =?us-ascii?Q?39SICH16cUxrGHEA2X1NXXDuTigZ5WRPntbsdtCNWOvezlivZbAYQ2NulJJr?=
 =?us-ascii?Q?/HeVKcEyBsPKsetcYZk2eJ/V4lv7F/SEvrVy5Cw1MBxhtFRHqHHDlos6wXmq?=
 =?us-ascii?Q?4EuU0C/IOJEWz1DXRncAbhtHZU3KvzSQZtshOPbrsh8Ow46vj1Xg1CBTvVK1?=
 =?us-ascii?Q?EL6hV9ucqswWKK8eFNCM1LEUUzxL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sM6LOJHls8aOzB6bsWzowGVp3koTav0hPCkT9ptor1/lu1E8GKLqRVPq2yV?=
 =?us-ascii?Q?1ezC/MerqrGJsXRgoCDIf8wWoOMyjDVbbzqSoj463MXLL//NAy3gVCtCKlF7?=
 =?us-ascii?Q?T2NVXcn4H2qrtkj8dt+RS9d72A3t8Tn3L2VypQRcNWO4HgGko+npg8pZYVcP?=
 =?us-ascii?Q?HNr1uJPp4EYd2OgY0rytI4vuPdHXpsr/pCiJvl8qrQT6Q2yscd2zP1hvh/xm?=
 =?us-ascii?Q?W1NyVGmxWsXM3tgyCIU37ISmtK+bokWvFcGvl0CR2S4OJ73RkR2wbIogq9OT?=
 =?us-ascii?Q?8ZbN8n0uRZEJtOqmqv22LhIfhL+AkbrtwlqMk0pPiE6XNhzMZyN/ykoXF5AQ?=
 =?us-ascii?Q?VbmYmJkf/CCZYrYaDuCQplkTjr11XCwWNa16ZGwpCNP/cB9uejFoPDhd7poz?=
 =?us-ascii?Q?0eCncm5imuGV6xlYUnJcvclGp5mf2mNjC9m6d4YvPu5agZgUtO6YQI15M3n4?=
 =?us-ascii?Q?g6/UqNP8eRSRzFKn1JQF/pNcIvylBCuOa+VQnnBICpvW9PLrqjqDkLuijH8T?=
 =?us-ascii?Q?fxBRyhZlA8L70jQYkcR/z6nRVOSDPlGozNbZIG9nwVt+dBjJ1vWTzakS/1hq?=
 =?us-ascii?Q?oAawStKu3pJ4lXPtYLHGpjbQuF2A4lgTpUvCdEQ/jeavlvAtQh2q2Ml6m1o2?=
 =?us-ascii?Q?axpGhU+PUbVUHRpzIKPBl6ckU1UjFO29LTMp0vX7qFSP1SBuyAY1ZLUT3+D7?=
 =?us-ascii?Q?MAT9/iPiXnaXe0bVeW9ZzYgvO35Eb5uU6cB3isf09HAjGxCx9vJa8lVZMx+N?=
 =?us-ascii?Q?wjCzeKBtqa0/4FPnz7m3CLXkVxwAZgprUURFZLc5jxS4VokzVHbHLRmXHSIl?=
 =?us-ascii?Q?7i8Mt7wU45Uwo1HdcGBI46jwlsKMhbAqIBPoNZOxe3TL1RbE27IBPSGNbesj?=
 =?us-ascii?Q?nVkNdmUOFu3Jce+/5PYrzbp+lUn6SqwYjQMyIJpIs6VL2+X6KYgpJMOX1twh?=
 =?us-ascii?Q?NSvGRxvKCMMhu1gOfSwZ6uXgaJg1khS1FdKxj6sd6+mCz8WncAPt097zrPkK?=
 =?us-ascii?Q?Ie1LmIdr/y7Mwr7B4e7srqdTvSFfD2KzKwTIC10UiHjsddbGVJC2m+1QHoSp?=
 =?us-ascii?Q?BujDvABJL/ZuxuOD7c5sYqn5Uh7D0DHerldxuL1GVmmvH8V5zs6zogDTQKrx?=
 =?us-ascii?Q?lshrDNPQ9ih+YBXViLtz4o5M/Fw/5HgramLdilrWo4HuQSrOoxyTWaTXygAS?=
 =?us-ascii?Q?OgtUrVZjcEWpTkfIHh6YrA5Kzlp7s3UxW5d8yAkY0r3XLdADdGMLSxb0jb37?=
 =?us-ascii?Q?5n1nZWWgYRGPPnXN3l4hDZUWaDyVnxMW2ssR8HxBFSaJ0XARnMjLbbEUKy+Q?=
 =?us-ascii?Q?kJoVXvU8uVMuvURL00fq+0tkOWuyd577DMLy+ikOM5NNMw7yGDUlPJUqd6pC?=
 =?us-ascii?Q?gqtLX9gF1py4G8OKHxnkVl9IRV17HVggi8rDmaLlQ0nUvFF3fgSMk7egLylo?=
 =?us-ascii?Q?zTVKHO1wP551a56fBZCzPpJldkKFrwoGzek/Ns+uuxzyIVzqerB6/1uobVJ2?=
 =?us-ascii?Q?+KehIeXp+ZKP+9Q7L/o84NLiN523YLsfXOGVNAavzreKFsTWbeQf2pY+NCjd?=
 =?us-ascii?Q?ah8Z0Uvk2lsAo06yztYdye+zaPv9tL5HrMhXSWF0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1777735-0266-436f-d2f3-08dd23b1f947
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 00:29:05.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJs1rELekwCoy2u3PkFOuDdH9XlvYT2kNJ3Nak9kMMA+6C2XphilIPx9z/gI3392HXnygyOx9OehIxi82TGV2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
X-OriginatorOrg: intel.com

On Mon, Dec 23, 2024 at 02:34:47PM -0700, Nathan Chancellor wrote:
> Hi Philip,
> 
> On Sat, Dec 21, 2024 at 08:33:09AM +0800, Philip Li wrote:
> > On Fri, Dec 20, 2024 at 01:06:17PM -0700, Nathan Chancellor wrote:
> > > Hi Philip and other LKP folks,
> > > 
> > > At some point, I believe there was a filter set up so that reports of
> > > objtool warnings that appear in clang builds were sent only to our
> > > mailing list (llvm@lists.linux.dev) for triage. At this point, we
> > > believe it is best to treat those reports like other objtool reports and
> > > send them to the author of the change that introduced the warning with
> > > our list on CC in case people think it is a compiler bug or need further
> > > help understanding what is going on. Is that possible?
> > 
> > Got it Nathan, I will update the bot to send out this warning to author
> > and cc llvm list, same as other warnings from clang.
> 
> Thanks a lot!
> 
> > Just to confirm, is it applied to all clang version or only latest one
> > like clang 19/20?
> 
> Let's do all clang versions and see how noisy it is. If we need to scale
> it back to just the latest, we can definitely do so.

Got it, thanks for confirmation.

> 
> Cheers,
> Nathan
