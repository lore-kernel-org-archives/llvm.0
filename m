Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB757B
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 05:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661320344; x=1692856344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDcmi+K60jmnWSPJk41OaRIyyuuwU6FSwB3d90MW5co=;
  b=Wp0EkP00Q1xuMLkpKN2vHgdFPeeavN19U/wnFTyKPygYr00L8Lv3e//K
   diZmfHbnmbk+xofoNKQlsrt+Fduw56+qvBLVm/lm2PNs8Jcsa3WpiZzBP
   Gp6i0WlCh8nRW6o+1OMAz8oxDkNaDxMRde1S2fZJmEV4ZizHY4i9Fazjx
   u+b3uS83LrPTLYgTtzDLqjHXTLzYR4QJohVly6meN27L3XqvFejcgFgs/
   HxlIPwrGqDq9IZLnIa8GwySTgUJPdM8MTIhB9vUDPMYPBaJ+FLfF8AQTy
   yvnld82Y1A8WoefKq2n7yyeByQr/QpBKIrX9Tm6fIzAC67JmETMuylX5R
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="355603162"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="355603162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 22:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="638970861"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2022 22:52:21 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQjJN-00012t-0Q;
	Wed, 24 Aug 2022 05:52:21 +0000
Date: Wed, 24 Aug 2022 13:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthur.grillo@usp.br>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Subject: [linux-next:master 313/2594]
 drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1040)
 exceeds limit (1024) in '__igt_reserve'
Message-ID: <202208241346.oSdFCs8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arthur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05477f3653b82d8b3bcf39d2937d9893124976db
commit: fc8d29e298cf47e07c2764ec1c340c1df8e50431 [313/2594] drm: selftest: convert drm_mm selftest to KUnit
config: arm-buildonly-randconfig-r002-20220824 (https://download.01.org/0day-ci/archive/20220824/202208241346.oSdFCs8n-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project d00e97df0fe8c67f694c4d027297f4382ce72b38)
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

>> drivers/gpu/drm/tests/drm_mm_test.c:344:12: warning: stack frame size (1040) exceeds limit (1024) in '__igt_reserve' [-Wframe-larger-than]
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
