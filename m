Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746A11712;
	Fri, 18 Jul 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752874143; cv=none; b=dBocqdMyfnscXYsbgn0olvG6XYfAz0oSguqgLaD4OSfHLx1tzeSRFFty01AjqhzZwE7amPzdTSI3wvJyi5EXk2UHP3Vg6R8vv0DcArmkWWI0Z8SRuG4FVoDciLB6+njF9bTHD3n9R2+34Acv2O4TG9u+pS6Zm6JSNrXdNrFHjNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752874143; c=relaxed/simple;
	bh=SSlJVkJKTqqd1FvLbV+6nZaDhnJw7GlXKhtD551VLNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pEXhqaaKkF4jC4f9P8ETaphRxvhSqgkWOiR8cUzLf4YEoYsclUBXatGfQyF9WnVbzSie24AEb17Qi1zwBTOM5NEEDf8bRIfjL4siowwuUad2ZuvoEUpxX5POWxZ7yqhSrbp4+ylhM845iJ9sse5OuCiStheLz2pDi/CC+ZdX/jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R43gvnVd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R43gvnVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752874141; x=1784410141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSlJVkJKTqqd1FvLbV+6nZaDhnJw7GlXKhtD551VLNY=;
  b=R43gvnVddB3hmBlIHA8rDlF9N98G5lQxeFE+yY5mojZlVZWxdJm+O6M2
   w25ATV/4RqVlsKXx9kRxEqOuYN2SHSVn5gUT0ZFNTawgS3IXfvB9FfIPH
   prID9KbqfOs+Yuc3hpT/eheOc3TkLkwDPAa9MmslPW0LHdcJVaqPliQ5j
   fjrwImyubJAbIlbVGJGEOd9eagHslwP9n9NtYVuER7uvUXw+oGP+BneSH
   UN1MK/aQgkR0ytov8I1zvawz11u6Sb0hHnkqtnviqiGS9Kxh/CEPrrsyN
   xrRWzB+l7ZMFGLwVnlb1R1FkDyEvoPOxqu8IGkZhldko7otO0SL/UybDP
   w==;
X-CSE-ConnectionGUID: wZ9ZoaH8SPiJrN4BouI1gA==
X-CSE-MsgGUID: BVxFZA1jRkOzjDOcobkqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54888290"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54888290"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 14:29:00 -0700
X-CSE-ConnectionGUID: bRwVKrEUSlyMCmCAve0RIA==
X-CSE-MsgGUID: FxXtKleXQJqfcSyx61j+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158805503"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 14:28:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucsdT-000F3T-2h;
	Fri, 18 Jul 2025 21:28:55 +0000
Date: Sat, 19 Jul 2025 05:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 160/175] mm/kasan/tags.c:145:6: error: redefinition
 of 'kasan_save_free_info'
Message-ID: <202507190528.W6ndwfyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   b0e07b9befa0558a80b281b7efcdb3717881c969
commit: 3d3c26eaf9f6e00779d27dd54d763c9bdc5dda3c [160/175] kasan: add shadow checks to wrappers and rename kasan_arch_is_ready
config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190528.W6ndwfyg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190528.W6ndwfyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190528.W6ndwfyg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/tags.c:145:6: error: redefinition of 'kasan_save_free_info'
     145 | void kasan_save_free_info(struct kmem_cache *cache, void *object)
         |      ^
   mm/kasan/kasan.h:403:20: note: previous definition is here
     403 | static inline void kasan_save_free_info(struct kmem_cache *cache, void *object)
         |                    ^
   1 error generated.
--
>> mm/kasan/sw_tags.c:125:6: error: redefinition of 'kasan_byte_accessible'
     125 | bool kasan_byte_accessible(const void *addr)
         |      ^
   mm/kasan/kasan.h:536:20: note: previous definition is here
     536 | static inline bool kasan_byte_accessible(const void *addr)
         |                    ^
   1 error generated.


vim +/kasan_save_free_info +145 mm/kasan/tags.c

ccf643e6dacf33 Andrey Konovalov 2022-09-05  144  
6b07434980a192 Andrey Konovalov 2022-09-05 @145  void kasan_save_free_info(struct kmem_cache *cache, void *object)

:::::: The code at line 145 was first introduced by commit
:::::: 6b07434980a1926780cb5c5644fb198fb9c3997b kasan: pass tagged pointers to kasan_save_alloc/free_info

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
