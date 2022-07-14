Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E82F53
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657817009; x=1689353009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/xECZxr+sWlay9b7MODTqclvFGTFHTyS6Ax8kmXyOI=;
  b=bNi5q43pP0vQSJNIl/0+fPJ99eHvqCYNzNdMYOF+nQzvLnFFeQtFobHE
   eaF/UbTVpQmWmyrJADac/euVmejeMn41t/O3wKsnfFrDomk5oDwDdRMgT
   F6RaGZLvz4K+4cNU28GMRH9BQM1ujO8tVrt2dmhoW0CgZ9Z4lhtcEY71P
   PFl4EPB1NzELukqeDwAR+kCwye1Be+7s2PX3jv1WTkY2glYN5mgdVYSU/
   Sb8NDsvBgiRip057QANpidKjFHJecRkw3TpVps1mIUVaFmTZ4Z6Sf35SH
   zcN6iDzjBHHYeSRPaO+kaaUgq2peDhecs7CDLdpWAobbOiZ+I4YHwh42o
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="268596855"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="268596855"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 09:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="738340522"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2022 09:43:28 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC1vz-0000sn-KH;
	Thu, 14 Jul 2022 16:43:27 +0000
Date: Fri, 15 Jul 2022 00:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v6 12/23] HID: initial BPF implementation
Message-ID: <202207150008.O4t08On6-lkp@intel.com>
References: <20220712145850.599666-13-benjamin.tissoires@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712145850.599666-13-benjamin.tissoires@redhat.com>

Hi Benjamin,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm-vexpress_defconfig (https://download.01.org/0day-ci/archive/20220715/202207150008.O4t08On6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/57eb5074a35029f30cc13ed3a526b3342b169788
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
        git checkout 57eb5074a35029f30cc13ed3a526b3342b169788
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dispatch_hid_bpf_device_event
   >>> referenced by hid-core.c
   >>> hid/hid-core.o:(hid_input_report) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: hid_bpf_device_init
   >>> referenced by hid-core.c
   >>> hid/hid-core.o:(hid_allocate_device) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: hid_bpf_destroy_device
   >>> referenced by hid-core.c
   >>> hid/hid-core.o:(hid_destroy_device) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
