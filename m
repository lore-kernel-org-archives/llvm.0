Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7F155382;
	Fri,  1 Nov 2024 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445075; cv=none; b=d0tTFwyfFYUMM62y0Xu/p558uafVOVTayuEhyY1Ra2ZOQSkbUuVl81n5T4tgvAaO9W5KB7Ym2Bf73PQA6BMSXoNnpIPS90WwQak2YX2e35j90wBDvofr8df+IROj882tHse/l9kO52SLP20mnB2WC1UXXRMKgTLzOIwv40qMznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445075; c=relaxed/simple;
	bh=LrXM8j4JXygvUS/V8UtdLf/1bnE60Pt/FNCjXxO/sk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i9KmLtteJ39O6iWKgk1rNsqGOqluHVWUBmzoiVUSvibK/WkJxqPQ1JdFtuFBuPw5aPm/dAFEEYKNxf+9zj69p2Kh6PZFPLbrDO3G5Ziwo/AsLVEaCJpWnoOWOXs/bshMDZUxUhoKbrd/ZIL4XUxOFUL5e9NrKxvHf7j+AXS6bJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gledPX3O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gledPX3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730445073; x=1761981073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrXM8j4JXygvUS/V8UtdLf/1bnE60Pt/FNCjXxO/sk0=;
  b=gledPX3Oam+XntSVejcGwwSEbTRziONXq4LOTJn2WImfjI2lWh1gqYl/
   pjMhIq5XGCCvTANzGeKKztsb7Nt14Zi2oPT+3Wb7iC1vVUq304DhYIYUP
   visokN7lE8T/f6oTtrhfkanTBRCz1BMFc+0dmBjK+sEuBgaDbHiRjbwRB
   8jFHYz+MYaq8LP1Owj3XJEXPuXSn/OfL+Lj/Sa42NJOEPUGdGxg6U+OyE
   ggth/12dHg3c6j1YiH1/qksP7KYCQ1qhRGLE850QMD9foSV7lkItYJy3E
   lJMLtx0JDxXMoPpaW/VXWQEXIku5LyeWjck46ZZ5jBb89FL1vU+xtRBte
   A==;
X-CSE-ConnectionGUID: g+1EeJ5QT7K7z4CLL6dTaQ==
X-CSE-MsgGUID: 51/IWCqITWGCVqvy1rlAmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40752776"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40752776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:11:12 -0700
X-CSE-ConnectionGUID: 2v7wJwyaRRWdiBXKL3teRg==
X-CSE-MsgGUID: mPC820krTNCU4TKaF3VrKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="106218062"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2024 00:11:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6loK-000hFl-2y;
	Fri, 01 Nov 2024 07:11:08 +0000
Date: Fri, 1 Nov 2024 15:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:drm_mm 3/4] lib/drm_mm.c:614:20: warning: function
 'drm_mm_node_scanned_block' is not needed and will not be emitted
Message-ID: <202411011528.dsCnUbV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git drm_mm
head:   c8004f35f9de5c195a8cab95bbdd62b7fbb1563d
commit: 3e790b7ac9876de0d4461c5219a29c674b5ecb12 [3/4] bpf, drm: move drm_mm to lib to be used by bpf arena
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241101/202411011528.dsCnUbV2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011528.dsCnUbV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011528.dsCnUbV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_insert' [-Wunused-function]
     152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     153 |                      u64, __subtree_last,
         |                      ~~~~~~~~~~~~~~~~~~~~
     154 |                      START, LAST, static inline, drm_mm_interval_tree)
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^~~~~~~~~~~~~~~~~~~
   <scratch space>:13:1: note: expanded from here
      13 | drm_mm_interval_tree_insert
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_iter_next' [-Wunused-function]
     152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     153 |                      u64, __subtree_last,
         |                      ~~~~~~~~~~~~~~~~~~~~
     154 |                      START, LAST, static inline, drm_mm_interval_tree)
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:151:33: note: expanded from macro 'INTERVAL_TREE_DEFINE'
     151 | ITSTATIC ITSTRUCT *                                                           \
         |                                                                               ^
     152 | ITPREFIX ## _iter_next(ITSTRUCT *node, ITTYPE start, ITTYPE last)             \
         | ~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:25:1: note: expanded from here
      25 | drm_mm_interval_tree_iter_next
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/drm_mm.c:614:20: warning: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     614 | static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/drm_mm_node_scanned_block +614 lib/drm_mm.c

6b9d89b4365ab5 drivers/gpu/drm/drm_mm.c Chris Wilson 2012-07-10  613  
71724f70899759 drivers/gpu/drm/drm_mm.c Chris Wilson 2019-10-03 @614  static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
71724f70899759 drivers/gpu/drm/drm_mm.c Chris Wilson 2019-10-03  615  {
4ee92c7149da9c drivers/gpu/drm/drm_mm.c Chris Wilson 2019-10-03  616  	return test_bit(DRM_MM_NODE_SCANNED_BIT, &node->flags);
71724f70899759 drivers/gpu/drm/drm_mm.c Chris Wilson 2019-10-03  617  }
71724f70899759 drivers/gpu/drm/drm_mm.c Chris Wilson 2019-10-03  618  

:::::: The code at line 614 was first introduced by commit
:::::: 71724f708997595919cb1e75c5e48916c8846d2e drm/mm: Use helpers for drm_mm_node booleans

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
