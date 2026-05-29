Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE43C454F;
	Fri, 29 May 2026 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051418; cv=none; b=OUKwVC4jjPbtua1Ho2IWyQwTO/45GIzPIqo3lxCbLM3nSzysCvNIzkiB3r99y625dns9OsqQQertq7h1hFxCoxAdib9mtU3/qllUU0JoLone5DCD5D9bq5h+kETJiYPHXJrWiXCl3n2V+x3Vo9t/gMdqaKT07bbHeIX8xUiO7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051418; c=relaxed/simple;
	bh=jKN3eR3S0BY3yqi2tYlxbPdwOaY5++/1gml1mNrPYWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ByYYfHg5c4rlq1pYJ46Xoft0AKI7s3eYW6nePRYlI7VAHGAOuWjaHie0tQaz1qFznKxVUvc5Wn6OpDyjztILo3aAscTVv73NjcvePZtndr87waZBgHMfWGFbWownhpfv/CSsuMJ/IsRJoSYGP0RJJl9q6fBTxtyUB+nrnwr8IHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j428Bmwm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j428Bmwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780051417; x=1811587417;
  h=date:from:to:cc:subject:message-id;
  bh=jKN3eR3S0BY3yqi2tYlxbPdwOaY5++/1gml1mNrPYWg=;
  b=j428Bmwmh+eKt5B0vcDy6g4Z9H/h8P9rec5heb6nTtEdxtWles300YCg
   2c9enfnqchx1J9ptP6AAZorkZR/NMfhsSUJXDvGibqgieXMnraTnH9avG
   b2ohisVOeYWs0mH0FijUTze0rZk7NAlC+F9qLa3qPQ4A3eC1G2Jj6mYr/
   Zbkq0vHEwV0pcr2a8DPh6mtGl+eYdQCQqLxPxGpwj3QImo8MgHK61xoqe
   43XhkNThM/vUcwoVt44OPGUyAG5GRSgfpKyKtkTFEoj3G8hl5LUIZJLBx
   tNBLp/UauhGPrUrXbX7U4mI1l3/ZP+MuG3Ud3LMPll9oRTfG2wvjXApgF
   A==;
X-CSE-ConnectionGUID: grSoBv4SSpSG9SxGEx8aZQ==
X-CSE-MsgGUID: WRfbjQI8SYKQ9rPSTHtZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="79936079"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="79936079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 03:43:36 -0700
X-CSE-ConnectionGUID: GKIA6dvbSBCwOK2JQb3sIg==
X-CSE-MsgGUID: 3LDtOa6USwGXWqYmLgWvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="266442006"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 May 2026 03:43:34 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSuge-000000000rF-1u7G;
	Fri, 29 May 2026 10:43:32 +0000
Date: Fri, 29 May 2026 12:43:00 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/ata/libata-eh.c:979 function parameter 'ap'
 not described in 'ata_qc_schedule_eh'
Message-ID: <202605291249.xESrLBQY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/ata-libata-Fix-ata_exec_internal/20260522-024512
head:   ca9420d376532f757f27a9e97c6ec88d83982c88
commit: 1201139e9ddd1c78e2b474b8004c611cd713b77b ata: libata: Pass the ATA port argument directly to ata_qc_schedule_eh()
date:   8 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260529/202605291249.xESrLBQY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291249.xESrLBQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291249.xESrLBQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ata/libata-eh.c:979 function parameter 'ap' not described in 'ata_qc_schedule_eh'
>> Warning: drivers/ata/libata-eh.c:979 function parameter 'ap' not described in 'ata_qc_schedule_eh'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
