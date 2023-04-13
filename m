Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB260633;
	Thu, 13 Apr 2023 03:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681355019; x=1712891019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fso9Gp7VXy+3lwj9iAlvG7pJxci5BI25TN8sVEkcv1g=;
  b=eaIzwCUSajIaznF6iSzrq5/2qrA1uT3xAPLTNiEGri6Uz1zc6f1p+Rh4
   dSdO3WoHBNctxBHQ6Perf77LrR3eVOfvGAVFVLLTUMJMWLzDyRKwveAwu
   S7C0DKOb+hlNzdeDwt7mTIpi/2lI1CLC1wQw2shgKXRIjdEIyXutL38Cy
   HAXbFFXzggu49+nfusKg07V+t6NmblozALtmgi7XoFuBZY3PJ6pmfqs/m
   BNxhNfPEDNd5c0qLY2+obQQwqjWe9y92gFNcE9+qpF3YzangjyOcYqx8Z
   05ND2l9tnbk7uzewJf8f6kmAxOEduT9tH2vm8oPAvF3vS7Z82y6mM2OFy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324431978"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="324431978"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 20:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="778526679"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="778526679"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2023 20:03:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmnFE-000YHt-0g;
	Thu, 13 Apr 2023 03:03:32 +0000
Date: Thu, 13 Apr 2023 11:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 9/10]
 ./usr/include/linux/eventpoll.h:107:27: error: field has incomplete type
 'struct __kernel_timespec'
Message-ID: <202304131033.Sgjw9uwI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: 343353f60bfa9ffcf17dee8189972f43575bbe5e [9/10] eventpoll: add epoll_pwait3()
config: x86_64-randconfig-a006-20230410 (https://download.01.org/0day-ci/archive/20230413/202304131033.Sgjw9uwI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=343353f60bfa9ffcf17dee8189972f43575bbe5e
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block epoll-min_ts.2
        git checkout 343353f60bfa9ffcf17dee8189972f43575bbe5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131033.Sgjw9uwI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/eventpoll.h:107:27: error: field has incomplete type 'struct __kernel_timespec'
           struct __kernel_timespec        timeout;
                                           ^
   ./usr/include/linux/eventpoll.h:107:9: note: forward declaration of 'struct __kernel_timespec'
           struct __kernel_timespec        timeout;
                  ^
>> ./usr/include/linux/eventpoll.h:111:2: error: unknown type name 'sigset_t'
           sigset_t                        sigmask;
           ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
