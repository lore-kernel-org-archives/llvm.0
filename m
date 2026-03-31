Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8863126DF;
	Tue, 31 Mar 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970209; cv=none; b=YWjaX7xj7+QxvDf552z7E3hIjxYBhAf1uvXgtManbSIbtZCP4hlyyfsYnhrDHvxSuFyQ4CZ+TS6+JceNmE6GhGmK9xBcnXjWTNQbyHtMv2RqlHk4yR/IfvHWSM0vD+nuqLD/AKkFJiBt/ZB2iuzDJBfxiHjuRonletGkGXCDzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970209; c=relaxed/simple;
	bh=6qHuOb00UYYavoAvTefDQJglxQpHy+V4W6uGj9Bn9MY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VRn8zSeCoP1c5v8O00VvjmFPPgYMrmJG+hVIuCRi3dI/rLjYQ+98UsfCVf3Rg5LNYQYZo4GTLCUsX/CyUKnqPzUWq7uHPT/U6HkaJv7YBL2gMb2/dSvqGoz1/EPGFsgj0Oe44G+H+4Hyqnz3Ox7wJsBTMvsF8IODAZuOeH+TSOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjxwiWpX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjxwiWpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774970208; x=1806506208;
  h=date:from:to:cc:subject:message-id;
  bh=6qHuOb00UYYavoAvTefDQJglxQpHy+V4W6uGj9Bn9MY=;
  b=mjxwiWpX2nkXaofQIwAeoi2qf5ckE0pkcXAwTuLeGfE6J3lJvQ6PIadR
   Mx1jZFeyTW++/zRWRFcG3f6sFhU2e78vQVYukFr+ycDDzLiSav0RtdE4m
   eme43pEeY3ietjTbOPqehaLz1ti9Kc8TfJaFOScfBAL0lYDX2X87YylU+
   Df6RAjZQfiN1J9s1Xe4M9oXVCFWC0VXRRmldHnRd+kvBpoRce0sKtlvMi
   +3hdQ+xyIp7XIu3/t+kpGLXVFoESFJe3BYKGaEXyCuJ6/2lQL9xiqoLH3
   8cAPLim2CiL9UI2GMPkvXdwXCYBKneOp+u6uy+rYK06mejgZorwYuBD21
   w==;
X-CSE-ConnectionGUID: 4dwtvxn9RL6BYuR000wDbw==
X-CSE-MsgGUID: FpGw1VsOSDOnpmnC1a0s1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93567958"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93567958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:16:45 -0700
X-CSE-ConnectionGUID: UuBkQgA6TfmPevizNNF0xw==
X-CSE-MsgGUID: 1rh0wZV9Q+yI7U4m1tzHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="231215325"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2026 08:16:44 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7apd-000000002nr-2MRb;
	Tue, 31 Mar 2026 15:16:41 +0000
Date: Tue, 31 Mar 2026 23:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 15/26] Warning: fs/nfsd/nfs4xdr.c:4139
 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
Message-ID: <202603312331.W6o1NiUs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   23dab10e6368fed23984781ef9a247fc242498da
commit: 17ead909b8fe2314cec2ea3ffe9ccc2492c9c3c9 [15/26] nfsd: add notification handlers for dir events
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260331/202603312331.W6o1NiUs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312331.W6o1NiUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312331.W6o1NiUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/nfsd/nfs4xdr.c:4139 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4139 function parameter 'nf' not described in 'nfsd4_encode_notify_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
