Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A0736A
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652505983; x=1684041983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vOr1s4hyuADKclZdkCj1gSHUqC2uPya1MjINyW1/PRI=;
  b=DvhocRmTClS6WFd5B1uDIi1P4uKdtrkY4Vs4YdhDTF/6EVzLoTqZixmW
   X24VRxl3dNjPEiEVwO7kl+Mbf5f6pNS3gxUrH2puvs+Sow6jNoi4HEUCt
   4Z4K0jDANSyOCPsa2WRxrfot5DLJH3LrpGCT1PUUnPVJYL2OX8ceNj09z
   YwRVTPfVFhrpQ4UgkqC1oSq1r9z4B0Dg8a0kLYRtT0mecDXw+Lvca3V7w
   Z/CpgCWahWVM/tWchCuEEl84GpJ3EAuBSfMr12J9jGayOeao93zp64Mzh
   OKhss1olkIkwoDnw7aCwhTh5tzQxXXkEpxGxjDagXlijghWtpSBHsbNlr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="250997139"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="250997139"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 22:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="573282365"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2022 22:26:20 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npkIF-0000Fa-NV;
	Sat, 14 May 2022 05:26:19 +0000
Date: Sat, 14 May 2022 13:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dao Lu <daolu@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Dao Lu <daolu@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] arch/riscv: Add Zihintpause extension support
Message-ID: <202205141316.E2mCmmhu-lkp@intel.com>
References: <20220512033045.1101909-1-daolu@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512033045.1101909-1-daolu@rivosinc.com>

Hi Dao,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dao-Lu/arch-riscv-Add-Zihintpause-extension-support/20220512-113348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
config: riscv-randconfig-r035-20220512 (https://download.01.org/0day-ci/archive/20220514/202205141316.E2mCmmhu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ebdb085998220eb16e6815608a3a6d8f87711d28
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dao-Lu/arch-riscv-Add-Zihintpause-extension-support/20220512-113348
        git checkout ebdb085998220eb16e6815608a3a6d8f87711d28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: section .text file range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text virtual address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
--
>> ld.lld: error: section .text load address range overlaps with __jump_table
   >>> .text range is [0x800, 0x1277]
   >>> __jump_table range is [0x878, 0x8D7]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
