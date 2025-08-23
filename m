Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7A1F948;
	Sat, 23 Aug 2025 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755952787; cv=none; b=DNmP1ON5T41w48jqigy04FUK5fuvn1UBk6FObdDFQxlXXwigFg6NLVRq4eEB4apXwaLJ5jDSuTpKLW+e4NMf7PAZHtTNcKRbifRIy3Ufye+yr7i+zbfeSukKm/faFObrRLbA4RXv8Oatpt+WKO3BJWhNA2uNMn55JRR+p5eFdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755952787; c=relaxed/simple;
	bh=7wE2m0dJcLwFUoWErp1t+SLSWI5UdvCrXvs1irA1LLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzidVgqUR7MMf9Cv+GJbiSVA9QNd6wtfrQFkZXvMwDicJB0t7QZc3cuPzflTZcHUVlVcuevRQGYYiqdzEV/ba+iZvMyhgTPQ0b9GsCqCK3zvkAGmXqIlKPJXsv1TFD9ltnYBVsWqWDpY8IEU/9Nrxo5JJAvtiaXgxlDfvyMHQvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pfvmm3Z9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pfvmm3Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755952786; x=1787488786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wE2m0dJcLwFUoWErp1t+SLSWI5UdvCrXvs1irA1LLw=;
  b=Pfvmm3Z9hCVCPd8bmF/84lO8p0rj0g/GENG2V1R4r2DBghV6tC5atXKt
   kTUWkdQT4uSYO/KAfWBK9X96zr6uQcu9MnwQ8ygbJaTSx+0Qh5FpWBW7A
   0S6jaf4x1aZuHTaOsR6yho5NFw9dSLKe0qN/5suuAqhRpzlE1eYR3GOYA
   vyenFnQCoEf0cPBEjxI7PTygj16T2FT0/XktV2RcBdLEsGWDx1Wp7EfQa
   ltKMJox1OGdNvOo5ImKGxmT1fFcHnRQnCxKeFDzDA0nZVb8xmtYyCRBDz
   izgo3cutNmcIAQtcOm34dHsejvpY04SgRUbPJEYRyNeVRIF42nawi35KM
   g==;
X-CSE-ConnectionGUID: OXD5sQ/KT2mkGBs0g48x1w==
X-CSE-MsgGUID: Qqjt0uFfTX29XvmO1T3R6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57256404"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57256404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 05:39:45 -0700
X-CSE-ConnectionGUID: yIQ99niGSnSLtoXoMPNvPA==
X-CSE-MsgGUID: W8bmIO7BRbW244ObW8D5mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206086323"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2025 05:39:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upnWy-000MIt-1C;
	Sat, 23 Aug 2025 12:39:37 +0000
Date: Sat, 23 Aug 2025 20:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot/v6.17-rc2 11/89]
 drivers/resctrl/mpam_devices.c:107:21: warning: result of comparison of
 constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned
 int') is always false
Message-ID: <202508232014.DXou0s7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: 91e0d5599e4dbfdae2f7579aba82a3b4bd5c15bf [11/89] arm_mpam: Add support for memory controller MSC on DT platforms
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250823/202508232014.DXou0s7d-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232014.DXou0s7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232014.DXou0s7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/resctrl/mpam_devices.c:107:21: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     107 |                         if (component_id == ~0UL) {
         |                             ~~~~~~~~~~~~ ^  ~~~~
   1 warning generated.


vim +107 drivers/resctrl/mpam_devices.c

    60	
    61	static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
    62					  u32 ris_idx)
    63	{
    64		int err = 0;
    65		u32 class_id = 0, component_id = 0;
    66		struct device_node *cache = NULL, *memory = NULL;
    67		enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
    68	
    69		do {
    70			/* What kind of MSC is this? */
    71			if (of_device_is_compatible(np, "arm,mpam-cache")) {
    72				cache = of_parse_phandle(np, "arm,mpam-device", 0);
    73				if (!cache) {
    74					pr_err("Failed to read phandle\n");
    75					break;
    76				}
    77				type = MPAM_CLASS_CACHE;
    78			} else if (of_device_is_compatible(np->parent, "cache")) {
    79				cache = of_node_get(np->parent);
    80				type = MPAM_CLASS_CACHE;
    81			} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
    82				memory = of_parse_phandle(np, "arm,mpam-device", 0);
    83				if (!memory) {
    84					pr_err("Failed to read phandle\n");
    85					break;
    86				}
    87				type = MPAM_CLASS_MEMORY;
    88			} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
    89				memory = of_node_get(np->parent);
    90				type = MPAM_CLASS_MEMORY;
    91			} else {
    92				/*
    93				 * For now, only caches and memory controllers are
    94				 * supported.
    95				 */
    96				break;
    97			}
    98	
    99			/* Determine the class and component ids, based on type. */
   100			if (type == MPAM_CLASS_CACHE) {
   101				err = of_property_read_u32(cache, "cache-level", &class_id);
   102				if (err) {
   103					pr_err("Failed to read cache-level\n");
   104					break;
   105				}
   106				component_id = cache_of_calculate_id(cache);
 > 107				if (component_id == ~0UL) {
   108					err = -ENOENT;
   109					break;
   110				}
   111			} else if (type == MPAM_CLASS_MEMORY) {
   112				err = of_node_to_nid(np);
   113				component_id = (err == NUMA_NO_NODE) ? 0 : err;
   114				class_id = 255;
   115			}
   116	
   117			err = mpam_ris_create(msc, ris_idx, type, class_id,
   118					      component_id);
   119		} while (0);
   120		of_node_put(cache);
   121		of_node_put(memory);
   122	
   123		return err;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
