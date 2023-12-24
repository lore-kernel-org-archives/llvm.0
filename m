Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93D22116;
	Sun, 24 Dec 2023 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zjq6rBk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703419875; x=1734955875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxgKPpBeKdfOwQMa+whR8dGgPJlfPTzmrSmtJBdVQVM=;
  b=Zjq6rBk/rGSiHkzyoa5QKn38dEQ3CT0waLfUmW82YZ4aZveJV5NmK+Y2
   uIYfgbADg4QyUpIi31hvcTmQgRGxNTZ4EMUy52UP9MIXBkWnuuRjadKed
   rFMeOKS4hnYlRgYgcR69f+G02DP+zOYIxmBjp0//AAckBX5mR63Qqsj5x
   UWEaDROS7SIXImHpxENuT8veANBfyKlOaFq9hywTifQXjIqmPsWXlT6Ma
   2JtXpoUhXvs+suPWfajSXSn0LuAW1kVLqF+vKCjDb6OfMqkcbOF2E0xGb
   9H+9Gi+ZbdoBZ08hyGgwykXNdDmtZvGki+tc4hOAh24QK/F2jnqMGvCbk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="395124297"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="395124297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 04:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="19566714"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Dec 2023 04:11:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHNI7-000CED-0O;
	Sun, 24 Dec 2023 12:09:50 +0000
Date: Sun, 24 Dec 2023 20:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 14/16] arch/x86/kernel/process.c:838:6:
 error: use of undeclared identifier 'smp_ops'
Message-ID: <202312242024.fh0DWPDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   c7fdc5edcdf1e21ba3228e92a01e93dfe4559a8c
commit: 2c8150c9ae4d1de048eac6d1a18896cbee48bc1c [14/16] x86/smp: Add smp_ops.stop_this_cpu() callback
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231224/202312242024.fh0DWPDX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312242024.fh0DWPDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312242024.fh0DWPDX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/process.c:838:6: error: use of undeclared identifier 'smp_ops'
           if (smp_ops.stop_this_cpu) {
               ^
>> arch/x86/kernel/process.c:839:3: error: must use 'struct' tag to refer to type 'smp_ops'
                   smp_ops.stop_this_cpu();
                   ^
                   struct 
>> arch/x86/kernel/process.c:839:10: error: expected identifier or '('
                   smp_ops.stop_this_cpu();
                          ^
   3 errors generated.


vim +/smp_ops +838 arch/x86/kernel/process.c

   795	
   796	void __noreturn stop_this_cpu(void *dummy)
   797	{
   798		struct cpuinfo_x86 *c = this_cpu_ptr(&cpu_info);
   799		unsigned int cpu = smp_processor_id();
   800	
   801		local_irq_disable();
   802	
   803		/*
   804		 * Remove this CPU from the online mask and disable it
   805		 * unconditionally. This might be redundant in case that the reboot
   806		 * vector was handled late and stop_other_cpus() sent an NMI.
   807		 *
   808		 * According to SDM and APM NMIs can be accepted even after soft
   809		 * disabling the local APIC.
   810		 */
   811		set_cpu_online(cpu, false);
   812		disable_local_APIC();
   813		mcheck_cpu_clear(c);
   814	
   815		/*
   816		 * Use wbinvd on processors that support SME. This provides support
   817		 * for performing a successful kexec when going from SME inactive
   818		 * to SME active (or vice-versa). The cache must be cleared so that
   819		 * if there are entries with the same physical address, both with and
   820		 * without the encryption bit, they don't race each other when flushed
   821		 * and potentially end up with the wrong entry being committed to
   822		 * memory.
   823		 *
   824		 * Test the CPUID bit directly because the machine might've cleared
   825		 * X86_FEATURE_SME due to cmdline options.
   826		 */
   827		if (c->extended_cpuid_level >= 0x8000001f && (cpuid_eax(0x8000001f) & BIT(0)))
   828			native_wbinvd();
   829	
   830		/*
   831		 * This brings a cache line back and dirties it, but
   832		 * native_stop_other_cpus() will overwrite cpus_stop_mask after it
   833		 * observed that all CPUs reported stop. This write will invalidate
   834		 * the related cache line on this CPU.
   835		 */
   836		cpumask_clear_cpu(cpu, &cpus_stop_mask);
   837	
 > 838		if (smp_ops.stop_this_cpu) {
 > 839			smp_ops.stop_this_cpu();
   840			unreachable();
   841		} else {
   842	
   843			for (;;) {
   844				/*
   845				 * Use native_halt() so that memory contents don't
   846				 * change (stack usage and variables) after possibly
   847				 * issuing the native_wbinvd() above.
   848				 */
   849				native_halt();
   850			}
   851		}
   852	}
   853	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
