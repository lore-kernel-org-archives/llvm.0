Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D2B10796;
	Fri, 30 Jun 2023 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688129611; x=1719665611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzENdzmRwZNpVaqEWzMmDLP8Z3ycyRJH+ZHfqR0TqbQ=;
  b=U1xZTVFWT2HzphqBsJA9dXkZxm7NaKJi/M/N93diLOjNniPTMKVHEqsv
   Kpjp6BQEfKsQD5GhHtfymqTkUl8AJ52BcwFpSuoycofb4AeYfPkRA463v
   1yZT3VwollUNSC3tKW24V+nXpQ/4QPa9J+KsUyY5hETIao2Ne4r4vhHGx
   DaPgS50iGcUVrRRpZZTYKW0BB3Ml8Ki14ywSnD3/GoRlXJhqtsi4YOg6/
   t06oGxos9zMjpNTIPf1EdtWskArBM9tzmuSGkizIpd0x18jFRCZ5q/1mh
   rV2thHhzzPIjd8tSqX52wpbuLqBvQRdshyrvrzp76FTgUxdNt/+NeWa/w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="393112184"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="393112184"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="720949145"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="720949145"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 05:53:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFDcr-000EyG-38;
	Fri, 30 Jun 2023 12:53:25 +0000
Date: Fri, 30 Jun 2023 20:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 17/20] fs/nfs/direct.c:833:7: error: call
 to undeclared function 'iov_iter_extract_mode'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202306302024.pxF1j60X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: 9b9620b5c075475d9da8e6e6a03f00bd5d2147fe [17/20] nfs: Pin pages rather than ref'ing if appropriate
config: riscv-randconfig-r042-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302024.pxF1j60X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302024.pxF1j60X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302024.pxF1j60X-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     743 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/nfs/direct.c:46:
   In file included from include/linux/pagemap.h:11:
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
   In file included from fs/nfs/direct.c:46:
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
   In file included from fs/nfs/direct.c:46:
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
   In file included from fs/nfs/direct.c:46:
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
   In file included from fs/nfs/direct.c:46:
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
   In file included from fs/nfs/direct.c:46:
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
   fs/nfs/direct.c:339:7: error: use of undeclared identifier 'WRITE_TO_ITER'
     339 |                                                 WRITE_TO_ITER, &pgbase);
         |                                                 ^
   fs/nfs/direct.c:797:7: error: use of undeclared identifier 'READ_FROM_ITER'
     797 |                                                 READ_FROM_ITER, &pgbase);
         |                                                 ^
>> fs/nfs/direct.c:833:7: error: call to undeclared function 'iov_iter_extract_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     833 |                                          iov_iter_extract_mode(iter, FOLL_SOURCE_BUF));
         |                                          ^
   fs/nfs/direct.c:833:7: note: did you mean 'iov_iter_extract_pages'?
   include/linux/uio.h:385:9: note: 'iov_iter_extract_pages' declared here
     385 | ssize_t iov_iter_extract_pages(struct iov_iter *i, struct page ***pages,
         |         ^
   fs/nfs/direct.c:833:35: error: use of undeclared identifier 'FOLL_SOURCE_BUF'
     833 |                                          iov_iter_extract_mode(iter, FOLL_SOURCE_BUF));
         |                                                                      ^
   13 warnings and 4 errors generated.


vim +/iov_iter_extract_mode +833 fs/nfs/direct.c

   758	
   759	
   760	/*
   761	 * NB: Return the value of the first error return code.  Subsequent
   762	 *     errors after the first one are ignored.
   763	 */
   764	/*
   765	 * For each wsize'd chunk of the user's buffer, dispatch an NFS WRITE
   766	 * operation.  If nfs_writedata_alloc() or get_user_pages() fails,
   767	 * bail and stop sending more writes.  Write length accounting is
   768	 * handled automatically by nfs_direct_write_result().  Otherwise, if
   769	 * no requests have been sent, just return an error.
   770	 */
   771	static ssize_t nfs_direct_write_schedule_iovec(struct nfs_direct_req *dreq,
   772						       struct iov_iter *iter,
   773						       loff_t pos, int ioflags)
   774	{
   775		struct nfs_pageio_descriptor desc;
   776		struct inode *inode = dreq->inode;
   777		ssize_t result = 0;
   778		size_t requested_bytes = 0;
   779		size_t wsize = max_t(size_t, NFS_SERVER(inode)->wsize, PAGE_SIZE);
   780	
   781		trace_nfs_direct_write_schedule_iovec(dreq);
   782	
   783		nfs_pageio_init_write(&desc, inode, ioflags, false,
   784				      &nfs_direct_write_completion_ops);
   785		desc.pg_dreq = dreq;
   786		get_dreq(dreq);
   787		inode_dio_begin(inode);
   788	
   789		NFS_I(inode)->write_io += iov_iter_count(iter);
   790		while (iov_iter_count(iter)) {
   791			struct page **pagevec = NULL;
   792			size_t bytes;
   793			size_t pgbase;
   794			unsigned npages, i;
   795	
   796			result = iov_iter_extract_pages(iter, &pagevec, wsize, INT_MAX,
   797							READ_FROM_ITER, &pgbase);
   798			if (result < 0)
   799				break;
   800	
   801			bytes = result;
   802			npages = (result + pgbase + PAGE_SIZE - 1) / PAGE_SIZE;
   803			for (i = 0; i < npages; i++) {
   804				struct nfs_page *req;
   805				unsigned int req_len = min_t(size_t, bytes, PAGE_SIZE - pgbase);
   806	
   807				req = nfs_page_create_from_page(dreq->ctx, pagevec[i],
   808								pgbase, pos, req_len);
   809				if (IS_ERR(req)) {
   810					result = PTR_ERR(req);
   811					break;
   812				}
   813	
   814				if (desc.pg_error < 0) {
   815					nfs_free_request(req);
   816					result = desc.pg_error;
   817					break;
   818				}
   819	
   820				nfs_lock_request(req);
   821				if (!nfs_pageio_add_request(&desc, req)) {
   822					result = desc.pg_error;
   823					nfs_unlock_and_release_request(req);
   824					break;
   825				}
   826				pgbase = 0;
   827				bytes -= req_len;
   828				requested_bytes += req_len;
   829				pos += req_len;
   830				dreq->bytes_left -= req_len;
   831			}
   832			nfs_direct_release_pages(pagevec, npages,
 > 833						 iov_iter_extract_mode(iter, FOLL_SOURCE_BUF));
   834			kvfree(pagevec);
   835			if (result < 0)
   836				break;
   837		}
   838		nfs_pageio_complete(&desc);
   839	
   840		/*
   841		 * If no bytes were started, return the error, and let the
   842		 * generic layer handle the completion.
   843		 */
   844		if (requested_bytes == 0) {
   845			inode_dio_end(inode);
   846			nfs_direct_req_release(dreq);
   847			return result < 0 ? result : -EIO;
   848		}
   849	
   850		if (put_dreq(dreq))
   851			nfs_direct_write_complete(dreq);
   852		return requested_bytes;
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
