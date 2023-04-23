Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1BF620;
	Sun, 23 Apr 2023 04:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682222763; x=1713758763;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0YGPjK/j6dPhyPWh9b8KO4htrbBFqE74Mm+NxLkImz8=;
  b=n8GbPJV4lBae9g8M8EReCtt85M9EVRm9XefI1Xuef65i7Nld0/hGL5tn
   wmVq3n94zLCMNyHPDX4P9jT5PtU08idzaiLL5IKaiUCug0Ih/osPXajBG
   +3l3WYKHtrlHIxglCPHZz7z5e8IvqLTItdTu/LPlfPYsdrAolZ3qd8qS4
   UbgzeXSefESMOc0UHPCKBfUb6iqG837s9hNgdlrrPvZPo55zfd1H2AYs7
   mttD9kOUVBH2Ce3G87+rMZcKaltmM3gTTSmfMKWhRYAJlS5YlepvmXJEP
   EymCLA7yX5609RGit4a6cI+Dfx3Cu8LX3+7KMEr9WlkyBiOzFA/8AeicJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411512457"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="411512457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 21:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="757299477"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="757299477"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2023 21:06:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqQzA-000hgu-1F;
	Sun, 23 Apr 2023 04:06:00 +0000
Date: Sun, 23 Apr 2023 12:05:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jarkko-tpmdd:tis-irq 70/75] vmlinux.o: warning: objtool:
 tpm_tis+0x50: data relocation to !ENDBR: tpm_tis_request_locality+0x0
Message-ID: <202304231135.zmOsiK5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Lino Sanfilippo <l.sanfilippo@kunbus.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: c211567f78eb2c1f823cbf843460c4231c7c9632 [70/75] tpm, tpm: Implement usage counter for locality
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230423/202304231135.zmOsiK5U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=c211567f78eb2c1f823cbf843460c4231c7c9632
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout c211567f78eb2c1f823cbf843460c4231c7c9632
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231135.zmOsiK5U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: null_fops+0x28: data relocation to !ENDBR: write_iter_null+0x0
   vmlinux.o: warning: objtool: null_fops+0xc0: data relocation to !ENDBR: splice_write_null+0x0
   vmlinux.o: warning: objtool: null_fops+0x100: data relocation to !ENDBR: uring_cmd_null+0x0
   vmlinux.o: warning: objtool: port_fops+0x8: data relocation to !ENDBR: memory_lseek+0x0
   vmlinux.o: warning: objtool: port_fops+0x10: data relocation to !ENDBR: read_port+0x0
   vmlinux.o: warning: objtool: port_fops+0x18: data relocation to !ENDBR: write_port+0x0
   vmlinux.o: warning: objtool: port_fops+0x70: data relocation to !ENDBR: open_port+0x0
   vmlinux.o: warning: objtool: zero_fops+0x8: data relocation to !ENDBR: null_lseek+0x0
   vmlinux.o: warning: objtool: zero_fops+0x10: data relocation to !ENDBR: read_zero+0x0
   vmlinux.o: warning: objtool: zero_fops+0x18: data relocation to !ENDBR: write_null+0x0
   vmlinux.o: warning: objtool: zero_fops+0x20: data relocation to !ENDBR: read_iter_zero+0x0
   vmlinux.o: warning: objtool: zero_fops+0x28: data relocation to !ENDBR: write_iter_null+0x0
   vmlinux.o: warning: objtool: zero_fops+0x60: data relocation to !ENDBR: mmap_zero+0x0
   vmlinux.o: warning: objtool: zero_fops+0xa8: data relocation to !ENDBR: get_unmapped_area_zero+0x0
   vmlinux.o: warning: objtool: full_fops+0x8: data relocation to !ENDBR: null_lseek+0x0
   vmlinux.o: warning: objtool: full_fops+0x18: data relocation to !ENDBR: write_full+0x0
   vmlinux.o: warning: objtool: full_fops+0x20: data relocation to !ENDBR: read_iter_zero+0x0
   vmlinux.o: warning: objtool: random_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: random_fops+0x20: data relocation to !ENDBR: random_read_iter+0x0
   vmlinux.o: warning: objtool: random_fops+0x28: data relocation to !ENDBR: random_write_iter+0x0
   vmlinux.o: warning: objtool: random_fops+0x48: data relocation to !ENDBR: random_poll+0x0
   vmlinux.o: warning: objtool: random_fops+0x50: data relocation to !ENDBR: random_ioctl+0x0
   vmlinux.o: warning: objtool: random_fops+0x90: data relocation to !ENDBR: random_fasync+0x0
   vmlinux.o: warning: objtool: random_fops+0xc0: data relocation to !ENDBR: iter_file_splice_write+0x0
   vmlinux.o: warning: objtool: random_fops+0xc8: data relocation to !ENDBR: generic_file_splice_read+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x20: data relocation to !ENDBR: urandom_read_iter+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x28: data relocation to !ENDBR: random_write_iter+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x50: data relocation to !ENDBR: random_ioctl+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x90: data relocation to !ENDBR: random_fasync+0x0
   vmlinux.o: warning: objtool: urandom_fops+0xc0: data relocation to !ENDBR: iter_file_splice_write+0x0
   vmlinux.o: warning: objtool: urandom_fops+0xc8: data relocation to !ENDBR: generic_file_splice_read+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x0: data relocation to !ENDBR: misc_seq_start+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x8: data relocation to !ENDBR: misc_seq_stop+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x10: data relocation to !ENDBR: misc_seq_next+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x18: data relocation to !ENDBR: misc_seq_show+0x0
   vmlinux.o: warning: objtool: misc_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: misc_fops+0x70: data relocation to !ENDBR: misc_open+0x0
   vmlinux.o: warning: objtool: hv_ops+0x0: data relocation to !ENDBR: get_chars+0x0
   vmlinux.o: warning: objtool: hv_ops+0x8: data relocation to !ENDBR: put_chars+0x0
   vmlinux.o: warning: objtool: hv_ops+0x18: data relocation to !ENDBR: notifier_add_vio+0x0
   vmlinux.o: warning: objtool: hv_ops+0x20: data relocation to !ENDBR: notifier_del_vio+0x0
   vmlinux.o: warning: objtool: hv_ops+0x28: data relocation to !ENDBR: notifier_del_vio+0x0
   vmlinux.o: warning: objtool: port_fops+0x10: data relocation to !ENDBR: port_fops_read+0x0
   vmlinux.o: warning: objtool: port_fops+0x18: data relocation to !ENDBR: port_fops_write+0x0
   vmlinux.o: warning: objtool: port_fops+0x48: data relocation to !ENDBR: port_fops_poll+0x0
   vmlinux.o: warning: objtool: port_fops+0x70: data relocation to !ENDBR: port_fops_open+0x0
   vmlinux.o: warning: objtool: port_fops+0x80: data relocation to !ENDBR: port_fops_release+0x0
   vmlinux.o: warning: objtool: port_fops+0x90: data relocation to !ENDBR: port_fops_fasync+0x0
   vmlinux.o: warning: objtool: port_fops+0xc0: data relocation to !ENDBR: port_fops_splice_write+0x0
   vmlinux.o: warning: objtool: port_debugfs_fops+0x8: data relocation to !ENDBR: seq_lseek+0x0
   vmlinux.o: warning: objtool: port_debugfs_fops+0x10: data relocation to !ENDBR: seq_read+0x0
   vmlinux.o: warning: objtool: port_debugfs_fops+0x70: data relocation to !ENDBR: port_debugfs_open+0x0
   vmlinux.o: warning: objtool: port_debugfs_fops+0x80: data relocation to !ENDBR: single_release+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x10: data relocation to !ENDBR: rng_dev_read+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x70: data relocation to !ENDBR: rng_dev_open+0x0
   vmlinux.o: warning: objtool: tlclk_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: tlclk_fops+0x10: data relocation to !ENDBR: tlclk_read+0x0
   vmlinux.o: warning: objtool: tlclk_fops+0x70: data relocation to !ENDBR: tlclk_open+0x0
   vmlinux.o: warning: objtool: tlclk_fops+0x80: data relocation to !ENDBR: tlclk_release+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x8: data relocation to !ENDBR: default_llseek+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x10: data relocation to !ENDBR: mwave_read+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x18: data relocation to !ENDBR: mwave_write+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x50: data relocation to !ENDBR: mwave_ioctl+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x70: data relocation to !ENDBR: mwave_open+0x0
   vmlinux.o: warning: objtool: mwave_fops+0x80: data relocation to !ENDBR: mwave_close+0x0
   vmlinux.o: warning: objtool: scr24x_fops+0x10: data relocation to !ENDBR: scr24x_read+0x0
   vmlinux.o: warning: objtool: scr24x_fops+0x18: data relocation to !ENDBR: scr24x_write+0x0
   vmlinux.o: warning: objtool: scr24x_fops+0x70: data relocation to !ENDBR: scr24x_open+0x0
   vmlinux.o: warning: objtool: scr24x_fops+0x80: data relocation to !ENDBR: scr24x_release+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x10: data relocation to !ENDBR: tpm_common_read+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x18: data relocation to !ENDBR: tpm_common_write+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x48: data relocation to !ENDBR: tpm_common_poll+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x70: data relocation to !ENDBR: tpm_open+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x80: data relocation to !ENDBR: tpm_release+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x10: data relocation to !ENDBR: tpm_common_read+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x18: data relocation to !ENDBR: tpm_common_write+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x48: data relocation to !ENDBR: tpm_common_poll+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x70: data relocation to !ENDBR: tpmrm_open+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x80: data relocation to !ENDBR: tpmrm_release+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm1_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm1_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm1_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm1_ascii_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm1_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm1_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm1_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm1_binary_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm2_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm2_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm2_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm2_binary_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x8: data relocation to !ENDBR: tpm_tis_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x10: data relocation to !ENDBR: tpm_tis_recv+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x18: data relocation to !ENDBR: tpm_tis_send+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x20: data relocation to !ENDBR: tpm_tis_ready+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x28: data relocation to !ENDBR: tpm_tis_status+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x30: data relocation to !ENDBR: tpm_tis_update_timeouts+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x38: data relocation to !ENDBR: tpm_tis_update_durations+0x0
>> vmlinux.o: warning: objtool: tpm_tis+0x50: data relocation to !ENDBR: tpm_tis_request_locality+0x0
>> vmlinux.o: warning: objtool: tpm_tis+0x58: data relocation to !ENDBR: tpm_tis_relinquish_locality+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x60: data relocation to !ENDBR: tpm_tis_clkrun_enable+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x18: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x28: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x38: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tcg+0x0: data relocation to !ENDBR: tpm_tcg_read_bytes+0x0
   vmlinux.o: warning: objtool: tpm_tcg+0x8: data relocation to !ENDBR: tpm_tcg_write_bytes+0x0
   vmlinux.o: warning: objtool: tpm_tis_dmi_table+0x0: data relocation to !ENDBR: tpm_tis_disable_irq+0x0
   vmlinux.o: warning: objtool: tpm_tis_spi_id+0x20: data relocation to !ENDBR: tpm_tis_spi_probe+0x0
   vmlinux.o: warning: objtool: tpm_tis_spi_id+0x48: data relocation to !ENDBR: tpm_tis_spi_probe+0x0
   vmlinux.o: warning: objtool: tpm_tis_spi_id+0x70: data relocation to !ENDBR: tpm_tis_spi_probe+0x0
   vmlinux.o: warning: objtool: tpm_tis_spi_id+0x98: data relocation to !ENDBR: tpm_tis_spi_probe+0x0
   vmlinux.o: warning: objtool: tpm_tis_spi_id+0xc0: data relocation to !ENDBR: cr50_spi_probe+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x18: data relocation to !ENDBR: tpm_tis_spi_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x28: data relocation to !ENDBR: tpm_tis_spi_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x38: data relocation to !ENDBR: tpm_tis_spi_resume+0x0
   vmlinux.o: warning: objtool: tpm_spi_phy_ops+0x0: data relocation to !ENDBR: tpm_tis_spi_read_bytes+0x0
   vmlinux.o: warning: objtool: tpm_spi_phy_ops+0x8: data relocation to !ENDBR: tpm_tis_spi_write_bytes+0x0
   vmlinux.o: warning: objtool: tpm_spi_cr50_phy_ops+0x0: data relocation to !ENDBR: tpm_tis_spi_cr50_read_bytes+0x0
   vmlinux.o: warning: objtool: tpm_spi_cr50_phy_ops+0x8: data relocation to !ENDBR: tpm_tis_spi_cr50_write_bytes+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: cr50_i2c_pm+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: cr50_i2c+0x8: data relocation to !ENDBR: tpm_cr50_i2c_req_canceled+0x0
   vmlinux.o: warning: objtool: cr50_i2c+0x10: data relocation to !ENDBR: tpm_cr50_i2c_tis_recv+0x0
   vmlinux.o: warning: objtool: cr50_i2c+0x18: data relocation to !ENDBR: tpm_cr50_i2c_tis_send+0x0
   vmlinux.o: warning: objtool: cr50_i2c+0x20: data relocation to !ENDBR: tpm_cr50_i2c_tis_set_ready+0x0
   vmlinux.o: warning: objtool: cr50_i2c+0x28: data relocation to !ENDBR: tpm_cr50_i2c_tis_status+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_atmel_pm_ops+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: i2c_atmel+0x8: data relocation to !ENDBR: i2c_atmel_req_canceled+0x0
   vmlinux.o: warning: objtool: i2c_atmel+0x10: data relocation to !ENDBR: i2c_atmel_recv+0x0
   vmlinux.o: warning: objtool: i2c_atmel+0x18: data relocation to !ENDBR: i2c_atmel_send+0x0
   vmlinux.o: warning: objtool: i2c_atmel+0x20: data relocation to !ENDBR: i2c_atmel_cancel+0x0
   vmlinux.o: warning: objtool: i2c_atmel+0x28: data relocation to !ENDBR: i2c_atmel_read_status+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c_ops+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c+0x8: data relocation to !ENDBR: tpm_tis_i2c_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c+0x10: data relocation to !ENDBR: tpm_tis_i2c_recv+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c+0x18: data relocation to !ENDBR: tpm_tis_i2c_send+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c+0x20: data relocation to !ENDBR: tpm_tis_i2c_ready+0x0
   vmlinux.o: warning: objtool: tpm_tis_i2c+0x28: data relocation to !ENDBR: tpm_tis_i2c_status+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: i2c_nuvoton_pm_ops+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_i2c+0x8: data relocation to !ENDBR: i2c_nuvoton_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_i2c+0x10: data relocation to !ENDBR: i2c_nuvoton_recv+0x0
   vmlinux.o: warning: objtool: tpm_i2c+0x18: data relocation to !ENDBR: i2c_nuvoton_send+0x0
   vmlinux.o: warning: objtool: tpm_i2c+0x20: data relocation to !ENDBR: i2c_nuvoton_ready+0x0
   vmlinux.o: warning: objtool: tpm_i2c+0x28: data relocation to !ENDBR: i2c_nuvoton_read_status+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_nsc_pm+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_nsc+0x8: data relocation to !ENDBR: tpm_nsc_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_nsc+0x10: data relocation to !ENDBR: tpm_nsc_recv+0x0
   vmlinux.o: warning: objtool: tpm_nsc+0x18: data relocation to !ENDBR: tpm_nsc_send+0x0
   vmlinux.o: warning: objtool: tpm_nsc+0x20: data relocation to !ENDBR: tpm_nsc_cancel+0x0
   vmlinux.o: warning: objtool: tpm_nsc+0x28: data relocation to !ENDBR: tpm_nsc_status+0x0
   vmlinux.o: warning: objtool: st33zp24_tpm+0x8: data relocation to !ENDBR: st33zp24_req_canceled+0x0
   vmlinux.o: warning: objtool: st33zp24_tpm+0x10: data relocation to !ENDBR: st33zp24_recv+0x0
   vmlinux.o: warning: objtool: st33zp24_tpm+0x18: data relocation to !ENDBR: st33zp24_send+0x0
   vmlinux.o: warning: objtool: st33zp24_tpm+0x20: data relocation to !ENDBR: st33zp24_cancel+0x0
   vmlinux.o: warning: objtool: st33zp24_tpm+0x28: data relocation to !ENDBR: st33zp24_status+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x10: data relocation to !ENDBR: st33zp24_pm_suspend+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x18: data relocation to !ENDBR: st33zp24_pm_resume+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x20: data relocation to !ENDBR: st33zp24_pm_suspend+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x28: data relocation to !ENDBR: st33zp24_pm_resume+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x30: data relocation to !ENDBR: st33zp24_pm_suspend+0x0
   vmlinux.o: warning: objtool: st33zp24_spi_ops+0x38: data relocation to !ENDBR: st33zp24_pm_resume+0x0
   vmlinux.o: warning: objtool: spi_phy_ops+0x0: data relocation to !ENDBR: st33zp24_spi_send+0x0
   vmlinux.o: warning: objtool: spi_phy_ops+0x8: data relocation to !ENDBR: st33zp24_spi_recv+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x8: data relocation to !ENDBR: xillybus_llseek+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x10: data relocation to !ENDBR: xillybus_read+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x18: data relocation to !ENDBR: xillybus_write+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x48: data relocation to !ENDBR: xillybus_poll+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x70: data relocation to !ENDBR: xillybus_open+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x78: data relocation to !ENDBR: xillybus_flush+0x0
   vmlinux.o: warning: objtool: xillybus_fops+0x80: data relocation to !ENDBR: xillybus_release+0x0


objdump-func vmlinux.o tpm_tis:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
