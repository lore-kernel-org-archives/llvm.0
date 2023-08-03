Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8D13AFD;
	Thu,  3 Aug 2023 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691050083; x=1722586083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f3c/fnT9kwrSgc1nZc6dAH78XzrIJqBTvFEFFM8uLaE=;
  b=S5LYdqhZpPTdSMekEBMN7wEpFeQuwtkSpntPYgf1F2dgVikIo3mpkoc8
   +l1lrp4yi2rH08grj+n7fpGDUuDU58abzPmi5/89hMnIC3Vj0ZJlW3wzK
   d2N3s5y03MR+XLTX+dRUG8rPgfgCRsb9m4MYsb+pmqpCs87m3GPlT5N8R
   TB33CeP2pIHH6yLjYNASPAVxm+bLMdVZQ+RpD6SoxmbaRjirXzOAxw0SU
   aROfI26AUmp+VGBkSFJKNO5HwRZJywLEG1BCIfvcGVKAD3Q07M2ESDQMi
   osHarMqSFKoqMxNRj0jadRADXR8hA+Fxl2hGnXuToCt5TCy14n9P06fJj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367259624"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="367259624"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975973947"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="975973947"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 01:08:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRTNI-0001tD-2Z;
	Thu, 03 Aug 2023 08:08:00 +0000
Date: Thu, 3 Aug 2023 16:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Florent Revest <revest@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] crypto: Defer transforms destruction to a worker
 function
Message-ID: <202308031541.Oa9qeIe2-lkp@intel.com>
References: <20230802170923.1151605-2-revest@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802170923.1151605-2-revest@chromium.org>

Hi Florent,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.5-rc4 next-20230803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florent-Revest/crypto-Defer-transforms-destruction-to-a-worker-function/20230803-011553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230802170923.1151605-2-revest%40chromium.org
patch subject: [RFC 1/1] crypto: Defer transforms destruction to a worker function
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230803/202308031541.Oa9qeIe2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031541.Oa9qeIe2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031541.Oa9qeIe2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/api.c:24:
   In file included from crypto/internal.h:21:
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
   In file included from crypto/api.c:24:
   In file included from crypto/internal.h:21:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/api.c:24:
   In file included from crypto/internal.h:21:
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
>> crypto/api.c:643:6: warning: no previous prototype for function 'crypto_destroy_tfm_workfn' [-Wmissing-prototypes]
     643 | void crypto_destroy_tfm_workfn(struct work_struct *w)
         |      ^
   crypto/api.c:643:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     643 | void crypto_destroy_tfm_workfn(struct work_struct *w)
         | ^
         | static 
   13 warnings generated.


vim +/crypto_destroy_tfm_workfn +643 crypto/api.c

   642	
 > 643	void crypto_destroy_tfm_workfn(struct work_struct *w)
   644	{
   645		struct crypto_alg *alg;
   646		struct crypto_tfm *tfm;
   647	
   648		tfm = container_of(w, struct crypto_tfm, free_work);
   649		alg = tfm->__crt_alg;
   650	
   651		if (!tfm->exit && alg->cra_exit)
   652			alg->cra_exit(tfm);
   653		crypto_exit_ops(tfm);
   654		crypto_mod_put(alg);
   655		kfree_sensitive(tfm->to_free);
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
