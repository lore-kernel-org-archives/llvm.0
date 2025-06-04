Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C292320F;
	Wed,  4 Jun 2025 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063146; cv=none; b=tzrA/yiNKVjHlw43n8iVWsQmsOhkAewu1xspSGyyCZRV/67cn20wRe4XrrYW5tSBPCuyY4UOQY4O8XJIBt74BeOHWXNF+INC/0azCEp7AG0KWuHV1gUc4b3yhueNFq0zKggPxgXf2JqQ8G/B/2Q5qIzddGrIplF54OQRDMszEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063146; c=relaxed/simple;
	bh=PwvRmutBm70uGqG+BnbYZUZjJt2L2jy0XdKtFjuorMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1EYFJePFGR6AL2LaPgbHg6G0iUSyWi8C0Lhmv21QQzVaBI9FLeA80fCUl5jdHy74OWYPfnej38cL3KVPRwXERlVhkpWU6Gg3WRuYiaAFd9rs1yJiF7bP4e5rGy2zz2Fqxtgv71mNDWh0Nt+3eOEBybeAXFrka/GBM7nEizxYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTTpVBIn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTTpVBIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749063145; x=1780599145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwvRmutBm70uGqG+BnbYZUZjJt2L2jy0XdKtFjuorMc=;
  b=mTTpVBIn/y2RF3VXuBQFURnKEyLxmmbXCl2BkwYXpmmDOeHsvebxFFq2
   W3IJySwW0gA8KMvRZ12bsQQTYH/laUsuOHPP2+ypVXOEoKIVEKip6atvZ
   RddIBmvLXK3Z3oaQgAXWSk1C/kztEP1Sn3KK7vUPTyyVLNgLXhL95C3d9
   2IuPpIemSFnYTeI/PWOFy8sjxFTf3UO+5fyRlvxn+VEy38NRzDQVYm+UX
   9EjVPoYuZk+MpAZ6ZYd8CuIRkohbV7QcAqCUW0G+sgq5HiKuyEMyxX1uq
   XWWCvThxB9uooso0SKq4L8dDqxfWJblwucKByauL0T+8Voj1ioaWoYsPA
   g==;
X-CSE-ConnectionGUID: KvxBET9gQD+88MaEpI+eEA==
X-CSE-MsgGUID: 2ekhGec9THSOGYXhWqjK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61833666"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="61833666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 11:52:24 -0700
X-CSE-ConnectionGUID: rwaI1SBQSxOKt+dC7zVirw==
X-CSE-MsgGUID: LM+OYUUVRKefjf1lO5XgNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145168484"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2025 11:52:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMtDp-0003Ob-0W;
	Wed, 04 Jun 2025 18:52:21 +0000
Date: Thu, 5 Jun 2025 02:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14008/14339] ld.lld: error: undefined symbol:
 utf8_casefold
Message-ID: <202506050235.2X7f2Xqe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   911483b25612c8bc32a706ba940738cc43299496
commit: 83af16a78d190b1a698f0acf47402dc6c76e4991 [14008/14339] bcachefs: Redo bch2_dirent_init_name()
config: hexagon-randconfig-002-20250604 (https://download.01.org/0day-ci/archive/20250605/202506050235.2X7f2Xqe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050235.2X7f2Xqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050235.2X7f2Xqe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: utf8_casefold
   >>> referenced by dirent.c:265 (fs/bcachefs/dirent.c:265)
   >>>               fs/bcachefs/dirent.o:(bch2_dirent_init_name) in archive vmlinux.a
   >>> referenced by dirent.c:265 (fs/bcachefs/dirent.c:265)
   >>>               fs/bcachefs/dirent.o:(bch2_dirent_init_name) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
