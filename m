Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8F2CA6;
	Tue, 14 Mar 2023 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678830715; x=1710366715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFgYVWtp47x6Yu76loDPS4sdVJSMEk4BKWRjZJRe1e8=;
  b=eLiW+2WeJKSiYN+kkPRcceSJ6BU9R5vfZxEFr0av9awAKi0uRIMMrWq6
   4B0gCLeiao8EmpZgIFJ6e6bQIpDWLWpScZqieV+veNT4Lmfu6B7jflXPC
   45punafDr1kfmarVeIrzDo+0eTGya8zLtagMPkeYlYECxChGi1pryhHt+
   X94FnmNVBvXlE/0Lj1ZMcokvBvUP1qGvkffkkT5jozpAC0w/DamOKQfqr
   3sMkmYmuiNQCqnkFO3vilw766n2jrcVEDXPL3u/xKitnjXdo6n8K12TWX
   PAJNcSyNLX7ZIvbsmUJQY4+8msuKkMPyEqPyWnx1w1+5TW1hGuXJRsCv1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365226622"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365226622"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 14:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822540793"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="822540793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 14:51:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcCYi-0007DY-1L;
	Tue, 14 Mar 2023 21:51:52 +0000
Date: Wed, 15 Mar 2023 05:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 39/39] fs/nfsd/vfs.c:955:38: error:
 incompatible function pointer types passing 'int (struct pipe_inode_info *,
 struct pipe_buffer *, struct splice_desc *)' to parameter of type
 'splice_actor *' (aka 'int (*)(struct pipe_inode_info *, struct splice_desc
 *, unsig...
Message-ID: <202303150522.eOv2s5rr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 04b41c19739aec7e0cae6cba28b4e317d703a614 [39/39] pipe, splice: Pass a bio_vec to splice_actor, not a pipe_buffer
config: hexagon-randconfig-r023-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150522.eOv2s5rr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=04b41c19739aec7e0cae6cba28b4e317d703a614
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 04b41c19739aec7e0cae6cba28b4e317d703a614
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150522.eOv2s5rr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/vfs.c:19:
   In file included from include/linux/splice.h:12:
   In file included from include/linux/pipe_fs_i.h:5:
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
   In file included from fs/nfsd/vfs.c:19:
   In file included from include/linux/splice.h:12:
   In file included from include/linux/pipe_fs_i.h:5:
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
   In file included from fs/nfsd/vfs.c:19:
   In file included from include/linux/splice.h:12:
   In file included from include/linux/pipe_fs_i.h:5:
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
>> fs/nfsd/vfs.c:955:38: error: incompatible function pointer types passing 'int (struct pipe_inode_info *, struct pipe_buffer *, struct splice_desc *)' to parameter of type 'splice_actor *' (aka 'int (*)(struct pipe_inode_info *, struct splice_desc *, unsigned int, struct bio_vec *)') [-Wincompatible-function-pointer-types]
           return __splice_from_pipe(pipe, sd, nfsd_splice_actor);
                                               ^~~~~~~~~~~~~~~~~
   include/linux/splice.h:75:41: note: passing argument to parameter here
                                     struct splice_desc *, splice_actor);
                                                                       ^
   6 warnings and 1 error generated.


vim +955 fs/nfsd/vfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  951  
cf8208d0eabd1d Jens Axboe     2007-06-12  952  static int nfsd_direct_splice_actor(struct pipe_inode_info *pipe,
cf8208d0eabd1d Jens Axboe     2007-06-12  953  				    struct splice_desc *sd)
cf8208d0eabd1d Jens Axboe     2007-06-12  954  {
cf8208d0eabd1d Jens Axboe     2007-06-12 @955  	return __splice_from_pipe(pipe, sd, nfsd_splice_actor);
cf8208d0eabd1d Jens Axboe     2007-06-12  956  }
cf8208d0eabd1d Jens Axboe     2007-06-12  957  

:::::: The code at line 955 was first introduced by commit
:::::: cf8208d0eabd1d5d2625ec02a175a294c3f30d36 sendfile: convert nfsd to splice_direct_to_actor()

:::::: TO: Jens Axboe <jens.axboe@oracle.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
