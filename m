Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB53C5542;
	Thu, 11 Jun 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171633; cv=none; b=uDUBvqArck6GL7nUR2xwisaa7QawnhN+cnax9/TfUGmmKhWfDMV7vZoJ6hO3Eri4kx2txt8tfhTnX1GAzimbdBNCnQvDNQORYOgpJeqBvP249t5jjLvz4T328RMVfr26xMqlfsbSwIJ4A5UrZMIgTaE3x7KyVvl6DvdXHyzn5AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171633; c=relaxed/simple;
	bh=9fnCfN/LmlD6Zg1vCh0Fu4qU6cfbms2pHljnXH6RiJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SoVRc431yEqYrgml9VvfwzP5K6sk2CXzXRKU36SDbT6yAqO0MIfYsMT5OPU9ObJ11xr0NYXg4ScGuNrRZmd9k7ddrFWnwBUinRrj3K/FyIjhrMRTcPMhOHwQzQFcW8/xuSEUPmt0ClGLSC/3ryX/FZXjddFxk8IKa4TB/Qgm4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsQLypQE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsQLypQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781171632; x=1812707632;
  h=date:from:to:cc:subject:message-id;
  bh=9fnCfN/LmlD6Zg1vCh0Fu4qU6cfbms2pHljnXH6RiJ0=;
  b=PsQLypQEC/AVZMOecHYjJqeAVEkDOPt/L32KHItaWmpCuX6l9qWgryd7
   b37kxVlVM9Of3xL0o8WRliYE8wpp0TfIbnwH9H5UuNt0+2BOCYtRcc93+
   yH0+B7D+22z/48NMLx1PR37igZL4kgDNMfMCQ335HN4hGY5bKNtxcjpSA
   lm8TOUerE02O8HJuHhA0J+ka/yaqEj/t9YjPDtBCjjB2+WBX6xggAIeZa
   ESe0NUEwu9Or9tQsNIKPqX1ILmjLvh4qYNTnq/z+BviayLE6TOzCppvfn
   onv53SA7euIFkCNjCPw7Bx3h+m14EXG+j8CZwmx9oFL16jFz6STv4SBMZ
   A==;
X-CSE-ConnectionGUID: v7ad/hN4RAWUKp1ZfFgJfg==
X-CSE-MsgGUID: 8spEsRt0Sh6503XPbMCszA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92657312"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92657312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:53:51 -0700
X-CSE-ConnectionGUID: 5D5c6glLSO6WgjgkY8I8rw==
X-CSE-MsgGUID: +YrFvrvpQ6SRtUPFR2HqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240091806"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2026 02:53:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXc6e-000000003zN-07UO;
	Thu, 11 Jun 2026 09:53:48 +0000
Date: Thu, 11 Jun 2026 11:52:48 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: kernel/time/ntp.c:94 struct member
 'time_adjust_frac' not described in 'ntp_data'
Message-ID: <202606111154.QqLVBzPV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/MAINTAINERS-Add-Miroslav-as-timekeeping-reviewer/20260611-074259
head:   7ad25947d6eb8f82c3ef6cf3128a3e31eb12f67c
commit: 0c2cf32b421fa6214dbfe4438ed85c0498731840 timekeeping: deliver adjtime() time_adjust via skew_delta
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260611/202606111154.QqLVBzPV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111154.QqLVBzPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111154.QqLVBzPV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/time/ntp.c:94 struct member 'skew_delta' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:94 struct member 'time_adjust_frac' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:94 struct member 'skew_delta' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:94 struct member 'time_adjust_frac' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
