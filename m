Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59093CFF65;
	Sun, 23 Aug 2026 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487890; cv=fail; b=h2+6G3F1prDtVXkZ+v3PmE0RJ9o47nwIe6AoUmMVgCwbdoSzD39owYPu/mhYL+3nDnCz9cvjchj7B5LSG92v4iyUhABxTpShJSvwNn76CNlHkNTdZqAvPFIp7I2PGFKpRc2WAPJPd6aQvHBmaQ8fDCZpMFSp6ul9jSoBTDERL6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487890; c=relaxed/simple;
	bh=jGjGfP3N3u8/b4rQF4ovtWwvBAb+oIpf1I/dxD8HCUE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UueTUJW6O0jyO8nV3fIWiYoUFDi7GYcOhGtMSgQITVW4cHXV1LQzqGMb8nsxbo9sJQQHEhX6RM+UA/k/2in2rvHH2L/dcMdEoGIqra6ov4IP/Drh1I8oqVC4RWZ/J3pkdR+3q03uBSj4yvoD7b1vTE70PggTRuGcgiNtv01PHTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZJlXqLo; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZJlXqLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487889; x=1819023889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jGjGfP3N3u8/b4rQF4ovtWwvBAb+oIpf1I/dxD8HCUE=;
  b=iZJlXqLo/yqVgeM3kbzbLiJET7qrAGQB7Ovn4sKkHHIzAYQsZkUN66dq
   L0ntDVIte0nUmLBhz7vXC3VWdODujaLoFRTOTY5Q5zIf111zJS1hcFSQL
   Tq//VF975gt1/WTnA1aQICddrYHuHp25XDoT8kjk+7I07SBWJdZ02Bu5m
   kK+nYSi3RKR9BZ50DnWfMHAOVo0fRbvdLRpEJrNjxXiO/QSDR54OpYkuK
   OOGt9ct+WQnrGnFvmv85vfmbqV0Rru4ZwxYbVgSJP5Q8Cj8xlpRvEZOgA
   WSwPSDsOcyHtXS6t4iD1g9KxQ6G9C1cwLeKRCq48+pi7F/xEfgdCTGJyA
   A==;
X-CSE-ConnectionGUID: L0K4xGAXTfeZZUyKt+0NKA==
X-CSE-MsgGUID: 75kpC5VZTaWji80Ri1yVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974737"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974737"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:48 -0700
X-CSE-ConnectionGUID: 12Kg6eIjT6mBzwAwW41jjg==
X-CSE-MsgGUID: V5Ebsh7IQr2S9shJTpEA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264992955"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:24:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsGG0QCvDlRngjmCzC/KfWJBnIJcACw0QAxyfl8UUhYHwVQ6//ediilF4Y49K9Ub0kSeDl9shG/GNwsSS6CgaBuHRzulWGoDAkWAur5uJVbVkRVKpBCWKs3wLjkTBrF3xQTg3QkOUz3j4RvboDoqCmFlwYLOkndR6pgmYr9P55cirdfBj+TWk5JM736TlVWejq4TP5DIloG1B2k1Ks+5H+qFRb8m6COjnJEK3w94kfXhf5bJ8nj22tnjTIrMZE8/RV6vqkYUHJcn7ScaVSkYLXuu5VGyqmmUwYT7rEFWQhBAjUmNGQ8fkwG4posjv7S55ULBg1tfbjfJkHjhcmwB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEi2v2wTFN1hA6ESB5CYsbXGrY6tSRMkhjupcLY9ziA=;
 b=xguPFxMw/03es7GBNJ/m2ChTerl+MEHkUCEBLYXf1J04k7noXbSDsMGn7oH5fPh4zYzdSMxeBhwq2PFlAKa8sjiwjqVNR6fDhNnKLDbrKCBuSuUb/y5u/vEkqPljkVIe5ggX68EpwSblt1YQ6zv1mpuHVVC9XTNYIF7K0iQW9VZR/Nwby2WugoUtrzrhz6g4CAp+Axwv7zma4iXnkomtfymAZ4Z2MU7jMywrR7ohe9ltYAVQHB5CcabPexR2ud4ryfsY2ZYayAxT54u7Sb5ujpnEA43a3/PiY0B6tVsPwoVCdHRv6SFTwZJbL6Hqwsfg/Ui/ShNFXf0pWW1PP/keLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:24:34 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:24:34 +0000
Date: Sun, 23 Aug 2026 20:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bokun Zhang <Bokun.Zhang@amd.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Alex Deucher
	<alexander.deucher@amd.com>
Subject: [agd5f:ualink 3/183] Warning:
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not
 described in 'vcn_v5_0_2_start_sriov'
Message-ID: <202608230309.4NZgC8qd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 32a7fb9f-f513-43e4-cb74-08df01117d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: LSNbNavjvWjXdS95MLt8n3rtIDKcM8VBtR//xvI2XheIwZ1EAOwu3Ip9HXRNt6BehX/1olItgzyVWg1KjP/QtJPUUneC8GveW9zsvhak2UPfC3hE7fozjI6j7rW3BSGE1T7kbXd0S9DvLOhy3ypy7JMTT2oqZ1yy02dRNONlZzCmSQLR4ic9WhR9ekemS4bNrM4iWmzJqPFnARm2F/V+Tx96ar1gSIdN7aQgvoHmTufzBxLAF0WpKKUif6X5TaFAc4L4g9Saw9XGfE806nhRZnbc57LYF4YXkNOaetOFXrlQB4/rcm74jiNRaCZuEksG8ScqGe2Y/dpKzsFjWkMnfDXakHnBGh5MKz+lEateP9UjlHDRW/n/VDcp/zNAYW4PBE/+g9Ik4WvitvtWfYzYNaIsFFbbeuW2ehkp31M+2/537sHgPPwIoNxrlW7GuvWHq/sfBZsbfqBqS8p/vfjvvDcZJ+4Rdp0CTWQoycP6IvPNk8ll5xIfjlIANpdhQDq50AD/mtNHjF/fX5CMUglI0YmwjT+vjK1N3RzpdoE7ulr3fj/Kgij1UaurR0ETPPO97wgLpr0MHMFL0pvA39zGi1B1BR1sKLNDFfSXiIiLBtBMuySktgBKpsElQtbtYKRs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fAWYLvWfL5IqOtfpaiK8deavkJYTzavLxdSzkp0orRaz9/TZ93Sm6Y46QCc?=
 =?us-ascii?Q?gBGlvvHB3rYAo2byR2qMlfC/EE9tdI8cD5M2JuNT359cv5BjRXk/E9MEAOLO?=
 =?us-ascii?Q?QW6DADPW0icmRjC+wggfA3pXNaFfDaF15GATy2XBrjVt2zCV5wEe/8LQ8bmp?=
 =?us-ascii?Q?hhpNGD73ug94yDF3ZLFt1paayST7vbVjmgaRnwpagVe7wWrQaTKYnxQ0F0Dr?=
 =?us-ascii?Q?aYzjeZ3YVLKYgRBwn2VDIUzEvw3Ky5MR9q57NSScyJQbD5yaS1kH3w22/NnD?=
 =?us-ascii?Q?fi7plOf0YWRZV43VPNGIzv4BGfFk1cbVS4GcwjgT71a7OQXW4/AYarOkJrhk?=
 =?us-ascii?Q?eAPxU13Cb9ZG3vg15wA9Ws6bMLyfnoKriesr4Wt8d8kRIZyz9/oD5PvYl3I/?=
 =?us-ascii?Q?8p9seOfWeXCw9aOy4rECJp4rj5GbiWZh6c02f5L2t2Zm6AXKreVuFkuoQFMB?=
 =?us-ascii?Q?ThVWRgsos+tLrNi9yNMZkkdj0PCBHrq8V7WqotNpqboD8+mrB1FU93Gat92+?=
 =?us-ascii?Q?7wKTIjA7AFDF73Bh4mxQWx6MSC08azOBfnLYbufVEz8vjli7CaF2kR1h6/mc?=
 =?us-ascii?Q?ug+86NtZOaxi4ECH9+sOsp7CtLYMc6rp8DS8Cv8hH6t2kHTNgavoOu362M3F?=
 =?us-ascii?Q?pMdUkrNUHWARJeRdrodoxqKoF/jc6qEKhBgpVU29n09ayidsIlY42Pwn6Xpx?=
 =?us-ascii?Q?rEu09/cgCQ/3HkAOhxUPWiS8ccrA0UG6zWRrGwQM/3MVf9fGqxIFLrcLvZBG?=
 =?us-ascii?Q?KoZPgD1FXo/iBOXz4Xhfw8PmRYIgh6b9xRY/9BCKa9yEGFSNZ+P6xFTOiYyi?=
 =?us-ascii?Q?/d4iAncH5sFSVsgu4YGvkGvw6mvCnqL/+/bYLX8J4f1NRsBHMdhYZbENSluq?=
 =?us-ascii?Q?L9HcbBtClIW6q476sHIX8I3sOHGuZaVZc5w3+ASZcOt0EzlnDyaCWJ6T/cJE?=
 =?us-ascii?Q?F+oiIjGRjh5cgNAqu0Qli6nV+vub9UJH7R4xGMY3smM/hqYCgrBMssupCbyZ?=
 =?us-ascii?Q?vVp/B8W5KYR3FWa6bUuKLf1SlHbwpsiawp6a538y8t6MH9pbfFPsEUl3j8ja?=
 =?us-ascii?Q?3uf9U6kAHQOUCycw0u1ZG4PobiND63iMMSDOa+KFg4it+24AH5U/ONpdxvUi?=
 =?us-ascii?Q?Vqsx6d78crKg4B3PnOiAq9C+j+C0N8adbazfcQzO98j6/Aza6Vb5TCR+7uFk?=
 =?us-ascii?Q?uCYmSQeAC7dCyPe3flXYuByQfDkVjfv2XI1JoNLfxzj6DwjuAP+1Kxub2apo?=
 =?us-ascii?Q?ydwdR3Zxz39TMrvoYZLh7Gt2TnvGMhhNAJJcUdpI9fXizcC7mHBRZ9wwLJvk?=
 =?us-ascii?Q?+idkBTeViqoRFxryC/D1kM+8L+Yfb3TAski1TGh14AYhPjooMBV3FhWZFO6D?=
 =?us-ascii?Q?Ur5tS3Or6SXAMHfCqhcSplkemNqY8dlS3pZsyQGcCeX6lH5TONlaA/SfZy1G?=
 =?us-ascii?Q?+nQvvoub/328a3nEuYPgC63Mo5Ju01ghBgF7/0bDrWe3FG39UePO7mCl5RZP?=
 =?us-ascii?Q?s0bemQpPR7KKi7/Xtn7J2TB3M05MmLrG4mL2W05QdVyisqOpFeXVn7z8OHqN?=
 =?us-ascii?Q?1qvY7stJNiS9C+R2l8bszAK+afP7HWzZegEuKT3rxGmOpGm/EZpGOMlafmun?=
 =?us-ascii?Q?EnTxhTl6V4thubKoMKauEhPVSB2uj5Hp1q/SgL9C5ap6qWXdNHNCEKLjSN7D?=
 =?us-ascii?Q?DQB3qqn5zmaexHCJOewuw2zorjtr5up8+s6I817CrhDPvIVzBTlXo5tw3xFf?=
 =?us-ascii?Q?o0az+uQ+Jw=3D=3D?=
X-Exchange-RoutingPolicyChecked: b2bgItr67GXwMml5QP7ysFK9eACcHDRwz8ASmdXvQKNDAs3ljYTRZZpAnPUj0IL6XyNcusgrbBvGmh6RXx8PXjXwiLH87smqQShvfggxjl2RYIcmh4+/2/VzK45rz2ZQqjyBNxewmj4f9xVcZXxwgSljZQkrSixqKc6+oIttwrX2zQ9wvBb7TbW/Wr1NS3e1jdUQQKb7uZ2LmKfk984N96fs8EvfuOQMaeGaVbUB1QJq5CheaYRnOkiLdCJMc6vhlgKzKT4gHXfYpmSC603EeC5KynX96u7gAct1579SVXqXCADSxVNzAEph4bvNvv4yeoOfDvMcPH1oQ7nujw8u/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a7fb9f-f513-43e4-cb74-08df01117d48
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:24:34.1062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZibkAUDMizSuy54llYYPSAa7cS+zpyRAlBv3QfIIoFEc0X9L8ffatsj8LGN/FOPOcDdPAkRyB0Swl64dXbZ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: 154b35285d82218c30e460db66af48f50c838cf5 [3/183] drm/amdgpu: Add VCN v5.0.2 SRIOV code path
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260823/202608230309.4NZgC8qd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230309.4NZgC8qd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230309.4NZgC8qd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not described in 'vcn_v5_0_2_start_sriov'
>> Warning: drivers/gpu/drm/amd/amdgpu/vcn_v5_0_2.c:713 function parameter 'adev' not described in 'vcn_v5_0_2_start_sriov'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
