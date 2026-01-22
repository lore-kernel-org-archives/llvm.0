Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41A481245;
	Thu, 22 Jan 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096694; cv=fail; b=h0tc+vh1jL6bMEUlBjpjmebcrCHxNTYBYmWNMta6txn4//JOJdVVmGRXXGWRGNJktr6IwuWveeuwD+Y90BertrS2fC6UMNg+MNZK6YeuY3GJ4UMBH6VgUU6JUmKNdyrtQoNl3U9FMvM8I235TF4ThjdrmBhc6KSXNXCp5tyyWtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096694; c=relaxed/simple;
	bh=25EalGryzLsfLAWOyo/lIWttkk7Q0y2v1kalr9nT/kk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fp2u9LOBYJE18Jme4NOqYKTgzopSFECRJoLah2uw70B2NLmZdSAUExWWOVFCSxeAtZRZu8cnISUOCxF8YsG4K0DSSnvmbNOwNY9FFRM1Xdwlj1DIkoh5ixjo2vlwBIUoq6HhK6BwhsIj/HDRVtIzI+2k0bSIZIgJPahDMaDaNow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDWU94J0; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDWU94J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769096689; x=1800632689;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=25EalGryzLsfLAWOyo/lIWttkk7Q0y2v1kalr9nT/kk=;
  b=BDWU94J0Ott6qa1ofjNl9QmqAklDICkI7BciY0F++0GoLMrKSHi7iFds
   I/QUOYr3/1J78ph5etJTZ44C0vv+LeN2e8ay1LkWq7mIBI60E8i8tPpN/
   pB4MQPbd0Ka7tv58vO7CCaRAOtNSUr/6zTdq5IxrxDWEb5nRMoivpa5VI
   6xSL9X2FOif0FpgYAR9ZF52NTSpD4+Z0HZ4hPDXMjpvR+8P03mQPLTyH+
   5CB5Ja2RiAmzDTOTWsOjgiSHI9pOuQsPkCvt/6i110HBhQUjQitnJ6CHe
   iW9vnGTyfhyPQ/p6l/xBKTuEAj2ixIjl8iOqSvMyp2x3OQ2VKdbcxWf2V
   w==;
X-CSE-ConnectionGUID: 1J6AVaaVQTi4IJyWXLjCLA==
X-CSE-MsgGUID: 2iZmx/2YQeu4eyDdQmWv7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81059420"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="81059420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:44:44 -0800
X-CSE-ConnectionGUID: C0AiQHxSSV+o5RqN8yHu9w==
X-CSE-MsgGUID: N4jmf57JTPuzr5okBn712Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206671249"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:44:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 07:44:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 07:44:43 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 07:44:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bufPJnBVEOMimvF6OogE+5OiTHN472lZ4VcpnwyFaIXS1D7QQyMBGRT+LhMqjJbANQls9mXNubUD4ppxAwv5iAFnnEiQRYW/KzHXPmDG3grhbTN8aaG883lzJcN6GUSnbYQd1q9lpL22XOjoJAnRPyjSKSj1Hc845z7TfT0osgbqj4vg2/Jr0Qj02UO0aUA0d3u4p6KX1sb5wagVEsBAGwJpoZE6+E2lgvxTSv1yQR+XyE0KoQHjV4OE5odqpu40FmrqH/XPSc0Fv2OYZG5TCw5n7khH++mvHJXZ7/VTVfdfPcK2RhwTknbfLWJhzpU6v/YG5BjMhjuxB9mfmycvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcIpmFDNZjhAmDU4drQrXDDW4AMzJEqzStWvV/FRW0Q=;
 b=EH62PopzITSI73h65PZEk2Y4iI0pmVIfqZEx18C7gNYNNx1CaGSlZ5XpSLcbJK6NtgNySjkJoNXyBQX/nSFGj532pQVvbui5TyS9+Av9Jt/091TxmTJ6ITS8L2EPzi5K6jNReQmO5SvoBpixHwO9pYl3c/ohnqXgiO5kcLY/OCqWBhXnK9fUQ782/0fdD6oLy7JB1Wnb+GKzBb34+8Puttux+/1tlxGii9radKR1hgZMl2jjYwKsQpVcED54qv5CmK56KiBuDcI9rakrKRzcU630wkOzOt0wnQFqbrnMfkvCBd3QK3fNClG+UkQFk+IrDPSnpalzN1ECj9AyVF/1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 15:44:40 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 15:44:39 +0000
Date: Thu, 22 Jan 2026 23:44:28 +0800
From: Philip Li <philip.li@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of
 cs35l56_set_fw_suffix()
Message-ID: <aXJF3Ew6BJiijI27@rli9-mobl>
References: <20260121132243.1256019-6-rf@opensource.cirrus.com>
 <202601221843.kS9IMZ0E-lkp@intel.com>
 <22b7a6b0-3abc-4e20-837d-da434111970e@opensource.cirrus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <22b7a6b0-3abc-4e20-837d-da434111970e@opensource.cirrus.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 4503aaa0-c110-4617-2da3-08de59cd26fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9G/509674ljSi+Cjd6qoeMUyWOV48C1ZzBjvi9kOrgbIsLQ6T27SoIDyrBXz?=
 =?us-ascii?Q?e5+VD03P0dbJd2c103kyNNup+H5Dl4fgak0qUALf37+7PPCYG5gB3jN775l6?=
 =?us-ascii?Q?/YC0OJNe+/ws4Z1I5B498znY4MNua+NAHI4NCNy33hQuBbuj0Qa4RYHKEyuv?=
 =?us-ascii?Q?2u237XSTBhlTLZjsGHq+xsniTV5rcACvHjBoytETrIGeFXNDSxS5jcwiAVgP?=
 =?us-ascii?Q?K4gdxiZlwG6z3JgqaPPJ4A6ljl7j8ujZ0IttCe4EuSnxjoddn8826yAMz9Gb?=
 =?us-ascii?Q?KkVfmiHdxaCrD02hoiBqSLMJxvTUzv/tOEvrGh4o2XntOA022UXv2hqbt3la?=
 =?us-ascii?Q?RD8oAyPYRoiJW3wYsa0hiWzrDshPXkN+nTIegnMElU9Fsj4aZaYKznP59vq7?=
 =?us-ascii?Q?GNbCglNRgpoAzCd5FRW7YRIeO/fNRAww+Y4UcGRuSumpUTDT4VkxgdA6Wt6F?=
 =?us-ascii?Q?qsYUse77wHqj5iZVp+P4stCPzaIUgXColI7Fmnu+GUNFMobFlgWUQF0lrNGY?=
 =?us-ascii?Q?WAOlZF5J7iE12CNcuGalm6KwfyGWG0oUJk00A+EO2tj9D55J437kzHKN6BJb?=
 =?us-ascii?Q?YZh6PMkbu+xn+5h5dDJVXYh5sjUQmzkq+Sw16kDISJyUIGrKQUbbbb6ocAAB?=
 =?us-ascii?Q?v6n6ZTBQdUiqbgO8ennXnUm4WH96uk+UbIrHjiN3XFJ95Yp2wFtwCmClOFi8?=
 =?us-ascii?Q?Rmf/Ha1mgXVOJ+uWSjqHibn6DsSbxDK0nHcdl/N6YtMTKHOdCZW3TPMKcDtK?=
 =?us-ascii?Q?/Gkm5M4igNbzzobWWRbvr36d0ORiQmZZU2x+CXTGOl8w8EPBwOySceDYlreK?=
 =?us-ascii?Q?FgroXk/FEumj8JJTTDsVL+/hwztI7fCKM9sOVt18Jl3vrR0rG9gnCUfcf4vU?=
 =?us-ascii?Q?0/Os69p1jIuxsZEd0dVOxWz59ozo3447X7vKBkWZd1JRDn8aue0bhe0ItRwl?=
 =?us-ascii?Q?gA4Wsq2N5Mon1bFb0Rs2ucYju0pmfE0JrkQZXqRUjFpZMNhWMfuJuO86Ua0P?=
 =?us-ascii?Q?jjYQyQGpTQorrHBDhIU2sujICu25YOeFKZY74CAM2Ceojt4hAVn2Jyw+h/v/?=
 =?us-ascii?Q?pgs7esjI1DQ6SdB88EOFQr3ZeMKCsW3oHn4Vuq1+8JCpQG+2BWxBieTEDpZk?=
 =?us-ascii?Q?d71ykiCxaiA5MnpCOFRMMHPA5bFGbe6criV6/fCf2kokSgqGC+jtiOR9SlXI?=
 =?us-ascii?Q?JzLItvpp71VTDbXxER8lNyNiF8b4wRFqxZU6Bf5xbO12kpAHlq8idz4mjqc9?=
 =?us-ascii?Q?UjDv8AMvU4P6rOzLH6xuq8P3EJQ9aTQep89X7idwpAfkxWL5ZQfmeeRNdFpp?=
 =?us-ascii?Q?VDQdkR2kPHs+wZsBPG2GlRhdBN5AldZ4lgiv2845e3T3Lb6rZEIHWg2zq+NV?=
 =?us-ascii?Q?z3lj3KErP6Dsik7eQHuivmT8JmHW9bn/UZ+MBkQ/4F4jJHAKMveLhG1YUMLd?=
 =?us-ascii?Q?6ySvxNLnMKEqUkep+tSVE5dPYCRW90t+/6anifmQ+LDw1YyUWSiwIEPT2nTN?=
 =?us-ascii?Q?QITz53/dq9LEidLEnNGn/9sC5WBWvI4V47sHdujUT5p+ES7WQOIiMPSPXFFS?=
 =?us-ascii?Q?5Mhi6EkICNBgv7DCFOQCJd/Ehv84puj8tWy9AtIp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8TFjof7TqPmm83zFyun05itIluMFDg+WUxgkskEDPImGmLymiJ/Oi6BtX/lq?=
 =?us-ascii?Q?zO0S0c/xFATAhH3JM6Ly8BFkEppAFpMEKZPdPPVR9WkFnArnQyXJaXn6lhNE?=
 =?us-ascii?Q?iBiMf8Ign5rnpur16S5Igbbyz5tQjhwCScgV5Aq9u9mnqou07nmp39FGsjSH?=
 =?us-ascii?Q?VUmtM/m/PO1PFAVsIDp/Rm9vCpGd7fdArhh2Tgt+KZ4dmSfD9DpYh0V5BCTE?=
 =?us-ascii?Q?brp1M6SMvIzofdK/O9DVX3Z7boWDJWSo6bucWELTKPDWbGQMtXOlpRj9TBlB?=
 =?us-ascii?Q?jEU23buc/Srhk6ZdMlyElfVLhQHAUdXTPJA8WfWzJb7qReM442QCW2Jeqh07?=
 =?us-ascii?Q?CSvIGGD1hpWDan1Fz/O0o0iXIeIHBM4UiT1dDTrlzh9i0eM6Q9cH+qlGgVi7?=
 =?us-ascii?Q?s+X2HMrlVKHErSEC1kzm04t26ERxVxAwWGM5hFovksqHauI9V2WBpT3ndxb1?=
 =?us-ascii?Q?DV56MB7Jn1VoNrzLFKsbgNN6vB2/RG4Bj0YbuSpzBQd3e436tXkuNqR+L8mq?=
 =?us-ascii?Q?RIdpBmP3QfAJFW2EcuXmDfdI9f7BCWik94ZXVrn7SA2NWBq6iBmkK6jMrHaB?=
 =?us-ascii?Q?zYGbrF6q+HC7HDxoF+Ld+GykWP/2EKROXcLQn6f9X9z39iYnaYY0IjOFFf/6?=
 =?us-ascii?Q?IyLnfLW6/o2Ezr1OSMZEk/4o/LLAH/l8G3mMY6vpNYnXe4I96CJ6b8vMDsBa?=
 =?us-ascii?Q?Avic+2Bv0nLRYvn2g+6YelN6tA0CdOKr13DPj7nYbHBHoov1tHQ0k3+3W19C?=
 =?us-ascii?Q?CgjV69qmFQ/jXp8tBlrOM0433wIReEQPlPc3zEy3DXsk2ParaHjRoAfs6SIy?=
 =?us-ascii?Q?EIN9q9w+ffk9nLDQdbzIx+F1QgacFAMFYlLnYa174YeZR8xDSiuZwU9v2qxR?=
 =?us-ascii?Q?dWA8vuJRaKtuPMkF4FTvL1bniuLEW9nDdgu4fcim1a3K1S1QEjfTq7TQ3R7Z?=
 =?us-ascii?Q?K6W8ex4ZEfnFI3jooHWDf+8FeTv2gPeqCzjQl/xYsGSJjJq5W/qBXu5J7G7f?=
 =?us-ascii?Q?zfpQhEjo25thkt4ZkS6TNeaVMSnhGg01dBadCGv0NxBLr4bFYu1wFKQ1Zyhx?=
 =?us-ascii?Q?tj5Q4kz35S1Gss+PUnso42yRCiAnG2FY0fbqBEvSix0CTMx7u36e/msaC9j9?=
 =?us-ascii?Q?3PFh73byIG3rlnAOl1LPT4XAbtUeNDgLgxwcuNI0sYjJotJwKlMHMojX6ifV?=
 =?us-ascii?Q?TuZ+md2wJtmcOS5AQygXMy/K2K0ZXAfFA4zJq7iCVsAaPUgP8BDj+G1QKqZ+?=
 =?us-ascii?Q?K2iTYy+K4j6A7+Ye+GDneoSheQjMl3+KFMjVuO6OtT67xM6cVpIeDP7+cJDD?=
 =?us-ascii?Q?MLAcFXSAtr/NMOf/0A3Ta7xlQmvfFgXIIfgqwz+N3eE0Vj1IECiVi4G4kkP/?=
 =?us-ascii?Q?bYx0JGpEdkIYDnkY8qBKRaqp6fHH9BD65x6sMecbw0V/AtpQ3xNGmpTfz7oW?=
 =?us-ascii?Q?fG4+DPAiqL6k4m4ljTK2XWDj/yTuQZZAcPAQTBfYXhIKrLpjA4Uk6OyahAob?=
 =?us-ascii?Q?f8yYn1HIdOzSz42gls0SzLQ2epv6pP2vN9VJFf5z5u7XJ26OiXGC2dw30sqD?=
 =?us-ascii?Q?SJKWZ31rN52Lyye7jmAj5WnuFoxLoSyCu2AdLjJUPuVb6rgubGyvc4NaEid/?=
 =?us-ascii?Q?2mx8XKYxw73vL0thXncYoXlWFnUeEwWgmugC3ffHw4ouXebbBnNSPWj4F6l1?=
 =?us-ascii?Q?T1URNG70DRfJk54KyM+XGkC10/WQNefbxjkHo0D4lAzNhUXPSW7zAsFdap+v?=
 =?us-ascii?Q?ZwQF4gVwkA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4503aaa0-c110-4617-2da3-08de59cd26fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:44:39.4188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaGhdJiXEnY4qHg0vO74dpcCdzdwytGlEv6fGsvVGbmzxldwtBa85aMJGdnv6V7ChitZfdnISDhlbze/iJ1W+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com

On Thu, Jan 22, 2026 at 02:56:01PM +0000, Richard Fitzgerald wrote:
> On 22/01/2026 10:25 am, kernel test robot wrote:
> > Hi Richard,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on broonie-sound/for-next]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260121]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Support-Dell-SSIDExV2-UEFI-variable/20260121-220028
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> > patch link:    https://lore.kernel.org/r/20260121132243.1256019-6-rf%40opensource.cirrus.com
> > patch subject: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
> > config: arm64-randconfig-003-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221843.kS9IMZ0E-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > > > WARNING: modpost: module snd-soc-cs35l56-test uses symbol cs35l56_set_fw_suffix from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
> > 
> Please reply to all people on a thread. And as a minimum include people
> who were To: on the original patch email. Otherwise people who matter
> won't see this report.

Sorry about this, it's an issue in the bot that it has a logic to try to
reduce the report number to public for same issue, but the detection is
not reliable. We will disable the logic to let all reports behaves the same
to send to related persons.

> 
