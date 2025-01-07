Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D4D1F0E42;
	Tue,  7 Jan 2025 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259026; cv=none; b=UVrxX2BXJcl1gXB3I7vObYevcnaqWnxRk/ScBfkr2sGnwRYoatFRMHDfiiqYL2QFhW49XozEj318zT05di4ZCfc56fqORmHv9y4w2i5NXU+U9OaRFFefl+7VhU3DlNu8tzDHh7irsad2xSJHZOiELAiZ1w15cAOcUOp/HwmS4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259026; c=relaxed/simple;
	bh=3b84z7hNbN/ujsQ15hlspvRs+E6hkU9AxN18dOko4eg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsHGDyYGJXxQN6mFnHsfAqJAlu9iio9swQPIK7TvaPMraen6b3UQdTPRoE85wK/i++PHFnaRpDRTFFJwS4QInRFVHeg2+W/WWihSxxJEL6lCTuzUozNrmQTPhEKldIBsoVE108dinVmO8mJwjPhMiVk6D3+OZk6roIA3mR79Z8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XS97Swtr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XS97Swtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736259023; x=1767795023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3b84z7hNbN/ujsQ15hlspvRs+E6hkU9AxN18dOko4eg=;
  b=XS97SwtrH8ZpNNJEwTAdyayF9gQYskZdQuZ8m5HIhgh4j48Bqfmd+hb3
   MlMsQnjQNVKUHeA9R9ZLil4m7E9WZhxMMKqvc+uVmCNgNJZDOygK7nsz1
   mUdjNqqaP60unkb2N3Ycc36z7EdvQ68lIC0L2fUMQJ/XB26pQ7dj+NUma
   +NhgeVAqpJgaIs38PQSp+j2hH46nKzlvvWQAiU7+izDxepeRN17jlZKny
   iNcUPWgkuJH8bcpCrhauw29VDfbddxeA7ZxBXGcczK2Bb6g5wBhTNHvZ5
   CjFqI6ZzKKJm6XIR00IdkyJbqEwSGTgCiAXRbEQIzpK8wRSoc7d5CwR3g
   A==;
X-CSE-ConnectionGUID: dGsFdcbGTUSTY5ABz5+otg==
X-CSE-MsgGUID: so9cVDCDRHmlKCPcJ0bHeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40113581"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="40113581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:10:23 -0800
X-CSE-ConnectionGUID: IM7D+ul8TK6u6jQODwDLmw==
X-CSE-MsgGUID: 3NDbhhRGSaOySE8hNMeamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="107655387"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jan 2025 06:10:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVAHj-000EmO-0w;
	Tue, 07 Jan 2025 14:10:19 +0000
Date: Tue, 7 Jan 2025 22:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Ying <ying.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kernel/resource.c:1838:43: warning: implicit conversion from
 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value
 from 68719476735 to 4294967295
Message-ID: <202501072245.XEsNqAlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b resource, kunit: add test case for region_intersects()
date:   4 months ago
config: arm-randconfig-001-20241228 (https://download.01.org/0day-ci/archive/20250107/202501072245.XEsNqAlW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072245.XEsNqAlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072245.XEsNqAlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/resource.c:1838:43: warning: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
                   end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   kernel/resource.c:1827:52: note: expanded from macro 'MAX_PHYS_ADDR'
   #define MAX_PHYS_ADDR           ((1ULL << MAX_PHYSMEM_BITS) - 1)
                                                               ^
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
   #define min_t(type, x, y) __cmp_once(min, type, x, y)
                             ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
           __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
           ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                  ~~    ^
   kernel/resource.c:1855:45: warning: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
                   addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   kernel/resource.c:1827:52: note: expanded from macro 'MAX_PHYS_ADDR'
   #define MAX_PHYS_ADDR           ((1ULL << MAX_PHYSMEM_BITS) - 1)
                                                               ^
   include/linux/minmax.h:213:52: note: expanded from macro 'min_t'
   #define min_t(type, x, y) __cmp_once(min, type, x, y)
                             ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/minmax.h:96:33: note: expanded from macro '__cmp_once'
           __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:31: note: expanded from macro '__cmp_once_unique'
           ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                  ~~    ^
   2 warnings generated.


vim +1838 kernel/resource.c

  1831	
  1832	static resource_size_t gfr_start(struct resource *base, resource_size_t size,
  1833					 resource_size_t align, unsigned long flags)
  1834	{
  1835		if (flags & GFR_DESCENDING) {
  1836			resource_size_t end;
  1837	
> 1838			end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
  1839			return end - size + 1;
  1840		}
  1841	
  1842		return ALIGN(max(base->start, align), align);
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
