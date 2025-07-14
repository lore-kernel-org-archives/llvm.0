Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210821F94A;
	Mon, 14 Jul 2025 02:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752459835; cv=none; b=jLnCNIvPWDVNUTVPVL+MiWW2rtggvDLCRyd0ot19tBegHZDiTB7+KBxr/a8Sysp4btsMHc1HgOxRhDiYZAYK7skWih+4xXSW9lrxXyUdva2IY6n0Kj5oOo0JoSlFis0X0h1gI0oqJeAgJyzNgl9Wamlb2X/UF1UPXg9El+epjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752459835; c=relaxed/simple;
	bh=ZdAeucEzEpMwe5xXJT4rrYeh6RvxrWnHaDlmCUDQqHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMahL9V/Vev5QyMmkClJpnNNR9CWWwaj+qShmWMDKzuq0ofN5TJi6eaalU20fQNLgIUNsL4OOYSLoGF8hsEcyrn4hCyt611Hvw6p3U72TZryARxQjK4WXbPYByJ189tesHg/O8AGINNSOTluTnKtLHCYfTCbImUK8KP87TD66bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTnKEjLU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTnKEjLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752459834; x=1783995834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdAeucEzEpMwe5xXJT4rrYeh6RvxrWnHaDlmCUDQqHk=;
  b=eTnKEjLUdNzNZz2k8thyFpqcurdx6s6KDQVYhd5P/qbrG2Yy1znqOKQk
   Bo67cCN+31qKfYmXDzX3UPCD6fLJsBByMBDuyqIcwbtcfsITEdTMgTEvd
   SGRtxovDknjd9EJ1JB+KvkilMvudVB/jSFDMF8escC929WKzeewIyt+un
   bX7IfzDhxpUo5o9LiyX5SmuY3t/rA9MW0iB8NSlzpJ5LZhZrgJqDDWz39
   4edi+D7AZj0aeXSPN01eaWDcB6GVptgecvqY9sv4a4BagEVVgcPOfFFo+
   jqPsYRh3EnQnbelRKGg4aw9H7NzfPeQo6JrmGWNHMVsn4hZld49Cg7HnG
   A==;
X-CSE-ConnectionGUID: k5iyWGxfS/eqeArZ1fBrrQ==
X-CSE-MsgGUID: OnpQk+8qRS6bz7wtnk6XPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54775614"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54775614"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 19:23:54 -0700
X-CSE-ConnectionGUID: Q4vvQaDzSxemtgjN9wsYmg==
X-CSE-MsgGUID: 8r4CZusMSiqOXVw/+Taleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156917618"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jul 2025 19:23:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub8r8-0008Qh-0X;
	Mon, 14 Jul 2025 02:23:50 +0000
Date: Mon, 14 Jul 2025 10:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [linux-next:master 7655/9053] ERROR: modpost: "poly1305_blocks_neon"
 [lib/crypto/arm/poly1305-arm.ko] undefined!
Message-ID: <202507141028.RRqiNRMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: 16f9e0cc99ec320a806fd2c80e2a83ed4c269ddc [7655/9053] lib/crypto: arm/poly1305: Remove unneeded empty weak function
config: arm-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507141028.RRqiNRMz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141028.RRqiNRMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507141028.RRqiNRMz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "poly1305_blocks_neon" [lib/crypto/arm/poly1305-arm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
