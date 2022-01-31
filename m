Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85E2C9C
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643653434; x=1675189434;
  h=date:from:cc:subject:message-id:mime-version;
  bh=l1L6uVRQz9hLkKRv69HHkGEsGZ/tjcsscr/rxunLvVU=;
  b=cwyiMY6sByK6sheh9bBF8t92CKCpFsFjmXf3D40WOmqJhRsYK2USQ/zv
   hfjSX6MD3fjzN1w1zVa/fFt4/S4I/dP4JGXrVoAt4mFDRYdlhEz/D92bz
   kmRaob66w1f2MUPOA0mM7YNidUjyvottHuwmchKUeMlaUJWVGTTx1V80Y
   KPyA0sGwzSvmtqCkzvGpXW/7rGzJYHSk6+kqFsDiISukzXnN7plXKRz1+
   n14KxQxyF5Ud12my7T2LsJnV6/AZPSVmIpceZQiK3mfeygGOz5cz3kA52
   exvRPO4EA/Te49SYoRsoOPTC98I6wIo4XKinDQCEmLqouP53DvMLbfi/C
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308254200"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="308254200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 10:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="675817376"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2022 10:23:42 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEbL4-000SEK-0Z; Mon, 31 Jan 2022 18:23:42 +0000
Date: Tue, 1 Feb 2022 02:22:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 9400/9999] arch/x86/crypto/camellia-aesni-avx2.lto.o: warning: objtool:
 camellia_cbc_dec_32way()+0xb3: stack state mismatch: cfa1=7+520 cfa2=7+8
Message-ID: <202202010256.CKEiHdln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   0da4b942e06d7bd1099f122b04aac9fe798e7196
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [9400/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220201/202202010256.CKEiHdln-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e48efff5cb5fd63a687465347bdbb52ef98dad44
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout e48efff5cb5fd63a687465347bdbb52ef98dad44
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/camellia-aesni-avx2.lto.o: warning: objtool: camellia_cbc_dec_32way()+0xb3: stack state mismatch: cfa1=7+520 cfa2=7+8
>> arch/x86/crypto/camellia-aesni-avx2.lto.o: warning: objtool: camellia_ctr_32way()+0x1a: stack state mismatch: cfa1=7+520 cfa2=7+8
--
>> arch/x86/crypto/crc32c-intel.lto.o: warning: objtool: crc_pcl()+0x87: sibling call from callable instruction with modified stack frame
--
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_ssse3()+0x14: unsupported stack pointer realignment
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_avx()+0x14: unsupported stack pointer realignment
>> arch/x86/crypto/sha512-ssse3.lto.o: warning: objtool: sha512_transform_rorx()+0x7: unsupported stack pointer realignment
--
>> drivers/net/ethernet/wiznet/w5100.lto.o: warning: objtool: .text.w5100_tx_skb: unexpected end of section
>> drivers/net/ethernet/wiznet/w5100.lto.o: warning: objtool: .text.w5100_readbuf: unexpected end of section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
