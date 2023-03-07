Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4636FC5;
	Tue,  7 Mar 2023 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678195524; x=1709731524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWmhU6GENjWUmkSVfiutlm0bMIv2BAPjUQskhfzS3s4=;
  b=B1gzdtIA6x0BTGN/Kgz+Ijoom1rQLMqKUgNOCx7VgPPBU+OwBbyvV/dW
   NRFRiZ8/940gKSra5ggDnTO4MBukP2y2BoTGIDKoLIJ+++7qWKAUDXl0l
   6EyDW+1xBNem77fvgKpL7X89awRD3yUBV4Ws4wqnEZQF4tf+aRUm3si8v
   nnVIiOM59Y7utZWE4I9/3kEFP9gUTHlmt3a/MLPrgqYzHbwDH5DL85sKM
   5CVYAPqeyfK2mSsTAlW/LdVuhXrln9kfjRwHPxJvdYFk1Nrmpz337UXaI
   prj68xjfbshZYr6fESPV5h2msHw8+ee+ReWJcsUSyqGgpRJ83GHTDn8f8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334562378"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="334562378"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 05:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="765639366"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="765639366"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2023 05:25:07 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZXJS-0001Lr-2s;
	Tue, 07 Mar 2023 13:25:06 +0000
Date: Tue, 7 Mar 2023 21:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.fd 7/8]
 kernel/cgroup/cgroup.c:6861:4: error: assigning to 'struct fd *' from
 incompatible type 'struct fd'
Message-ID: <202303072147.0eID82fX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.fd
head:   792be394ebd3f30e973319f4a8019c294ca02ce2
commit: 96416baecdcc05aa7bfe16986dd9955e613ed808 [7/8] cgroup_get_from_fd(): switch to fdget_raw()
config: s390-randconfig-r034-20230305 (https://download.01.org/0day-ci/archive/20230307/202303072147.0eID82fX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/96416baecdcc05aa7bfe16986dd9955e613ed808
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.fd
        git checkout 96416baecdcc05aa7bfe16986dd9955e613ed808
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/cgroup/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072147.0eID82fX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/cgroup.c:33:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/cgroup/cgroup.c:33:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/cgroup/cgroup.c:33:
   In file included from include/linux/bpf-cgroup.h:11:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/cgroup/cgroup.c:6861:4: error: assigning to 'struct fd *' from incompatible type 'struct fd'
           f = fdget_raw(fd);
             ^ ~~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:6862:8: error: member reference type 'struct fd *' is a pointer; did you mean to use '->'?
           if (!f.file)
                ~^
                 ->
   kernel/cgroup/cgroup.c:6865:36: error: member reference type 'struct fd *' is a pointer; did you mean to use '->'?
           cgrp = cgroup_v1v2_get_from_file(f.file);
                                            ~^
                                             ->
>> kernel/cgroup/cgroup.c:6866:8: error: passing 'struct fd *' to parameter of incompatible type 'struct fd'; dereference with *
           fdput(f);
                 ^
                 *
   include/linux/file.h:42:36: note: passing argument to parameter 'fd' here
   static inline void fdput(struct fd fd)
                                      ^
   12 warnings and 4 errors generated.


vim +6861 kernel/cgroup/cgroup.c

  6846	
  6847	/**
  6848	 * cgroup_v1v2_get_from_fd - get a cgroup pointer from a fd
  6849	 * @fd: fd obtained by open(cgroup_dir)
  6850	 *
  6851	 * Find the cgroup from a fd which should be obtained
  6852	 * by opening a cgroup directory.  Returns a pointer to the
  6853	 * cgroup on success. ERR_PTR is returned if the cgroup
  6854	 * cannot be found.
  6855	 */
  6856	struct cgroup *cgroup_v1v2_get_from_fd(int fd)
  6857	{
  6858		struct cgroup *cgrp;
  6859		struct fd *f;
  6860	
> 6861		f = fdget_raw(fd);
> 6862		if (!f.file)
  6863			return ERR_PTR(-EBADF);
  6864	
  6865		cgrp = cgroup_v1v2_get_from_file(f.file);
> 6866		fdput(f);
  6867		return cgrp;
  6868	}
  6869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
