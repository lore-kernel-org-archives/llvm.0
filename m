Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5F7F5
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651059507; x=1682595507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5TCsS4H2FgSYiKzRFMy/PRIxIgDmsoFmuDlmsLxXLrU=;
  b=QjwhB/In2GbNzGyjUk/EqsRYs5cwMJ/30/xHeVDRdkJ6QyalSaUME0ki
   mJNGCUSJOJ9Trz5BR43EeDiA3Z0bPXmg3gT7oTNJXBj3tokQG157ERTA0
   uyi0RitjR6qFMJU73KbGXqWRa0tzAxzq93fO8MoRjEpWqKZFexax4+rEh
   1Opg9w6nh51MtoYdXUtWije4+icpYfBEZhwPwgmCpRk5ZHHPtHfD5W+T3
   /rMuZIBepSYEu+ilpWc93FtAgkw6Je7eXho22XEsmMO8TecDWLogaV1KV
   crB2IUjOLgN041m2uuMCW2i+R/IM5MPcyY5RRI4ejfjzVDOHzllfh5eGR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246462387"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="246462387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 04:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="617465323"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2022 04:38:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njfzz-0004dC-Ch;
	Wed, 27 Apr 2022 11:38:23 +0000
Date: Wed, 27 Apr 2022 19:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com, glider@google.com, elver@google.com,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, dvyukov@google.com,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, xu xin <xu.xin16@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] mm/kfence: fix a potential NULL pointer dereference
Message-ID: <202204271916.aTcNyVdc-lkp@intel.com>
References: <20220427071100.3844081-1-xu.xin16@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427071100.3844081-1-xu.xin16@zte.com.cn>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/cgel-zte-gmail-com/mm-kfence-fix-a-potential-NULL-pointer-dereference/20220427-151258
base:   https://github.com/hnaz/linux-mm master
config: arm-buildonly-randconfig-r004-20220427 (https://download.01.org/0day-ci/archive/20220427/202204271916.aTcNyVdc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/920e9e639493bc72bee803c763f09760e3acd063
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/mm-kfence-fix-a-potential-NULL-pointer-dereference/20220427-151258
        git checkout 920e9e639493bc72bee803c763f09760e3acd063
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash mm/kfence/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/kfence/core.c:1067:23: error: use of undeclared identifier 'addr'
                   kfence_guarded_free(addr, meta, false);
                                       ^
>> mm/kfence/core.c:1075:23: warning: incompatible pointer to integer conversion passing 'void *' to parameter of type 'unsigned long' [-Wint-conversion]
                   kfence_report_error(addr, false, NULL, NULL, KFENCE_ERROR_INVALID);
                                       ^~~~
   mm/kfence/kfence.h:129:40: note: passing argument to parameter 'address' here
   void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
                                          ^
   1 warning and 1 error generated.


vim +1075 mm/kfence/core.c

  1069	
  1070	void __kfence_free(void *addr)
  1071	{
  1072		struct kfence_metadata *meta = addr_to_metadata((unsigned long)addr);
  1073	
  1074		if (!meta) {
> 1075			kfence_report_error(addr, false, NULL, NULL, KFENCE_ERROR_INVALID);
  1076			return;
  1077		}
  1078	
  1079		__try_free_kfence_meta(meta);
  1080	}
  1081	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
