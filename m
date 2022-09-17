Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D27C
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663430463; x=1694966463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eMSg89BLMxIAkgP/gIYpKxjLMMILU/oX1vmzhZ+/sys=;
  b=Lypddbr2mrzqSIlyhwqri/rUP6oYTCpeTkY+9ENy97rlD9OO/wdtOsXf
   VX655ic7UHC+2iNlZwJmFurLCslyU55W8iVi/5QvSDkmHDgSQgENUzB7X
   gyu8VjnU2LxYQECCj9pT9xCY9SooTzI5pv0ITar73F+znxTnHogD9qmW4
   Ogk21tDnaQSUGa2PSQWNifXr2BfbpYw0gwbPNSYIOlQHQUFD853xXeP/N
   t37fDgbjmBIlLsVeoKR6J6/4qcDp8+SVoRLO4FP4OwmxY5giHHslIJqub
   4ORQn2673FBSFfku+WJhO84yn9aiCG5RME9J035ikxZgNzJyXvNr0TJa6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="299154844"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="299154844"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 09:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="648602797"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2022 09:01:01 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZaFY-0000Rv-2y;
	Sat, 17 Sep 2022 16:01:00 +0000
Date: Sun, 18 Sep 2022 00:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6728/7639]
 drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1032)
 exceeds limit (1024) in '__drm_test_mm_reserve'
Message-ID: <202209172342.ZxnbMv48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Maíra,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 961bcdf956a4645745407a5d919be8757549b062 [6728/7639] drm/tests: Change "igt_" prefix to "drm_test_"
config: arm-buildonly-randconfig-r006-20220917 (https://download.01.org/0day-ci/archive/20220917/202209172342.ZxnbMv48-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=961bcdf956a4645745407a5d919be8757549b062
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 961bcdf956a4645745407a5d919be8757549b062
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1032) exceeds limit (1024) in '__drm_test_mm_reserve' [-Wframe-larger-than]
   static int __drm_test_mm_reserve(struct kunit *test, unsigned int count, u64 size)
              ^
   1 warning generated.


vim +/__drm_test_mm_reserve +344 drivers/gpu/drm/tests/drm_mm_test.c

   343	
 > 344	static int __drm_test_mm_reserve(struct kunit *test, unsigned int count, u64 size)
   345	{
   346		DRM_RND_STATE(prng, random_seed);
   347		struct drm_mm mm;
   348		struct drm_mm_node tmp, *nodes, *node, *next;
   349		unsigned int *order, n, m, o = 0;
   350		int ret, err;
   351	
   352		/* For exercising drm_mm_reserve_node(), we want to check that
   353		 * reservations outside of the drm_mm range are rejected, and to
   354		 * overlapping and otherwise already occupied ranges. Afterwards,
   355		 * the tree and nodes should be intact.
   356		 */
   357	
   358		DRM_MM_BUG_ON(!count);
   359		DRM_MM_BUG_ON(!size);
   360	
   361		ret = -ENOMEM;
   362		order = drm_random_order(count, &prng);
   363		if (!order)
   364			goto err;
   365	
   366		nodes = vzalloc(array_size(count, sizeof(*nodes)));
   367		KUNIT_ASSERT_TRUE(test, nodes);
   368	
   369		ret = -EINVAL;
   370		drm_mm_init(&mm, 0, count * size);
   371	
   372		if (!check_reserve_boundaries(test, &mm, count, size))
   373			goto out;
   374	
   375		for (n = 0; n < count; n++) {
   376			nodes[n].start = order[n] * size;
   377			nodes[n].size = size;
   378	
   379			err = drm_mm_reserve_node(&mm, &nodes[n]);
   380			if (err) {
   381				KUNIT_FAIL(test, "reserve failed, step %d, start %llu\n",
   382					   n, nodes[n].start);
   383				ret = err;
   384				goto out;
   385			}
   386	
   387			if (!drm_mm_node_allocated(&nodes[n])) {
   388				KUNIT_FAIL(test, "reserved node not allocated! step %d, start %llu\n",
   389					   n, nodes[n].start);
   390				goto out;
   391			}
   392	
   393			if (!expect_reserve_fail(test, &mm, &nodes[n]))
   394				goto out;
   395		}
   396	
   397		/* After random insertion the nodes should be in order */
   398		if (!assert_continuous(test, &mm, size))
   399			goto out;
   400	
   401		/* Repeated use should then fail */
   402		drm_random_reorder(order, count, &prng);
   403		for (n = 0; n < count; n++) {
   404			if (!expect_reserve_fail(test, &mm, set_node(&tmp, order[n] * size, 1)))
   405				goto out;
   406	
   407			/* Remove and reinsert should work */
   408			drm_mm_remove_node(&nodes[order[n]]);
   409			err = drm_mm_reserve_node(&mm, &nodes[order[n]]);
   410			if (err) {
   411				KUNIT_FAIL(test, "reserve failed, step %d, start %llu\n",
   412					   n, nodes[n].start);
   413				ret = err;
   414				goto out;
   415			}
   416		}
   417	
   418		if (!assert_continuous(test, &mm, size))
   419			goto out;
   420	
   421		/* Overlapping use should then fail */
   422		for (n = 0; n < count; n++) {
   423			if (!expect_reserve_fail(test, &mm, set_node(&tmp, 0, size * count)))
   424				goto out;
   425		}
   426		for (n = 0; n < count; n++) {
   427			if (!expect_reserve_fail(test, &mm, set_node(&tmp, size * n, size * (count - n))))
   428				goto out;
   429		}
   430	
   431		/* Remove several, reinsert, check full */
   432		for_each_prime_number(n, min(max_prime, count)) {
   433			for (m = 0; m < n; m++) {
   434				node = &nodes[order[(o + m) % count]];
   435				drm_mm_remove_node(node);
   436			}
   437	
   438			for (m = 0; m < n; m++) {
   439				node = &nodes[order[(o + m) % count]];
   440				err = drm_mm_reserve_node(&mm, node);
   441				if (err) {
   442					KUNIT_FAIL(test, "reserve failed, step %d/%d, start %llu\n",
   443						   m, n, node->start);
   444					ret = err;
   445					goto out;
   446				}
   447			}
   448	
   449			o += n;
   450	
   451			if (!assert_continuous(test, &mm, size))
   452				goto out;
   453		}
   454	
   455		ret = 0;
   456	out:
   457		drm_mm_for_each_node_safe(node, next, &mm)
   458			drm_mm_remove_node(node);
   459		drm_mm_takedown(&mm);
   460		vfree(nodes);
   461		kfree(order);
   462	err:
   463		return ret;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
