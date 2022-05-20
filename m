Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519317C3
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653038138; x=1684574138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfuSkAOFPzT7Yq96d+tGz0uFUcIEUKXPQZTW7LoRwi8=;
  b=Y8FE3cnjPuOIURwDbRYt0WM3q2z80jTojsCKt3Fz82gwLDs/6rCDruuo
   sNSMjGheBYzs81RCTt4n33ccU36aDwjefJKDN2wApaXQXR/oedTs9CuSQ
   01yA2X4nr1OPR8Q/fKS5X+u51b+zqlvvIkZyRhyX0u18QyO2PB+V2X2Rg
   /R8cRS0W4kIDkKDSmXNsthT5i1qTz1wtw8Kmdk5roMoAR0Rp4eWiw8p3r
   xYYa6F6teY++KtYS/pEvgady8cJ21I4YJ3WkloDsyPDjOkS3eG+FVt0KE
   e0LTDbERLvon+d0tj/bmB+3fTkwDZRFCLaXJ8LmnpmsDrsNY+j2ECu7C6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="260130062"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="260130062"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 02:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="524560779"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 May 2022 02:15:36 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nryjQ-0004Xr-19;
	Fri, 20 May 2022 09:15:36 +0000
Date: Fri, 20 May 2022 17:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] netfs: Fix gcc-12 warning by embedding vfs inode in
 netfs_i_context
Message-ID: <202205201704.QywgxU3d-lkp@intel.com>
References: <165296786831.3591209.12111293034669289733.stgit@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165296786831.3591209.12111293034669289733.stgit@warthog.procyon.org.uk>

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on ceph-client/for-linus]
[also build test ERROR on cifs/for-next linus/master v5.18-rc7]
[cannot apply to kees/for-next/pstore next-20220519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/netfs-Fix-gcc-12-warning-by-embedding-vfs-inode-in-netfs_i_context/20220519-214842
base:   https://github.com/ceph/ceph-client.git for-linus
config: riscv-buildonly-randconfig-r003-20220519 (https://download.01.org/0day-ci/archive/20220520/202205201704.QywgxU3d-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c6351083b2bff7647113155cb6dd3ee7ed32ced5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/netfs-Fix-gcc-12-warning-by-embedding-vfs-inode-in-netfs_i_context/20220519-214842
        git checkout c6351083b2bff7647113155cb6dd3ee7ed32ced5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/cifs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/cifs/fscache.c:9:
   In file included from fs/cifs/fscache.h:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/cifs/fscache.c:9:
   In file included from fs/cifs/fscache.h:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/cifs/fscache.c:9:
   In file included from fs/cifs/fscache.h:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> fs/cifs/fscache.c:106:9: error: no member named 'netfs_ctx' in 'struct cifsInodeInfo'
           cifsi->netfs_ctx.cache =
           ~~~~~  ^
   fs/cifs/fscache.c:134:10: error: no member named 'netfs_ctx' in 'struct cifsInodeInfo'
                   cifsi->netfs_ctx.cache = NULL;
                   ~~~~~  ^
   7 warnings and 2 errors generated.


vim +106 fs/cifs/fscache.c

402cb8dda949d9 David Howells    2018-04-04   96  
70431bfd825d9c David Howells    2020-11-17   97  void cifs_fscache_get_inode_cookie(struct inode *inode)
9451a9a52f91a4 Suresh Jayaraman 2010-07-05   98  {
70431bfd825d9c David Howells    2020-11-17   99  	struct cifs_fscache_inode_coherency_data cd;
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  100  	struct cifsInodeInfo *cifsi = CIFS_I(inode);
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  101  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
96daf2b09178d8 Steve French     2011-05-27  102  	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  103  
c6351083b2bff7 David Howells    2022-05-19  104  	cifs_fscache_fill_coherency(&cifsi->nic.inode, &cd);
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  105  
bc899ee1c898e5 David Howells    2021-06-29 @106  	cifsi->netfs_ctx.cache =
70431bfd825d9c David Howells    2020-11-17  107  		fscache_acquire_cookie(tcon->fscache, 0,
70431bfd825d9c David Howells    2020-11-17  108  				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
70431bfd825d9c David Howells    2020-11-17  109  				       &cd, sizeof(cd),
c6351083b2bff7 David Howells    2022-05-19  110  				       i_size_read(&cifsi->nic.inode));
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  111  }
9451a9a52f91a4 Suresh Jayaraman 2010-07-05  112  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
