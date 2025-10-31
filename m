Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BD329385;
	Fri, 31 Oct 2025 07:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761895476; cv=none; b=UM7rXn8pr48CfuJNYu6RJjKx9hgYc/Bs7cGG0GEpw0rAR+Usbj2SzQYOszv0do9bUJjWO2xF3U9mDz2gJKs21R59qTmYOcLtxhDTSOigrDB9XO6YTshVsO8AP5dlYUprDQnTviVvFU5dXHCvOJzVKE/ClF98wb1nhJR8VKowxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761895476; c=relaxed/simple;
	bh=etsA7DMDGlHa2EKAk8aJtFmR84OwwPDSpcbJxRX3u8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfsJbVv6M9+jrV+BIuJjSb0J7+LkYnAQP/y+utu1zJpRN7E89UWRc0Wsa1IKrfS7jTDzBx1U8h3vaENaYC4UIsGIggvA583HdwhHpfwr+95Cc/oMpgO0/wiojg/rBF8fPUmFxm1xEv39QIftghFYoAYO1Pxaqc4TeGj7FjpcXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/fOGu6a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/fOGu6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761895473; x=1793431473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etsA7DMDGlHa2EKAk8aJtFmR84OwwPDSpcbJxRX3u8A=;
  b=N/fOGu6ah6h6VrvXcwzpRBFCd943ZEaoFsbSpn1NV2EdojpwSrHXOWe1
   kyFi8/Bttd64S/D18I41oWJwoTqoousib7ER9791hkD3RCnml0wuhi3rB
   V5ZgKEs2katj+ZT7j7+Vvnxf3fuGKLw2rdSbB4dJ8PBqBlIqnBSR8iroI
   0fSiDiX8jfk/kLp1MUHHpgrB+ey8Q2EmBYUZkmZTansuIKNKCQoVgGKUZ
   HdGFpRKwGBpw2+CYAHqauC7bRtd0ijQ5nVz2y54j5P1/APX6TtEYhyzYc
   dTniMGDacavmOYKgjq7fvpkvf24IMd+s6rWRldHsvfW2xg90dmwVbqv62
   A==;
X-CSE-ConnectionGUID: l+kwuaRpT2mwxZiDUBI+BA==
X-CSE-MsgGUID: +6a5PkN2R3+JMq9A/X8SvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75399720"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="75399720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:24:33 -0700
X-CSE-ConnectionGUID: GV4fVGtOQCuFVsCBwLJ7wg==
X-CSE-MsgGUID: 467kVVMGREmynpL71I7SAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186281757"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 Oct 2025 00:24:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEjUr-000MrI-05;
	Fri, 31 Oct 2025 07:24:29 +0000
Date: Fri, 31 Oct 2025 15:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tip:core/rseq 39/42] vmlinux.o: error: objtool:
 irqentry_exit+0x323: call to class_user_rw_access_destructor() with UACCESS
 enabled
Message-ID: <202510311508.2nnmAG7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
head:   69c8e3d1610588d677faaa6035e1bd5de9431d6e
commit: 84eeeb00203526c29135d5352833d01e53fc1e16 [39/42] rseq: Switch to fast path processing on exit to user
config: x86_64-randconfig-016-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311508.2nnmAG7r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311508.2nnmAG7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311508.2nnmAG7r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: irqentry_exit+0x323: call to class_user_rw_access_destructor() with UACCESS enabled
   vmlinux.o: error: objtool: .altinstr_replacement+0x12cc: redundant UACCESS disable
   vmlinux.o: error: objtool: .altinstr_replacement+0x12cf: redundant UACCESS disable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
