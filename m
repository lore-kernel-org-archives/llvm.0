Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B73265B
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661930102; x=1693466102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFtaGGZcd5hqupfg03iJo60XuDXVT4T/ce2D86efO7k=;
  b=cX22LM5lDOeNxLSMcDGuuJHJIu7OTi3Lm/zsrqXQosA7CVF+Qtvneyvg
   cGGBP9v+12F4KndbqO45byPy9uAWa66srXs1RTlLBFjNtEsBVVOFKLpjZ
   bkSpDtaYOXZkEvNyroksEexbzNPEIhZhapqAEcEVNABvsHf5ELRradfU1
   tKGggI8CYUlf9ZAdek2BEsP1FpxM1/J+SWfy2h3mJEq07/u88gE5mQ8en
   WLtVQhfuOZMTjJ8Xvr6DWBd+Y32FKZr/Hbodrf1+RE9AxkW8FyeUrEMke
   zhyjydkc5uhnCXVFMjdWXooI19CPPfr2AvcXm+gl+vxUBIDGNrT7ZI4bi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="294130982"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="294130982"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 00:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="940343776"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2022 00:14:59 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTHwA-00004a-1X;
	Wed, 31 Aug 2022 07:14:58 +0000
Date: Wed, 31 Aug 2022 15:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: powerpc-linux-objdump: Warning: Unrecognized form: 0x23
Message-ID: <202208311529.oy9I92hy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: 86ce436e30d86327c9f5260f718104ae7b21f506 macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
date:   3 months ago
config: powerpc-buildonly-randconfig-r004-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311529.oy9I92hy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=86ce436e30d86327c9f5260f718104ae7b21f506
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 86ce436e30d86327c9f5260f718104ae7b21f506
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: DIE at offset 0xe023 refers to abbreviation number 5553012 which does not exist
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: DIE at offset 0xe023 refers to abbreviation number 5553012 which does not exist
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
--
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: DIE at offset 0xe023 refers to abbreviation number 5553012 which does not exist
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: DIE at offset 0xe023 refers to abbreviation number 5553012 which does not exist
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
