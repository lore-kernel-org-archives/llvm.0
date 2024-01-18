Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C9257B;
	Thu, 18 Jan 2024 00:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705536028; cv=none; b=bGlHrVYBY3kRxY/9ETmP14sQqKjwD3YgEqLd6rBNYwOMNMs2DWBn5GvViSXljH9/J3E7l8n8lANtkFoZ9/tTMqivoLR5NSQHxUDZoxtdZgmOzZT3vSVmBn+Ntz2abKUd43G1q0y7xB8qc6O3KYPpJ+rmWKMhYz+eBaYeFOg9Fm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705536028; c=relaxed/simple;
	bh=XWXZkiGg+J2TcDKMPMa6E/KddB3/LnBMtmKJ5tsgasY=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=kTWrJHzbN2L0/qVPE9Ek4WSf+q0cbVQGgpz8a3n+G4Rwp/h9iPBz4F26oS3qJf10lCWUxqpBU+E+SO7ohBLHro+F2xXDYYatLaZbG+9S/Xg85ilu97zcoWTRkEo8we/+PdYM8lflEHXimtife4yQLeNvQpALkfkA1lKW1xT0mCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nv2VYl36; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nv2VYl36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705536027; x=1737072027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWXZkiGg+J2TcDKMPMa6E/KddB3/LnBMtmKJ5tsgasY=;
  b=Nv2VYl36y5ExmBFub2VmpTKhDwmzA+AX+uMGosMVzA+d7ZTJJAIzcOdQ
   Ap/+c9RdojIoJs+QO/ZLPbSFq01k5E4DcwrE0tydZBF+Uu1TTaRFaiOIt
   3KssSPwBX1LhhrJYC3kReVNRDiFIGWBRnTubzUdOLFxkc9rQKi8sWvfRA
   RNI91vdbPlrbdP/cGPvHnLmN925YZJAirzsSril9rrGITj0N9mwlxxk/Z
   C5hPFlkLt9L7lgXsqELedjn+XH5+XnMRg8YK9TpTOvxLzSJRq9K+xlkJU
   lhX6sB9pdrWf+lk3NIJH7BQ8VjNrL9IFmlaNZMuUoUmWxGKMsl08tfVYo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="390755973"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="390755973"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 16:00:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="787923549"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="787923549"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jan 2024 16:00:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQFpT-0002RO-2V;
	Thu, 18 Jan 2024 00:00:19 +0000
Date: Thu, 18 Jan 2024 08:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 56/71]
 arch/x86/kernel/cpu/topology.c:150:31: warning: variable 'bsp_apicid' is
 uninitialized when used here
Message-ID: <202401180751.hErhvgvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   db28d91b811f57395f2628ad23002acaef9e1ee1
commit: 3159457cc55b83cde16d0db14e765eabd4160b98 [56/71] x86/cpu: Detect real BSP on crash kernels
config: i386-buildonly-randconfig-003-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180751.hErhvgvl-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180751.hErhvgvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180751.hErhvgvl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/topology.c:150:31: warning: variable 'bsp_apicid' is uninitialized when used here [-Wuninitialized]
     150 |         topo_info.real_bsp_apic_id = bsp_apicid;
         |                                      ^~~~~~~~~~
   arch/x86/kernel/cpu/topology.c:123:16: note: initialize the variable 'bsp_apicid' to silence this warning
     123 |         u32 bsp_apicid;
         |                       ^
         |                        = 0
   arch/x86/kernel/cpu/topology.c:156:11: warning: unused variable 'dom' [-Wunused-variable]
     156 |         int cpu, dom;
         |                  ^~~
   2 warnings generated.


vim +/bsp_apicid +150 arch/x86/kernel/cpu/topology.c

   120	
   121	static __init bool check_for_real_bsp(u32 apic_id)
   122	{
   123		u32 bsp_apicid;
   124	
   125		/*
   126		 * There is no real good way to detect whether this a kdump()
   127		 * kernel, but except on the Voyager SMP monstrosity which is not
   128		 * longer supported, the real BSP APIC ID is the first one which is
   129		 * enumerated by firmware. That allows to detect whether the boot
   130		 * CPU is the real BSP. If it is not, then do not register the APIC
   131		 * because sending INIT to the real BSP would reset the whole
   132		 * system.
   133		 *
   134		 * The first APIC ID which is enumerated by firmware is detectable
   135		 * because the boot CPU APIC ID is registered before that without
   136		 * invoking this code.
   137		 */
   138		if (topo_info.real_bsp_apic_id != BAD_APICID)
   139			return false;
   140	
   141		if (apic_id == topo_info.boot_cpu_apic_id) {
   142			topo_info.real_bsp_apic_id = apic_id;
   143			return false;
   144		}
   145	
   146		pr_warn("Boot CPU APIC ID not the first enumerated APIC ID: %x > %x\n",
   147			topo_info.boot_cpu_apic_id, bsp_apicid);
   148		pr_warn("Crash kernel detected. Disabling real BSP to prevent machine INIT\n");
   149	
 > 150		topo_info.real_bsp_apic_id = bsp_apicid;
   151		return true;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
