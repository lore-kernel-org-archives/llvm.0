Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC931343D8A;
	Wed, 22 Oct 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136611; cv=none; b=auQ9F2Ol/CS8z1omHLdKUjYT6gIpzkn/OJFj/Qku8Y+gjiv7yedxoiibfkGeuKOgdRTzo4zu/M5T4x+KkevTwJ2r4aubC995PGyUGFwvx/2K/Fo+qmQRsMUC1VtIBM2cKHuxxnBbPf1zrJsL29o1/zpBM7o4kPs03y+EltVnowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136611; c=relaxed/simple;
	bh=lWAYWlWKVYJcd89Q3ana/T5XxnhlHl7uQSVm27Ijyvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjoYCFVN8U6Y/5WAdM4w9EjHn7diPJK14pk5CAPjJakS5z2rNUnKllU+ruSEmC6q+TZf/sYK7ArJ4SFsRzukJiY5hQwcqrqwjpFD2QhfgoRbOFhCMcE1cA6XNPHk2UANhY2cKbmR/lrJ17cVXMGnrfkwfp8Ov84jfGc6nwNDqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOD+F1uw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOD+F1uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761136609; x=1792672609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lWAYWlWKVYJcd89Q3ana/T5XxnhlHl7uQSVm27Ijyvk=;
  b=IOD+F1uwZ1W5YLVBZRNerhHlFGuD/lq0bAUSXNSA8E2FQO5cfFEGoLqQ
   ghO9xzgaV/Qkp8w+fYa3YJbWQHNG12e0yasSgIgVSn6+GzZBxZYomSiTc
   OhmOJesK7toewZtWz7DZlrQz1/t/agId9f/TxEfxSDI/c78Cj2dqKaGAP
   HikS8wgEf0AnkYwy2e/5qVBKVhWBxuu8zbliPE2glidxbygLV3bvQWMYk
   GC5zJPLydzaXsLc4YyoUbwrwaPRSqGW4oSazLL+uAVcy1gPUkuI+gKIfu
   ENgdWa1/qbLgBNbXs8tco0O4iByI+/M/BVhk1++ScpzZS9AOLM3VrctHp
   g==;
X-CSE-ConnectionGUID: Rxu2NyE/RU6q0x1d8KWqvw==
X-CSE-MsgGUID: aacrc9X7Tzug3kKGeIxdHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67118834"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67118834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 05:36:49 -0700
X-CSE-ConnectionGUID: ITRkvqKVQpmu49FkVzCmhQ==
X-CSE-MsgGUID: OM+FeeoJRAOpRhMrbC0PMA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 05:36:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBY4v-000CML-1T;
	Wed, 22 Oct 2025 12:36:42 +0000
Date: Wed, 22 Oct 2025 20:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fuse: check if system-wide io_uring is enabled
Message-ID: <202510222000.BcMVuDeq-lkp@intel.com>
References: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 6548d364a3e850326831799d7e3ea2d7bb97ba08]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-check-if-system-wide-io_uring-is-enabled/20251022-043238
base:   6548d364a3e850326831799d7e3ea2d7bb97ba08
patch link:    https://lore.kernel.org/r/20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f%40ddn.com
patch subject: [PATCH RFC] fuse: check if system-wide io_uring is enabled
config: i386-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222000.BcMVuDeq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222000.BcMVuDeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222000.BcMVuDeq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_uring_allowed
   >>> referenced by inode.c:1970 (fs/fuse/inode.c:1970)
   >>>               fs/fuse/inode.o:(check_system_io_uring) in archive vmlinux.a
   >>> referenced by inode.c:1971 (fs/fuse/inode.c:1971)
   >>>               fs/fuse/inode.o:(check_system_io_uring) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
