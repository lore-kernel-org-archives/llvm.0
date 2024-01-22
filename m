Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5263A6;
	Mon, 22 Jan 2024 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705950372; cv=none; b=HUztlmCbAlNMR2zBOc3fu+Q5BD8JXhRw5yMVIftesFCThrAYfvSgMrSyr04kdFjcdpIxJHYQQCqH8+a0cUfT6THyh3HxfQ94BZyZ2YTivEG7AIOla2RMeiKU1nxt7TvYrLCiRmxEyr28DIaCj21XJAajWga7DUPRhK3zbZzdiys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705950372; c=relaxed/simple;
	bh=kbE8Q5vqODHAjMyaVxUSnMUE04oYW7Jp6oMvQE471gs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLLgOIi+DCeQooh0IEztP2jWalCMJNPwpORL5INE7paoMZH6xuzbUSdr1RVDiFVgDeyhGHmIoWv1X6j/WxkiKYMzc5z9puCu7Zt3mF7N0fP/+NIpIBjHNO1gYpuetqe3vKR662pQuj9zZrcw5vXRTO5/2WT5IhnzwqYfBGfHqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjNBVKg/; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjNBVKg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705950368; x=1737486368;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kbE8Q5vqODHAjMyaVxUSnMUE04oYW7Jp6oMvQE471gs=;
  b=bjNBVKg/4dcCVBeKO/Xn7Ts0zGw37q8Ba5DythggQUJn4Dn875baUjak
   ADIlQrC2QyJKhgwFFKCdu+vs9KKoj7uBUrm9rbq6JI+ZrUzLP6poqgtGA
   LcxZwqrmdampPKfKvgdIBXWTanGnD+ANtUwv+nm+z+HZ1NJm3jCYNbsLy
   K/7DCuTDel/mf92snUqyxxUIlGbIJaVGk/iTOTnvaEBvs/zw0Kr8qLWFV
   gccsplGko6b86H7dwNu4eBDUxxckmQbGHdlHJvsO0ZJa5l+FViFR2Vy0c
   gONWK3dfhyprMW7lMziHbu4fQ++7KVuIOSnp1hsZ6UqBBO5fLj0uwLSom
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400158886"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="400158886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 11:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1389312"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jan 2024 11:06:06 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRzcS-0006oZ-0H;
	Mon, 22 Jan 2024 19:06:04 +0000
Date: Tue, 23 Jan 2024 03:05:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9206/9999]
 kernel/gcov/clang.c:221:9: error: implicit declaration of function
 'within_module'
Message-ID: <202401230353.Rzf6chZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 35be48648a6552869bd5d6c9a0d278102d23d46c [9206/9999] UPSTREAM: gcov: clang support
config: x86_64-buildonly-randconfig-004-20240122 (https://download.01.org/0day-ci/archive/20240123/202401230353.Rzf6chZz-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230353.Rzf6chZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230353.Rzf6chZz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/gcov/clang.c:85:6: warning: no previous prototype for function 'llvm_gcov_init' [-Wmissing-prototypes]
      85 | void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
         |      ^
   kernel/gcov/clang.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
         | ^
         | static 
   kernel/gcov/clang.c:108:6: warning: no previous prototype for function 'llvm_gcda_start_file' [-Wmissing-prototypes]
     108 | void llvm_gcda_start_file(const char *orig_filename, const char version[4],
         |      ^
   kernel/gcov/clang.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | void llvm_gcda_start_file(const char *orig_filename, const char version[4],
         | ^
         | static 
   kernel/gcov/clang.c:117:6: warning: no previous prototype for function 'llvm_gcda_emit_function' [-Wmissing-prototypes]
     117 | void llvm_gcda_emit_function(u32 ident, const char *function_name,
         |      ^
   kernel/gcov/clang.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | void llvm_gcda_emit_function(u32 ident, const char *function_name,
         | ^
         | static 
   kernel/gcov/clang.c:137:6: warning: no previous prototype for function 'llvm_gcda_emit_arcs' [-Wmissing-prototypes]
     137 | void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
         |      ^
   kernel/gcov/clang.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
         | ^
         | static 
   kernel/gcov/clang.c:147:6: warning: no previous prototype for function 'llvm_gcda_summary_info' [-Wmissing-prototypes]
     147 | void llvm_gcda_summary_info(void)
         |      ^
   kernel/gcov/clang.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | void llvm_gcda_summary_info(void)
         | ^
         | static 
   kernel/gcov/clang.c:152:6: warning: no previous prototype for function 'llvm_gcda_end_file' [-Wmissing-prototypes]
     152 | void llvm_gcda_end_file(void)
         |      ^
   kernel/gcov/clang.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     152 | void llvm_gcda_end_file(void)
         | ^
         | static 
>> kernel/gcov/clang.c:221:9: error: implicit declaration of function 'within_module' [-Werror,-Wimplicit-function-declaration]
     221 |         return within_module((unsigned long)info->filename, mod);
         |                ^
   kernel/gcov/clang.c:221:9: note: did you mean 'init_module'?
   include/linux/module.h:75:12: note: 'init_module' declared here
      75 | extern int init_module(void);
         |            ^
   6 warnings and 1 error generated.


vim +/within_module +221 kernel/gcov/clang.c

   211	
   212	/**
   213	 * gcov_info_within_module - check if a profiling data set belongs to a module
   214	 * @info: profiling data set
   215	 * @mod: module
   216	 *
   217	 * Returns true if profiling data belongs module, false otherwise.
   218	 */
   219	bool gcov_info_within_module(struct gcov_info *info, struct module *mod)
   220	{
 > 221		return within_module((unsigned long)info->filename, mod);
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
