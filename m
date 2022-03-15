Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447471FB8
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647342749; x=1678878749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKFgjfudXHmL9h7/gvou1SgAx5x1ypUkfwPHc05EsB4=;
  b=Vw42+ssp5GGXcHxS6cG/pQKjQrAiUGaCKcqwkz77mTTu/UPhDM6DvLeF
   NFmIvyrdcfXF4eChMJlzlMDHJcxFP8QdHeTbfP/+w+8VSeW12SX0x13yE
   tz1HT2O2KMfU/pW0Xeaz314kvNE43+gj/tveKPIlJue/2M6c9+F4U7QqH
   n2XAZWi10Kh7f3jSnaktEc5I+4Ig0g6Qtvl/vOqhWYyvOqRkxzL5fuRo/
   cFssCwmRNWkXHS1zf+/2YK6nNMg74sn15+JxMkQyCxMz8Ode4k5Dw3S6r
   nHDifw2j3Agw6NMRvS/WzrpKReGld81FprE/Qy3T2gjGWd+AF5dVx4OiK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="253832241"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="253832241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 04:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="634549010"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2022 04:12:27 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU56I-000AtF-QY; Tue, 15 Mar 2022 11:12:26 +0000
Date: Tue, 15 Mar 2022 19:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [willy-pagecache:for-next 174/179] fs/nilfs2/inode.c:227:13:
 warning: variable 'nr_dirty' is used uninitialized whenever 'if' condition
 is false
Message-ID: <202203151941.WVgUZDhE-lkp@intel.com>
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
commit: 248cfe55743b4293f9fa06384e35581121d60ee1 [174/179] nilfs: Convert nilfs_set_page_dirty() to nilfs_dirty_folio()
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220315/202203151941.WVgUZDhE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add willy-pagecache git://git.infradead.org/users/willy/pagecache
        git fetch --no-tags willy-pagecache for-next
        git checkout 248cfe55743b4293f9fa06384e35581121d60ee1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nilfs2/ mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nilfs2/inode.c:227:13: warning: variable 'nr_dirty' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (ret) {
                      ^~~
   fs/nilfs2/inode.c:232:6: note: uninitialized use occurs here
           if (nr_dirty)
               ^~~~~~~~
   fs/nilfs2/inode.c:227:9: note: remove the 'if' if its condition is always true
           } else if (ret) {
                  ^~~~~~~~~
   fs/nilfs2/inode.c:207:23: note: initialize the variable 'nr_dirty' to silence this warning
           unsigned int nr_dirty;
                                ^
                                 = 0
   1 warning generated.


vim +227 fs/nilfs2/inode.c

05fe58fdc10df9e Ryusuke Konishi         2009-04-06  201  
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  202) static bool nilfs_dirty_folio(struct address_space *mapping,
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  203) 		struct folio *folio)
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  204  {
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  205) 	struct inode *inode = mapping->host;
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  206) 	struct buffer_head *head;
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  207) 	unsigned int nr_dirty;
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  208) 	bool ret = filemap_dirty_folio(mapping, folio);
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  209  
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  210  	/*
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  211) 	 * The page may not be locked, eg if called from try_to_unmap_one()
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  212  	 */
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  213) 	spin_lock(&mapping->private_lock);
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  214) 	head = folio_buffers(folio);
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  215) 	if (head) {
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  216) 		struct buffer_head *bh = head;
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  217) 
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  218) 		nr_dirty = 0;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  219  		do {
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  220  			/* Do not mark hole blocks dirty */
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  221  			if (buffer_dirty(bh) || !buffer_mapped(bh))
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  222  				continue;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  223  
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  224  			set_buffer_dirty(bh);
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  225  			nr_dirty++;
136e8770cd5d1fe Ryusuke Konishi         2013-05-24  226  		} while (bh = bh->b_this_page, bh != head);
56d7acc792c0d98 Andreas Rohner          2014-09-25 @227  	} else if (ret) {
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  228) 		nr_dirty = 1 << (PAGE_SHIFT - inode->i_blkbits);
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  229) 	}
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  230) 	spin_unlock(&mapping->private_lock);
56d7acc792c0d98 Andreas Rohner          2014-09-25  231  
248cfe55743b429 Matthew Wilcox (Oracle  2022-02-09  232) 	if (nr_dirty)
bcbc8c648d6cc88 Ryusuke Konishi         2010-12-27  233  		nilfs_set_file_dirty(inode, nr_dirty);
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  234  	return ret;
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  235  }
05fe58fdc10df9e Ryusuke Konishi         2009-04-06  236  

:::::: The code at line 227 was first introduced by commit
:::::: 56d7acc792c0d98f38f22058671ee715ff197023 nilfs2: fix data loss with mmap()

:::::: TO: Andreas Rohner <andreas.rohner@gmx.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
