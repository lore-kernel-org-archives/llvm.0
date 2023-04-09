Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E023C5;
	Sun,  9 Apr 2023 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681055138; x=1712591138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kizwq/G3NZ4vXBYsxxhRt+z4+TmlSdjhog8qmIGXdO8=;
  b=imIebm/KMv4Ie4QbenXfVHwToir9w5PPx2ymeOIHtjjljHuJVpy9m4Oi
   LETTRAejCvUGKQJaviVVlFCBe/OKihKw8YAcVAKy8xv9oAShBVa8ZJOSk
   53Gs3Esy0NbqBUTg8Ti6CvdEDqYyKsJ8DA+ZfiDbbDNTNBrHsT/+7joAw
   8YGY+Y84tvrzBExzxrI8z/nYgwsaRhegynH5z5iw3HBx569EnrnWSdjXq
   X81441FLlJblCUelFxYoJado7cyK5qvftqG4zW6zN8+8lOO3Ab5BFWMgv
   lEJewNdimcwr+QFI3ThZUjUEtz2bqPAuoXIiQ56dQjW9jd7ELv0mm/3vH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="345890795"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="345890795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 08:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="799258045"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="799258045"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2023 08:45:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plXES-000UZz-25;
	Sun, 09 Apr 2023 15:45:32 +0000
Date: Sun, 9 Apr 2023 23:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230405-module-alloc-opts 38/40]
 kernel/module/stats.c:248:38: error: incompatible pointer types passing
 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'atomic64_t *'
Message-ID: <202304092310.A9KGzXp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230405-module-alloc-opts
head:   df3d0d8eab2e52ef53c9c95e45275904397cb19a
commit: 91f048af0cadf1b14de4c0be5481de5e34bbac2b [38/40] module: add debug stats to help identify memory pressure
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230409/202304092310.A9KGzXp6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=91f048af0cadf1b14de4c0be5481de5e34bbac2b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230405-module-alloc-opts
        git checkout 91f048af0cadf1b14de4c0be5481de5e34bbac2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304092310.A9KGzXp6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/stats.c:248:38: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'atomic64_t *' [-Werror,-Wincompatible-pointer-types]
                           atomic64_inc(&mod_fail->count);
                                        ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:807:26: note: passing argument to parameter 'v' here
   atomic64_inc(atomic64_t *v)
                            ^
   kernel/module/stats.c:259:22: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           atomic64_inc(&mod_fail->count);
                        ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:807:26: note: passing argument to parameter 'v' here
   atomic64_inc(atomic64_t *v)
                            ^
>> kernel/module/stats.c:290:29: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           total_size = atomic64_read(&total_mod_size);
                                      ^~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:291:28: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           text_size = atomic64_read(&total_text_size);
                                     ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:292:31: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           ikread_bytes = atomic64_read(&invalid_kread_bytes);
                                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:293:36: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:294:34: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:295:29: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
           imod_bytes = atomic64_read(&invalid_mod_bytes);
                                      ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:389:20: error: incompatible pointer types passing 'atomic_long_t *' (aka 'atomic_t *') to parameter of type 'const atomic64_t *' [-Werror,-Wincompatible-pointer-types]
                                    atomic64_read(&mod_fail->count), mod_fail_to_str(mod_fail));
                                                  ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:644:33: note: passing argument to parameter 'v' here
   atomic64_read(const atomic64_t *v)
                                   ^
   kernel/module/stats.c:306:34: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
           len = scnprintf(buf + 0, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
                                           ^~~
   kernel/module/stats.c:278:18: note: initialize the variable 'len' to silence this warning
           unsigned int len, size, count_failed = 0;
                           ^
                            = 0
   1 warning and 9 errors generated.


vim +248 kernel/module/stats.c

   240	
   241	int try_add_failed_module(const char *name, size_t len, enum fail_dup_mod_reason reason)
   242	{
   243		struct mod_fail_load *mod_fail;
   244	
   245		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list,
   246					lockdep_is_held(&module_mutex)) {
   247			if (strlen(mod_fail->name) == len && !memcmp(mod_fail->name, name, len)) {
 > 248	                        atomic64_inc(&mod_fail->count);
   249				__set_bit(reason, &mod_fail->dup_fail_mask);
   250	                        goto out;
   251	                }
   252	        }
   253	
   254		mod_fail = kzalloc(sizeof(*mod_fail), GFP_KERNEL);
   255		if (!mod_fail)
   256			return -ENOMEM;
   257		memcpy(mod_fail->name, name, len);
   258		__set_bit(reason, &mod_fail->dup_fail_mask);
   259	        atomic64_inc(&mod_fail->count);
   260	        list_add_rcu(&mod_fail->list, &dup_failed_modules);
   261	out:
   262		return 0;
   263	}
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
 > 290		total_size = atomic64_read(&total_mod_size);
   291		text_size = atomic64_read(&total_text_size);
   292		ikread_bytes = atomic64_read(&invalid_kread_bytes);
   293		idecompress_bytes = atomic64_read(&invalid_decompress_bytes);
   294		ibecoming_bytes = atomic64_read(&invalid_becoming_bytes);
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
   306		len = scnprintf(buf + 0, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
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
