Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807F23AE60;
	Thu, 19 Jun 2025 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317688; cv=none; b=lsOnUKB0QCcu89mOm6uXPXU6Xki34gaqJzLzCKCc6SZ5JQl6vBfaI+mx/Uj1xKxEvSfCee6i9oOcLMUfjawFYD0Ho3tJpVSOUkfMjlsSlgGbBzcVrCoBIKHuLLn7YfXjSWQiGX6IFyk+lOA10Jz88uuT9SFh3pQcR+j/4/Wut+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317688; c=relaxed/simple;
	bh=QPSBc8Une+v2evtmUldYAtgnGtWTzJ3aRIcVWBcA4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPse8Dbu0xCnJ5F6c8q5r/ZuTWTxUa/Ky1in+yPjqaMamILAKxgmoaNQErmNgDp/YVuRM4Pv/yxDUCWz35UgI1wGrvH5Y6a5eslITRiubUpOPtzVDTTx73aKBTCLWR2xPW6816o7cyK5CuVHw/ojxrUXKFfhKQrG0d8ERyzi7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZA2B2P1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZA2B2P1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750317687; x=1781853687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPSBc8Une+v2evtmUldYAtgnGtWTzJ3aRIcVWBcA4cM=;
  b=eZA2B2P1dhyeubeyi524ccaYzd7uQ6u1o2RqXAbRieqAvlEpwhcNA0id
   ryj9Esa4xxwx8ZbGOpAZJS7MIdk4Y7fMtDCmRzx17pnCUJZA7JZKSAUAF
   1BHsEE2NWmjMBapIikHi8gv6u63zSx0Y0pBlZLSJKSxBaLPomIc9tJLZs
   0/u7VFWussxjC3cCsX876A4jn2Ni1rtHr3CW+ynurPsBpfIcumsBMUfuN
   EHCD/eQB3He2LmwyXWTHMDBYZsAfLHWWQXuGaCa+gaf6TnB+DfuXqHmSI
   UT0TCBGlxcjboX4jbmK0KU4sXNnl7XeMAZmA2fVH1hl4PZFCyMXX2y6D7
   w==;
X-CSE-ConnectionGUID: +OkjHbAjQ3eIvJS3AZ/jWA==
X-CSE-MsgGUID: kbmUVKw8T2KFUIU5uZMcPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40171968"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40171968"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 00:21:27 -0700
X-CSE-ConnectionGUID: ASKh9BZURnSEfzc4Y8n7Sw==
X-CSE-MsgGUID: M3ikF6xTTuy5abU6Bl+4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154801463"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2025 00:21:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS9aN-000KV4-2d;
	Thu, 19 Jun 2025 07:21:23 +0000
Date: Thu, 19 Jun 2025 15:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:tdxhost_kexec_new_v3_wip 4/6] vmlinux.o: warning:
 objtool: tdh_vp_enter+0x1b: call to pfn_valid() leaves .noinstr.text section
Message-ID: <202506191530.xivKNsvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdxhost_kexec_new_v3_wip
head:   e3d211bcc0e2cc0cecdd49d1e65ad6d6f8d5d3c3
commit: d8f94663c1fd58d5f10086aa4826f1f0534029ca [4/6] x86/virt/tdx: Remove the !KEXEC_CORE dependency
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250619/202506191530.xivKNsvG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191530.xivKNsvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191530.xivKNsvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: tdh_vp_enter+0x1b: call to pfn_valid() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
