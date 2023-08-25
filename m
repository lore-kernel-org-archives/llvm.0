Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8541840;
	Fri, 25 Aug 2023 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692948673; x=1724484673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eeH2sPNSiqdy3jxJvKVu7yF5DPRFOdMNgYX5QPiMDxc=;
  b=WbrpfNPnjNu60i61q1wxVjKa3dn8O/36qZbePtb7GyBdHWW+bZXRwJc8
   0ZLpxWI5v6mswoka+DJtdC/UJm1bqxNzZA+unPheRi5pjNHTLBSGLakxi
   o8piDGZUbpyuzqxCu1RLHf8pqB0s63URlUqnMyoSnifbI9tq1tW8laBCX
   1HUN5gT0SBy8J2zwvWij6zDR21Uh8NgJ4C8UWo8zqZ9D0Whdh8Sz5uskH
   jBuDsq8NNdfqf1RdQwK1qdqw84TBeuDN4UVXWz9VMFQpxTQCV+JUQfyKb
   cfasSYYVBSx54tJUzcGK9Y8lF81T7W7i/iGnV/khvq3lrgxNvwkSkddGv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374630800"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374630800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 00:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860992646"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860992646"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 00:31:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZRHh-0003JM-09;
	Fri, 25 Aug 2023 07:31:09 +0000
Date: Fri, 25 Aug 2023 15:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
	brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v5 09/10] kunit: Use string_stream for test log
Message-ID: <202308251509.VjWK804c-lkp@intel.com>
References: <20230824143129.1957914-10-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824143129.1957914-10-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/kunit]
[also build test WARNING on next-20230824]
[cannot apply to shuah-kselftest/kunit-fixes linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/kunit-string-stream-Don-t-create-a-fragment-for-empty-strings/20230824-223722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20230824143129.1957914-10-rf%40opensource.cirrus.com
patch subject: [PATCH v5 09/10] kunit: Use string_stream for test log
config: hexagon-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251509.VjWK804c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251509.VjWK804c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251509.VjWK804c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/kunit-test.c:557:25: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     557 |         kunit_add_action(test, (kunit_action_t *)kfree, full_log);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:564:25: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     564 |         kunit_add_action(test, (kunit_action_t *)kfree, full_log);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:581:26: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     581 |                 kunit_add_action(test, (kunit_action_t *)kfree, full_log);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +557 lib/kunit/kunit-test.c

   533	
   534	/*
   535	 * Log tests call string_stream functions, which aren't exported. So only
   536	 * build this code if this test is built-in.
   537	 */
   538	#if IS_BUILTIN(CONFIG_KUNIT_TEST)
   539	static void kunit_log_test(struct kunit *test)
   540	{
   541		struct kunit_suite suite;
   542		char *full_log;
   543	
   544		suite.log = kunit_alloc_string_stream(test, GFP_KERNEL);
   545		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, suite.log);
   546		string_stream_set_append_newlines(suite.log, true);
   547	
   548		kunit_log(KERN_INFO, test, "put this in log.");
   549		kunit_log(KERN_INFO, test, "this too.");
   550		kunit_log(KERN_INFO, &suite, "add to suite log.");
   551		kunit_log(KERN_INFO, &suite, "along with this.");
   552	
   553	#ifdef CONFIG_KUNIT_DEBUGFS
   554		KUNIT_EXPECT_TRUE(test, test->log->append_newlines);
   555	
   556		full_log = string_stream_get_string(test->log);
 > 557		kunit_add_action(test, (kunit_action_t *)kfree, full_log);
   558		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   559					     strstr(full_log, "put this in log."));
   560		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   561					     strstr(full_log, "this too."));
   562	
   563		full_log = string_stream_get_string(suite.log);
   564		kunit_add_action(test, (kunit_action_t *)kfree, full_log);
   565		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   566					     strstr(full_log, "add to suite log."));
   567		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   568					     strstr(full_log, "along with this."));
   569	#else
   570		KUNIT_EXPECT_NULL(test, test->log);
   571	#endif
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
