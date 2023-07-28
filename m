Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86A1641C;
	Fri, 28 Jul 2023 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690566426; x=1722102426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fQcCyWy7ZpLKPdeNo1tv2DTEdBFWmo67ai8pbgNx/Sc=;
  b=Fv6HZ5BjOCC5k//0yllmvdpQ/WiXsn+0dmbk8zqP680ULTg0sz3KbSQk
   +BSlSgG22FdCtT0gQah4Q9y39gjexbglZeedPSaoaXhNanPzjdtrkk2cm
   1RQjAC8lo+60wOgwxVe6YMXHqSd89LAToSwMpeqdQNEZ5dFvcCAM7z3Z2
   yd5tyMykCtsFgmWPkTE01yJiG6zsl5PkxtQsB2/3mQiRa+OkXwFWWlJb5
   i16dHdVaB9FBDnSuRW2QWkxs3g8NwNyLurbJBPHyol6DWxnGxE22cMHj+
   /YL4yxT2BOjnTuu8pagfS0YPK2bQc7wUKJWZD/rQekt9iYlRgsFGgg1T5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371348208"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="371348208"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 10:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901369122"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="901369122"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 10:47:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPRYM-0003Rn-16;
	Fri, 28 Jul 2023 17:47:02 +0000
Date: Sat, 29 Jul 2023 01:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kunit: Allow kunit test modules to use test filtering
Message-ID: <202307290100.7X8zOW5k-lkp@intel.com>
References: <20230728154419.1810177-8-janusz.krzysztofik@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728154419.1810177-8-janusz.krzysztofik@linux.intel.com>

Hi Janusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/kunit-fixes]
[also build test ERROR on linus/master v6.5-rc3]
[cannot apply to shuah-kselftest/kunit next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janusz-Krzysztofik/kunit-Report-the-count-of-test-suites-in-a-module/20230728-234736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit-fixes
patch link:    https://lore.kernel.org/r/20230728154419.1810177-8-janusz.krzysztofik%40linux.intel.com
patch subject: [PATCH 3/3] kunit: Allow kunit test modules to use test filtering
config: mips-randconfig-r002-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290100.7X8zOW5k-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290100.7X8zOW5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290100.7X8zOW5k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/kunit/executor.c:182:42: warning: declaration of 'struct suite_set' will not be visible outside of this function [-Wvisibility]
     182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
         |                                          ^
>> lib/kunit/executor.c:190:25: error: incomplete definition of type 'struct suite_set'
     190 |         for (suites = suite_set->start; suites < suite_set->end; suites++)
         |                       ~~~~~~~~~^
   lib/kunit/executor.c:182:42: note: forward declaration of 'struct suite_set'
     182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
         |                                          ^
   lib/kunit/executor.c:190:52: error: incomplete definition of type 'struct suite_set'
     190 |         for (suites = suite_set->start; suites < suite_set->end; suites++)
         |                                                  ~~~~~~~~~^
   lib/kunit/executor.c:182:42: note: forward declaration of 'struct suite_set'
     182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
         |                                          ^
>> lib/kunit/executor.c:198:19: error: variable has incomplete type 'struct suite_set'
     198 |         struct suite_set suite_set = {__kunit_suites_start, __kunit_suites_end};
         |                          ^
   lib/kunit/executor.c:198:9: note: forward declaration of 'struct suite_set'
     198 |         struct suite_set suite_set = {__kunit_suites_start, __kunit_suites_end};
         |                ^
   In file included from lib/kunit/executor.c:230:
>> lib/kunit/executor_test.c:45:19: error: variable has incomplete type 'struct suite_set'
      45 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                          ^
   lib/kunit/executor_test.c:45:9: note: forward declaration of 'struct suite_set'
      45 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:46:19: error: variable has incomplete type 'struct suite_set'
      46 |         struct suite_set got;
         |                          ^
   lib/kunit/executor_test.c:45:9: note: forward declaration of 'struct suite_set'
      45 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:69:19: error: variable has incomplete type 'struct suite_set'
      69 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                          ^
   lib/kunit/executor_test.c:69:9: note: forward declaration of 'struct suite_set'
      69 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:70:19: error: variable has incomplete type 'struct suite_set'
      70 |         struct suite_set got;
         |                          ^
   lib/kunit/executor_test.c:69:9: note: forward declaration of 'struct suite_set'
      69 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:96:19: error: variable has incomplete type 'struct suite_set'
      96 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                          ^
   lib/kunit/executor_test.c:96:9: note: forward declaration of 'struct suite_set'
      96 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:97:19: error: variable has incomplete type 'struct suite_set'
      97 |         struct suite_set got;
         |                          ^
   lib/kunit/executor_test.c:96:9: note: forward declaration of 'struct suite_set'
      96 |         struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
         |                ^
   lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     138 |                         (kunit_action_t *)kfree,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 9 errors generated.


vim +190 lib/kunit/executor.c

9c6b0e1d8993e4 Daniel Latypov  2021-09-30  181  
9c6b0e1d8993e4 Daniel Latypov  2021-09-30 @182  static void kunit_exec_list_tests(struct suite_set *suite_set)
aac35468ca20a3 Alan Maguire    2020-08-04  183  {
e5857d396f35e5 Daniel Latypov  2022-07-09  184  	struct kunit_suite * const *suites;
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  185  	struct kunit_case *test_case;
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  186  
6c738b52316c58 Rae Moar        2022-11-23  187  	/* Hack: print a ktap header so kunit.py can find the start of KUnit output. */
6c738b52316c58 Rae Moar        2022-11-23  188  	pr_info("KTAP version 1\n");
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  189  
9c6b0e1d8993e4 Daniel Latypov  2021-09-30 @190  	for (suites = suite_set->start; suites < suite_set->end; suites++)
e5857d396f35e5 Daniel Latypov  2022-07-09  191  		kunit_suite_for_each_test_case((*suites), test_case) {
e5857d396f35e5 Daniel Latypov  2022-07-09  192  			pr_info("%s.%s\n", (*suites)->name, test_case->name);
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  193  		}
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  194  }
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  195  
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  196  int kunit_run_all_tests(void)
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  197  {
e5857d396f35e5 Daniel Latypov  2022-07-09 @198  	struct suite_set suite_set = {__kunit_suites_start, __kunit_suites_end};
1b11063d32d7e1 Daniel Latypov  2022-05-13  199  	int err = 0;
d20a6ba5e3be5f Joe Fradley     2022-08-23  200  	if (!kunit_enabled()) {
d20a6ba5e3be5f Joe Fradley     2022-08-23  201  		pr_info("kunit: disabled\n");
d20a6ba5e3be5f Joe Fradley     2022-08-23  202  		goto out;
d20a6ba5e3be5f Joe Fradley     2022-08-23  203  	}
aac35468ca20a3 Alan Maguire    2020-08-04  204  
a02353f491622e Daniel Latypov  2022-05-11  205  	if (filter_glob_param) {
a02353f491622e Daniel Latypov  2022-05-11  206  		suite_set = kunit_filter_suites(&suite_set, filter_glob_param, &err);
a02353f491622e Daniel Latypov  2022-05-11  207  		if (err) {
a02353f491622e Daniel Latypov  2022-05-11  208  			pr_err("kunit executor: error filtering suites: %d\n", err);
1b11063d32d7e1 Daniel Latypov  2022-05-13  209  			goto out;
a02353f491622e Daniel Latypov  2022-05-11  210  		}
a02353f491622e Daniel Latypov  2022-05-11  211  	}
45dcbb6f5ef78b Brendan Higgins 2020-08-04  212  
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  213  	if (!action_param)
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  214  		kunit_exec_run_tests(&suite_set);
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  215  	else if (strcmp(action_param, "list") == 0)
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  216  		kunit_exec_list_tests(&suite_set);
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  217  	else
9c6b0e1d8993e4 Daniel Latypov  2021-09-30  218  		pr_err("kunit executor: unknown action '%s'\n", action_param);
aac35468ca20a3 Alan Maguire    2020-08-04  219  
e5857d396f35e5 Daniel Latypov  2022-07-09  220  	if (filter_glob_param) { /* a copy was made of each suite */
a127b154a8f231 Daniel Latypov  2021-09-14  221  		kunit_free_suite_set(suite_set);
5d31f71efcb6bc Daniel Latypov  2021-02-05  222  	}
5d31f71efcb6bc Daniel Latypov  2021-02-05  223  
1b11063d32d7e1 Daniel Latypov  2022-05-13  224  out:
1b11063d32d7e1 Daniel Latypov  2022-05-13  225  	kunit_handle_shutdown();
1b11063d32d7e1 Daniel Latypov  2022-05-13  226  	return err;
aac35468ca20a3 Alan Maguire    2020-08-04  227  }
aac35468ca20a3 Alan Maguire    2020-08-04  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
