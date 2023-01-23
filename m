Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74FA21;
	Mon, 23 Jan 2023 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674462369; x=1705998369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09s0OxVD4yELiygvPoXhquCBPkkmgctRJPXVCJBDnIg=;
  b=E0KRoRahRYJ8u19uf+go/RJMkqQQufc7dO2W23/QSQ9EAMv7bQFFx+ut
   e1nbrRB0f9zY2yxkUtY/VR+UYLprZTatg1nxQenoOZ9PQwwIAkQo6Pqe/
   SweoMdo6uQM8Qv71HjieCiD4D34Suady7qU0q4rDHRvTMu2k+Itd4C5Mt
   05FvtRCyzcLjyirWfwqk6mb7osODolmeNJrJ9oyMEW/C+dnfrRFYY9K3n
   7GESyt6DT3t7SH91ONU0az3pkRC7bGXA0fx4ELWQnDkoitaQsrnSpFfSR
   AnRXSiTglFwzvsShmwxHUPBRkJKn59+KbnLaAq9NIVmF3JIoGpOhOFyrb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412223322"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="412223322"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 00:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692050160"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692050160"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 00:26:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJs9R-0005WO-19;
	Mon, 23 Jan 2023 08:26:01 +0000
Date: Mon, 23 Jan 2023 16:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: ld.lld: error: undefined symbol: vb2_vmalloc_memops
Message-ID: <202301231611.IEV8PsyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: cb48ae89be3b6e916fe1640a9ee23fe4c87a1ca6 media: atomisp: Convert to videobuf2
date:   8 weeks ago
config: i386-randconfig-r014-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231611.IEV8PsyF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cb48ae89be3b6e916fe1640a9ee23fe4c87a1ca6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cb48ae89be3b6e916fe1640a9ee23fe4c87a1ca6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vb2_vmalloc_memops
   >>> referenced by atomisp_fops.c:629 (drivers/staging/media/atomisp/pci/atomisp_fops.c:629)
   >>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
