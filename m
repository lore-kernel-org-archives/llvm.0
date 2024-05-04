Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8115B3;
	Sat,  4 May 2024 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714786933; cv=none; b=cUzdCaef0OSxE2On/kB4TK4RY3oONIfgiWGb8GvywDIg5Ak/6u3dk895mMhcLS6mfxwYizXdI3gaZHX5DkpLm8gqljgoZZRMBKm3BGa7EiFO5aG5IY9GEnPO2QSKle0kxboNzwAYZZMkWX8bpzd96iRMmdgh6WI3+mWh435hj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714786933; c=relaxed/simple;
	bh=XGYh8ZaouPTXRBQUI+XC0xd8k1KBovaCdhmZKvxjj8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRB1qvOgyWRe/zjksbmsbfDS9GzXZj/lCuWcPtlpn96B64gccH1znycdmdhlEGl3uDv/fCB7Ad3VQ2utaSHKCkm7Dio6bjVYGxQrSrA6cHsDZgh+ViiJ8SRB4GGC43dWgPzMuM4nJjw1HMpavGF/rz/zW6EAzhhA55/vSLOr9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kzk5N29n; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kzk5N29n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714786931; x=1746322931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGYh8ZaouPTXRBQUI+XC0xd8k1KBovaCdhmZKvxjj8g=;
  b=Kzk5N29nq7FCMn4Wy5gqaA7J5o/tpgICjuAaqlXanqqWn73ITTpKPAaI
   HkZq5ViGpmUcm82PcGQ0L6TXD0f4ATym2HwZjBkNtPQ7jEQ98Hm/WyGx7
   sfomQ5hx55aZ/bgA/fi+eF2Wwoar9mahFZEALweOmlc+0Ui+9qOuEHwyu
   C9DOxsm3EeqiG2QcHHO2RO1eEzHUdPZY05zQRj1Nw2eLXrayo3inYa31O
   X3LBDaiJ7fU+cEq5fDMfxoOxMAMCTqkjx2yBQRh0xurtlM9E4wk0micX1
   qXlL6xQr8GfTQczEEIJKlRaDBmVDqkGoLrdDENv0CoetL+QKKZIZohJZa
   w==;
X-CSE-ConnectionGUID: 7wrYxCjFSyG0OTwyCVNJVA==
X-CSE-MsgGUID: bGYNHHb2TRW77qGzd1V17g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11144113"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="11144113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 18:42:10 -0700
X-CSE-ConnectionGUID: vpDGTdB0Qc6eI4Gok7RW4Q==
X-CSE-MsgGUID: fiJSuS5+RiaUGKmfhSzNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="27645351"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2024 18:42:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s34Pe-000CJ7-2H;
	Sat, 04 May 2024 01:42:06 +0000
Date: Sat, 4 May 2024 09:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 109/438]
 drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:474:1: error: use of
 undeclared identifier 'tl_control_write'
Message-ID: <202405040953.E9W4S0Qt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   dc1d38c01afa3a6c8981663be2a0110e5ab44686
commit: cc02ba19147c981609bb9cb139919ce433e06a44 [109/438] crypto: qat: convert to read/write iterators
config: x86_64-randconfig-076-20240502 (https://download.01.org/0day-ci/archive/20240504/202405040953.E9W4S0Qt-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040953.E9W4S0Qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040953.E9W4S0Qt-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD dc1d38c01afa3a6c8981663be2a0110e5ab44686 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:474:1: error: use of undeclared identifier 'tl_control_write'
     474 | DEFINE_SHOW_STORE_ATTRIBUTE(tl_control);
         | ^
   include/linux/seq_file.h:220:12: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write          = __name ## _write,                             \
         |                           ^
   <scratch space>:241:1: note: expanded from here
     241 | tl_control_write
         | ^
>> drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c:670:1: error: use of undeclared identifier 'tl_rp_data_write'
     670 | DEFINE_SHOW_STORE_ATTRIBUTE(tl_rp_data);
         | ^
   include/linux/seq_file.h:220:12: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write          = __name ## _write,                             \
         |                           ^
   <scratch space>:246:1: note: expanded from here
     246 | tl_rp_data_write
         | ^
   2 errors generated.


vim +/tl_control_write +474 drivers/crypto/intel/qat/qat_common/adf_tl_debugfs.c

69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  415  
cc02ba19147c98 Jens Axboe              2024-04-10  416  static ssize_t tl_control_write_iter(struct kiocb *iocb, struct iov_iter *from)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  417  {
cc02ba19147c98 Jens Axboe              2024-04-10  418  	struct seq_file *seq_f = iocb->ki_filp->private_data;
cc02ba19147c98 Jens Axboe              2024-04-10  419  	size_t count = iov_iter_count(from);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  420  	struct adf_accel_dev *accel_dev;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  421  	struct adf_telemetry *telemetry;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  422  	struct adf_tl_hw_data *tl_data;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  423  	struct device *dev;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  424  	u32 input;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  425  	int ret;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  426  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  427  	accel_dev = seq_f->private;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  428  	if (!accel_dev)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  429  		return -EINVAL;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  430  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  431  	tl_data = &GET_TL_DATA(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  432  	telemetry = accel_dev->telemetry;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  433  	dev = &GET_DEV(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  434  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  435  	mutex_lock(&telemetry->wr_lock);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  436  
cc02ba19147c98 Jens Axboe              2024-04-10  437  	ret = kstrtou32_from_iter(from, count, 10, &input);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  438  	if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  439  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  440  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  441  	if (input > tl_data->num_hbuff) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  442  		dev_info(dev, "invalid control input\n");
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  443  		ret = -EINVAL;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  444  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  445  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  446  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  447  	/* If input is 0, just stop telemetry. */
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  448  	if (!input) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  449  		ret = adf_tl_halt(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  450  		if (!ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  451  			ret = count;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  452  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  453  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  454  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  455  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  456  	/* If TL is already enabled, stop it. */
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  457  	if (atomic_read(&telemetry->state)) {
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  458  		dev_info(dev, "already enabled, restarting.\n");
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  459  		ret = adf_tl_halt(accel_dev);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  460  		if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  461  			goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  462  	}
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  463  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  464  	ret = adf_tl_run(accel_dev, input);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  465  	if (ret)
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  466  		goto unlock_and_exit;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  467  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  468  	ret = count;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  469  
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  470  unlock_and_exit:
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  471  	mutex_unlock(&telemetry->wr_lock);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  472  	return ret;
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  473  }
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22 @474  DEFINE_SHOW_STORE_ATTRIBUTE(tl_control);
69e7649f7cc2aa Lucas Segarra Fernandez 2023-12-22  475  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  476  static int get_rp_index_from_file(const struct file *f, u8 *rp_id, u8 rp_num)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  477  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  478  	char alpha;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  479  	u8 index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  480  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  481  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  482  	ret = sscanf(f->f_path.dentry->d_name.name, ADF_TL_RP_REGS_FNAME, &alpha);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  483  	if (ret != 1)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  484  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  485  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  486  	index = ADF_TL_DBG_RP_INDEX_ALPHA(alpha);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  487  	*rp_id = index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  488  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  489  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  490  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  491  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  492  static int adf_tl_dbg_change_rp_index(struct adf_accel_dev *accel_dev,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  493  				      unsigned int new_rp_num,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  494  				      unsigned int rp_regs_index)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  495  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  496  	struct adf_hw_device_data *hw_data = GET_HW_DATA(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  497  	struct adf_telemetry *telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  498  	struct device *dev = &GET_DEV(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  499  	unsigned int i;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  500  	u8 curr_state;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  501  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  502  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  503  	if (new_rp_num >= hw_data->num_rps) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  504  		dev_info(dev, "invalid Ring Pair number selected\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  505  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  506  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  507  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  508  	for (i = 0; i < hw_data->tl_data.max_rp; i++) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  509  		if (telemetry->rp_num_indexes[i] == new_rp_num) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  510  			dev_info(dev, "RP nr: %d is already selected in slot rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  511  				 new_rp_num, ADF_TL_DBG_RP_ALPHA_INDEX(i));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  512  			return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  513  		}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  514  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  515  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  516  	dev_dbg(dev, "selecting RP nr %u into slot rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  517  		new_rp_num, ADF_TL_DBG_RP_ALPHA_INDEX(rp_regs_index));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  518  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  519  	curr_state = atomic_read(&telemetry->state);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  520  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  521  	if (curr_state) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  522  		ret = adf_tl_halt(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  523  		if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  524  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  525  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  526  		telemetry->rp_num_indexes[rp_regs_index] = new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  527  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  528  		ret = adf_tl_run(accel_dev, curr_state);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  529  		if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  530  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  531  	} else {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  532  		telemetry->rp_num_indexes[rp_regs_index] = new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  533  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  534  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  535  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  536  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  537  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  538  static void tl_print_rp_srv(struct adf_accel_dev *accel_dev, struct seq_file *s,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  539  			    u8 rp_idx)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  540  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  541  	u32 banks_per_vf = GET_HW_DATA(accel_dev)->num_banks_per_vf;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  542  	enum adf_cfg_service_type svc;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  543  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  544  	seq_printf(s, "%-*s", TL_KEY_MIN_PADDING, RP_SERVICE_TYPE);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  545  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  546  	svc = GET_SRV_TYPE(accel_dev, rp_idx % banks_per_vf);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  547  	switch (svc) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  548  	case COMP:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  549  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_DC);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  550  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  551  	case SYM:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  552  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_SYM);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  553  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  554  	case ASYM:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  555  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, ADF_CFG_ASYM);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  556  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  557  	default:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  558  		seq_printf(s, "%*s\n", TL_VALUE_MIN_PADDING, TL_RP_SRV_UNKNOWN);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  559  		break;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  560  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  561  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  562  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  563  static int tl_print_rp_data(struct adf_accel_dev *accel_dev, struct seq_file *s,
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  564  			    u8 rp_regs_index)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  565  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  566  	struct adf_tl_hw_data *tl_data = &GET_TL_DATA(accel_dev);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  567  	struct adf_telemetry *telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  568  	const struct adf_tl_dbg_counter *rp_tl_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  569  	u8 num_rp_counters = tl_data->num_rp_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  570  	size_t rp_regs_sz = tl_data->rp_reg_sz;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  571  	struct adf_tl_dbg_counter ctr;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  572  	unsigned int i;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  573  	u8 rp_idx;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  574  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  575  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  576  	if (!atomic_read(&telemetry->state)) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  577  		dev_info(&GET_DEV(accel_dev), "not enabled\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  578  		return -EPERM;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  579  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  580  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  581  	rp_tl_counters = tl_data->rp_counters;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  582  	rp_idx = telemetry->rp_num_indexes[rp_regs_index];
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  583  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  584  	if (rp_idx == ADF_TL_RP_REGS_DISABLED) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  585  		dev_info(&GET_DEV(accel_dev), "no RP number selected in rp_%c_data\n",
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  586  			 ADF_TL_DBG_RP_ALPHA_INDEX(rp_regs_index));
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  587  		return -EPERM;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  588  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  589  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  590  	tl_print_msg_cnt(s, telemetry->msg_cnt);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  591  	seq_printf(s, "%-*s", TL_KEY_MIN_PADDING, RP_NUM_INDEX);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  592  	seq_printf(s, "%*d\n", TL_VALUE_MIN_PADDING, rp_idx);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  593  	tl_print_rp_srv(accel_dev, s, rp_idx);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  594  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  595  	for (i = 0; i < num_rp_counters; i++) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  596  		ctr = rp_tl_counters[i];
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  597  		ctr.offset1 += rp_regs_sz * rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  598  		ctr.offset2 += rp_regs_sz * rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  599  		ret = tl_calc_and_print_counter(telemetry, s, &ctr, NULL);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  600  		if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  601  			dev_dbg(&GET_DEV(accel_dev),
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  602  				"invalid RP counter type\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  603  			return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  604  		}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  605  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  606  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  607  	return 0;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  608  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  609  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  610  static int tl_rp_data_show(struct seq_file *s, void *unused)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  611  {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  612  	struct adf_accel_dev *accel_dev = s->private;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  613  	u8 rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  614  	u8 max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  615  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  616  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  617  	if (!accel_dev)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  618  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  619  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  620  	max_rp = GET_TL_DATA(accel_dev).max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  621  	ret = get_rp_index_from_file(s->file, &rp_regs_index, max_rp);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  622  	if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  623  		dev_dbg(&GET_DEV(accel_dev), "invalid RP data file name\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  624  		return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  625  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  626  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  627  	return tl_print_rp_data(accel_dev, s, rp_regs_index);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  628  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  629  
cc02ba19147c98 Jens Axboe              2024-04-10  630  static ssize_t tl_rp_data_write_iter(struct kiocb *iocb, struct iov_iter *from)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  631  {
cc02ba19147c98 Jens Axboe              2024-04-10  632  	struct seq_file *seq_f = iocb->ki_filp->private_data;
cc02ba19147c98 Jens Axboe              2024-04-10  633  	size_t count = iov_iter_count(from);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  634  	struct adf_accel_dev *accel_dev;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  635  	struct adf_telemetry *telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  636  	unsigned int new_rp_num;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  637  	u8 rp_regs_index;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  638  	u8 max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  639  	int ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  640  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  641  	accel_dev = seq_f->private;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  642  	if (!accel_dev)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  643  		return -EINVAL;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  644  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  645  	telemetry = accel_dev->telemetry;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  646  	max_rp = GET_TL_DATA(accel_dev).max_rp;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  647  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  648  	mutex_lock(&telemetry->wr_lock);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  649  
cc02ba19147c98 Jens Axboe              2024-04-10  650  	ret = get_rp_index_from_file(iocb->ki_filp, &rp_regs_index, max_rp);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  651  	if (ret) {
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  652  		dev_dbg(&GET_DEV(accel_dev), "invalid RP data file name\n");
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  653  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  654  	}
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  655  
cc02ba19147c98 Jens Axboe              2024-04-10  656  	ret = kstrtou32_from_iter(from, count, 10, &new_rp_num);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  657  	if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  658  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  659  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  660  	ret = adf_tl_dbg_change_rp_index(accel_dev, new_rp_num, rp_regs_index);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  661  	if (ret)
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  662  		goto unlock_and_exit;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  663  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  664  	ret = count;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  665  
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  666  unlock_and_exit:
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  667  	mutex_unlock(&telemetry->wr_lock);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  668  	return ret;
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  669  }
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22 @670  DEFINE_SHOW_STORE_ATTRIBUTE(tl_rp_data);
eb52707716e3f2 Lucas Segarra Fernandez 2023-12-22  671  

:::::: The code at line 474 was first introduced by commit
:::::: 69e7649f7cc2aaa7889174456d39319a623c1a18 crypto: qat - add support for device telemetry

:::::: TO: Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
