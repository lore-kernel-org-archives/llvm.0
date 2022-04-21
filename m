Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273911FA9
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523434; x=1682059434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljGAKqIpbRmSST7I3qc4W5awgSwI6u3NtnyPHd/EEUU=;
  b=gNZ9IaPMCs7c+TH8Cr+6LoUOc3C155kRgvjcmTNQlpi8lp1qx5Qwc9Ci
   31c54UYVEph4w/Fxxv/0xSJw4QX/blFzJFHXRAJTmepOz3ubeNnC/2AzD
   ZgKpohkLBx7b3XHLFgXiRr78ynNFtqcpRNYzuQZ8+pLnqjzRZ81SX8dpV
   BnLWahh/SuP1rREv+QO2diEMALjm74yhFtB399U0cGzTNOd7tMLeAG0/4
   Pe2pDMCDHHJ6h8GL5CDEvDoZGp/WOJqTnti2TrjbV33R8H+o52gf/pBVi
   ly7msyeUo91kR+TSk0LPwz3alQ53EMZja8UCxGJBe0It/b05lx15+A/da
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244838639"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244838639"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="865403325"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2022 23:43:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQXf-00081A-8P;
	Thu, 21 Apr 2022 06:43:51 +0000
Date: Thu, 21 Apr 2022 14:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Chen <po-tchen@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Anthony Koo <Anthony.Koo@amd.com>, linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:231:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202204210704.BOBjQ2pT-lkp@intel.com>
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
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: e5dfcd272722fe3948837e7f1ca7aafb471037b1 drm/amd/display: dc_link_set_psr_allow_active refactoring
date:   6 months ago
config: s390-randconfig-c005-20220420 (https://download.01.org/0day-ci/archive/20220421/202204210704.BOBjQ2pT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e5dfcd272722fe3948837e7f1ca7aafb471037b1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5dfcd272722fe3948837e7f1ca7aafb471037b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/ drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:231: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set PSR power optimization flags.


vim +231 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c

   229	
   230	/**
 > 231	 * Set PSR power optimization flags.
   232	 */
   233	static void dmub_psr_set_power_opt(struct dmub_psr *dmub, unsigned int power_opt)
   234	{
   235		union dmub_rb_cmd cmd;
   236		struct dc_context *dc = dmub->ctx;
   237	
   238		memset(&cmd, 0, sizeof(cmd));
   239		cmd.psr_set_power_opt.header.type = DMUB_CMD__PSR;
   240		cmd.psr_set_power_opt.header.sub_type = DMUB_CMD__SET_PSR_POWER_OPT;
   241		cmd.psr_set_power_opt.header.payload_bytes = sizeof(struct dmub_cmd_psr_set_power_opt_data);
   242		cmd.psr_set_power_opt.psr_set_power_opt_data.power_opt = power_opt;
   243	
   244		dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
   245		dc_dmub_srv_cmd_execute(dc->dmub_srv);
   246		dc_dmub_srv_wait_idle(dc->dmub_srv);
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
