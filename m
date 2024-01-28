Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CB23772;
	Sun, 28 Jan 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706451215; cv=none; b=f5JQACMqVZBEdaDF2bmTtUzuLSX17i3K9efhZwiQzhnMCbf/YZtt7BPHvXL5JLFLoAmrP2HBGiDNA9rgXgijgYmjA3bN+bfpFKjAtZvQ547MxAbt3xrJlB3F+wTzJIf7eVw7rEOA7kVTm/5zxbL3msFy+CJpq37smXKnT3bPeMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706451215; c=relaxed/simple;
	bh=cVuSjDYxKdCFnNX3BN84vJCgod9VLNtOwmaCxQcY6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNLJywgwCO5nOo9gYUWig3OjVfxmj6drw1Dl619h3yTwENloj+Nqx5q8iCNl4A/lkcO/MkebApIzEIBk7BVAtTvf5aD+A+RD3Gc6dWUqYqPtYzokcyspnjdNiC50r6Z4mTWQhacP+4fVrAmQOlnK/TGk7k+kIQmHm4f23qHsAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cl+nd2Qm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cl+nd2Qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706451213; x=1737987213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVuSjDYxKdCFnNX3BN84vJCgod9VLNtOwmaCxQcY6ks=;
  b=Cl+nd2Qmt3nS2cYyJMbnBnK6jIjw5IV9elVuC8J3+aO49rdNEalPsNGF
   6/phfO01BdSeXrkUb3muUae4veA9DGWX/V49qrqyncq4GnydFvBsnfG90
   7IGJU76o6X6KM8NGYNCKJNyOjSIAsvuYCJWKZ3x1WhpvPGbTuNuGk+d4q
   4lob2An2xramKbiTtN5ZoCluDsMrPoD5fub9olky0bK7XKy6bAJA9nM/3
   iDI2eO14P5rZ8IPHNzxfzibVgDfsa6kvIFzEq4eGAYcPuzTAGNwp7CYWq
   BY2eHUS0+2Zq8q2GSv+RvtgnDr26YN1m+NAcUO7D5P1qlgWKDpSAb2g3S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2605361"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2605361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 06:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="857854986"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="857854986"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2024 06:13:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU5uY-0003S9-30;
	Sun, 28 Jan 2024 14:13:26 +0000
Date: Sun, 28 Jan 2024 22:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 6/10] ld.lld: error: undefined symbol:
 bpf_arena_get_user_vm_start
Message-ID: <202401282230.sznzjkkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   7ec22ac2adbc15f8ea20c1189b2dd95558ae3bcf
commit: f46bfe6061c3fb76aabd27fb9dec3deb98d0fc75 [6/10] bpf: Recognize cast_kern/user instructions in the verifier.
config: i386-buildonly-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240128/202401282230.sznzjkkK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282230.sznzjkkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401282230.sznzjkkK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_arena_get_user_vm_start
   >>> referenced by verifier.c
   >>>               kernel/bpf/verifier.o:(bpf_check) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
