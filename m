Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F77497;
	Mon,  8 May 2023 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683535531; x=1715071531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wALDJ9QKDU7haDxDoA2Pm72qZvWjnd41kSM7OSHACOE=;
  b=MOXpEk9GnpHnaiUpBxMow2WC6rx4x9DratSI1pV3lKE6vnp9ZGU1axC4
   8LlNdS0s3bIbXEvOwgyaa42eWHszRC4BQqO4hfNCIeD5645+qsIG7OwVG
   l9WDEsyHngwW9w+ntoQzjpKxGVu8NdsAUZuWZ0dmjpZd25EHEKPzIOA+d
   FyfZiKAXhuaV7Il0rRiJa+XGhkZ1D0xY/yPzQ6GrLuf+82Wd/CUmwQLxd
   ZD6QM7Jcm1xUwz5J7s3VaPwHgi4u2xPTFMd9gZkpfXmbRVMxSrhgSwuGP
   A3J+URfBrJizLyrLyIOl1lrLt7jHvkeOdfZfjJstA+dHOFgBvoEhR5QLk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349624757"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="349624757"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 01:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="675974536"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="675974536"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 01:45:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvwUq-00019p-0n;
	Mon, 08 May 2023 08:45:28 +0000
Date: Mon, 8 May 2023 16:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 5657/5827]
 drivers/net/ethernet/intel/iavf/i40e_osdep.h:49:18: warning: 'format'
 attribute argument not supported: gnu_printf
Message-ID: <202305081617.4djjIThE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 0b7c849c2c00c3c596922ded9b80bddf154789da [5657/5827] intel-ethernet: rename i40evf to iavf
config: x86_64-randconfig-a004-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081617.4djjIThE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0b7c849c2c00c3c596922ded9b80bddf154789da
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 0b7c849c2c00c3c596922ded9b80bddf154789da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081617.4djjIThE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/iavf/i40evf_main.c:4:
   In file included from drivers/net/ethernet/intel/iavf/i40evf.h:37:
   In file included from drivers/net/ethernet/intel/iavf/i40e_type.h:8:
>> drivers/net/ethernet/intel/iavf/i40e_osdep.h:49:18: warning: 'format' attribute argument not supported: gnu_printf [-Wignored-attributes]
           __attribute__ ((format(gnu_printf, 3, 4)));
                           ^
   1 warning generated.
   drivers/net/ethernet/intel/iavf/i40evf_main.c:1542: warning: Function parameter or member 't' not described in 'i40evf_watchdog_timer'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:1542: warning: Excess function parameter 'data' description in 'i40evf_watchdog_timer'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2325: warning: Function parameter or member 'adapter' not described in 'i40evf_del_all_cloud_filters'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2350: warning: Function parameter or member 'type_data' not described in '__i40evf_setup_tc'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2350: warning: Excess function parameter 'type_date' description in '__i40evf_setup_tc'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2445: warning: Function parameter or member 'f' not described in 'i40evf_parse_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2445: warning: Excess function parameter 'cls_flower' description in 'i40evf_parse_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2853: warning: Function parameter or member 'adapter' not described in 'i40evf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2853: warning: Function parameter or member 'cls_flower' not described in 'i40evf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2853: warning: Excess function parameter 'netdev' description in 'i40evf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2853: warning: Excess function parameter 'type_data' description in 'i40evf_setup_tc_cls_flower'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2898: warning: Function parameter or member 'dev' not described in 'i40evf_setup_tc_block'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2898: warning: Excess function parameter 'netdev' description in 'i40evf_setup_tc_block'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2930: warning: Function parameter or member 'type_data' not described in 'i40evf_setup_tc'
   drivers/net/ethernet/intel/iavf/i40evf_main.c:2930: warning: Excess function parameter 'type_date' description in 'i40evf_setup_tc'
--
   In file included from drivers/net/ethernet/intel/iavf/i40evf_ethtool.c:5:
   In file included from drivers/net/ethernet/intel/iavf/i40evf.h:37:
   In file included from drivers/net/ethernet/intel/iavf/i40e_type.h:8:
>> drivers/net/ethernet/intel/iavf/i40e_osdep.h:49:18: warning: 'format' attribute argument not supported: gnu_printf [-Wignored-attributes]
           __attribute__ ((format(gnu_printf, 3, 4)));
                           ^
   1 warning generated.
--
   In file included from drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:4:
   In file included from drivers/net/ethernet/intel/iavf/i40evf.h:37:
   In file included from drivers/net/ethernet/intel/iavf/i40e_type.h:8:
>> drivers/net/ethernet/intel/iavf/i40e_osdep.h:49:18: warning: 'format' attribute argument not supported: gnu_printf [-Wignored-attributes]
           __attribute__ ((format(gnu_printf, 3, 4)));
                           ^
>> drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1057:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.vlan_id),
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
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
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1060:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.dst_port),
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
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
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1061:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.src_port));
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
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
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1067:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.vlan_id),
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
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
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1070:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.dst_port),
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
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
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/i40evf_virtchnl.c:1071:5: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
                            ntohs(f->data.tcp_spec.src_port));
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1457:33: note: expanded from macro 'dev_info'
           _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/byteorder/generic.h:142:18: note: expanded from macro 'ntohs'
   #define ntohs(x) ___ntohs(x)
                    ^~~~~~~~~~~
   include/linux/byteorder/generic.h:137:21: note: expanded from macro '___ntohs'
   #define ___ntohs(x) __be16_to_cpu(x)


vim +/format +49 drivers/net/ethernet/intel/iavf/i40e_osdep.h

5321a21c1c4e31 drivers/net/ethernet/intel/i40evf/i40e_osdep.h Greg Rose 2013-12-21  46  
5321a21c1c4e31 drivers/net/ethernet/intel/i40evf/i40e_osdep.h Greg Rose 2013-12-21  47  #define i40e_debug(h, m, s, ...)  i40evf_debug_d(h, m, s, ##__VA_ARGS__)
5321a21c1c4e31 drivers/net/ethernet/intel/i40evf/i40e_osdep.h Greg Rose 2013-12-21  48  extern void i40evf_debug_d(void *hw, u32 mask, char *fmt_str, ...)
5321a21c1c4e31 drivers/net/ethernet/intel/i40evf/i40e_osdep.h Greg Rose 2013-12-21 @49  	__attribute__ ((format(gnu_printf, 3, 4)));
5321a21c1c4e31 drivers/net/ethernet/intel/i40evf/i40e_osdep.h Greg Rose 2013-12-21  50  

:::::: The code at line 49 was first introduced by commit
:::::: 5321a21c1c4e3123faa7a6b0b3130bbb158f1c47 i40evf: driver core headers

:::::: TO: Greg Rose <gregory.v.rose@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
