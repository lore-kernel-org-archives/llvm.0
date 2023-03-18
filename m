Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18663B;
	Sat, 18 Mar 2023 04:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679113474; x=1710649474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8gz5WNxw/FzY0eimcWq71wCBNHKdx395KKqe4mmhIo=;
  b=Wk0zqTiZ73Dyb0mJpO9xZRpGnVxTtxaiQl8fagGX5CdxvOlOYB6Rze1r
   AsWdelMNtPM4SBhSfsyAAWV8/baZXfjeSE/JNaZiTLPZ0YjhX+GOz621O
   bQxZcjal/zSDgNGWLdSWtov1MRnHWKnheWVmCC9M1VJ9Dodk4pxiuXU2e
   5ER/vY/Upy13N/+CckQSrrYetXD/DC8cvjHV/oktJRYt4niC7mQ9f/Jf4
   pGATLEAnLEbB9RJHQeRQ3RMmzAVmgHO+COToWGilMvuEdiVeMICS1Yf4v
   dT1cpFKvEwpCduCDJL/wDh84boxLCNgZgcJWKuupRekFfs/JcS2s1XSe1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337111931"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337111931"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 21:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744775048"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744775048"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 21:24:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdO7L-0009nu-0S;
	Sat, 18 Mar 2023 04:24:31 +0000
Date: Sat, 18 Mar 2023 12:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 9/9]
 security/keys/trusted-keys/trusted_core.c:182:40: error: called object type
 'typeof (__SCK__trusted_key_unseal) *' (aka 'struct static_call_key *') is
 not a function or function pointer
Message-ID: <202303181244.5vdWtsUM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   7f7e0649e8daa4d77b60c9f9924def9324036069
commit: 7f7e0649e8daa4d77b60c9f9924def9324036069 [9/9] todo
config: hexagon-randconfig-r045-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181244.5vdWtsUM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=7f7e0649e8daa4d77b60c9f9924def9324036069
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 7f7e0649e8daa4d77b60c9f9924def9324036069
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash security/keys/trusted-keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181244.5vdWtsUM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/keys/trusted-keys/trusted_core.c:10:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from security/keys/trusted-keys/trusted_core.c:10:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from security/keys/trusted-keys/trusted_core.c:10:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> security/keys/trusted-keys/trusted_core.c:182:9: error: use of undeclared identifier '__SCT__trusted_key_unseal'; did you mean '__SCK__trusted_key_unseal'?
                   ret = static_call(trusted_key_unseal)(payload, datablob);
                         ^
   include/linux/static_call.h:215:2: note: expanded from macro 'static_call'
           __static_call(name);                                            \
           ^
   include/linux/static_call.h:271:11: note: expanded from macro '__static_call'
           ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
                    ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:158:1: note: expanded from here
   __SCT__trusted_key_unseal
   ^
   security/keys/trusted-keys/trusted_core.c:49:1: note: '__SCK__trusted_key_unseal' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_unseal,
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:153:1: note: expanded from here
   __SCK__trusted_key_unseal
   ^
>> security/keys/trusted-keys/trusted_core.c:182:40: error: called object type 'typeof (__SCK__trusted_key_unseal) *' (aka 'struct static_call_key *') is not a function or function pointer
                   ret = static_call(trusted_key_unseal)(payload, datablob);
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> security/keys/trusted-keys/trusted_core.c:189:9: error: use of undeclared identifier '__SCT__trusted_key_get_random'; did you mean '__SCK__trusted_key_get_random'?
                   ret = static_call(trusted_key_get_random)(payload->key,
                         ^
   include/linux/static_call.h:215:2: note: expanded from macro 'static_call'
           __static_call(name);                                            \
           ^
   include/linux/static_call.h:271:11: note: expanded from macro '__static_call'
           ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
                    ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:160:1: note: expanded from here
   __SCT__trusted_key_get_random
   ^
   security/keys/trusted-keys/trusted_core.c:51:1: note: '__SCK__trusted_key_get_random' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_get_random,
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:155:1: note: expanded from here
   __SCK__trusted_key_get_random
   ^
>> security/keys/trusted-keys/trusted_core.c:189:44: error: called object type 'typeof (__SCK__trusted_key_get_random) *' (aka 'struct static_call_key *') is not a function or function pointer
                   ret = static_call(trusted_key_get_random)(payload->key,
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> security/keys/trusted-keys/trusted_core.c:200:9: error: use of undeclared identifier '__SCT__trusted_key_seal'; did you mean '__SCK__trusted_key_seal'?
                   ret = static_call(trusted_key_seal)(payload, datablob);
                         ^
   include/linux/static_call.h:215:2: note: expanded from macro 'static_call'
           __static_call(name);                                            \
           ^
   include/linux/static_call.h:271:11: note: expanded from macro '__static_call'
           ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
                    ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:162:1: note: expanded from here
   __SCT__trusted_key_seal
   ^
   security/keys/trusted-keys/trusted_core.c:48:1: note: '__SCK__trusted_key_seal' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:151:1: note: expanded from here
   __SCK__trusted_key_seal
   ^
>> security/keys/trusted-keys/trusted_core.c:200:38: error: called object type 'typeof (__SCK__trusted_key_seal) *' (aka 'struct static_call_key *') is not a function or function pointer
                   ret = static_call(trusted_key_seal)(payload, datablob);
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   security/keys/trusted-keys/trusted_core.c:269:8: error: use of undeclared identifier '__SCT__trusted_key_seal'; did you mean '__SCK__trusted_key_seal'?
           ret = static_call(trusted_key_seal)(new_p, datablob);
                 ^
   include/linux/static_call.h:215:2: note: expanded from macro 'static_call'
           __static_call(name);                                            \
           ^
   include/linux/static_call.h:271:11: note: expanded from macro '__static_call'
           ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
                    ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:174:1: note: expanded from here
   __SCT__trusted_key_seal
   ^
   security/keys/trusted-keys/trusted_core.c:48:1: note: '__SCK__trusted_key_seal' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:151:1: note: expanded from here
   __SCK__trusted_key_seal
   ^
   security/keys/trusted-keys/trusted_core.c:269:37: error: called object type 'typeof (__SCK__trusted_key_seal) *' (aka 'struct static_call_key *') is not a function or function pointer
           ret = static_call(trusted_key_seal)(new_p, datablob);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> security/keys/trusted-keys/trusted_core.c:362:3: error: use of undeclared identifier '__SCT__trusted_key_init'; did you mean '__SCK__trusted_key_init'?
                   static_call_update(trusted_key_init,
                   ^
   include/linux/static_call.h:222:10: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                   ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:185:1: note: expanded from here
   __SCT__trusted_key_init
   ^
   security/keys/trusted-keys/trusted_core.c:47:1: note: '__SCK__trusted_key_init' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_init, *trusted_key_sources[0].ops->init);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:149:1: note: expanded from here
   __SCK__trusted_key_init
   ^
>> security/keys/trusted-keys/trusted_core.c:362:3: error: incompatible pointer types initializing 'typeof (&__SCK__trusted_key_init)' (aka 'struct static_call_key *') with an expression of type 'int (*)(void)' [-Werror,-Wincompatible-pointer-types]
                   static_call_update(trusted_key_init,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:35: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                                            ^     ~~~~~~
   security/keys/trusted-keys/trusted_core.c:364:3: error: use of undeclared identifier '__SCT__trusted_key_seal'; did you mean '__SCK__trusted_key_seal'?
                   static_call_update(trusted_key_seal,
                   ^
   include/linux/static_call.h:222:10: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                   ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:187:1: note: expanded from here
   __SCT__trusted_key_seal
   ^
   security/keys/trusted-keys/trusted_core.c:48:1: note: '__SCK__trusted_key_seal' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:151:1: note: expanded from here
   __SCK__trusted_key_seal
   ^
>> security/keys/trusted-keys/trusted_core.c:364:3: error: incompatible pointer types initializing 'typeof (&__SCK__trusted_key_seal)' (aka 'struct static_call_key *') with an expression of type 'int (*)(struct trusted_key_payload *, char *)' [-Werror,-Wincompatible-pointer-types]
                   static_call_update(trusted_key_seal,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:35: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                                            ^     ~~~~~~
   security/keys/trusted-keys/trusted_core.c:366:3: error: use of undeclared identifier '__SCT__trusted_key_unseal'; did you mean '__SCK__trusted_key_unseal'?
                   static_call_update(trusted_key_unseal,
                   ^
   include/linux/static_call.h:222:10: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                   ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:189:1: note: expanded from here
   __SCT__trusted_key_unseal
   ^
   security/keys/trusted-keys/trusted_core.c:49:1: note: '__SCK__trusted_key_unseal' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_unseal,
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:153:1: note: expanded from here
   __SCK__trusted_key_unseal
   ^
>> security/keys/trusted-keys/trusted_core.c:366:3: error: incompatible pointer types initializing 'typeof (&__SCK__trusted_key_unseal)' (aka 'struct static_call_key *') with an expression of type 'int (*)(struct trusted_key_payload *, char *)' [-Werror,-Wincompatible-pointer-types]
                   static_call_update(trusted_key_unseal,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:35: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                                            ^     ~~~~~~
   security/keys/trusted-keys/trusted_core.c:368:3: error: use of undeclared identifier '__SCT__trusted_key_get_random'; did you mean '__SCK__trusted_key_get_random'?
                   static_call_update(trusted_key_get_random,
                   ^
   include/linux/static_call.h:222:10: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                   ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:191:1: note: expanded from here
   __SCT__trusted_key_get_random
   ^
   security/keys/trusted-keys/trusted_core.c:51:1: note: '__SCK__trusted_key_get_random' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_get_random,
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:155:1: note: expanded from here
   __SCK__trusted_key_get_random
   ^
>> security/keys/trusted-keys/trusted_core.c:368:3: error: incompatible pointer types initializing 'typeof (&__SCK__trusted_key_get_random)' (aka 'struct static_call_key *') with an expression of type 'int (*)(unsigned char *, size_t)' (aka 'int (*)(unsigned char *, unsigned int)') [-Werror,-Wincompatible-pointer-types]
                   static_call_update(trusted_key_get_random,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:35: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                                            ^     ~~~~~~
>> security/keys/trusted-keys/trusted_core.c:370:3: error: use of undeclared identifier '__SCT__trusted_key_exit'; did you mean '__SCK__trusted_key_exit'?
                   static_call_update(trusted_key_exit,
                   ^
   include/linux/static_call.h:222:10: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                   ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:193:1: note: expanded from here
   __SCT__trusted_key_exit
   ^
   security/keys/trusted-keys/trusted_core.c:53:1: note: '__SCK__trusted_key_exit' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_exit, *trusted_key_sources[0].ops->exit);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:157:1: note: expanded from here
   __SCK__trusted_key_exit
   ^
>> security/keys/trusted-keys/trusted_core.c:370:3: error: incompatible pointer types initializing 'typeof (&__SCK__trusted_key_exit)' (aka 'struct static_call_key *') with an expression of type 'void (*)(void)' [-Werror,-Wincompatible-pointer-types]
                   static_call_update(trusted_key_exit,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:35: note: expanded from macro 'static_call_update'
           typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
                                            ^     ~~~~~~
   security/keys/trusted-keys/trusted_core.c:374:9: error: use of undeclared identifier '__SCT__trusted_key_init'; did you mean '__SCK__trusted_key_init'?
                   ret = static_call(trusted_key_init)();
                         ^
   include/linux/static_call.h:215:2: note: expanded from macro 'static_call'
           __static_call(name);                                            \
           ^
   include/linux/static_call.h:271:11: note: expanded from macro '__static_call'
           ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
                    ^
   include/linux/static_call_types.h:22:34: note: expanded from macro 'STATIC_CALL_TRAMP'
   #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:2:1: note: expanded from here
   __SCT__trusted_key_init
   ^
   security/keys/trusted-keys/trusted_core.c:47:1: note: '__SCK__trusted_key_init' declared here
   DEFINE_STATIC_CALL_NULL(trusted_key_init, *trusted_key_sources[0].ops->init);
   ^
   include/linux/static_call.h:165:25: note: expanded from macro 'DEFINE_STATIC_CALL_NULL'
           struct static_call_key STATIC_CALL_KEY(name) = {                \
                                  ^
   include/linux/static_call_types.h:16:32: note: expanded from macro 'STATIC_CALL_KEY'
   #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
                                           ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:149:1: note: expanded from here
   __SCK__trusted_key_init
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.


vim +182 security/keys/trusted-keys/trusted_core.c

5d0682be318910 Sumit Garg      2021-03-01  137  
5d0682be318910 Sumit Garg      2021-03-01  138  /*
5d0682be318910 Sumit Garg      2021-03-01  139   * trusted_instantiate - create a new trusted key
5d0682be318910 Sumit Garg      2021-03-01  140   *
5d0682be318910 Sumit Garg      2021-03-01  141   * Unseal an existing trusted blob or, for a new key, get a
5d0682be318910 Sumit Garg      2021-03-01  142   * random key, then seal and create a trusted key-type key,
5d0682be318910 Sumit Garg      2021-03-01  143   * adding it to the specified keyring.
5d0682be318910 Sumit Garg      2021-03-01  144   *
5d0682be318910 Sumit Garg      2021-03-01  145   * On success, return 0. Otherwise return errno.
5d0682be318910 Sumit Garg      2021-03-01  146   */
5d0682be318910 Sumit Garg      2021-03-01  147  static int trusted_instantiate(struct key *key,
5d0682be318910 Sumit Garg      2021-03-01  148  			       struct key_preparsed_payload *prep)
5d0682be318910 Sumit Garg      2021-03-01  149  {
5d0682be318910 Sumit Garg      2021-03-01  150  	struct trusted_key_payload *payload = NULL;
5d0682be318910 Sumit Garg      2021-03-01  151  	size_t datalen = prep->datalen;
60dc5f1bcfaa9c James Bottomley 2021-04-21  152  	char *datablob, *orig_datablob;
5d0682be318910 Sumit Garg      2021-03-01  153  	int ret = 0;
5d0682be318910 Sumit Garg      2021-03-01  154  	int key_cmd;
5d0682be318910 Sumit Garg      2021-03-01  155  	size_t key_len;
5d0682be318910 Sumit Garg      2021-03-01  156  
5d0682be318910 Sumit Garg      2021-03-01  157  	if (datalen <= 0 || datalen > 32767 || !prep->data)
5d0682be318910 Sumit Garg      2021-03-01  158  		return -EINVAL;
5d0682be318910 Sumit Garg      2021-03-01  159  
60dc5f1bcfaa9c James Bottomley 2021-04-21  160  	orig_datablob = datablob = kmalloc(datalen + 1, GFP_KERNEL);
5d0682be318910 Sumit Garg      2021-03-01  161  	if (!datablob)
5d0682be318910 Sumit Garg      2021-03-01  162  		return -ENOMEM;
5d0682be318910 Sumit Garg      2021-03-01  163  	memcpy(datablob, prep->data, datalen);
5d0682be318910 Sumit Garg      2021-03-01  164  	datablob[datalen] = '\0';
5d0682be318910 Sumit Garg      2021-03-01  165  
5d0682be318910 Sumit Garg      2021-03-01  166  	payload = trusted_payload_alloc(key);
5d0682be318910 Sumit Garg      2021-03-01  167  	if (!payload) {
5d0682be318910 Sumit Garg      2021-03-01  168  		ret = -ENOMEM;
5d0682be318910 Sumit Garg      2021-03-01  169  		goto out;
5d0682be318910 Sumit Garg      2021-03-01  170  	}
5d0682be318910 Sumit Garg      2021-03-01  171  
60dc5f1bcfaa9c James Bottomley 2021-04-21  172  	key_cmd = datablob_parse(&datablob, payload);
5d0682be318910 Sumit Garg      2021-03-01  173  	if (key_cmd < 0) {
5d0682be318910 Sumit Garg      2021-03-01  174  		ret = key_cmd;
5d0682be318910 Sumit Garg      2021-03-01  175  		goto out;
5d0682be318910 Sumit Garg      2021-03-01  176  	}
5d0682be318910 Sumit Garg      2021-03-01  177  
5d0682be318910 Sumit Garg      2021-03-01  178  	dump_payload(payload);
5d0682be318910 Sumit Garg      2021-03-01  179  
5d0682be318910 Sumit Garg      2021-03-01  180  	switch (key_cmd) {
5d0682be318910 Sumit Garg      2021-03-01  181  	case Opt_load:
5d0682be318910 Sumit Garg      2021-03-01 @182  		ret = static_call(trusted_key_unseal)(payload, datablob);
5d0682be318910 Sumit Garg      2021-03-01  183  		dump_payload(payload);
5d0682be318910 Sumit Garg      2021-03-01  184  		if (ret < 0)
5d0682be318910 Sumit Garg      2021-03-01  185  			pr_info("key_unseal failed (%d)\n", ret);
5d0682be318910 Sumit Garg      2021-03-01  186  		break;
5d0682be318910 Sumit Garg      2021-03-01  187  	case Opt_new:
5d0682be318910 Sumit Garg      2021-03-01  188  		key_len = payload->key_len;
5d0682be318910 Sumit Garg      2021-03-01 @189  		ret = static_call(trusted_key_get_random)(payload->key,
5d0682be318910 Sumit Garg      2021-03-01  190  							  key_len);
5d0682be318910 Sumit Garg      2021-03-01  191  		if (ret < 0)
5d0682be318910 Sumit Garg      2021-03-01  192  			goto out;
5d0682be318910 Sumit Garg      2021-03-01  193  
5d0682be318910 Sumit Garg      2021-03-01  194  		if (ret != key_len) {
5d0682be318910 Sumit Garg      2021-03-01  195  			pr_info("key_create failed (%d)\n", ret);
5d0682be318910 Sumit Garg      2021-03-01  196  			ret = -EIO;
5d0682be318910 Sumit Garg      2021-03-01  197  			goto out;
5d0682be318910 Sumit Garg      2021-03-01  198  		}
5d0682be318910 Sumit Garg      2021-03-01  199  
5d0682be318910 Sumit Garg      2021-03-01 @200  		ret = static_call(trusted_key_seal)(payload, datablob);
5d0682be318910 Sumit Garg      2021-03-01  201  		if (ret < 0)
5d0682be318910 Sumit Garg      2021-03-01  202  			pr_info("key_seal failed (%d)\n", ret);
5d0682be318910 Sumit Garg      2021-03-01  203  		break;
5d0682be318910 Sumit Garg      2021-03-01  204  	default:
5d0682be318910 Sumit Garg      2021-03-01  205  		ret = -EINVAL;
5d0682be318910 Sumit Garg      2021-03-01  206  	}
5d0682be318910 Sumit Garg      2021-03-01  207  out:
60dc5f1bcfaa9c James Bottomley 2021-04-21  208  	kfree_sensitive(orig_datablob);
5d0682be318910 Sumit Garg      2021-03-01  209  	if (!ret)
5d0682be318910 Sumit Garg      2021-03-01  210  		rcu_assign_keypointer(key, payload);
5d0682be318910 Sumit Garg      2021-03-01  211  	else
5d0682be318910 Sumit Garg      2021-03-01  212  		kfree_sensitive(payload);
5d0682be318910 Sumit Garg      2021-03-01  213  	return ret;
5d0682be318910 Sumit Garg      2021-03-01  214  }
5d0682be318910 Sumit Garg      2021-03-01  215  
5d0682be318910 Sumit Garg      2021-03-01  216  static void trusted_rcu_free(struct rcu_head *rcu)
5d0682be318910 Sumit Garg      2021-03-01  217  {
5d0682be318910 Sumit Garg      2021-03-01  218  	struct trusted_key_payload *p;
5d0682be318910 Sumit Garg      2021-03-01  219  
5d0682be318910 Sumit Garg      2021-03-01  220  	p = container_of(rcu, struct trusted_key_payload, rcu);
5d0682be318910 Sumit Garg      2021-03-01  221  	kfree_sensitive(p);
5d0682be318910 Sumit Garg      2021-03-01  222  }
5d0682be318910 Sumit Garg      2021-03-01  223  
5d0682be318910 Sumit Garg      2021-03-01  224  /*
5d0682be318910 Sumit Garg      2021-03-01  225   * trusted_update - reseal an existing key with new PCR values
5d0682be318910 Sumit Garg      2021-03-01  226   */
5d0682be318910 Sumit Garg      2021-03-01  227  static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
5d0682be318910 Sumit Garg      2021-03-01  228  {
5d0682be318910 Sumit Garg      2021-03-01  229  	struct trusted_key_payload *p;
5d0682be318910 Sumit Garg      2021-03-01  230  	struct trusted_key_payload *new_p;
5d0682be318910 Sumit Garg      2021-03-01  231  	size_t datalen = prep->datalen;
60dc5f1bcfaa9c James Bottomley 2021-04-21  232  	char *datablob, *orig_datablob;
5d0682be318910 Sumit Garg      2021-03-01  233  	int ret = 0;
5d0682be318910 Sumit Garg      2021-03-01  234  
5d0682be318910 Sumit Garg      2021-03-01  235  	if (key_is_negative(key))
5d0682be318910 Sumit Garg      2021-03-01  236  		return -ENOKEY;
5d0682be318910 Sumit Garg      2021-03-01  237  	p = key->payload.data[0];
5d0682be318910 Sumit Garg      2021-03-01  238  	if (!p->migratable)
5d0682be318910 Sumit Garg      2021-03-01  239  		return -EPERM;
5d0682be318910 Sumit Garg      2021-03-01  240  	if (datalen <= 0 || datalen > 32767 || !prep->data)
5d0682be318910 Sumit Garg      2021-03-01  241  		return -EINVAL;
5d0682be318910 Sumit Garg      2021-03-01  242  
60dc5f1bcfaa9c James Bottomley 2021-04-21  243  	orig_datablob = datablob = kmalloc(datalen + 1, GFP_KERNEL);
5d0682be318910 Sumit Garg      2021-03-01  244  	if (!datablob)
5d0682be318910 Sumit Garg      2021-03-01  245  		return -ENOMEM;
5d0682be318910 Sumit Garg      2021-03-01  246  
5d0682be318910 Sumit Garg      2021-03-01  247  	new_p = trusted_payload_alloc(key);
5d0682be318910 Sumit Garg      2021-03-01  248  	if (!new_p) {
5d0682be318910 Sumit Garg      2021-03-01  249  		ret = -ENOMEM;
5d0682be318910 Sumit Garg      2021-03-01  250  		goto out;
5d0682be318910 Sumit Garg      2021-03-01  251  	}
5d0682be318910 Sumit Garg      2021-03-01  252  
5d0682be318910 Sumit Garg      2021-03-01  253  	memcpy(datablob, prep->data, datalen);
5d0682be318910 Sumit Garg      2021-03-01  254  	datablob[datalen] = '\0';
60dc5f1bcfaa9c James Bottomley 2021-04-21  255  	ret = datablob_parse(&datablob, new_p);
5d0682be318910 Sumit Garg      2021-03-01  256  	if (ret != Opt_update) {
5d0682be318910 Sumit Garg      2021-03-01  257  		ret = -EINVAL;
5d0682be318910 Sumit Garg      2021-03-01  258  		kfree_sensitive(new_p);
5d0682be318910 Sumit Garg      2021-03-01  259  		goto out;
5d0682be318910 Sumit Garg      2021-03-01  260  	}
5d0682be318910 Sumit Garg      2021-03-01  261  
5d0682be318910 Sumit Garg      2021-03-01  262  	/* copy old key values, and reseal with new pcrs */
5d0682be318910 Sumit Garg      2021-03-01  263  	new_p->migratable = p->migratable;
5d0682be318910 Sumit Garg      2021-03-01  264  	new_p->key_len = p->key_len;
5d0682be318910 Sumit Garg      2021-03-01  265  	memcpy(new_p->key, p->key, p->key_len);
5d0682be318910 Sumit Garg      2021-03-01  266  	dump_payload(p);
5d0682be318910 Sumit Garg      2021-03-01  267  	dump_payload(new_p);
5d0682be318910 Sumit Garg      2021-03-01  268  
5d0682be318910 Sumit Garg      2021-03-01  269  	ret = static_call(trusted_key_seal)(new_p, datablob);
5d0682be318910 Sumit Garg      2021-03-01  270  	if (ret < 0) {
5d0682be318910 Sumit Garg      2021-03-01  271  		pr_info("key_seal failed (%d)\n", ret);
5d0682be318910 Sumit Garg      2021-03-01  272  		kfree_sensitive(new_p);
5d0682be318910 Sumit Garg      2021-03-01  273  		goto out;
5d0682be318910 Sumit Garg      2021-03-01  274  	}
5d0682be318910 Sumit Garg      2021-03-01  275  
5d0682be318910 Sumit Garg      2021-03-01  276  	rcu_assign_keypointer(key, new_p);
5d0682be318910 Sumit Garg      2021-03-01  277  	call_rcu(&p->rcu, trusted_rcu_free);
5d0682be318910 Sumit Garg      2021-03-01  278  out:
60dc5f1bcfaa9c James Bottomley 2021-04-21  279  	kfree_sensitive(orig_datablob);
5d0682be318910 Sumit Garg      2021-03-01  280  	return ret;
5d0682be318910 Sumit Garg      2021-03-01  281  }
5d0682be318910 Sumit Garg      2021-03-01  282  
5d0682be318910 Sumit Garg      2021-03-01  283  /*
5d0682be318910 Sumit Garg      2021-03-01  284   * trusted_read - copy the sealed blob data to userspace in hex.
5d0682be318910 Sumit Garg      2021-03-01  285   * On success, return to userspace the trusted key datablob size.
5d0682be318910 Sumit Garg      2021-03-01  286   */
5d0682be318910 Sumit Garg      2021-03-01  287  static long trusted_read(const struct key *key, char *buffer,
5d0682be318910 Sumit Garg      2021-03-01  288  			 size_t buflen)
5d0682be318910 Sumit Garg      2021-03-01  289  {
5d0682be318910 Sumit Garg      2021-03-01  290  	const struct trusted_key_payload *p;
5d0682be318910 Sumit Garg      2021-03-01  291  	char *bufp;
5d0682be318910 Sumit Garg      2021-03-01  292  	int i;
5d0682be318910 Sumit Garg      2021-03-01  293  
5d0682be318910 Sumit Garg      2021-03-01  294  	p = dereference_key_locked(key);
5d0682be318910 Sumit Garg      2021-03-01  295  	if (!p)
5d0682be318910 Sumit Garg      2021-03-01  296  		return -EINVAL;
5d0682be318910 Sumit Garg      2021-03-01  297  
5d0682be318910 Sumit Garg      2021-03-01  298  	if (buffer && buflen >= 2 * p->blob_len) {
5d0682be318910 Sumit Garg      2021-03-01  299  		bufp = buffer;
5d0682be318910 Sumit Garg      2021-03-01  300  		for (i = 0; i < p->blob_len; i++)
5d0682be318910 Sumit Garg      2021-03-01  301  			bufp = hex_byte_pack(bufp, p->blob[i]);
5d0682be318910 Sumit Garg      2021-03-01  302  	}
5d0682be318910 Sumit Garg      2021-03-01  303  	return 2 * p->blob_len;
5d0682be318910 Sumit Garg      2021-03-01  304  }
5d0682be318910 Sumit Garg      2021-03-01  305  
5d0682be318910 Sumit Garg      2021-03-01  306  /*
5d0682be318910 Sumit Garg      2021-03-01  307   * trusted_destroy - clear and free the key's payload
5d0682be318910 Sumit Garg      2021-03-01  308   */
5d0682be318910 Sumit Garg      2021-03-01  309  static void trusted_destroy(struct key *key)
5d0682be318910 Sumit Garg      2021-03-01  310  {
5d0682be318910 Sumit Garg      2021-03-01  311  	kfree_sensitive(key->payload.data[0]);
5d0682be318910 Sumit Garg      2021-03-01  312  }
5d0682be318910 Sumit Garg      2021-03-01  313  
5d0682be318910 Sumit Garg      2021-03-01  314  struct key_type key_type_trusted = {
5d0682be318910 Sumit Garg      2021-03-01  315  	.name = "trusted",
5d0682be318910 Sumit Garg      2021-03-01  316  	.instantiate = trusted_instantiate,
5d0682be318910 Sumit Garg      2021-03-01  317  	.update = trusted_update,
5d0682be318910 Sumit Garg      2021-03-01  318  	.destroy = trusted_destroy,
5d0682be318910 Sumit Garg      2021-03-01  319  	.describe = user_describe,
5d0682be318910 Sumit Garg      2021-03-01  320  	.read = trusted_read,
5d0682be318910 Sumit Garg      2021-03-01  321  };
5d0682be318910 Sumit Garg      2021-03-01  322  EXPORT_SYMBOL_GPL(key_type_trusted);
5d0682be318910 Sumit Garg      2021-03-01  323  
fcd7c26901c836 Ahmad Fatoum    2022-05-13  324  static int kernel_get_random(unsigned char *key, size_t key_len)
fcd7c26901c836 Ahmad Fatoum    2022-05-13  325  {
fcd7c26901c836 Ahmad Fatoum    2022-05-13  326  	return get_random_bytes_wait(key, key_len) ?: key_len;
fcd7c26901c836 Ahmad Fatoum    2022-05-13  327  }
fcd7c26901c836 Ahmad Fatoum    2022-05-13  328  
5d0682be318910 Sumit Garg      2021-03-01  329  static int __init init_trusted(void)
5d0682be318910 Sumit Garg      2021-03-01  330  {
fcd7c26901c836 Ahmad Fatoum    2022-05-13  331  	int (*get_random)(unsigned char *key, size_t key_len);
5d0682be318910 Sumit Garg      2021-03-01  332  	int i, ret = 0;
5d0682be318910 Sumit Garg      2021-03-01  333  
5d0682be318910 Sumit Garg      2021-03-01  334  	for (i = 0; i < ARRAY_SIZE(trusted_key_sources); i++) {
5d0682be318910 Sumit Garg      2021-03-01  335  		if (trusted_key_source &&
5d0682be318910 Sumit Garg      2021-03-01  336  		    strncmp(trusted_key_source, trusted_key_sources[i].name,
5d0682be318910 Sumit Garg      2021-03-01  337  			    strlen(trusted_key_sources[i].name)))
5d0682be318910 Sumit Garg      2021-03-01  338  			continue;
5d0682be318910 Sumit Garg      2021-03-01  339  
fcd7c26901c836 Ahmad Fatoum    2022-05-13  340  		/*
fcd7c26901c836 Ahmad Fatoum    2022-05-13  341  		 * We always support trusted.rng="kernel" and "default" as
fcd7c26901c836 Ahmad Fatoum    2022-05-13  342  		 * well as trusted.rng=$trusted.source if the trust source
fcd7c26901c836 Ahmad Fatoum    2022-05-13  343  		 * defines its own get_random callback.
fcd7c26901c836 Ahmad Fatoum    2022-05-13  344  		 */
fcd7c26901c836 Ahmad Fatoum    2022-05-13  345  		get_random = trusted_key_sources[i].ops->get_random;
fcd7c26901c836 Ahmad Fatoum    2022-05-13  346  		if (trusted_rng && strcmp(trusted_rng, "default")) {
fcd7c26901c836 Ahmad Fatoum    2022-05-13  347  			if (!strcmp(trusted_rng, "kernel")) {
fcd7c26901c836 Ahmad Fatoum    2022-05-13  348  				get_random = kernel_get_random;
fcd7c26901c836 Ahmad Fatoum    2022-05-13  349  			} else if (strcmp(trusted_rng, trusted_key_sources[i].name) ||
fcd7c26901c836 Ahmad Fatoum    2022-05-13  350  				   !get_random) {
fcd7c26901c836 Ahmad Fatoum    2022-05-13  351  				pr_warn("Unsupported RNG. Supported: kernel");
fcd7c26901c836 Ahmad Fatoum    2022-05-13  352  				if (get_random)
fcd7c26901c836 Ahmad Fatoum    2022-05-13  353  					pr_cont(", %s", trusted_key_sources[i].name);
fcd7c26901c836 Ahmad Fatoum    2022-05-13  354  				pr_cont(", default\n");
fcd7c26901c836 Ahmad Fatoum    2022-05-13  355  				return -EINVAL;
fcd7c26901c836 Ahmad Fatoum    2022-05-13  356  			}
fcd7c26901c836 Ahmad Fatoum    2022-05-13  357  		}
fcd7c26901c836 Ahmad Fatoum    2022-05-13  358  
fcd7c26901c836 Ahmad Fatoum    2022-05-13  359  		if (!get_random)
fcd7c26901c836 Ahmad Fatoum    2022-05-13  360  			get_random = kernel_get_random;
fcd7c26901c836 Ahmad Fatoum    2022-05-13  361  
5d0682be318910 Sumit Garg      2021-03-01 @362  		static_call_update(trusted_key_init,
5d0682be318910 Sumit Garg      2021-03-01  363  				   trusted_key_sources[i].ops->init);
5d0682be318910 Sumit Garg      2021-03-01 @364  		static_call_update(trusted_key_seal,
5d0682be318910 Sumit Garg      2021-03-01  365  				   trusted_key_sources[i].ops->seal);
5d0682be318910 Sumit Garg      2021-03-01 @366  		static_call_update(trusted_key_unseal,
5d0682be318910 Sumit Garg      2021-03-01  367  				   trusted_key_sources[i].ops->unseal);
5d0682be318910 Sumit Garg      2021-03-01 @368  		static_call_update(trusted_key_get_random,
fcd7c26901c836 Ahmad Fatoum    2022-05-13  369  				   get_random);
5d0682be318910 Sumit Garg      2021-03-01 @370  		static_call_update(trusted_key_exit,
5d0682be318910 Sumit Garg      2021-03-01  371  				   trusted_key_sources[i].ops->exit);
5d0682be318910 Sumit Garg      2021-03-01  372  		migratable = trusted_key_sources[i].ops->migratable;
5d0682be318910 Sumit Garg      2021-03-01  373  
5d0682be318910 Sumit Garg      2021-03-01  374  		ret = static_call(trusted_key_init)();
5d0682be318910 Sumit Garg      2021-03-01  375  		if (!ret)
5d0682be318910 Sumit Garg      2021-03-01  376  			break;
5d0682be318910 Sumit Garg      2021-03-01  377  	}
5d0682be318910 Sumit Garg      2021-03-01  378  
5d0682be318910 Sumit Garg      2021-03-01  379  	/*
5d0682be318910 Sumit Garg      2021-03-01  380  	 * encrypted_keys.ko depends on successful load of this module even if
5d0682be318910 Sumit Garg      2021-03-01  381  	 * trusted key implementation is not found.
5d0682be318910 Sumit Garg      2021-03-01  382  	 */
5d0682be318910 Sumit Garg      2021-03-01  383  	if (ret == -ENODEV)
5d0682be318910 Sumit Garg      2021-03-01  384  		return 0;
5d0682be318910 Sumit Garg      2021-03-01  385  
5d0682be318910 Sumit Garg      2021-03-01  386  	return ret;
5d0682be318910 Sumit Garg      2021-03-01  387  }
5d0682be318910 Sumit Garg      2021-03-01  388  

:::::: The code at line 182 was first introduced by commit
:::::: 5d0682be318910e028bdf57c90a1695ffc34be37 KEYS: trusted: Add generic trusted keys framework

:::::: TO: Sumit Garg <sumit.garg@linaro.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
