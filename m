Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE41393DD4;
	Sat, 23 Aug 2025 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755927420; cv=none; b=F6zJ0KUKJY+o/XZL9+UJfJYuqqUs/0kHGls2tiZQjx27E+9yRAF44USxHkKR9WexDjy9n4A//LqZorSxqY7HMq76RfV33uwa7geuqGSOU92PLS4BvNqtKrmML8QzgBxHAiy+VMAIcqBPHs6RLsSnyls7jfpLjIjOpYbMShdLgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755927420; c=relaxed/simple;
	bh=1tUpIASBQrRnxUJgYcJxXdTtAc/gOVsJeaZLSIXbdgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFok5MaV+enF1/r00YPdDbB75okBt9qQyeLIT6cBCiSmbwomatI8oE+mia2/G8onXqKpTz8nHvoj/Vz8cUL3CWa3SsUdzV5bzSJeHaHnqLV0U32EBHAdZLC+mHWhHgfTZU9Y9kYiDfIYMT74t8AtztS9kB43UCqkfKb/WWhjxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLMa6rvw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLMa6rvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755927419; x=1787463419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1tUpIASBQrRnxUJgYcJxXdTtAc/gOVsJeaZLSIXbdgA=;
  b=VLMa6rvwZUFAkAs7gJIyxxFi27AhnYI0Hg+2Jn+VVcQGXJw6clUatgS+
   qHS6J83Rit3lkoHKhLrfsEhtKdiCCnWq//FaGXhHy8h2NDCGKkFToQhQg
   CiWirBuNo3i4RkxXWwKebOdsY17+pmJxIE1ye74JbyT4XZZbw9qcGt6kw
   CJvwJdk7KSQNDUGqE+OmenYvqHODqH1ZyDUFknG3eBhhPhjjcdn7vfWW/
   bNUgkhHgLdsjSVXbnbsabHA9kVV+RPOCnXxCMslkSCCcDAom02X7Ty6zU
   gzSQs7Q3ivlFjAQvBSuqFrdCz0KJhf9RTZqVdwn8uktMYdX/KdNV4RiOc
   w==;
X-CSE-ConnectionGUID: 7UeYaZaQQXSBgORAY6JBjQ==
X-CSE-MsgGUID: Mu2P+uDOTMCkGywJYxR/hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58178132"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58178132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 22:36:58 -0700
X-CSE-ConnectionGUID: koOk2SmgRrGtXkcIZHYKQA==
X-CSE-MsgGUID: W9tA1HNtRXy871+AluoCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168763733"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2025 22:36:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upgvu-000M6p-0l;
	Sat, 23 Aug 2025 05:36:54 +0000
Date: Sat, 23 Aug 2025 13:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Message-ID: <202508231334.pWN5ScdS-lkp@intel.com>
References: <20250822142954.902402-2-faith.ekstrand@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142954.902402-2-faith.ekstrand@collabora.com>

Hi Faith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faith-Ekstrand/drm-shmem-Add-a-drm_gem_shmem_sync_mmap-helper/20250822-223306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822142954.902402-2-faith.ekstrand%40collabora.com
patch subject: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
config: x86_64-buildonly-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231334.pWN5ScdS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231334.pWN5ScdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231334.pWN5ScdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:673 function parameter 'dir' not described in 'drm_gem_shmem_sync_mmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
