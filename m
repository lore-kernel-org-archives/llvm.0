Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C036124;
	Mon,  8 Sep 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334967; cv=none; b=Oyq0KTIS8Z+UxGLx3uiRvUDkvfQZEp1jKyDs2dxTpJtHujZRGugIwk+BMcADrJYVcIBwZ74WIT3cUk4yR4ip2ol5aAQktFv3PUKTivcjqUJy7XNWfiVCp4VJPb2WfkShiNveCCPb+4jZoZpu9UyEg1wxfBk3sMvIOLvBDSvigN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334967; c=relaxed/simple;
	bh=e91ydkKqN3yDahSlGseGuJ1qgbBBc+4MO6R4jQpZaho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0XvDFrH6IoO5TnCwT1qqxu9EzL2+t66oWmIwf8yZX6tcGMXosHoodxXYPEGl2JA7dYSpDMGQgt5tDT3SPp8rcDbfvivKuqdwaabiogfZ+0GzDjlJ/QROIA9flDuUoeNUwc3VpAPVQ1Ba/A3nAYQfeMFQYNs30B3Z9CtJ8R+9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1bDz/YO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1bDz/YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757334966; x=1788870966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e91ydkKqN3yDahSlGseGuJ1qgbBBc+4MO6R4jQpZaho=;
  b=M1bDz/YOl1r6P1JqMwcCZPQXeWq5+mqHUBrGLHnfRcAStz+8kc2usji6
   pcI08mKToDW7jfIHukAnfnh57aGwHOP4iGIO4vaoiij+VvND/jcOcqvIW
   zWnYSLi89NCpp1ZTy5CC72Qr7A/NxHyTzt3UWPa48dELOXXEiLvhHsPxc
   6XTse0VLL4LEeY8x0RD/h7QiDqeplrSZqsbIpQATX3FWy2P3i0jXFKItz
   acEso68STXOa/E5MpYelI4wkdjAOhekf4IS08CKOmPN/LSZRWcV3erMXM
   D8uMb9hMHqLzx7Hy22nMnNWuv3yiqHJfJkxhfsl7PbO42TVEOG7V+XDsP
   g==;
X-CSE-ConnectionGUID: Twmlbp/ERmycf3eyF+8/Cg==
X-CSE-MsgGUID: cNYKDbP0QLedWQSivdvQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59736350"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59736350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 05:36:05 -0700
X-CSE-ConnectionGUID: jjiAbA9ZQj+vcKQrZL2JiA==
X-CSE-MsgGUID: Or6Ds1YsSSGuhtJJJyUYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="203749615"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2025 05:36:03 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvb6H-0003ob-1l;
	Mon, 08 Sep 2025 12:36:01 +0000
Date: Mon, 8 Sep 2025 20:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 118/128] mm/damon/tests/core-kunit.h:453:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202509082042.24Nb5PCp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   387bf1dec467127e728b28dc7624723d7df2813c
commit: d53726dd7bd14e94f2c46a842c8c45c2231090b7 [118/128] mm/damon/tests/core-kunit: split out damos_test_commit_quota_goal()
config: i386-buildonly-randconfig-006-20250908 (https://download.01.org/0day-ci/archive/20250908/202509082042.24Nb5PCp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509082042.24Nb5PCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509082042.24Nb5PCp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:3156:
>> mm/damon/tests/core-kunit.h:453:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     453 |         default:
         |         ^
   mm/damon/tests/core-kunit.h:453:2: note: insert 'break;' to avoid fall-through
     453 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +453 mm/damon/tests/core-kunit.h

   437	
   438	static void damos_test_commit_quota_goal_ensure_committed(struct kunit *test,
   439			struct damos_quota_goal *dst, struct damos_quota_goal *src,
   440			u64 last_psi_total)
   441	{
   442		struct damos_quota_goal dst_cp, src_cp;
   443	
   444		KUNIT_EXPECT_EQ(test, dst->metric, src->metric);
   445		KUNIT_EXPECT_EQ(test, dst->target_value, src->target_value);
   446		KUNIT_EXPECT_EQ(test, dst->current_value, src->current_value);
   447		/* last_psi_total is not updated */
   448		KUNIT_EXPECT_EQ(test, dst->last_psi_total, last_psi_total);
   449		switch (dst->metric) {
   450		case DAMOS_QUOTA_NODE_MEM_USED_BP:
   451		case DAMOS_QUOTA_NODE_MEM_FREE_BP:
   452			KUNIT_EXPECT_EQ(test, dst->nid, src->nid);
 > 453		default:
   454			break;
   455		}
   456	
   457		/* further check entire bits */
   458		memcpy(&dst_cp, dst, sizeof(dst_cp));
   459		memcpy(&src_cp, src, sizeof(src_cp));
   460		dst_cp.list = src_cp.list;
   461		dst_cp.last_psi_total = src_cp.last_psi_total;
   462		dst_cp.nid = src_cp.nid;
   463		dst_cp.memcg_id = src_cp.memcg_id;
   464	
   465		KUNIT_EXPECT_EQ(test, memcmp(&dst_cp, &src_cp, sizeof(dst_cp)), 0);
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
