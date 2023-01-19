Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDF6FC1;
	Thu, 19 Jan 2023 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674128691; x=1705664691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRtnYtFiGZV8ZXcVP+uYaDkRamd9MkCVFDOyqvw865s=;
  b=abNSxKHEfZY+aeRT/q7znm32dhCjxJBXqDkTetMygUxPcUu0N3b8NLot
   VW5hGaUk2mFdtbH/xVoNXTAKAPxAvwXxvNFcfaX2T5QEDLfVez5p/zP69
   N7MolmwYVrmwkF+jw8rXwGUbXiq0H/NDx12HvKMr1YaOx7w+fu0iSh/V5
   fiHMIPWFFsr2+WHyjdHvT75htFw2f17rL/qAnPk2j6JmFs3b0toQOnCnA
   8C+RmygqSqIaR051OmIV4b8HmKDaoQ4OJZuTxzrAw7Y+pMxWu7Eu9ZUr4
   MVRzFfC+0VnVrl1wLrKz6jb/md6P4dMJz33EHFJXWbQSpj6agAPUF7/d2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327338751"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="327338751"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 03:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637665016"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="637665016"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 03:44:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pITLc-0001Q0-2E;
	Thu, 19 Jan 2023 11:44:48 +0000
Date: Thu, 19 Jan 2023 19:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.2.y-rt-rebase 14/46]
 kernel/printk/printk.c:2903:13: warning: unused function
 'console_is_usable_unlocked'
Message-ID: <202301191912.XiWvsFvP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase
head:   bee0efc1fe1add1df7d677cee5a9c4c325196403
commit: 5342b8e20b15e5fb37e49de2435e62dd00ff20fe [14/46] printk: Bring back the RT bits.
config: hexagon-randconfig-r041-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191912.XiWvsFvP-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.2.y-rt-rebase
        git checkout 5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/printk/printk.c:24:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> kernel/printk/printk.c:2903:13: warning: unused function 'console_is_usable_unlocked' [-Wunused-function]
   static bool console_is_usable_unlocked(struct console *con)
               ^
   7 warnings generated.


vim +/console_is_usable_unlocked +2903 kernel/printk/printk.c

  2902	
> 2903	static bool console_is_usable_unlocked(struct console *con)
  2904	{
  2905		int cookie;
  2906		bool ret;
  2907	
  2908		cookie = console_srcu_read_lock();
  2909		ret = console_is_usable(con);
  2910		console_srcu_read_unlock(cookie);
  2911	
  2912		return ret;
  2913	}
  2914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
