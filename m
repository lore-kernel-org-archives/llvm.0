Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36F2F3B;
	Wed, 12 Apr 2023 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681291326; x=1712827326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xKC0AyKqSaEA1Jo4VwswA9FjS+DTm7d4BwjdoKcnBw=;
  b=BtOS3UsaQn9IZQQypkm3gbDA6XEUkNTwlkY9ge7K6pJRtpXylmaS+ou6
   sMTdBebUfOAyJ2kjZX9xPlwaVjTD3Z3lvPMZmXsNOVVttNhUmB1kDJi+L
   erohJTcPKSwbqlIpKMJd2eNQ4hsi5pyOWFlvVjCbPUlLIz364iR7xtOn4
   +in0HwgHz9ioj5viB1SwzqOyGIldMsjZFjEwq0AuctaGXNYnW/tlsNMHE
   vIJ8NQeVtworJOy1VRWd2LYwsFG3U0i29SgPGqbkQRJTPAkNzKQS6pfTm
   L8IV/25ul7hQGgvUuNjv8LxP61B0Oi+89aBFzwylPdKa6EN98qnqiYLxt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327956616"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="327956616"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 02:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="721499792"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="721499792"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Apr 2023 02:22:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmWfz-000XZD-2b;
	Wed, 12 Apr 2023 09:22:03 +0000
Date: Wed, 12 Apr 2023 17:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10168/10976]
 drivers/tty/serial/samsung_tty.c:2034:10: error: implicit declaration of
 function 'of_device_get_match_data' is invalid in C99
Message-ID: <202304121702.bav49HFN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 6f2db1788a53dcdbe6fe5639583e871e017f7167 [10168/10976] cpufreq: Adjust includes to remove of_device.h
config: i386-buildonly-randconfig-r004-20230410 (https://download.01.org/0day-ci/archive/20230412/202304121702.bav49HFN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6f2db1788a53dcdbe6fe5639583e871e017f7167
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f2db1788a53dcdbe6fe5639583e871e017f7167
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121702.bav49HFN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/tty/serial/samsung_tty.c:2034:10: error: implicit declaration of function 'of_device_get_match_data' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   return of_device_get_match_data(&pdev->dev);
                          ^
   drivers/tty/serial/samsung_tty.c:2034:10: note: did you mean 'device_get_match_data'?
   include/linux/property.h:396:13: note: 'device_get_match_data' declared here
   const void *device_get_match_data(const struct device *dev);
               ^
>> drivers/tty/serial/samsung_tty.c:2034:10: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'const struct s3c24xx_serial_drv_data *' [-Wint-conversion]
                   return of_device_get_match_data(&pdev->dev);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/of_device_get_match_data +2034 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  2029  
97a6cfe8115b04 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2030  static inline const struct s3c24xx_serial_drv_data *
695b847b247cff drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2020-06-17  2031  s3c24xx_get_driver_data(struct platform_device *pdev)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2032  {
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2033  	if (dev_of_node(&pdev->dev))
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08 @2034  		return of_device_get_match_data(&pdev->dev);
9fe0d41ffd39cb drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12-10  2035  
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2036  	return (struct s3c24xx_serial_drv_data *)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2037  			platform_get_device_id(pdev)->driver_data;
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2038  }
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2039  

:::::: The code at line 2034 was first introduced by commit
:::::: f25fbd5b1ef3773bd975135f8a017dc2251626cc tty: serial: samsung: simplify getting OF match data

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
