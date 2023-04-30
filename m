Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37A364;
	Sun, 30 Apr 2023 01:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682817739; x=1714353739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUU7aM4zwqXVpOPJkFXdaNAMpoJhYPxW+UJkxXnqMOA=;
  b=b+VnrppDWlG7jXGYntT0XpcjC0914UQyCi5fRJ/ixZQmK+HCemKnpf1g
   gK+82dY1zVW9FabQpJFCHs2TFbK4MPQU+F6zi85jJqtZEv1qoqJByHLwl
   Uk5eWYCxDOhQRHQVyNdC155x2iptw5NO64iuCCFtsJFGfPauBaoVOsrYf
   TzKMzh3ZXNqHOvUCfA7SR14HEx5QgvBiPeW0x0qbU77Xi0+LWDRqEhv1w
   uAPD6PBOR0IKDOFHR9WTtN7WTq/SMWn1EqEKR3TCBQRhxJr8TyHmmhwpI
   YKHf9C3zgdQQ/6w0mYL4k585XhqZWN3dvx0hVclyBe+Qb1ueqED5F8/7M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="434283878"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="434283878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 18:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="689418862"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="689418862"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2023 18:22:17 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psvlY-0001Rd-0j;
	Sun, 30 Apr 2023 01:22:16 +0000
Date: Sun, 30 Apr 2023 09:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-next 42/43] s390x-linux-ld:
 block/fops.o:undefined reference to `iomap_invalidate_folio'
Message-ID: <202304300900.lgj9FsT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-next
head:   a6219c72c4344442bb4226f669944ed2ee23f20d
commit: f087654dfe02a2189fdfde4fee11d60b51ca2f30 [42/43] fs: add CONFIG_BUFFER_HEAD
config: s390-alldefconfig (https://download.01.org/0day-ci/archive/20230430/202304300900.lgj9FsT6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=f087654dfe02a2189fdfde4fee11d60b51ca2f30
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-next
        git checkout f087654dfe02a2189fdfde4fee11d60b51ca2f30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300900.lgj9FsT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: block/fops.o: in function `blkdev_read_folio':
   fops.c:(.text+0xc): undefined reference to `iomap_read_folio'
   s390x-linux-ld: block/fops.o: in function `blkdev_writepages':
   fops.c:(.text+0x36): undefined reference to `iomap_writepages'
   s390x-linux-ld: block/fops.o: in function `blkdev_readahead':
   fops.c:(.text+0x58): undefined reference to `iomap_readahead'
   s390x-linux-ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0x320): undefined reference to `iomap_file_buffered_write'
   s390x-linux-ld: fops.c:(.text+0x358): undefined reference to `iomap_file_buffered_write'
>> s390x-linux-ld: block/fops.o:(.data.rel.ro+0x40): undefined reference to `iomap_invalidate_folio'
>> s390x-linux-ld: block/fops.o:(.data.rel.ro+0x48): undefined reference to `iomap_release_folio'
>> s390x-linux-ld: block/fops.o:(.data.rel.ro+0x70): undefined reference to `iomap_is_partially_uptodate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
