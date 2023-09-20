Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52D38DEB;
	Wed, 20 Sep 2023 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695224816; x=1726760816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9P55vXbP7nXOfBGiFC3LYPAZl0T5vUxuIOlmf1RldnQ=;
  b=YPa6SLJ6Ac5uGyb7glkyRafKwRov34GjV6SemQiX+EsGYNuTWWNmPi9s
   UJoiza/zgqlp9vbuEe9uXq+es2OWqd6Js1nZlXDNVXrxtm78lc9/K3qhu
   nSInarXYnAP6l6+kebq31A4WFWr7J2xQ1RT8n2MONMXipnW4u3UKtmcBx
   3XmdqFUH1zPC7paeXovVp9mbzDmfFV+eo4TpHm6A3R3PvL5abqOZWtAm8
   RVSiHaPp/SpFzYpVAm2vqZz2p7oy2N3i/Y7ymP8Y6/0INIVHZjNmjnURL
   PS/0XpjF3r5XPbCNrVfkbJUanyIGIriVbtd/QmKBVriGrIggnEsmaLSrc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380175559"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="380175559"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746694765"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="746694765"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2023 08:46:53 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qizPf-0008tk-22;
	Wed, 20 Sep 2023 15:46:51 +0000
Date: Wed, 20 Sep 2023 23:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Gow <davidgow@google.com>
Subject: [linux-next:master 5739/6619] lib/kunit/kunit-test.c:565:25:
 warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void
 (*)(void *)') converts to incompatible function type
Message-ID: <202309202345.yPRVHW8Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   926f75c8a5ab70567eb4c2d82fbc96963313e564
commit: 05e2006ce493cb6fb5e5b4b8317f82754dfa2b1e [5739/6619] kunit: Use string_stream for test log
config: hexagon-buildonly-randconfig-r002-20221027 (https://download.01.org/0day-ci/archive/20230920/202309202345.yPRVHW8Q-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202345.yPRVHW8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202345.yPRVHW8Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/kunit-test.c:565:25: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
           kunit_add_action(test, (kunit_action_t *)kfree, full_log);
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +565 lib/kunit/kunit-test.c

   545	
   546	static void kunit_log_test(struct kunit *test)
   547	{
   548		struct kunit_suite suite;
   549	#ifdef CONFIG_KUNIT_DEBUGFS
   550		char *full_log;
   551	#endif
   552		suite.log = kunit_alloc_string_stream(test, GFP_KERNEL);
   553		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, suite.log);
   554		string_stream_set_append_newlines(suite.log, true);
   555	
   556		kunit_log(KERN_INFO, test, "put this in log.");
   557		kunit_log(KERN_INFO, test, "this too.");
   558		kunit_log(KERN_INFO, &suite, "add to suite log.");
   559		kunit_log(KERN_INFO, &suite, "along with this.");
   560	
   561	#ifdef CONFIG_KUNIT_DEBUGFS
   562		KUNIT_EXPECT_TRUE(test, test->log->append_newlines);
   563	
   564		full_log = string_stream_get_string(test->log);
 > 565		kunit_add_action(test, (kunit_action_t *)kfree, full_log);
   566		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   567					     strstr(full_log, "put this in log."));
   568		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   569					     strstr(full_log, "this too."));
   570	
   571		full_log = string_stream_get_string(suite.log);
   572		kunit_add_action(test, kfree_wrapper, full_log);
   573		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   574					     strstr(full_log, "add to suite log."));
   575		KUNIT_EXPECT_NOT_ERR_OR_NULL(test,
   576					     strstr(full_log, "along with this."));
   577	#else
   578		KUNIT_EXPECT_NULL(test, test->log);
   579	#endif
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
