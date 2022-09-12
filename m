Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4443211
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663002251; x=1694538251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6oU0DygDAbO34S5se4NPmjyYSwYVwfQrWPeER41vQzM=;
  b=HC8ZwXEo6pVANFvc8qdBgOxq/Qg4lP43kc3V4H3C5iq923NVhSvu+2fN
   t/id5V00TG5NzyGSIgR5Fg7bHySwW4/XaEn9i/ZUpR73chUdCJNnb5t8q
   b5FQFuL4692yVyJso4F88a0Np9NDD3v/7ayoYdLbejbLlYSu/Dz0+ZFh1
   RqbbbS8Q91lTokdDshBWoWFp9fq6427WCEzIW41tAZbih0VAUBkzRIkVz
   xumOnS/enxFzbODE5r+5oISQTv0nEabMBVDPlRpG1pQ6LwuE6q+LbpuUb
   0BocPuKt+ovzcjsmDZjOeWjfrWmIhd4NZDjZ+/fPMqEoVpNRxFUwCdeh9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="324156141"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="324156141"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 10:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="791620822"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Sep 2022 10:02:55 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXmpj-0002g3-0A;
	Mon, 12 Sep 2022 17:02:55 +0000
Date: Tue, 13 Sep 2022 01:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:guest-attest 5/9] arch/x86/coco/mem.c:27:26: warning:
 function 'virt_to_dma' is not needed and will not be emitted
Message-ID: <202209130117.Ve8dGyqo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   ef90ba1bf9a2aada5e1f9f6c27b5e2bde91a6991
commit: df7603408ff53cb1344704a728ee152672567b94 [5/9] x86/coco: Add cc_decrypted_alloc/free() interfaces
config: x86_64-randconfig-r021-20220912 (https://download.01.org/0day-ci/archive/20220913/202209130117.Ve8dGyqo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/df7603408ff53cb1344704a728ee152672567b94
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-attest
        git checkout df7603408ff53cb1344704a728ee152672567b94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/ arch/x86/kernel/ lib/ net/mptcp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/mem.c:27:26: warning: function 'virt_to_dma' is not needed and will not be emitted [-Wunneeded-internal-declaration]
   static inline dma_addr_t virt_to_dma(void *vaddr)
                            ^
   1 warning generated.


vim +/virt_to_dma +27 arch/x86/coco/mem.c

    26	
  > 27	static inline dma_addr_t virt_to_dma(void *vaddr)
    28	{
    29		return phys_to_dma(&mem_pdev->dev, virt_to_phys(vaddr));
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
