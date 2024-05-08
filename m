Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB47BB1B;
	Wed,  8 May 2024 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715164291; cv=none; b=F0oW3oOl10lsT8m7ZkqmmCLcYSi+DxPzIOLlFZJgqPMxszhrUzR9L/h53NQ5Fcdnzn3m96eYJDaASJDJMoVsU2GmzTzCHrod0Imuzn9zrHKx3ZQR7YM8iTdJGZHpqnPbBwsRj/npSneTDSjAZhFszahLCaFKW13jPXjIOt0Ks3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715164291; c=relaxed/simple;
	bh=99x4ehDiM/UptmsMYH4fmYqhiYX5aGpK6IVmIXXtvNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBthhxQvlAqBpq35/sH/R2GXHEPDVs731uQSbB78dKgjK9RXOMldA43G2PDQScIDMTiPRPeymZeg//zU6iugN0R2/VHMSUdsW1EU9N+HUpzEtUt2pQrW9N3+8KZGV2eb6Xlx9JgEpUOdvU7SnTNP9lbovmmRnHtOkHF+b7cduNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZU9FTS6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZU9FTS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715164290; x=1746700290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99x4ehDiM/UptmsMYH4fmYqhiYX5aGpK6IVmIXXtvNc=;
  b=HZU9FTS6ztF5g0B3EoP8cHQmYQNtza8roLLxpEbKH0Jofl9QEEm428Ub
   IF7p3AhZuebFKA2Spd8leOGxPfD3eCQMkNhN4ZvEAyUbX04E0jTQ5RzQr
   FB72YpOYhGmJo/IB96czc8SPMiP1usM1K0mgvwLkl+zREfhRDrKssUZ5i
   U7106wapXkeeoZPp8KgiDzZcZNsXV8EkNlEjCz6wZGtaQE8OVFqQM5BQx
   4XX9QXdFW1d+/shW7Hso71llC6Bv5x8FQ13MX0/JTa93WeNObQv9bZD2i
   tTTpt37COorwan/5awtenm1Cze3GuWypk8qQQs+1k48AzpNZMaaEWj0kb
   Q==;
X-CSE-ConnectionGUID: CURItEatQbWfj8WOnFxylw==
X-CSE-MsgGUID: sKfmtEMKQ8m0CJiMnpqJfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28490840"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28490840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:31:25 -0700
X-CSE-ConnectionGUID: f5RUhJmLTvuvNf0WbMz7pw==
X-CSE-MsgGUID: xxTq3UzmQ1GIsxk5tIjOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28901443"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2024 03:31:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4eZz-0003Hq-1i;
	Wed, 08 May 2024 10:31:19 +0000
Date: Wed, 8 May 2024 18:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <apais@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kees Cook <keescook@chromium.org>,
	Vijay Nag <nagvijay@microsoft.com>
Subject: [linux-next:master 11772/12060] fs/coredump.c:67:27: warning: unused
 variable 'core_file_note_size_min'
Message-ID: <202405081838.tuETPvPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 13513eafc3ea08cdb70aebe56a7e43083302a809 [11772/12060] fs/coredump: Enable dynamic configuration of max file note size
config: i386-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081838.tuETPvPf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/coredump.c:67:27: warning: unused variable 'core_file_note_size_min' [-Wunused-const-variable]
      67 | static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/coredump.c:68:27: warning: unused variable 'core_file_note_size_max' [-Wunused-const-variable]
      68 | static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/core_file_note_size_min +67 fs/coredump.c

    62	
    63	static int core_uses_pid;
    64	static unsigned int core_pipe_limit;
    65	static char core_pattern[CORENAME_MAX_SIZE] = "core";
    66	static int core_name_size = CORENAME_MAX_SIZE;
  > 67	static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
    68	static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
    69	unsigned int core_file_note_size_limit = CORE_FILE_NOTE_SIZE_DEFAULT;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
