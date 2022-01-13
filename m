Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEBD173
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642112650; x=1673648650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7FPNtu6aWVjraRKm5LB10uV9Gdpw2N3Tfq5Q0wPgOM=;
  b=jmNWqxij4rpAz8zya2XMa4T8IDenNXxumeHvMmAOVUX4ToQxIHf0EVir
   HtKhn+0IM308JihJqJOFyq02bMvGWQgp7C+851ZiF6og4MUVwvu/5S7vZ
   12/iRNzMBiER+P1t63hyHZGhoZsSZ8mPSINFEUkobvZLYsZD2WwrrlWjB
   sTeTc33qhg1VhuDOmEZgwYHKIcRaTOs1CGbSoNcWBJFrlY1YvfrG7EbFb
   5qQv7Etxl5Jei9x6tCklEnqlhcF2CjJBpDXkYp03W4ndIGH79Z7QTQwmN
   UdDRJmfsZflBycS6QJSsOj+5eZ9zJBHFc8vcgFiQckPD9Onj04jZtmPhW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244328905"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="244328905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 14:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="577090519"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jan 2022 14:24:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n88Vp-0007iM-7P; Thu, 13 Jan 2022 22:24:05 +0000
Date: Fri, 14 Jan 2022 06:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 583/2382] kernel/kallsyms.c:905:85: error:
 subscript of pointer to incomplete type 'struct kallsyms_entry'
Message-ID: <202201140617.BMMz1dhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   1a880941a087613ed42f77001229edfcf75ea8a5
commit: 4357bf918816f743b593665e792f78913f0da47b [583/2382] kallsyms/objtool: Process entries
config: x86_64-randconfig-a015-20220109 (https://download.01.org/0day-ci/archive/20220114/202201140617.BMMz1dhu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=4357bf918816f743b593665e792f78913f0da47b
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 4357bf918816f743b593665e792f78913f0da47b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/master HEAD 1a880941a087613ed42f77001229edfcf75ea8a5 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/kallsyms.c:586:12: warning: no previous prototype for function 'arch_get_kallsym' [-Wmissing-prototypes]
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
              ^
   kernel/kallsyms.c:586:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
   ^
   static 
   kernel/kallsyms.c:895:81: error: invalid application of 'sizeof' to an incomplete type 'struct kallsyms_entry'
           nr_entries = ((long)&__kallsyms_offsets_end - (long)&__kallsyms_offsets_begin)/sizeof(struct kallsyms_entry);
                                                                                          ^     ~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kallsyms.c:889:9: note: forward declaration of 'struct kallsyms_entry'
           struct kallsyms_entry *entries;
                  ^
>> kernel/kallsyms.c:905:85: error: subscript of pointer to incomplete type 'struct kallsyms_entry'
                   printk("# kallsyms entry %6ld/%6ld: [%016Lx]: {%s}\n", i, nr_entries, (u64)entries[i].offset, str);
                                                                                              ~~~~~~~^
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   kernel/kallsyms.c:889:9: note: forward declaration of 'struct kallsyms_entry'
           struct kallsyms_entry *entries;
                  ^
   1 warning and 2 errors generated.


vim +905 kernel/kallsyms.c

   886	
   887	static void __init kallsyms_objtool_init(void)
   888	{
   889		struct kallsyms_entry *entries;
   890		long nr_entries, i;
   891		char *str;
   892	
   893		printk("# kallsyms_objtool_init()\n");
   894	
   895		nr_entries = ((long)&__kallsyms_offsets_end - (long)&__kallsyms_offsets_begin)/sizeof(struct kallsyms_entry);
   896	
   897		printk("# kallsyms: %ld entries.\n", nr_entries);
   898	
   899		BUG_ON(nr_entries <= 0);
   900	
   901		str = &__kallsyms_strs_begin;
   902		entries = (void *) &__kallsyms_offsets_begin;
   903	
   904		for (i = 0; i < nr_entries; i++) {
 > 905			printk("# kallsyms entry %6ld/%6ld: [%016Lx]: {%s}\n", i, nr_entries, (u64)entries[i].offset, str);
   906	
   907			str += strlen(str) + 1;
   908	
   909		}
   910		printk("# kallsyms, last str:             %p\n", str);
   911		printk("# kallsyms, &__kallsyms_strs_end: %p\n", &__kallsyms_strs_end);
   912	
   913		BUG_ON(str != &__kallsyms_strs_end);
   914	}
   915	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
