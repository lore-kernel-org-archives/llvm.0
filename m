Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3CAD23;
	Mon, 11 Sep 2023 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694457696; x=1725993696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yEf2wozl9yHu1LBOd/9typRrbCFXojz/uFswv5c43c=;
  b=gknHJQ3aiMbwzjqI68cZQ7OiHXjlDIUjspNV7aAC7oLMyYRc8meoiUw1
   4PNWVxAHVpAFtRBRjV6mORy9cxwjamK4AC+8PNzQKTDbJpanKlL9F5QeG
   dx861NiYOcQo3Y8FBHmhJZUJGLpGnru3nyu1oNkrZkynurUKhxcOroLA7
   ww2DXYzblZobqMdN5a6aY+D6nPHhGBnWm7DcIokmybnsEcgj1XMIn4GJb
   sD9XSIN5F0vyk3Zdrq8XV6rmsiidhCOPgMSUCKya8GvWNCdhIivVptHEO
   4CisnfJ2yCMT7SqU9xBNTG1QoHuywSV10Myxw4R8LFTEU6CV4RLMXHYa/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357604738"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="357604738"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 11:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="746533465"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="746533465"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2023 11:41:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qflqk-0006bQ-15;
	Mon, 11 Sep 2023 18:41:30 +0000
Date: Tue, 12 Sep 2023 02:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: lib/kunit/test.c:764:38: warning: cast from 'void (*)(const void *)'
 to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible
 function type
Message-ID: <202309120232.7wrRuydH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 57e3cded99e9c840bc5310878d0a7f4e7768a296 kunit: kmalloc_array: Use kunit_add_action()
date:   4 months ago
config: x86_64-randconfig-013-20230909 (https://download.01.org/0day-ci/archive/20230912/202309120232.7wrRuydH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120232.7wrRuydH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120232.7wrRuydH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/test.c:764:38: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
           if (kunit_add_action_or_reset(test, (kunit_action_t *)kfree, data) != 0)
                                               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:776:29: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
           kunit_release_action(test, (kunit_action_t *)kfree, (void *)ptr);
                                      ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +764 lib/kunit/test.c

   754	
   755	void *kunit_kmalloc_array(struct kunit *test, size_t n, size_t size, gfp_t gfp)
   756	{
   757		void *data;
   758	
   759		data = kmalloc_array(n, size, gfp);
   760	
   761		if (!data)
   762			return NULL;
   763	
 > 764		if (kunit_add_action_or_reset(test, (kunit_action_t *)kfree, data) != 0)
   765			return NULL;
   766	
   767		return data;
   768	}
   769	EXPORT_SYMBOL_GPL(kunit_kmalloc_array);
   770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
