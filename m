Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7F17CB;
	Sat, 29 Apr 2023 00:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682729153; x=1714265153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDRwSTyKstAJjWSAIC3ObsDhveLgJpz2kXBzuWw+ar0=;
  b=RD3aL/L+VdWaOMRRfXxWP5ipVq30oFUWz4twdoCo2iTCqfU5+bcYqFPp
   plHCT1iRhj10NteM5S4lXaDCk5LVq9oitY2db+FeAV6UP2+Go6J7V5jrx
   AqeMNaZVIcoahQKWRvsIWAALh/Z1ch6DNuzUzA74g+rjhZxbEnm+xkolt
   WtINIH6Ofw7aOyMCCbFQr+SqsISuOYxyuNoci9OXLzFQMEzNzKigpUtL5
   dFtr8Y0qsbRj7GFd0H9JuK3kufvi3GfX2o8MEb56cug9iDdqtONrp7FZn
   BDE6wZ8XSMrJXa43PnIH3Hevn1GeTGqBSy8fyecrxWKY9v9XUUnA8ax+z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="434181199"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="434181199"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 17:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869386627"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="869386627"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 17:45:48 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psYii-0000mH-0P;
	Sat, 29 Apr 2023 00:45:48 +0000
Date: Sat, 29 Apr 2023 08:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:io_uring/get-buf-op 10/11] drivers/char/mem.c:704:20:
 warning: comparison of distinct pointer types ('typeof (bi->len - done) *'
 (aka 'unsigned int *') and 'typeof ((1UL << 18)) *' (aka 'unsigned long *'))
Message-ID: <202304290832.P7Wi6aGo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux io_uring/get-buf-op
head:   d4d86a65af9ecafa81981e7b1ba804eaac7de023
commit: adf5ce0124b4b76a4ff143a16f598124e7116bad [10/11] TEST: mem: testing ->get_buf impl for /dev/null
config: hexagon-randconfig-r012-20230429 (https://download.01.org/0day-ci/archive/20230429/202304290832.P7Wi6aGo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/isilence/linux/commit/adf5ce0124b4b76a4ff143a16f598124e7116bad
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence io_uring/get-buf-op
        git checkout adf5ce0124b4b76a4ff143a16f598124e7116bad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290832.P7Wi6aGo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/mem.c:19:
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
   In file included from drivers/char/mem.c:19:
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
   In file included from drivers/char/mem.c:19:
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
>> drivers/char/mem.c:704:20: warning: comparison of distinct pointer types ('typeof (bi->len - done) *' (aka 'unsigned int *') and 'typeof ((1UL << 18)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   size_t cur_len = min(bi->len - done, PAGE_SIZE);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   7 warnings generated.


vim +704 drivers/char/mem.c

   692	
   693	
   694	static int zero_get_buf(struct file *file, struct iou_get_buf_info *bi)
   695	{
   696		struct iou_buf_desc *d = bi->desc;
   697		size_t done = 0;
   698	
   699		if (bi->off)
   700			return -EINVAL;
   701	
   702	
   703		while (done != bi->len && d->nr_bvecs < d->max_bvecs) {
 > 704			size_t cur_len = min(bi->len - done, PAGE_SIZE);
   705	
   706			get_page(null_char_page);
   707			bvec_set_page(&d->bvec[d->nr_bvecs], null_char_page, cur_len, 0);
   708			d->nr_bvecs++;
   709			done += cur_len;
   710		}
   711	
   712		d->private = NULL;
   713		d->release = zero_get_buf_release;
   714		return done;
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
