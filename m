Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325903264E7;
	Mon, 28 Sep 2026 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567367; cv=none; b=EeVocNuzXBiwmRHPYbTPv4OGAVbEabzIowWBs3jnsChlH0JoeWKFzCUMLzX47mIkBnXk6JX9yqcllhnuu+Z6+uFlmyzcomWRG/4UaZ1sEckygjDhSSoy6xYAbOkDPhM/yIZ9Lt2MpoUctMyzuM6jiWGmoYYjzlg2aTnLRRAFCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567367; c=relaxed/simple;
	bh=y755B27tkopzUeTAkO7I065UxHoDIem1o51RhqnDwok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SHdPNboeBVle8lQpuZK7AC2YbrXXFawR0jiHs9cgcKNPfleveu1axfoFcZ/iFCJCYgTK+9Uat1T7+eryKaJv0fUNMer6wrm6cE9BQpL35+PVNGd0sLYlaYwRmWXQoDl3KtbrAlEGG9Zu/4cdEO9BsqNtAqVEBcULlqURnxN+JVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuJAr174; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuJAr174"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790567366; x=1822103366;
  h=date:from:to:cc:subject:message-id;
  bh=y755B27tkopzUeTAkO7I065UxHoDIem1o51RhqnDwok=;
  b=TuJAr1741nM+BDGlfPF3tFbV5+m7dO/5IHF1Ig9W2f5m01xUa7NkknXo
   xf4/Uj3y+aLArVIF4vJrXA1MADK+/FTf1zS6/YbBJt5TgfkKmbTFxEnDs
   6J6DKdpGXbOvylci27xEmBQkzrI9s7JfZIG5gc0cG7ivU+XJIuHxmAF42
   xglec40ic4J+TK0jHyXhKEgzonM+GFgTLQ9J3a8ORF1xhrSUnADEFdOSO
   241V+oKKoG9AaVL0ZHsJ1+1aLTW6BxSPcwhU+bo4wyeRe4PwbOB7+fUNF
   j1zk0DBpX9ItWgroCtareqCD6nms/z88Y2nO4Ylcyv/iYx2IdV+uh1BrA
   w==;
X-CSE-ConnectionGUID: g4As94v3RVijctnE8vwlpQ==
X-CSE-MsgGUID: oLKT41tSTDShSMjoTe7gfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78819607"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="78819607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 20:49:25 -0700
X-CSE-ConnectionGUID: 4mHCk4lMRS6/ezRLn9mhtw==
X-CSE-MsgGUID: nK+NtNdrR023vnN8+AI98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="279659353"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2026 20:49:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB2Mj-00000000NTq-0k8t;
	Mon, 28 Sep 2026 03:49:21 +0000
Date: Mon, 28 Sep 2026 11:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Nicolas Schier <n.schier@fritz.com>
Subject: [kbuild:kbuild-next-speedups 10/21] llvm-objcopy: error:
 'vmlinux.unstripped': section '.modinfo' not found
Message-ID: <202609281114.YdStyybd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-speedups
head:   a98db7418797bc27bef53c861b97ac748f598414
commit: 5fe4dd59664105a9ea1a9468aa7391806b80364a [10/21] kbuild: do not allocate .modinfo in vmlinux
config: arm-randconfig-1002-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281114.YdStyybd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281114.YdStyybd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281114.YdStyybd-lkp@intel.com/

Note: the kbuild/kbuild-next-speedups HEAD a98db7418797bc27bef53c861b97ac748f598414 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: 'vmlinux.unstripped': section '.modinfo' not found

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
