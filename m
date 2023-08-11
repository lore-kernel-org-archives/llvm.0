Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48D5692;
	Fri, 11 Aug 2023 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691769227; x=1723305227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXKaAWayRXzrrnXy/KInTwX/CzLQut1Gs2XxNjCme2A=;
  b=JOVPKk5XZ2hrm/aNsdK7qUo+IamCOkMpD9qJ4kPOww59IQDRkOpJ6NCZ
   OdpoE4wucE+rAwa3oDaDuTSnzeDCbNA4DT/9DnxyLdPyK9argIkKTD9iw
   fFi1mNuuBN4xRjDIVNYW6JJmYEXLn1Aj4XqTxgGhj5ncUwY1Y+1X7+U/e
   VbMo7lACg5umuZM8cVP84IY7d91/wQRM9Dq8yiescm+heu2KZursDc8oR
   kTL8b52RyUYw7VKgia2Csl1fixbFydewlZfv83Ix/jOacMX0DNMAGzcw0
   HKo/DhwbqcDvtWwAXS2wPe3wVpQm5LTy6t9mx+mROoAeAL0foYVdYJ181
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356666193"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="356666193"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 08:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063357101"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="1063357101"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 08:53:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUUSO-0007rs-15;
	Fri, 11 Aug 2023 15:53:44 +0000
Date: Fri, 11 Aug 2023 23:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Subject: [linux-next:master 5284/8441]
 drivers/gpu/drm/tests/drm_kunit_helpers.c:171: warning: expecting prototype
 for drm_kunit_helper_context_alloc(). Prototype was for
 drm_kunit_helper_acquire_ctx_alloc() instead
Message-ID: <202308112326.AJAVWCOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 6e193f9fbbb02e1bde88510a71823e5bf83c2010 [5284/8441] drm/tests: helpers: Create a helper to allocate a locking ctx
config: powerpc-randconfig-r031-20230811 (https://download.01.org/0day-ci/archive/20230811/202308112326.AJAVWCOC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308112326.AJAVWCOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308112326.AJAVWCOC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:171: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead


vim +171 drivers/gpu/drm/tests/drm_kunit_helpers.c

   156	
   157	/**
   158	 * drm_kunit_helper_context_alloc - Allocates an acquire context
   159	 * @test: The test context object
   160	 *
   161	 * Allocates and initializes a modeset acquire context.
   162	 *
   163	 * The context is tied to the kunit test context, so we must not call
   164	 * drm_modeset_acquire_fini() on it, it will be done so automatically.
   165	 *
   166	 * Returns:
   167	 * An ERR_PTR on error, a pointer to the newly allocated context otherwise
   168	 */
   169	struct drm_modeset_acquire_ctx *
   170	drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
 > 171	{
   172		struct drm_modeset_acquire_ctx *ctx;
   173		int ret;
   174	
   175		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
   176		KUNIT_ASSERT_NOT_NULL(test, ctx);
   177	
   178		drm_modeset_acquire_init(ctx, 0);
   179	
   180		ret = kunit_add_action_or_reset(test,
   181						action_drm_release_context,
   182						ctx);
   183		if (ret)
   184			return ERR_PTR(ret);
   185	
   186		return ctx;
   187	}
   188	EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
