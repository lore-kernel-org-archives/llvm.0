Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B31101;
	Sat,  9 Sep 2023 02:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694225264; x=1725761264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+2GzycsrEbxGzb/cRjA+uHgIgiF2vHA83XeBJ+cEL3o=;
  b=ZIyHTz94l9GXTCSnPMkayups2jbNmKYQrUFlum86MkMaOJuhGpLJv4Ga
   NnKTcG73esHpxkqLHFmw+2AARRPQPekPPixGR8q27Mxq21U6ofkWZDCv9
   5JrVUjtB7Wdol5R2WD0F+vV80xc+xkQVcXwpJIb8xJVvrazr6gDoL5ZtL
   3XGwybT9wPb2fKT4L5R87X/LY69lJ1PJLelh57LWHkgHzeTXoYMNqOkcQ
   Bl4+Hs1URhRVq/9+k3VLfG5PMBsy9grck4R56lgcw+byqGv12rD74OpyC
   lDHzPT5ah7s1Fj5LNaHJua91NUxibbux+nVocvTIUW2RacLObXaZfQhjF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441796061"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="441796061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 19:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="771950762"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="771950762"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2023 19:07:40 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qenNp-0002pr-3D;
	Sat, 09 Sep 2023 02:07:37 +0000
Date: Sat, 9 Sep 2023 10:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, lars.povlsen@microchip.com,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ruanjinjie@huawei.com
Subject: Re: [PATCH net 4/5] net: microchip: sparx5: Fix possible memory
 leaks in test_vcap_xn_rule_creator()
Message-ID: <202309090950.uOTEKQq3-lkp@intel.com>
References: <20230908040011.2620468-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908040011.2620468-5-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/net-microchip-sparx5-Fix-memory-leak-for-vcap_api_rule_add_keyvalue_test/20230908-120533
base:   net/main
patch link:    https://lore.kernel.org/r/20230908040011.2620468-5-ruanjinjie%40huawei.com
patch subject: [PATCH net 4/5] net: microchip: sparx5: Fix possible memory leaks in test_vcap_xn_rule_creator()
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309090950.uOTEKQq3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090950.uOTEKQq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090950.uOTEKQq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/microchip/vcap/vcap_api.c:3584:
>> drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:246:6: warning: no previous prototype for function 'test_vcap_xn_rule_creator' [-Wmissing-prototypes]
     246 | void test_vcap_xn_rule_creator(struct kunit *test, int cid, enum vcap_user user,
         |      ^
   drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     246 | void test_vcap_xn_rule_creator(struct kunit *test, int cid, enum vcap_user user,
         | ^
         | static 
   1 warning generated.


vim +/test_vcap_xn_rule_creator +246 drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c

   244	
   245	/* Helper function to create a rule of a specific size */
 > 246	void test_vcap_xn_rule_creator(struct kunit *test, int cid, enum vcap_user user,
   247				       u16 priority,
   248				       int id, int size, int expected_addr)
   249	{
   250		struct vcap_rule *rule;
   251		struct vcap_rule_internal *ri;
   252		enum vcap_keyfield_set keyset = VCAP_KFS_NO_VALUE;
   253		enum vcap_actionfield_set actionset = VCAP_AFS_NO_VALUE;
   254		int ret;
   255	
   256		/* init before testing */
   257		memset(test_updateaddr, 0, sizeof(test_updateaddr));
   258		test_updateaddridx = 0;
   259		test_move_addr = 0;
   260		test_move_offset = 0;
   261		test_move_count = 0;
   262	
   263		switch (size) {
   264		case 2:
   265			keyset = VCAP_KFS_ETAG;
   266			actionset = VCAP_AFS_CLASS_REDUCED;
   267			break;
   268		case 3:
   269			keyset = VCAP_KFS_PURE_5TUPLE_IP4;
   270			actionset = VCAP_AFS_CLASSIFICATION;
   271			break;
   272		case 6:
   273			keyset = VCAP_KFS_NORMAL_5TUPLE_IP4;
   274			actionset = VCAP_AFS_CLASSIFICATION;
   275			break;
   276		case 12:
   277			keyset = VCAP_KFS_NORMAL_7TUPLE;
   278			actionset = VCAP_AFS_FULL;
   279			break;
   280		default:
   281			break;
   282		}
   283	
   284		/* Check that a valid size was used */
   285		KUNIT_ASSERT_NE(test, VCAP_KFS_NO_VALUE, keyset);
   286	
   287		/* Allocate the rule */
   288		rule = vcap_alloc_rule(&test_vctrl, &test_netdev, cid, user, priority,
   289				       id);
   290		KUNIT_EXPECT_PTR_NE(test, NULL, rule);
   291	
   292		ri = (struct vcap_rule_internal *)rule;
   293	
   294		/* Override rule keyset */
   295		ret = vcap_set_rule_set_keyset(rule, keyset);
   296	
   297		/* Add rule actions : there must be at least one action */
   298		ret = vcap_rule_add_action_u32(rule, VCAP_AF_ISDX_VAL, 0);
   299	
   300		/* Override rule actionset */
   301		ret = vcap_set_rule_set_actionset(rule, actionset);
   302	
   303		ret = vcap_val_rule(rule, ETH_P_ALL);
   304		KUNIT_EXPECT_EQ(test, 0, ret);
   305		KUNIT_EXPECT_EQ(test, keyset, rule->keyset);
   306		KUNIT_EXPECT_EQ(test, actionset, rule->actionset);
   307		KUNIT_EXPECT_EQ(test, size, ri->size);
   308	
   309		/* Add rule with write callback */
   310		ret = vcap_add_rule(rule);
   311		KUNIT_EXPECT_EQ(test, 0, ret);
   312		KUNIT_EXPECT_EQ(test, expected_addr, ri->addr);
   313		vcap_free_rule(rule);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
