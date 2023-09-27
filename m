Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A51C684;
	Wed, 27 Sep 2023 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695805300; x=1727341300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cr5MCYb9m/L70OxZzhQMj2W1fq59DqJYRBk+aXlzeS4=;
  b=fSTZFuX9/k8xwQ3tWCoCWqCo8jBYAbgdTd4f3NYedFF6bqY1cW6qkzJ/
   ijvJLuFQJijonXQlfKR6qqhkKe+Cgi54jgUb60VPVQimU9kTcwTcjBcB1
   6BXwc440yr8Tbuc5UM44iJtBQJx2CtyPjJ9bkApEug3qz5Z7GuV0RDC0m
   4Kcq1LWGZXYTLaR1+a2/ZNBtwi3skzAnotcjMcJkd7jp3E5E9AX7NeZ1f
   ynP3ut8qlwAg7EHjj8BtzWzTFKQlfSnltvKG3ojKw+ETdFjCjNi9JJRlu
   6ilP/Be1kdhr+LpTHmp2yMvpmrLZe7Kbi5NRUACkNOAM4Xj0uRM3EjGD4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366834172"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="366834172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752490258"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="752490258"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2023 02:01:38 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlQQ4-0003wI-1W;
	Wed, 27 Sep 2023 09:01:23 +0000
Date: Wed, 27 Sep 2023 17:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 15/15]
 fs/ext2/dir.c:440:26: warning: no previous prototype for function
 'ext2_find_entry_old'
Message-ID: <202309271615.haGzZ2k6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2_dir_buffer_cache_rfc_wip1
head:   3b878bc4805dd97f67ee17c6450059a4a7f2b261
commit: 3b878bc4805dd97f67ee17c6450059a4a7f2b261 [15/15] ext2: everything else to make it work
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230927/202309271615.haGzZ2k6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271615.haGzZ2k6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271615.haGzZ2k6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/dir.c:440:26: warning: no previous prototype for function 'ext2_find_entry_old' [-Wmissing-prototypes]
   struct ext2_dir_entry_2 *ext2_find_entry_old (struct inode *dir,
                            ^
   fs/ext2/dir.c:440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct ext2_dir_entry_2 *ext2_find_entry_old (struct inode *dir,
   ^
   static 
   fs/ext2/dir.c:818:15: warning: unused variable 'chunksize' [-Wunused-variable]
           unsigned int chunksize = ext2_chunk_size(dir);
                        ^
   fs/ext2/dir.c:84:13: warning: unused function 'ext2_commit_chunk' [-Wunused-function]
   static void ext2_commit_chunk(struct page *page, loff_t pos, unsigned len)
               ^
   fs/ext2/dir.c:236:1: warning: unused function 'ext2_validate_entry' [-Wunused-function]
   ext2_validate_entry(char *base, unsigned offset, unsigned mask)
   ^
   fs/ext2/dir.c:549:12: warning: unused function 'ext2_prepare_chunk' [-Wunused-function]
   static int ext2_prepare_chunk(struct page *page, loff_t pos, unsigned len)
              ^
   fs/ext2/dir.c:555:12: warning: unused function 'ext2_handle_dirsync' [-Wunused-function]
   static int ext2_handle_dirsync(struct inode *dir)
              ^
   6 warnings generated.


vim +/ext2_find_entry_old +440 fs/ext2/dir.c

   423	
   424	/*
   425	 *	ext2_find_entry()
   426	 *
   427	 * finds an entry in the specified directory with the wanted name. It
   428	 * returns the page in which the entry was found (as a parameter - res_page),
   429	 * and the entry itself. Page is returned mapped and unlocked.
   430	 * Entry is guaranteed to be valid.
   431	 *
   432	 * On Success ext2_put_page() should be called on *res_page.
   433	 *
   434	 * NOTE: Calls to ext2_get_page()/ext2_put_page() must be nested according to
   435	 * the rules documented in kmap_local_page()/kunmap_local().
   436	 *
   437	 * ext2_find_entry() and ext2_dotdot() act as a call to ext2_get_page() and
   438	 * should be treated as a call to ext2_get_page() for nesting purposes.
   439	 */
 > 440	struct ext2_dir_entry_2 *ext2_find_entry_old (struct inode *dir,
   441				const struct qstr *child, struct page **res_page)
   442	{
   443		const char *name = child->name;
   444		int namelen = child->len;
   445		unsigned reclen = EXT2_DIR_REC_LEN(namelen);
   446		unsigned long start, n;
   447		unsigned long npages = dir_pages(dir);
   448		struct page *page = NULL;
   449		struct ext2_inode_info *ei = EXT2_I(dir);
   450		ext2_dirent * de;
   451	
   452		if (npages == 0)
   453			goto out;
   454	
   455		/* OFFSET_CACHE */
   456		*res_page = NULL;
   457	
   458		start = ei->i_dir_start_lookup;
   459		if (start >= npages)
   460			start = 0;
   461		n = start;
   462		do {
   463			char *kaddr = ext2_get_page(dir, n, 0, &page);
   464			if (IS_ERR(kaddr))
   465				return ERR_CAST(kaddr);
   466	
   467			de = (ext2_dirent *) kaddr;
   468			kaddr += ext2_last_byte(dir, n) - reclen;
   469			while ((char *) de <= kaddr) {
   470				if (de->rec_len == 0) {
   471					ext2_error(dir->i_sb, __func__,
   472						"zero-length directory entry");
   473					ext2_put_page(page, de);
   474					goto out;
   475				}
   476				if (ext2_match(namelen, name, de))
   477					goto found;
   478				de = ext2_next_entry(de);
   479			}
   480			ext2_put_page(page, kaddr);
   481	
   482			if (++n >= npages)
   483				n = 0;
   484			/* next page is past the blocks we've got */
   485			if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
   486				ext2_error(dir->i_sb, __func__,
   487					"dir %lu size %lld exceeds block count %llu",
   488					dir->i_ino, dir->i_size,
   489					(unsigned long long)dir->i_blocks);
   490				goto out;
   491			}
   492		} while (n != start);
   493	out:
   494		return ERR_PTR(-ENOENT);
   495	
   496	found:
   497		*res_page = page;
   498		ei->i_dir_start_lookup = n;
   499		return de;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
