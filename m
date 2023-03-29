Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6540538F;
	Wed, 29 Mar 2023 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680111906; x=1711647906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMOXyDeVzJ3j+xeipcDWucOpeVbJcD6JlDeQMNXmtTs=;
  b=MxcQhpvOSh9DY6Et/yp200ItmbcDCbmcFmkjF1oTcgY3oPajDR8cfNL9
   gvep8f2Zw82AJPYaROle38AExfbhgTEgNmCfH6dizkgOJbmPLXkg9utOI
   oBiXoKfxL0P3j04v/NGe3mOXCs01IB0x1BprpuwvxVt0oRyTK3pan7rre
   RrY1gbK5HOB0l0gPp+nXjkIadvlM3yapQnPa+pBHIb3z/4zOy5rIjbXsE
   cMjde5oa/SRSmGdqMt5Wqx4/2ay3/qjFypSm0WkZSJFx1Q9l6sarfprah
   haK+z6JomdwlcwYynnIuL2dXXB/j9WVlS0D/N0SLAJjCNXMS1bhdzeJR4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427226832"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427226832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773664594"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773664594"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 10:45:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phZr6-000Jlw-04;
	Wed, 29 Mar 2023 17:45:04 +0000
Date: Thu, 30 Mar 2023 01:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 63/63] net/kcm/kcmsock.c:1883:3: error:
 field designator 'sendpage' does not refer to any field in type 'const
 struct proto_ops'
Message-ID: <202303300136.kAqovaSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: 39e48c1301bf2fb60a53912fe5870a253256debc [63/63] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: s390-randconfig-r044-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300136.kAqovaSa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=39e48c1301bf2fb60a53912fe5870a253256debc
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout 39e48c1301bf2fb60a53912fe5870a253256debc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash net/kcm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300136.kAqovaSa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/kcm/kcmsock.c:10:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
   In file included from net/kcm/kcmsock.c:10:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
   In file included from net/kcm/kcmsock.c:10:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
>> net/kcm/kcmsock.c:1883:3: error: field designator 'sendpage' does not refer to any field in type 'const struct proto_ops'
           .sendpage =     kcm_sendpage,
            ^
   net/kcm/kcmsock.c:1904:3: error: field designator 'sendpage' does not refer to any field in type 'const struct proto_ops'
           .sendpage =     kcm_sendpage,
            ^
   12 warnings and 2 errors generated.


vim +1883 net/kcm/kcmsock.c

ab7ac4eb9832e3 Tom Herbert    2016-03-07  1864  
91687355b92735 Tom Herbert    2016-03-07  1865  static const struct proto_ops kcm_dgram_ops = {
91687355b92735 Tom Herbert    2016-03-07  1866  	.family =	PF_KCM,
91687355b92735 Tom Herbert    2016-03-07  1867  	.owner =	THIS_MODULE,
91687355b92735 Tom Herbert    2016-03-07  1868  	.release =	kcm_release,
91687355b92735 Tom Herbert    2016-03-07  1869  	.bind =		sock_no_bind,
91687355b92735 Tom Herbert    2016-03-07  1870  	.connect =	sock_no_connect,
91687355b92735 Tom Herbert    2016-03-07  1871  	.socketpair =	sock_no_socketpair,
91687355b92735 Tom Herbert    2016-03-07  1872  	.accept =	sock_no_accept,
91687355b92735 Tom Herbert    2016-03-07  1873  	.getname =	sock_no_getname,
a11e1d432b51f6 Linus Torvalds 2018-06-28  1874  	.poll =		datagram_poll,
91687355b92735 Tom Herbert    2016-03-07  1875  	.ioctl =	kcm_ioctl,
91687355b92735 Tom Herbert    2016-03-07  1876  	.listen =	sock_no_listen,
91687355b92735 Tom Herbert    2016-03-07  1877  	.shutdown =	sock_no_shutdown,
91687355b92735 Tom Herbert    2016-03-07  1878  	.setsockopt =	kcm_setsockopt,
91687355b92735 Tom Herbert    2016-03-07  1879  	.getsockopt =	kcm_getsockopt,
91687355b92735 Tom Herbert    2016-03-07  1880  	.sendmsg =	kcm_sendmsg,
91687355b92735 Tom Herbert    2016-03-07  1881  	.recvmsg =	kcm_recvmsg,
91687355b92735 Tom Herbert    2016-03-07  1882  	.mmap =		sock_no_mmap,
f29698fc6b3a45 Tom Herbert    2016-03-07 @1883  	.sendpage =	kcm_sendpage,
91687355b92735 Tom Herbert    2016-03-07  1884  };
91687355b92735 Tom Herbert    2016-03-07  1885  

:::::: The code at line 1883 was first introduced by commit
:::::: f29698fc6b3a45a5c6147eca8379f38be8232117 kcm: Sendpage support

:::::: TO: Tom Herbert <tom@herbertland.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
