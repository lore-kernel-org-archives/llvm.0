Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56F33C9;
	Wed,  8 Feb 2023 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675875019; x=1707411019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GhtWmy7WcRMNonu9xfHvzyoT6GnoZpuEhhsb5dVRKGk=;
  b=V7HTgvEBeaEb9d3+orGW/Qzp7fHIKbp/50uvDACmHaXtAPP8xnr/Htdk
   VWpBngC9IZubuAwTMMnmM0l3idQASQNc5Y7X6Go24CiU+bwVcltU2cxVc
   6kz0LI5B9wqwwOjoImyPYlzsMkrDMIxoYUEuyMwOVYfB1mJA5OJaCv9nj
   UOrt2xb7qdXgikaQ2kSh9yv4ZlLzEPZb4SkonOXXu1sZbD6rlASvBstks
   XBCWcvJ0621jsqpL1829LwgAhIYrCXmwZpuMYKG949okHLDuNY8qkoRj/
   eFC+/i1zU9CZxOslAkYlofac/mGnU/5FjaFN6NZHuvW932gHOXwCkHtBD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317858212"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="317858212"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 08:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="841253189"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="841253189"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2023 08:50:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPne4-0004YY-2f;
	Wed, 08 Feb 2023 16:50:08 +0000
Date: Thu, 9 Feb 2023 00:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Willem-Jan de Hoog <arinc9.unal@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Willem-Jan de Hoog <wdehoog@exalondelft.nl>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	erkin.bozoglu@xeront.com
Subject: Re: [PATCH 1/2] firmware: bcm47xx_nvram: allow to read from buffered
 nvram data
Message-ID: <202302090020.TxUXGMeJ-lkp@intel.com>
References: <20230206100502.20243-2-wdehoog@exalondelft.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206100502.20243-2-wdehoog@exalondelft.nl>

Hi Willem-Jan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc7 next-20230208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Willem-Jan-de-Hoog/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-180737
patch link:    https://lore.kernel.org/r/20230206100502.20243-2-wdehoog%40exalondelft.nl
patch subject: [PATCH 1/2] firmware: bcm47xx_nvram: allow to read from buffered nvram data
config: x86_64-randconfig-a006-20230206 (https://download.01.org/0day-ci/archive/20230209/202302090020.TxUXGMeJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/763f6661565b50b967e4f22e41cf46d27e14e58f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Willem-Jan-de-Hoog/firmware-bcm47xx_nvram-allow-to-read-from-buffered-nvram-data/20230206-180737
        git checkout 763f6661565b50b967e4f22e41cf46d27e14e58f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:12:
>> include/linux/bcm47xx_nvram.h:56:2: error: expected identifier or '('
   }:
    ^
   In file included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:14:
   In file included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h:9:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:15:
>> include/linux/mmap_lock.h:28:6: error: use of undeclared identifier '__tracepoint_mmap_lock_start_locking'; did you mean '__tracepoint_mmap_lock_released'?
           if (tracepoint_enabled(mmap_lock_start_locking))
               ^
   include/linux/tracepoint-defs.h:85:21: note: expanded from macro 'tracepoint_enabled'
           static_key_false(&(__tracepoint_##tp).key)
                              ^
   <scratch space>:48:1: note: expanded from here
   __tracepoint_mmap_lock_start_locking
   ^
   include/linux/mmap_lock.h:16:1: note: '__tracepoint_mmap_lock_released' declared here
   DECLARE_TRACEPOINT(mmap_lock_released);
   ^
   include/linux/tracepoint-defs.h:81:27: note: expanded from macro 'DECLARE_TRACEPOINT'
           extern struct tracepoint __tracepoint_##tp
                                    ^
   <scratch space>:47:1: note: expanded from here
   __tracepoint_mmap_lock_released
   ^
   2 errors generated.


vim +56 include/linux/bcm47xx_nvram.h

    52	
    53	static inline int bcm47xx_nvram_read(unsigned int offset, char *val, size_t val_len)
    54	{
    55		return -ENOTSUPP;
  > 56	}:
    57	#endif
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
