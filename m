Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0567881F;
	Wed, 29 Mar 2023 21:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680126256; x=1711662256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPQXz4rPcWqtrJzhVoC+L0/8RDMVIAeqagc0w54Lzg8=;
  b=H3W7o/t0cjjcGHGr4jEl3X85Rb/hFEYpQGOPbpoO3N9Fr6nG/naNci06
   VJMHaOYHX8NQGQY1YYfdmp7h9Om22viuQoEIJvkd1B0T+dd+HMagWBceR
   O2E+UE/JPlseM0fXOJoTrRKU1SPaG17HI00id5EVYiqme6YyLFPkn2xFP
   MW/F5wWHQUOSWArV2wCqI0tzOuD4cYRkgDUPmaUPTZuwKkWfVG+iXv8RE
   m02/MRdqsyEN1ei1EEvN6NPDdzG8DXS5QDtQ9I/YuACHWtmuvepY7RlZE
   TYMGaqLQn9JHGlwLQKMAfbstJrBzB/NIJ+2+rTEfwTqp/yczIQ282/m65
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427280349"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427280349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828046917"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="828046917"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 14:44:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdaX-000JzP-2n;
	Wed, 29 Mar 2023 21:44:13 +0000
Date: Thu, 30 Mar 2023 05:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] ld.lld: error: duplicate symbol:
 bpf_uprobe_multi_link_attach
Message-ID: <202303300535.vbNBQbgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   f81bdc54f7ac3f1c0c66810141f94cc1629d68e3
commit: 84757f34ed3e8132c54a96949e3939f27da7d0e5 [1/17] bpf: Add multi uprobe link
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230330/202303300535.vbNBQbgr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=84757f34ed3e8132c54a96949e3939f27da7d0e5
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout 84757f34ed3e8132c54a96949e3939f27da7d0e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300535.vbNBQbgr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at trace_events.h:800 (include/linux/trace_events.h:800)
   >>>            drivers/i2c/i2c-core-base.o:(bpf_uprobe_multi_link_attach)
   >>> defined at trace_events.h:800 (include/linux/trace_events.h:800)
   >>>            drivers/i2c/i2c-core-smbus.o:(.text+0x390)
--
>> ld.lld: error: duplicate symbol: bpf_uprobe_multi_link_attach
   >>> defined at trace_events.h:800 (include/linux/trace_events.h:800)
   >>>            drivers/i2c/i2c-core-base.o:(bpf_uprobe_multi_link_attach)
   >>> defined at trace_events.h:800 (include/linux/trace_events.h:800)
   >>>            drivers/i2c/i2c-core-slave.o:(.text+0xD0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
