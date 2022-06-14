Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5776D468F
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655182578; x=1686718578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eCnB0mxqjICI2nHrjg6XO+K4opaZ+X4RUqLpm5cFhj0=;
  b=aR9FQE0DVNRNhtsQCmr+e0iQGnjtFQTXeD4UbouBWsbDe1dEZdP3c7/Q
   GxYnTmb55gPb3NO/3P0QS7FeY5QfqhS1tILrgfqEirXZGoYhi8bs4vsgi
   DJL2R2Nwa0Sinjgh4/q8qq5zULmNtqClMs2du97IQdA7HI8dt8POM2vuk
   MWojKe4FtbGqk7DjiRjNdlj+WAVCtWprrB54bBnrQ+lvj3Ck5eKY7T5Yh
   1vYMutqhWvAiXaErh0NglLSBk3pSktF4IcaLtxd4XdYoXEjk/F8l8/iLN
   nBhXyL1jT4lPIZbJt6Z/O9IaGKGVr8dOgSXLwIJTIagluJ/egzsH8pQve
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279223279"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="279223279"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 21:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="651814987"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2022 21:56:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0yb7-000LUr-Qz;
	Tue, 14 Jun 2022 04:56:13 +0000
Date: Tue, 14 Jun 2022 12:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: jingyuwang <jingyuwang_vip@163.com>, akpm@linux-foundation.org,
	rostedt@goodmis.org, mhiramat@kernel.org, vbabka@suse.cz,
	ahalaney@redhat.com, Jason@zx2c4.com, mark-pk.tsai@mediatek.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, jingyuwang <jingyuwang_vip@163.com>
Subject: Re: [PATCH] Fix the following checkpatch error:
Message-ID: <202206141212.iXl6qYYx-lkp@intel.com>
References: <20220613202210.31759-1-jingyuwang_vip@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613202210.31759-1-jingyuwang_vip@163.com>

Hi jingyuwang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v5.19-rc2 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/jingyuwang/Fix-the-following-checkpatch-error/20220614-050258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r041-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141212.iXl6qYYx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/35742a839670fa8937c7040160e16b7009b2a9ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review jingyuwang/Fix-the-following-checkpatch-error/20220614-050258
        git checkout 35742a839670fa8937c7040160e16b7009b2a9ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   init/main.c:773:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
   void __init __weak arch_post_acpi_subsys_init(void) { }
                      ^
   init/main.c:773:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_post_acpi_subsys_init(void) { }
   ^
   static 
   init/main.c:785:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init __weak mem_encrypt_init(void) { }
                      ^
   init/main.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak mem_encrypt_init(void) { }
   ^
   static 
   init/main.c:787:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
   void __init __weak poking_init(void) { }
                      ^
   init/main.c:787:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak poking_init(void) { }
   ^
   static 
>> init/main.c:1344:20: error: 'initcall_level_names' causes a section type conflict with '__setup_str_set_reset_devices'
   static const char *initcall_level_names[] __initconst = {
                      ^
   init/main.c:191:1: note: declared here
   __setup("reset_devices", set_reset_devices);
   ^
   include/linux/init.h:329:2: note: expanded from macro '__setup'
           __setup_param(str, fn, fn, 0)
           ^
   include/linux/init.h:316:20: note: expanded from macro '__setup_param'
           static const char __setup_str_##unique_id[] __initconst         \
                             ^
   <scratch space>:58:1: note: expanded from here
   __setup_str_set_reset_devices
   ^
   3 warnings and 1 error generated.


vim +1344 init/main.c

  1342	
  1343	/* Keep these in sync with initcalls in include/linux/init.h */
> 1344	static const char *initcall_level_names[] __initconst = {
  1345		"pure",
  1346		"core",
  1347		"postcore",
  1348		"arch",
  1349		"subsys",
  1350		"fs",
  1351		"device",
  1352		"late",
  1353	};
  1354	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
