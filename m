Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CF3C22;
	Mon,  8 May 2023 02:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683513816; x=1715049816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Fz74lVRzS8OUYSBdDkkwQqGuqJ3PvcJ6M3FSY8hr+k=;
  b=Tm49UQipn1gplScPu3bIYrtOFZFKVjPhvh/VdCewK7KlX5cw+YPIje+p
   HqgpZ0njmOYGibGVycEA1E3/Z8YfKZ2mSuD0UZwG2E1EdJme8PhPcC+6d
   LAAV4vGr+pzYLs2oncVi+jLFSNWSvkCojOYU3lb1u1SwwTH0U1/UAdwz6
   BWlzhrXt+La5E7/XmK38bax0gMLprly504BtTy1alMOuv0Q79B8U6SWjl
   DEPNIRexU8ELrEA7CXBNnk3O3n9TwYDrfhclh8JiBBVGmxWael2wz5G9t
   Ux544TS0xvj5z8DLIpiN47DWmWEzCzU4zXz9YngyVrh5ancRvdMTgCDMQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="351704439"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="351704439"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 19:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="701255436"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="701255436"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 May 2023 19:43:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvqqa-0000xp-0P;
	Mon, 08 May 2023 02:43:32 +0000
Date: Mon, 8 May 2023 10:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv5 2/5] iomap: Refactor iop_set_range_uptodate() function
Message-ID: <202305080949.grIeocG0-lkp@intel.com>
References: <203a9e25873f6c94c9de89823439aa1f6a7dc714.1683485700.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203a9e25873f6c94c9de89823439aa1f6a7dc714.1683485700.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on gfs2/for-next linus/master v6.4-rc1 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/203a9e25873f6c94c9de89823439aa1f6a7dc714.1683485700.git.ritesh.list%40gmail.com
patch subject: [RFCv5 2/5] iomap: Refactor iop_set_range_uptodate() function
config: i386-randconfig-a001-20230508 (https://download.01.org/0day-ci/archive/20230508/202305080949.grIeocG0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9f4d2751ba6c4b9022e0361ce14274eb156cf39b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
        git checkout 9f4d2751ba6c4b9022e0361ce14274eb156cf39b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080949.grIeocG0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:215:21: warning: variable 'iop' set but not used [-Wunused-but-set-variable]
           struct iomap_page *iop;
                              ^
   1 warning generated.


vim +/iop +215 fs/iomap/buffered-io.c

afc51aaa22f26c Darrick J. Wong         2019-07-15  202  
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  203  /**
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  204   * iomap_read_inline_data - copy inline data into the page cache
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  205   * @iter: iteration structure
874628a2c59003 Matthew Wilcox (Oracle  2021-07-23  206)  * @folio: folio to copy to
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  207   *
874628a2c59003 Matthew Wilcox (Oracle  2021-07-23  208)  * Copy the inline data in @iter into @folio and zero out the rest of the folio.
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  209   * Only a single IOMAP_INLINE extent is allowed at the end of each file.
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  210   * Returns zero for success to complete the read, or the usual negative errno.
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  211   */
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  212  static int iomap_read_inline_data(const struct iomap_iter *iter,
874628a2c59003 Matthew Wilcox (Oracle  2021-07-23  213) 		struct folio *folio)
afc51aaa22f26c Darrick J. Wong         2019-07-15  214  {
cd1e5afe5503ed Matthew Wilcox (Oracle  2021-04-28 @215) 	struct iomap_page *iop;
fad0a1ab34f777 Christoph Hellwig       2021-08-10  216  	const struct iomap *iomap = iomap_iter_srcmap(iter);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  217  	size_t size = i_size_read(iter->inode) - iomap->offset;
b405435b419cb6 Matthew Wilcox (Oracle  2021-08-02  218) 	size_t poff = offset_in_page(iomap->offset);
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  219) 	size_t offset = offset_in_folio(folio, iomap->offset);
afc51aaa22f26c Darrick J. Wong         2019-07-15  220  	void *addr;
afc51aaa22f26c Darrick J. Wong         2019-07-15  221  
874628a2c59003 Matthew Wilcox (Oracle  2021-07-23  222) 	if (folio_test_uptodate(folio))
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  223  		return 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  224  
ae44f9c286da3f Matthew Wilcox (Oracle  2021-08-04  225) 	if (WARN_ON_ONCE(size > PAGE_SIZE - poff))
ae44f9c286da3f Matthew Wilcox (Oracle  2021-08-04  226) 		return -EIO;
69f4a26c1e0c7c Gao Xiang               2021-08-03  227  	if (WARN_ON_ONCE(size > PAGE_SIZE -
69f4a26c1e0c7c Gao Xiang               2021-08-03  228  			 offset_in_page(iomap->inline_data)))
69f4a26c1e0c7c Gao Xiang               2021-08-03  229  		return -EIO;
69f4a26c1e0c7c Gao Xiang               2021-08-03  230  	if (WARN_ON_ONCE(size > iomap->length))
69f4a26c1e0c7c Gao Xiang               2021-08-03  231  		return -EIO;
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  232) 	if (offset > 0)
bd964cc84262c6 Ritesh Harjani (IBM     2023-05-08  233) 		iop = iop_alloc(iter->inode, folio, iter->flags);
cd1e5afe5503ed Matthew Wilcox (Oracle  2021-04-28  234) 	else
cd1e5afe5503ed Matthew Wilcox (Oracle  2021-04-28  235) 		iop = to_iomap_page(folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  236  
874628a2c59003 Matthew Wilcox (Oracle  2021-07-23  237) 	addr = kmap_local_folio(folio, offset);
afc51aaa22f26c Darrick J. Wong         2019-07-15  238  	memcpy(addr, iomap->inline_data, size);
b405435b419cb6 Matthew Wilcox (Oracle  2021-08-02  239) 	memset(addr + size, 0, PAGE_SIZE - poff - size);
ab069d5fdcd145 Matthew Wilcox (Oracle  2021-08-04  240) 	kunmap_local(addr);
9f4d2751ba6c4b Ritesh Harjani (IBM     2023-05-08  241) 	iop_set_range_uptodate(iter->inode, folio, offset, PAGE_SIZE - poff);
5ad448ce2976f8 Andreas Gruenbacher     2021-11-24  242  	return 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  243  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
