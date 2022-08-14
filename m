Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D2A29
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 04:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660451324; x=1691987324;
  h=date:from:cc:subject:message-id:mime-version;
  bh=H8f2Z0rx+zr/QAtyU79Xdm/Mklpcqd2MPZRdanLdUiU=;
  b=bZgOlFg533wA/rj4Dowop/XviAulew+vbW+DQEUOdKKDx121ivlw0UOk
   /SfQh/+gmzl4JUVGz61rSzjzOijnWZre6fBuEZZ/z9y2ZqMm8o2CqRAYO
   UcK2UxwXcrTW86djs6Ft64r0vFfaUxwt/SWdegDbTjP6AUu1f/PtGbC4J
   P31WT2EOxBJUtaDb5MY4cEFuAWT1P3CEZiFxTPVXUU2YilfcZydIZihMa
   1GJv3fp/YVGgWN3VnX0WQWVgCMV+YdRhcanQgzvrvGoAzn/GH1KP5DAvp
   Y0Z4IB5XD7Lu8JAvu3kIs2UeMcG8YDoAX7ICQSK+bREWjL0MMpwdemB16
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="317774388"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="317774388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 21:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="732608682"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Aug 2022 21:28:42 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oN5Ev-0002UK-2a;
	Sun, 14 Aug 2022 04:28:41 +0000
Date: Sun, 14 Aug 2022 12:28:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 8168/9999] drivers/gpu/drm/arm/display/komeda/komeda.lto.o: warning:
 objtool: .text.komeda_fb_check_src_coords: unexpected end of section
Message-ID: <202208141255.84r00BUR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [8168/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-randconfig-a006-20220801 (https://download.01.org/0day-ci/archive/20220814/202208141255.84r00BUR-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e48efff5cb5fd63a687465347bdbb52ef98dad44
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout e48efff5cb5fd63a687465347bdbb52ef98dad44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/arm/display/komeda/komeda.lto.o: warning: objtool: .text.komeda_fb_check_src_coords: unexpected end of section
--
>> drivers/gpu/drm/savage/savage.lto.o: warning: objtool: .text.savage_dispatch_draw: unexpected end of section
--
>> drivers/gpu/drm/gma500/gma500_gfx.lto.o: warning: objtool: .text.psb_mmu_insert_pages: unexpected end of section
--
>> arch/x86/crypto/camellia-aesni-avx2.lto.o: warning: objtool: camellia_cbc_dec_32way()+0x1b4: return with modified stack frame
>> arch/x86/crypto/camellia-aesni-avx2.lto.o: warning: objtool: camellia_ctr_32way()+0x41b: return with modified stack frame
--
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_init_avx_gen2()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_enc_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_dec_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_finalize_avx_gen2()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_init_avx_gen4()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_enc_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_dec_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> arch/x86/crypto/aesni-intel.lto.o: warning: objtool: aesni_gcm_finalize_avx_gen4()+0x12: unsupported stack pointer realignment
--
>> arch/x86/crypto/sha256-ssse3.lto.o: warning: objtool: sha256_transform_rorx()+0x13: unsupported stack pointer realignment
--
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_ssse3()+0x14: unsupported stack pointer realignment
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_avx()+0x14: unsupported stack pointer realignment
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_rorx()+0x7: unsupported stack pointer realignment
--
>> arch/x86/crypto/crc32c-intel.lto.o: warning: objtool: crc_pcl()+0x87: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
