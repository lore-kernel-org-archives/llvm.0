Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29F7E
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 00:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652832132; x=1684368132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJWipIgCEx5KxbsEZdbQWZcKdnyf+GBjYW+5Xw3silw=;
  b=I9WH3QOnXBM+9BD+OVApkgrmsAImnWenF/gPSEr/eLPnM+nSKiYXvM6S
   JiBULTMYokKc5LeN1i3ZHMfHHfKexIz4AikGxRR+DUciNGvQTBbZe6tU4
   1ZlMs35C+zIFAAewHvL3fLlfKkB5Dj+15I5uS8cVPEIbdiktS/Zc3wEMI
   F1V6mweYQOOKApjIk96EIEK2BBYw2sq83K0Oe88ovxAG71L9zC33g9LRI
   FPUrgMBS9a6sPhd3gAgasRDH9AfsQuG2228s7BAoVKt2L0EKCXRmU/pZi
   ZVMZLOXxR0YkEatudwSr1jSoNdQTV4V9iocfYavEFzMPDMmQMfV/uSPc1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="357802812"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="357802812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 17:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="817150763"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 May 2022 17:02:09 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr78i-0001aj-GG;
	Wed, 18 May 2022 00:02:08 +0000
Date: Wed, 18 May 2022 08:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao G <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 643/1093]
 drivers/gpu/drm/xlnx/xlnx_scaler.c:866:3: warning: variable 'nr_rds' is
 uninitialized when used here
Message-ID: <202205180743.hhbiacb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Venkateshwar,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: 3a0ea0feebe5cb529d57e0f9673d22e4754c6415 [643/1093] drm: xlnx: scaler: Adding vpss-scaler driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220518/202205180743.hhbiacb2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/3a0ea0feebe5cb529d57e0f9673d22e4754c6415
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 3a0ea0feebe5cb529d57e0f9673d22e4754c6415
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/phy/xilinx/ drivers/staging/

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
   drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:14: warning: variable 'fmt_out' set but not used [-Wunused-but-set-variable]
           u32 fmt_in, fmt_out;
                       ^
   drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:6: warning: variable 'fmt_in' set but not used [-Wunused-but-set-variable]
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
