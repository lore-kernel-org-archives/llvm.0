Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471213DBA0;
	Sun,  9 Feb 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098176; cv=none; b=PJQShEOt1bA6BdYyQEQo/HFqqMEE4gRQerQ/MrANtn2PDdK/1nTMnV8bEqwWS5kSfrPa/BtbX4rWPpnK1U8p3beXz7/mOrm854m3IG1TeE9hvSo4+jahRlWiwoKs5kRalPayGCkjvu1zQZ11JpOhUirTRnivwLc8ka8OyHlL3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098176; c=relaxed/simple;
	bh=jgVffz6pWpd3nWaNApVq+/g346kd5Nrp2vT9fB4yFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sy2eYAhFg3Uu19ZpSB6ZY+ut+cSQv/I3gOXHk2lQA05u4KPdHGJqkXHf1Ofmwrx3r7KOmudzTIIb1sb+T1CjvtGPJTICzGNx8Fnsyxn7pSbuZxZMYUpuiGoC02l0b3BOuz29HBe1DjWnzYd0K6AT3BEXfjCo+YmxaOoaaPnZlMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0hBxjE4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0hBxjE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739098175; x=1770634175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jgVffz6pWpd3nWaNApVq+/g346kd5Nrp2vT9fB4yFcs=;
  b=Z0hBxjE4IIo+u9MG9/Jxl9uWUhuAkbWkjqMVItJlYbXSIFQiXIS5aC1g
   YUIq4if7kqbdqCkYNyauT0zL1ACU1uPjsAKaOJzrvu7QJzmZ2Mq+Jn9N3
   5x49+1bhY6ZBO7knQ/ZlCSL7K1MDoIBBJpw5uNgOM65kapJBFN0nfJa5z
   NhcU17OKXYjw38wKLjkNKLFBV9S0bQh5GAu4IHM1+O45Nw038UvjOjfeS
   Oj5W8bZyDvLslF1My9P4uLheq1STcnvewABm60cc9aDVxYcNrlh8M8FDd
   JbTI5Jr7XDklY1SIiWXG0WzjggnEHVGA2DM9W7A5NtwfFdAyKRm9H+kzw
   Q==;
X-CSE-ConnectionGUID: 8UGVPBYFR5Cvty56lAtZ2w==
X-CSE-MsgGUID: 2dEzyPxOTWWeOqKyHl0xhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43614308"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="43614308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 02:49:34 -0800
X-CSE-ConnectionGUID: 9VL2oWQXTSeVYOLKbb1X3Q==
X-CSE-MsgGUID: AOWasBjZRpOvc51EwuNHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112813958"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2025 02:49:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th4sU-0011Mg-0E;
	Sun, 09 Feb 2025 10:49:30 +0000
Date: Sun, 9 Feb 2025 18:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.14-rc1 68/124]
 drivers/platform/arm64/mpam/mpam_devices.c:352:17: warning: result of
 comparison of constant 18446744073709551615 with expression of type 'u32'
 (aka 'unsigned int') is always false
Message-ID: <202502091848.Rcd80pME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.14-rc1
head:   a185f01212c6b5421e944bef6839d6d6660e2b8b
commit: dfef24fe9ee10fc0c85f7bd6dec37e1fc003db85 [68/124] arm_mpam: Add the class and component structures for ris firmware described
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502091848.Rcd80pME-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091848.Rcd80pME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091848.Rcd80pME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/mpam/mpam_devices.c:352:17: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     352 |                         if (cache_id == ~0UL) {
         |                             ~~~~~~~~ ^  ~~~~
   1 warning generated.


vim +352 drivers/platform/arm64/mpam/mpam_devices.c

   316	
   317	/*
   318	 * The cacheinfo structures are only populated when CPUs are online.
   319	 * This helper walks the device tree to include offline CPUs too.
   320	 */
   321	static int get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
   322					     cpumask_t *affinity)
   323	{
   324		int cpu, err;
   325		u32 iter_level;
   326		struct device_node *iter;
   327		unsigned long iter_cache_id;
   328	
   329		if (!acpi_disabled)
   330			return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
   331	
   332		for_each_possible_cpu(cpu) {
   333			iter = of_get_cpu_node(cpu, NULL);
   334			if (!iter) {
   335				pr_err("Failed to find cpu%d device node\n", cpu);
   336				return -ENOENT;
   337			}
   338	
   339			while ((iter = of_find_next_cache_node(iter))) {
   340				err = of_property_read_u32(iter, "cache-level",
   341							   &iter_level);
   342				if (err || iter_level != cache_level) {
   343					of_node_put(iter);
   344					continue;
   345				}
   346	
   347				/*
   348				 * get_cpu_cacheinfo_id() isn't ready until sometime
   349				 * during device_initcall(). Use cache_of_get_id().
   350				 */
   351				iter_cache_id = cache_of_get_id(iter);
 > 352				if (cache_id == ~0UL) {
   353					of_node_put(iter);
   354					continue;
   355				}
   356	
   357				if (iter_cache_id == cache_id)
   358					cpumask_set_cpu(cpu, affinity);
   359	
   360				of_node_put(iter);
   361			}
   362		}
   363	
   364		return 0;
   365	}
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
