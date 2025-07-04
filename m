Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DA277007;
	Fri,  4 Jul 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613085; cv=none; b=O7LxZiNSQktYjm7WHARAsQhc67Vqe6iRt1jOax+aoIochakbFQ7hRiwoX7YbIsllxY0u8jjdxYNJZW1/IicvWY9lUaLPNk9VOsUEvpZohCYf1G4/crwSv6OY990qJ7KRrIQ+axy4oHoU4euvzpP9roOgkdLtKwRi/LGksABLSSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613085; c=relaxed/simple;
	bh=eY3yxetsfcAKTWev+VU+/alB84PZJgr/bSup/avdUOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REd/sEqk4t+XnA5tT49kkkaR/lRqkwgRDKaVlPGLXSazcWJHdlpJ+j00kEQzsASEm3dYs91q9argoDkRWxwmy7dN+fek+0ZCIcEc6cRdD2b69OczIzGGoZbjgCyT0nw5njFwfnOTxOMF19pvsVGOQ3H4MRhdbJZm1XBRwyl7hPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOGAgx2A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOGAgx2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751613084; x=1783149084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eY3yxetsfcAKTWev+VU+/alB84PZJgr/bSup/avdUOI=;
  b=dOGAgx2A9WF+aWJs1d1DyVSq2zPBFj3iMSLDcEV1eqAk1BaijkGT53FI
   kY4M4Z/A5cb4l7+8xPR/5EUUx/fAkY2o2fY2qcQpHjLTiBT5bJtuPe4Y5
   C6FGtM37CMuHRJolTIe1jnd/f9oCvejWQMMfR6gnxWr7770UkSdGVnMF/
   SsMBP/lZfMXdj0L9AntZg7sB5vqUV2WKDMKAUZtfs2x1tsPQq9Gto4zv9
   bwFC+L7H5py4SY8ympH4u080EezRlIq9EDM2XEmk12GKcjCcTuyuVzaMq
   y3NC78iKcg32W81X8jK3aEmWeUhkrGwGp0myPtM2qrOjKQLTUJD7wFikZ
   A==;
X-CSE-ConnectionGUID: MrklBSBlRRyrHZU4Y5wM4A==
X-CSE-MsgGUID: az72VBt4SN2irRs3f8Odeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79384088"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="79384088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:11:22 -0700
X-CSE-ConnectionGUID: IVDkeR18QE+cNvYaY52qBA==
X-CSE-MsgGUID: F3eZDpPASRqJM8biS/HOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="159124486"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 00:11:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXaZp-0003Qz-2R;
	Fri, 04 Jul 2025 07:11:17 +0000
Date: Fri, 4 Jul 2025 15:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/core 13/14] include/linux/unwind_deferred.h:57:27:
 error: assigning to 'union unwind_task_id' from incompatible type 'int'
Message-ID: <202507041545.j60uUWuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/core
head:   13e7688d3b4aaabfa3d6289071e136c98e8f31d1
commit: 4a9ffd6ce545f51b23f260e5697145d5da460dbb [13/14] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250704/202507041545.j60uUWuS-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041545.j60uUWuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041545.j60uUWuS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/signal.c:28:
   In file included from include/linux/entry-common.h:15:
>> include/linux/unwind_deferred.h:57:27: error: assigning to 'union unwind_task_id' from incompatible type 'int'
      57 |                 current->unwind_info.id = 0;
         |                                         ^ ~
   1 error generated.


vim +57 include/linux/unwind_deferred.h

11678a9b0f7328b Steven Rostedt 2025-06-30  43  
be1affc11bf5d06 Josh Poimboeuf 2025-06-30  44  static __always_inline void unwind_reset_info(void)
be1affc11bf5d06 Josh Poimboeuf 2025-06-30  45  {
d92af163548c2cf Steven Rostedt 2025-06-30  46  	struct unwind_task_info *info = &current->unwind_info;
d92af163548c2cf Steven Rostedt 2025-06-30  47  	unsigned long bits;
d92af163548c2cf Steven Rostedt 2025-06-30  48  
d92af163548c2cf Steven Rostedt 2025-06-30  49  	/* Was there any unwinding? */
d92af163548c2cf Steven Rostedt 2025-06-30  50  	if (unlikely(info->unwind_mask)) {
d92af163548c2cf Steven Rostedt 2025-06-30  51  		bits = info->unwind_mask;
d92af163548c2cf Steven Rostedt 2025-06-30  52  		do {
d92af163548c2cf Steven Rostedt 2025-06-30  53  			/* Is a task_work going to run again before going back */
d92af163548c2cf Steven Rostedt 2025-06-30  54  			if (bits & UNWIND_PENDING)
d92af163548c2cf Steven Rostedt 2025-06-30  55  				return;
d92af163548c2cf Steven Rostedt 2025-06-30  56  		} while (!try_cmpxchg(&info->unwind_mask, &bits, 0UL));
eba02b7e7ae52d4 Josh Poimboeuf 2025-06-30 @57  		current->unwind_info.id = 0;
ef627d7976da738 Steven Rostedt 2025-06-30  58  
d92af163548c2cf Steven Rostedt 2025-06-30  59  		if (unlikely(info->cache))
d92af163548c2cf Steven Rostedt 2025-06-30  60  			info->cache->nr_entries = 0;
be1affc11bf5d06 Josh Poimboeuf 2025-06-30  61  	}
ef627d7976da738 Steven Rostedt 2025-06-30  62  }
be1affc11bf5d06 Josh Poimboeuf 2025-06-30  63  

:::::: The code at line 57 was first introduced by commit
:::::: eba02b7e7ae52d4b6cda51156ae3d181bd781d56 unwind_user/deferred: Add deferred unwinding interface

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
