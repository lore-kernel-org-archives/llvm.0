Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937514001;
	Sat, 16 Dec 2023 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8jWvK5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702715868; x=1734251868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOCnWS7Fq+xFM5rvULTCuQZtdATI03llgQTYX8kj9aU=;
  b=V8jWvK5m+ea/SPOUN8hTkeO1bScJmpr4V0I6aiZ2Q1hRnm9aQ+9s5w/m
   Rl3NxhDmF/DJ3lyOPeWgZayLoDkEOANJX42ZdmrV1RT7LBJGlWJP/Qt0l
   8P77Z24L9EWjdh95eoeDINvv6Q/VI4nW4qflCxTTAXbY2mkQAOj+OHXRY
   CFs26kvlM2CMbfv29BTDkMo/+UbzL2w4h/ypIPLRj3D1iY8/sqqGN0/oZ
   tnNaWI9+zFT7+JoX2H1NvtHCySXWdBPo5GWAdQTzJct4j9N6DAR10B6zV
   eKh4Xx9dp4sky+a1euJrFMjzsOxVHr9TIYKlUMN4+sOHfQ4YHrjXztb3m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2205429"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2205429"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 00:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="898389584"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="898389584"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2023 00:37:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEQB5-0001Kk-29;
	Sat, 16 Dec 2023 08:37:43 +0000
Date: Sat, 16 Dec 2023 16:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [intel-tdx:guest 53/136] arch/x86/kernel/acpi/boot.c:67:51: warning:
 unused variable 'acpi_mp_wake_mailbox'
Message-ID: <202312161646.Y0IOMcs3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: b93c111150948d0c5a55fca8e1620a05aa7e4298 [53/136] x86/acpi, x86/boot: Add multiprocessor wake-up support
config: i386-randconfig-014-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161646.Y0IOMcs3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161646.Y0IOMcs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161646.Y0IOMcs3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/acpi/boot.c:67:51: warning: unused variable 'acpi_mp_wake_mailbox' [-Wunused-variable]
   static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
                                                     ^
>> arch/x86/kernel/acpi/boot.c:68:12: warning: unused variable 'acpi_mp_wake_mailbox_paddr' [-Wunused-variable]
   static u64 acpi_mp_wake_mailbox_paddr;
              ^
>> arch/x86/kernel/acpi/boot.c:69:22: warning: unused variable 'apic_id_wakemap' [-Wunused-variable]
   static physid_mask_t apic_id_wakemap = PHYSID_MASK_NONE;
                        ^
   arch/x86/kernel/acpi/boot.c:1305:19: warning: unused function 'acpi_parse_madt_ioapic_entries' [-Wunused-function]
   static inline int acpi_parse_madt_ioapic_entries(void)
                     ^
   4 warnings generated.


vim +/acpi_mp_wake_mailbox +67 arch/x86/kernel/acpi/boot.c

    66	
  > 67	static struct acpi_madt_multiproc_wakeup_mailbox *acpi_mp_wake_mailbox;
  > 68	static u64 acpi_mp_wake_mailbox_paddr;
  > 69	static physid_mask_t apic_id_wakemap = PHYSID_MASK_NONE;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
