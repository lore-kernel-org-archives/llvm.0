Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8A15AA;
	Fri,  2 Jun 2023 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685673538; x=1717209538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N6BjYBr66PMZ3TTYpsDsPKuIcgLumfCSe7y6iDeZGsw=;
  b=OY2Vgb4dyDgcY5i+jXp/yx8W3xrFTYLnYzPUr88PGOw6iMuPe/pnJYxN
   2jqioEeRXow7A5qzhi7NWc6ht86jkNnHMMQS7P+mA+eCZYycAs6oiMuxk
   oI3ju9K4bLYxkvXabqlAdiEv6ZC5edxmzEKfzF/8jhnYkuvRSuQSBtdCr
   Z2u7DSxEtAjjDLRwo1mPjovoceIGCDSxCrB3KsCAvyRpreuoXTw1hV/Dd
   6qRw6e0/vuWUFqLL5e8V981labgPkTDR81SVUVH86SvYIKrzxteWOs+3Q
   Gwjp90PdMI/FNeW3ONuQe5En1scv+wl4rqCvuFGjVlVW/RtatzkgCGtAO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419273930"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="419273930"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 19:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="954276976"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="954276976"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2023 19:38:56 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ugp-0002we-1j;
	Fri, 02 Jun 2023 02:38:55 +0000
Date: Fri, 2 Jun 2023 10:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] fs: Rename put_and_unmap_page() to
 unmap_and_put_page()
Message-ID: <202306021044.B12tl43B-lkp@intel.com>
References: <20230601132317.13606-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601132317.13606-1-fmdefrancesco@gmail.com>

Hi Fabio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vfs-idmapping/for-next]
[also build test ERROR on linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/fs-Rename-put_and_unmap_page-to-unmap_and_put_page/20230601-220353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230601132317.13606-1-fmdefrancesco%40gmail.com
patch subject: [RFC PATCH] fs: Rename put_and_unmap_page() to unmap_and_put_page()
config: hexagon-randconfig-r014-20230601 (https://download.01.org/0day-ci/archive/20230602/202306021044.B12tl43B-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e5e2b8aebe19674f6389f850dedf4dd6cabb434f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fabio-M-De-Francesco/fs-Rename-put_and_unmap_page-to-unmap_and_put_page/20230601-220353
        git checkout e5e2b8aebe19674f6389f850dedf4dd6cabb434f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/sysv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021044.B12tl43B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/sysv/dir.c:17:
   In file included from include/linux/pagemap.h:11:
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
   In file included from fs/sysv/dir.c:17:
   In file included from include/linux/pagemap.h:11:
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
   In file included from fs/sysv/dir.c:17:
   In file included from include/linux/pagemap.h:11:
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
>> fs/sysv/dir.c:329:2: error: call to undeclared function 'unmap_iand_put_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           unmap_iand_put_page(page, kaddr);
           ^
   fs/sysv/dir.c:329:2: note: did you mean 'unmap_and_put_page'?
   include/linux/highmem.h:510:20: note: 'unmap_and_put_page' declared here
   static inline void unmap_and_put_page(struct page *page, void *addr)
                      ^
   6 warnings and 1 error generated.


vim +/unmap_iand_put_page +329 fs/sysv/dir.c

   288	
   289	/*
   290	 * routine to check that the specified directory is empty (for rmdir)
   291	 */
   292	int sysv_empty_dir(struct inode * inode)
   293	{
   294		struct super_block *sb = inode->i_sb;
   295		struct page *page = NULL;
   296		unsigned long i, npages = dir_pages(inode);
   297		char *kaddr;
   298	
   299		for (i = 0; i < npages; i++) {
   300			struct sysv_dir_entry *de;
   301	
   302			kaddr = dir_get_page(inode, i, &page);
   303			if (IS_ERR(kaddr))
   304				continue;
   305	
   306			de = (struct sysv_dir_entry *)kaddr;
   307			kaddr += PAGE_SIZE-SYSV_DIRSIZE;
   308	
   309			for ( ;(char *)de <= kaddr; de++) {
   310				if (!de->inode)
   311					continue;
   312				/* check for . and .. */
   313				if (de->name[0] != '.')
   314					goto not_empty;
   315				if (!de->name[1]) {
   316					if (de->inode == cpu_to_fs16(SYSV_SB(sb),
   317								inode->i_ino))
   318						continue;
   319					goto not_empty;
   320				}
   321				if (de->name[1] != '.' || de->name[2])
   322					goto not_empty;
   323			}
   324			unmap_and_put_page(page, kaddr);
   325		}
   326		return 1;
   327	
   328	not_empty:
 > 329		unmap_iand_put_page(page, kaddr);
   330		return 0;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
