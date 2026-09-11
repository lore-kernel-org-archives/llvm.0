Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC637189C;
	Fri, 11 Sep 2026 05:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104780; cv=none; b=R9Ng7MkbRmP2r49QdDWLhivFuaGQr2AubtzQRLfsegCBsCXluihiqjDdb5OJfdgQQAiDvWlpMZ9npVsslbYKCGO7DwsgXOoNSmoMCfVgI1We0MueWN4MjbkM6cWNPqs1bY7PybzwLXoz5cWXTECu8u2V3iWlMphgJGluYtJeUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104780; c=relaxed/simple;
	bh=ol3QO0t491NotL12tI10+jNIoZvEwYPYIZUIA0sgs6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5CtkMhiD9rq3EhZ0bYSI0oclXPXaS3BmhhGA0dJB9+SMJMvwQiz13IzGYEwABZZDAVSOS6e7xfM/zQQw+eJWEba9TFvSS+uQQ8KofMdR05i+09g6Va+I1WzR9glsigSkNHyZwJF3X8AnbTjUENAl9L1IFo6S511Tg9LCKnf5uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bezMKugo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bezMKugo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789104778; x=1820640778;
  h=date:from:to:cc:subject:message-id;
  bh=ol3QO0t491NotL12tI10+jNIoZvEwYPYIZUIA0sgs6U=;
  b=bezMKugo8zmcpaRi17eroJHs1JUbepE91PcE7zqgsnuVJhGfwBYUX8c9
   fV/hhq5O/xubp0bNAxIiKbLVT3JrwzbqWxG0EQYpo5N079PDTrMel74As
   bmVJ4GgbeO49/7pyEL65JtrrZ3IVSaQFAlax/9SWlmpnJ1w2Hfo/KjbU+
   B/Wttuf7ieEdq1BF3GTHokz07eCeykj8jLtzy02FpahpadWGiWTPgytVD
   wuUjNWEaZ+uU2ME1BCz8itOfffPWWLcvikxb+R0RqHuCSsupZP+EgfRZC
   o+KImWCkMg4SYkrJTDUe4JSEiU+6un7cnWE8MUhv88LTx9A1bnYIYp/0r
   w==;
X-CSE-ConnectionGUID: MJjoZNUvSgar3hduGgaO5g==
X-CSE-MsgGUID: MpB7Kqm0T/eAXJS0hGLLEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89693940"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89693940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:32:58 -0700
X-CSE-ConnectionGUID: FbTtThJZQtmIHzPG6skGwQ==
X-CSE-MsgGUID: OAeb8IW+R6OxtWAqLKcgtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270455600"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 22:32:57 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4tsU-0000000015I-3JRx;
	Fri, 11 Sep 2026 05:32:49 +0000
Date: Fri, 11 Sep 2026 13:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/reset-state-flag 122/152]
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:365:1: error: static declaration of
 'vmw_du_connector_create_state' follows non-static declaration
Message-ID: <202609111334.nb0aii5K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/reset-state-flag
head:   3d18732b927902aaa841e0ebb77f3feaf8e519a9
commit: 3eb17b4de4dd70e92ea0fca2fdf4b2a12379312e [122/152] drm/vmwgfx: Convert to atomic_create_state
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111334.nb0aii5K-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111334.nb0aii5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111334.nb0aii5K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:365:1: error: static declaration of 'vmw_du_connector_create_state' follows non-static declaration
     365 | vmw_du_connector_create_state(struct drm_connector *connector)
         | ^
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:429:1: note: previous declaration is here
     429 | vmw_du_connector_create_state(struct drm_connector *connector);
         | ^
   1 error generated.


vim +/vmw_du_connector_create_state +365 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

   356	
   357	
   358	/**
   359	 * vmw_du_connector_create_state - creates a blank vmw connector state
   360	 * @connector: DRM connector
   361	 *
   362	 * Allocates a new empty state object for @connector.
   363	 */
   364	static struct drm_connector_state *
 > 365	vmw_du_connector_create_state(struct drm_connector *connector)
   366	{
   367		struct vmw_connector_state *vcs;
   368	
   369		vcs = kzalloc_obj(*vcs);
   370		if (!vcs) {
   371			DRM_ERROR("Cannot allocate vmw_connector_state\n");
   372			return ERR_PTR(-ENOMEM);
   373		}
   374	
   375		__drm_atomic_helper_connector_state_init(&vcs->base, connector);
   376	
   377		return &vcs->base;
   378	}
   379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
