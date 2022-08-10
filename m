Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D34184
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 03:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660101980; x=1691637980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YPRxxFa+CD3FD7Sr9aYppDMOUvEzXzyRt/H7yDmha4=;
  b=lrfQo89HfEl+/np148Gwh+cWtY6joF4vsnywu6pqSjV5dEdATbAX1bM5
   3+Yb81bqmhCr3f6VzEVQVUtzOYoIl4I4IV5iy0d494zImLDl0nJi9iqST
   s/tFka2+8KXGgiqqfaz0/oP1ZZZoJkiJBEyp+AgPdnpi7xX5fFKi4Jc5g
   T1kKEro1mZhlYGja1yDO61SWnGTaxKwDxs8B2pLBHH+HZDUDUWeVPfpwa
   FTB14uTFEzdPAWrkDaJN55SPWlmVOLQCsXmFa/HLyq8ygQXF03FR0IDyd
   PsgEt7ALzylPJAeT/4vLmH54Ossca16HMNH9QG9d2Q08/pnjdAmIUVOjb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="289740865"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="289740865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 20:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="581061406"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 20:26:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLcMA-000NSz-23;
	Wed, 10 Aug 2022 03:26:06 +0000
Date: Wed, 10 Aug 2022 11:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: drivers/vfio/vfio_iommu_type1.c:2147:35: warning: cast to smaller
 integer type 'enum iommu_cap' from 'void *'
Message-ID: <202208101119.7unZx9dJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4252071b97d2027d246f6a82cbee4d52f618b47
commit: eed20c782aea57b7efb42af2905dc381268b21e9 vfio/type1: Simplify bus_type determination
date:   6 weeks ago
config: arm64-randconfig-r034-20220810 (https://download.01.org/0day-ci/archive/20220810/202208101119.7unZx9dJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed20c782aea57b7efb42af2905dc381268b21e9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eed20c782aea57b7efb42af2905dc381268b21e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_iommu_type1.c:2147:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
           return device_iommu_capable(dev, (enum iommu_cap)data);
                                            ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2147 drivers/vfio/vfio_iommu_type1.c

  2143	
  2144	/* Redundantly walks non-present capabilities to simplify caller */
  2145	static int vfio_iommu_device_capable(struct device *dev, void *data)
  2146	{
> 2147		return device_iommu_capable(dev, (enum iommu_cap)data);
  2148	}
  2149	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
