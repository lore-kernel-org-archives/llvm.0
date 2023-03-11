Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACE7B;
	Sat, 11 Mar 2023 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678528730; x=1710064730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8MLlFo1tWIAE4Qg82ReTvbSKU+i9OXto4btiLFarMG4=;
  b=jv9Vbuhi/VLv4I37qPOpjtIYrDpJhE+NKMKE3C5IT/jmp5G/HRssxUqs
   Zmz9QFZ7oY2A23EJY+HVizf/tM9azyIAMYbl9F+qAcmau8aSCKA4AaHvB
   5pheIxJ7UELjpK2r/CVg71VcVQpu0x9W1pxypT2kahoCZ+lXaHI8zgB+d
   n2J7+BMtPRtBXpSUAtkx+0IUmzP3JybiUumRIgMbugu7atg05d6e2V8po
   2ZKGSDh257AYJ60Ed7qgdcZwseDF167DUsYTmDctr3IpCIUU/0AkR4ZTd
   IcIlagw+buXd+268gx8VLeNgZk4CnnACFTLX//152wkkoH2u4mjSN4YA6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423158956"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="423158956"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 01:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821378868"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="821378868"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2023 01:58:48 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pavzz-0004VA-1j;
	Sat, 11 Mar 2023 09:58:47 +0000
Date: Sat, 11 Mar 2023 17:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Pagani <marpagan@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/4] fpga: add initial KUnit test suites
Message-ID: <202303111722.dBMPUXdj-lkp@intel.com>
References: <20230310170412.708363-5-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310170412.708363-5-marpagan@redhat.com>

Hi Marco,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-fake-FPGA-manager/20230311-010757
patch link:    https://lore.kernel.org/r/20230310170412.708363-5-marpagan%40redhat.com
patch subject: [RFC PATCH v2 4/4] fpga: add initial KUnit test suites
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230311/202303111722.dBMPUXdj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6af16afaf84ee6f061e6953eebca1a786c5be576
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marco-Pagani/fpga-add-fake-FPGA-manager/20230311-010757
        git checkout 6af16afaf84ee6f061e6953eebca1a786c5be576
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111722.dBMPUXdj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
>> drivers/fpga/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
