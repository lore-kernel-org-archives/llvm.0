Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79DA2C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 20:16:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301060044"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="301060044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 12:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="611817166"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2021 12:16:12 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mugsm-000MvV-3D; Tue, 07 Dec 2021 20:16:12 +0000
Date: Wed, 8 Dec 2021 04:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3583/5418] fs/cachefiles/io.c:487:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202112080416.rR3SWLwT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   04fe99a8d936d46a310ca61b8b63dc270962bf01
commit: 0443b01eccbb2c6eb9c3b497b6b576b024010c91 [3583/5418] cachefiles: Implement the I/O routines
config: hexagon-randconfig-r045-20211207 (https://download.01.org/0day-ci/archive/20211208/202112080416.rR3SWLwT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0443b01eccbb2c6eb9c3b497b6b576b024010c91
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0443b01eccbb2c6eb9c3b497b6b576b024010c91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cachefiles/io.c:487:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (pos == 0)
               ^~~~~~~~
   fs/cachefiles/io.c:490:6: note: uninitialized use occurs here
           if (ret < 0) {
               ^~~
   fs/cachefiles/io.c:487:2: note: remove the 'if' if its condition is always true
           if (pos == 0)
           ^~~~~~~~~~~~~
   fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +487 fs/cachefiles/io.c

   427	
   428	/*
   429	 * Prepare for a write to occur.
   430	 */
   431	static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
   432					      loff_t *_start, size_t *_len, loff_t i_size,
   433					      bool no_space_allocated_yet)
   434	{
   435		struct cachefiles_object *object = cachefiles_cres_object(cres);
   436		struct cachefiles_cache *cache = object->volume->cache;
   437		struct file *file = cachefiles_cres_file(cres);
   438		loff_t start = *_start, pos;
   439		size_t len = *_len, down;
   440		int ret;
   441	
   442		/* Round to DIO size */
   443		down = start - round_down(start, PAGE_SIZE);
   444		*_start = start - down;
   445		*_len = round_up(down + len, PAGE_SIZE);
   446	
   447		/* We need to work out whether there's sufficient disk space to perform
   448		 * the write - but we can skip that check if we have space already
   449		 * allocated.
   450		 */
   451		if (no_space_allocated_yet)
   452			goto check_space;
   453	
   454		pos = cachefiles_inject_read_error();
   455		if (pos == 0)
   456			pos = vfs_llseek(file, *_start, SEEK_DATA);
   457		if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
   458			if (pos == -ENXIO)
   459				goto check_space; /* Unallocated tail */
   460			trace_cachefiles_io_error(object, file_inode(file), pos,
   461						  cachefiles_trace_seek_error);
   462			return pos;
   463		}
   464		if ((u64)pos >= (u64)*_start + *_len)
   465			goto check_space; /* Unallocated region */
   466	
   467		/* We have a block that's at least partially filled - if we're low on
   468		 * space, we need to see if it's fully allocated.  If it's not, we may
   469		 * want to cull it.
   470		 */
   471		if (cachefiles_has_space(cache, 0, *_len / PAGE_SIZE) == 0)
   472			return 0; /* Enough space to simply overwrite the whole block */
   473	
   474		pos = cachefiles_inject_read_error();
   475		if (pos == 0)
   476			pos = vfs_llseek(file, *_start, SEEK_HOLE);
   477		if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
   478			trace_cachefiles_io_error(object, file_inode(file), pos,
   479						  cachefiles_trace_seek_error);
   480			return pos;
   481		}
   482		if ((u64)pos >= (u64)*_start + *_len)
   483			return 0; /* Fully allocated */
   484	
   485		/* Partially allocated, but insufficient space: cull. */
   486		pos = cachefiles_inject_remove_error();
 > 487		if (pos == 0)
   488			ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
   489					    *_start, *_len);
   490		if (ret < 0) {
   491			trace_cachefiles_io_error(object, file_inode(file), ret,
   492						  cachefiles_trace_fallocate_error);
   493			cachefiles_io_error_obj(object,
   494						"CacheFiles: fallocate failed (%d)\n", ret);
   495			ret = -EIO;
   496		}
   497	
   498		return ret;
   499	
   500	check_space:
   501		return cachefiles_has_space(cache, 0, *_len / PAGE_SIZE);
   502	}
   503	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
