Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387A314A98;
	Sat,  3 Oct 2026 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040194; cv=none; b=lQbc+zfmToKiBgQsekzhLaT+PwxDgpo3AV5wOU8DDCdG84JRJSjSBtsVTrdkLgQTd2e0TIVsNNuq3F3A1reNwTq9KPiLEX/YEr8115aEWxhUQB60YYCEt14Oi1eP5QeaV4xHZrgSAXMJufbRjAf56G+jXXqjDYhldHIrEFSEudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040194; c=relaxed/simple;
	bh=uYXHK+fKqKvutq2GPp63Sxh/qAjjojEBUAYFvw9nJ9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IwfpxpMIT9m1hrx+Atf0YX4zIWhfrBrg+utLkwd/VaJCbt6t3NUEV9883+P9guSxV2OKzJhtf/8rjj8F4/gDEGbGYw5A6AVzBsUs3wuL6KoROlsUq9ZPS2/tz3WNzIra1rsGIQo4QK99wwe8EUVD06oyA1b/8CmGV/0Ka1Xd8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8DA6oVB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8DA6oVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791040192; x=1822576192;
  h=date:from:to:cc:subject:message-id;
  bh=uYXHK+fKqKvutq2GPp63Sxh/qAjjojEBUAYFvw9nJ9A=;
  b=d8DA6oVBjBuxqV/gLEyqOgUsk/y6UG7uUl7CrP4L491fNRUHo71OU0eg
   FyQbl5Aq8Kv1DAVWA8po6wW/V31x994GzG7DceFsvaz9MNcYc844ZYzcV
   DGOAKqeJlcvJgmqbSFcKseoRSzvlgB+YYEYrsHBIhnGizj5jXTi9GrE9i
   R0iL7xyIshJw090T7uJlCTol+UTXL2AmXSexSp89cu+qTCQ+SKZOjzRjC
   bG5usm+m7KQ+lQJvEw4Gqg4zlMnqBSbtrR5WaziHAwq0hJDtBkGjc/osy
   qtuT/sy5MF3qnKGrsl+PDfSeCAPVffkV/K5PKL8wkn/Vt8m8IFtC4FBXO
   g==;
X-CSE-ConnectionGUID: gRv4dEGORjSTcQKA7gR6SA==
X-CSE-MsgGUID: 7fgz8EwwTXaNhW87RM4wgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="103149766"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="103149766"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 08:09:52 -0700
X-CSE-ConnectionGUID: irQPxxwsQx2nfII5+/F0ig==
X-CSE-MsgGUID: 3Ir+RcZIRHG6YkYdaCPBeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="486266"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 08:09:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD1Mv-0000000014t-401E;
	Sat, 03 Oct 2026 15:09:45 +0000
Date: Sat, 03 Oct 2026 17:09:00 +0200
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [linux-next:master 13730/14185] warning: unused import:
 `Spec`
Message-ID: <202610031630.JOlyp48X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 9cb3f5d56e81fd97a82ef361b210bc2322daaaa7 [13730/14185] gpu: nova-core: add an interrupt delivery self-test
config: um-randconfig-2000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031630.JOlyp48X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031630.JOlyp48X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610031630.JOlyp48X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `Spec`
   --> drivers/gpu/nova-core/driver.rs:29:9
   |
   29 |         Spec, //
   |         ^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
