Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1957B3D8A;
	Sat,  4 Nov 2023 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx1so7Aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699070253; x=1730606253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sImoohTti9bqWZR9pDcgmaHIuPqQ30e+PDTsfXTV8gs=;
  b=mx1so7Aa+CUpSrhgVgJuvTzSoKGqewGdKi0NcQJchwI/Gk6q+amBCP8D
   RhpCauLhmvFdt6/XF9dXNocGg1xS7OMv9Gr5twLqpfBvhgLTRP4FEZY+U
   UBbQI5v9pxOhaPICa0klV56r/gVbd0ESajtlIPINNS4YlPg3kSj9cErbq
   tWs1R21gYvNL7hPpOOWwoowfh8FfTed4mNQntr9WS8zqdPTsxTxWE3DZF
   9i0MGHDmQ/RtyHej1droBwoBQit5BccGToaGS+G9wmiJ3brU6QvLEj9Hh
   f4BtRMQZXUHMQvihmGSa8pYT0YDlwiS7WIdChHKnGmZ1JsA0eKqZr41Gp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420174469"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="420174469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="9573726"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2023 20:57:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7mn-0003Nx-20;
	Sat, 04 Nov 2023 03:57:25 +0000
Date: Sat, 4 Nov 2023 11:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
	noralf@tronnes.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v5 5/6] drm/ast: Add drm_panic support
Message-ID: <202311041116.Madu45VI-lkp@intel.com>
References: <20231103145526.628138-6-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103145526.628138-6-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20231103-225824
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/20231103145526.628138-6-jfalempe%40redhat.com
patch subject: [PATCH v5 5/6] drm/ast: Add drm_panic support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311041116.Madu45VI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041116.Madu45VI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041116.Madu45VI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ast/ast_i2c.c:27:
>> drivers/gpu/drm/ast/ast_drv.h:508:14: warning: declaration of 'struct drm_scanout_buffer' will not be visible outside of this function [-Wvisibility]
                              struct drm_scanout_buffer *sb);
                                     ^
   1 warning generated.


vim +508 drivers/gpu/drm/ast/ast_drv.h

   506	
   507	int ast_get_scanout_buffer(struct drm_device *dev,
 > 508				   struct drm_scanout_buffer *sb);
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
