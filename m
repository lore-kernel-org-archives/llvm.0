Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065F292938;
	Thu, 11 Dec 2025 02:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418765; cv=fail; b=GnvA99pMAvooomF/ZfEdxcstsQtn47MemWwhBTXnI7VAfBsMfyPKi0Xl4IhVME2NhxACvgyOVIDb7G2SQ3Q4OHJG0gNal31TYg/Qbn2ppuFTaKiq2ZMXaWLV1IytEJfRWoyZLBCYcWpSd4fvKgQRUPQyMIyDke10cfgbA0Ln5ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418765; c=relaxed/simple;
	bh=GtMDstRaPgGKnAEovJdkwWigrPjpX8qDF0h41smYe0A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YVhiOGMLPzV2vOh+lGUZBEPCchdZYKLqqZQaELIAxVvDLkPMm8mVzSMpl57ZI1YcA+nDvPamh+jeMDmFD9qhCLbBk2jGy1g1l5Y9O9E1+Xs9kSgDTYlK5cqBY5aeLRpZ56EArYPbOow6gYfbEn+n8UCt1cPW3jLEa+twIKk8Rec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7g6RdB2; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7g6RdB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765418764; x=1796954764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtMDstRaPgGKnAEovJdkwWigrPjpX8qDF0h41smYe0A=;
  b=k7g6RdB2cuTTi+eSIXOkgdPYyBFmoGuzuU420F31TcFSoN0S6w73q+k8
   RnPJK3b/xhj54mKKwrUXVEimgwtmuhUeAYSoCo/k/h2KJZ2iS5Ed75fx7
   en3WrCI96sVtaIS5/G0ZEjrNwSCiVu0onWQLuHiN6ewu5EQhjtrgaD7nN
   xd4XdmauqigyTdfIR4tOUsi0ySrh+glk1moc2KunoloZNBg+0CarPVrqI
   M1DcrkSK74jc6ZcYyXVvBNybgIIBKam88a5QW7uexLIyNajuPh54/ir2/
   EHawaG6vT93TS9fJ/XXxEUJGjlhboYV4opHZRh92WbrXVOTnWudvOBxZk
   Q==;
X-CSE-ConnectionGUID: /50WwzMBQVyrY7fAB6NnLw==
X-CSE-MsgGUID: ksSC3K3jTRqkytm2XXPXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92876319"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92876319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:06:04 -0800
X-CSE-ConnectionGUID: sn/efoqZQ+6wvQZHvj4Imw==
X-CSE-MsgGUID: e/zW7h5HR4iiA+EAYfYnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220015708"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:06:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 18:06:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 18:06:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 18:06:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2oB0PGh5aDnw9ER2WAHphUs3aBEBdt9+C/YuifMBmiLpoPmgBKitrcLCGn1zyHPDu1NnQXCqkphRfQFtqjpwWWEn2MlulnfBmZBygR9jl0DCiSx1jkWJfH9CMeHPArJxK9lNGB379xlREOLiSmZL9tb6ahCZtsUezil+zQbnzk/EoW0OLCOa/YJu9KUFMpP5kPfNnWHT4XRTjrIMQcLQ9pLmngnbrU2wpEXMK1Yxukhhzvq/R/lKoDcz06DLwattdpW/czlEosZrXEtQK9mzQA+SavAJ69PJVi7Ran9ZCnd1u0CF4J4VOtRVcAS1XWbxlxJeFMTXaglWoVisBNZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cukTHQVr6pFUK5qTBSorxuQV+gViU3ElWcOH5X2cKAI=;
 b=iC9vBD30SirfIWmBqbkbi6vZpRUYOgVq96BPAovpUMOXRW1gD8rWkk+uYeY75Oj14Vh+4Exzct1l3aGuH7YdDPUg9Y5zlfwMpGzMqI7JC8N6pzI1XDnRFL3KHLrSZQSRl6BpwEyqUpz1V3Qdfh366QOtnBSdPhLH8LcpdpltYNdH3nEahCnShPH9IPfSrVRlm41NzRPKiTizHE1/7ueli4DG7Mtp8plsS+dnVNtYm3Fdz8mq+pB5Hfjfo4tLSocKBHucU1qDBW6I9dwXjeUIwjV+Beq0C0fJ6au+6i3SFHXYS2jpQlVkFCnr7F6HMc6BGkPKdRCJwl55rUUVZyN7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 02:05:57 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 02:05:57 +0000
Date: Thu, 11 Dec 2025 10:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Adrien Ricciardi
	<aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 12/24]
 arch/riscv/kernel/qos/qos_resctrl.c:296:9: error: call to undeclared
 function 'ioread64'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <aTom/MCV4kEa3TsX@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 832cabd1-e332-45a4-6df8-08de3859d2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bMe4IP1PVEazMGtufW45/nmyvfuOgt77eaoyDKvEKuf9RgVPMv5oUPCpKa2m?=
 =?us-ascii?Q?2dROnpC2/iqxKmfnoQPes/jNdxoyxiTin9+lV67lbSp16LnnAHiJsZpEJ9os?=
 =?us-ascii?Q?n+joC5WZBfLFq/sYS5pjLPQ9TUkvC7BspY2NGcTpC404RDv0Kj4dVmJlv9er?=
 =?us-ascii?Q?cKxuVrCJiXocoe3yUqSUBlYLO/7PJHl7IKItXvbdA5lOgZVI9mmboa0jjE0D?=
 =?us-ascii?Q?cgCmkK/Ml5ERnzjyjjeZx1J6pGPAo7aNYdZIfiQET8VoZFdNucK9ROu0Bday?=
 =?us-ascii?Q?feV84qD8gqlT3RQOWJBF+IY/yUD9pVSEt42QpDvyT6rDgfzyJRXBefAaKO89?=
 =?us-ascii?Q?y4JHrI0KWmHUAiZyVe0uJ6qFMsFenftePQyfvMV8YPJnMuD7AUmGXQrBgm2F?=
 =?us-ascii?Q?mECfaZXWSUKXD+LIRsLI+qnia9MnPJV03tcILCsCsXpHMh8CxYB/hWp0xekr?=
 =?us-ascii?Q?IbY6u+sf0/IPgYN8LlV/wEhYazT85ec6U0CzXPEpJLCvw1IU0IjSwoumWGIH?=
 =?us-ascii?Q?y4xuXKQuSh4o7ce3fNibDOueq9CsrTFgFX9L8FbTKAY/J+fP3HaoKD7LLI5z?=
 =?us-ascii?Q?XWWJKbMnq8LAiQFf4cj+Exc0qiICojcaAFgOmzJmKA3ImldN7xgrWp6IIw8y?=
 =?us-ascii?Q?jrskxNIJYFrSstjvToQNF1Y95g8rxKIBuVdEI97A3yP5/W7piDSV6ophxLV8?=
 =?us-ascii?Q?7V5iYTD0F0Vt6TETledPlvIRGpcHE2gfU8Lx+VSrnLNPEgnShMO1o3MBz32s?=
 =?us-ascii?Q?qzpN4v/Fm00DJBBOLXT+itZpKCFYAgHUmwN7EAwIaPgJig5A0MnPmPeWO15H?=
 =?us-ascii?Q?Daq1KFgbTzDZYiUg3t8DRMynuCD8hZxf61qPwh6hemv6RthN+4xD24+0OvzO?=
 =?us-ascii?Q?oQ8Nzd2GSz8aVDFpZ08eldlhasWNwnLlwGedY5lM46mx+BGoQoilECTtIeB/?=
 =?us-ascii?Q?JX1x7rRrtqbLf5EMFj0bg8ZSJfz/QeeGLiRU23+JbRpfTQYV9wTdE0zXukxc?=
 =?us-ascii?Q?g5PwCLrHu8W90o7P5JvIjajaTDbstJ9Ur4mY2f9zHXWfU3aEXVBlQKO7Vm+o?=
 =?us-ascii?Q?z0hydrQzCpi/DXcRT1qbcMVZPYUVJQ0zeOvxgra5FpxxssCRxTjqWcTotpKf?=
 =?us-ascii?Q?5mevxvLEXy4X4L1t2FF26vAQ88SFgi/JE7v7S9ikITPgA60Q5ENyG1C2caue?=
 =?us-ascii?Q?rNF3oEetlSgcATp+5+qdgRvZoD8yPpMYveCtpU2Jac53ymJnXJJLMD+mHiVh?=
 =?us-ascii?Q?kJZx7hGaU/QrnshN7ANjLWMF+r/RDSLxXLzso/OaX28GFAFaCOwpfs0uQUNm?=
 =?us-ascii?Q?f+/xcVAmYevyWpAdfSkK1kq9+5ZF9DfHENRDrbcUJiXllITmvebfc3yJHRdg?=
 =?us-ascii?Q?dybduxLGIZbh871rPC+LIm9JRAzfjgtrPC+kGrgYwEMNFBhsfFkRP3BJqBlQ?=
 =?us-ascii?Q?DCT3LX92H0o2J/lEDgiI6H5PKm6evK6NDilZy12flaPtOFKUW1wesg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7PykvLdSXN3jfz+lHnCHSyuc0mEkrORYJRBfEj0zolB2MpySwqRxS/QDNwJ?=
 =?us-ascii?Q?wmddjK1l/1y57pez5bfaee/ziCCADwW/d93frjQiNSJFUd5XMVDyufAbrzM+?=
 =?us-ascii?Q?9mwQQ3gERchQK7o5HjaNmrLYPmDfvuYxtUP3wxHBcIrKihApw/TQ+onoO1jV?=
 =?us-ascii?Q?mjrjMXRuGuyVZn+kzY4VYRe6nULNI/WvzvSsysi8foeIYAgjU1KmuN6ERXWM?=
 =?us-ascii?Q?6VLekuKwQGe/eyXk6iuiLKL31URNekdtIZm+7vtk5jGi6TOC2IFGJmwzEq8A?=
 =?us-ascii?Q?Z5HFo3y2P9CSAzxxnKuGcHqCPtysIAdvcRtt0Bt+WkCKC/Bv6X0jjz6xUKKp?=
 =?us-ascii?Q?ZCNbsf06tRK/yhc3jQQlWXEc8pDeGt9JzMr6gOh4ZaWairhXS1L2C+m1rrtx?=
 =?us-ascii?Q?Av5q+W4+GjVR1HSIX3/CC+leg+kwy3RyKoE9BdjA4yyyhE8a3fs52/OhupE9?=
 =?us-ascii?Q?cUaYJJwsd+GNyycOJvhrgXNlveV7NHNwAR6PLu73+Q7dnldKJ/AiovMgJsV/?=
 =?us-ascii?Q?I0vXn1oCrgsATF1kAZSNlQoq2Afibf3JlE2rD3iEaB6bFZfs/J/uFT+ATWKd?=
 =?us-ascii?Q?3bXXUjqLBIL9kjtCG7XCzaa3MAyp6a3I3CmZTSIeqpYJdy/ztYQUrsaOMweP?=
 =?us-ascii?Q?KdQi7qT669WLIYtdi2N4S5BxAhnRAIYdc1gnGS7qcOXFiHjh9H4wwhKG1H+1?=
 =?us-ascii?Q?jjz5fl3a+GHv+0SIbZR+GTBc81wCUPJw3XB9UxNOSrNLt6PUsx2JJ5rlnxZT?=
 =?us-ascii?Q?e7PhOAa3AWTQW4gPofa7NwcDS84NInHndqvU8Nh6SI/iJX//GVDIkjSNNBQR?=
 =?us-ascii?Q?kNvZK5vCyBksDJBuQsGWhNuXLPMKzjeW7DXC8Wtk7Kb95TaaxnA9qBSUP7sN?=
 =?us-ascii?Q?+J7GdHe43YeyObS6ceJ6Cg8S+IMxT1dVFeSwWC8g7qyFsoxEk9HBCXSDU6Dk?=
 =?us-ascii?Q?2os53QfPd6Fv7+VJKjkdU3lb9xn/RkQa0368aAAaNOOaxyVYsZLKsrxqflij?=
 =?us-ascii?Q?5+Ar0NJwGmeOi+iiGs5/5AUPkYZM4jhlxna1uIXr64+ULPJLe1mElvMehDI5?=
 =?us-ascii?Q?iPskMC9En6+ksMPVN/bz+nIV4a72GnDRX5Vcqry7SiwNWUgaajL5p1yqef9a?=
 =?us-ascii?Q?TAJuVWabNBvNZmn4f6NBV8BWCudVYcylFOY7D4Jt/DIqt7U5lZRdPtqTqPFa?=
 =?us-ascii?Q?xUIXrU+zcpkm9wITw44xdCu73OAWyawURkLFhFg0reQ6+g6BrgUbgPiKmjlu?=
 =?us-ascii?Q?+wCD4zC2UmC0KZtkiJq0L0ZR/ptMfuE6msitd3E1FsC7xbgL1X/WRE4zPJ27?=
 =?us-ascii?Q?vIrAk01Uly6Tc6ZlGtXLTicNua4CDB8WwROXAP9cm35PhksdOUCXIN1eMMU8?=
 =?us-ascii?Q?xVX2rJvAMWKlQH6ae2u9sdajV9BiA5IpxE/KmyikE7dyYzZ+pxS+bhoMhtvk?=
 =?us-ascii?Q?gTq3NflloySA5nyvZ8K92CUizBb1zJ1L5WpfM5CfKzlaZ9WjhFQnNuhWd5Tb?=
 =?us-ascii?Q?PlB10XR/Dt3rGcnh7fezmAFo6stAZ4L+PuwfDEixldp0mDoI12qEOeBKtzW4?=
 =?us-ascii?Q?dOAQHP0t3eN4Via0+a0jpKTBBjAr9xVujC3to/dqcY3zBaPGfQmho8XV17pH?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 832cabd1-e332-45a4-6df8-08de3859d2cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:05:57.6418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aczjfLGNNQSLnFoRHROvJ1PZ8jKy1Gp9dfnbEegOjcyfsNHulT4PLXrD9kdM3Q/aGQQUo7AUX4Zf0K4F46mUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
X-OriginatorOrg: intel.com

Hi Drew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   9cef75501dd0366444c60c3ca47bf75270f2160a
commit: b3bca12466ffbbabc21d40cf1713b1e88dcfef64 [12/24] RISC-V: QoS: add to build when CONFIG_RISCV_ISA_SSQOSID set
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-001-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110615.SGIChFQT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110615.SGIChFQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512110615.SGIChFQT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/qos/qos_resctrl.c:296:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
>> arch/riscv/kernel/qos/qos_resctrl.c:299:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:311:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:313:3: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     313 |                 iowrite64(reg, ctrl->base + reg_offset);
         |                 ^
   arch/riscv/kernel/qos/qos_resctrl.c:323:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     323 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:337:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:356:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:386:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:411:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     411 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:418:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     418 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:522:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     522 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:612:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     612 |                 reg = ioread64(ctrl->base + reg_offset);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:648:8: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     648 |         reg = ioread64(ctrl->base + reg_offset);
         |               ^
   arch/riscv/kernel/qos/qos_resctrl.c:654:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         iowrite64(reg, ctrl->base + reg_offset);
         |         ^
   arch/riscv/kernel/qos/qos_resctrl.c:742:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     742 |                 reg = ioread64(ctrl->base + CBQRI_CC_CAPABILITIES_OFF);
         |                       ^
   arch/riscv/kernel/qos/qos_resctrl.c:826:9: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     826 |                 reg = ioread64(ctrl->base + CBQRI_BC_CAPABILITIES_OFF);
         |                       ^
   16 errors generated.


vim +/ioread64 +296 arch/riscv/kernel/qos/qos_resctrl.c

291c1b985f85fd Drew Fustini 2023-04-19  288  
291c1b985f85fd Drew Fustini 2023-04-19  289  /* Set capacity block mask (cc_block_mask) */
291c1b985f85fd Drew Fustini 2023-04-19  290  static void cbqri_set_cbm(struct cbqri_controller *ctrl, u64 cbm)
291c1b985f85fd Drew Fustini 2023-04-19  291  {
291c1b985f85fd Drew Fustini 2023-04-19  292  		int reg_offset;
291c1b985f85fd Drew Fustini 2023-04-19  293  		u64 reg;
291c1b985f85fd Drew Fustini 2023-04-19  294  
291c1b985f85fd Drew Fustini 2023-04-19  295  		reg_offset = CBQRI_CC_BLOCK_MASK_OFF;
291c1b985f85fd Drew Fustini 2023-04-19 @296  		reg = ioread64(ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  297  
291c1b985f85fd Drew Fustini 2023-04-19  298  		reg = cbm;
291c1b985f85fd Drew Fustini 2023-04-19 @299  		iowrite64(reg, ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  300  
291c1b985f85fd Drew Fustini 2023-04-19  301  		reg = ioread64(ctrl->base + reg_offset);
291c1b985f85fd Drew Fustini 2023-04-19  302  }
291c1b985f85fd Drew Fustini 2023-04-19  303  

:::::: The code at line 296 was first introduced by commit
:::::: 291c1b985f85fdb7d7ec4b8ef3996b518145db12 RISC-V: QoS: add resctrl interface for CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

