Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533B28E2;
	Sat, 25 Mar 2023 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679757306; x=1711293306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BrbbmeiVzAUMWkCR5zgPhZBiqTZU/l3gDHn2ink1uEw=;
  b=jGm7SGElRd9jCOvcjKD37MCnBVu+FTpiM/MlSN92bS92uLQA5nfdoFyS
   2WBzaPUZ7jU+469Ql8YtroVNoT14sGetyncw2PHjjVO8vUrMX3nUieHhF
   /BLzI3GsEwjDRK4EjCOrYmK0M6czJRiC8mbT1nM6++NkOESBfOqxiavXT
   unJPXlR88hRnfJANwSZW7hRSNU/sQKRWPJJpQ5v+gT6GIpSgVyaOfxhVk
   X3l4UtTx5h+lDcUbhytnysMyXOcu5vL1NivWoGnUsrF1EC4yvWr2ByHAq
   l4vFwNYwybptT3Ub3ow0BiHO4pc+qz12jERCLQazCrcHuJjVDXSGFaiZw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="323867020"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="323867020"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 08:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="807002403"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="807002403"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2023 08:15:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg5bk-000GL5-1l;
	Sat, 25 Mar 2023 15:15:04 +0000
Date: Sat, 25 Mar 2023 23:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kunit: Add APIs for managing devices
Message-ID: <202303252216.4ChgDLYh-lkp@intel.com>
References: <20230325043104.3761770-3-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325043104.3761770-3-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc3]
[cannot apply to next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-resource-Add-kunit_defer-functionality/20230325-123304
patch link:    https://lore.kernel.org/r/20230325043104.3761770-3-davidgow%40google.com
patch subject: [RFC PATCH 2/2] kunit: Add APIs for managing devices
config: hexagon-randconfig-r041-20230322 (https://download.01.org/0day-ci/archive/20230325/202303252216.4ChgDLYh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/489de1f44af455844bbc158f03f5940c2707992d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-resource-Add-kunit_defer-functionality/20230325-123304
        git checkout 489de1f44af455844bbc158f03f5940c2707992d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/kunit/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303252216.4ChgDLYh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/device.c:57:20: warning: cast from 'void (*)(struct device *)' to 'kunit_defer_function_t' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
           kunit_defer(test, (kunit_defer_function_t)device_unregister, &kunit_dev->dev, GFP_KERNEL);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/kunit/device.c:32:16: warning: no previous prototype for function 'kunit_device_register' [-Wmissing-prototypes]
   struct device *kunit_device_register(struct kunit *test, const char *name)
                  ^
   lib/kunit/device.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct device *kunit_device_register(struct kunit *test, const char *name)
   ^
   static 
   lib/kunit/device.c:65:28: warning: cast from 'void (*)(struct device *)' to 'kunit_defer_function_t' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
           kunit_defer_trigger(test, (kunit_defer_function_t)device_unregister, dev);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/kunit/device.c:63:6: warning: no previous prototype for function 'kunit_device_unregister' [-Wmissing-prototypes]
   void kunit_device_unregister(struct kunit *test, struct device *dev)
        ^
   lib/kunit/device.c:63:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kunit_device_unregister(struct kunit *test, struct device *dev)
   ^
   static 
   4 warnings generated.


vim +57 lib/kunit/device.c

    31	
  > 32	struct device *kunit_device_register(struct kunit *test, const char *name)
    33	{
    34		struct kunit_device *kunit_dev;
    35		int err = -ENOMEM;
    36	
    37		kunit_dev = kzalloc(sizeof(struct kunit_device), GFP_KERNEL);
    38		if (!kunit_dev)
    39			return ERR_PTR(err);
    40	
    41		kunit_dev->owner = test;
    42	
    43		err = dev_set_name(&kunit_dev->dev, "%s.%s", test->name, name);
    44		if (err) {
    45			kfree(kunit_dev);
    46			return ERR_PTR(err);
    47		}
    48	
    49		kunit_dev->dev.release = kunit_device_release;
    50	
    51		err = device_register(&kunit_dev->dev);
    52		if (err) {
    53			put_device(&kunit_dev->dev);
    54			return ERR_PTR(err);
    55		}
    56	
  > 57		kunit_defer(test, (kunit_defer_function_t)device_unregister, &kunit_dev->dev, GFP_KERNEL);
    58	
    59		return &kunit_dev->dev;
    60	}
    61	EXPORT_SYMBOL_GPL(kunit_device_register);
    62	
  > 63	void kunit_device_unregister(struct kunit *test, struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
