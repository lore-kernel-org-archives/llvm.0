Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8731FDD
	for <llvm@lists.linux.dev>; Sun,  4 Sep 2022 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662270875; x=1693806875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=75WupVR83lbCUwR5/BaxxZtgCEwIO+bXG/+J7JMlQ88=;
  b=iJSYZ+iGOhIc54SOsifvJH4uIze7V9CD74rNAkjR5cgW61Hvy6uhUbYw
   ExlJiycd+mucGrOEvv0lvpKQLP2bXSZwwyv8NWFuPi8idbPvWobleR5hZ
   UdYafoktGecuSwVWTREX7VFIzsDjrjw+eAqICH3wvBxiJMEe49/5zHSyV
   8LJcBySD0+HIkL5NziReA/ZATgnpy49ltpAIFuepJmS6h7THyh3kAKsY6
   WewCsNZ2Zots9TiZIsGejL/hQLUV6Gl3TMR+avNiok262i52j7BZ2K61i
   hD/BXeQPbDm/D0KHsOqkABe16j1Nxq81r1Pan2U0fJuzBcHSAb0LK6ktL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="276609208"
X-IronPort-AV: E=Sophos;i="5.93,288,1654585200"; 
   d="scan'208";a="276609208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 22:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,288,1654585200"; 
   d="scan'208";a="674863697"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2022 22:54:33 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUiaW-0002dJ-39;
	Sun, 04 Sep 2022 05:54:32 +0000
Date: Sun, 4 Sep 2022 13:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 09/13] devdax: Move address_space helpers to the DAX core
Message-ID: <202209041331.SpF1e88q-lkp@intel.com>
References: <166225781235.2351842.9238883139775499926.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166225781235.2351842.9238883139775499926.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

I love your patch! Yet something to improve:

[auto build test ERROR on 1c23f9e627a7b412978b4e852793c5e3c3efc555]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/Fix-the-DAX-gup-mistake/20220904-101909
base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
config: arm-randconfig-r026-20220904 (https://download.01.org/0day-ci/archive/20220904/202209041331.SpF1e88q-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/fad43bd381f272faee26ae09d0741c48a4dbaa14
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dan-Williams/Fix-the-DAX-gup-mistake/20220904-101909
        git checkout fad43bd381f272faee26ae09d0741c48a4dbaa14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
>> include/linux/dax.h:312:10: error: use of undeclared identifier 'PMD_SHIFT'
                   return PMD_SHIFT - PAGE_SHIFT;
                          ^
   In file included from mm/filemap.c:25:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   In file included from mm/readahead.c:118:
>> include/linux/dax.h:312:10: error: use of undeclared identifier 'PMD_SHIFT'
                   return PMD_SHIFT - PAGE_SHIFT;
                          ^
   1 error generated.


vim +/PMD_SHIFT +312 include/linux/dax.h

   306	
   307	static inline unsigned int pe_order(enum page_entry_size pe_size)
   308	{
   309		if (pe_size == PE_SIZE_PTE)
   310			return PAGE_SHIFT - PAGE_SHIFT;
   311		if (pe_size == PE_SIZE_PMD)
 > 312			return PMD_SHIFT - PAGE_SHIFT;
   313		if (pe_size == PE_SIZE_PUD)
   314			return PUD_SHIFT - PAGE_SHIFT;
   315		return ~0;
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
