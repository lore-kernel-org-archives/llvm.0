Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BF17CF;
	Thu, 16 Mar 2023 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678950026; x=1710486026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHIGD/BGcOCGdHI4J+LV7f5E8DEIn5mKG3Ix9Ltnh4o=;
  b=Y05NlmMlhSvf3qKUp0cdhELUiE9h6RWuKZN85KoJ7X2v6XiLe21DKzjJ
   omHti+6TQR/fxeahNLnWTaIFJG0PCZWxhjqKZSJ6EbTkq70+2CE3GFhLM
   lUoZtxtRa6/9ldAbwxcLIbUJ00+6QRogR+U9Td78XAKezr78RJnJu9McH
   d9ZDrqRJYijidzdajqVma7aOyR+c/wJ4vPM+NG4pAAsX9rGlzVshG8VzI
   sQspvm0lQJYfF63IBQ2/5DLeg3fTD3sDBGgvSdfij93VHcy3Cfbzie2HU
   6y90G6K9b1i9GRS3T3enwEd2zZSvK/tONb34qzQWSK6993hHlqafNs/ME
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402779443"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="402779443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="709972636"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="709972636"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 00:00:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pchb5-0008Na-28;
	Thu, 16 Mar 2023 07:00:23 +0000
Date: Thu, 16 Mar 2023 14:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 63/66]
 arch/riscv/kvm/vcpu_switch.S:260:81: error: invalid reassignment of
 non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
Message-ID: <202303161434.wymxY221-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   40fabad953e9b049d3490f29e9c3eac00faf08b3
commit: 444a752085c10f4fa2822e3c7d8baf445a7209be [63/66] RISC-V: KVM: Use SBI sync SRET call when available
config: riscv-randconfig-r002-20230312 (https://download.01.org/0day-ci/archive/20230316/202303161434.wymxY221-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/444a752085c10f4fa2822e3c7d8baf445a7209be
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout 444a752085c10f4fa2822e3c7d8baf445a7209be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161434.wymxY221-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_switch.S:260:81: error: invalid reassignment of non-absolute variable '.L__sym_size___kvm_riscv_switch_to'
   .type __kvm_riscv_switch_to STT_FUNC ; .set .L__sym_size___kvm_riscv_switch_to, .-__kvm_riscv_switch_to ; .size __kvm_riscv_switch_to, .L__sym_size___kvm_riscv_switch_to
                                                                                   ^


vim +260 arch/riscv/kvm/vcpu_switch.S

444a752085c10f Anup Patel 2022-10-09  230  
444a752085c10f Anup Patel 2022-10-09  231  	/*
444a752085c10f Anup Patel 2022-10-09  232  	 * Parameters:
444a752085c10f Anup Patel 2022-10-09  233  	 * A0 <= Pointer to struct kvm_vcpu_arch
444a752085c10f Anup Patel 2022-10-09  234  	 * A1 <= SBI extension ID
444a752085c10f Anup Patel 2022-10-09  235  	 * A2 <= SBI function ID
444a752085c10f Anup Patel 2022-10-09  236  	 * A3 <= Flags for SBI sync SRET call
444a752085c10f Anup Patel 2022-10-09  237  	 */
444a752085c10f Anup Patel 2022-10-09  238  ENTRY(__kvm_riscv_nacl_switch_to)
444a752085c10f Anup Patel 2022-10-09  239  	SAVE_HOST_GPRS
444a752085c10f Anup Patel 2022-10-09  240  
444a752085c10f Anup Patel 2022-10-09  241  	SAVE_HOST_AND_RESTORE_GUEST_CSRS __kvm_riscv_nacl_switch_to_return
444a752085c10f Anup Patel 2022-10-09  242  
444a752085c10f Anup Patel 2022-10-09  243  	/* Resume Guest using SBI nested acceleration */
444a752085c10f Anup Patel 2022-10-09  244  	add	a0, a3, zero
444a752085c10f Anup Patel 2022-10-09  245  	add	a6, a2, zero
444a752085c10f Anup Patel 2022-10-09  246  	add	a7, a1, zero
444a752085c10f Anup Patel 2022-10-09  247  	ecall
444a752085c10f Anup Patel 2022-10-09  248  
444a752085c10f Anup Patel 2022-10-09  249  	/* Back to Host */
444a752085c10f Anup Patel 2022-10-09  250  	.align 2
444a752085c10f Anup Patel 2022-10-09  251  __kvm_riscv_nacl_switch_to_return:
444a752085c10f Anup Patel 2022-10-09  252  	SAVE_GUEST_GPRS
444a752085c10f Anup Patel 2022-10-09  253  
444a752085c10f Anup Patel 2022-10-09  254  	SAVE_GUEST_AND_RESTORE_HOST_CSRS
444a752085c10f Anup Patel 2022-10-09  255  
444a752085c10f Anup Patel 2022-10-09  256  	RESTORE_HOST_GPRS
34bde9d8b9e6e5 Anup Patel 2021-09-27  257  
34bde9d8b9e6e5 Anup Patel 2021-09-27  258  	/* Return to C code */
34bde9d8b9e6e5 Anup Patel 2021-09-27  259  	ret
34bde9d8b9e6e5 Anup Patel 2021-09-27 @260  ENDPROC(__kvm_riscv_switch_to)
9f7013265112a9 Anup Patel 2021-09-27  261  

:::::: The code at line 260 was first introduced by commit
:::::: 34bde9d8b9e6e5249db3c07cf1ebfe75c23c671c RISC-V: KVM: Implement VCPU world-switch

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
