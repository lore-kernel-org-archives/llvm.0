Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358A7E;
	Thu,  7 Dec 2023 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3Ng0JDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701907462; x=1733443462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJuxcnEQ5WnvnxEJHKKiKSbGDVoZSpNWli4+2rrUjec=;
  b=B3Ng0JDdJq6O+yaOFVWOLqT+5JbvMbVVJJ0d8p+bbEKhWTWqyn0Kxgv6
   Av8UaKXMRQL2Mifp23vJJ42nQlcPEd5UNUoQ9+rRZxvZkHIDgCD+IgSbn
   DQD42lHB0vo5qVZ9zQKcGmvoNOHBtSgacMHMZH+vgQJQsiMltfP2lb6in
   jtBrMdNkL27j88sCmHvu+J19mFijiMq5dhHnuu6IxaL0hzjqVSNBEIQr3
   qx0ZKsswsHkl83Zq4V7+ABZCo5+F5olSig7s/CmeIH4QkqG+Bb2tnBGWf
   YIQj0EG+KBWBrXJiwUdcAB14SUcNglPUapoMPZiORy9H2XKkYUiJ7P0Rq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396933541"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="396933541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 16:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800526557"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800526557"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 16:04:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB1s8-000Bbk-20;
	Thu, 07 Dec 2023 00:04:08 +0000
Date: Thu, 7 Dec 2023 08:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [intel-tdx:guest 53/136] arch/x86/kernel/acpi/boot.c:366:2: error:
 call to '__compiletime_assert_229' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
Message-ID: <202312070720.whAy8Wim-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070720.whAy8Wim-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070720.whAy8Wim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070720.whAy8Wim-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/acpi/boot.c:366:2: error: call to '__compiletime_assert_229' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
           smp_store_release(&acpi_mp_wake_mailbox->wakeup_vector, start_ip);
           ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_store_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:65:2: note: expanded from macro '__smp_store_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:325:2: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:303:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:132:1: note: expanded from here
   __compiletime_assert_229
   ^
   1 error generated.


vim +366 arch/x86/kernel/acpi/boot.c

   333	
   334	static int acpi_wakeup_cpu(int apicid, unsigned long start_ip)
   335	{
   336		u8 timeout = 0xFF;
   337	
   338		/* Remap mailbox memory only for the first call to acpi_wakeup_cpu() */
   339		if (physids_empty(apic_id_wakemap)) {
   340			acpi_mp_wake_mailbox = memremap(acpi_mp_wake_mailbox_paddr,
   341							sizeof(*acpi_mp_wake_mailbox),
   342							MEMREMAP_WB);
   343		}
   344	
   345		/*
   346		 * According to the ACPI specification r6.4, sec 5.2.12.19, the
   347		 * mailbox-based wakeup mechanism cannot be used more than once
   348		 * for the same CPU, so skip sending wake commands to already
   349		 * awake CPU.
   350		 */
   351		if (physid_isset(apicid, apic_id_wakemap)) {
   352			pr_err("CPU already awake (APIC ID %x), skipping wakeup\n",
   353			       apicid);
   354			return -EINVAL;
   355		}
   356	
   357		/*
   358		 * Mailbox memory is shared between firmware and OS. Firmware will
   359		 * listen on mailbox command address, and once it receives the wakeup
   360		 * command, CPU associated with the given apicid will be booted. So,
   361		 * the value of apic_id and wakeup_vector has to be set before updating
   362		 * the wakeup command. So use smp_store_release to let the compiler know
   363		 * about it and preserve the order of writes.
   364		 */
   365		smp_store_release(&acpi_mp_wake_mailbox->apic_id, apicid);
 > 366		smp_store_release(&acpi_mp_wake_mailbox->wakeup_vector, start_ip);
   367		smp_store_release(&acpi_mp_wake_mailbox->command,
   368				  ACPI_MP_WAKE_COMMAND_WAKEUP);
   369	
   370		/*
   371		 * After writing wakeup command, wait for maximum timeout of 0xFF
   372		 * for firmware to reset the command address back zero to indicate
   373		 * the successful reception of command.
   374		 * NOTE: 255 as timeout value is decided based on our experiments.
   375		 *
   376		 * XXX: Change the timeout once ACPI specification comes up with
   377		 *      standard maximum timeout value.
   378		 */
   379		while (READ_ONCE(acpi_mp_wake_mailbox->command) && timeout--)
   380			cpu_relax();
   381	
   382		if (timeout) {
   383			/*
   384			 * If the CPU wakeup process is successful, store the
   385			 * status in apic_id_wakemap to prevent re-wakeup
   386			 * requests.
   387			 */
   388			physid_set(apicid, apic_id_wakemap);
   389			return 0;
   390		}
   391	
   392		/* If timed out (timeout == 0), return error */
   393		return -EIO;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
