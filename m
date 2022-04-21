Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065511FA2
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523373; x=1682059373;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eX9tJNvYsH7FYls4laVtZcouWfkkw9qhHt5ZC3GKx2Q=;
  b=m+RsERLtv4vVWG4HfP7/WWFC2AS6DsY6PIXq/UmnKZfSF6Pkm+O5lc4f
   f8LoH0IFZAE5VEYJztSiQEXia5VsF3iBGiNWgTPUfsa44m64nt2riy81x
   Pjv991kjOoRcK1QUqki4hWBeJ9iyxJuXFqollR9fOdP2f36YihEgm6V2t
   AU+nsJKj9ItjsVnDm41MUM1xdkGeL4EDKVnvX1SP2XQFYr1N4S7dAgkgx
   l9IDQbaT15rX5YPj43oecC3bKQor16AsxrGofYIs3XtOaWFyD8XHxTeZe
   7mnn7YBCDiJt2IuLBbLKksQ7LYsj3sujLYbDmczJxMzG7ZwU/bglN3dcv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261857405"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="261857405"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="727846858"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2022 23:42:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQWg-000802-Nv;
	Thu, 21 Apr 2022 06:42:50 +0000
Date: Thu, 21 Apr 2022 14:41:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9206/9999]
 kernel/gcov/clang.c:221:9: error: implicit declaration of function
 'within_module'
Message-ID: <202204210248.PacAcknN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Greg Hackmann <ghackmann@android.com>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Tri Vo <trong@android.com>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Yu Zhao <yuzhao@google.com>
CC: Sean Paul <seanpaul@chromium.org>

Hi Greg,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 35be48648a6552869bd5d6c9a0d278102d23d46c [9206/9999] UPSTREAM: gcov: clang support
config: mips-randconfig-r035-20220420 (https://download.01.org/0day-ci/archive/20220421/202204210248.PacAcknN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jsarha/linux/commit/35be48648a6552869bd5d6c9a0d278102d23d46c
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 35be48648a6552869bd5d6c9a0d278102d23d46c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=kernel/gcov

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/gcov/clang.c:85:6: warning: no previous prototype for function 'llvm_gcov_init' [-Wmissing-prototypes]
   void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
        ^
   kernel/gcov/clang.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
   ^
   static 
   kernel/gcov/clang.c:108:6: warning: no previous prototype for function 'llvm_gcda_start_file' [-Wmissing-prototypes]
   void llvm_gcda_start_file(const char *orig_filename, const char version[4],
        ^
   kernel/gcov/clang.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcda_start_file(const char *orig_filename, const char version[4],
   ^
   static 
   kernel/gcov/clang.c:117:6: warning: no previous prototype for function 'llvm_gcda_emit_function' [-Wmissing-prototypes]
   void llvm_gcda_emit_function(u32 ident, const char *function_name,
        ^
   kernel/gcov/clang.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcda_emit_function(u32 ident, const char *function_name,
   ^
   static 
   kernel/gcov/clang.c:137:6: warning: no previous prototype for function 'llvm_gcda_emit_arcs' [-Wmissing-prototypes]
   void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
        ^
   kernel/gcov/clang.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
   ^
   static 
   kernel/gcov/clang.c:147:6: warning: no previous prototype for function 'llvm_gcda_summary_info' [-Wmissing-prototypes]
   void llvm_gcda_summary_info(void)
        ^
   kernel/gcov/clang.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcda_summary_info(void)
   ^
   static 
   kernel/gcov/clang.c:152:6: warning: no previous prototype for function 'llvm_gcda_end_file' [-Wmissing-prototypes]
   void llvm_gcda_end_file(void)
        ^
   kernel/gcov/clang.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void llvm_gcda_end_file(void)
   ^
   static 
>> kernel/gcov/clang.c:221:9: error: implicit declaration of function 'within_module' [-Werror,-Wimplicit-function-declaration]
           return within_module((unsigned long)info->filename, mod);
                  ^
   kernel/gcov/clang.c:221:9: note: did you mean 'init_module'?
   include/linux/module.h:75:12: note: 'init_module' declared here
   extern int init_module(void);
              ^
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
https://01.org/lkp
