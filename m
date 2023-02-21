Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC37A933;
	Tue, 21 Feb 2023 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677019850; x=1708555850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bj4ZPAroNulg++I22oXJZrbqZHdp5SCnFq40CHVE3Yc=;
  b=UQEBblpYvov0PhBYaeeTCBg3MlWBD9iCQyZylxaZkXU/jE+cvcV4l2St
   Tm+u4y8Ockg3PLYZ22RzdMTjOoNSEWIVkAdblfKRRrzQ5RKibf4eptvKj
   SCKWEbYUFi85CfvIWngDokP/VuO8peQhYthPi1ptqqRdSwjHgFJu86jod
   5kciZiPR4ZwDJ/oxRh+9a5Tlv69huWit1tz09F8k3WuLiwhx+mnZe3lMP
   h07DsJ7vPyOWPhd3G0AKalMIksl1yOeKxQ+NBBOKpkY1VrKbugPw2IzUz
   sfTaKk+fV5TBkLddIlvKEBifZ3c6JbAHvfqglLC0c1ArCmHdegf/AJ6o3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397464491"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="397464491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 14:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845887885"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="845887885"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 14:50:45 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUbTA-0000JN-2s;
	Tue, 21 Feb 2023 22:50:44 +0000
Date: Wed, 22 Feb 2023 06:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [ammarfaizi2-block:axboe/linux-block/for-6.3/io_uring 55/57]
 io_uring/io_uring.c:2781:8: error: invalid application of 'sizeof' to an
 incomplete type 'struct io_async_msghdr'
Message-ID: <202302220654.Kl6mFc8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-6.3/io_uring
head:   283f3cf5b56df54657cabe38af86cba578e88d5a
commit: b808f80118590c6f1ad17e7bb0dc7502cf02f473 [55/57] io_uring: Add KASAN support for alloc_caches
config: arm-randconfig-r013-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220654.Kl6mFc8W-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/b808f80118590c6f1ad17e7bb0dc7502cf02f473
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-6.3/io_uring
        git checkout b808f80118590c6f1ad17e7bb0dc7502cf02f473
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220654.Kl6mFc8W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/io_uring.c:2781:8: error: invalid application of 'sizeof' to an incomplete type 'struct io_async_msghdr'
                               sizeof(struct io_async_msghdr));
                               ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c:2781:22: note: forward declaration of 'struct io_async_msghdr'
                               sizeof(struct io_async_msghdr));
                                             ^
   1 error generated.


vim +2781 io_uring/io_uring.c

  2777	
  2778		io_alloc_cache_free(&ctx->apoll_cache, io_apoll_cache_free,
  2779				    sizeof(struct async_poll));
  2780		io_alloc_cache_free(&ctx->netmsg_cache, io_netmsg_cache_free,
> 2781				    sizeof(struct io_async_msghdr));
  2782	}
  2783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
