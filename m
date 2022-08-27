Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58313C1D
	for <llvm@lists.linux.dev>; Sat, 27 Aug 2022 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661599809; x=1693135809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4z4dEKfIQsW2axSDRuKOgjqB/K9uHS4cHkCFoz50CpU=;
  b=ELIy/eFgi8+nrMi3/dz7T6GJSw0oLk9OV0VXTG6QkD+z6AbsB+NLCojm
   05kmhcXnAqBve4/7duuDyGoYSnG/rxANyDtDPoYJc4q2Do3o+8XaO8YX9
   wNkmzDUpmr8YbuDBqGsmCtahHqsp3cvS2k+1cfccNjIMSF15GkH6jxBA7
   E5gGY3GDo5vOsBOVLibv8U/7bxjxRarqQwcCjwOfxcCpxcLiFgRviITmk
   xOiRckn9U0ekzLL70Y2qqavfSEdFXeSZggBu0ODaAaXYgRyOCmsvvRusD
   luzOlXxsFW/faC/IS8vLeTYyXjIhcaDiSm5f/zGVXJE68YPjUl3TndaA9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="294664460"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="294664460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2022 04:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="643937119"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Aug 2022 04:29:45 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRu0X-00007z-0v;
	Sat, 27 Aug 2022 11:29:45 +0000
Date: Sat, 27 Aug 2022 19:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Tian <kevin.tian@intel.com>,
	Zhenyu Wang <zhenyuw@linux.intel.com>,
	Zhi Wang <zhi.a.wang@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Diana Craciun <diana.craciun@oss.nxp.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 12/15] vfio/amba: Use the new device life
 cycle helpers
Message-ID: <202208271915.r1YQuNYr-lkp@intel.com>
References: <20220827171037.30297-13-kevin.tian@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827171037.30297-13-kevin.tian@intel.com>

Hi Kevin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Tian/Tidy-up-vfio_device-life-cycle/20220827-175349
base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
config: hexagon-randconfig-r015-20220827 (https://download.01.org/0day-ci/archive/20220827/202208271915.r1YQuNYr-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d84e450f05116135857fef3988f4b7c273ae2fe2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kevin-Tian/Tidy-up-vfio_device-life-cycle/20220827-175349
        git checkout d84e450f05116135857fef3988f4b7c273ae2fe2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/vfio/platform/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vfio/platform/vfio_platform_common.c:608:37: warning: unused variable 'vfio_platform_ops' [-Wunused-const-variable]
   static const struct vfio_device_ops vfio_platform_ops = {
                                       ^
   1 warning generated.
--
>> drivers/vfio/platform/vfio_amba.c:110:37: warning: unused variable 'vfio_platform_ops' [-Wunused-const-variable]
   static const struct vfio_device_ops vfio_platform_ops = {
                                       ^
   1 warning generated.


vim +/vfio_platform_ops +608 drivers/vfio/platform/vfio_platform_common.c

de49fc0d99e6a8 Antonios Motakis 2015-03-16  607  
de49fc0d99e6a8 Antonios Motakis 2015-03-16 @608  static const struct vfio_device_ops vfio_platform_ops = {
de49fc0d99e6a8 Antonios Motakis 2015-03-16  609  	.name		= "vfio-platform",
ab7e5e34a9f661 Jason Gunthorpe  2021-08-05  610  	.open_device	= vfio_platform_open_device,
ab7e5e34a9f661 Jason Gunthorpe  2021-08-05  611  	.close_device	= vfio_platform_close_device,
de49fc0d99e6a8 Antonios Motakis 2015-03-16  612  	.ioctl		= vfio_platform_ioctl,
de49fc0d99e6a8 Antonios Motakis 2015-03-16  613  	.read		= vfio_platform_read,
de49fc0d99e6a8 Antonios Motakis 2015-03-16  614  	.write		= vfio_platform_write,
de49fc0d99e6a8 Antonios Motakis 2015-03-16  615  	.mmap		= vfio_platform_mmap,
de49fc0d99e6a8 Antonios Motakis 2015-03-16  616  };
de49fc0d99e6a8 Antonios Motakis 2015-03-16  617  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
