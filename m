Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071430DEA6;
	Sat,  3 Oct 2026 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038033; cv=fail; b=uwYPYRJKmT7Fv26qmgnZ3JOpDYcZ85EMipBbOzU1vi1qKMTRPhQbUJfT3TO/BJTr1C1nFqWw7kBenBQ4Uy27DEo6IcefCxBZY7frwmXrEG+mhPiKRlkFBDwmZWtdEcc5qX6/M0RTA/Pzt/r6q0OfAqH45lzdKrwNNHOjXAp1p1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038033; c=relaxed/simple;
	bh=4E6tSKxnySD3d7hc8n3vId8xdTxn6sZqvhFUj8L71cc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ISwFDNdsol8AsWeQdIhFoXTd4orvrwqkjzJpl7DCbvquaBCU5NIJirHjZNHpzV1r849jXu5A/ixJUeF/eijAdAmTE3FScEapRj3/k6wsLx2ZVV6+wm3GPryGljnGtv3ZflDQ81LUEtWnG6I/rBcOoH++yYQQLsbKJGTxLoC+6NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iw464Jih; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iw464Jih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038031; x=1822574031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4E6tSKxnySD3d7hc8n3vId8xdTxn6sZqvhFUj8L71cc=;
  b=Iw464JihHjueJfOZ4GMOr4+CUyLaugHps+NjWK5riQR7bmwSxHa+POTE
   CJNKKchbHL50g90aHFF/UGVinDl4DNEoIy1Vf+xFVyNW4/h5YQMbjnCWm
   NdJOqCfiCJvi1IE8DpRK7UOE0COsCWf3HFh+c+hv7N1KCorZPkaXybwwI
   woLNhZHciQybo28YqJglUDgEZ8djU5whcxktUj+e/2mSru/5HrQifcyij
   pwLfzj0y7N3zS2rQP0DCraz55x+znsDpSxCkp1ME/AafqSn0WeDZrGPbK
   5i+E4xXWlR3I+6l4f9qd7JjqYqC8/5qrhycbyLZ39BQd/Yd3RCYu5Mq+v
   Q==;
X-CSE-ConnectionGUID: 2b7fReYoTRGPgnIuz0MsTA==
X-CSE-MsgGUID: JlmvhSqaQz+kVnyoLOsXpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90675218"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90675218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:33:51 -0700
X-CSE-ConnectionGUID: J2N89dRUT+OPk+B0eTmYBw==
X-CSE-MsgGUID: kcE2AyVRShuHrG9nz02Pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="280198408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:33:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:33:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:33:49 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aj0/CBinExJ/6gfwifH98559p4XDUVnNgTSgqs4yjeYso7SBtZzFgEBxZzpkWPHaHdW+TviaNIhTUwcrqQXIVOBFdnUYJMGbXtPoENFfkGXVzrImwksZTQb8lqkAS5XDEEXPUCJH2LEGh3z6y9Pr6yOXa8bjkn8aXgicw9zQptofIMMVlBPy5FeP0JA1j6l7fuYQb7rHhP+NcGrvahAWJHq6IhuxLA6qW1N6Pu999fCiPlVojOjkHtUZwFapu5p+49Y6bT2u7Av22E8n7YJv9z/gQm7R+z7qlhWF3dKUFCTiukCSA/fMIRLA4NC+EzHsltX4pWDhWeSuH0aZWYWNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHucmTud/XXgVRNaTqNsnXmkQo+Zl7WySVmJ9ZZJ+pw=;
 b=EwqLQvLiLuBlSPGpj7IG7qPRTpF0IQgp6gKEnkY2gZZA2PVSqBDxMfSMW8L9r3wLkyhifgbxuUAO+Ko96qpV1ATt12ejF01gYzIwWy/TuBWak995DeJdAWmU0yOQCywDUN6eay8LO71rQW6ATBhZ6ZvkOYRxchdh5AdCOJiVoyqkam1QL4twA2mKKzxGhGgMUDhNC4mC6lJECBmTmpGeXnAPjVmZElyO67WPVnpjzKzgV4ybofq7oppFK6NHJ+Ex1Xi64KRdFPMBNu1CbObq4EbIrrzGfqtw6QBzh4cAvAZkRZUlEY2rxvVzcIFyi0ib4LGDusH1oTkpIZyLuc2M5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:33:47 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:33:47 +0000
Date: Sat, 3 Oct 2026 22:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Robinson <alex@ironrobin.net>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, 0day robot
	<lkp@intel.com>
Subject: drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:6: error: call to
 undeclared function 'irq_get_trigger_type'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <asESRNnrMKbTFCjR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: e04abcd9-0294-418c-5201-08df215b5577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|260925021311599003|10067099003|260925022911599003|260925021911599003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: MV/m0iNa6ORXmcmGentVT4Aix01BuQ2G2/glevlcdrBYMROZ2ANubkJUul0Dww1mR0FbWraEg6+luNbUOZH9/R3L8kus5GqY3T4+w/L2gWC2RhpVCkurrHYNyPKgu5qkWsw9xr5Hui2bj3YGLDp8qkhpMI5aLaW5UJtLAYcVFSgJnwFPrgD2zF7X7amKbQ8XovNOU9jQIEHqNl92/tP+uSXcdEtrT1zj0C4893Eq9XWB6UFJybZEXslGZpaeHjUrfRTLlHf8m/BMH2QP2O9wLMXniyU0GLMnMhNMpmOhFD+EH/FScilmh9RjWn1cj1B6poW/azUImnEr9nol7iMFeczkOzRJwhD8guMoYztjIkd522s3FNbtmdz8pwbavQLbPydogWVb+u9w1BMFoqqgLDuWbjPpHtKvXzQa1NqgXI4x4i249bBKn4Ij8lIJ9j5ik7rAIWiabLJYdyb78vfQZSZEUHzslC3N+HixwEpBUbXH2cvmwu9ifxXppYY9kZq6eKwksOeAMFwu4ilgT7mWfwlchOs89vksl35gv0jtIw7n5gAbo5pXJmP5Qv77oLS33DQnN+CIMhXe8Qky6J8vZrj4OmM0qAFgwU/5Ie+zfdWQcF1Cd/oSR6G7thDjajB6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GU6XGMrzETtjoS0iP1sJlrDfepgZHlTmebDWHhTzOSYPpVFcRU7oAlqEwWk9?=
 =?us-ascii?Q?pnVlcuAqTCKN2BSsNQBKchY9xzlB4k8RFTPrY3i2zzFTyKsibZer/lz4y3Av?=
 =?us-ascii?Q?4ZXMhmKv/LWB+P0mTSZby5FP2JZuP1/26BL3x46GcaCYh23cXCRNLvza8D8y?=
 =?us-ascii?Q?zq5UVEf/ZoPZNXL1C20cXyeeiRZmcaNmgVhE5ZA2Xnh5sRireWn81chKMbNh?=
 =?us-ascii?Q?0fQYP1y1eNg+UXWQvtt38UxdW/MPHzdzzWmM1WsQMw+Z70Qm8oc1atbil1LH?=
 =?us-ascii?Q?aAX82LBYxJjlJZUSxpdLOdRV39cZu4YCq0NoxnLJvsn3Pixy2HhfFIKguFSC?=
 =?us-ascii?Q?W8RU/3pZUrA9pUL8Wn9nHbMEQTxGq1ucTPuYPmG9splTf9OZPe1CAI0tST+3?=
 =?us-ascii?Q?+90NJwWPa8DA5g+fYUykrZhDDZgX2XwDa8JO0mL2BREqb8lYSnuilcPgzR63?=
 =?us-ascii?Q?fw0R52i1Z1IOUZoaVG+CGAfIerDsi6yIHXWXl3zHEvWdWfvaC3w0qQ+wymKH?=
 =?us-ascii?Q?r8Pn7VDmq6Ip4vPtgR0ZA4jaKAkYPXT/XgM1KPuZ+EjTLOJvNvpwQKDwk+HF?=
 =?us-ascii?Q?/IWzQfaqEPoGCPtxarrboCY1VNq4XoAwqgusRelTPkCfo6uXN/y/cE/zwode?=
 =?us-ascii?Q?INJOjZGd9NVwNE2R9z9koE8BYZH2bc/aJ3Lpit1naRbmxfStbKQLvo3Wsxry?=
 =?us-ascii?Q?r1HGJqxDIGNRdh6oF7SPvbH15ny6lfhgnZWREBjtluuXutsQlbLHSdYF9fgh?=
 =?us-ascii?Q?v6tdY7sYsgR1FbmQc4drELzWDZwDNlfFgY1Qi0ePFalxmhzDdM98FnOq2I9P?=
 =?us-ascii?Q?HFtafK3Mz53cLu0KMJiGlnM0ci5oTqDVEhht5vCa1vclfyTcrCK8WAzi3Fga?=
 =?us-ascii?Q?fmSWIXeS7guGOTYDPLFfcRDefdYbBsnd9MRJrehp7PvjiVlHtxvrxQFo5AHU?=
 =?us-ascii?Q?eaRM92hGJoPK+3CPdnCdoSoriNAEm1XoTnE+jJ77F+guFwW0G0XMeIJy7dwd?=
 =?us-ascii?Q?EWHyh46wz61/5zCRhlI1E0Kh4AoSxoi2LAa/TSsZbC+Ga1oT6fPm54g90fP3?=
 =?us-ascii?Q?cZdfi7bxZtJ4D2LfDAwfEBh+2QksDM16VTyw+ewnfAc47BJRd+njoKOaT0AL?=
 =?us-ascii?Q?ktzUtK6jMP32pEyAIqgjG9CRv6il8YLpCgPAfjSEYWvv5EOZBJh7CIGPkcNE?=
 =?us-ascii?Q?3+5wwItl0M+F4CPDrexJVTMKkhY58hU0XwdokHWFq8/amTr+1IPck+yHpTWN?=
 =?us-ascii?Q?Y4DL68FTTemoWbUQPQhBcrc7RX7UqzxtMiPQC4oGUgV5AooIpEPloW5cB7lg?=
 =?us-ascii?Q?N1nd+3jDco8/hefpDBsxEogdtDFbDtjP+4qpJhG5/o9dlxuezP/7iryrzhU5?=
 =?us-ascii?Q?GrLD1aACj2cmFwGEli4nSluLk8+WyMRGBYluZecUQKPI1vkqihHJfvOEKp4i?=
 =?us-ascii?Q?USdji1ubQ4oz96Pep5W9pfjx1aeZ/ix4B0FYuYjItdetNaRgsr6l2aNBz7x3?=
 =?us-ascii?Q?hEMqTjnqkckw/nGaWOJDOjDOLmyEA9bZ2cUyllKlw+1NZoyd93P6Y0rEhjb2?=
 =?us-ascii?Q?GO7Jot1Y3uIO47oDAcjaBcI8zjW4QnsQcS0neWCtm8fomzwD2DqS0jtxgipj?=
 =?us-ascii?Q?3S3DNN42oS9YAp+0DEY2AlIRj1bj3MmUKFr65tMkOwo1QJCeAboOWmL2oQIr?=
 =?us-ascii?Q?bo9neJ4iYa33s58RRWUiGerU/4sQA4NMxDkWbm8xEBNmKIiehxG3V97YSXb9?=
 =?us-ascii?Q?aTw/69Y0/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: r2X6wXaiyD4b5x2wI85WiJSex5wwnVqjTbWt6q1mQwvCoikolhMdFcV0BDROYSwlgFCADnX35foR6WFB5RVKjSacM7s13vV599pMTjn0khQOLpBLS6zgIeOfoymBwt7sSJroydnGtnoYUITAQkd60QodWR8AmJ0NRs6AXT9pTrhCHBllie92BIewGglVWr9+ur6h62Eg1IP93w1/NeKLiVzmr6Xir5fjqzEKdlXS7dz2IrrhfobEEqFQSIpW6CJsQezbublRa07svMZG1DRMFlXpc+k1rdvsbRAjEGf+DUS6jc8M4OpfEiULQtuQ1u4CMoUXFPhZXSVtZQ/nLiyjlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e04abcd9-0294-418c-5201-08df215b5577
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:33:47.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yI5VLVE5oce5xsZzui5bXZ/l9bECH7FH68FA3yBxTYcXXgshkkhG9kMlCZxOHXbdPwWM+BqkUwqaVRgpiop7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Robinson/dt-bindings-embedded-controller-Add-Lenovo-ThinkPad-X13s-EC/20261002-154256
head:   31d99095c99452ff8bd0dc3779fe4bff05f1ca41
commit: f38ab266d6f88b87e52532298f9a17a54bfb1f5b platform: arm64: Add Lenovo ThinkPad X13s EC driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261003/202610031348.b9RoGfPS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031348.b9RoGfPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031348.b9RoGfPS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:6: error: call to undeclared function 'irq_get_trigger_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |         if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
         |             ^
>> drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:43: error: use of undeclared identifier 'IRQ_TYPE_EDGE_FALLING'
     270 |         if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/irq_get_trigger_type +270 drivers/platform/arm64/lenovo-thinkpad-x13s.c

f38ab266d6f88b Alex Robinson 2026-10-02  259  
f38ab266d6f88b Alex Robinson 2026-10-02  260  static int x13s_probe(struct i2c_client *client)
f38ab266d6f88b Alex Robinson 2026-10-02  261  {
f38ab266d6f88b Alex Robinson 2026-10-02  262  	struct device *dev = &client->dev;
f38ab266d6f88b Alex Robinson 2026-10-02  263  	struct x13s_ec *ec;
f38ab266d6f88b Alex Robinson 2026-10-02  264  	int ret;
f38ab266d6f88b Alex Robinson 2026-10-02  265  
f38ab266d6f88b Alex Robinson 2026-10-02  266  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
f38ab266d6f88b Alex Robinson 2026-10-02  267  		return -EOPNOTSUPP;
f38ab266d6f88b Alex Robinson 2026-10-02  268  	if (client->irq <= 0)
f38ab266d6f88b Alex Robinson 2026-10-02  269  		return dev_err_probe(dev, -EINVAL, "Missing event IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02 @270  	if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
f38ab266d6f88b Alex Robinson 2026-10-02  271  		return dev_err_probe(dev, -EINVAL, "Expected falling-edge IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02  272  
f38ab266d6f88b Alex Robinson 2026-10-02  273  	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
f38ab266d6f88b Alex Robinson 2026-10-02  274  	if (!ec)
f38ab266d6f88b Alex Robinson 2026-10-02  275  		return -ENOMEM;
f38ab266d6f88b Alex Robinson 2026-10-02  276  	ec->client = client;
f38ab266d6f88b Alex Robinson 2026-10-02  277  	ret = devm_mutex_init(dev, &ec->lock);
f38ab266d6f88b Alex Robinson 2026-10-02  278  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  279  		return ret;
f38ab266d6f88b Alex Robinson 2026-10-02  280  	i2c_set_clientdata(client, ec);
f38ab266d6f88b Alex Robinson 2026-10-02  281  
f38ab266d6f88b Alex Robinson 2026-10-02  282  	ec->power_state = devm_gpiod_get(dev, "power-state", GPIOD_OUT_HIGH);
f38ab266d6f88b Alex Robinson 2026-10-02  283  	if (IS_ERR(ec->power_state)) {
f38ab266d6f88b Alex Robinson 2026-10-02  284  		return dev_err_probe(dev, PTR_ERR(ec->power_state),
f38ab266d6f88b Alex Robinson 2026-10-02  285  				     "Failed to acquire power-state GPIO high\n");
f38ab266d6f88b Alex Robinson 2026-10-02  286  	}
f38ab266d6f88b Alex Robinson 2026-10-02  287  
f38ab266d6f88b Alex Robinson 2026-10-02  288  	ec->led.name = "platform::kbd_backlight";
f38ab266d6f88b Alex Robinson 2026-10-02  289  	ec->led.max_brightness = 2;
f38ab266d6f88b Alex Robinson 2026-10-02  290  	ec->led.flags = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
f38ab266d6f88b Alex Robinson 2026-10-02  291  	ec->led.brightness_get = x13s_brightness_get;
f38ab266d6f88b Alex Robinson 2026-10-02  292  	ec->led.brightness_set_blocking = x13s_brightness_set;
f38ab266d6f88b Alex Robinson 2026-10-02  293  	ret = devm_led_classdev_register(dev, &ec->led);
f38ab266d6f88b Alex Robinson 2026-10-02  294  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  295  		return dev_err_probe(dev, ret, "Failed to register keyboard backlight\n");
f38ab266d6f88b Alex Robinson 2026-10-02  296  
f38ab266d6f88b Alex Robinson 2026-10-02  297  	/* Devres synchronizes the IRQ before unregistering the LED. */
f38ab266d6f88b Alex Robinson 2026-10-02  298  	ret = devm_request_threaded_irq(dev, client->irq, NULL, x13s_irq,
f38ab266d6f88b Alex Robinson 2026-10-02  299  					IRQF_ONESHOT, dev_name(dev), ec);
f38ab266d6f88b Alex Robinson 2026-10-02  300  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  301  		return dev_err_probe(dev, ret, "Failed to request event IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02  302  
f38ab266d6f88b Alex Robinson 2026-10-02  303  	/*
f38ab266d6f88b Alex Robinson 2026-10-02  304  	 * As on the T14s, disable wakeup by default since selective EC event
f38ab266d6f88b Alex Robinson 2026-10-02  305  	 * masking is not known. Keep runtime IRQ handling enabled.
f38ab266d6f88b Alex Robinson 2026-10-02  306  	 */
f38ab266d6f88b Alex Robinson 2026-10-02  307  	device_wakeup_disable(dev);
f38ab266d6f88b Alex Robinson 2026-10-02  308  
f38ab266d6f88b Alex Robinson 2026-10-02  309  	return 0;
f38ab266d6f88b Alex Robinson 2026-10-02  310  }
f38ab266d6f88b Alex Robinson 2026-10-02  311  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

