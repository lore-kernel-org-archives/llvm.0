Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B7721CC48;
	Wed, 26 Feb 2025 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581248; cv=none; b=aaX03DB3CdWuCHCoBg4GYuZyLHcEYR6+5kSplqI4B+OxhE7Zfhri9ktyZDBliteVGAEMKRP+cI3g82of7PKLv6a3vH1SsHeBuRjUHH84bkFHL1OfpzlddU7rYha/PIB8K4muGaHiomL95on5zwJ+uvGCrZzJQHFaVocbjd2ZaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581248; c=relaxed/simple;
	bh=fj/pxG/hebcoqskP0oILWQtHjXvrqoQmjtoeB7U6aac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTuFTFhC3JQNpUb6ou4CPwb1511XI3d1bUHeWR57Ut8PlgctLptpaLXKgf9SBWG5Uu2JrUt6uzKxLvZLnsAKKjDwO3q1qLoE4KqnVnkTEtudQxsgCwxZSyXXKwuHtYFe4lIXdLOkNVMkJ84ekoVrDPSIvVzVSWFXi2TVXHXHjMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZr8Vvur; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZr8Vvur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740581247; x=1772117247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fj/pxG/hebcoqskP0oILWQtHjXvrqoQmjtoeB7U6aac=;
  b=cZr8VvurryNvfiyu+ge7MtPNlTf01xu+jTBB5EATXGiAF2kPwa8132ar
   9P+ByDNgu2O1waRSyGcchNPnBf9aHD4AkI0uzpydF5cpq49OYsoFXIeoF
   zEhusx3/Gspvw13YStV8yfnUXrt56g/NcC//j/qyMh+lQDuI+BxmAcGMD
   BthdYqbErrSMfKn+HorD+hts0RKra0FoZ+g5CqZU8REfPbyhRP8Y/gwZb
   mk2FIhG/KxFXyU2PNeqPQCn8XHu2Z774jrU25zx9fYnvnUnYQ/Dv33RUj
   m1TVjwOlcYAf0gkdyRfcGr68P5poScAZH8Igay7S2Z+1mNkwA6XKXOA8+
   g==;
X-CSE-ConnectionGUID: fdP4jqinTg29I7bGseeDlw==
X-CSE-MsgGUID: 8c249w0bShq4di3Qpt3Veg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58967640"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="58967640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:47:25 -0800
X-CSE-ConnectionGUID: BeaxIHGbR/WySYPWhwr1Lw==
X-CSE-MsgGUID: SCqz823jTS2OLYoFCBZ6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117210065"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2025 06:47:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnIgz-000Bpf-2j;
	Wed, 26 Feb 2025 14:47:21 +0000
Date: Wed, 26 Feb 2025 22:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <85610623+AdityaGarg8@users.noreply.github.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/372 1/1] drivers/hid/hid-apple.c:706:37: error: use
 of undeclared identifier 'apple_fn_keys_mbp13'; did you mean
 'apple_fn_keys_spi'?
Message-ID: <202502262216.dbk84JaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux pr/372
head:   0ce68966540e787e080a3bafdecd863469693b09
commit: 0ce68966540e787e080a3bafdecd863469693b09 [1/1] HID: apple: remove duplicated table used for 13 inch MacBook Pros with touchbar
config: riscv-randconfig-001-20250226 (https://download.01.org/0day-ci/archive/20250226/202502262216.dbk84JaG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502262216.dbk84JaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502262216.dbk84JaG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-apple.c:21:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-apple.c:21:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-apple.c:21:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-apple.c:21:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/hid/hid-apple.c:21:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/hid/hid-apple.c:706:37: error: use of undeclared identifier 'apple_fn_keys_mbp13'; did you mean 'apple_fn_keys_spi'?
     706 |         apple_setup_key_translation(input, apple_fn_keys_mbp13);
         |                                            ^~~~~~~~~~~~~~~~~~~
         |                                            apple_fn_keys_spi
   drivers/hid/hid-apple.c:279:43: note: 'apple_fn_keys_spi' declared here
     279 | static const struct apple_key_translation apple_fn_keys_spi[] = {
         |                                           ^
   7 warnings and 1 error generated.


vim +706 drivers/hid/hid-apple.c

8c19a51591d06f5 Jiri Slaby    2008-06-18  698  
8c19a51591d06f5 Jiri Slaby    2008-06-18  699  static void apple_setup_input(struct input_dev *input)
8c19a51591d06f5 Jiri Slaby    2008-06-18  700  {
8c19a51591d06f5 Jiri Slaby    2008-06-18  701  	set_bit(KEY_NUMLOCK, input->keybit);
8c19a51591d06f5 Jiri Slaby    2008-06-18  702  
8c19a51591d06f5 Jiri Slaby    2008-06-18  703  	/* Enable all needed keys */
f1d1b3a9b41125d José Expósito 2022-02-08  704  	apple_setup_key_translation(input, apple_fn_keys);
9b8df1c76e1d6ac Janne Grunau  2021-12-19  705  	apple_setup_key_translation(input, apple_fn_keys_spi);
77280a39c0c29ee Janne Grunau  2022-01-05 @706  	apple_setup_key_translation(input, apple_fn_keys_mbp13);
f1d1b3a9b41125d José Expósito 2022-02-08  707  	apple_setup_key_translation(input, powerbook_fn_keys);
f1d1b3a9b41125d José Expósito 2022-02-08  708  	apple_setup_key_translation(input, powerbook_numlock_keys);
f1d1b3a9b41125d José Expósito 2022-02-08  709  	apple_setup_key_translation(input, apple_iso_keyboard);
0fea6fe7d5ef1b5 José Expósito 2022-02-08  710  	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
250b369ed2380ba José Expósito 2022-02-08  711  	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
f1d1b3a9b41125d José Expósito 2022-02-08  712  	apple_setup_key_translation(input, apple2021_fn_keys);
c5f09b1b45cbb90 Aditya Garg   2022-02-03  713  	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
c5f09b1b45cbb90 Aditya Garg   2022-02-03  714  	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
8c19a51591d06f5 Jiri Slaby    2008-06-18  715  }
8c19a51591d06f5 Jiri Slaby    2008-06-18  716  

:::::: The code at line 706 was first introduced by commit
:::::: 77280a39c0c29eec0c58e4aa6db7abb459b25228 HID: apple: add Fn key mapping for Macbook Pro with touchbar

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
