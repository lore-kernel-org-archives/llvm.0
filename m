Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92C1371E;
	Fri, 14 Jul 2023 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689339279; x=1720875279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUehSNIhpgfMcwjJx9dDQdO4y3dzesHlfe2bHlEG+rg=;
  b=mZ9eehgtEK7wpcTnfmWEqeWMnYQdcAFjWlZqhfY4xLS54fdsfYPNGAcB
   mxaNx44aSnEl3T4G48cAOpGnwmVxhMjZvZsMcVTb8G5NU3K21OiX5J2ig
   jYKdwUks13XErFeEw2m1XdYstxMq6WFk6S+mXxhybujyxoBry8z34t+O0
   nWuRGrVCArFzfu6nMa20QVhACo1uLa0FS4UA0HGNheXFNNs2GWPD6Yg+T
   KBGDUZhcRuxnwB2aUasSAtvI/gwI7x1sszZV7JKeKSPVOy+acIw/k69BR
   jsCKf8zlTUf/jEtNJh+TDPUKzHaK66iqV2Bk+cxHHOkP+xoLt9cMufq/7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396277065"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="396277065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 05:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787845408"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="787845408"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 05:54:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKIJe-0007Rl-29;
	Fri, 14 Jul 2023 12:54:34 +0000
Date: Fri, 14 Jul 2023 20:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 43/198] error[E0615]: attempted to take
 value of method `map_wc` on type `drm_gem_shmem_object`
Message-ID: <202307142038.9aYGi60x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   c2bbe7fe79da5dff6da45eb1d4a5a582db740429
commit: 412d81031938631c74bb0575be5a2cfe9f5c5eb8 [43/198] rust: drm: gem: shmem: Add DRM shmem helper abstraction
config: x86_64-randconfig-x002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142038.9aYGi60x-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142038.9aYGi60x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142038.9aYGi60x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0615]: attempted to take value of method `map_wc` on type `drm_gem_shmem_object`
   --> rust/kernel/drm/gem/shmem.rs:210:38
   |
   210 |         unsafe { (*self.mut_shmem()).map_wc = map_wc };
   |                                      ^^^^^^ method, not a field
   |
   = help: methods are immutable and cannot be assigned to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
