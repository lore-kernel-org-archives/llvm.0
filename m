Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63DB258B;
	Fri, 31 Mar 2023 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680266138; x=1711802138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANAR0lY2UMhP6Tvar5H/EIXPCBMv/zHYonBgXdDRCHU=;
  b=PI183W5Ntui+7USTCAqtnYPb01KzyPcazCB0jcRRye1W3/wc9gsisiW3
   8iKnjlhri+BW6jx46FOeLe3FXPvwFh1RlUc2Eg5GLqx4/z6NyWtay4Zds
   MCHiD4M8f3XcE1r6T7jwWlLqgHG90JYWz05/5KYcuIKyjZrDOT8ZgBEPx
   bTaMtkhRNkKls7HaaYJEQsYzRUQp5R26NOMph9ICmmV7nrEawhiSViPI5
   JDBBOtFmXYfa0gQVWDgZ4YPQZbhbFPGOlGoryYpC15D767N4jXBShaaR4
   kxNX/shjUdVD1Pvt/+ETBjGrlMXap2jov8n9SW23gNZzKQOwnd07O4Elw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406451939"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="406451939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 05:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749627559"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="749627559"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2023 05:35:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piDyi-000Lm6-0C;
	Fri, 31 Mar 2023 12:35:36 +0000
Date: Fri, 31 Mar 2023 20:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] kunit: executor_test: Use kunit_add_action()
Message-ID: <202303312019.Hp141ZY0-lkp@intel.com>
References: <20230331080411.981038-3-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331080411.981038-3-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
patch link:    https://lore.kernel.org/r/20230331080411.981038-3-davidgow%40google.com
patch subject: [RFC PATCH v2 2/3] kunit: executor_test: Use kunit_add_action()
config: hexagon-randconfig-r041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303312019.Hp141ZY0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/540c6f8bd0d14cb6eaecb86f4de2e52c630492b8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
        git checkout 540c6f8bd0d14cb6eaecb86f4de2e52c630492b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303312019.Hp141ZY0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kunit/executor.c:223:
>> lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_defer_function_t' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
                           (kunit_defer_function_t)kfree,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +138 lib/kunit/executor_test.c

   127	
   128	/* Use the resource API to register a call to kfree(to_free).
   129	 * Since we never actually use the resource, it's safe to use on const data.
   130	 */
   131	static void kfree_at_end(struct kunit *test, const void *to_free)
   132	{
   133		/* kfree() handles NULL already, but avoid allocating a no-op cleanup. */
   134		if (IS_ERR_OR_NULL(to_free))
   135			return;
   136	
   137		kunit_add_action(test,
 > 138				(kunit_defer_function_t)kfree,
   139				(void *)to_free,
   140				GFP_KERNEL);
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
