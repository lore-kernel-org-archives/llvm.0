Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B691107;
	Fri,  3 Mar 2023 01:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677805944; x=1709341944;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pgFl0MjTvP4zoA2Exy8bKKaofeQVLPGSDwoM6McG97o=;
  b=KEXCpJtE/YDTrsFzfj/wVKs9OEi/P74ac7k8Ts+PghO79xIxuQXL+s3d
   y1jJZ+WOv+MtQVAJuOUyTA1wTRj8OA98H2Nkvp58jMSUbmPxbQ7/wx/Vl
   /vEh+tbn37T4zdlYpGKJo/GC+/7TgyVZcsbRg+XZ1JvFRVhdTg28nRQy7
   sY6MQ+M/lefDSMPup/TswXPT16+sQTFoOJNwtKW2nNR4Sb33RZJxZd5aX
   GKQyPTEo3LhulbnOFG9vDf7BdOISWCfdCHb0CL1WZC3TWnv1ApDjJ4dm4
   QFMR/K4+kGOw7O8igxxLNxumBeXVIGGS5ymhqnsZpR5Pxxq3accpIyo1v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="333637082"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="333637082"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 17:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668474491"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="668474491"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 17:11:44 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXtxX-00013e-1D;
	Fri, 03 Mar 2023 01:11:43 +0000
Date: Fri, 3 Mar 2023 09:11:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v1] mm/userfaultfd: propagate uffd-wp bit when
 PTE-mapping the huge zeropage
Message-ID: <202303030949.aMmf1z6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230302175423.589164-1-david@redhat.com>
References: <20230302175423.589164-1-david@redhat.com>
TO: David Hildenbrand <david@redhat.com>
TO: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mike Rapoport <rppt@linux.vnet.ibm.com>
CC: Andrea Arcangeli <aarcange@redhat.com>
CC: Peter Xu <peterx@redhat.com>
CC: Jerome Glisse <jglisse@redhat.com>
CC: Shaohua Li <shli@fb.com>

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/mm-userfaultfd-propagate-uffd-wp-bit-when-PTE-mapping-the-huge-zeropage/20230303-015516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230302175423.589164-1-david%40redhat.com
patch subject: [PATCH v1] mm/userfaultfd: propagate uffd-wp bit when PTE-mapping the huge zeropage
config: riscv-randconfig-r002-20230303 (https://download.01.org/0day-ci/archive/20230303/202303030949.aMmf1z6R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/acd586e505b2e97daab12be8f968f5209b6d8e67
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Hildenbrand/mm-userfaultfd-propagate-uffd-wp-bit-when-PTE-mapping-the-huge-zeropage/20230303-015516
        git checkout acd586e505b2e97daab12be8f968f5209b6d8e67
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030949.aMmf1z6R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/ext4/xattr_hurd.o):(function ext4_xattr_hurd_get: .text+0x94): relocation R_RISCV_HI20 out of range: 541483 is not in [-524288, 524287]; references ext4_xattr_hurd_get.__if_trace.1
   >>> referenced by xattr_hurd.c:18 (fs/ext4/xattr_hurd.c:18)
   >>> defined in vmlinux.a(fs/ext4/xattr_hurd.o)
--
>> ld.lld: error: vmlinux.a(drivers/gpu/drm/arm/display/komeda/komeda_format_caps.o):(function komeda_get_format_caps: .text+0x68): relocation R_RISCV_HI20 out of range: 541810 is not in [-524288, 524287]; references komeda_get_format_caps.__if_trace.2.0
   >>> referenced by komeda_format_caps.c:15 (drivers/gpu/drm/arm/display/komeda/komeda_format_caps.c:15)
   >>> defined in vmlinux.a(drivers/gpu/drm/arm/display/komeda/komeda_format_caps.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0x134): relocation R_RISCV_HI20 out of range: 541399 is not in [-524288, 524287]; references kasan_unpoison_element.__if_trace.44.0
   >>> referenced by mempool.c:160 (mm/mempool.c:160)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0x158): relocation R_RISCV_HI20 out of range: 525325 is not in [-524288, 524287]; references mempool_alloc_pages
   >>> referenced by mempool.c:160 (mm/mempool.c:160)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0x18c): relocation R_RISCV_HI20 out of range: 541399 is not in [-524288, 524287]; references kasan_unpoison_element.__if_trace.1
   >>> referenced by mempool.c:158 (mm/mempool.c:158)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0x22c): relocation R_RISCV_HI20 out of range: 541399 is not in [-524288, 524287]; references remove_element.__if_trace.1
   >>> referenced by mempool.c:162 (mm/mempool.c:162)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(fs/ext4/xattr_hurd.o):(function ext4_xattr_hurd_set: .text+0x190): relocation R_RISCV_HI20 out of range: 541483 is not in [-524288, 524287]; references ext4_xattr_hurd_set.__if_trace.1
   >>> referenced by xattr_hurd.c:25 (fs/ext4/xattr_hurd.c:25)
   >>> defined in vmlinux.a(fs/ext4/xattr_hurd.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0xac): relocation R_RISCV_HI20 out of range: 540890 is not in [-524288, 524287]; references remove_element.______f.42
   >>> referenced by mempool.c:159 (mm/mempool.c:159)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0xf4): relocation R_RISCV_HI20 out of range: 525325 is not in [-524288, 524287]; references mempool_kmalloc
   >>> referenced by mempool.c:160 (mm/mempool.c:160)
   >>> defined in vmlinux.a(mm/mempool.o)
--
>> ld.lld: error: vmlinux.a(mm/mempool.o):(function remove_element: .text+0x124): relocation R_RISCV_HI20 out of range: 525325 is not in [-524288, 524287]; references mempool_alloc_slab
   >>> referenced by mempool.c:160 (mm/mempool.c:160)
   >>> defined in vmlinux.a(mm/mempool.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
