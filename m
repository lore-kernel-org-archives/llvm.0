Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873363;
	b=evrYxNsye2HnBkJeUVhD8ewwfXMSyDWDcbIuy8O1qjAba6uatai4kNB+iX6U3h0Y6TPY
	 lnVQO5sh0iT4VLKmfADjenn7MEph7Ghc31RJ/PgWaYrM+Yht20UbNcJ7iTqxRLjDSdIA3
	 w4i52E/l4Ed4XlfDjodzvIS2VA+UGrZh0amI4ul1BuQ0ywcgfI2UoOqZeTW7q/4ukV8JC
	 jbfGqYCT2zL8p9uJK13Q+TMPgaucNKgmDKwYygr6oSvryjjYfjMvqdvXE/j0NY/G6Fns5
	 j01j/Qvfr0d1BS85NsieaKazhbCnrcu8AGffVjDKJdlrjPTwUxeOJwOvwrbokXwLqPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873363;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mDiFquHUu2lPxd3FyR/GA1qEJBi3eS/rbjyurjMdtuA=;
	b=dUu2icuXycgj4LrTAi9oX5/UqGQOYhO1yHE0oEqLuQS9/vIFcMGRdBlj+eyV5qFX8qMC
	 UWGRor8Kpj42VyGfFZJgaWrGdVoNwRMDeSf82q1o/7RmgHjQObfebgheD3N+WRTr2TsY8
	 Q1BAftAb9pedxtpCW33rByuDgT1IlRxLEA8gY1nD/LKeL1qs8Qrz9ErLMGgG54tuRqDVP
	 mHt4SgJ9SbdpdQsauBmB/HV7HbrlI/E4w2aa8vZ3+zYLFdp1kxMAnrF8KpVHTQxx+etc4
	 dpHWh9mithJCtHgwhachSl8JeLUWOGfZ7dEgBKENkXRUEJY8hDuAN1/rquk44To5JeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXI8dfun;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19C606CC81;
	Thu,  5 Nov 2026 10:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D19C606CC81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXI8dfun
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873362; x=1825409362;
  h=date:from:to:cc:subject:message-id;
  bh=+m9BOEwNuWk2ABtgKu7Q/T1dsNrSPWU6nYokIU5pONQ=;
  b=hXI8dfunKFdOTM8Cl94YreP/d9JnMYvz9z3BwtLGVCp1qdYBUVQ1jU3t
   dlBDL6QabHcJwuJZ4Qr0/nk+hI/o933dA3yybTaZpnE4dJQ6lJd0ITzio
   5INjHk77ZWFgl4BtB0lEXE9SgRBFXAbk1hAqByl4xaLcPTzk7kAvDtjwv
   IXI6RMu+q4uJTC6HZZyvTEvYS2Ndt3jyyqBgXCtLq/tr8Y3kWJOK2+xMD
   tycLLgq2IjR7BR2T3z5J8/tnUgCgxDbK83Im5DJ+Z375DRlYw/hhId8L6
   ifTFdH4UssOjBg1LNymtYoZaZd5eb0DvzQtZpFsFRysKFFkdu90dh68zI
   w==;
X-CSE-ConnectionGUID: ccQdQAjNTNGXE8eznkzP7Q==
X-CSE-MsgGUID: 60qbYp3bRKGYgsFXBfNNwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2673684"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2673684"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:09:22 -0800
X-CSE-ConnectionGUID: krcOcvcaTAG3ztoSrjfDmw==
X-CSE-MsgGUID: 2h8ia1NeSNWgqxIrBYe4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7038190"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2026 02:09:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOuPG-00000000m2J-1fXe;
	Thu, 05 Nov 2026 10:09:18 +0000
Date: Thu, 05 Nov 2026 18:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-nvhe-s1pie 2/2]
 arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: 'arm64/pgtable-hwdef.h'
 file not found
Message-ID: <202611051736.R26gkbXg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-nvhe-s1pie
head:   321d8d9bb036f451a784d12db6eea0c1ed701194
commit: 321d8d9bb036f451a784d12db6eea0c1ed701194 [2/2] KVM: arm64: Enable S1PIE for hVHE
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261105/202611051736.R26gkbXg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051736.R26gkbXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051736.R26gkbXg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/arm64/handle_exit.c:6:
   In file included from arch/s390/include/arm64/kvm_emulate.h:11:
>> arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: 'arm64/pgtable-hwdef.h' file not found
      15 | #include <arm64/pgtable-hwdef.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 arch/arm64/include/asm/kvm_arm.h

    10	
    11	#include <linux/const.h>
    12	#include <linux/bits.h>
    13	#include <linux/types.h>
    14	#include <asm/esr.h>
  > 15	#include <asm/pgtable-hwdef.h>
    16	#include <asm/sysreg.h>
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
