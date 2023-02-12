Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A211111;
	Sun, 12 Feb 2023 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676187402; x=1707723402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lI+l273dXWuh+WwUeVWKREXe4OTF3vv940+eBTap9qc=;
  b=lPv9lGYeYlLIcNvcFeFXE9FIVXWtRslN4XljjU5kNwbeiqIy16HAbq5J
   XyczElVe390ojeQhJv9tfIqDXg8dgyHn6D2zbV5r2kqJvVNt6AEzc0tAC
   RvFlOlgPTuAKzwujaV2KOj1SBOF7nr4ePsw+w7c1nueW03LXfwHxsIGEQ
   rbzxicTS9ur3IFdxFiUzHl0yl2g/qF96gGqJsYkQszliCdpzTy9hMRapP
   DdCyXChiuXiiQkcD5eFrZL0R9iG20JYEFUEl75/2jhnD3iMjjVN+vywfQ
   k9Xb4v4Ts+9a9irVCFrpjuABZBllh4nSbJlP/gUn3iJswuaS+Ku+yOEeT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="393096718"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="393096718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 23:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="997357671"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="997357671"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Feb 2023 23:36:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR6ud-000785-1f;
	Sun, 12 Feb 2023 07:36:39 +0000
Date: Sun, 12 Feb 2023 15:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-for-later 33/39] warning: associated function
 is never used: `into_raw`
Message-ID: <202302121535.M26xsFDp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-for-later
head:   2e5d72c83d043f1f73c136ac0fb371f107e026fe
commit: d6298e04ec99a824a5bd2d50c6b951b427725f00 [33/39] rust: kernel: dma_fence: Add DMA Fence abstraction
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230212/202302121535.M26xsFDp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/d6298e04ec99a824a5bd2d50c6b951b427725f00
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-for-later
        git checkout d6298e04ec99a824a5bd2d50c6b951b427725f00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121535.M26xsFDp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function is never used: `into_raw`
   --> rust/kernel/dma_fence.rs:505:19
   |
   505 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: 1 warning emitted

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
