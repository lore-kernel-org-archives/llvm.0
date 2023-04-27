Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642115BB;
	Thu, 27 Apr 2023 04:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682569410; x=1714105410;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+JVUicbGRlXKoDuBYFuADH066Z532u+M6owmQbo0hN4=;
  b=FOOFivsN4HQ7z/r/QoIwU4sUSUZN9Um3EHDMO+vsJsNYuVKbpD1sIoHH
   2DtRTMQsJCX5UmQNzKiZS7bUdbUefowoP5D8w7rQldOaij4k1J9DjDDP3
   zFemkTsySWZwhkGltHFzT7P7PD8Jv6xrmcp0qhqGbVGc91pm0Ss3c0iiT
   S3bJpiS2omPjehU4lPqwTMcDncH3mmi95D2BHyw3O7fd/jPObdE1j7RI9
   gKP7/ecDl1FN1r1hNI5Jz5F97AcmAX9X+6jXEKH9nrdndYclcDStQG4Rf
   hEhYwiJ6q593UNekESt19v50DB+f9znCXk4EVmITKgRuuGj7NdiM7CDSD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344769964"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="344769964"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 21:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694215743"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694215743"
Received: from lkp-server01.sh.intel.com (HELO 848ce1e85e7c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Apr 2023 21:23:28 -0700
Received: from kbuild by 848ce1e85e7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prtAF-00003t-33;
	Thu, 27 Apr 2023 04:23:27 +0000
Date: Thu, 27 Apr 2023 12:23:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x34a:
 relocation to !ENDBR: crypto_rfc4106_init_tfm+0x0
Message-ID: <202304271229.xxhmoQsl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Seth Forshee <seth.forshee@canonical.com>
CC: "Kernel Builder (sita)" <ubuntu-kernel-bot@canonical.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: b06702233df3633b40f482180679a44422e916c5 UBUNTU: SAUCE: kbuild: add -fcf-protection=none when using retpoline flags
date:   10 days ago
config: x86_64-randconfig-k001 (https://download.01.org/0day-ci/archive/20230427/202304271229.xxhmoQsl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=b06702233df3633b40f482180679a44422e916c5
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout b06702233df3633b40f482180679a44422e916c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271229.xxhmoQsl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/gcm.c:8:
   In file included from include/crypto/gf128mul.h:54:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:10:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
>> crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x34a: relocation to !ENDBR: crypto_rfc4106_init_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x375: relocation to !ENDBR: crypto_rfc4106_exit_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x39c: relocation to !ENDBR: crypto_rfc4106_setkey+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x3c4: relocation to !ENDBR: crypto_rfc4106_setauthsize+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x3ef: relocation to !ENDBR: crypto_rfc4106_encrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x417: relocation to !ENDBR: crypto_rfc4106_decrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4106_create+0x434: relocation to !ENDBR: crypto_rfc4106_free+0x0
>> crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x34a: relocation to !ENDBR: crypto_rfc4543_init_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x375: relocation to !ENDBR: crypto_rfc4543_exit_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x39c: relocation to !ENDBR: crypto_rfc4543_setkey+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x3c4: relocation to !ENDBR: crypto_rfc4543_setauthsize+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x3ef: relocation to !ENDBR: crypto_rfc4543_encrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x417: relocation to !ENDBR: crypto_rfc4543_decrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_rfc4543_create+0x434: relocation to !ENDBR: crypto_rfc4543_free+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x4d6: relocation to !ENDBR: crypto_gcm_init_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x501: relocation to !ENDBR: crypto_gcm_exit_tfm+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x527: relocation to !ENDBR: crypto_gcm_setkey+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x545: relocation to !ENDBR: crypto_gcm_setauthsize+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x563: relocation to !ENDBR: crypto_gcm_encrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x581: relocation to !ENDBR: crypto_gcm_decrypt+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_create_common+0x59e: relocation to !ENDBR: crypto_gcm_free+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x2d3: relocation to !ENDBR: gcm_encrypt_done+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x460: relocation to !ENDBR: gcm_enc_copy_hash+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_encrypt+0x529: relocation to !ENDBR: gcm_hash_init_done+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_decrypt+0x15a: relocation to !ENDBR: gcm_dec_hash_continue+0x0
   crypto/gcm.o: warning: objtool: crypto_gcm_decrypt+0x21f: relocation to !ENDBR: gcm_hash_init_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_encrypt_done+0x160: relocation to !ENDBR: gcm_enc_copy_hash+0x0
   crypto/gcm.o: warning: objtool: gcm_encrypt_done+0x22f: relocation to !ENDBR: gcm_hash_init_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_hash_init_continue+0xf1: relocation to !ENDBR: gcm_hash_assoc_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_init_continue+0x2a6: relocation to !ENDBR: gcm_hash_assoc_remain_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_hash_assoc_done+0xcc: relocation to !ENDBR: gcm_hash_assoc_remain_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_hash_assoc_remain_continue+0xea: relocation to !ENDBR: gcm_hash_crypt_done+0x0
   crypto/gcm.o: warning: objtool: gcm_hash_assoc_remain_continue+0x2b1: relocation to !ENDBR: gcm_hash_crypt_remain_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_hash_crypt_done+0xd1: relocation to !ENDBR: gcm_hash_crypt_remain_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_hash_crypt_remain_continue+0x176: relocation to !ENDBR: gcm_hash_len_done+0x0
>> crypto/gcm.o: warning: objtool: gcm_dec_hash_continue+0x212: relocation to !ENDBR: gcm_decrypt_done+0x0
   crypto/gcm.o: warning: objtool: __UNIQUE_ID___addressable_init_module701+0x0: data relocation to !ENDBR: init_module+0x0
   crypto/gcm.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module702+0x0: data relocation to !ENDBR: cleanup_module+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x20: data relocation to !ENDBR: crypto_gcm_base_create+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0xc8: data relocation to !ENDBR: crypto_gcm_create+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x170: data relocation to !ENDBR: crypto_rfc4106_create+0x0
>> crypto/gcm.o: warning: objtool: crypto_gcm_tmpls+0x218: data relocation to !ENDBR: crypto_rfc4543_create+0x0
>> crypto/gcm.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
>> crypto/gcm.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
--
   In file included from crypto/ghash-generic.c:37:
   In file included from include/crypto/algapi.h:11:
   In file included from include/linux/cache.h:6:
   In file included from arch/x86/include/asm/cache.h:5:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
>> crypto/ghash-generic.o: warning: objtool: __UNIQUE_ID___addressable_init_module492+0x0: data relocation to !ENDBR: init_module+0x0
>> crypto/ghash-generic.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module493+0x0: data relocation to !ENDBR: cleanup_module+0x0
>> crypto/ghash-generic.o: warning: objtool: ghash_alg+0x0: data relocation to !ENDBR: ghash_init+0x0
>> crypto/ghash-generic.o: warning: objtool: ghash_alg+0x8: data relocation to !ENDBR: ghash_update+0x0
>> crypto/ghash-generic.o: warning: objtool: ghash_alg+0x10: data relocation to !ENDBR: ghash_final+0x0
>> crypto/ghash-generic.o: warning: objtool: ghash_alg+0x38: data relocation to !ENDBR: ghash_setkey+0x0
>> crypto/ghash-generic.o: warning: objtool: ghash_alg+0x1c8: data relocation to !ENDBR: ghash_exit_tfm+0x0
>> crypto/ghash-generic.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
>> crypto/ghash-generic.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0
--
   In file included from kernel/locking/locktorture.c:14:
   In file included from include/linux/kernel.h:17:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   arch/x86/include/asm/ibt.h:77:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr u64 ibt_save(bool disable);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   arch/x86/include/asm/ibt.h:78:8: warning: 'nocf_check' attribute ignored; use -fcf-protection to enable the attribute [-Wignored-attributes]
   extern __noendbr void ibt_restore(u64 save);
          ^
   arch/x86/include/asm/ibt.h:32:34: note: expanded from macro '__noendbr'
   #define __noendbr       __attribute__((nocf_check))
                                          ^
   2 warnings generated.
   kernel/locking/locktorture.o: warning: objtool: init_module+0x516: relocation to !ENDBR: lock_torture_cleanup+0x0
   kernel/locking/locktorture.o: warning: objtool: init_module+0x5fb: relocation to !ENDBR: lock_torture_writer+0x0
   kernel/locking/locktorture.o: warning: objtool: init_module+0x674: relocation to !ENDBR: lock_torture_reader+0x0
   kernel/locking/locktorture.o: warning: objtool: init_module+0x6d5: relocation to !ENDBR: lock_torture_stats+0x0
   kernel/locking/locktorture.o: warning: objtool: lock_busted_ops+0x10: data relocation to !ENDBR: torture_lock_busted_write_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: lock_busted_ops+0x18: data relocation to !ENDBR: torture_lock_busted_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: lock_busted_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: lock_busted_ops+0x28: data relocation to !ENDBR: torture_lock_busted_write_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_ops+0x10: data relocation to !ENDBR: torture_spin_lock_write_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_ops+0x18: data relocation to !ENDBR: torture_spin_lock_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_ops+0x28: data relocation to !ENDBR: torture_spin_lock_write_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_irq_ops+0x10: data relocation to !ENDBR: torture_spin_lock_write_lock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_irq_ops+0x18: data relocation to !ENDBR: torture_spin_lock_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_irq_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: spin_lock_irq_ops+0x28: data relocation to !ENDBR: torture_lock_spin_write_unlock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x10: data relocation to !ENDBR: torture_rwlock_write_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x18: data relocation to !ENDBR: torture_rwlock_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x28: data relocation to !ENDBR: torture_rwlock_write_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x30: data relocation to !ENDBR: torture_rwlock_read_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x38: data relocation to !ENDBR: torture_rwlock_read_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_ops+0x40: data relocation to !ENDBR: torture_rwlock_read_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x10: data relocation to !ENDBR: torture_rwlock_write_lock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x18: data relocation to !ENDBR: torture_rwlock_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x28: data relocation to !ENDBR: torture_rwlock_write_unlock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x30: data relocation to !ENDBR: torture_rwlock_read_lock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x38: data relocation to !ENDBR: torture_rwlock_read_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rw_lock_irq_ops+0x40: data relocation to !ENDBR: torture_rwlock_read_unlock_irq+0x0
   kernel/locking/locktorture.o: warning: objtool: mutex_lock_ops+0x10: data relocation to !ENDBR: torture_mutex_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: mutex_lock_ops+0x18: data relocation to !ENDBR: torture_mutex_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: mutex_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: mutex_lock_ops+0x28: data relocation to !ENDBR: torture_mutex_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x0: data relocation to !ENDBR: torture_ww_mutex_init+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x8: data relocation to !ENDBR: torture_ww_mutex_exit+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x10: data relocation to !ENDBR: torture_ww_mutex_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x18: data relocation to !ENDBR: torture_mutex_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: ww_mutex_lock_ops+0x28: data relocation to !ENDBR: torture_ww_mutex_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: rtmutex_lock_ops+0x10: data relocation to !ENDBR: torture_rtmutex_lock+0x0
   kernel/locking/locktorture.o: warning: objtool: rtmutex_lock_ops+0x18: data relocation to !ENDBR: torture_rtmutex_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rtmutex_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost_rtmutex+0x0
   kernel/locking/locktorture.o: warning: objtool: rtmutex_lock_ops+0x28: data relocation to !ENDBR: torture_rtmutex_unlock+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x10: data relocation to !ENDBR: torture_rwsem_down_write+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x18: data relocation to !ENDBR: torture_rwsem_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x28: data relocation to !ENDBR: torture_rwsem_up_write+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x30: data relocation to !ENDBR: torture_rwsem_down_read+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x38: data relocation to !ENDBR: torture_rwsem_read_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: rwsem_lock_ops+0x40: data relocation to !ENDBR: torture_rwsem_up_read+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x0: data relocation to !ENDBR: torture_percpu_rwsem_init+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x8: data relocation to !ENDBR: torture_percpu_rwsem_exit+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x10: data relocation to !ENDBR: torture_percpu_rwsem_down_write+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x18: data relocation to !ENDBR: torture_rwsem_write_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x20: data relocation to !ENDBR: torture_rt_boost+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x28: data relocation to !ENDBR: torture_percpu_rwsem_up_write+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x30: data relocation to !ENDBR: torture_percpu_rwsem_down_read+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x38: data relocation to !ENDBR: torture_rwsem_read_delay+0x0
   kernel/locking/locktorture.o: warning: objtool: percpu_rwsem_lock_ops+0x40: data relocation to !ENDBR: torture_percpu_rwsem_up_read+0x0
>> kernel/locking/locktorture.o: warning: objtool: __UNIQUE_ID___addressable_init_module613+0x0: data relocation to !ENDBR: init_module+0x0
>> kernel/locking/locktorture.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module614+0x0: data relocation to !ENDBR: lock_torture_cleanup+0x0
   kernel/locking/locktorture.o: warning: objtool: .init_array.1+0x0: data relocation to !ENDBR: asan.module_ctor+0x0
   kernel/locking/locktorture.o: warning: objtool: .fini_array.1+0x0: data relocation to !ENDBR: asan.module_dtor+0x0


objdump-func vmlinux.o crypto_rfc4106_create:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
