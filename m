Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7B15D0;
	Sat, 20 Jan 2024 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705792020; cv=none; b=PP5wvAm/C9draxzw1zGawZ+4P8hz39vyYd6Wc+hXVP6sqS2djRp6rRmMkqxs011FGPuu0GL3TeMgNt4c2oChcc5FYTiFiHsz7xT7o1KQuhtsZvzsCOLVVzuV3dihXFNllpJhqFLfdo+r2lS1zQ8s4oJejrMqQtOw+mIUaMrq9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705792020; c=relaxed/simple;
	bh=FIffYk9sa68t5G/4A5HLuDXyl9Vz0IsgTNW5aNzt8zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VLAGnzHUWbyG2axDenX5yeHRjVLPju8LRVAlm4JjuSS93Xgrl0qnjFuHAKFQ9F/4MtIHloEsuLRt/jUhHkOb2KaB/AvI09anGbJ4g7ZpgYkgpG5CPcf+ja7CZA4k/TYkq8jM4e3TldPtwuNG1iabcvcXJkfJlOi0Yp6sR1VZ5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3LvJJ/0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3LvJJ/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705792019; x=1737328019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIffYk9sa68t5G/4A5HLuDXyl9Vz0IsgTNW5aNzt8zU=;
  b=c3LvJJ/0dBrI7iQuF7SneZmF/KEoDQlfNqaDYmsosByyFXu90uZuJVYe
   F3FkKrwncoEWwGDLV3j4TMLJ5hG5bPLCEstdY5Lhth567Xyn7e++bg5Se
   iGLXkwtwsb/Vm8F9bDN3ZcCNaf87cKYmA2GhPcOimZstEVtdOQtmzBjUn
   vyubP63ZKifGrAM8LrWe7jVltJER9YCEOMn9gNUaE9QcnkR6zWsjy1n6K
   acyZxN2CmLx6OpALV4JeLGMaVVtLghwAAmXaS20OPPk7G0sQI/gNfMt4z
   MP1IIpXl+5rin+jBcnQwmVXitTJU98mKql5NW68HR9oCxUsyhGVm0gevG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="14324669"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="14324669"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 15:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="904482220"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="904482220"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 15:06:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRKQQ-0005Vu-0Y;
	Sat, 20 Jan 2024 23:06:54 +0000
Date: Sun, 21 Jan 2024 07:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/wrap-around 38/77] zip.c:137:39: error:
 implicit declaration of function 'add_would_overflow'
Message-ID: <202401210731.R4MSUstb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/wrap-around
head:   e89bc1e50a4aea7c77987a344e7917eb41d290eb
commit: d35d22196bde30e00d2b8b7b4e404d1526651659 [38/77] libbpf: Refactor intentional wrap-around test
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240121/202401210731.R4MSUstb-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210731.R4MSUstb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210731.R4MSUstb-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> zip.c:137:39: error: implicit declaration of function 'add_would_overflow' [-Werror,-Wimplicit-function-declaration]
     137 |         if (offset + size > archive->size || add_would_overflow(offset, size))
         |                                              ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:105: tools/bpf/resolve_btfids/libbpf/staticobjs/zip.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile:157: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
   make[4]: *** [Makefile:63: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2
   make[2]: *** [Makefile:1351: tools/bpf/resolve_btfids] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
