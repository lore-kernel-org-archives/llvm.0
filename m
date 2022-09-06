Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE073671A
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662481653; x=1694017653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNcXjFRx5QCGmuchY23RjmKjohdA9Bi7wgu2eaRP5bU=;
  b=dqtHbbmdE6sbTmO+VjJyrfE/za1SiJbjAFITuOm/Jf6JEuoQ3AadcfGZ
   VewzdiF/BD8/d6JPQ6OhRu75nNwyAhujMBvzI3nSoRKzmy0/xiSSCPuro
   pqrPhhm+g3X8r+CA3C+TgGuK3gMA9rK74Fyywp9tNo1M+OyL+d/pXZDrB
   +gT3hqlEzbnPxTv7PX0pjpVUyrj6KkEl3EqwkJ6GFmVqQFUl1cii4bwT7
   LlADPUsOv//Ha8VYdrYDGUAn12Pu/zXR/cswCXAQk8LZHNG+sDd4d9/rC
   aEob617W7YEBRtVdE8Du5Z4Kca+2YDiW47h7wvjjIk6A6TuO/ywccfrze
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="322817428"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="322817428"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 09:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="682455573"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2022 09:27:30 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVbQA-0005KJ-10;
	Tue, 06 Sep 2022 16:27:30 +0000
Date: Wed, 7 Sep 2022 00:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mark:arm64/alternatives/rework 8/9]
 arch/arm64/kernel/alternative.c:267:14: warning: no previous prototype for
 function 'alt_cb_patch_nops'
Message-ID: <202209070048.vOezJs1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/alternatives/rework
head:   2d5c57125128db8b4934846ad39b00f79cd1637d
commit: 1121255e431de4b5c9a295d6fb6adac10e708534 [8/9] arm64: alternatives: add shared NOP callback
config: arm64-randconfig-r031-20220906 (https://download.01.org/0day-ci/archive/20220907/202209070048.vOezJs1e-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=1121255e431de4b5c9a295d6fb6adac10e708534
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/alternatives/rework
        git checkout 1121255e431de4b5c9a295d6fb6adac10e708534
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/alternative.c:267:14: warning: no previous prototype for function 'alt_cb_patch_nops' [-Wmissing-prototypes]
   noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
                ^
   arch/arm64/kernel/alternative.c:267:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
           ^
           static 
   1 warning generated.


vim +/alt_cb_patch_nops +267 arch/arm64/kernel/alternative.c

   266	
 > 267	noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
