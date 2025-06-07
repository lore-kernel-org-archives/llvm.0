Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D3152E02;
	Sat,  7 Jun 2025 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749268387; cv=none; b=hZJXhA6Bc9YcpzJ0W9KtyKZO6PHnd9CgS65ziutMroRKthMF/FVYtNfi1rC1rYyx/AyzLkSNK1Ho7ETab56itI7a3LAJq+6MiwBbhsyfgdqQUcRi1Zbpi538PZ+NpADGQvMhfub3jLmJeVoyyBFNkTSFJ81OoxfkzsINzeFf5CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749268387; c=relaxed/simple;
	bh=oDyGX1RJhgNYjItZyAGo/8hSNOM+h601J3TW4I1r0TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksI/qg71fZkb2p04sIgtLRVjtSjcSmOPHvDdpDcJz+n72aWDCrAzqGKjP4WqYTFFGFzOTb4wmRLymRg0hOziAAQU5wNVz/X8GOqawOCwDlLruQe0kBMZMxW00mMoHlzOJkjl6EGFm3lKcTjPLomuGi8Ktz7MMJ0tScQjbEwLMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ0hdkKg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ0hdkKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749268386; x=1780804386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oDyGX1RJhgNYjItZyAGo/8hSNOM+h601J3TW4I1r0TU=;
  b=eJ0hdkKgLgCqkF/r7c5bCX4WFD/D0Czkb5T2iit2RiTLreg7MzBhDdAx
   l2d7FJS3jpfeegiB74FJqET+CIiUvdQyTzVLwNDlQCr/IjKpRR6dJppr5
   UKhc1OTpbdd4ShI8WQM7fkIGXrW+q8Ckr10uu4JTNGW2g1sHTznexoYWr
   gEVhELK3lWsgcvk8f4YAS19/B+s7FS/sZnOmjiPQtsr1LicVyISRPPBJm
   tiPJFNkpSccRig/WdveuSf+gZh+PtyOOdpezBmv1l7UldFW8HabracoOB
   J3Af8FPz7aQ0YuWV9FuasQr5CD4GQEoZ37QkWNx+kvR8uCD3ChtAIBbeO
   A==;
X-CSE-ConnectionGUID: y/mS33jPTrKH2NpTbFEABQ==
X-CSE-MsgGUID: me+14apZRXSdeVF6NXj45g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68868070"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="68868070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 20:53:05 -0700
X-CSE-ConnectionGUID: XOjEa5EWQL+ldBF9G8BWrQ==
X-CSE-MsgGUID: lTEjJT1URJKF2Gf9xsMMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="151000641"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2025 20:53:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNkc8-0005SD-37;
	Sat, 07 Jun 2025 03:53:00 +0000
Date: Sat, 7 Jun 2025 11:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm: Add support for io_uring's uring_cmd in
 DRM/accel
Message-ID: <202506071127.wjaerC3q-lkp@intel.com>
References: <20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com>

Hi Zack,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-McKevitt/drm-Add-support-for-io_uring-s-uring_cmd-in-DRM-accel/20250607-021118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250606180806.2193463-1-zachary.mckevitt%40oss.qualcomm.com
patch subject: [RFC PATCH] drm: Add support for io_uring's uring_cmd in DRM/accel
config: x86_64-buildonly-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071127.wjaerC3q-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071127.wjaerC3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071127.wjaerC3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_ioctl.c:958:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     958 |                 const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);
         |                 ^
   1 warning generated.


vim +958 drivers/gpu/drm/drm_ioctl.c

   940	
   941	/**
   942	 * drm_uring_cmd - Implement uring_cmd callback for io_uring
   943	 * @cmd: pointer to io_uring_cmd struct
   944	 * @issue_flags: flags specified by io_uring's issue implementation
   945	 *
   946	 * This function implements the uring_cmd file operation to incorporate
   947	 * arbitrary io_uring functionality for drm. Currently, it acts as a way
   948	 * for io_uring to issue ioctls to a drm device, so this function
   949	 * dispatches ioctls to the standard drm ioctl interface.
   950	 *
   951	 * Returns:
   952	 * Zero on success, negative error code on failure.
   953	 */
   954	int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
   955	{
   956		switch (cmd->cmd_op) {
   957		case DRM_URING_CMD_IOCTL:
 > 958			const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
