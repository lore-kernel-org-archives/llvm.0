Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013BD14A8D;
	Mon, 29 Jan 2024 04:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706502008; cv=none; b=DWaZ8vSiHCY6kbUCtUnSO+mVewwkdA58YFlH83dEcvzyBOzSMKub+eFfIdU5iTOUOx8ZLOQgKErbdOfP10c2oBX4leiWsR8hXMhXQQAqIyzpeIl3SyD7XZzWZtfhbGoAkgu7EM2dix3oR73B+zKdAjWJeViWdXvMBGBepQWFjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706502008; c=relaxed/simple;
	bh=tKPIpHeodoYQxfeTYOyd6vObmuFOaU6BWbSrAMARNyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtuTd6u/ufwxv2gf118Tsk45kFsLXc3f0rY//mJtcW/ZdtcUtTxtiYRDaTeYrPVLYZyfmdUi1DoffGYaA03SztUHgdOu6TD14UmXdTcZV4eEs2W5dvmSQxaa/Irrj8o70X8e/kuOqo2aDVFZay+ddRCUFuBk4bCGWBOr1sNUS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMvJoJDj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMvJoJDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706502007; x=1738038007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKPIpHeodoYQxfeTYOyd6vObmuFOaU6BWbSrAMARNyA=;
  b=NMvJoJDj34kLKv49RBLmkXDnDFFr0Zj/wKp5tHHX0Th3ps9zKy0CJvBM
   wkp0kogssxjP6l5KUcrnmjxJNt+iMmws0+vbKehiTomIyt8UCnTUv6mSZ
   0zRobvhf+CiscsNl0A5tAiothSrBpK/jcE/TP7/b7i6GFzKRwMd58oJ+W
   ejROfLQy/wtJ6DykPFwKuE1x2GNjJR2uZ/Ga7FtpHeoek+VqRKPjngBkQ
   yIeFH4IbHRY0UFCzQbrPa+bWx+8ZL4dOoZXzBd/xooblNSDndIprkCq4F
   TuzNBOyZ/yO0RoYZLJRIq4grVLb1/mjAbDJpIxpUzIXIII0lgIxjNa6bO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2734531"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="2734531"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 20:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118812632"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="1118812632"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 20:20:03 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUJ7p-00041u-0w;
	Mon, 29 Jan 2024 04:20:01 +0000
Date: Mon, 29 Jan 2024 12:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v2 12/15] WARNING: modpost: vmlinux: section
 mismatch in reference: do_vc_no_ghcb+0x2d (section: .pi.text) -> lower_bits
 (section: .text)
Message-ID: <202401291254.ONzMKQRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2
head:   b8b16573b6d0090db2f530fb9c5f049650806e61
commit: b6f5d2d6689a9c0874044526a4eb0ac83c0383e6 [12/15] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240129/202401291254.ONzMKQRj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291254.ONzMKQRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291254.ONzMKQRj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x12 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1a (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x74 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x7f (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0xa4 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x11b (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x130 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x18b (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1cf (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x1ec (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x26d (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x2c8 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x300 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __startup_64+0x33d (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0xd (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x58 (section: .pi.text) -> pmd_index (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0x60 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_postprocess_startup+0xa6 (section: .pi.text) -> sme_get_me_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x3d (section: .pi.text) -> init_idt_data (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x4d (section: .pi.text) -> idt_init_desc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_load_idt+0x55 (section: .pi.text) -> native_write_idt_entry (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: startup_64_setup_env+0x1d (section: .pi.text) -> native_load_gdt (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: do_vc_no_ghcb+0x2d (section: .pi.text) -> lower_bits (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: do_vc_no_ghcb+0x59 (section: .pi.text) -> lower_bits (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: do_vc_no_ghcb+0xfd (section: .pi.text) -> __stack_chk_fail (section: .noinstr.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_cpuid+0xf (section: .pi.text) -> snp_cpuid_get_table (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_cpuid+0x6b (section: .pi.text) -> snp_cpuid_postprocess (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0x79 (section: .pi.text) -> pvalidate (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0xab (section: .pi.text) -> sev_es_rd_ghcb_msr (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0xd3 (section: .pi.text) -> pvalidate (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0xec (section: .pi.text) -> __warn_printk (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0x107 (section: .pi.text) -> __warn_printk (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0x132 (section: .pi.text) -> __warn_printk (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: early_set_pages_state+0x147 (section: .pi.text) -> __warn_printk (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_init+0xf (section: .pi.text) -> find_cc_blob (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_init+0x25 (section: .pi.text) -> setup_cpuid_table (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sev_es_ghcb_hv_call+0x90 (section: .pi.text) -> verify_exception_info (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_cpuid_get_validated_func+0x5 (section: .pi.text) -> snp_cpuid_get_table (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: snp_cpuid_hv+0x1 (section: .pi.text) -> sev_cpuid_hv (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __sev_cpuid_hv+0x18 (section: .pi.text) -> sev_es_rd_ghcb_msr (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x12 (section: .pi.text) -> sme_get_me_mask (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x13c (section: .pi.text) -> native_read_cr3_pa (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x15d (section: .pi.text) -> __native_read_cr3 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x165 (section: .pi.text) -> native_write_cr3 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x18d (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x1bc (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x1fa (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x373 (section: .pi.text) -> __native_read_cr3 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_encrypt_kernel+0x389 (section: .pi.text) -> native_write_cr3 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0x22 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0x32 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0x4a (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0x6a (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0xc3 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0xd4 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0xec (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_pgtable_calc+0x108 (section: .pi.text) -> native_read_cr4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_clear_pgd+0x17 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_clear_pgd+0x23 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_clear_pgd+0x2b (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_clear_pgd+0x3b (section: .pi.text) -> native_read_cr4 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_enable+0x58 (section: .pi.text) -> native_cpuid (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_enable+0x8b (section: .pi.text) -> native_cpuid (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_enable+0xf8 (section: .pi.text) -> native_cpuid (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sme_enable+0x189 (section: .pi.text) -> cc_set_mask (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x1a (section: .pi.text) -> pmd_offset (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x28 (section: .pi.text) -> pmd_none (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x54 (section: .pi.text) -> native_set_pmd (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x5f (section: .pi.text) -> pmd_large (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x75 (section: .pi.text) -> pte_offset_kernel (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x80 (section: .pi.text) -> pte_none (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd+0x99 (section: .pi.text) -> native_set_pte (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x15 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x3c (section: .pi.text) -> pgd_none (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x48 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x71 (section: .pi.text) -> native_read_cr4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x8c (section: .pi.text) -> native_set_pgd (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x98 (section: .pi.text) -> p4d_offset (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0xa3 (section: .pi.text) -> p4d_none (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0xcf (section: .pi.text) -> native_set_p4d (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0xdb (section: .pi.text) -> pud_offset (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0xe9 (section: .pi.text) -> pud_none (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x115 (section: .pi.text) -> native_set_pud (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_prepare_pgd+0x120 (section: .pi.text) -> pud_large (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd_large+0x18 (section: .pi.text) -> pmd_offset (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd_large+0x23 (section: .pi.text) -> pmd_large (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: sme_populate_pgd_large+0x3e (section: .pi.text) -> native_set_pmd (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x1 (section: .pi.text) -> __cmdline_find_option_bool (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0x40 (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0xb3 (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0xfa (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-uncore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-cstate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/rapl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kernel/cpu/mce/mce-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/crypto/crc32-pclmul.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-intel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-amd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in block/t10-pi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
