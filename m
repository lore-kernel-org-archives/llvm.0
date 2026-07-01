Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27F2236FD;
	Wed,  1 Jul 2026 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873699; cv=none; b=mM8yCcrwneOA6hjlkhcWiYM5PJBLOL4VbS+RaRtpYNmWLtEfFP4fk/rM1jZ0FOx4uYIdEsRqwq/Hh2bk8w/yGrCz9e0xtqdSp03kg5jNUtFsBitJIS5DYfRZ9ISivgI69petj+hhLue+kDk4E1+GwXPOMyuAy52D604tfiWztzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873699; c=relaxed/simple;
	bh=K3lmwN99umm6xyGRtOIhDIJBaSspR7DrFIzWq1BFvt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ePBv4E8n+t5P7yQ/l25qXO49fTmqB2ciXyzdyQmEm60cqpMTSxNBta8g17cFgVfl8mljfsqBF6HTQPg4yMCBmSBTsBV3ZW+h6k+wsFYGf2Q6fbLaeUXZnLwgH8kMDqy7RhP1IMP2T0sktWkSoDlwij4mOLVaEildf4XMh1pzbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnP8CTcW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnP8CTcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782873698; x=1814409698;
  h=date:from:to:cc:subject:message-id;
  bh=K3lmwN99umm6xyGRtOIhDIJBaSspR7DrFIzWq1BFvt4=;
  b=QnP8CTcWmB5YD2WHSgCsxp9I0fRP0GCn2IOQgnLxS68ZdR7XRJJh7BJ+
   N132bQQ61uibT9SFuE2ttPv5PMbApgSdEf7lPSOldH63cHpBn9VF/TLb7
   2+o57y8CRGWXpevDpr4InQbhviledLeKEcOxd+fI/+68UCuXaW10MYYYE
   ERgFwzbYNSTK2UOyjCBkejW5UVtdpeAyIQqDKmV0JutKW7gDL4AeEpKwc
   MDQfYyi7FSRUTIayKeSwg56sbiAP2ip3f6GD4iiwfA52psDvXq8C69guP
   1x5yKONqUWbGGb4gXSHrTjSOB39rcRjVfQGUNl8wJBoZDaklowavb3O7M
   A==;
X-CSE-ConnectionGUID: LZdSP63sSZGC7xjefXmeXQ==
X-CSE-MsgGUID: 1GSw/5hiThu/MN/1KfX7AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83653610"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83653610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 19:41:37 -0700
X-CSE-ConnectionGUID: krgT6GvnQVuFU0GOIEgwAQ==
X-CSE-MsgGUID: m65L0AtrRaGaVeRvN/yx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="256349789"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2026 19:41:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wektE-000000008sl-3tti;
	Wed, 01 Jul 2026 02:41:30 +0000
Date: Wed, 01 Jul 2026 10:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/diag-complete-off 5/5]
 arch/arm64/include/asm/sdei.h:57:9: warning: 'sdei_arch_get_entry_point'
 macro redefined
Message-ID: <202607011039.mqYn2MBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/diag-complete-off
head:   9c7998bb7f7765535361c4ac0087f1401b3eecd4
commit: 9c7998bb7f7765535361c4ac0087f1401b3eecd4 [5/5] arm64/sdei: DIAG complete-then-CPU_OFF for the SDEI stop (Grace re-online test)
config: arm64-randconfig-002-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011039.mqYn2MBk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011039.mqYn2MBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011039.mqYn2MBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:11:
   arch/arm64/include/asm/sdei.h:56:15: error: expected identifier or '('
      56 | unsigned long sdei_arch_get_entry_point(int conduit);
         |               ^
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   In file included from arch/arm64/kernel/smp.c:11:
   arch/arm64/include/asm/sdei.h:56:15: error: expected ')'
   include/linux/arm_sdei.h:16:45: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   arch/arm64/include/asm/sdei.h:56:15: note: to match this '('
   include/linux/arm_sdei.h:16:44: note: expanded from macro 'sdei_arch_get_entry_point'
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                 ^
   In file included from arch/arm64/kernel/smp.c:11:
>> arch/arm64/include/asm/sdei.h:57:9: warning: 'sdei_arch_get_entry_point' macro redefined [-Wmacro-redefined]
      57 | #define sdei_arch_get_entry_point(x)    sdei_arch_get_entry_point(x)
         |         ^
   include/linux/arm_sdei.h:16:9: note: previous definition is here
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |         ^
   1 warning and 2 errors generated.


vim +/sdei_arch_get_entry_point +57 arch/arm64/include/asm/sdei.h

9c7998bb7f7765 Kiryl Shutsemau (Meta  2026-06-30  44) 
f5df26961853d6 James Morse            2018-01-08  45  /*
f5df26961853d6 James Morse            2018-01-08  46   * The above entry point does the minimum to call C code. This function does
f5df26961853d6 James Morse            2018-01-08  47   * anything else, before calling the driver.
f5df26961853d6 James Morse            2018-01-08  48   */
f5df26961853d6 James Morse            2018-01-08  49  struct sdei_registered_event;
f5df26961853d6 James Morse            2018-01-08  50  asmlinkage unsigned long __sdei_handler(struct pt_regs *regs,
f5df26961853d6 James Morse            2018-01-08  51  					struct sdei_registered_event *arg);
f5df26961853d6 James Morse            2018-01-08  52  
d60b228fd19985 Mark Rutland           2021-06-07  53  unsigned long do_sdei_event(struct pt_regs *regs,
d60b228fd19985 Mark Rutland           2021-06-07  54  			    struct sdei_registered_event *arg);
d60b228fd19985 Mark Rutland           2021-06-07  55  
f5df26961853d6 James Morse            2018-01-08  56  unsigned long sdei_arch_get_entry_point(int conduit);
f5df26961853d6 James Morse            2018-01-08 @57  #define sdei_arch_get_entry_point(x)	sdei_arch_get_entry_point(x)
f5df26961853d6 James Morse            2018-01-08  58  

:::::: The code at line 57 was first introduced by commit
:::::: f5df26961853d6809d704cedcaf082c57f635a64 arm64: kernel: Add arch-specific SDEI entry code and CPU masking

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
