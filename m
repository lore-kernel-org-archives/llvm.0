Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD2204F93;
	Fri, 21 Feb 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133889; cv=none; b=Svl/FhObnpUu0TOUuUC90wqbm1hCnZPfkDWxwlJoIVIQ7m/e4DCmgeKzz+PoiiUL9TOPAYa00D40qNgPcMm2Q8S03kteFbGeW12tAbgn3QfBrIQqw9TRGrzyfLBRO50D+IDIn1wji0XYa+pVjFMcWTUcncfjU6/2VRzXTq1c/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133889; c=relaxed/simple;
	bh=Q8adWuEsbIZFpoB0BaqIJL9SWQE+woKX2SgIIFg8XCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZexHDKIxONcFSZbadmuRSQphHgRKdyvGB3wvqvB6S1cjRKOFRi8rAeGBt+HBZm9niLPWK6VlHShUW2H/ZMW+zLr9XudCyjct0N1NCXK1Eg6AE2ABvvva+/BbFmp/WTYvvekai45rf+rQIjkrKSlE6OFJ3u0/vyVV3RpVJTdgzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECRBQT9f; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECRBQT9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740133887; x=1771669887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8adWuEsbIZFpoB0BaqIJL9SWQE+woKX2SgIIFg8XCU=;
  b=ECRBQT9fyAhxNgxq3WhsAMkLUyd506UMdGuUBwk3KwQPYr3dMGdIjCdZ
   rGNU3mmiId+qkRTyvH1hW/sI0h7oR7a9GjmZaNOnxQGneCncQ6LoYDnb1
   2I3HaxIDtTHnaWLvPJ4BT86KLo1HeGvw0SA2SE5qC81MhEM86uUil1vjq
   Ggn1vr+PXzX6qZ60y2lj4In8OKG9WiFMTVdK3S9IiyjXuutZ0q0GZX7Nu
   5ybojv1XOp7/nu0E8Kdl07n03QM64VUUX7tlWFnMMvnTClNEZ/dGKtwVy
   z2+40g1BGiG9Zc4xNN5m1UAKhVVaoC3aweFAij6mWAwieV4agtjM/Shqp
   A==;
X-CSE-ConnectionGUID: oIyriyDmS/yYJyzAPc4rPA==
X-CSE-MsgGUID: //j5ItEeScK6IMusMKB7dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40803089"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40803089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 02:31:26 -0800
X-CSE-ConnectionGUID: b/pciMzTSWCB8jQuEfZALQ==
X-CSE-MsgGUID: 4offGx/uQI+6JEKnpmROng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115870633"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2025 02:31:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlQJW-0005OP-3C;
	Fri, 21 Feb 2025 10:31:22 +0000
Date: Fri, 21 Feb 2025 18:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: [linux-next:master 5453/5524]
 drivers/scsi/mpt3sas/mpt3sas_ctl.c:2906:22: warning: variable 'mpi_reply'
 set but not used
Message-ID: <202502211815.1B6mcsOK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: c72be4b5bb7cb1a9059d0b845f87223b52399cc2 [5453/5524] scsi: mpt3sas: Add support for MCTP Passthrough commands
config: i386-buildonly-randconfig-005-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211815.1B6mcsOK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211815.1B6mcsOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211815.1B6mcsOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:2906:22: warning: variable 'mpi_reply' set but not used [-Wunused-but-set-variable]
    2906 |         MPI2DefaultReply_t *mpi_reply;
         |                             ^
   1 warning generated.
--
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:2903: warning: expecting prototype for mpt3sas_send_passthru_cmd(). Prototype was for mpt3sas_send_mctp_passthru_req() instead


vim +/mpi_reply +2906 drivers/scsi/mpt3sas/mpt3sas_ctl.c

  2894	
  2895	/**
  2896	 * mpt3sas_send_passthru_cmd - Send an MPI MCTP passthrough command to
  2897	 *				firmware
  2898	 * @command: The MPI MCTP passthrough command to send to firmware
  2899	 *
  2900	 * Returns 0 on success, anything else is error.
  2901	 */
  2902	int mpt3sas_send_mctp_passthru_req(struct mpt3_passthru_command *command)
> 2903	{
  2904		struct MPT3SAS_ADAPTER *ioc;
  2905		MPI2RequestHeader_t *mpi_request = NULL, *request;
> 2906		MPI2DefaultReply_t *mpi_reply;
  2907		Mpi26MctpPassthroughRequest_t *mctp_passthru_req;
  2908		u16 smid;
  2909		unsigned long timeout;
  2910		u8 issue_reset = 0;
  2911		u32 sz;
  2912		void *psge;
  2913		void *data_out = NULL;
  2914		dma_addr_t data_out_dma = 0;
  2915		size_t data_out_sz = 0;
  2916		void *data_in = NULL;
  2917		dma_addr_t data_in_dma = 0;
  2918		size_t data_in_sz = 0;
  2919		long ret;
  2920	
  2921		/* Retrieve ioc from dev_index */
  2922		ioc = _ctl_get_mpt_mctp_passthru_adapter(command->dev_index);
  2923		if (!ioc)
  2924			return -ENODEV;
  2925	
  2926		mutex_lock(&ioc->pci_access_mutex);
  2927		if (ioc->shost_recovery ||
  2928		    ioc->pci_error_recovery || ioc->is_driver_loading ||
  2929		    ioc->remove_host) {
  2930			ret = -EAGAIN;
  2931			goto unlock_pci_access;
  2932		}
  2933	
  2934		/* Lock the ctl_cmds mutex to ensure a single ctl cmd is pending */
  2935		if (mutex_lock_interruptible(&ioc->ctl_cmds.mutex)) {
  2936			ret = -ERESTARTSYS;
  2937			goto unlock_pci_access;
  2938		}
  2939	
  2940		if (ioc->ctl_cmds.status != MPT3_CMD_NOT_USED) {
  2941			ioc_err(ioc, "%s: ctl_cmd in use\n", __func__);
  2942			ret = -EAGAIN;
  2943			goto unlock_ctl_cmds;
  2944		}
  2945	
  2946		ret = mpt3sas_wait_for_ioc(ioc,	IOC_OPERATIONAL_WAIT_COUNT);
  2947		if (ret)
  2948			goto unlock_ctl_cmds;
  2949	
  2950		mpi_request = (MPI2RequestHeader_t *)command->mpi_request;
  2951		if (mpi_request->Function != MPI2_FUNCTION_MCTP_PASSTHROUGH) {
  2952			ioc_err(ioc, "%s: Invalid request receveid, Function 0x%x\n",
  2953				__func__, mpi_request->Function);
  2954			ret = -EINVAL;
  2955			goto unlock_ctl_cmds;
  2956		}
  2957	
  2958		/* Use first reserved smid for passthrough commands */
  2959		smid = ioc->scsiio_depth - INTERNAL_SCSIIO_CMDS_COUNT + 1;
  2960		ret = 0;
  2961		ioc->ctl_cmds.status = MPT3_CMD_PENDING;
  2962		memset(ioc->ctl_cmds.reply, 0, ioc->reply_sz);
  2963		request = mpt3sas_base_get_msg_frame(ioc, smid);
  2964		memset(request, 0, ioc->request_sz);
  2965		memcpy(request, command->mpi_request, sizeof(Mpi26MctpPassthroughRequest_t));
  2966		ioc->ctl_cmds.smid = smid;
  2967		data_out_sz = command->data_out_size;
  2968		data_in_sz = command->data_in_size;
  2969	
  2970		/* obtain dma-able memory for data transfer */
  2971		if (data_out_sz) /* WRITE */ {
  2972			data_out = dma_alloc_coherent(&ioc->pdev->dev, data_out_sz,
  2973						      &data_out_dma, GFP_ATOMIC);
  2974			if (!data_out) {
  2975				ret = -ENOMEM;
  2976				mpt3sas_base_free_smid(ioc, smid);
  2977				goto out;
  2978			}
  2979			memcpy(data_out, command->data_out_buf_ptr, data_out_sz);
  2980	
  2981		}
  2982	
  2983		if (data_in_sz) /* READ */ {
  2984			data_in = dma_alloc_coherent(&ioc->pdev->dev, data_in_sz,
  2985						     &data_in_dma, GFP_ATOMIC);
  2986			if (!data_in) {
  2987				ret = -ENOMEM;
  2988				mpt3sas_base_free_smid(ioc, smid);
  2989				goto out;
  2990			}
  2991		}
  2992	
  2993		psge = &((Mpi26MctpPassthroughRequest_t *)request)->H2DSGL;
  2994	
  2995		init_completion(&ioc->ctl_cmds.done);
  2996	
  2997		mctp_passthru_req = (Mpi26MctpPassthroughRequest_t *)request;
  2998	
  2999		_ctl_send_mctp_passthru_req(ioc, mctp_passthru_req, psge, data_out_dma,
  3000					data_out_sz, data_in_dma, data_in_sz, smid);
  3001	
  3002		timeout = command->timeout;
  3003		if (timeout < MPT3_IOCTL_DEFAULT_TIMEOUT)
  3004			timeout = MPT3_IOCTL_DEFAULT_TIMEOUT;
  3005	
  3006		wait_for_completion_timeout(&ioc->ctl_cmds.done, timeout*HZ);
  3007		if (!(ioc->ctl_cmds.status & MPT3_CMD_COMPLETE)) {
  3008			mpt3sas_check_cmd_timeout(ioc,
  3009			    ioc->ctl_cmds.status, mpi_request,
  3010			    sizeof(Mpi26MctpPassthroughRequest_t), issue_reset);
  3011			goto issue_host_reset;
  3012		}
  3013	
  3014		mpi_reply = ioc->ctl_cmds.reply;
  3015	
  3016		/* copy out xdata to user */
  3017		if (data_in_sz)
  3018			memcpy(command->data_in_buf_ptr, data_in, data_in_sz);
  3019	
  3020		/* copy out reply message frame to user */
  3021		if (command->max_reply_bytes) {
  3022			sz = min_t(u32, command->max_reply_bytes, ioc->reply_sz);
  3023			memcpy(command->reply_frame_buf_ptr, ioc->ctl_cmds.reply, sz);
  3024		}
  3025	
  3026	issue_host_reset:
  3027		if (issue_reset) {
  3028			ret = -ENODATA;
  3029			mpt3sas_base_hard_reset_handler(ioc, FORCE_BIG_HAMMER);
  3030		}
  3031	
  3032	out:
  3033		/* free memory associated with sg buffers */
  3034		if (data_in)
  3035			dma_free_coherent(&ioc->pdev->dev, data_in_sz, data_in,
  3036			    data_in_dma);
  3037	
  3038		if (data_out)
  3039			dma_free_coherent(&ioc->pdev->dev, data_out_sz, data_out,
  3040			    data_out_dma);
  3041	
  3042		ioc->ctl_cmds.status = MPT3_CMD_NOT_USED;
  3043	
  3044	unlock_ctl_cmds:
  3045		mutex_unlock(&ioc->ctl_cmds.mutex);
  3046	
  3047	unlock_pci_access:
  3048		mutex_unlock(&ioc->pci_access_mutex);
  3049		return ret;
  3050	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
