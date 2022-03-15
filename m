Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475A3663
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647382036; x=1678918036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjSnKNj2twZsTMnSIET3Dl065/bPUJXT5F0mwdP1/6g=;
  b=XbfuuWTaYgYYaz4YokIHm9Q+zT0ctriJLVa34CD32+pFro4HoIZS1EXK
   J+zt6Hadnwgs4Ax2dq0UdUWw/vfI9fJ8T2+PHsAjVjGD2ijU+pGbm+BBG
   Qs7TNX0oe8Guiofm/qBFBwPkB48LSyCnDfNpSqm7fgCasQlDiMOXoorj5
   fwalrz2CqVL/2qaxYGuRL5mUHT3DYhwpvlgyBDQTAPqsSE88csNNMrtzD
   2ywm7uvrgJrFVh3Z4zaFAkB6V7ql4Ehd1ecHhh0vkEot2I8xqXLgrMsHa
   Lvll4Gm0+x4x+AhjRhZOYKPHSOgzcVGSm5PhB+0whESR4pLJ8rODieDOt
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238598599"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="238598599"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 15:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="613420169"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2022 15:07:14 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUFJx-000BYI-Cv; Tue, 15 Mar 2022 22:07:13 +0000
Date: Wed, 16 Mar 2022 06:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao G <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 643/983]
 drivers/gpu/drm/xlnx/xlnx_scaler.c:866:3: warning: variable 'nr_rds' is
 uninitialized when used here
Message-ID: <202203160632.WrayAcJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   82a6a288ad2ea30575c859f1a5ec2ad014e51528
commit: 3a0ea0feebe5cb529d57e0f9673d22e4754c6415 [643/983] drm: xlnx: scaler: Adding vpss-scaler driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220316/202203160632.WrayAcJE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/3a0ea0feebe5cb529d57e0f9673d22e4754c6415
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 3a0ea0feebe5cb529d57e0f9673d22e4754c6415
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_scaler.c:866:3: warning: variable 'nr_rds' is uninitialized when used here [-Wuninitialized]
                   nr_rds += nr_rds_clck;
                   ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_scaler.c:821:12: note: initialize the variable 'nr_rds' to silence this warning
           int nr_rds;
                     ^
                      = 0
   drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:6: warning: variable 'fmt_in' set but not used [-Wunused-but-set-variable]
           u32 fmt_in, fmt_out;
               ^
   drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:14: warning: variable 'fmt_out' set but not used [-Wunused-but-set-variable]
           u32 fmt_in, fmt_out;
                       ^
   3 warnings generated.


vim +/nr_rds +866 drivers/gpu/drm/xlnx/xlnx_scaler.c

   800	
   801	/**
   802	 * xv_hscaler_calculate_phases - Calculates h-scaler phases
   803	 * @scaler: Pointer to scaler registers base
   804	 * @width_in: input width
   805	 * @width_out: output width
   806	 * @pixel_rate: pixel rate
   807	 *
   808	 */
   809	static void
   810	xv_hscaler_calculate_phases(struct xilinx_scaler *scaler,
   811				    u32 width_in, u32 width_out, u32 pixel_rate)
   812	{
   813		unsigned int loop_width;
   814		unsigned int x, s;
   815		int offset = 0;
   816		int xwrite_pos = 0;
   817		bool output_write_en;
   818		bool get_new_pix;
   819		u64 phaseH;
   820		u32 array_idx = 0;
   821		int nr_rds;
   822		int nr_rds_clck;
   823		unsigned int nphases = scaler->max_num_phases;
   824		unsigned int nppc = scaler->pix_per_clk;
   825		unsigned int shift = XHSC_STEP_PRECISION_SHIFT - ilog2(nphases);
   826	
   827		loop_width = max_t(u32, width_in, width_out);
   828		loop_width = ALIGN(loop_width + nppc - 1, nppc);
   829	
   830		for (x = 0; x < loop_width; x++) {
   831			nr_rds_clck = 0;
   832			for (s = 0; s < nppc; s++) {
   833				phaseH = (offset >> shift) & (nphases - 1);
   834				get_new_pix = false;
   835				output_write_en = false;
   836				if ((offset >> XHSC_STEP_PRECISION_SHIFT) != 0) {
   837					get_new_pix = true;
   838					offset -= (1 << XHSC_STEP_PRECISION_SHIFT);
   839					array_idx++;
   840				}
   841	
   842				if (((offset >> XHSC_STEP_PRECISION_SHIFT) == 0) &&
   843				    xwrite_pos < width_out) {
   844					offset += pixel_rate;
   845					output_write_en = true;
   846					xwrite_pos++;
   847				}
   848	
   849				scaler->H_phases[x] |= (phaseH <<
   850							(s * XHSC_HPHASE_MULTIPLIER));
   851				scaler->H_phases[x] |= (array_idx <<
   852							(XHSC_HPHASE_SHIFT_BY_6 +
   853							(s * XHSC_HPHASE_MULTIPLIER)));
   854				if (output_write_en) {
   855					scaler->H_phases[x] |=
   856					(XV_HSCALER_PHASESH_V_OUTPUT_WR_EN <<
   857					(s * XHSC_HPHASE_MULTIPLIER));
   858				}
   859	
   860				if (get_new_pix)
   861					nr_rds_clck++;
   862			}
   863			if (array_idx >= nppc)
   864				array_idx &= (nppc - 1);
   865	
 > 866			nr_rds += nr_rds_clck;
   867			if (nr_rds >= nppc)
   868				nr_rds -= nppc;
   869		}
   870	}
   871	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
