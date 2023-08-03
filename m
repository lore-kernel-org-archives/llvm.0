Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EA15AD4;
	Thu,  3 Aug 2023 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056886; x=1722592886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Oy7zDHpZ/ELAjEj3aq+xJGJolwr/niru3HYDczMoe0=;
  b=AP6S0AdN/kscaHqe8aWm1x1qRSWVyoP4GNY9RS6bRiLAljkPiqRIMCF7
   viCkTTlcE3t2ea8XhMtAoZCoA38KohAhiVnDVsAYVxG5rByC3KBaV0Nea
   fodkDNe9KpoHALsLchR342Tw63zbeCVXqqpCTWKVG6LxU54t4yOvXV87a
   zonV+qCrvGRJ2/xSfrp3HW9PfAf0oefg6KFnvDLMoLPaI+NgfeVMv0e0S
   /rLuw5X+mwefIUCZfFrHwfxIamUvccnyxiqNrZTHdFB7CmxtfgqGFleuA
   hcT4OKm4F3t51HNHS84c1+nMGlpm+2Z4L7oa25p1jrxZOuntuhtRt3ah6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368730539"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368730539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872873165"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 03:01:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRV8w-00021n-0H;
	Thu, 03 Aug 2023 10:01:18 +0000
Date: Thu, 3 Aug 2023 18:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:master 3/11]
 security/integrity/ima/ima_crypto.c:785:39: error: too few arguments to
 function call, expected 4, have 3
Message-ID: <202308031742.PHxsqvbd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   2c6af65af490b1352a9feefa0eae5cf42f7021b3
commit: dc4782c1543a065f02c00a47aa03e336f9990ba8 [3/11] sysctl: set variable key_sysctls storage-class-specifier to static
config: um-randconfig-r003-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031742.PHxsqvbd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031742.PHxsqvbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031742.PHxsqvbd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_crypto.c:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from security/integrity/ima/ima_crypto.c:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from security/integrity/ima/ima_crypto.c:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> security/integrity/ima/ima_crypto.c:785:39: error: too few arguments to function call, expected 4, have 3
     785 |         if (tpm_pcr_read(ima_tpm_chip, idx, d) != 0)
         |             ~~~~~~~~~~~~                     ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/tpm.h:441:19: note: 'tpm_pcr_read' declared here
     441 | static inline int tpm_pcr_read(struct tpm_chip *chip, int pcr_idx,
         |                   ^
>> security/integrity/ima/ima_crypto.c:785:39: error: too few arguments to function call, expected 4, have 3
     785 |         if (tpm_pcr_read(ima_tpm_chip, idx, d) != 0)
         |             ~~~~~~~~~~~~                     ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/tpm.h:441:19: note: 'tpm_pcr_read' declared here
     441 | static inline int tpm_pcr_read(struct tpm_chip *chip, int pcr_idx,
         |                   ^
>> security/integrity/ima/ima_crypto.c:785:39: error: too few arguments to function call, expected 4, have 3
     785 |         if (tpm_pcr_read(ima_tpm_chip, idx, d) != 0)
         |             ~~~~~~~~~~~~                     ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/tpm.h:441:19: note: 'tpm_pcr_read' declared here
     441 | static inline int tpm_pcr_read(struct tpm_chip *chip, int pcr_idx,
         |                   ^
   12 warnings and 3 errors generated.


vim +785 security/integrity/ima/ima_crypto.c

98304bcf71845e Mimi Zohar    2015-12-28  779  
8b8c704d913b0f Roberto Sassu 2020-06-07  780  static void ima_pcrread(u32 idx, struct tpm_digest *d)
3323eec921efd8 Mimi Zohar    2009-02-04  781  {
ec403d8ed08c82 Stefan Berger 2018-06-26  782  	if (!ima_tpm_chip)
3323eec921efd8 Mimi Zohar    2009-02-04  783  		return;
3323eec921efd8 Mimi Zohar    2009-02-04  784  
879b589210a9a0 Roberto Sassu 2019-02-06 @785  	if (tpm_pcr_read(ima_tpm_chip, idx, d) != 0)
20ee451f5a7cd4 Joe Perches   2014-02-24  786  		pr_err("Error Communicating to TPM chip\n");
3323eec921efd8 Mimi Zohar    2009-02-04  787  }
3323eec921efd8 Mimi Zohar    2009-02-04  788  

:::::: The code at line 785 was first introduced by commit
:::::: 879b589210a9a0c9f77d301aaf0ddee20f2c5052 tpm: retrieve digest size of unknown algorithms with PCR read

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
