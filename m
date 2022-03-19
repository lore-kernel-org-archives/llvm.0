Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D923A17F3
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647668523; x=1679204523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wyc+92t3jH9/7ykDGLHc5IAigTXklppN+sJ0xVNcyJg=;
  b=nr3ke8oLic+thT8EB77BwH07A4xfXCIyebfTU4hj6KVtttnyenM5puy2
   cfrF//mf8w8flmB3wR+nIK8Cx5Bps4sbrpYUTaRhtwxigKe4Le3H81NzJ
   l9lDQdNuhvIXwGuIgew/921vucFCrucFsCakf4xBugDIL4zpYw9Z4DYNj
   a9WU9PlbJlyqxy9WE17+RSSo6q7jECAoFYZ4ZWD/D+WTp+RWMtWaVEAHs
   W6hWVWizv0Ap7wGWSZPYufr6FNTHa61TfodxJKn7ycYsZYsCIMeX084Qx
   UxjXEX0SozMuiZO0z5hXC6vDuM5nD4u3v2tTDk05DZH5+GfImnXpKANOC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237220913"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237220913"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 22:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="599782285"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2022 22:42:01 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVRqj-000FdW-7W; Sat, 19 Mar 2022 05:42:01 +0000
Date: Sat, 19 Mar 2022 13:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jlayton:ceph-fscrypt-sparse 14/69] net/ceph/osd_client.c:5846:30:
 error: initializing 'struct ceph_sparse_extent *' with an expression of
 incompatible type 'struct ceph_sparse_extent'; take the address with &
Message-ID: <202203191347.e08ajS69-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ceph-fscrypt-sparse
head:   a6125c2dec56f1f523f5009ce8b25932ba4be812
commit: e969e142a5b44ddaee26f3effb0903e5ae9c56c7 [14/69] libceph: add sparse read support to OSD client
config: s390-randconfig-c005-20220317 (https://download.01.org/0day-ci/archive/20220319/202203191347.e08ajS69-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=e969e142a5b44ddaee26f3effb0903e5ae9c56c7
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ceph-fscrypt-sparse
        git checkout e969e142a5b44ddaee26f3effb0903e5ae9c56c7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash net/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/ceph/osd_client.c:17:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:40:
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
   In file included from net/ceph/osd_client.c:17:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:40:
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
   In file included from net/ceph/osd_client.c:17:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:40:
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
>> net/ceph/osd_client.c:5846:30: error: initializing 'struct ceph_sparse_extent *' with an expression of incompatible type 'struct ceph_sparse_extent'; take the address with &
                   struct ceph_sparse_extent *ext = sr->sr_extent[i];
                                              ^     ~~~~~~~~~~~~~~~~
                                                    &
   12 warnings and 1 error generated.


vim +5846 net/ceph/osd_client.c

  5839	
  5840	#ifdef __BIG_ENDIAN
  5841	static inline void convert_extent_map(struct ceph_sparse_read *sr)
  5842	{
  5843		int i;
  5844	
  5845		for (i = 0; i < sr->sr_count; i++) {
> 5846			struct ceph_sparse_extent *ext = sr->sr_extent[i];
  5847	
  5848			ext->off = le64_to_cpu((__force __le32)ext->off);
  5849			ext->len = le64_to_cpu((__force __le32)ext->len);
  5850		}
  5851	}
  5852	#else
  5853	static inline void convert_extent_map(struct ceph_sparse_read *sr)
  5854	{
  5855	}
  5856	#endif
  5857	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
