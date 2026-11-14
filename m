Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794643688;
	b=xrrfl4H86na+i3Evnyyktcf9cl2+/LyouiA2VhRIPwoE3z8hTAhqfa8rryYISi8YyEMh
	 7qQndhLA8v+7+0d+qp4zL8X8PHb5ec466JTSywGq9Y6+0jveB+ATmNffZDg/KaW+y2wom
	 s1KV9IT8vPmjbY4GiFtrPZYH1gs0o+E6++sHeWAjDMF75mxqa4doVp/+WqN0Mj1XHK9lH
	 YsDhkn3ArCevyCllNxz/mFnXnDpd2Tz3Qr2l+S08i5XT5qhOtJoZS4+xjUXGIUVtGl6os
	 0Vz4y+3/o28ZpyDXB7kiulB8/ypX85H9R75bl9sCBC/HQXRnjtGbppywAnQnv7KitkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643688;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AMvfvtuGPCIX4hwXez9m9TR/hOp92TjyZdeouklQZFI=;
	b=4WmMvXFY5ZWkNJzQhqMZzVETHLr/+ePOHmvEZJqee6vkQcV3XIUSND72Ujq1I+fyclXn
	 pgOlhD89XTJsAZYawq5+FoN9fuGeFkbm9gb/8WmO28TX65zR6J6ZKuSZ61xpy8UplAjA6
	 nLTVIIxPfnrttgyg4SB8mWsuJJyofCdjxFKX7zryjHs/YYXEkbeRPdhc4YJYGc84fRZw8
	 xdVGKwO+QZhcuxVsLi3+7JVhInLAsG7CrRi/7wcEQ4hW4vBFGbKxHsMKVJgqlL/KJisAV
	 xlJ8Fv9GC/glQRFv/qxXxOJdd4uYIsSiU01iF7St/0B5eT6GzbqNy5/2zz7rM5ejUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cQkbF+b/";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10205606A32D;
	Sat, 14 Nov 2026 08:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10205606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQkbF+b/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794643687; x=1826179687;
  h=date:from:to:cc:subject:message-id;
  bh=9RrjyNNU8Fx7Fz4gw1ab+JcI5Ul7RVjRZks5ZBos2v0=;
  b=cQkbF+b/hrh77MZ9ZP2QdpYnJwySOjUQov/6a0nuIDxniDf+aJpYsKjO
   Tapdj2IA5YQK4zgQc7PY8QZYFqUyfeTNteS+fauj3EY9qJAGQ8+XrSdGf
   vftUlv3cFNRwNML4dnYFyiJfnx4/ZNFD7ewYwfvJd8GT1h9nvOfDIrS9n
   ZdDTIt35mlwPtcSr+UKO9og1gOoh2xg6Af82Mjg0YvdB8y8V0+9AogSur
   Alp5BArx1+vMS9Tk12yY3ySVCsup2Ed9Ibq+HyF3XC9SkZBqmHFav6Sud
   B0TuAOLvNsG5/0WFeQQm1b9jL4y1llGzyZnB7I6ScnwF4GZM0pGKHOGLW
   Q==;
X-CSE-ConnectionGUID: VVOsoUBaQnSp2QFx7+kkfw==
X-CSE-MsgGUID: 70kvbI2VTyWNg9RTjP/6kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3324825"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3324825"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 00:08:07 -0800
X-CSE-ConnectionGUID: DC3T8hBDTWmzcnLyTX5R5Q==
X-CSE-MsgGUID: YTnOhEkWQnO099y+6Ki0lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10833011"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 00:08:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS8np-0000000158w-3Ofo;
	Sat, 14 Nov 2026 08:08:01 +0000
Date: Sat, 14 Nov 2026 16:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kvm@vger.kernel.org, Farrah Chen <farrah.chen@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:kvm-memprot-v4 26/54] ld.lld: error: call to
 __compiletime_assert_775 marked "dontcall-error": BUILD_BUG_ON failed:
 sizeof(attrs->attributes) != sizeof(unsigned long)
Message-ID: <202611141509.8iHcv46y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-memprot-v4
head:   e71c4e83c03926c300f6c43e79b783d47ba8b588
commit: fd506bfd91720a0465a26f9baf6d9ee57c81b847 [26/54] KVM: Introduce NR/NW/NX memory attributes
config: i386-randconfig-1003-20261113 (https://download.01.org/0day-ci/archive/20261114/202611141509.8iHcv46y-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141509.8iHcv46y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141509.8iHcv46y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_775 marked "dontcall-error": BUILD_BUG_ON failed: sizeof(attrs->attributes) != sizeof(unsigned long)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
