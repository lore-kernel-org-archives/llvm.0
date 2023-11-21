Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0925812F;
	Tue, 21 Nov 2023 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7o0Um8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700582276; x=1732118276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AVzwq7cpyclPUh7cjO7Y4G2ZBF5bOS2+E3WRyl9meA=;
  b=U7o0Um8YoeWTf5NtS1w2Ks5KsfBjDTVf7ZJzc1KbMc2j4uKXCB4Fd0Ew
   J7QfAbNnDnyWN8/oLsnjrI95mDPKhkPuw4kf4urgIg9B86NTSsbJGy9l5
   MQYLx8worr+fl/mqZWV36+v+1eo0p/9xNzjeNE448smbQ0HQ4QL2oU928
   mz3D0LxyddeXeMuHVYB7VSU92RO8FFcRt4702FF5+Rl17R6nl4tolrbJZ
   OSXH6nxLYtyqogGUl+aj0084ELDzrvWUOKCidk0wOE4YACEeYBPbRZSSf
   ZrMXvAs7unz2nWQIdliwp1OYZBvgZHxi0hQiK8cW+OPBqWKpmXpgpkfmI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389016665"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="389016665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 07:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="14946575"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2023 07:57:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5T8K-0007yr-1j;
	Tue, 21 Nov 2023 15:57:52 +0000
Date: Tue, 21 Nov 2023 23:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-6.8-nv2-only 3/50]
 arch/arm64/kernel/cpufeature.c:2084:10: warning: use of bitwise '|' with
 boolean operands
Message-ID: <202311212300.V9r9WIaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-6.8-nv2-only
head:   759d2e18f8954f4c76eb1772f38301df6ed8fa5d
commit: 05f8126eff48f8833c39f3dfbd7124047fc9af98 [3/50] arm64: cpufeatures: Restrict NV support to FEAT_NV2
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311212300.V9r9WIaO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212300.V9r9WIaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212300.V9r9WIaO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2084:10: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    2084 |         return (__system_matches_cap(ARM64_HAS_NV2) |
         |                ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                     ||
    2085 |                 __system_matches_cap(ARM64_HAS_NV2_ONLY));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2084:10: note: cast one or both operands to int to silence this warning
   1 warning generated.


vim +2084 arch/arm64/kernel/cpufeature.c

  2077	
  2078	static bool has_nested_virt_support(const struct arm64_cpu_capabilities *cap,
  2079					    int scope)
  2080	{
  2081		if (kvm_get_mode() != KVM_MODE_NV)
  2082			return false;
  2083	
> 2084		return (__system_matches_cap(ARM64_HAS_NV2) |
  2085			__system_matches_cap(ARM64_HAS_NV2_ONLY));
  2086	}
  2087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
