Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631ED7B;
	Sat, 11 Mar 2023 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678533051; x=1710069051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=niaJgS+nl35vG9hYt9aMRIyR8iR8gItOK1rIc+d1Wh4=;
  b=iMFakmLQykVVL2I+xUwhF7n+GMtDB5HN8Fh7ki3/NNgidN6BfMhGNdOo
   QV8IR5DPMqMdRWaOQc3TNKVB9NNylwxYD22xr97v6+raTdHll02OYWnTJ
   wTsjJqt/Enldeip48mduT+dklKTWUF+LAVu7oqVYMzUgAoMgBnG7KXrYk
   4e7P0VZm9ki314D941Cpf0h2XMiXyAfAvaTkdkxIHPh3RFG7mrUBVll5q
   cgmbePz9xKgQE76EtqLrt8VU+RS4g4Oh2pTFLXr5rOI74m+8zmIO/Xo97
   pXGt2nFCGc/vvobZBSvhryt7lXV7yPYRpMZznn+leooneKQ/yjUOzjGyK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="317284863"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="317284863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 03:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708318165"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="708318165"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Mar 2023 03:10:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pax7g-0004WX-10;
	Sat, 11 Mar 2023 11:10:48 +0000
Date: Sat, 11 Mar 2023 19:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:lock-rearrange 11/21] fs/btrfs/inode.c:7808:11: error:
 call to undeclared function 'find_lock_delalloc_range'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202303111920.jLCblj0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux lock-rearrange
head:   cf186c1bdf9992b2e1f6b970ec5db50595bfc363
commit: 970a0d3be13f4c873d5912b3b62cfabd6fa12215 [11/21] btrfs: locking extents for async writeback
config: arm-randconfig-r046-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111920.jLCblj0U-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/goldwynr/linux/commit/970a0d3be13f4c873d5912b3b62cfabd6fa12215
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr lock-rearrange
        git checkout 970a0d3be13f4c873d5912b3b62cfabd6fa12215
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111920.jLCblj0U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/inode.c:7808:11: error: call to undeclared function 'find_lock_delalloc_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
                           ^
   1 error generated.


vim +/find_lock_delalloc_range +7808 fs/btrfs/inode.c

  7794	
  7795	static int btrfs_writepages_async(struct btrfs_inode *inode, struct writeback_control *wbc, u64 start, u64 end)
  7796	{
  7797		u64 last_start, cur_start = start;
  7798		u64 cur_end;
  7799		int ret = 0;
  7800	
  7801		lock_extent(&inode->io_tree, start, end, NULL);
  7802	
  7803		while (cur_start < end) {
  7804			bool found;
  7805			last_start = cur_start;
  7806			cur_end = end;
  7807	
> 7808			found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
  7809			/* Nothing to writeback */
  7810			if (!found) {
  7811				unlock_extent(&inode->io_tree, cur_start, cur_end, NULL);
  7812				cur_start = cur_end + 1;
  7813				continue;
  7814			}
  7815	
  7816			/* A hole with no pages, unlock part therof */
  7817			if (cur_start > last_start)
  7818				unlock_extent(&inode->io_tree, last_start, cur_start - 1, NULL);
  7819	
  7820			/* Got more than we requested for */
  7821			if (cur_end > end) {
  7822				if (try_lock_extent(&inode->io_tree, end + 1, cur_end, NULL)) {
  7823					/* Try writing the whole extent */
  7824					end = cur_end;
  7825				} else {
  7826					/*
  7827					 * Someone is holding the extent lock.
  7828					 * Unlock pages from last part of extent, and
  7829					 * write just as much writepage requested for
  7830					 */
  7831					__unlock_for_delalloc(&inode->vfs_inode, NULL, end + 1, cur_end);
  7832					cur_end = end;
  7833				}
  7834			}
  7835	
  7836			ret = cow_file_range_async(inode, wbc, cur_start, cur_end);
  7837			if (ret < 0) {
  7838				unlock_extent(&inode->io_tree, cur_start, end, NULL);
  7839				break;
  7840			}
  7841	
  7842			cur_start = cur_end + 1;
  7843		}
  7844	
  7845		return ret;
  7846	}
  7847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
