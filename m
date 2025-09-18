Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F23594E;
	Thu, 18 Sep 2025 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198845; cv=none; b=thXNZUwGW3VyzOZ0JnI4SEgbnhG8xwVU6iXX9mqtSQSVPeAhPJIoSCap3FMB20Ia/BM1U5e+QJUGuMJRIOoH2jBdA8DlUWjUwCb1jELyA0jGTb5a41DoLCWk4WUMnwACgE9VzjuvuRmpoj9DZ4Jy6TLYQuvE4UIJaMTKX9eZn10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198845; c=relaxed/simple;
	bh=Z+r6WSdvHiiHIz+ipQaP0pWNJd6Ar353hn+O5G93Vo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCzsbox5xO7Qpgtp4HcvoLTF0OF1PvAqqjtFhj/9xBfsOfHOct9wx6c965xqn6mIsVg9NDiVOrPTd1TlvLDGJvDTr0xXqmY+nBWvr9lB9ifoBklux0h8x34Rm9Oztnwfc7jGB7QFSb2kcCLL9wNDlezwKw6W/it+z0kuOKEci5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfoCbkDB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfoCbkDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758198844; x=1789734844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+r6WSdvHiiHIz+ipQaP0pWNJd6Ar353hn+O5G93Vo8=;
  b=JfoCbkDBsCbJIjZBbg/je9yp+Ipr/gSkAa+c+8PYH5DfoJLCcyfrGPnA
   0WSyKxksOM3kEvhVnMYSi3u4NM2GZtGg/seKyZav1fVJoOxkQmy218wf0
   leNjbgVWBdibE7Jrj7HxWKuR/0ejMZ9Tdk4+bpyVKi9y+A5Gm1TQj/oeV
   OcdApDICMo2i9f5ICWDnRayJUrbKXNsjQ/Nu5LrW0V1GLMuPkcAymbyHI
   o2ms9geqNPd6xUSoLwR2VXAKbKHceGcPDwGQjjZnmr6SdwZf0q9akxoRJ
   OTCEuS9nJbfBAs1b9G0clpPuYBh6VuScYUj6ZuERq+vzo34qdJ5gjlHOk
   Q==;
X-CSE-ConnectionGUID: obd17h0nR4+Q1L+3dwbZnA==
X-CSE-MsgGUID: 9yntFmduQlK6hWYEuWdOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60579818"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60579818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 05:34:03 -0700
X-CSE-ConnectionGUID: fKVExUC9Td+zUS79ixcQlA==
X-CSE-MsgGUID: yr5FUvoQTJG0RAn7kYEaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="199242174"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2025 05:34:02 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzDpn-0003Fr-1Z;
	Thu, 18 Sep 2025 12:33:59 +0000
Date: Thu, 18 Sep 2025 20:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 31/40] ld.lld: error: undefined symbol:
 nfsd_handle_dir_event
Message-ID: <202509182056.jDfYfxex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   9203f63adecf21842e48ba81b3ca75620e601cd2
commit: 27d0531d630459c614079868ceab3d817dedd289 [31/40] nfsd: add notification handlers for dir events
config: powerpc-randconfig-003-20250918 (https://download.01.org/0day-ci/archive/20250918/202509182056.jDfYfxex-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509182056.jDfYfxex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509182056.jDfYfxex-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfsd_handle_dir_event
   >>> referenced by filecache.c
   >>>               fs/nfsd/filecache.o:(nfsd_dir_fsnotify_handle_event) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
