Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B6F2C9A;
	Wed,  5 Apr 2023 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680700637; x=1712236637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6iaTetbjiUdoRZJuS0vqf9xr0ZuVRU9nLo/8+Z2o8A=;
  b=BLQYPIPPo6JCYeZTsaIkaIqIU+oiuHijdxcJYVF89GQxQjg25W56y/oz
   FUALl7FxH6Is240CHLwczLOguoQjl4b3HGwNuaMDw3WqMjbNhTdFfVNDj
   oQtsIF+amVltCzvlwKkipiyuiGqTwAqG9Wi23yo6vjAjk4tc9CMdmI0T5
   ComKJu+1IzO5cJBLkaZgjUykcN9GmglWW4oow+PUDPPROkO/zKNfXXHq4
   xj68qIO/4kchOlLMvtD53Ah4BejuC5dk9QJZk8iNzVi8w4t6RM4SZpo1R
   rIu4u0UmCMgmtLUHS6XTj2kEIds8bl4du4EosSt56rhq078uXPrfSTLTM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="345028483"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="345028483"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 06:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680278301"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680278301"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 06:17:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk30k-000QYM-15;
	Wed, 05 Apr 2023 13:17:14 +0000
Date: Wed, 5 Apr 2023 21:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230404-module-alloc-opts 39/41]
 kernel/module/stats.c:306:2: warning: variable 'len' is uninitialized when
 used here
Message-ID: <202304052124.ayGRoau1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230404-module-alloc-opts
head:   972a42717ab4ae90acc80cae25d97860a7d04184
commit: 3cd12ffc14eea5599e4511e011f04a5045ed8041 [39/41] module: add debug stats to help identify memory pressure
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230405/202304052124.ayGRoau1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=3cd12ffc14eea5599e4511e011f04a5045ed8041
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230404-module-alloc-opts
        git checkout 3cd12ffc14eea5599e4511e011f04a5045ed8041
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304052124.ayGRoau1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/stats.c:306:2: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
           len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
           ^~~
   kernel/module/stats.c:278:18: note: initialize the variable 'len' to silence this warning
           unsigned int len, size, count_failed = 0;
                           ^
                            = 0
   1 warning generated.


vim +/len +306 kernel/module/stats.c

   264	
   265	/*
   266	 * At 64 bytes per module and assuming a 1024 bytes preamble we can fit the
   267	 * 112 module prints within 8k.
   268	 *
   269	 * 1024 + (64*112) = 8k
   270	 */
   271	#define MAX_PREAMBLE 1024
   272	#define MAX_FAILED_MOD_PRINT 112
   273	#define MAX_BYTES_PER_MOD 64
   274	static ssize_t read_file_mod_stats(struct file *file, char __user *user_buf,
   275					   size_t count, loff_t *ppos)
   276	{
   277		struct mod_fail_load *mod_fail;
   278		unsigned int len, size, count_failed = 0;
   279		char *buf;
   280		u32 live_mod_count, fkreads, fdecompress, fbecoming, floads;
   281		u64 total_size, text_size, ikread_bytes, ibecoming_bytes, idecompress_bytes, imod_bytes,
   282		    total_virtual_lost;
   283	
   284		live_mod_count = atomic_read(&modcount);
   285		fkreads = atomic_read(&failed_kreads);
   286		fdecompress = atomic_read(&failed_decompress);
   287		fbecoming = atomic_read(&failed_becoming);
   288		floads = atomic_read(&failed_load_modules);
   289	
   290		total_size = atomic64_read(&total_mod_size);
   291		text_size = atomic64_read(&total_text_size);
   292		ikread_bytes = atomic64_read(&invalid_kread_bytes);
   293		idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
   294		ibecoming_bytes = atomic64_read(&invalid_mod_becoming_bytes);
   295		imod_bytes = atomic64_read(&invalid_mod_bytes);
   296	
   297		total_virtual_lost = ikread_bytes + idecompress_bytes + ibecoming_bytes + imod_bytes;
   298	
   299		size = MAX_PREAMBLE + min((unsigned int)(floads + fbecoming) * MAX_BYTES_PER_MOD,
   300				  (unsigned int) MAX_FAILED_MOD_PRINT * MAX_BYTES_PER_MOD);
   301		buf = kzalloc(size, GFP_KERNEL);
   302		if (buf == NULL)
   303			return -ENOMEM;
   304	
   305		/* The beginning of our debug preamble */
 > 306		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
   307	
   308		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on kread", fkreads);
   309	
   310		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on decompress",
   311				 fdecompress);
   312		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on becoming", fbecoming);
   313	
   314		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on load", floads);
   315	
   316		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total module size", total_size);
   317		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Total mod text size", text_size);
   318	
   319		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kread bytes", ikread_bytes);
   320	
   321		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed decompress bytes",
   322				 idecompress_bytes);
   323	
   324		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed becoming bytes", ibecoming_bytes);
   325	
   326		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Failed kmod bytes", imod_bytes);
   327	
   328		len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Virtual mem wasted bytes", total_virtual_lost);
   329	
   330		if (live_mod_count && total_size) {
   331			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod size",
   332					 DIV_ROUND_UP(total_size, live_mod_count));
   333		}
   334	
   335		if (live_mod_count && text_size) {
   336			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average mod text size",
   337					 DIV_ROUND_UP(text_size, live_mod_count));
   338		}
   339	
   340		/*
   341		 * We use WARN_ON_ONCE() for the counters to ensure we always have parity
   342		 * for keeping tabs on a type of failure with one type of byte counter.
   343		 * The counters for imod_bytes does not increase for fkreads failures
   344		 * for example, and so on.
   345		 */
   346	
   347		WARN_ON_ONCE(ikread_bytes && !fkreads);
   348		if (fkreads && ikread_bytes) {
   349			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail kread bytes",
   350					 DIV_ROUND_UP(ikread_bytes, fkreads));
   351		}
   352	
   353		WARN_ON_ONCE(ibecoming_bytes && !fbecoming);
   354		if (fbecoming && ibecoming_bytes) {
   355			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail becoming bytes",
   356					 DIV_ROUND_UP(ibecoming_bytes, fbecoming));
   357		}
   358	
   359		WARN_ON_ONCE(idecompress_bytes && !fdecompress);
   360		if (fdecompress && idecompress_bytes) {
   361			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Avg fail decomp bytes",
   362					 DIV_ROUND_UP(idecompress_bytes, fdecompress));
   363		}
   364	
   365		WARN_ON_ONCE(imod_bytes && !floads);
   366		if (floads && imod_bytes) {
   367			len += scnprintf(buf + len, size - len, "%25s\t%llu\n", "Average fail load bytes",
   368					 DIV_ROUND_UP(imod_bytes, floads));
   369		}
   370	
   371		/* End of our debug preamble header. */
   372	
   373		/* Catch when we've gone beyond our expected preamble */
   374		WARN_ON_ONCE(len >= MAX_PREAMBLE);
   375	
   376		if (list_empty(&dup_failed_modules))
   377			goto out;
   378	
   379		len += scnprintf(buf + len, size - len, "Duplicate failed modules:\n");
   380		len += scnprintf(buf + len, size - len, "%25s\t%15s\t%25s\n",
   381				 "module-name", "How-many-times", "Reason");
   382		mutex_lock(&module_mutex);
   383	
   384	
   385		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list) {
   386			if (WARN_ON_ONCE(++count_failed >= MAX_FAILED_MOD_PRINT))
   387				goto out_unlock;
   388			len += scnprintf(buf + len, size - len, "%25s\t%15llu\t%25s\n", mod_fail->name,
   389					 atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
   390		}
   391	out_unlock:
   392		mutex_unlock(&module_mutex);
   393	out:
   394		kfree(buf);
   395	        return simple_read_from_buffer(user_buf, count, ppos, buf, len);
   396	}
   397	#undef MAX_PREAMBLE
   398	#undef MAX_FAILED_MOD_PRINT
   399	#undef MAX_BYTES_PER_MOD
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
