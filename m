Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3031AF1D;
	Thu, 18 Dec 2025 06:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038844; cv=none; b=fqQ5mASGzXouGH6bz24Z0ILZmzS528JBlhkC0IDykP5eLPWnLYY6M+F6JuNCV7jc/cnO4NIw7AZVCJMVp3nK/wXgLuF6nlp9cVlwFIjxmiKhccdDIWrShPvHlEURHa38t0N/NTB2s36LVerKvzgzhsr+nGmzNeHjoXxEOOuWsH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038844; c=relaxed/simple;
	bh=o6QVfyTbEioV9Gk9FFu8LZ3M0+3vdJbVrm1EgFtzGX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=br+PA4m+jaPcB2neFZNFwPiU4WucQhMcLQeQwSdg9kjhF1eRKgCm2WpwyrgdFPCi1aOOo7TxHcRe2MbReHL8Te3PsoHprchH09NbTweH/PpgAltSvPvsDGb+1HJQvqy77cRl8IA/L6sywF1iFe83hhI0Km/x9wiAmidmY96pAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsWEOOT3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsWEOOT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766038841; x=1797574841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6QVfyTbEioV9Gk9FFu8LZ3M0+3vdJbVrm1EgFtzGX4=;
  b=nsWEOOT3L2/BZlUzMVpbNTtkYRRnZ3GasM1pn2jwSkYmFmKku56dM7eG
   8IkzAS7WGHlITDBlwJjP6pfHg3UzejSjBdjviRGfbSVKAArZMZCy5lNQ1
   AG3MkmxsACn9TS/zM69mS4BIyYJ2BqTsgnBBm+U+YyarHw1fw/MjmL1VV
   Ya0q44JfZJZY5g/evs+5euO+1N+D9dKXMDqCyn/DekMK3IemarMrYCaAL
   wm8Tuty5FdbUZnsU8s9GO50yQIUWHZgWq2ZDp+Ns4XMcoe5rQvpi3KCnN
   30ScyJh94k6c5yvDsSftLYbxs4XGisRdIPTCLPjdElR2TTeSIPkEEkBQe
   g==;
X-CSE-ConnectionGUID: SmhK0XulTm2BsH1vicsAww==
X-CSE-MsgGUID: tNJIKjsXSVKc3bBuLuSdMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71841493"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71841493"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 22:20:40 -0800
X-CSE-ConnectionGUID: aUmFLp7HRsqapSo1FJPygg==
X-CSE-MsgGUID: YeGjzVs0QJyGZIHgU21rbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203392005"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Dec 2025 22:20:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW7NM-000000001fq-3PST;
	Thu, 18 Dec 2025 06:20:36 +0000
Date: Thu, 18 Dec 2025 14:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 19/24] Warning:
 kernel/sysctl.c:896 function parameter 'negp' not described in
 'proc_ulong_conv'
Message-ID: <202512181437.l5SAcjEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   96185449a89d542ae186d3a530dfd59920e7773a
commit: ef242e93868f8732bd115c9b087ebee2c74f36eb [19/24] SQUASH with proc_ulong_conv.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251218/202512181437.l5SAcjEi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181437.l5SAcjEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181437.l5SAcjEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'
>> Warning: kernel/sysctl.c:896 function parameter 'negp' not described in 'proc_ulong_conv'
   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'
>> Warning: kernel/sysctl.c:896 function parameter 'negp' not described in 'proc_ulong_conv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
