Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27CC7A
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656471167; x=1688007167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Peyu7ZRX4ch03zpq+DdistMLsdoqCn76LTkgdA3JSNw=;
  b=BzoGvR3683PYUJmohKo2G3xnFHrrlPGGKhFNm1PhshCPrD4ZI33nKpKl
   IIFESJBMooUml3Rg6WZnyJGwb6YPzT/wjqF1N2FE8Z/M5drLgUx5LLG0r
   CHihBSWPoZfEd0lHfpcefxpXEOx8S98PdbWirSwka+VtsDepvf1YtbBsw
   ZrGv/gW8GDxhVRo81RcM6vuzSlI6Lx1ryg+xFmDHAAzU7a9GcECPxcvSZ
   67oHmQcQfAoUB8pd7MBhEhh+5uX3Pt4tqf5qdqHnPUOrh9v1tSWcn/RBy
   GJpMoDBpFEBAn8pmo2p2kHOFAaPdeHf/WYc8OvUpXDUmV3VEuOlVqqoAC
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="307393228"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="307393228"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 19:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="693377988"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2022 19:52:45 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6Noq-000Aqc-QG;
	Wed, 29 Jun 2022 02:52:44 +0000
Date: Wed, 29 Jun 2022 10:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan McDowell <noodles@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Borislav Petkov <bp@suse.de>, Mimi Zohar <zohar@linux.ibm.com>,
	Baoquan He <bhe@redhat.com>
Subject: [tip:x86/kdump 1/1] WARNING: modpost: vmlinux.o(.text+0x1e7210c):
 Section mismatch in reference from the function ima_free_kexec_buffer() to
 the function .meminit.text:memblock_phys_free()
Message-ID: <202206291039.yGgljGbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/kdump
head:   69243968bd526641e549ed231c750ce92e3eeb35
commit: 69243968bd526641e549ed231c750ce92e3eeb35 [1/1] x86/kexec: Carry forward IMA measurement log on kexec
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220629/202206291039.yGgljGbx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=69243968bd526641e549ed231c750ce92e3eeb35
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/kdump
        git checkout 69243968bd526641e549ed231c750ce92e3eeb35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x1e7210c): Section mismatch in reference from the function ima_free_kexec_buffer() to the function .meminit.text:memblock_phys_free()
The function ima_free_kexec_buffer() references
the function __meminit memblock_phys_free().
This is often because ima_free_kexec_buffer lacks a __meminit
annotation or the annotation of memblock_phys_free is wrong.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
