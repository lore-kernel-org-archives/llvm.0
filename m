Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C257F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659371199; x=1690907199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMXo5DjiwiqtT6m271eeEopcmaYvEvxFlvUT6ghUWRk=;
  b=VGNDzGEwEgo2spQ8RYB2szAJAlLZzsB6DYMg7WjOSWrAduULxs3IrqFu
   KbIY1pqUWv/vACRyDTvePFjP1KPoIiaxnqbiAaIwxMX1vGOfA8n7xpSC5
   QB1lp0gQJki8aCzKPjpthp0pCcOOXuN1TBtDIYIDUdJVXJ9Kotl8JSM2j
   YzDr8mfKi8JjSLgvvMZu5tv/3BTL1xcBQ4gz7nZVf0UFMOxmENGHjiIbP
   dJL+DJw7BMB+gFUfz+8mVEzmxYnDRQbhrqyuRpg7N5Z6RHZ+vnus/+tLG
   pzm+yNdNSVsgQRc/AaO+N+22qHNUq/gEMaoxEHPd61xM+4FVRXOKRPPSW
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289200157"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="289200157"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 09:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="929618108"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2022 09:26:37 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIYFZ-000F9b-0N;
	Mon, 01 Aug 2022 16:26:37 +0000
Date: Tue, 2 Aug 2022 00:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/media/platform/atmel/atmel-sama7g5-isc.c:610:34: warning:
 unused variable 'microchip_xisc_of_match'
Message-ID: <202208020021.8hfala2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d7cb6b04c3f3115719235cc6866b10326de34cd
commit: c9aa973884a163ecb6d5d4d3be9137058adcaf8c media: atmel: atmel-isc: add microchip-xisc driver
date:   1 year, 2 months ago
config: mips-randconfig-r024-20220731 (https://download.01.org/0day-ci/archive/20220802/202208020021.8hfala2O-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9aa973884a163ecb6d5d4d3be9137058adcaf8c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c9aa973884a163ecb6d5d4d3be9137058adcaf8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/atmel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/atmel/atmel-sama7g5-isc.c:610:34: warning: unused variable 'microchip_xisc_of_match' [-Wunused-const-variable]
   static const struct of_device_id microchip_xisc_of_match[] = {
                                    ^
   1 warning generated.


vim +/microchip_xisc_of_match +610 drivers/media/platform/atmel/atmel-sama7g5-isc.c

   609	
 > 610	static const struct of_device_id microchip_xisc_of_match[] = {
   611		{ .compatible = "microchip,sama7g5-isc" },
   612		{ }
   613	};
   614	MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
   615	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
