Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB81428A;
	Wed, 31 May 2023 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685535259; x=1717071259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+3ELCwsKWSp16IufrALk7rMkIvBjHSpjrxmjqta4CE=;
  b=C9RMS5m9ouYOmcDL5HcLOCCe86LJf7zmKeHXLbNznAPN/IAmgLpP9tcH
   Lsk2rW/2XHes5U8Buo/PyL+PdB2pIPkybMViaom8mnxq0wUTtOroz3RBv
   3UtrEwc0ajY3xNNUrq47V1JjG+BFPLKCMjJ4GULNaF+tEIBhk7E85xld7
   J7xhE3qMRAf2T4oEMzssUVDvQEOtewucGS8hyF9WI5GEGtnJHAMog+ook
   p2ErV8rjgMk3uNZlrkAjvQj2gMeokxrJ/so2aGEmZNAduHnBStQvnpFP9
   FRVK/7khjsyTJPyqeoAkoeWpWvduoR+VtzfgRcdRox97bct9y1SStKloP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418710881"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="418710881"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 05:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="736647459"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="736647459"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 May 2023 05:14:17 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4KiX-0001Ig-0E;
	Wed, 31 May 2023 12:14:17 +0000
Date: Wed, 31 May 2023 20:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:testing/af/home 3/8] kernel/workqueue.c:4421:5:
 warning: no previous prototype for function 'set_workqueue_cpumask'
Message-ID: <202305312023.upvkP9at-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block testing/af/home
head:   51fb2efd62ae52dc061dbca301fb823357fb3f80
commit: 6436622d20b564a334e4bc0bc5019c82a592dd08 [3/8] workqueue: Add set_workqueue_cpumask() helper function
config: hexagon-randconfig-r041-20230531 (https://download.01.org/0day-ci/archive/20230531/202305312023.upvkP9at-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/6436622d20b564a334e4bc0bc5019c82a592dd08
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block testing/af/home
        git checkout 6436622d20b564a334e4bc0bc5019c82a592dd08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312023.upvkP9at-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/workqueue.c:39:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from kernel/workqueue.c:39:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/workqueue.c:39:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
>> kernel/workqueue.c:4421:5: warning: no previous prototype for function 'set_workqueue_cpumask' [-Wmissing-prototypes]
   int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
       ^
   kernel/workqueue.c:4421:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
   ^
   static 
   7 warnings generated.


vim +/set_workqueue_cpumask +4421 kernel/workqueue.c

  4420	
> 4421	int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
  4422	{
  4423		struct workqueue_attrs *tmp_attrs;
  4424		int ret;
  4425	
  4426		tmp_attrs = alloc_workqueue_attrs();
  4427		if (!tmp_attrs)
  4428			return -ENOMEM;
  4429	
  4430		apply_wqattrs_lock();
  4431		copy_workqueue_attrs(tmp_attrs, wq->unbound_attrs);
  4432		cpumask_copy(tmp_attrs->cpumask, mask);
  4433		ret = apply_workqueue_attrs_locked(wq, tmp_attrs);
  4434		apply_wqattrs_unlock();
  4435		free_workqueue_attrs(tmp_attrs);
  4436		return ret;
  4437	}
  4438	EXPORT_SYMBOL_GPL(set_workqueue_cpumask);
  4439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
