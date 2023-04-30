Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C395668;
	Sun, 30 Apr 2023 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682891631; x=1714427631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QadycooWrM+YGiqJMmgenVRN++rS2XkOk3oZCVJIefg=;
  b=OZe/CLTQkNVX+z1Uhp9ozxWmvXiyxa/4Fz2wFE/BFrbL5WhBw1SjUR42
   NrDa8077ixMhooqnmwloqBX5HN/OtXVplUhTjIUsgD1HfuwnIxk6xCqg7
   fK8McTx2t8FqLkIKe26dL2Mi5NYnRaKo8Kjg8NfL2V0BMUh9osT+2qryb
   JZgkMrVl9ooWwQtnH320hCxYr6OXhEjNQTK1GfSS750QRgsn9GMnlUAUT
   M6ybf0OGAfw8XhAIJlk5bMbS+Kwrnv3oAX4H/BCZq3hsxyz08sOcnKAjq
   3x49a+k5UtJtm84bO77eC5Cy21vC2LexuYsKLCiqaMBUa/E/yWs2irOSr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327686827"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="327686827"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 14:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="785065393"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="785065393"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2023 14:53:46 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptEzK-000093-05;
	Sun, 30 Apr 2023 21:53:46 +0000
Date: Mon, 1 May 2023 05:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 2/2] net/sched/sch_ingress.c:16:10: fatal
 error: 'net/xtc.h' file not found
Message-ID: <202305010544.JN0gfSw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   d965229f2cb3e8cd8584cc84edac281ba87e2b98
commit: d965229f2cb3e8cd8584cc84edac281ba87e2b98 [2/2] bpf: Add generic attach/detach/query API for multi-progs
config: hexagon-randconfig-r016-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010544.JN0gfSw1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/cilium/linux/commit/d965229f2cb3e8cd8584cc84edac281ba87e2b98
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout d965229f2cb3e8cd8584cc84edac281ba87e2b98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010544.JN0gfSw1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sched/sch_ingress.c:10:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/sched/sch_ingress.c:10:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/sched/sch_ingress.c:10:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> net/sched/sch_ingress.c:16:10: fatal error: 'net/xtc.h' file not found
   #include <net/xtc.h>
            ^~~~~~~~~~~
   6 warnings and 1 error generated.


vim +16 net/sched/sch_ingress.c

    12	
    13	#include <net/netlink.h>
    14	#include <net/pkt_sched.h>
    15	#include <net/pkt_cls.h>
  > 16	#include <net/xtc.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
