Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383191FA1
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647335961; x=1678871961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOFcMha9lGU6SAQcFxJpsmFvzoA1gfVUel4ZN309wsE=;
  b=TbNN5538LTI4gbjg9yixtht+qoXJxsRnpWdSZnCoOOHv4wSDRU3bJSti
   c8Y6P6YK0UDY3OmwTPNhS+zVBq1X4wQFf7xGkJPMvvwawzsC2m1shXrv/
   8PXHWVMHK/Lp9to5CfM02SpspCgv4+mxAvGSbSN+0xgYztuBff1JA2DA0
   dh5dCsYfESc9WO4ay4fy/IbrGaITNCNLJdNqw2cbokty2hoOZaUtuUJXr
   IxbsSJLmqyxaRYyfP0WKhaw9W6dEq+a/J2C6z9OJmFEgEqicV4aQcCI1u
   MO3rrApswUM4IH+depBxsFDA7R25dz8rdDheofOSYWd6iTZhR2vbUR4xH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238421143"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="238421143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 02:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="646153947"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2022 02:19:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU3Ko-000An0-OH; Tue, 15 Mar 2022 09:19:18 +0000
Date: Tue, 15 Mar 2022 17:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [willy-pagecache:for-next 131/179] mm/readahead.c:54:3: error:
 implicit declaration of function 'do_invalidatepage'
Message-ID: <202203151757.XY2I8yuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.infradead.org/users/willy/pagecache for-next
head:   af564d7369d44fbbe697a5f631fe3bba5ebecd59
commit: f1fdabbaae8eb5c9a95a3747065a40297e7d2736 [131/179] fs: Turn do_invalidatepage() into folio_invalidate()
config: arm-cns3420vb_defconfig (https://download.01.org/0day-ci/archive/20220315/202203151757.XY2I8yuS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add willy-pagecache git://git.infradead.org/users/willy/pagecache
        git fetch --no-tags willy-pagecache for-next
        git checkout f1fdabbaae8eb5c9a95a3747065a40297e7d2736
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/readahead.c:54:3: error: implicit declaration of function 'do_invalidatepage' [-Werror,-Wimplicit-function-declaration]
                   do_invalidatepage(page, 0, PAGE_SIZE);
                   ^
   mm/readahead.c:54:3: note: did you mean 'noop_invalidatepage'?
   include/linux/fs.h:3325:13: note: 'noop_invalidatepage' declared here
   extern void noop_invalidatepage(struct page *page, unsigned int offset,
               ^
   1 error generated.


vim +/do_invalidatepage +54 mm/readahead.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  39  
03fb3d2af96c27 David Howells      2009-04-03  40  /*
03fb3d2af96c27 David Howells      2009-04-03  41   * see if a page needs releasing upon read_cache_pages() failure
266cf658efcf6a David Howells      2009-04-03  42   * - the caller of read_cache_pages() may have set PG_private or PG_fscache
266cf658efcf6a David Howells      2009-04-03  43   *   before calling, such as the NFS fs marking pages that are cached locally
266cf658efcf6a David Howells      2009-04-03  44   *   on disk, thus we need to give the fs a chance to clean up in the event of
266cf658efcf6a David Howells      2009-04-03  45   *   an error
03fb3d2af96c27 David Howells      2009-04-03  46   */
03fb3d2af96c27 David Howells      2009-04-03  47  static void read_cache_pages_invalidate_page(struct address_space *mapping,
03fb3d2af96c27 David Howells      2009-04-03  48  					     struct page *page)
03fb3d2af96c27 David Howells      2009-04-03  49  {
266cf658efcf6a David Howells      2009-04-03  50  	if (page_has_private(page)) {
03fb3d2af96c27 David Howells      2009-04-03  51  		if (!trylock_page(page))
03fb3d2af96c27 David Howells      2009-04-03  52  			BUG();
03fb3d2af96c27 David Howells      2009-04-03  53  		page->mapping = mapping;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01 @54  		do_invalidatepage(page, 0, PAGE_SIZE);
03fb3d2af96c27 David Howells      2009-04-03  55  		page->mapping = NULL;
03fb3d2af96c27 David Howells      2009-04-03  56  		unlock_page(page);
03fb3d2af96c27 David Howells      2009-04-03  57  	}
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  58  	put_page(page);
03fb3d2af96c27 David Howells      2009-04-03  59  }
03fb3d2af96c27 David Howells      2009-04-03  60  

:::::: The code at line 54 was first introduced by commit
:::::: 09cbfeaf1a5a67bfb3201e0c83c810cecb2efa5a mm, fs: get rid of PAGE_CACHE_* and page_cache_{get,release} macros

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
