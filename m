Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1D23DE;
	Wed, 22 Jan 2025 01:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509633; cv=fail; b=MywRltwURCp2xMnA6F03Dgv3nhZup+uBd9K88Ip2LycABP/+c0FzERdKEhcJpyTCcJ1jvolUxFN0AUYK3tEUmkTynToIWKTFWxV0ZV6Npm7HFhB2zksvIocLyj9ZdCQHVTvasyxrjSt3mZeB5RE/NzYfglv8z8CpS8egtC00AGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509633; c=relaxed/simple;
	bh=vLkunZe7gyN5aq3+MVtjxf35mon12Mu9l6B6NZq4IMo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bdE8xRMpStmYwwCC1cRyxdnG8rmmWfodtjelhlcs+8KsjhMZ0eFpfQKPhPFUoOQGE2fHbM0kfzM/zW760iYhJOSai1uBzIY8u/BvOz+ewvF5rOVClNH81EYo+sJP2WrFaXldql/SJwqJ/PfxWSLwLBP124Ke0X0Ag6czmbdUdbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrBR1NEi; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrBR1NEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737509632; x=1769045632;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vLkunZe7gyN5aq3+MVtjxf35mon12Mu9l6B6NZq4IMo=;
  b=KrBR1NEioZRKBGzgiiEYl1bbsgKYShG+xq608GlwIKvl9Gmq4i0vvFdE
   dvjEKWEszXHX04Z50nf9isLTtqYQr6vAHE2R+G1E9rudUl9Oh8iR1COtR
   SnoHniKVrz1mCoxJK1F2yeroR7DzOlsurW2Cg5kbQHCq+4HvsRvbUgLjp
   co3caCZAOBWi8bMApNE1kwJswKxddhmoIresoKV7rwYNdYErblsiv09ep
   r2i3YEFmaJ39YKEptedw92llcnaQxlndC9VebnCGgmnwymrvo/ggtlg8I
   KxNUxWiicxA+euht7ZzOwxfs45mQAj9BgrMh5Ok1t9lr/GYefzGfFo9CQ
   g==;
X-CSE-ConnectionGUID: aUz8wEM2QzS2bRUyheEtJw==
X-CSE-MsgGUID: qBzumpIoQ9KPon/LZcyv7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48550532"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="48550532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:33:51 -0800
X-CSE-ConnectionGUID: MSr6AX8sQiyC0rzpgTjFEg==
X-CSE-MsgGUID: Lgm1W2FFQC+osXdIglkW4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107876840"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2025 17:33:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 17:33:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 17:33:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 17:33:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaYUaVkasM434PdbGoeqKUTcCJPwgwYZCvQSXmp2C6weV90TA6VdlMEs7grLk3UteTUEYbyqV7JTfDkAVAW1zE2r1w4Y9Gtu1Tr9W9lMspNleLgMHbWeaBw0boz/5PMfsZTRYQyZScImvabsnjGw6a9WCjvpSmZzPDQgO7aH3fnIkMu0gsuYTBzjw06e8j71VOEmVqp0V7cZkf7goCUbG2a/9tEbqcaBlh1A57wPD7rDZbQ0TQ4K1Fh47+Lg9VafZwgNTu+BSYDTN9+hBYTGG8fYVhqIUV2ZPLfDUMfsMayNbrJ22axEhtKNan5sFBqZj2eunyK9CsF1MIQWqQzh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWYJt/2ccJftbYhbUJMzLl/ohBP3/3R3Dp2bKQ1uJII=;
 b=mrBX99/RX5IMwdHFsbeuGGUiAfb/jK0e0YxII5AF/HAGCfuGJWDeP/RofQ4KXyD2XLN3cwIDXdPlhcKhCrivPAQyjyKKUv9hMKD1snD0Nd8Zs+2i/hmiMQwT28wT3UcukvaAslev561N7q0ARXP28oe6RI3jRIbdL4iZoVPqEbzPBYfNIYrhTZzIArlSjoK04C5AbgdvIi7O4U4JBhvNHhIj+aUKRPxULCjT7NsRu631zYLCTO6pFWND02uN6htQ3oFjtZDWPbGId10vNsMdsjOBLwzuO6E97l8fW5A504uh866rAbvV6l/gQ8bg1ICTWsEda0csb4DbHgkXcKjPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Wed, 22 Jan
 2025 01:33:49 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 01:33:48 +0000
Date: Wed, 22 Jan 2025 09:33:40 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, kernel test robot
	<lkp@intel.com>, Sudeep Holla <sudeep.holla@arm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 9185/10024]
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:59:2: error: write to
 reserved register 'R7'
Message-ID: <Z5BK9DP87L/qGp2q@rli9-mobl>
References: <202501201840.XmpHXpQ4-lkp@intel.com>
 <CA+_ehUysXuqYk_SWs7TFTPPT9Nu5gPEcNU+nspuh6sn+==tj5A@mail.gmail.com>
 <CAPDyKFqrvPr0NXtgfsY1SdVCeEZOghheXnuncN=QzbF_VxftGw@mail.gmail.com>
 <Z45Q9zJ8mvE_ut2R@bogus>
 <CA+_ehUzNMb2sGALem+Y3eDnJVPRTryybKGVja5QmC8u0_KagsA@mail.gmail.com>
 <Z45TSqieqbzufJWS@bogus>
 <CA+_ehUzBBCwaoLRfm+eQ_DC=JwGRGJ_+cn2TeuOtD51Z97ER8A@mail.gmail.com>
 <20250120172802.GA955657@ax162>
 <CA+_ehUw2wxDk=bqYoH0XYGVFzbzndCrd2Uz9BUTmEaLH6zUtWw@mail.gmail.com>
 <20250120180236.GA484463@ax162>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250120180236.GA484463@ax162>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e538095-4816-471e-cbc9-08dd3a84d1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIyepM01FvVTfU0T1GyFZuv9Jze8pbEvAtj/hKmjTjHp+Sp1NUVAmTLaTBvr?=
 =?us-ascii?Q?pLTDY4DbL+dNn9kP95/kOxQtEelVwkwc+y7jOiQVa+g3tIvedEWV5fLtfnQD?=
 =?us-ascii?Q?x/dH8JaCoLgUzGxTMAsVh2LwdKhT75/MGkG4PD9xMW2PipNE93tBmoLbBoS0?=
 =?us-ascii?Q?J4ydXlHcMfgzlh8AHTa3Wrqdk09CkxZ7KH1oZtACxA811v8MZGPSvlfxYp4Q?=
 =?us-ascii?Q?ccYsNt/th6AAeC6IwOE5GZSuDOzGAqP3FSYOinW0B/9CP7hl/v6S+cv7ei4u?=
 =?us-ascii?Q?1tV/FjK75ymTnMJgPZ5xhbL6ksIIuaLaidpuHbs806G1sJkiXwzlPKL2jJoG?=
 =?us-ascii?Q?KVOerI88w/XtXl7MN+Q3fCRhDdXHtC2RSYGSxAigqbtXhM65W3jeet8xQr6P?=
 =?us-ascii?Q?iio+E8l+gAqv5cDJf7544wJvBRxIebmv2qjTt1fssCHD3PdhM8/hQNkxUuK2?=
 =?us-ascii?Q?UDm6Ez1fU7CaCPDJSrqHPrk2UEcuF+Hh47TJg4UttHZ6a2gep/syaekxf7V/?=
 =?us-ascii?Q?97KVBYlFccq0gjO1CxL666UVAuFgw6nif1p6gDcOWwanQauiRedcq8gYH3xg?=
 =?us-ascii?Q?BH5XcffoZkFF6+45KwE78ktAvBBnqAL9k9vrXF9nwgLwVBcds5F09iOtcqmW?=
 =?us-ascii?Q?ti34JrDq1IoldJlejy3guJLylDTOwCYc1dBwNduF6Xe6tslbRXlhflV3lKp+?=
 =?us-ascii?Q?XAxQnsiXRyyqoZl0wIMNNTTvV9GJR8BKHkR1yeQyqagC25LCkY4sr5hoVkSu?=
 =?us-ascii?Q?jMixn+SWUzPpaNZJDdcGEWf2dH+9073sUXox9VD3PaYlephUy+BtGpcHyray?=
 =?us-ascii?Q?2P4NpDwnt8XMKNuZI/8bWZV1IqBDu07OSkpicE+9Z1WRog1Pw4vTHarPxiJs?=
 =?us-ascii?Q?SIAJ/KDBRf5ujlTcZpLou7uV/Qgk+24AK2cXbDD3l9RHryDcaLgCjWdxsDCF?=
 =?us-ascii?Q?2HD61CgPMC8BvAsGJZgd1O8i0NdztPtVBbC4KlC1DWKVeqdiy0FS0Rxm1SdZ?=
 =?us-ascii?Q?zuyrxisd1kUhEZmXuv0DuLOqxWujXdVAHACSBHGzd+WndzePdguWS324c4VA?=
 =?us-ascii?Q?2agZqRiwUVGzZ1Og4fBIqM5n09Eh/AG8EzK/hH+pituvMNFpRTVTx9+T3fh9?=
 =?us-ascii?Q?XiPRi35g/FnOkrC+BgsDCGHUWWKDPc+KUtyJsifHdNBM4KSlzJ+YiMVmZbxi?=
 =?us-ascii?Q?+Z5XXkrBxQY9bGSKi1PzacEXG9uEpDtXvJVtGS2gHYWs8dtSCh7LlbA2nncI?=
 =?us-ascii?Q?OILOo+7MtOsP9f3e+cLaHAKnsVgC3lQf6RW4BeA+h7ClwVshnvNs+9o9yLlf?=
 =?us-ascii?Q?qGCd4P0AV1dLW32/SCfFXDe3ilXfF0GSG9QdGdhWyjimWHnr6lIVbhDnORnO?=
 =?us-ascii?Q?iUpPS6QTMjLFZORi7F4ic602f8Og?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwqaLdV54qtsEdlU8/9guvhcql6uEZOVvsjKVSuvpJCLyP/zFEZA0NiatANB?=
 =?us-ascii?Q?22L+NG+AXeaFEUvYYWDTjJBY3YY9+0cGElmgN1HYoRwv4iYJeqjqCsB4Qlvt?=
 =?us-ascii?Q?wR6JQLIbuWaGplObG5Lj1PQp0LD484jBj6Ox+ac7sctM92OmSBrcQkhO7n9w?=
 =?us-ascii?Q?PdI3nYY++7ECVrGD7FcZnb7+RlnCgyCrRRGs5JcEAZCeDFRFAZkjjHXZURCD?=
 =?us-ascii?Q?UqWWw1xWE4oNc9FqGwmmjz83fc1x8Nvg5PQLO1DlJuf7yKm20svG0sqXNPVv?=
 =?us-ascii?Q?UiAoopPWQRl3LIqoWZIrS9HxiPCgy1sNODsfKusP2UxGYYJ5JTrvsK1DGu9E?=
 =?us-ascii?Q?klyqyaeZXJlmTlKFnlGqgdc2MIm0W8E8q6PvdA/KcqvDvwcz1eNdzi4xW10V?=
 =?us-ascii?Q?1fUHoYfdXsZu9DtL9kGmrkRPvkhqjnCodAjspJRbgvO4c1A33GdxDWWWQgqQ?=
 =?us-ascii?Q?cyI7cdoqeHi19l1DpeBrCofwqWYzy/erLf0GYkZfhVBJAwmnrAo2yFbIxV50?=
 =?us-ascii?Q?gn+ghnmciQRe0bTjKCix9D44kIebs5yvp0juAHCpD18WzXkBDFaA3gG+kiYv?=
 =?us-ascii?Q?IdAKNiWVcq8Yt18gzQxfJW/WmCWS6tLBGvug5ywR+dVM+H6DBOdHu1vzAImL?=
 =?us-ascii?Q?f7E1snNpdByCvbcFqMQo8BW/j4algMkERsipmEq26N4hrZB1SMkKGZSRuok3?=
 =?us-ascii?Q?oNe81hDVHfpibQujNIlsFC2FMi1RkNt15xTjQaFeK0T65SB2k+m7iIx2WAyM?=
 =?us-ascii?Q?3ZtOznlK9V9ahvN97XhvQuUarVwEppe8pEjcCr7JupTd8lRn21muEu/905zD?=
 =?us-ascii?Q?VKWv6s9fTSgKI+vAzvYayOVDA7FlqrJzAwQpcDKFAqnkK6BzsNisc0NKJYsT?=
 =?us-ascii?Q?f879WrL/PI6clM7+FdL6yb86Wi/teYVinTAsnVYhwlA0VfU7A06OwqpoVIJV?=
 =?us-ascii?Q?vkZoAbiQ1MNB3i6JV4S2t1G+tjK+U+YG1Ww5Iu7NbFq6Trneeij6ROnYz7ch?=
 =?us-ascii?Q?rc3psAvNxFQ7mbguzhaBBbqnqc6PHmf2ATW8VToXjGB7k7fpe4IApopwmjEk?=
 =?us-ascii?Q?OTAQFqCVUNcbKK7NRmqeWS2j9FodKwgIka9NY8l5oakr1gEEZcSvnaV4Pldt?=
 =?us-ascii?Q?7pJGpIleq0iv3/CIKSfWBu8YGEzd6Ui54vsHTAGOMYNPWU1TCj1jkGNT+6LU?=
 =?us-ascii?Q?nLMpdc6czZZ+AMiyKnydNhunzKfSgcWCRCjfJMp1eLOhtJqW+OfWujfRLtMe?=
 =?us-ascii?Q?NxB54ufwmnBTmArdo2i3cLq6AeF6pOr39DW9QHVnosgikzQY71LiJZKkAYcN?=
 =?us-ascii?Q?LHszUQRfWPIhG0222ddGdBlqMQgu05lU5cmepFNER0esIp15SxAHeSXfZIRX?=
 =?us-ascii?Q?VmU8fo8EFhfWPyAW4V8SwW5kf4kDxvxaRMp9Oj4ZYx/CjSJLPKfRFe8DJ7z3?=
 =?us-ascii?Q?BPZRX6VCq+4hE7pRhhl7u95LSX5lW24mG9IQhdGttuc8xe8BgGJ0np1yDeF/?=
 =?us-ascii?Q?lr91z9G6okQ4Tkqy9tBpqokkllPBCoJiigjAqeLs05Y3fIz5EfaaxzYY3PT5?=
 =?us-ascii?Q?QFFL8RN0f4/2kyaRfX2XLjCgxCxKdqwyPXST3q8j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e538095-4816-471e-cbc9-08dd3a84d1c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 01:33:48.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mBoRTcDk3LzXUfmoQ41tNDK/twfiO2xzSj3wXilAebL2Nt/2bChdJGAiFaVFhs7LiDN9krClNDzEIzJ1cfhSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
X-OriginatorOrg: intel.com

On Mon, Jan 20, 2025 at 11:02:36AM -0700, Nathan Chancellor wrote:
> On Mon, Jan 20, 2025 at 06:39:10PM +0100, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 20 gen 2025 alle ore 18:28 Nathan Chancellor
> > <nathan@kernel.org> ha scritto:
> > >
> > > On Mon, Jan 20, 2025 at 03:52:09PM +0100, Christian Marangi (Ansuel) wrote:
> > > > If only these test report were easy to report instead of me having to build
> > > > the massive llvm-20 dev version...
> > > >

[...]

> 
> > My main complain is that a lot of times, the repro step reference clang
> > version or also gcc version that are actually not present in the download
> > link making the repro step (and script) not usable.

Apologize for this, we will resolve this to avoid such issue.

> > 
> > Now I can use and try the previous version but given some compilation
> > error happens only on the most recent build tools (due to additional
> > warning and check introduced) It might be hard to repro.
> > 
> > My honest suggestion to make this even more accessible would be
> > to also provide beta release of the build tool. Or at least add some
> > comments in the repro file suggesting also to try with the previous
> > version.
> 
> This sounds like good feedback for the LKP folks. I have my own wrapper

Thanks all for the input, let me add it to our TODO list, before that we
will enhance the repro comments as suggested when the version is failed
for download.

> and processes for reproducing these issues because I do it a lot so I am
> unaware of the potential jagged edges with the reproducers. They are
> usually pretty responsive to requests/reports of problems with their
> stuff in my experience.
> 
> Cheers,
> Nathan
> 
