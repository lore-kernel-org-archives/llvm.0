Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CF3CB907;
	Thu, 11 Jun 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177095; cv=none; b=KijOPeGNtbG5VJKKbI52HtgC1SyYWO6/Ci4Qq8Lmz61ec3IRC8iCFiRvfQQJZpE9l18RYFeCzFCd8kmrRqT0LxTQtLIBbtodfTxPR3BO83wQzMVwsHGbj6fVfNZ3MRx36e5xxiJ9I3KxTAD9Gl3c7kDEVXT/6I+drYz5wOfuA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177095; c=relaxed/simple;
	bh=wELHcPivu6R8tvSackQYHrhZdEO2ujYQ4CfSBrF41lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRQqQL8/OOGaGjMh8L70AKeNHDB9q4Muc16XBbE+W6Y1ER3mjLlIrxgAIwFhZXu31KtYtON6E5GiRrXW3ewCQHFm08BWP7CpyOEh3rGmXcIZS/JeP798HoPjUWXltMe0kKagS0Ue80DbVjhIJucCmEh9YQutZ3t7BhiEf6ejxo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKeihSY9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKeihSY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781177093; x=1812713093;
  h=date:from:to:cc:subject:message-id;
  bh=wELHcPivu6R8tvSackQYHrhZdEO2ujYQ4CfSBrF41lo=;
  b=IKeihSY99nYqbwZ7eTIovkDn/lEWP3rUMvbrLWAwNU+G3UoezCL0Eibs
   fpxgE0CDoKu/ZcPVokRooVKJb4nyH5FR1gFWFQjdcok9EwdSggPDSFt8S
   docJ+8rn2n3V8UJqw8kf9F1urlQXZhKQz3PNwEU0A1PneEdd7c8+uWPtw
   7trD3nMOBd11LOndWeyUFHv4jNvzd6K6avEQ7vcyEPTgAjPf7sS3Rtpr7
   1zOqPGIrtb+NdN5LhO4U3sy8HwNEM1hqR0h1IxtKBnzf2ilXYjcAxH7O2
   tlixrRmUl3IjVYQJf6hA3xy5GE2cwGsZhNtKdB0VzPyEIFBYBuqjpHWu5
   g==;
X-CSE-ConnectionGUID: S6lwCn+iR0GmmB5yMytQSQ==
X-CSE-MsgGUID: b0LJYtzxR52H0t2ezraC2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81894726"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81894726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:24:52 -0700
X-CSE-ConnectionGUID: mE5RSBOFQmSaSgJSo9x5wA==
X-CSE-MsgGUID: WTpz0XmuQtG4uKiSF1P2xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250373939"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 04:24:51 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXdWi-00000000409-31uq;
	Thu, 11 Jun 2026 11:24:48 +0000
Date: Thu, 11 Jun 2026 13:24:44 +0200
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 33/36] Warning:
 kernel/futex/core.c:366 function parameter 'fph_p' not described in
 '__futex_hash'
Message-ID: <202606111349.EFE5CORt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   197a675f0715567d02c00050d87d9b1bfc8e790e
commit: 498cfcdb70aaaa6be16b367758dc8f785b00cf1f [33/36] futex: Optimize futex hash bucket access patterns
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260611/202606111349.EFE5CORt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111349.EFE5CORt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111349.EFE5CORt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/futex/core.c:366 function parameter 'fph_p' not described in '__futex_hash'
>> Warning: kernel/futex/core.c:366 function parameter 'fph_p' not described in '__futex_hash'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
