Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD82EF9AE;
	Tue, 17 Jun 2025 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194154; cv=none; b=FVopShaktmzJNPzvrgs4Ke3+6HKud6yRJdeF08HVqNH2G3E+n+Z0i8SKOOVinihMylPny5Ghenb1+8e9PF4vmvM4NRHh3IJlSZd4vfsASG+CkIHR/iVewub1LNLfQbr5Ws6MwAtcZYIAXVqh8Qr/0PxOqEZAV0IdRd/qt+T41WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194154; c=relaxed/simple;
	bh=5RPYnG9xpdhEMO/Ay444O5+IorN3tv2dw/ehK4e1K5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5e/oPNylHgQqqh6ww69rWPBQ0ALaYLXgOd6HEy+wUSLgpnKFIsug7blUdZLSp53WtnKsaWAe8X1qZ+jNob9I/vX1Ufbv0ebgKx7K4ii69lfilnRtUy5DnKFQ/rcCONx2MfTcCBzC5Shyo/I6Zt9w8gzJhyeW71FeRkz2M3DRb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jxuvn1CD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jxuvn1CD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750194153; x=1781730153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RPYnG9xpdhEMO/Ay444O5+IorN3tv2dw/ehK4e1K5Q=;
  b=Jxuvn1CD1/VQjYenFRcVaMOADehSQtKkbZxQOwSEmJAo3Iy2OVwm3y+3
   NmJ3RDSuaiT20SgUhupxILIYXPJskBYWHpbHR3b4NFO9XiJLlrbztSe+x
   934FBvgiwovQYAclulyVnOHJidocLvTh+0RBpl/Jguf+3QnVITfU2yi6z
   xMxZ7QU2Go9QBehcj91UK8BrxRB5a5NEQWMsfl+i17Dl6dYuAy72pekeJ
   FYzMU6jqx3HJuJ/wJZWNkYWAmDbI8Ix3C9zy5H0J6DsO4c60/HPLoaIIQ
   E9CQhgQqNzUWXe0T2QkrVeIlBUTgEDfkrodBGIw8zZkHyRUGL4pJpTOcB
   A==;
X-CSE-ConnectionGUID: frRGPccVSOieum3JFebQtQ==
X-CSE-MsgGUID: qPhK5EwiSKy7IXXeVafWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="39998279"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="39998279"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 14:02:32 -0700
X-CSE-ConnectionGUID: 7GWlfxaxRM6GZFynHIt25w==
X-CSE-MsgGUID: re4EOEXLTZSYnqYBi0Brmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148771391"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2025 14:02:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRdRs-000I66-0a;
	Tue, 17 Jun 2025 21:02:28 +0000
Date: Wed, 18 Jun 2025 05:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1327/3035]
 arch/powerpc/net/bpf_jit_comp64.c:417:21: warning: variable 'ori31_emitted'
 set but not used
Message-ID: <202506180402.uUXwVoSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4325743c7e209ae7845293679a4de94b969f2bef
commit: dff883d9e93a7f2f2fa4e38a9444b2c79d6da91a [1327/3035] bpf, arm64, powerpc: Change nospec to include v1 barrier
config: powerpc64-randconfig-002-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180402.uUXwVoSH-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180402.uUXwVoSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180402.uUXwVoSH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/net/bpf_jit_comp64.c:417:21: warning: variable 'ori31_emitted' set but not used [-Wunused-but-set-variable]
     417 |         bool sync_emitted, ori31_emitted;
         |                            ^
   1 warning generated.


vim +/ori31_emitted +417 arch/powerpc/net/bpf_jit_comp64.c

   411	
   412	/* Assemble the body code between the prologue & epilogue */
   413	int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
   414			       u32 *addrs, int pass, bool extra_pass)
   415	{
   416		enum stf_barrier_type stf_barrier = stf_barrier_type_get();
 > 417		bool sync_emitted, ori31_emitted;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
