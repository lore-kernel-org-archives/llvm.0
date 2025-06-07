Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E223A6;
	Sat,  7 Jun 2025 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749277158; cv=none; b=IRznb67Ndh6d7UUHv8iXsTIsDpuYlXO55d4BXvYLSstvrMM6+E1zS2Ub/scFg8kxI8T+y5g3vvYqEZHN0k5nRj4knNBT1nWbDyadrXw7PQdxxj4eX3A9kVbZOmdWncSHjbJl1sDFbNnFko4BvT/rjsBzy2kiMUAswg3tlRY7HOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749277158; c=relaxed/simple;
	bh=BuMLIVe9qFv/wTQkRPfHni/qgJRR18bI7Mw6Ylh3vSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3t+MPzXeoHqpzCKxN9FGQ9ziTyutq/ieyD363R978ZdqQaB58IZlaC8QfPo1sxKB+mA9hjziwZaD7KZXUh2abXTzuAycbYPwO/5g8sRz+PL7WmtPqmAThgtvp9ijT7ufcMKAS01eWxuqKM7xU3ivw2iFBNQenashHC4PBwR2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=be2kuJVt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="be2kuJVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749277157; x=1780813157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BuMLIVe9qFv/wTQkRPfHni/qgJRR18bI7Mw6Ylh3vSI=;
  b=be2kuJVtFmgtl+6dTnwiTmW1rzi4ajiu3UGHJtJPu6jJ6QCZF4JNB1Im
   52oO/oP1eHKAgoDGLhk42TW+HzcIGe2BVfzDbE1evCWc3qm//DhqIvvq1
   SGI3m5e6O97zuFNcKpdLIcHicsC0PTY2aULGY8lDA0JmhZFFOCCqaeet0
   bQx6qSlyjbjsLozTMoNPzt/qC7++xejxZMlmwusCRf3fohZvAN7KQOOEn
   L3rS7A9YXDuJbgb9ChtAA/dgu+D6joAbQN/nT6ldsNAXc30XswMhmLcXJ
   5ulEQMFqlGWK4ukJ4wVvDRDctCJyTacURYBj9SAXeb6BuwcE9jemj8Vwi
   Q==;
X-CSE-ConnectionGUID: Zx4xQrzkQ1yjoV08Jrs8Cg==
X-CSE-MsgGUID: 1cKm9TvHSvSq4+MH8z0KMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54055833"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="54055833"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 23:19:16 -0700
X-CSE-ConnectionGUID: 7udyH0jDSAyDJhD4OsMtzw==
X-CSE-MsgGUID: CDTOdjzAS8O1+g7IidCGeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="183203111"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jun 2025 23:19:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNmtc-0005Uz-1R;
	Sat, 07 Jun 2025 06:19:12 +0000
Date: Sat, 7 Jun 2025 14:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm: Add support for io_uring's uring_cmd in
 DRM/accel
Message-ID: <202506071421.2BsXneKu-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-McKevitt/drm-Add-support-for-io_uring-s-uring_cmd-in-DRM-accel/20250607-021118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250606180806.2193463-1-zachary.mckevitt%40oss.qualcomm.com
patch subject: [RFC PATCH] drm: Add support for io_uring's uring_cmd in DRM/accel
config: riscv-randconfig-002-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071421.2BsXneKu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071421.2BsXneKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071421.2BsXneKu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_ioctl.c:958:3: error: expected expression
                   const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);
                   ^
>> drivers/gpu/drm/drm_ioctl.c:959:28: error: use of undeclared identifier 'drm_cmd'
                   unsigned int ioctl_cmd = drm_cmd->ioctl_cmd;
                                            ^
   drivers/gpu/drm/drm_ioctl.c:960:29: error: use of undeclared identifier 'drm_cmd'
                   unsigned long ioctl_arg = drm_cmd->arg;
                                             ^
   3 errors generated.


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
 > 959			unsigned int ioctl_cmd = drm_cmd->ioctl_cmd;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
