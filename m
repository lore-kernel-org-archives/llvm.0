Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2D17E9;
	Wed, 16 Aug 2023 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692218694; x=1723754694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPslW/HNWH9eI1AfAvevF8LteycAnpGJKbGeJQfE3/8=;
  b=fc0IH+jb5d3DNBJfsGL91eXI7iiHepJFuWH+likCWizmuGnozrJIxIRD
   AonutYND9APZmOMDudLLlyjSVNwLGkey3jWPocSv0K9cJQKi1CThAFeWP
   HLTxaxo/kg5pDb9P0yCAjRqqvKUArAw6itfkFcskiyj465U6rvPLYmdWe
   u3Ev0X7zAOCSXDabT97fl0OzHUMoc9gJ5/OJJFa8rB9SfHobLKgL7jJn8
   a+rCsc75jk+uMbWDNtWdUMDCQLfu/HaHGjTY0rqEKM5UHTjBsTnO421cP
   BcRUo3XJZtR/L5EXJ76tXIOjxuLIDauYkceG3przOx+E1k4yyRrF32qvT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370105467"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="370105467"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 13:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711250388"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="711250388"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Aug 2023 13:44:52 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWNNr-0000Yn-1U;
	Wed, 16 Aug 2023 20:44:51 +0000
Date: Thu, 17 Aug 2023 04:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] fs: create kiocb_{start,end}_write() helpers
Message-ID: <202308170438.vkJT5HEj-lkp@intel.com>
References: <20230816085439.894112-1-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816085439.894112-1-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on mszeredi-vfs/overlayfs-next jack-fs/for_next linus/master]
[cannot apply to vfs-idmapping/for-next mszeredi-vfs/next next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-create-kiocb_-start-end-_write-helpers/20230816-165807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20230816085439.894112-1-amir73il%40gmail.com
patch subject: [PATCH v2] fs: create kiocb_{start,end}_write() helpers
config: riscv-randconfig-r042-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170438.vkJT5HEj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170438.vkJT5HEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170438.vkJT5HEj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/cachefiles/io.c:14:
   In file included from include/trace/events/fscache.h:13:
   In file included from include/linux/fscache.h:18:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/cachefiles/io.c:14:
   In file included from include/trace/events/fscache.h:13:
   In file included from include/linux/fscache.h:18:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/cachefiles/io.c:14:
   In file included from include/trace/events/fscache.h:13:
   In file included from include/linux/fscache.h:18:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/cachefiles/io.c:14:
   In file included from include/trace/events/fscache.h:13:
   In file included from include/linux/fscache.h:18:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/cachefiles/io.c:14:
   In file included from include/trace/events/fscache.h:13:
   In file included from include/linux/fscache.h:18:
   In file included from include/linux/netfs.h:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/cachefiles/io.c:322:20: error: incompatible pointer types passing 'struct cachefiles_kiocb *' to parameter of type 'struct kiocb *' [-Werror,-Wincompatible-pointer-types]
     322 |         kiocb_start_write(ki);
         |                           ^~
   include/linux/fs.h:2673:52: note: passing argument to parameter 'iocb' here
    2673 | static inline void kiocb_start_write(struct kiocb *iocb)
         |                                                    ^
   13 warnings and 1 error generated.


vim +322 fs/cachefiles/io.c

   274	
   275	/*
   276	 * Initiate a write to the cache.
   277	 */
   278	int __cachefiles_write(struct cachefiles_object *object,
   279			       struct file *file,
   280			       loff_t start_pos,
   281			       struct iov_iter *iter,
   282			       netfs_io_terminated_t term_func,
   283			       void *term_func_priv)
   284	{
   285		struct cachefiles_cache *cache;
   286		struct cachefiles_kiocb *ki;
   287		unsigned int old_nofs;
   288		ssize_t ret;
   289		size_t len = iov_iter_count(iter);
   290	
   291		fscache_count_write();
   292		cache = object->volume->cache;
   293	
   294		_enter("%pD,%li,%llx,%zx/%llx",
   295		       file, file_inode(file)->i_ino, start_pos, len,
   296		       i_size_read(file_inode(file)));
   297	
   298		ki = kzalloc(sizeof(struct cachefiles_kiocb), GFP_KERNEL);
   299		if (!ki) {
   300			if (term_func)
   301				term_func(term_func_priv, -ENOMEM, false);
   302			return -ENOMEM;
   303		}
   304	
   305		refcount_set(&ki->ki_refcnt, 2);
   306		ki->iocb.ki_filp	= file;
   307		ki->iocb.ki_pos		= start_pos;
   308		ki->iocb.ki_flags	= IOCB_DIRECT | IOCB_WRITE;
   309		ki->iocb.ki_ioprio	= get_current_ioprio();
   310		ki->object		= object;
   311		ki->start		= start_pos;
   312		ki->len			= len;
   313		ki->term_func		= term_func;
   314		ki->term_func_priv	= term_func_priv;
   315		ki->was_async		= true;
   316		ki->b_writing		= (len + (1 << cache->bshift) - 1) >> cache->bshift;
   317	
   318		if (ki->term_func)
   319			ki->iocb.ki_complete = cachefiles_write_complete;
   320		atomic_long_add(ki->b_writing, &cache->b_writing);
   321	
 > 322		kiocb_start_write(ki);
   323	
   324		get_file(ki->iocb.ki_filp);
   325		cachefiles_grab_object(object, cachefiles_obj_get_ioreq);
   326	
   327		trace_cachefiles_write(object, file_inode(file), ki->iocb.ki_pos, len);
   328		old_nofs = memalloc_nofs_save();
   329		ret = cachefiles_inject_write_error();
   330		if (ret == 0)
   331			ret = vfs_iocb_iter_write(file, &ki->iocb, iter);
   332		memalloc_nofs_restore(old_nofs);
   333		switch (ret) {
   334		case -EIOCBQUEUED:
   335			goto in_progress;
   336	
   337		case -ERESTARTSYS:
   338		case -ERESTARTNOINTR:
   339		case -ERESTARTNOHAND:
   340		case -ERESTART_RESTARTBLOCK:
   341			/* There's no easy way to restart the syscall since other AIO's
   342			 * may be already running. Just fail this IO with EINTR.
   343			 */
   344			ret = -EINTR;
   345			fallthrough;
   346		default:
   347			ki->was_async = false;
   348			cachefiles_write_complete(&ki->iocb, ret);
   349			if (ret > 0)
   350				ret = 0;
   351			break;
   352		}
   353	
   354	in_progress:
   355		cachefiles_put_kiocb(ki);
   356		_leave(" = %zd", ret);
   357		return ret;
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
