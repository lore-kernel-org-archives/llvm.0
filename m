Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBF7D
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644617113; x=1676153113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JvifyvibEXNvIeu/UqujnxOiEd42GQjWujWe/6qUKG4=;
  b=kjAKeg30PMzTQrsY23KZ2f45Z07JfCfShPSI7rOzEkuQw2NOQEF0oLlt
   iPJU4HhiTmg9mWqLb3bBgiyI1usYO1YHSZJsLCVIV3VyRlLHlDuoWLcUC
   8GiFBMOuPpegG83GvZMMSBwFU5qWQPguU03/Vmmw3nmQ0UGJ9l82BJaZ8
   VX5i6GPhlAKcHD6giI1c/owwOFaQZV1tkeuG4Iqp7ikzEoOAGxB8XYokg
   tB+D71+mOWc1mrc7qF6H6h3owGFwuZZmW0fVcCkIu99NmIGF4Ycy9vSng
   wKvfe5XOKJgCThxIuuOss/3sKvgzx74MzFd0HQe3dAMOJyRtO+TOSHYce
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="313099293"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="313099293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 14:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="586484258"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2022 14:05:09 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIe2P-0005FD-AO; Fri, 11 Feb 2022 22:05:09 +0000
Date: Sat, 12 Feb 2022 06:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Subject: Re: [PATCH v2 3/3] spi: amd: Add support for version AMDI0062
Message-ID: <202202120539.KmgOSqRV-lkp@intel.com>
References: <20220211143155.75513-4-andrealmeid@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220211143155.75513-4-andrealmeid@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "André,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andr-Almeida/spi-amd-Add-support-for-new-controller-version/20220211-223438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: hexagon-randconfig-r045-20220211 (https://download.01.org/0day-ci/archive/20220212/202202120539.KmgOSqRV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f9ba9fa1166540cf4dbf3ffbddb96b55699479b5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andr-Almeida/spi-amd-Add-support-for-new-controller-version/20220211-223438
        git checkout f9ba9fa1166540cf4dbf3ffbddb96b55699479b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/spi/spi-amd.c:333:23: error: use of undeclared identifier 'spi_acpi_match'
                   .acpi_match_table = spi_acpi_match,
                                       ^
   1 error generated.


vim +/spi_acpi_match +333 drivers/spi/spi-amd.c

   329	
   330	static struct platform_driver amd_spi_driver = {
   331		.driver = {
   332			.name = "amd_spi",
 > 333			.acpi_match_table = spi_acpi_match,
   334		},
   335		.probe = amd_spi_probe,
   336	};
   337	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
