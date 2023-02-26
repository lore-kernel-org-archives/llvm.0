Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA53D6D;
	Sun, 26 Feb 2023 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677449411; x=1708985411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbKrLmy+9YjdePBTNgg8YJEFe4zDewloqR82IM5gcno=;
  b=SvaMZ2kX9jDMY1+VTsIiAs0ChhrbyZsFVVp7MTJPk95pD1rtBpwF08fX
   ZgqUTQrU7iZnUNWvAKcttdXCFBZTLcx3TZkLsl21PMrkoeoY+RG6o2x4x
   b+c3PfK7JCU7WQFcs/4zHlC0J0BuuklqpiNPYABA53wReQq/pUkiLNXGc
   ocp97HW5jdocCcH/N2bB6MHgMmgU2ueOL9+U6ymECRa3BgjOY1bn2XC24
   th4ClGwuzUwVxOC6Ip2U1Tu0MeF0tVsg2jWePxlgxCGigCTTV8jsRb0z+
   FK2LntWex/9ibEeMUPFF6PWY0N0Yhn/zMjXqV8R8CcBopHObFiTdDu/3T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="333786519"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="333786519"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 14:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="816398683"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="816398683"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2023 14:10:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWPDb-0003uz-2k;
	Sun, 26 Feb 2023 22:10:07 +0000
Date: Mon, 27 Feb 2023 06:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: drivers/block/drbd/drbd_bitmap.c:451:7: warning: expression result
 unused
Message-ID: <202302270609.xV5AJnWY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
commit: aa034695971124f673d4ccdd39cd7f269904ea86 drbd: introduce dynamic debug
date:   3 months ago
config: i386-randconfig-a005-20230227 (https://download.01.org/0day-ci/archive/20230227/202302270609.xV5AJnWY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa034695971124f673d4ccdd39cd7f269904ea86
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout aa034695971124f673d4ccdd39cd7f269904ea86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/block/drbd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270609.xV5AJnWY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_bitmap.c:451:7: warning: expression result unused [-Wunused-value]
           if (!expect(device->bitmap))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/block/drbd/drbd_bitmap.c:451:7: warning: expression result unused [-Wunused-value]
           if (!expect(device->bitmap))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/block/drbd/drbd_bitmap.c:460:7: warning: expression result unused [-Wunused-value]
           if (!expect(device->bitmap))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/drbd/drbd_bitmap.c:460:7: warning: expression result unused [-Wunused-value]
           if (!expect(device->bitmap))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/block/drbd/drbd_bitmap.c:639:7: warning: expression result unused [-Wunused-value]
           if (!expect(b))
           ~~~~~^~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/drbd/drbd_bitmap.c:639:7: warning: expression result unused [-Wunused-value]
           if (!expect(b))
           ~~~~~^~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
>> drivers/block/drbd/drbd_receiver.c:416:7: warning: expression result unused [-Wunused-value]
           if (!expect(!(peer_req->flags & EE_CALL_AL_COMPLETE_IO))) {
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/block/drbd/drbd_receiver.c:416:7: warning: expression result unused [-Wunused-value]
           if (!expect(!(peer_req->flags & EE_CALL_AL_COMPLETE_IO))) {
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/block/drbd/drbd_receiver.c:1876:8: warning: expression result unused [-Wunused-value]
                   if (!expect(data_size == 0))
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/drbd/drbd_receiver.c:1876:8: warning: expression result unused [-Wunused-value]
                   if (!expect(data_size == 0))
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/block/drbd/drbd_receiver.c:1880:8: warning: expression result unused [-Wunused-value]
                   if (!expect(data_size == 0))
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/drbd/drbd_receiver.c:1880:8: warning: expression result unused [-Wunused-value]
                   if (!expect(data_size == 0))
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
>> drivers/block/drbd/drbd_actlog.c:871:7: warning: expression result unused [-Wunused-value]
           if (!expect(sector < nr_sectors))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/block/drbd/drbd_actlog.c:871:7: warning: expression result unused [-Wunused-value]
           if (!expect(sector < nr_sectors))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/block/drbd/drbd_actlog.c:873:7: warning: expression result unused [-Wunused-value]
           if (!expect(esector < nr_sectors))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   drivers/block/drbd/drbd_polymorph_printk.h:55:47: note: expanded from macro '__drbd_printk_if_same_type'
           __drbd_printk_choose_cond(obj, struct_name), \
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/block/drbd/drbd_actlog.c:873:7: warning: expression result unused [-Wunused-value]
           if (!expect(esector < nr_sectors))
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_polymorph_printk.h:128:4: note: expanded from macro 'expect'
                           drbd_err(device, "ASSERTION %s FAILED in %s\n",         \
                           ^
   drivers/block/drbd/drbd_polymorph_printk.h:104:2: note: expanded from macro 'drbd_err'
           drbd_printk(KERN_ERR, device, fmt, ## args)
           ^
   drivers/block/drbd/drbd_polymorph_printk.h:65:4: note: expanded from macro 'drbd_printk'
             __drbd_printk_if_same_type(obj, drbd_device, level, fmt, ## args), \
             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   4 warnings generated.
..


vim +451 drivers/block/drbd/drbd_bitmap.c

b411b3637fa71f Philipp Reisner     2009-09-25  448  
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  449  sector_t drbd_bm_capacity(struct drbd_device *device)
b411b3637fa71f Philipp Reisner     2009-09-25  450  {
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03 @451  	if (!expect(device->bitmap))
841ce241fa3550 Andreas Gruenbacher 2010-12-15  452  		return 0;
b30ab7913b0a7b Andreas Gruenbacher 2011-07-03  453  	return device->bitmap->bm_dev_capacity;
b411b3637fa71f Philipp Reisner     2009-09-25  454  }
b411b3637fa71f Philipp Reisner     2009-09-25  455  

:::::: The code at line 451 was first introduced by commit
:::::: b30ab7913b0a7b1d3b1091c8cb3abb1a9f1e0824 drbd: Rename "mdev" to "device"

:::::: TO: Andreas Gruenbacher <agruen@linbit.com>
:::::: CC: Philipp Reisner <philipp.reisner@linbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
