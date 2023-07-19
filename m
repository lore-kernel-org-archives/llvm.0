Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0A14A8A;
	Wed, 19 Jul 2023 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689777264; x=1721313264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s1iD1p9R5LfOnp1gakxJokGfpaRqyiy9awXNAQXx9q8=;
  b=LxpBJeaSjQbTImqLFXgvcKenMAMUWk803bReN/rcJd3rkFNRwn/POSF0
   dweBWkN3PktW3vTEZtPLS3LMBwmriu8SOrsxUbj//odZ3qxC+XercGAPS
   SaKptNN2AYzPtg4JsKSe8SHZ0ZQAe1y8ytTbn+2l52ydAKw6qSohXVz5e
   tpCxoMK0ADjUDyG1gBpbqFWila391MQYU2+xTecfKjchjNQcLP1/UBpWF
   gcnaCG6RYYgI7SmRQZSugrb4bhX+12vCQq5apcxZrr2d+o4cNGc2hC1Lq
   yyS0ePNhUk/TMPxrlUDdaSGX2wGtvlr5QVBQKJANVyrwOiW4BUjn2h0b4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356434481"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356434481"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 07:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724011747"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="724011747"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 07:34:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8Ft-00051W-1H;
	Wed, 19 Jul 2023 14:34:17 +0000
Date: Wed, 19 Jul 2023 22:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andrealmeid@igalia.com, tzimmermann@suse.de,
	tales.aparecida@gmail.com, mripard@kernel.org,
	mairacanal@riseup.net,
	Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
	davidgow@google.com, michal.winiarski@intel.com,
	arthurgrillo@riseup.net
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <202307192136.DPbcKMcd-lkp@intel.com>
References: <20230718181726.3799-3-gcarlos@disroot.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718181726.3799-3-gcarlos@disroot.org>

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Eduardo-Gallo-Filho/drm-Add-kernel-doc-for-drm_framebuffer_check_src_coords/20230719-022204
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230718181726.3799-3-gcarlos%40disroot.org
patch subject: [PATCH v2 2/4] drm/tests: Add test for drm_framebuffer_check_src_coords()
config: hexagon-randconfig-r041-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192136.DPbcKMcd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192136.DPbcKMcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192136.DPbcKMcd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_framebuffer_check_src_coords" [drivers/gpu/drm/tests/drm_framebuffer_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
