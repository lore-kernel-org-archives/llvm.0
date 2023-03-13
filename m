Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFD28F2;
	Mon, 13 Mar 2023 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678722887; x=1710258887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pk2pcgHvwszarrx8dyU/HQ5+yjNieIPrKsK2/87vmrw=;
  b=nzM1OQBVtnP4YUD/XIkq3mNRIJ9L2kzLBV7Jg8Y8bNB2bwzk+BCJkaT0
   nZ0gjaRrS3XbL/oGWHyuCSWiRJCKKF55vEgIJ+e2xN2vPdbibbK7Bhvrs
   0KhRYxvfZqVoTp6+I9BijBP9a9KulOiwt0L4gxKR+iZNozK7RpYeLo1B9
   oLpkjhs479+Xb+ipuyYFgEZa7nqFREktwYE8qxcHDJb4KAa6E+JoLjwsw
   cIapEYAltwhnrrltgi8xfdU/7YsXHWDtNrZDkMZbNjegrXvI2O/UHjNk1
   PrOxLzMDJjouBBDzv+gb5V+w6STa8u6RgTVzGR/g5Q2Os++QbCQPka4RJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337207777"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="337207777"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 08:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="767755597"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="767755597"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2023 08:54:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbkVH-0005qY-2b;
	Mon, 13 Mar 2023 15:54:27 +0000
Date: Mon, 13 Mar 2023 23:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/ptp/ptp_ines.c:837:34: warning: unused variable
 'ines_ptp_ctrl_of_match'
Message-ID: <202303132337.r2XEl3lP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eeac8ede17557680855031c6f305ece2378af326
commit: bad1eaa6ac312ffd7aa46dd5a4d9843b824aa023 ptp: Add a driver for InES time stamping IP core.
date:   3 years, 3 months ago
config: x86_64-randconfig-a013-20230313 (https://download.01.org/0day-ci/archive/20230313/202303132337.r2XEl3lP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bad1eaa6ac312ffd7aa46dd5a4d9843b824aa023
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bad1eaa6ac312ffd7aa46dd5a4d9843b824aa023
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ptp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132337.r2XEl3lP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_ines.c:481:37: warning: format specifies type 'unsigned char' but the argument has type 'int' [-Wformat]
                             tag_to_msgtype(ts->tag & 0x7), *msgtype & 0xf);
                                                            ^~~~~~~~~~~~~~
   include/linux/device.h:1792:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   drivers/ptp/ptp_ines.c:491:19: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                             ts->portnum, ntohs(*portn));
                                          ^~~~~~~~~~~~~
   include/linux/device.h:1792:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: expanded from macro 'ntohs'
   #define ntohs(x) ___ntohs(x)
                    ^~~~~~~~~~~
   include/linux/byteorder/generic.h:137:21: note: expanded from macro '___ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)
                       ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:42:26: note: expanded from macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:104:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ines.c:496:17: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                             ts->seqid, ntohs(*seqid));
                                        ^~~~~~~~~~~~~
   include/linux/device.h:1792:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: expanded from macro 'ntohs'
   #define ntohs(x) ___ntohs(x)
                    ^~~~~~~~~~~
   include/linux/byteorder/generic.h:137:21: note: expanded from macro '___ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)
                       ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:42:26: note: expanded from macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:104:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ptp/ptp_ines.c:837:34: warning: unused variable 'ines_ptp_ctrl_of_match' [-Wunused-const-variable]
   static const struct of_device_id ines_ptp_ctrl_of_match[] = {
                                    ^
   4 warnings generated.


vim +/ines_ptp_ctrl_of_match +837 drivers/ptp/ptp_ines.c

   836	
 > 837	static const struct of_device_id ines_ptp_ctrl_of_match[] = {
   838		{ .compatible = "ines,ptp-ctrl" },
   839		{ }
   840	};
   841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
