Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40158139A
	for <llvm@lists.linux.dev>; Sun, 10 Apr 2022 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649627539; x=1681163539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxpzmW2lJIgftIQ43tvUJMQprbRPeePUBTd2vzh+7CY=;
  b=PDGCCpnKw9+YM3feHPs+IxVNjZRem10Vl3HRzsnJ40XUv9tAlxrMUjze
   8kxBD9or+huk10T9WupNJj/anT1CZWaChm00FhPm51kZMcpvhfBG/HGou
   XH7ugpXFL9jR9c5E/MQ/mDZy+zg/3UnuCAMl9Go44hLaVgNrQjA+a8fgO
   lW4PvmZ+ptYtsbAFZBBRfa9tNJSaSxFha0VOWiX7s+a6iVyEMyMuhwW/1
   8R7oWMA9XjwRjv6h2Wnjq+Ff+qDyZXPStCYeQshd6jO2X7W5RgURZUYib
   lMzZTl6XBK3pDSANjGbpRqR0AREJlarsRLLt9kw5p4H9xKDmxVD+0cO4P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="243882426"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="243882426"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 14:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="659804676"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Apr 2022 14:52:17 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndfTl-00017d-0N;
	Sun, 10 Apr 2022 21:52:17 +0000
Date: Mon, 11 Apr 2022 05:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:bitmap-for-next 43/43] lib/bitmap.c:1571:22: warning:
 unsequenced modification and access to 'i'
Message-ID: <202204110545.nVd02heW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/norov/linux bitmap-for-next
head:   a136dfabd10d0c1354c41a069cc4e00147a721e1
commit: a136dfabd10d0c1354c41a069cc4e00147a721e1 [43/43] bitmap_from_arr64
config: arm-hackkit_defconfig (https://download.01.org/0day-ci/archive/20220411/202204110545.nVd02heW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/norov/linux/commit/a136dfabd10d0c1354c41a069cc4e00147a721e1
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov bitmap-for-next
        git checkout a136dfabd10d0c1354c41a069cc4e00147a721e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/bitmap.c:1571:22: warning: unsequenced modification and access to 'i' [-Wunsequenced]
                   buf[i/2] = bitmap[i++];
                       ~              ^
>> lib/bitmap.c:1573:28: warning: shift count >= width of type [-Wshift-count-overflow]
                           buf[i/2] |= bitmap[i++] << 32;
                                                   ^  ~~
   lib/bitmap.c:1573:24: warning: unsequenced modification and access to 'i' [-Wunsequenced]
                           buf[i/2] |= bitmap[i++] << 32;
                               ~               ^
   3 warnings generated.


vim +/i +1571 lib/bitmap.c

  1559	
  1560	/**
  1561	 * bitmap_to_arr64 - copy the contents of bitmap to a u64 array of bits
  1562	 *	@buf: array of u64 (in host byte order), the dest bitmap
  1563	 *	@bitmap: array of unsigned longs, the source bitmap
  1564	 *	@nbits: number of bits in @bitmap
  1565	 */
  1566	void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits)
  1567	{
  1568		unsigned int i = 0, words = BITS_TO_LONGS(nbits);
  1569	
  1570		while (i < words) {
> 1571			buf[i/2] = bitmap[i++];
  1572			if (i < words)
> 1573				buf[i/2] |= bitmap[i++] << 32;
  1574		}
  1575	
  1576		/* Clear tail bits in last element of array beyond nbits. */
  1577		if (nbits % 64)
  1578			buf[i - 1] &= GENMASK_ULL(nbits, 0);
  1579	}
  1580	EXPORT_SYMBOL(bitmap_to_arr64);
  1581	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
