Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8242A82;
	Sun, 27 Jul 2025 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753585527; cv=none; b=EXZRxpPwiA8JajwUsiv8v2PG4/ziHuu2EYZYlTmmOkEWoINAlhJPp8RnFT0b65OWZVopNS0lpmb1O5HKnBK0oLkHlTh6mTK+0lIxYWf1UILMEpArHRgFVnzl4YJo0DUFLE9I98E8tkqqvfJlw+b0Y1DT+k5xmZMVxVxKKwn5Pck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753585527; c=relaxed/simple;
	bh=zII2ruJImAjEntBQNTbcaKgK+kUkVN3rdp1+0GYemE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=poRm6S8bUjsi+dUyG1lcRMpqTqnuqfIR4e6d5+8EsVpgBHWF+Gb6KWmX9Vs9WwDiJfuQcyhDdFVy87Zz6vLJZBEKD1juwElclksny19lsaGQ6H8HBMxNzNB/Qjf4y3OXl/M7iAqRbju3h9ofiL9Pqb5jvVO+kdaQvokazPMmfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYBgV23g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYBgV23g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753585526; x=1785121526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zII2ruJImAjEntBQNTbcaKgK+kUkVN3rdp1+0GYemE0=;
  b=ZYBgV23gulW0NAlbKA41cVGI0WTHuYK97Hn+qKoSfQ4V3MbkpBOuqZfv
   9T3WMjM4GaN4BDRoy7kb8z63YauqdvXLUYLRe8W743Z4wNIoYV2u7ZnNp
   llH5EIGr5eMVT2Oh8AQV2Wgl318LNLwS9/FVsPSIs3xo2CmvC9px/sIiF
   0y7SGbr9jQsueU6Z2dgdKXn0eP6Q8HDtBNpvt8dD93Lu6X8dsxl+cmw3+
   kQGfVoMKvTO4A7oVYWDwgyL90rGKtESAbgiLH6wehX3LHLBAmN5QG5Z2T
   iAx3n2/8Q6OYlb3jj13ogX+DcVFCPukl877j2IkmFdBgbkBFfsz31ivl4
   g==;
X-CSE-ConnectionGUID: 1EeB8SRiRvuyGDoNjU/qPw==
X-CSE-MsgGUID: u2gMhGnQQBeYItAclwSyLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59522097"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59522097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 20:05:25 -0700
X-CSE-ConnectionGUID: 9kSjmC7NSiK1XvK/KKEF1w==
X-CSE-MsgGUID: lvT9SeEJTMSlzznrPiw1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162404295"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2025 20:05:23 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufrhR-0000MN-1w;
	Sun, 27 Jul 2025 03:05:21 +0000
Date: Sun, 27 Jul 2025 05:04:48 +0200
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>
Subject: [linux-next:master 269/12319] ld.lld: error: relocation
 R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_end'; recompile with
 -fPIC
Message-ID: <202507270529.XraROeRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: bd1d1b46fe42a248916172cdf3cded07b7d93f8a [269/12319] drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
config: powerpc-randconfig-2004-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270529.XraROeRy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270529.XraROeRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270529.XraROeRy-lkp@intel.com/

Note: the linux-next/master HEAD d7af19298454ed155f5cf67201a70f5cf836c842 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_end'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/vdso32_wrapper.o)
   >>> referenced by mm.h:3447 (include/linux/mm.h:3447)
   >>>               arch/powerpc/kernel/vdso.o:(arch_setup_additional_pages) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_end'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/vdso32_wrapper.o)
   >>> referenced by vdso.c:143 (arch/powerpc/kernel/vdso.c:143)
   >>>               arch/powerpc/kernel/vdso.o:(arch_setup_additional_pages) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
