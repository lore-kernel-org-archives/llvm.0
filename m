Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C73D6D
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661519873; x=1693055873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPn1EtiMFKGHcPdCC0f3ib5zE5rs81qHeE7iBw/tRMQ=;
  b=LllOdcTzpedKxVw04Pd/GgFN+ICWIfG1eEnOyy7/KAGsGXNuVqnHjafV
   7DAm1gps0Zsp+yiYrUUAsIIZqjg53dUPDQrYyOQy6Lq7fp76mt50biT7C
   wjc01y4+9lZtEZcDdFyZBIfdfUFAtwMNlmWVZv4Nm4vQXWimrVqnL0YrU
   e5RWJV/LPey93+yjkIgcBj8c1+pAY2o8I+BVhG1jOEouxlgDEoh2VzkMa
   0K+uSkt8xl4TtycW44FJz4b5SfhcbqRbe84zdv0N+saMj/pzA7uOcIyXY
   XjKlkhlBilo0lAS9XcAAjZCx7NMZlazRoJoMjNZekC8yi+TLr1vQPqw8F
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295281577"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="295281577"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 06:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="643655098"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Aug 2022 06:17:42 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRZDR-00049c-2h;
	Fri, 26 Aug 2022 13:17:41 +0000
Date: Fri, 26 Aug 2022 21:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [alobakin:ip_tunnel 4/12] include/net/netlink.h:1907:1: warning:
 excess elements in array initializer
Message-ID: <202208262105.qPWnx5Kw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux ip_tunnel
head:   161f62c9d5cafdbc3216f026a7b7ca32d004b46b
commit: f5876d635ecb78e9ab3bcf7a73e0e08638524fc8 [4/12] netlink: add 'bitmap' attribute type (%NL_ATTR_TYPE_BITMAP / %NLA_BITMAP)
config: arm-randconfig-r003-20220823 (https://download.01.org/0day-ci/archive/20220826/202208262105.qPWnx5Kw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/alobakin/linux/commit/f5876d635ecb78e9ab3bcf7a73e0e08638524fc8
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin ip_tunnel
        git checkout f5876d635ecb78e9ab3bcf7a73e0e08638524fc8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:19:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
>> include/net/netlink.h:1907:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_TYPE(s8);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:19:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1908:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_TYPE(u8);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:19:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1910:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(s);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1903:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##16);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:19:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1910:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(s);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1904:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##32);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:19:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1911:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(u);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1903:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##16);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from init/do_mounts.c:22:
   In file included from include/linux/nfs_fs.h:32:
   In file included from include/linux/sunrpc/clnt.h:29:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:93:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
--
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
>> include/net/netlink.h:1907:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_TYPE(s8);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1908:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_TYPE(u8);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1910:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(s);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1903:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##16);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1910:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(s);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1904:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##32);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1911:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(u);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1903:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##16);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1911:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(u);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1904:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##32);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/kallsyms.c:25:
   In file included from include/linux/filter.h:26:
   In file included from include/net/sch_generic.h:20:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1912:1: warning: excess elements in array initializer [-Wexcess-initializers]
   NLA_BUILD_BIGINT_ORDER(be);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1903:2: note: expanded from macro 'NLA_BUILD_BIGINT_ORDER'
           NLA_BUILD_BIGINT_TYPE(order##16);                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1869:3: note: expanded from macro 'NLA_BUILD_BIGINT_TYPE'
                   BITMAP_FROM_U64((u64)value),                             \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:581:5: note: expanded from macro 'BITMAP_FROM_U64'
                                   ((unsigned long) ((u64)(n) >> 32))


vim +1907 include/net/netlink.h

  1901	
  1902	#define NLA_BUILD_BIGINT_ORDER(order)					 \
  1903		NLA_BUILD_BIGINT_TYPE(order##16);				 \
  1904		NLA_BUILD_BIGINT_TYPE(order##32);				 \
  1905		NLA_BUILD_BIGINT_TYPE(order##64)
  1906	
> 1907	NLA_BUILD_BIGINT_TYPE(s8);
  1908	NLA_BUILD_BIGINT_TYPE(u8);
  1909	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
