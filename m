Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592C27735;
	Fri,  7 Feb 2025 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738890644; cv=none; b=CJ78DORU71oGj2KtgT0UwzB18Pnhto6KxnNlTj8ZXzU1rJ+yt+uLQx14aVKju3xkjLi2BccHrXnf7bOMvQUWlxBjG2w8Ym1rRD81NzUS1e1m3NVBNPEKSDjlXR5qKVYqLvHA66iioCFz5DHmv16dSJfb3q5KqTNcUfuci5OyH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738890644; c=relaxed/simple;
	bh=+hZIOJ1PFjNthpNb8LL005lZID2bin3CpT+brtYUjQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciMcPEPaaghXoUh0aU6BLC+G1NgEQw/In10M+UKtY+/qpw4EIT+vMjBLFfq9QS+MOBbKnlLNwGtetu7iGmN9fXYmnzE911LLJNBILG/9xOolRzRcd4NLAf2H1S/NH76IvAL11eXmsjFJf+6ZEvPxvQlq0o6zGO+1S48DWCoeLs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etFr/elM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etFr/elM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738890642; x=1770426642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hZIOJ1PFjNthpNb8LL005lZID2bin3CpT+brtYUjQ0=;
  b=etFr/elMiFc/aPVqo4GIz4D+sJl7DV6Dq4JQBX16pl9bJRvxlyKXScr/
   n4ShCzXLBJRM0XVveDwTr+k1mlVrqUhg1T5WDUn2jUFh39YVFi08FDRLL
   RU3IR4+AcKBbWT8eT/D6UEfpA3DkNQ/Sgitbrg12CbRHDPhGEJNjiS+dQ
   ErBQbXnnmuEiFF5E64m0Weg17uMWAoy95qTOodHzw4VbsKTGAm+atrCE2
   GjKKUa+m4rPzBq3BKcKwklUZhc6IcVeT1GeyV4ywB/vifhAOn/rEKUOgN
   QXq6oGgTEiVVn87p1ODRLlD7sOfGZ4BgWWfPds/9pQ8FFfB+hdqr1Of/o
   Q==;
X-CSE-ConnectionGUID: wD5JU0N7TsqOVX4YiJwLnw==
X-CSE-MsgGUID: VaogAneBSmyPBdmXg1xcig==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50956285"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50956285"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 17:10:40 -0800
X-CSE-ConnectionGUID: pvVo+ej2SyuroE7KEtsQlw==
X-CSE-MsgGUID: cG5x6DqaSLCi9I9D5HWZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111348683"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2025 17:10:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgCtA-000xaZ-0Y;
	Fri, 07 Feb 2025 01:10:36 +0000
Date: Fri, 7 Feb 2025 09:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/fineibt-bhi 11/11] vmlinux.o: warning: objtool:
 emit_cfi+0xb3: relocation to !ENDBR: __bhi_args+0x40
Message-ID: <202502070953.VBrjrELX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi
head:   b3504017bcc2bd5b56acc9c799ed5054dd78c8b6
commit: b3504017bcc2bd5b56acc9c799ed5054dd78c8b6 [11/11] x86/fineibt: Add FineIBT+BHI mitigation
config: x86_64-buildonly-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070953.VBrjrELX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070953.VBrjrELX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070953.VBrjrELX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: emit_cfi+0xb3: relocation to !ENDBR: __bhi_args+0x40

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
