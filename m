Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE569126C17;
	Fri, 21 Nov 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729619; cv=fail; b=BczDkYJ75LxB6mim06OdeT+tMYuTqxcgdD9TYvrDexK7D6zrSNFpo0o24g/bBsuP+6y40e6xfNu6KIwD58FwuXwMRY43SZ1vftcYGW5fUddnkdhlr+fmPsUTyYmrEze+5Wrh2QsZEZ0FWcQEgw6Lm9NV02hsPaAeEewDdS+3IFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729619; c=relaxed/simple;
	bh=dcCyAi0kKORA+f+0NsGNTDvjY2ckOIgRtMbbjYG3hzo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g9N8wcYehN4itqqrv3r2J21lQwGNhKc2tcmlUY87Q6Z7pDYhHegCNrFNn9ppdgOjLQ4sCiqoNyAi4gw5XSkfio7Kxukslkz5qstK0jFHGSsIF0E9SakXvvnfnSQPmy3M0PCi5cm8F6TLxUJi+IC0oyuCdI3+qip4OLZslq7CPkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHumwW7q; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHumwW7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763729618; x=1795265618;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dcCyAi0kKORA+f+0NsGNTDvjY2ckOIgRtMbbjYG3hzo=;
  b=KHumwW7qHhrSGluJe0Dm4AUKDJKn5M0NAqL5Bvf04A2IcfML4vGAeMMf
   SMp4G3LtsT1r4IhxpmHXpWz/mvZYsi1FultO12BPKUqLSEb52OHh00MIQ
   KJP179avUUxr2n0mbFlNsgej/tlc+u44hXnSTaKoPESoGwXf0ZXmimm9Y
   cDDWNJzE26lkrL0FLX9A5LTUi3pMIaofoFwSI8/N0dEiaFrspeDf/PumW
   dgR0GYVD9t+5x77MW5Zcku5oBy7o/HuuK8JU28jwB/5fCUYIk7KxRCKdI
   AVHLDsDWh/NqqIg0bm2reBB/yW3+hv+4lqtuiuTFQYZ6r78v7aU9Sz/8c
   A==;
X-CSE-ConnectionGUID: ZwxIBQ/9RxqBIedAGQlmeA==
X-CSE-MsgGUID: ZuEdXEikRTKogjV7idTaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76504422"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="76504422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:53:37 -0800
X-CSE-ConnectionGUID: slqngccJQF+o8pjVDlWsrA==
X-CSE-MsgGUID: csXg2bAoR3WKxbgHY06DqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191367455"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:53:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 04:53:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 04:53:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 04:53:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEhMTSX8ml1RXUXMm4rGcEm0VOtZvyFde1B42zPX5Ourugo/51dNEVYCQ17s3jVwLr77SCL2nWgxlwCnc1q0NJppso+4vSdFbzpU1CA7WNjo6l7WTNlHUvoVb9vvLbxx6Q6ug1Ct4qT7Ltx5R0C0zfQ7D9SUJupXIZOoWEpTaiSLUq9JJW8YFk1UdkFuNNGdAcH3M5gmL/TcAg7vNQiMUQREZ3tP3SKuNuE+AyC3AJxLr4jxsQkGW2jL1tB/U14JncRN4j7EvYCXHsPAyOpGVeNAIyFPGjAYdjOvwkP52tSA+yLGb07RKYYSuwPqsIur0V5DGhcQis8XxJ3PRLGlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsh4VKSiKMN1Gn8RS0wIUOGtNJF81J2L8Ul12/P6CSw=;
 b=YMwQiTlDL3a1TP8tYGvXWH7nwh2f9UZESiL4u9VtJagxotwpEw0VTCsonWKY38AeryPrJgke31ai9AT6AJZYVQGluvjl7N8XC6seT811TUixS1UjcX/bO9Hj5jjjHzFC4iFXsN5XfPivGVXznY93OEy2zhFGJIBLaZadWjq47lZZ1Vuoou7FrkGbe5dz2ZziAhDwtn+Sjmqk0SW+9ZY7vqOYKbFJFpZTpnhP55WfXrmFFxlkBEFc14IOiTypm9GuVxVKsW7XdUxTyun4u6Gh0gDzRnbkBRmBxSa9MW7uWCogbOpQQWCQtevq46wKvHDC1AKWDqKfAKeKPUhyfIwH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 12:53:33 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 12:53:32 +0000
Date: Fri, 21 Nov 2025 20:53:20 +0800
From: Philip Li <philip.li@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
CC: kernel test robot <lkp@intel.com>, Lyude Paul <lyude@redhat.com>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
Message-ID: <aSBgwL9ynO8oASU0@rli9-mobl>
References: <202511210649.lhQnt194-lkp@intel.com>
 <aSAriWs68Hlng-nS@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSAriWs68Hlng-nS@google.com>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f77664-51a7-416a-a8dd-08de28fcf9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sDmX8ZUzDbm5aNSgHMAAcEl1+OM7nUIcD8JT+Q9lJT9kR0O4jxtbIFM2qL7E?=
 =?us-ascii?Q?7MIW3DsSheoNUCdcaLVZKskrx2Id/20r7DD9ke14InpUBaivRYUUZW0ghWcj?=
 =?us-ascii?Q?nyX9bmCCev8eCCyBFlUE3DqtiChE8BVL6fquz03FwXOBZimA4IFndS0HdaXg?=
 =?us-ascii?Q?nIyUWojP2NvfttsSrwQkWfhr5W+kmWm8rDxmadhyDOw8azy3ihoJqM8jMYxX?=
 =?us-ascii?Q?XW0cOvVQ2ZNy+61xA4XAdBM88ZnLgqAji8N/Avf/XrsoC7UN4vbapbWmD6up?=
 =?us-ascii?Q?oiFDsDN4hMNlRF03hX4MIQtBPjx/8rdfQCpDKVhf9/lCj/pLuFOQeDRbtXY/?=
 =?us-ascii?Q?rGNOPySBkQ6XZB7HSIWFVjH+XSpt0R19hSZ+KzUIOTNS6AN4ahxj3WjvgamO?=
 =?us-ascii?Q?DURHgDj+BSXvv7kHRZMVO2U5+GZdfiMyv5VeK4vXR1T0ojcqCNExK5ClK4HM?=
 =?us-ascii?Q?DsS3RmKP5s1V0YdOfpiEFVPwVRV4PglkpHAmuRc8JbYqwxsriUou52/5NFQ9?=
 =?us-ascii?Q?j8USB9R0ZackMgWLmYXvEBaz1Xk/tn4RQRL2Yu/9UlbhHnuOBRexW2lIzoiw?=
 =?us-ascii?Q?qhLX5ecHCFDOf32Tbr/L6ZMH++n6agH7KXiGsd+cRWwB4qTFCzHoZ1YQHVRy?=
 =?us-ascii?Q?HMfED64oqwNWrVenF1EIibGyYqSp1f1Vyts8X8XRFzfmPnbN5iidol5hN4bs?=
 =?us-ascii?Q?GJS5XoyeSpuoFjgCXEcudVb+JaZO5eftVhC+kSg7+lsKGBZ7FM/1ENuzRrci?=
 =?us-ascii?Q?2eREKDBBb2tSDHwEJHbGNNPDIH0SPDxG6eh0j5e0x8w4jLcJJk3X4uf2cuiR?=
 =?us-ascii?Q?Vuqmps3FBuDWbIdJXpoBwmBR522ymW3blzB8R8ZmaV+45VFQhP1qEmtIOtV/?=
 =?us-ascii?Q?fece9NZbtpytmtNOuySdKsMls+VBLHAQ/uvAUwEUFpFif9+Lpuj1C19wmTxd?=
 =?us-ascii?Q?wuSo0hXg1eQAlJ52Df5IAroywyuHSm4vdKhl2qkYjQETZdd2kWJjTzTRAQ+d?=
 =?us-ascii?Q?T3ubY/okFEaXSfKugEMakqAjSwcmJgjWDqWZ7s0d8RSeTC+XAjV6IPCZKrEt?=
 =?us-ascii?Q?Oxg6VZ/C0RDjsQ7PUCoEtmfGwcpblKlyjbxAScVUhFX7Vr/qy/ZYg+HrorZe?=
 =?us-ascii?Q?gQUGgWrpcco7Ms19SvnRAEoFWymAASlNF3flhZroaTJzTdzFyIsDni+3dNAV?=
 =?us-ascii?Q?Iw6tFibRBfoHydgm6+8dY+AqewDO2OuV5JoHI8AAXq7FXwqyJ0Zfcr2E8vuk?=
 =?us-ascii?Q?+8YXKTOTjW/5nTBjD5zSfR5V0ZdD4NgIkQutsREWJNy0mT5L5zAYSqUV/KFD?=
 =?us-ascii?Q?Zo1kgtbQXnKPnUQZBwULY0nu7soQi/Q8fIN9G99PAfo/ZiP5AVOun1HuvdpY?=
 =?us-ascii?Q?jZdlIGr/h4BtgmNnppvsR5yFwdUXBRcQ9Qq3uhCsnbn66KWZEKeXo2nkJy5y?=
 =?us-ascii?Q?9VuiRnLXPrOorBxxL5OUAeUF/lgHPVK6AsFX2nWyiPoClGoCfTMdsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uBb/LsW3a5mtQ2x8g6R6U1xgec5qqvhS9cvqNxNWvWNgdPXbBiCmJ+d9sRPK?=
 =?us-ascii?Q?6lrCMn8PBEpdtLYrYxvN5OSrkGUbUvu+LQ1+CfislYMCFICmG4COUTT4fjFr?=
 =?us-ascii?Q?9gprLeVfMtTCSsdxE/1aLmP/3ja6Z9LgOIiRfeOBbvvtcJCfw+addbANGx3a?=
 =?us-ascii?Q?xxiAuV2x85t37HkYpwq4wpxEjyFCL30a4qVUBxiCkEppXf1lxUnUdVxk2twc?=
 =?us-ascii?Q?i/Cp5uFdMHJpLSrBedibbCDpkiTyLXs8EF2AmMLNxoU/Vs8lECt59Zndfa2k?=
 =?us-ascii?Q?8WVTYvq/CNH1zLy0qKNZpR3ycmterpL+VmF4WfBWu0pSeExCf5yI8C78qNSR?=
 =?us-ascii?Q?WUzxaMwRRy4xsf+cMFp/UEN5B0MawDefNClv9ylMfEWl3j+nLpt1HfAusncb?=
 =?us-ascii?Q?0kEVAhYMSq1o6sSFcYeygAb+lcWa8kUYWaaC0MOTkrq3lE5ru3YbmAGJgAkC?=
 =?us-ascii?Q?gZQ8YL+Crev76871PHxq3mdbEtntc2wUnx9I71ygXEyC/vvPhymXs6U7EC4d?=
 =?us-ascii?Q?g0GlvX1qDG9/AWf2DCgqWsF2wwJEcXs8N8jFw+kgFZkuofww44M0IAi3ACo9?=
 =?us-ascii?Q?H1mit4zkX1TaF0Vv/gEDyPC5bZdRSl7+weaI+EFXmwGJs/CQTKo8SYzKYNjm?=
 =?us-ascii?Q?Yf2TDFsDgNyQrFu82vkj+D7E/vgz/g5r1H9PjdK1GreOpABrT750RFQkrtUI?=
 =?us-ascii?Q?yXwmHBDNl3NYWbnj4ApBrHRYm/HtxrGktadUzESmLHPn+zcx/RLJuBGR85Pp?=
 =?us-ascii?Q?/X8TjhgaIzvUgEK0Tl+fn6ZlY8UX5sNK7w9WibEt9Q99iZJ6rIDj98Dmvj6C?=
 =?us-ascii?Q?Y3aXWfImq37FYr4O20zCJS6MaNl+o34cBnt6D0xqkZt2DyqrsqUaH9BxSM+L?=
 =?us-ascii?Q?pNGOdqpp1u03GVRdW9Dwk8G0rQRwhkpWJd8FEmTr+IH+IwcmLv/01QNGmw+7?=
 =?us-ascii?Q?HHbP0cwD+cjuqPQtZVn7nhXPgnTtoWAUxH2bs46dTf916n2JGvEylkjLIlb6?=
 =?us-ascii?Q?NM+Rb9lG5UPxOhtPK4ra6WlaR8osxQMtqPuSAU3liKsDmeULy8vckV3L2Agq?=
 =?us-ascii?Q?FQmpUZW0y87qJCPAYYaN+cX5G7JdldzIAZCOLRp5IOT7e5J6gxBRUwxqQXeL?=
 =?us-ascii?Q?IUJ6Qggd9I1q2ImsrFgtyC0T+6meDEI5NyzJ+zHdqw9zqYgsgdSTQ9hPyxpv?=
 =?us-ascii?Q?hZAPXb9wpphKlJoY2Si/TnHBxweOl3ktxCj0BHozJ4RJcb5SoUh0xZBaKnSr?=
 =?us-ascii?Q?50Nq8q8Xhh4Smc7+/mXausjN0RuUKZc8qR3Jk4e33Zw9vrrPT0SoKQsv0rHd?=
 =?us-ascii?Q?+CLG46NiEoavfVekmRoY5gDnSVXsDvUtacd6fKM30Tv847TI6DM25OubZ30t?=
 =?us-ascii?Q?3eZIXSKXbtVV1mR9BDGq3flVTX69b9HhgHKQFw0aryeg53By0MqqlOc//4T8?=
 =?us-ascii?Q?ODuzWLhD0+PmfJ4NldF5KoKFNjDep5PkvBwx1kK3SVvkOs64of6NfmddYNr+?=
 =?us-ascii?Q?fthrnS7G6LSG5xXGn2RrLzoxZoRY74nRT1jxyeNIf8Y29x7/B7e0Cx6lVnVm?=
 =?us-ascii?Q?LQHSh6vwxQDNZZIeXdof5knS/y7oddUOHpb4Yk+n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f77664-51a7-416a-a8dd-08de28fcf9ab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:53:32.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0RGDBw4vig381a8ect6Hgk6dDIQLWDT1tQaeq9Gcw2+dBu675kBMbeQh30lN1FibdxsDLdARaoMf7b3HtztjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
X-OriginatorOrg: intel.com

On Fri, Nov 21, 2025 at 09:06:17AM +0000, Alice Ryhl wrote:
> On Fri, Nov 21, 2025 at 06:47:35AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> > commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f [2964/10599] rust: drm/gem: Remove Object.dev
> > config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210649.lhQnt194-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511210649.lhQnt194-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> error[E0609]: no field `dev` on type `drm_gem_object`
> >    --> rust/kernel/drm/gem/mod.rs:231:57
> >    |
> >    231 |         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
> >    |                                                         ^^^ unknown field
> >    |
> >    = note: available field is: `_address`
> 
> I tried reproducing this on commit d3917368ebc5, but I got this error
> instead:
> 
> 	error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
> 	  --> <linux>/rust/kernel/debugfs/traits.rs:12:27
> 	   |
> 	12 |     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
> 	   |                           ^^^^^^^^^ no `AtomicI64` in `sync::atomic`              ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
> 	   |
> 	help: a similar name exists in the module
> 	   |
> 	12 |     AtomicI16, AtomicI32, AtomicI32, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
> 	   |                           ~~~~~~~~~
> 	help: a similar name exists in the module
> 	   |
> 	12 |     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU32,
> 	   |                                                                                   ~~~~~~~~~
> 	
> 	error[E0560]: struct `bindings::drm_gem_object_funcs` has no field named `vmap`
> 	   --> <linux>/rust/kernel/drm/gem/mod.rs:188:9
> 	    |
> 	188 |         vmap: None,
> 	    |         ^^^^ `bindings::drm_gem_object_funcs` does not have this field
> 	    |
> 	    = note: available fields are: `kernel_vmap`
> 	
> 	error: aborting due to 2 previous errors
> 
> This was with ARCH=um SUBARCH=i386 in my make invocation and the
> provided config.
> 
> Perhaps this config is just not working in general?

Sorry that this kconfig reports quite some rust related issues today,
i will avoid sending out these reports directly until there's some
clue whether these issues are false one or not.

> 
> Alice
> 
