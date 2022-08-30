Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B97C
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661857518; x=1693393518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1NbQoCaH/Q7bPZhotAxmZNi1kSZ7zx0R4nWxRZ1UTYE=;
  b=Yelak4AKAiEM4Fk/end4p5r3wBRDBhG4tpj6XKGZmCyqvFjR1/Ii8CyK
   GVhfESgbuv2cpPXk0zKZb4p+BaKdtVfb9DYvKEBZFsG8FfT3p3jwUYdBB
   8YYuhlzjZIjcRjCD3KMbnypau4ErSeTzGXMyMrDGQFFeoUNthDRdrcoJx
   XPbk4f9P8wjZTtscRITJcBEeb1oykS6ZCQqFKAiYusSSExVcLK5UX+ez7
   CLfh5vx0vtns2+PHD3CAGGjgd1HI9Pf77P7WCmcpvXneIA5vUxurqr9Sf
   4uw6NnpnLlZ/9xWyBR5EOr/QDxrhr9T5MamqG3mYWKXf5kxA/rukF1hOw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295926851"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="295926851"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 04:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="611666972"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2022 04:05:16 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSz3U-0000Dr-05;
	Tue, 30 Aug 2022 11:05:16 +0000
Date: Tue, 30 Aug 2022 19:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/4] lib/find_bit: create find_first_zero_bit_le()
Message-ID: <202208301838.szdu193i-lkp@intel.com>
References: <20220827175807.4017673-3-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827175807.4017673-3-yury.norov@gmail.com>

Hi Yury,

I love your patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v6.0-rc3 next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/lib-optimize-find_bit-functions/20220828-020022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89b749d8552d78c4dd86dea86e2e6ba8aafab9fe
config: arm64-randconfig-r014-20220830 (https://download.01.org/0day-ci/archive/20220830/202208301838.szdu193i-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/12305b7df25ab7bb6e93e4347bccd8a747d79929
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yury-Norov/lib-optimize-find_bit-functions/20220828-020022
        git checkout 12305b7df25ab7bb6e93e4347bccd8a747d79929
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/minix/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/minix/bitmap.c:82:33: error: incompatible pointer types passing 'char *' to parameter of type 'const unsigned long *' [-Werror,-Wincompatible-pointer-types]
                   j = minix_find_first_zero_bit(bh->b_data, bits_per_zone);
                                                 ^~~~~~~~~~
   include/linux/find.h:260:59: note: passing argument to parameter 'addr' here
   unsigned long find_first_zero_bit_le(const unsigned long *addr, unsigned long size)
                                                             ^
   fs/minix/bitmap.c:233:33: error: incompatible pointer types passing 'char *' to parameter of type 'const unsigned long *' [-Werror,-Wincompatible-pointer-types]
                   j = minix_find_first_zero_bit(bh->b_data, bits_per_zone);
                                                 ^~~~~~~~~~
   include/linux/find.h:260:59: note: passing argument to parameter 'addr' here
   unsigned long find_first_zero_bit_le(const unsigned long *addr, unsigned long size)
                                                             ^
   2 errors generated.


vim +82 fs/minix/bitmap.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  70  
^1da177e4c3f41 Linus Torvalds  2005-04-16  71  int minix_new_block(struct inode * inode)
^1da177e4c3f41 Linus Torvalds  2005-04-16  72  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  73  	struct minix_sb_info *sbi = minix_sb(inode->i_sb);
939b00df0306bc Andries Brouwer 2007-02-12  74  	int bits_per_zone = 8 * inode->i_sb->s_blocksize;
^1da177e4c3f41 Linus Torvalds  2005-04-16  75  	int i;
^1da177e4c3f41 Linus Torvalds  2005-04-16  76  
^1da177e4c3f41 Linus Torvalds  2005-04-16  77  	for (i = 0; i < sbi->s_zmap_blocks; i++) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  78  		struct buffer_head *bh = sbi->s_zmap[i];
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  		int j;
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  
cc46759a8c0ac4 Al Viro         2009-06-16  81  		spin_lock(&bitmap_lock);
939b00df0306bc Andries Brouwer 2007-02-12 @82  		j = minix_find_first_zero_bit(bh->b_data, bits_per_zone);
939b00df0306bc Andries Brouwer 2007-02-12  83  		if (j < bits_per_zone) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  84  			minix_set_bit(j, bh->b_data);
cc46759a8c0ac4 Al Viro         2009-06-16  85  			spin_unlock(&bitmap_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  86  			mark_buffer_dirty(bh);
939b00df0306bc Andries Brouwer 2007-02-12  87  			j += i * bits_per_zone + sbi->s_firstdatazone-1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  88  			if (j < sbi->s_firstdatazone || j >= sbi->s_nzones)
^1da177e4c3f41 Linus Torvalds  2005-04-16  89  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  90  			return j;
^1da177e4c3f41 Linus Torvalds  2005-04-16  91  		}
cc46759a8c0ac4 Al Viro         2009-06-16  92  		spin_unlock(&bitmap_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  93  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  94  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  95  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  96  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
