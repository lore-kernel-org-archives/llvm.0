Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23416420;
	Fri, 24 Nov 2023 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acyyyYxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819415; x=1732355415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOr2FaeSUNGwHpKrb3stk7eLjODcBIcO8mTSTPzVIO0=;
  b=acyyyYxdHBiVYtxauTpFU/jjjl8/eHWb0MIj5c9NFD2tszvZvZskD4gB
   uQUAA2rIPp10lshxefGWpnmNhYJ3Y4wZhsCAsqyCG1sBmmOJ03W0t2xAX
   i4Gke5rceBqckEYkHBmeabUoGL1KQqRaBAYTf+HLFIRDOL2cUSl4TWl4F
   m9D6prdvbNvCxf0pw5juqXH7ZLeuAn02Utsf1nnaprybT69GTbQLrSNSb
   eG5y/dotrNjD8OEwcG/ofllM4Wg05JAEd8Ssp5V8WiyEMk4iIX9zyzkY3
   2r1e/BhOm67m9+0fcpFKMFBoo3a6G3PsVn8C8bY9t3OuOpmlnx0fzYcq+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392165216"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392165216"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8921123"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 01:50:13 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp7-0002LO-18;
	Fri, 24 Nov 2023 09:50:09 +0000
Date: Fri, 24 Nov 2023 17:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 2/56] fs/netfs/fscache_volume.c:514:29:
 error: variable has incomplete type 'const struct seq_operations'
Message-ID: <202311241351.4P6TFtCD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   43d25b256ce0f02be1a82781479564cf3133700f
commit: 4e8a69615a7f65699c2abba7ab261c9d8044d49a [2/56] netfs, fscache: Combine fscache with netfs
config: i386-randconfig-011-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241351.4P6TFtCD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241351.4P6TFtCD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241351.4P6TFtCD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/fscache_volume.c:477:3: error: call to undeclared function 'seq_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   seq_puts(m,
                   ^
>> fs/netfs/fscache_volume.c:484:2: error: call to undeclared function 'seq_printf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           seq_printf(m,
           ^
>> fs/netfs/fscache_volume.c:500:9: error: call to undeclared function 'seq_list_start_head'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_start_head(&fscache_volumes, *_pos);
                  ^
>> fs/netfs/fscache_volume.c:500:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_start_head(&fscache_volumes, *_pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_volume.c:505:9: error: call to undeclared function 'seq_list_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_next(v, &fscache_volumes, _pos);
                  ^
   fs/netfs/fscache_volume.c:505:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_next(v, &fscache_volumes, _pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_volume.c:514:29: error: variable has incomplete type 'const struct seq_operations'
   const struct seq_operations fscache_volumes_seq_ops = {
                               ^
   arch/x86/include/asm/processor.h:197:21: note: forward declaration of 'struct seq_operations'
   extern const struct seq_operations cpuinfo_op;
                       ^
   7 errors generated.
--
>> fs/netfs/fscache_cache.c:384:3: error: call to undeclared function 'seq_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   seq_puts(m,
                   ^
>> fs/netfs/fscache_cache.c:392:2: error: call to undeclared function 'seq_printf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           seq_printf(m,
           ^
>> fs/netfs/fscache_cache.c:408:9: error: call to undeclared function 'seq_list_start_head'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_start_head(&fscache_caches, *_pos);
                  ^
>> fs/netfs/fscache_cache.c:408:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_start_head(&fscache_caches, *_pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cache.c:413:9: error: call to undeclared function 'seq_list_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_next(v, &fscache_caches, _pos);
                  ^
   fs/netfs/fscache_cache.c:413:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_next(v, &fscache_caches, _pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cache.c:422:29: error: variable has incomplete type 'const struct seq_operations'
   const struct seq_operations fscache_caches_seq_ops = {
                               ^
   arch/x86/include/asm/processor.h:197:21: note: forward declaration of 'struct seq_operations'
   extern const struct seq_operations cpuinfo_op;
                       ^
   7 errors generated.
--
>> fs/netfs/fscache_cookie.c:1114:3: error: call to undeclared function 'seq_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   seq_puts(m,
                   ^
>> fs/netfs/fscache_cookie.c:1123:2: error: call to undeclared function 'seq_printf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           seq_printf(m,
           ^
   fs/netfs/fscache_cookie.c:1137:3: error: call to undeclared function 'seq_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   seq_puts(m, " ");
                   ^
   fs/netfs/fscache_cookie.c:1151:2: error: call to undeclared function 'seq_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           seq_puts(m, "\n");
           ^
>> fs/netfs/fscache_cookie.c:1159:9: error: call to undeclared function 'seq_list_start_head'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_start_head(&fscache_cookies, *_pos);
                  ^
>> fs/netfs/fscache_cookie.c:1159:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_start_head(&fscache_cookies, *_pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cookie.c:1164:9: error: call to undeclared function 'seq_list_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return seq_list_next(v, &fscache_cookies, _pos);
                  ^
   fs/netfs/fscache_cookie.c:1164:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
           return seq_list_next(v, &fscache_cookies, _pos);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/fscache_cookie.c:1174:29: error: variable has incomplete type 'const struct seq_operations'
   const struct seq_operations fscache_cookies_seq_ops = {
                               ^
   arch/x86/include/asm/processor.h:197:21: note: forward declaration of 'struct seq_operations'
   extern const struct seq_operations cpuinfo_op;
                       ^
   9 errors generated.


vim +514 fs/netfs/fscache_volume.c

bfa22da3ed652a fs/fscache/volume.c David Howells 2021-10-20  467  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  468  #ifdef CONFIG_PROC_FS
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  469  /*
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  470   * Generate a list of volumes in /proc/fs/fscache/volumes
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  471   */
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  472  static int fscache_volumes_seq_show(struct seq_file *m, void *v)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  473  {
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  474  	struct fscache_volume *volume;
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  475  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  476  	if (v == &fscache_volumes) {
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20 @477  		seq_puts(m,
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  478  			 "VOLUME   REF   nCOOK ACC FL CACHE           KEY\n"
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  479  			 "======== ===== ===== === == =============== ================\n");
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  480  		return 0;
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  481  	}
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  482  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  483  	volume = list_entry(v, struct fscache_volume, proc_link);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20 @484  	seq_printf(m,
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  485  		   "%08x %5d %5d %3d %02lx %-15.15s %s\n",
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  486  		   volume->debug_id,
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  487  		   refcount_read(&volume->ref),
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  488  		   atomic_read(&volume->n_cookies),
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  489  		   atomic_read(&volume->n_accesses),
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  490  		   volume->flags,
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  491  		   volume->cache->name ?: "-",
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  492  		   volume->key + 1);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  493  	return 0;
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  494  }
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  495  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  496  static void *fscache_volumes_seq_start(struct seq_file *m, loff_t *_pos)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  497  	__acquires(&fscache_addremove_sem)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  498  {
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  499  	down_read(&fscache_addremove_sem);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20 @500  	return seq_list_start_head(&fscache_volumes, *_pos);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  501  }
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  502  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  503  static void *fscache_volumes_seq_next(struct seq_file *m, void *v, loff_t *_pos)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  504  {
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20 @505  	return seq_list_next(v, &fscache_volumes, _pos);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  506  }
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  507  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  508  static void fscache_volumes_seq_stop(struct seq_file *m, void *v)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  509  	__releases(&fscache_addremove_sem)
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  510  {
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  511  	up_read(&fscache_addremove_sem);
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  512  }
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20  513  
62ab63352350e8 fs/fscache/volume.c David Howells 2021-10-20 @514  const struct seq_operations fscache_volumes_seq_ops = {

:::::: The code at line 514 was first introduced by commit
:::::: 62ab63352350e881ae693a8236b35d7d0516c78b fscache: Implement volume registration

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
