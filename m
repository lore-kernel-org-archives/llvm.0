Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374221A436;
	Wed, 22 Oct 2025 01:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097668; cv=none; b=G3A+rBRMlu4ll4djPuAhkL0DKaBIXc/zPW0ZzsDsqhPk69CKcF9/AYfIJRgV68k1WieRzZitWmmp5JhfAMtNRCgdGptnV8PJxOI5Wm3zkkHbWP4MaSc10hk3DX96FsbUc1A6J1GB405AlzS8bC5VN8zoY52Kz9IWE4ic5OvHsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097668; c=relaxed/simple;
	bh=SYrjklv5yaqTa9b2Mz801w7XycbmljMb3/5NvgufkhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/4uxJh90SymXXPxRgS07JpGwR7A1klKSsABpW59gohbpiuZFvcTdzVaPgDriozwWtb5cpc9kJRx8J+51rlklbgwKB09fAUl8Qh+PkLkKvNQa5MAUmrNNq5VGG+MNOfvauK9Kf0ErOqZ2jTbS+AgjaP7xmdZoEUma5jesg0XGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQJlxvDO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQJlxvDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761097666; x=1792633666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SYrjklv5yaqTa9b2Mz801w7XycbmljMb3/5NvgufkhA=;
  b=TQJlxvDOW+8QpYR8K3qxNe35LQ7CjyL7IJXB5Saei1OyeXqhy6b/2YFV
   3z8xxcukInXOSLzSn8RKS/QWM6WK6fj7PQ7vRSnGjWoBren6+QBWMrCCg
   X0VGesMLJ8wmpivGjsArXlOFyP1c2gXG5NBJHPmv1e6VY02fnrKEz4XNp
   O+Ps9i+hOwLw6aP+YAIOAJN2Gy5dNO7qOmnVCZCVNmRY43RBuimfftJJz
   dD+VKDJSORfRBQYRZZv1xXGAbxcOIoz5JAdWaYA5r36m066bzem8xzPpe
   xI3NstSSRWB76yak6VtULdL423fRTHOrvMUn2cWFP/700IQh+lOY9KDJm
   w==;
X-CSE-ConnectionGUID: eu7GdefuS3mVrQ5YedqUcQ==
X-CSE-MsgGUID: VWbtWz/TRHyDO2LUeHFL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74578523"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74578523"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:47:44 -0700
X-CSE-ConnectionGUID: 64Y6jRp/QL6Aq2MJZAFxRg==
X-CSE-MsgGUID: fNuSc6gfQGOh7smNgfyucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182947416"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2025 18:47:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNws-000BuR-28;
	Wed, 22 Oct 2025 01:47:34 +0000
Date: Wed, 22 Oct 2025 09:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Christopher Healy <healych@amazon.com>,
	Matthew Wilcox <willy@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/12] drm/i915: Use huge tmpfs mountpoint helpers
Message-ID: <202510220918.LOLA5KIF-lkp@intel.com>
References: <20251021113049.17242-7-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021113049.17242-7-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251021]
[also build test ERROR on v6.18-rc2]
[cannot apply to akpm-mm/mm-everything drm-misc/drm-misc-next linus/master v6.18-rc2 v6.18-rc1 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Simplify-page-offset-calculation-in-fault-handler/20251021-193355
base:   next-20251021
patch link:    https://lore.kernel.org/r/20251021113049.17242-7-loic.molinari%40collabora.com
patch subject: [PATCH v5 06/12] drm/i915: Use huge tmpfs mountpoint helpers
config: x86_64-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220918.LOLA5KIF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220918.LOLA5KIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220918.LOLA5KIF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:511:46: error: no member named 'huge_mnt' in 'struct drm_device'
     511 |                 filp = shmem_file_setup_with_mnt(i915->drm.huge_mnt, "i915",
         |                                                  ~~~~~~~~~ ^
   1 error generated.


vim +511 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

   486	
   487	static int __create_shmem(struct drm_i915_private *i915,
   488				  struct drm_gem_object *obj,
   489				  resource_size_t size)
   490	{
   491		unsigned long flags = VM_NORESERVE;
   492		struct file *filp;
   493	
   494		drm_gem_private_object_init(&i915->drm, obj, size);
   495	
   496		/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
   497		 * greater than MAX_LFS_FILESIZE.
   498		 * To handle the same error as other code that returns -E2BIG when
   499		 * the size is too large, we add a code that returns -E2BIG when the
   500		 * size is larger than the size that can be handled.
   501		 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
   502		 * so we only needs to check when BITS_PER_LONG is 64.
   503		 * If BITS_PER_LONG is 32, E2BIG checks are processed when
   504		 * i915_gem_object_size_2big() is called before init_object() callback
   505		 * is called.
   506		 */
   507		if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
   508			return -E2BIG;
   509	
   510		if (drm_gem_has_huge_mnt(&i915->drm))
 > 511			filp = shmem_file_setup_with_mnt(i915->drm.huge_mnt, "i915",
   512							 size, flags);
   513		else
   514			filp = shmem_file_setup("i915", size, flags);
   515		if (IS_ERR(filp))
   516			return PTR_ERR(filp);
   517	
   518		/*
   519		 * Prevent -EFBIG by allowing large writes beyond MAX_NON_LFS on shmem
   520		 * objects by setting O_LARGEFILE.
   521		 */
   522		if (force_o_largefile())
   523			filp->f_flags |= O_LARGEFILE;
   524	
   525		obj->filp = filp;
   526		return 0;
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
