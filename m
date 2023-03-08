Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16409387;
	Wed,  8 Mar 2023 01:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678237953; x=1709773953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASrLzrmvbT/8Xeywknk0MDg0JNXEUX9zZ+58Vfi0c7A=;
  b=VYSDLl1Zz6XGG6G5MqVkV7s5yt3ocAb4m+MXEO32MSm82WR0qW9Ao0qj
   jraqZKYDRKrnjiRT5hX36z0XP8bZfw8h2V61/ZASw/DUFMQxI06odozEV
   U1Pg9XxuzNyj+XPJ1qPV2ugG8GaVzVxdEkRRRFWYXk41EW8TXj2gmS7MK
   w55a9YuH87PX3bE8Ge+m4lxXSmVbItcBJT8TL7Tn0w6xAOxLKkFl7Vpoz
   FCGR1nKTlVv98lTDeiCvLrfHyfx3myFMpbwMtCWxIdIz7N7qk0jlRnwbw
   eGjgESCB1P9FcMiJP0f5kjTbXD5D9RCeuSn4d08zIBQNjdGQrqC10qwrz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338345255"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="338345255"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 17:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626742308"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="626742308"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 17:12:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZiM1-0001kp-2v;
	Wed, 08 Mar 2023 01:12:29 +0000
Date: Wed, 8 Mar 2023 09:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 34/35]
 include/linux/of_device.h:59:1: error: non-void function does not return a
 value in all control paths
Message-ID: <202303080934.iCaF59Gr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: a45923134df95195ab31640803313c5225274a2a [34/35] of: module: Mutate of_device_uevent_modalias() into two helpers
config: i386-randconfig-a015-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080934.iCaF59Gr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/a45923134df95195ab31640803313c5225274a2a
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout a45923134df95195ab31640803313c5225274a2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080934.iCaF59Gr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tis_spi_main.c:31:
>> include/linux/of_device.h:59:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   In file included from drivers/char/tpm/tpm_tis_spi_main.c:35:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   1 warning and 1 error generated.


vim +59 include/linux/of_device.h

    52	
    53	static inline int of_device_uevent_modalias(const struct device *dev,
    54						    struct kobj_uevent_env *env)
    55	{
    56		if (!dev || !dev->of_node || dev->of_node_reused)
    57	
    58			return of_uevent_modalias(dev->of_node, env);
  > 59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
