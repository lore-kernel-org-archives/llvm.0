Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6E7E;
	Sat,  4 Mar 2023 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677912700; x=1709448700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CvWK8M6rRr6nChyjRHtcahB04M1m7GKg+QhCdN8W3cc=;
  b=YvUUOhytnUMRq6b2Zey8+oOC83VFrWu3FwX1QQtWfY2uamhPMyuNtWs7
   Wz6iSr8fA6fCiP7qP3x8Cfj/J2nefXALYqQ6lkrhcnOvt6X91jw5UHsbR
   frgITEY0wHiDw+611DzyHpdYc3Wfg+iI7vChtp3Wfu6+JiGF/nkrvjliy
   6oaJVfqcAQsUO2H48JZ4znnXHnAHdQhuZXBNuRjN8rbOTSmXfvjR6bHhB
   3C5KZOA6/R8Eh7BRscw2rO1/RWTHE1J/WBFRn97hWfxlhTrnrJxxzaUDv
   j04l9qP3hQKvQN616IJB5Su0DShNVRqJA7HhdXN9bSTAjG8zklpBu9tY7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332710340"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="332710340"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 22:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="785555132"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="785555132"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2023 22:51:38 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYLk2-0001wI-0S;
	Sat, 04 Mar 2023 06:51:38 +0000
Date: Sat, 4 Mar 2023 14:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Baron <jbaron@akamai.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] dyndbg: use the module notifier callbacks
Message-ID: <202303041420.W9FtaUDc-lkp@intel.com>
References: <5884c688d10c9703fb0457f8839d6becc8657f8f.1677861177.git.jbaron@akamai.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5884c688d10c9703fb0457f8839d6becc8657f8f.1677861177.git.jbaron@akamai.com>

Hi Jason,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Baron/dyndbg-remove-unused-base-arg-from-__ddebug_add_module/20230304-005435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/5884c688d10c9703fb0457f8839d6becc8657f8f.1677861177.git.jbaron%40akamai.com
patch subject: [PATCH v3 2/2] dyndbg: use the module notifier callbacks
config: arm-randconfig-r032-20230302 (https://download.01.org/0day-ci/archive/20230304/202303041420.W9FtaUDc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/0505a1e5b9d22b48fe25399b8013a48cf7f42efb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-Baron/dyndbg-remove-unused-base-arg-from-__ddebug_add_module/20230304-005435
        git checkout 0505a1e5b9d22b48fe25399b8013a48cf7f42efb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/infiniband/ulp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041420.W9FtaUDc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/ulp/srp/ib_srp.c:66:9: warning: 'DEFINE_DYNAMIC_DEBUG_METADATA' macro redefined [-Wmacro-redefined]
   #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
           ^
   include/linux/dynamic_debug.h:174:9: note: previous definition is here
   #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)                \
           ^
>> drivers/infiniband/ulp/srp/ib_srp.c:67:9: warning: 'DYNAMIC_DEBUG_BRANCH' macro redefined [-Wmacro-redefined]
   #define DYNAMIC_DEBUG_BRANCH(descriptor) false
           ^
   include/linux/dynamic_debug.h:188:9: note: previous definition is here
   #define DYNAMIC_DEBUG_BRANCH(descriptor) \
           ^
   2 warnings generated.


vim +/DEFINE_DYNAMIC_DEBUG_METADATA +66 drivers/infiniband/ulp/srp/ib_srp.c

aef9ec39c47f0c Roland Dreier   2005-11-02  64  
1a1faf7a8a251d Bart Van Assche 2016-11-21  65  #if !defined(CONFIG_DYNAMIC_DEBUG)
1a1faf7a8a251d Bart Van Assche 2016-11-21 @66  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
1a1faf7a8a251d Bart Van Assche 2016-11-21 @67  #define DYNAMIC_DEBUG_BRANCH(descriptor) false
1a1faf7a8a251d Bart Van Assche 2016-11-21  68  #endif
1a1faf7a8a251d Bart Van Assche 2016-11-21  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
