Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D92AD00;
	Sun, 23 Aug 2026 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487478; cv=fail; b=Z43++cNYhW8kz73lmRR2HGtnj3ZbqdGPtcWfQMN6tHWjWP2xD87RcI+IFJVqJfIdSnB/JuRdpsYr8og/0SP5bQfjENv9K9oDPF/kOFzGSruZmkTMF6wHorqvfPGL11MzCL2JvwqFrd7ApEg6jZg6zVYVyvuejPsQWF63dgrLM2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487478; c=relaxed/simple;
	bh=qoRLjx4wIFyH6JtL5/NO7UxoPmzEXjvwouSQKBanDmI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GV6q2fAuSzp9HBubSWCZtUKjkE3FQVtAzAVmRezupeMXQlWc4HhtOFPSSuJRGVlGV9mU06OcqY/nsv5EF9vdgMZ4cJgl2BpU/FxNyxlIuttl87gK6fh7/owq3kvi1aliQhGIkx5lHAUAx16cjcqMLGrvdEaaje4mJs4OzI59y58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCdQ4fdg; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCdQ4fdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487477; x=1819023477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoRLjx4wIFyH6JtL5/NO7UxoPmzEXjvwouSQKBanDmI=;
  b=FCdQ4fdgHGEoFY7eXQA4eIS5W8Z+z8QApvm9rlJFqjc5/HDW9r/n/kLz
   n10ee9YYNcyzcrEn5Y0mqx8b1IA/9nMGsQF+rPdShV9Yiym2+UCvwjzBj
   yhfI/JjOvfEJTYSXHl1cZnmgzFb4r/mtcfWw5C3L/fT7N3osGPeOJVLJO
   Bb5WTyDk3zWB/RjNFFx5F+zeyA1Hvc1ZUBxB7ppBewCEvHIK0YWPVy14v
   FEcGG5fzdVb7WMUqVa8lrGBULiJxe68FifTAy8L0+U+jM485OUH7VKLws
   5Zqiqm8xIvSTi7GYY3IGHzNiHA+Ht5LoOckdH76bJ5EWWUPnofIUFnqMp
   Q==;
X-CSE-ConnectionGUID: C97lkKDET3qh/+/0p6XEAA==
X-CSE-MsgGUID: kh8gj5+rRDihW4W3N6obTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="110744239"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="110744239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:17:56 -0700
X-CSE-ConnectionGUID: 7s1l/0shTDG6DCk0qZAr2g==
X-CSE-MsgGUID: 2ngsBvFQTf2cMQ0Do6o1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="262491340"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:17:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:17:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:17:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTfiOZ39P3Lx1BUbholHJSrguNaKMV2v6RfBEeIA2oj4MKftSL5HeYhEkFww2FQDgT1YUTwy+BaPjPJLu7k95yiKEQV31LFn1E9APtg2kLuN7kCPKYcNkkB7wZm9F1J2LppE7iv9+3jbPN0JsMsptfZd326d8crZhrUZyQaPoifTyt+gzpemHIJvYFF2N4MA4gufztxQrVAJS0Bd3QWQ7ywg8TVFqX1ijrEon1/vQdz29NyuWvSD7xth0CKEagDF73NHP4U7yC+by304Jz9eCksOUQfA2poB8xjk1W4fjOTOsOYu6YxdhaJ4exd+W64K/wJ44ooIRux/mXtV93ylvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cf3CA8CDQpz3j14tfTybn2HBkPRv+Vq5b0kekL9sm8=;
 b=e/bWUsPdcMicOhWp6T/bAf5KZeZQ8LW/yKQZ8jlOBLJlr3Ap9RrNjFCHiIAVtapeFMjSRd8t16RJzfcisnP9tfPdZxXwfsxgOONsj607iAFg0m87tMMdsKZEzYXMYeUy7M+yZlJqsYghoWCil0VLxTKWgJJ3J8HGDhvNoZRkM87sXAmBKvDVOZ2oRXvogJHlJ1yymKdBMs4QELFaAdUZgQAUBPW/hOGXsOCdtM1RZ2T4OJP+HudZBOgiDLN19llCe8RE92lorVydAjtA6KHxDMBlnzL2JwJubWtSKjd537G86tIq8Bez/LJsGfVVn1PDw2zKU5ftId0ZVuicgoIahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:17:52 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:17:51 +0000
Date: Sun, 23 Aug 2026 20:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Guenter Roeck
	<linux@roeck-us.net>
Subject: [groeck-staging:hwmon 7/14] drivers/hwmon/hwmon.c:789:12: error:
 call to undeclared function 'is_hwmon_device'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608230532.AqzIuJz7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 16554e5b-b4bb-468b-ec5b-08df01108d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: T5bBuGj7oBTTkzepmO+qoWxnghuewc7q46hG6gKHy1jsXnh38HGIhB56o/ml5KYTQ+g33u+QGduWafZfs4bQ6slkjwfAYHs6go5UeI4da+yZkCxDUpaK4JFxoKcBHKei6c7j+K9h1h7s70Tg9rV2+U0XsVexhXavUAl5nUK0+QNdhmKIgZhux/5Nlim9XMz6uzqX1bg5oMYFC3SVdWglNtTMPL9NbPGb70EHEMff7YF23x+svZXAB7TELDxd30TygPiO79AykJbYlgomP/uMPfUNGW6NkYetlSBxfZCp+gqpd4kUEPDVWmPfHkifL0ZgJfOZthpXC70YGTKY+iS1mpsGHXk+DME8E2RSRpE7rwLigXbLOZHUzrJo9Vxasqy8+fkYcq8CkzpWXP5M9cccUMwoxZ3fuhiPMCnONdcX/YxOmorQxZI1hiMYlaLj160ZOCbuAloBi1Emgcqjh5yPeVZHyu2neRh4WSqa2orfBk1Jn8pqKESNcqPX2NfzUobzmTnb6kVxkgh5KrbCaKiDyzDNs1kwDWsJP2HLMo73cgG4e+71lC+UN0c4kx0e86WgBuMC4yyObJYbuhAnnXyFGPy3wuWEhRrAROpyn0teBOqw+Rn6c2q0BSkvr+1hLo3cY0AVHe1TA2gt+QbaMRJ4E5HT3SjBVZpNF0aD3KKZp9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOYam5POcOzZth9bIyR0o0GuA5jzEO1xPl07cMa+mNeA6zYwDa4608fD7jKS?=
 =?us-ascii?Q?YBP7gRUlfeJ5gbX2yM0eLpo+eMlvJvEWOPWdtNfz8boClfofpnGFrxPu/+oo?=
 =?us-ascii?Q?iFUYAzBYOo9CSrGUEO8ljtx5Q2uilLoRRtXAhtnEiDGiUzTLbU0/6ucMoBL/?=
 =?us-ascii?Q?2/pA51wdNdrnhVA2N3e3mzwsiAznclWX+E8z8UPPA2GVaHDIUUVsGjRE2qNu?=
 =?us-ascii?Q?4umpDt/Ry2hFpVdkQAR7jckC8TTbjGuPCLWDRXLt/QLel5KRMiTGHzcUCOOk?=
 =?us-ascii?Q?kmleZNjWJ4aCMjNnEqYIOHReg+U7vgrFrp+Tm1GXXp0sGi7jVEui3QAcEWjq?=
 =?us-ascii?Q?guxS0fMkQnZIO1vreu2+9FgdbbRjVP8Ig2UhF131p5MlxXFsqzjVpZ2urfgC?=
 =?us-ascii?Q?sPCy3hUgh0WHqlhPcd/laiec45oSjQffh6Du1gaoMkCZQOcWp3Rkr96XT+4F?=
 =?us-ascii?Q?chgibLZ9w5bLyPuD7sLZjDKe2phOCzBRih0yr9nQscEZZrhx45Yq5+Xo0HKo?=
 =?us-ascii?Q?CxW5K7feXuKaXUkftPObhRr8QY58qLOUei9Aseg+EWoTBNOakw6c0hV79Yv8?=
 =?us-ascii?Q?x31IX9FtgH0Yfv/iREd4lpCvaNyjAcGzXOn9kCl+OsSgL05fzNkoOFf3RRCG?=
 =?us-ascii?Q?DEUChvmNl+d3AgM+EB3RrE4I6YVwLfcy9PndwIKnvcKbVgXI7lSvLj3b1tEM?=
 =?us-ascii?Q?y5h2gQsrKryyrEMrWO/JX3oYEV1Ta0d3MHQSunVyN6+uMcMUfyLeaSUwnV5t?=
 =?us-ascii?Q?dcjFsVaP5g5CvQjUp4hLX/5DIdHjkjML6BL7eZqV3IQ+XRHlMpHKQhvmAKNl?=
 =?us-ascii?Q?7zh+E8LK5164quaqGy0mT0IcP9J41ODRrhYdWXQypaFFR5l+65L6Pz4kFu6e?=
 =?us-ascii?Q?vQ+FcR0Bsz++Hn3YQJPyr6RbvtSxm/P8rxUBtplfZeApXRP30sPvUJExcpXe?=
 =?us-ascii?Q?8jR9kK+JtpruvDL0i2a4u1t46TmYFbVDJb6j8C4elEq/1QyGADPSQI0nKiiW?=
 =?us-ascii?Q?T+Az/12YqNjzctKeOZdJHgu8faB0VTCgiEUfFEMYg6b3T8b5GVlyNid1JexP?=
 =?us-ascii?Q?QhuhgkaXtqoCQQIRqJzMGHC+exGGK8PP5PyWJlvEnq3wcRmD5vlIK7UOkqso?=
 =?us-ascii?Q?fgznluziBY5vq8JRtJgzqQmrS5EZDVVAkSv9RqUeg9DBqwHY4N6NN57YJhZF?=
 =?us-ascii?Q?Jj+TVayZufcG/O9Zh1G2gKYBwii8DNeYHI3QadzI+PXiuKXWZ0UZJ3Bvpi1W?=
 =?us-ascii?Q?8x3LFfC2OoBcB24g6mxmk1ihPA2YTstYcxgNAcaR3MHT4yf1MrAc68rhDVOQ?=
 =?us-ascii?Q?HtVzA4BmXRvrvFQWOw6F7mO6PExytZEH9ftvOjtSw5Q/GfXlP2ltiB7kGOji?=
 =?us-ascii?Q?l2/mRlkTdX6vJ7WRIQaMrf+wU7cJ8ffiqGgOJgsIzHd+ZgfjusM6SspOMirZ?=
 =?us-ascii?Q?Ec3FC8dfCyAnWfJV2pLfbxFPyvueVKBaO30eDQNurkmz/gYGQiEb1N+nXxJd?=
 =?us-ascii?Q?fOUqLcxRJ39Nif5eqoi8wBqXbLymace+dGkXaKJ/u8QA2I68U8EsXiB9a2Ts?=
 =?us-ascii?Q?TEHfqokfaHvQ9j7j31vlBV8rc43OuTuIi7qVxMS9/h8EiC7HQeX2yP4V6xC6?=
 =?us-ascii?Q?Fo2NEVqV1AScsO/yiGN+LGyXu2NQ0hTGXo/S0Eg+92JtutiR5ku16W+bTrMn?=
 =?us-ascii?Q?IOiyN4J9EbnjFSe6lARzaqenBsjIFjNQsMfB9l1U2i3lfDj+YcLnZAe9LRgH?=
 =?us-ascii?Q?FAaBQRb26A=3D=3D?=
X-Exchange-RoutingPolicyChecked: B8460yIquDey+ltsQZsBjufK6dfr97C2jY0+s1RewufoEJ5//LFalDc8zWSOji/J53S+jYPlX3MTBJVs7iC8ottail+L5xfqD8Gqv1HWFJ0959aeR/czFvvgdp31lEJNVxJi1MZBxd4/1lIR+cB64A5Gn2z6eXZiRissbrFHy2SEA+erOzV1WaPsO7iDbKaj3XcT6N2ujMF1PzLFFIhArCV4YIewxBRGiEBOzLXJHAHiN1nzmJR9yz5DA1Rg2/nUhK2LJTgBoiODAzBnQSWQ9oAP9a24KBP1XcIDNqQRwkWDEdsllplnYiV33+7doodUNZ1gZwpwqXJFhjIpCjBh6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16554e5b-b4bb-468b-ec5b-08df01108d79
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:17:51.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyK4OS23VdiqUouNgCU568atXBA4/v7PgEp076TrMgKPqIegsRAei9eE+tEpXh2imBpmUrqmFgRekqN1XkJimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
head:   ece58c6620869b5d7f0e1305370df473367c085d
commit: b6868a406c5b0bde10303f596fa95010ad68a456 [7/14] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
config: arm64-randconfig-003-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230532.AqzIuJz7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230532.AqzIuJz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230532.AqzIuJz7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/hwmon.c:789:12: error: call to undeclared function 'is_hwmon_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     789 |         if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
         |                   ^
   1 error generated.


vim +/is_hwmon_device +789 drivers/hwmon/hwmon.c

   778	
   779	int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
   780			       u32 attr, int channel)
   781	{
   782		char event[MAX_SYSFS_ATTR_NAME_LENGTH + 5];
   783		char sattr[MAX_SYSFS_ATTR_NAME_LENGTH];
   784		char *envp[] = { event, NULL };
   785		const char * const *templates;
   786		const char *template;
   787		int base;
   788	
 > 789		if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
   790			 dev_name(dev)))
   791			return -EINVAL;
   792		if (type >= ARRAY_SIZE(__templates))
   793			return -EINVAL;
   794		if (attr >= __templates_size[type])
   795			return -EINVAL;
   796	
   797		templates = __templates[type];
   798		template = templates[attr];
   799	
   800		base = hwmon_attr_base(type);
   801	
   802		scnprintf(sattr, MAX_SYSFS_ATTR_NAME_LENGTH, template, base + channel);
   803		scnprintf(event, sizeof(event), "NAME=%s", sattr);
   804		sysfs_notify(&dev->kobj, NULL, sattr);
   805		kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
   806	
   807		if (type == hwmon_temp)
   808			hwmon_thermal_notify(dev, channel);
   809	
   810		return 0;
   811	}
   812	EXPORT_SYMBOL_GPL(hwmon_notify_event);
   813	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
