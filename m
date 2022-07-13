Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F129A0
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657711498; x=1689247498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PKE5vrdwjr1dTFgUoMNEf+418Rz+eDd76hO1bJwhKCI=;
  b=To9eBRpz5LGI+bUIja/cJxU4F0g0r4B9iFLRsDkYuP1Oh46Eua2c9d75
   9uVI15c9nfv6m36HpiWKnBRz2mDFpWx9pJxS1qZEFyZubITY1gnq9YF23
   y8doZNgDoTZ39JUA9ZZsH9qVsdDx17ws8rQO/aspprxnOB+v+YtpSfHTU
   Z51syNOj42B5G/HMkOkics+j3PUmmEIjC0OdCUIwpNiLVHypL8Ayc2VrX
   TyYkAdnNlbN2yZcXSQpHVCsceK+OTPsVOxNG5pCcdtt/+Rf7XjZtriJfB
   ST3Ok69vv0CNFWYifa2Q73Mu16e1yEr/ioxCcTACBcv5tMVc+kPNvSQHN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="268219997"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="268219997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 04:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="663322623"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2022 04:24:56 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBaUB-0003Pf-On;
	Wed, 13 Jul 2022 11:24:55 +0000
Date: Wed, 13 Jul 2022 19:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthur.grillo@usp.br>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Subject: [linux-next:master 9157/9846]
 drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1032)
 exceeds limit (1024) in '__igt_reserve'
Message-ID: <202207131924.3JDQ4WsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   734339e5c1c46e3af041b4c288c213e045e34354
commit: fc8d29e298cf47e07c2764ec1c340c1df8e50431 [9157/9846] drm: selftest: convert drm_mm selftest to KUnit
config: arm-randconfig-r024-20220712 (https://download.01.org/0day-ci/archive/20220713/202207131924.3JDQ4WsP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e60b4fb2b777118c0ff664a6347851df14fcf75b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fc8d29e298cf47e07c2764ec1c340c1df8e50431
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fc8d29e298cf47e07c2764ec1c340c1df8e50431
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Wframe-larger-than]
   static int __igt_reserve(struct kunit *test, unsigned int count, u64 size)
              ^
   1 warning generated.


vim +/__igt_reserve +344 drivers/gpu/drm/tests/drm_mm_test.c

   343	
 > 344	static int __igt_reserve(struct kunit *test, unsigned int count, u64 size)
   345	{
   346		DRM_RND_STATE(prng, random_seed);
   347		struct drm_mm mm;
   348		struct drm_mm_node tmp, *nodes, *node, *next;
   349		unsigned int *order, n, m, o = 0;
   350		int ret, err;
   351	
   352		/* For exercising drm_mm_reserve_node(struct kunit *test, ), we want to check that
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
