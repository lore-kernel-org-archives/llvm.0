Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5A7C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654631825; x=1686167825;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cT4HnWxZ5YEcXe33MLvIyasEsHsC3AhdEwl2TozGkXE=;
  b=OmCmGvE3k9uQQXi7oiqkzkvddRa1bVYXfRgGMhDb+5iTWdGuD2vKe2Ug
   cia0g6wQaseA/y8whG+5snPo8Ybwyi/f+cl+LaSKplEiRhIYE4YCO5KM+
   JHkP1QFv5GsmoIz3FAYwDrxsvZgCvBi7eTNqQSyDxnpENnwEC3ejrTrrd
   lWmavT/V99t31rNjUH55jeFIpbg4j5fSv2po63eg3cK+5e3bxpV62wlh+
   iSVMkcYn6WpYyjD6u+3T0fvgzBIIMcWOelsokHP0qFcBAJsCseb/OaKDS
   WMw6s+RnfRzC3ojGHantEaNSfzt8bNpARycp+jPSGwQzAh+RyX1xrLBfO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="275516648"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="275516648"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 12:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="565575010"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2022 12:57:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyfK2-000DuL-Lt;
	Tue, 07 Jun 2022 19:57:02 +0000
Date: Wed, 8 Jun 2022 03:56:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 8168/9999] vmlinux.o: warning: objtool: __switch_to_asm()+0x0: undefined
 stack state
Message-ID: <202206080312.96b5TnRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [8168/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-randconfig-a003-20220606 (https://download.01.org/0day-ci/archive/20220608/202206080312.96b5TnRP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e48efff5cb5fd63a687465347bdbb52ef98dad44
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout e48efff5cb5fd63a687465347bdbb52ef98dad44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __switch_to_asm()+0x0: undefined stack state
>> vmlinux.o: warning: objtool: camellia_cbc_dec_32way()+0xb3: stack state mismatch: cfa1=7+520 cfa2=7+8
>> vmlinux.o: warning: objtool: camellia_ctr_32way()+0x1a: stack state mismatch: cfa1=7+520 cfa2=7+8
>> vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha256_transform_rorx()+0x13: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: crc_pcl()+0x87: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: startup_64_setup_env()+0x4d: return with modified stack frame
>> vmlinux.o: warning: objtool: .head.text+0x106: unsupported instruction in callable function

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
