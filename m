Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792542F59;
	Thu,  9 Mar 2023 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678351819; x=1709887819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cZuMQtn0ta+55u3GSRsrGEk2AImvhqnZB18GOf2tjg=;
  b=TR6/3m43QD+B8KyekST9omXBvcfZsfM9yatlU1/PdczHeXcj2bocuRX4
   xoWuw/4gra7QGtGRBAXlDMqYPYv3NouhfzeuqhQv3383C7Bwq+pvWfqYW
   TdbBjKJnOONTemRZF6fIFZ2V6cT46h5A47CuMjKgI27MriCSScMlyhTru
   6P+O2aZNghv6euVu9s8+NCkNTeAgTBYpWkTG5hKOlS69HrCvxG3YYOuIo
   Ye4QqADHDZXC5mCZVJZGXANJ6ASeSB7H2LUU+rm+B2wxzcDsIM+kXLuCM
   XWekuo+T0Z+2q+YFQ6lKGuz8VO/sE4Kis0zZSdYhAXiSX/BYuyBRBnFzy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="364031700"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="364031700"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707525170"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="707525170"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 00:50:17 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBya-0002op-2m;
	Thu, 09 Mar 2023 08:50:16 +0000
Date: Thu, 9 Mar 2023 16:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:lock-rearrange 11/21] fs/btrfs/inode.c:7803:11: error:
 call to undeclared function 'find_lock_delalloc_range'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202303091617.QqZprh7F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux lock-rearrange
head:   11ad35ece43be2868f38d830941cd55abc43449d
commit: 68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185 [11/21] btrfs: locking extents for async writeback
config: s390-randconfig-r044-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091617.QqZprh7F-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/goldwynr/linux/commit/68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr lock-rearrange
        git checkout 68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091617.QqZprh7F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/inode.c:7803:11: error: call to undeclared function 'find_lock_delalloc_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
                           ^
   1 error generated.


vim +/find_lock_delalloc_range +7803 fs/btrfs/inode.c

  7789	
  7790	static int btrfs_writepages_async(struct btrfs_inode *inode, struct writeback_control *wbc, u64 start, u64 end)
  7791	{
  7792		u64 last_start, cur_start = start;
  7793		u64 cur_end;
  7794		int ret = 0;
  7795	
  7796		lock_extent(&inode->io_tree, start, end, NULL);
  7797	
  7798		while (cur_start < end) {
  7799			bool found;
  7800			last_start = cur_start;
  7801			cur_end = end;
  7802	
> 7803			found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
  7804			/* Nothing to writeback */
  7805			if (!found) {
  7806				unlock_extent(&inode->io_tree, cur_start, cur_end, NULL);
  7807				cur_start = cur_end + 1;
  7808				continue;
  7809			}
  7810	
  7811			/* A hole with no pages, unlock part therof */
  7812			if (cur_start > last_start)
  7813				unlock_extent(&inode->io_tree, last_start, cur_start - 1, NULL);
  7814	
  7815			/* Got more than we requested for */
  7816			if (cur_end > end) {
  7817				if (try_lock_extent(&inode->io_tree, end + 1, cur_end, NULL)) {
  7818					/* Try writing the whole extent */
  7819					end = cur_end;
  7820				} else {
  7821					/*
  7822					 * Someone is holding the extent lock.
  7823					 * Unlock pages from last part of extent, and
  7824					 * write just as much writepage requested for
  7825					 */
  7826					__unlock_for_delalloc(&inode->vfs_inode, NULL, end + 1, cur_end);
  7827					cur_end = end;
  7828				}
  7829			}
  7830	
  7831			ret = cow_file_range_async(inode, wbc, cur_start, cur_end);
  7832			if (ret < 0) {
  7833				unlock_extent(&inode->io_tree, cur_start, end, NULL);
  7834				break;
  7835			}
  7836	
  7837			cur_start = cur_end + 1;
  7838		}
  7839	
  7840		return ret;
  7841	}
  7842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
