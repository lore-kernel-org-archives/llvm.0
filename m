Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A181017D4;
	Sun,  7 May 2023 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683434915; x=1714970915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TTda1JPjdVsbb7//3oz3gaHhS6vo/p6lCwA5oO2D5Lo=;
  b=Hf4ZANZUy1lRPkBud24SFtNkMAOGH7jTyE1UgunHZrLDwgrbRiDe6Do9
   yNDZibUTIrsCERoqZ1lgoxlduOQMGUkMGu9Kp7QwQGeSuDhl6TAlGDuHF
   QiESGeeMNrh+vNSQsxsHUHvyGXwKSy7zzzJAMxeAVt9U8yqj77MiWl3AJ
   eUedPr+SZNmKlQzm+WbzTNNd4b8+3DEi8S62V33sgiBJ7uLijHW85Ud5/
   84K4F0ICanvI/ZWfTWBZk6V7kDeWSWYIWVND69Y1HIdYOoUG+uGmhfznp
   S9G3Q2C/ODZv5+/ePknaSFoK5RUaSf7Id8AMfKfwms2p6CNoKoiDDfsUx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435767181"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435767181"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 21:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692204453"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="692204453"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 21:48:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvWJv-0000cH-1S;
	Sun, 07 May 2023 04:48:27 +0000
Date: Sun, 7 May 2023 12:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs
 inode iterator
Message-ID: <202305071235.jHQfYz09-lkp@intel.com>
References: <20230507040107.3755166-3-houtao@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507040107.3755166-3-houtao@huaweicloud.com>

Hi Hou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]
[also build test ERROR on linus/master]
[cannot apply to bpf-next/master akpm-mm/mm-everything v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230507040107.3755166-3-houtao%40huaweicloud.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs inode iterator
config: s390-randconfig-r044-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071235.jHQfYz09-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/93ea1c2e394182d3547673f69a808b8c1fa994e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
        git checkout 93ea1c2e394182d3547673f69a808b8c1fa994e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071235.jHQfYz09-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/kvm/gaccess.c:493:2: error: expected identifier
           PROT_NONE,
           ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
   #define PROT_NONE       0x0             /* page can not be accessed */
                           ^
>> arch/s390/kvm/gaccess.c:516:8: error: duplicate case value: '0' and 'PROT_TYPE_LA' both equal '0'
                   case PROT_TYPE_LA:
                        ^
   arch/s390/kvm/gaccess.c:509:8: note: previous case defined here
                   case PROT_NONE:
                        ^
   include/uapi/asm-generic/mman-common.h:16:19: note: expanded from macro 'PROT_NONE'
   #define PROT_NONE       0x0             /* page can not be accessed */
                           ^
   12 warnings and 2 errors generated.


vim +493 arch/s390/kvm/gaccess.c

664b4973537068 Alexander Yarygin        2015-03-09  485  
d03193de30e6d9 David Hildenbrand        2016-05-31  486  enum prot_type {
d03193de30e6d9 David Hildenbrand        2016-05-31  487  	PROT_TYPE_LA   = 0,
d03193de30e6d9 David Hildenbrand        2016-05-31  488  	PROT_TYPE_KEYC = 1,
d03193de30e6d9 David Hildenbrand        2016-05-31  489  	PROT_TYPE_ALC  = 2,
d03193de30e6d9 David Hildenbrand        2016-05-31  490  	PROT_TYPE_DAT  = 3,
6ae1574c2a24ee Christian Borntraeger    2017-06-07  491  	PROT_TYPE_IEP  = 4,
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  492  	/* Dummy value for passing an initialized value when code != PGM_PROTECTION */
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25 @493  	PROT_NONE,
d03193de30e6d9 David Hildenbrand        2016-05-31  494  };
d03193de30e6d9 David Hildenbrand        2016-05-31  495  
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  496  static int trans_exc_ending(struct kvm_vcpu *vcpu, int code, unsigned long gva, u8 ar,
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  497  			    enum gacc_mode mode, enum prot_type prot, bool terminate)
d03193de30e6d9 David Hildenbrand        2016-05-31  498  {
d03193de30e6d9 David Hildenbrand        2016-05-31  499  	struct kvm_s390_pgm_info *pgm = &vcpu->arch.pgm;
d03193de30e6d9 David Hildenbrand        2016-05-31  500  	struct trans_exc_code_bits *tec;
d03193de30e6d9 David Hildenbrand        2016-05-31  501  
d03193de30e6d9 David Hildenbrand        2016-05-31  502  	memset(pgm, 0, sizeof(*pgm));
d03193de30e6d9 David Hildenbrand        2016-05-31  503  	pgm->code = code;
d03193de30e6d9 David Hildenbrand        2016-05-31  504  	tec = (struct trans_exc_code_bits *)&pgm->trans_exc_code;
d03193de30e6d9 David Hildenbrand        2016-05-31  505  
d03193de30e6d9 David Hildenbrand        2016-05-31  506  	switch (code) {
c14b88d76624e0 Janosch Frank            2016-07-29  507  	case PGM_PROTECTION:
c14b88d76624e0 Janosch Frank            2016-07-29  508  		switch (prot) {
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  509  		case PROT_NONE:
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  510  			/* We should never get here, acts like termination */
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  511  			WARN_ON_ONCE(1);
b3cefd6bf16e72 Janis Schoetterl-Glausch 2022-08-25  512  			break;
6ae1574c2a24ee Christian Borntraeger    2017-06-07  513  		case PROT_TYPE_IEP:
6ae1574c2a24ee Christian Borntraeger    2017-06-07  514  			tec->b61 = 1;
3b684a420bd8a2 Joe Perches              2020-03-10  515  			fallthrough;
a679c547d19ded Christian Borntraeger    2016-12-15 @516  		case PROT_TYPE_LA:
a679c547d19ded Christian Borntraeger    2016-12-15  517  			tec->b56 = 1;
a679c547d19ded Christian Borntraeger    2016-12-15  518  			break;
a679c547d19ded Christian Borntraeger    2016-12-15  519  		case PROT_TYPE_KEYC:
a679c547d19ded Christian Borntraeger    2016-12-15  520  			tec->b60 = 1;
a679c547d19ded Christian Borntraeger    2016-12-15  521  			break;
c14b88d76624e0 Janosch Frank            2016-07-29  522  		case PROT_TYPE_ALC:
c14b88d76624e0 Janosch Frank            2016-07-29  523  			tec->b60 = 1;
3b684a420bd8a2 Joe Perches              2020-03-10  524  			fallthrough;
c14b88d76624e0 Janosch Frank            2016-07-29  525  		case PROT_TYPE_DAT:
c14b88d76624e0 Janosch Frank            2016-07-29  526  			tec->b61 = 1;
c14b88d76624e0 Janosch Frank            2016-07-29  527  			break;
c14b88d76624e0 Janosch Frank            2016-07-29  528  		}
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  529  		if (terminate) {
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  530  			tec->b56 = 0;
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  531  			tec->b60 = 0;
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  532  			tec->b61 = 0;
c783631b0bffe6 Janis Schoetterl-Glausch 2022-05-12  533  		}
3b684a420bd8a2 Joe Perches              2020-03-10  534  		fallthrough;
d03193de30e6d9 David Hildenbrand        2016-05-31  535  	case PGM_ASCE_TYPE:
d03193de30e6d9 David Hildenbrand        2016-05-31  536  	case PGM_PAGE_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  537  	case PGM_REGION_FIRST_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  538  	case PGM_REGION_SECOND_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  539  	case PGM_REGION_THIRD_TRANS:
d03193de30e6d9 David Hildenbrand        2016-05-31  540  	case PGM_SEGMENT_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  541  		/*
d03193de30e6d9 David Hildenbrand        2016-05-31  542  		 * op_access_id only applies to MOVE_PAGE -> set bit 61
d03193de30e6d9 David Hildenbrand        2016-05-31  543  		 * exc_access_id has to be set to 0 for some instructions. Both
c14b88d76624e0 Janosch Frank            2016-07-29  544  		 * cases have to be handled by the caller.
d03193de30e6d9 David Hildenbrand        2016-05-31  545  		 */
d03193de30e6d9 David Hildenbrand        2016-05-31  546  		tec->addr = gva >> PAGE_SHIFT;
d03193de30e6d9 David Hildenbrand        2016-05-31  547  		tec->fsi = mode == GACC_STORE ? FSI_STORE : FSI_FETCH;
d03193de30e6d9 David Hildenbrand        2016-05-31  548  		tec->as = psw_bits(vcpu->arch.sie_block->gpsw).as;
3b684a420bd8a2 Joe Perches              2020-03-10  549  		fallthrough;
d03193de30e6d9 David Hildenbrand        2016-05-31  550  	case PGM_ALEN_TRANSLATION:
d03193de30e6d9 David Hildenbrand        2016-05-31  551  	case PGM_ALE_SEQUENCE:
d03193de30e6d9 David Hildenbrand        2016-05-31  552  	case PGM_ASTE_VALIDITY:
d03193de30e6d9 David Hildenbrand        2016-05-31  553  	case PGM_ASTE_SEQUENCE:
d03193de30e6d9 David Hildenbrand        2016-05-31  554  	case PGM_EXTENDED_AUTHORITY:
c14b88d76624e0 Janosch Frank            2016-07-29  555  		/*
c14b88d76624e0 Janosch Frank            2016-07-29  556  		 * We can always store exc_access_id, as it is
c14b88d76624e0 Janosch Frank            2016-07-29  557  		 * undefined for non-ar cases. It is undefined for
c14b88d76624e0 Janosch Frank            2016-07-29  558  		 * most DAT protection exceptions.
c14b88d76624e0 Janosch Frank            2016-07-29  559  		 */
d03193de30e6d9 David Hildenbrand        2016-05-31  560  		pgm->exc_access_id = ar;
d03193de30e6d9 David Hildenbrand        2016-05-31  561  		break;
d03193de30e6d9 David Hildenbrand        2016-05-31  562  	}
d03193de30e6d9 David Hildenbrand        2016-05-31  563  	return code;
d03193de30e6d9 David Hildenbrand        2016-05-31  564  }
d03193de30e6d9 David Hildenbrand        2016-05-31  565  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
