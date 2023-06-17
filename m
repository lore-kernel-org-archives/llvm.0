Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C532F7F4;
	Sat, 17 Jun 2023 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687036072; x=1718572072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rT+J7H96JWjnblIKYGhdHCsu0twm0505Cpk/lOkGBrw=;
  b=XehdBvI2ydZPrPj1pUa46SPTr4iv/z7xBMofGxgaHquSWqEDA7lZCKjZ
   a0oWTZUklVqWdZB0awLB/g8HtOKAVxCNiVRXrXIEFdNBsIkD7aZoALnvP
   JgIgKWMHsXRctxvWQlRsItvmniKVSMhuX97OEze/CFGbH3uBFSkhE5Xar
   A0SShMKr9gVGA9YoNM8UN84mWRV+86SXFYw0xKap/vAV7l47Qip7O/iw/
   LmLISYo5IEsmZ01hqSKR4gY1OXVKuz9l4V7AklcgRrQ19jXElawpY4fBf
   E2c3W6+sNugJLCgASuE+sWZGL9xtzV6Ok8OPUR/CJ/ElvSwVYagEtESoJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="358297723"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="358297723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="783299222"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="783299222"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2023 14:07:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAd9C-00036u-0v;
	Sat, 17 Jun 2023 21:07:50 +0000
Date: Sun, 18 Jun 2023 05:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230617-hacks 44/45] block/bdev.c:140:35:
 error: no member named 'bd_buffer_head_mounted' in 'struct block_device'
Message-ID: <202306180512.f0INzSdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230617-hacks
head:   87ea751f68b5bc03c4c3491b5cab898765002565
commit: b1bd39924b170a4c910626be18f732385e206f2a [44/45] bdev: make iomap aops default and allow to switch
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230618/202306180512.f0INzSdP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180512.f0INzSdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180512.f0INzSdP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/bdev.c:140:35: error: no member named 'bd_buffer_head_mounted' in 'struct block_device'
                   WARN_ON_ONCE(atomic_read(&bdev->bd_buffer_head_mounted) != 0);
                                             ~~~~  ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   1 error generated.


vim +140 block/bdev.c

   124	
   125	static void set_init_blocksize(struct block_device *bdev)
   126	{
   127		unsigned int bsize = bdev_logical_block_size(bdev);
   128		loff_t size = i_size_read(bdev->bd_inode);
   129		int order, folio_order;
   130	
   131		while (bsize < PAGE_SIZE) {
   132			if (size & bsize)
   133				break;
   134			bsize <<= 1;
   135		}
   136		bdev->bd_inode->i_blkbits = blksize_bits(bsize);
   137		order = bdev->bd_inode->i_blkbits - PAGE_SHIFT;
   138		folio_order = mapping_min_folio_order(bdev->bd_inode->i_mapping);
   139		if (order > 0 && folio_order == 0) {
 > 140			WARN_ON_ONCE(atomic_read(&bdev->bd_buffer_head_mounted) != 0);
   141			mapping_set_min_folio_order(bdev->bd_inode->i_mapping, order);
   142			bdev->bd_inode->i_data.a_ops = &def_blk_aops_iomap;
   143		}
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
