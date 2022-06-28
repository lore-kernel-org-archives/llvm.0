Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B47367
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656397632; x=1687933632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwpkHRbckHfhNUb4oL5+dzv724A12Fx42ijmC1IsKvo=;
  b=cUnYyWztlYLTFd//JTm7VgGbsokhSAyzahq7ubSrkadB6lZ5PosTbxbr
   4EVqt1ctTvEl6I+aLd4OB3xFcpHmGV1RJ+Ls7X0rWNHkjUDggIGDCbZ16
   9fVy46euLA63VZg+wbiz6asWRlUVPR3RG7zb5UN+76BzA6u3/S2DGy0Gz
   RnXR+n67AeHnMt9r/1Q8YMwN81cpkvcb67Dh+59cu8ES0WGUzMxoe2aKr
   29Vhn21JLupe8vT7cnwLfXZ3xOWYTYeIkHD4C3yPW8ApvKTxh5Fqbt/Ii
   u7QmVtut6uw3V9xOg3/toVInEGEu/RVhj7UhNiuxA5Lw8UP3hstaCZxgd
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="367961352"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="367961352"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 23:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="836542352"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 23:27:09 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o64gn-0009cf-7l;
	Tue, 28 Jun 2022 06:27:09 +0000
Date: Tue, 28 Jun 2022 14:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Moti Haimovski <mhaimovski@habana.ai>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:gaudi2 59/61]
 drivers/misc/habanalabs/common/mmu/mmu.c:785:16: error: invalid instruction
Message-ID: <202206281401.zrwZ9lWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git gaudi2
head:   a76819ab38942fcb341142a55e9dc81f3eaf08e3
commit: 950d1a3888fe751fb5b2e51a44ebf89d963fdde5 [59/61] habanalabs: add gaudi2 MMU support
config: s390-buildonly-randconfig-r003-20220628 (https://download.01.org/0day-ci/archive/20220628/202206281401.zrwZ9lWF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git/commit/?id=950d1a3888fe751fb5b2e51a44ebf89d963fdde5
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
        git fetch --no-tags ogabbay gaudi2
        git checkout 950d1a3888fe751fb5b2e51a44ebf89d963fdde5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/misc/habanalabs/common/mmu/mmu.c:10:
   In file included from drivers/misc/habanalabs/common/mmu/../habanalabs.h:11:
   In file included from drivers/misc/habanalabs/common/mmu/../../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/misc/habanalabs/common/mmu/mmu.c:10:
   In file included from drivers/misc/habanalabs/common/mmu/../habanalabs.h:11:
   In file included from drivers/misc/habanalabs/common/mmu/../../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/misc/habanalabs/common/mmu/mmu.c:10:
   In file included from drivers/misc/habanalabs/common/mmu/../habanalabs.h:11:
   In file included from drivers/misc/habanalabs/common/mmu/../../include/common/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/misc/habanalabs/common/mmu/mmu.c:785:16: error: invalid instruction
           asm volatile ("mfence" : : : "memory");
                         ^
   <inline asm>:1:2: note: instantiated into assembly here
           mfence
           ^~~~~~
   12 warnings and 1 error generated.


vim +785 drivers/misc/habanalabs/common/mmu/mmu.c

   780	
   781	void hl_mmu_hr_flush(struct hl_ctx *ctx)
   782	{
   783		/* a flush operation requires memory barrier */
   784		mb();
 > 785		asm volatile ("mfence" : : : "memory");
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
