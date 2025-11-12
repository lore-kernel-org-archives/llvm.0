Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA12D97A9;
	Wed, 12 Nov 2025 05:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762926852; cv=none; b=Swx2fddTuedBjg7O+YheAoNm7PZjK0863UHQfBXGEaVOCY9+tXnnLrejJbDYROeZARTCeT3UePxeFcRlkPRRU7d7veJZv8oHY85OmyAtgAuqEQ1oJUmnZ06Pvkkbeg3MbXuosZeT/JE5fS3yfrRV+AIzkMyBzvRc04LZGZzJF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762926852; c=relaxed/simple;
	bh=7J83XQBNWK5axJwzS+szZ/H/JUXqW86n8kUZMBla97U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVPoPB/iO8SViIb7PCiTl5NPg8nKtPEvpmLx33LIxQbdRdBzYv4uLPMNghovbCf07OgpskIhpql13tLqsSBWIdl8rkxlwq9MyxfW2ezdxV5ndfKXffcBK9AwyI8ubdgHx0cr03EjOrvB4Dup9KWAVpSO3IFeGeFKfKO6SsvGL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwDb7sAN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwDb7sAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762926851; x=1794462851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J83XQBNWK5axJwzS+szZ/H/JUXqW86n8kUZMBla97U=;
  b=FwDb7sANixJ35RiFGjJ9P4POQZXEtcsu/BUIqyr0qMYzFaXGX2JOl7d7
   eJZNpqZ+jlc3Qvz79g/FBOFtcBeDIAhUHTSNN7JWKlezlKgADhm26ZDVK
   5omdKLNj0tKzTHVv9YIvLl2lLU9O7i5/q/R8P+gMBl59Fsr8U/JRHjt99
   T1WQuwlyBWgVwXvc1qF/mCPiDWzn35Tb95Ih8aFNa1xBTdIMqT2vC03zP
   qmnOpq9EL9wdoX/alN8+bzXva/KL1k6LqPsVHUj7ae/nK3hZGUJU9Sdx8
   3sh6qwnEhex33DTCi6nadZYVYbR0b2BpIEHILWlfpYMt6SCEZtCplZfw3
   w==;
X-CSE-ConnectionGUID: Awz1X7V3QuiscuUDlkEscQ==
X-CSE-MsgGUID: wNgOvNOTT6GBB0lunQEolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68621670"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="68621670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:54:11 -0800
X-CSE-ConnectionGUID: DJN8jGP0QTGdGueA0vxG1g==
X-CSE-MsgGUID: p5/qm92wQ0+QgFpsjTkM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188975455"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 21:54:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ3ny-0003sH-2f;
	Wed, 12 Nov 2025 05:54:06 +0000
Date: Wed, 12 Nov 2025 13:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/bugs 10/12] WARNING: modpost: EXPORT symbol
 "__WARN_trap" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202511121314.glh4hyXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/bugs
head:   21afb4fd94390c799ac2b6ded372a0ccc3883c7e
commit: ebfca56e608fdcb6e43cd36e80bca4e9f6dd47a1 [10/12] x86_64/bug: Implement __WARN_printf()
config: i386-randconfig-015-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121314.glh4hyXi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121314.glh4hyXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121314.glh4hyXi-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "__WARN_trap" [vmlinux] version generation failed, symbol will not be versioned.
Is "__WARN_trap" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
