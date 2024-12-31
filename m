Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D21ADFE4;
	Tue, 31 Dec 2024 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735667106; cv=none; b=UKAeNCT/3FARL5N8uIW9AnpZMeMnBal8pGYwIsrSph6S0Q9uEYq89sAp5twQCjaMPiDMcH8WmRxnOWaurF3P/tpQo8dlMAUDn7lm0bRAT9JQj/lzsuM3l10EoPHoSzaEYEa13V+mFRhPQ3MMB7/F+h0M4D6JwfZ3aZUH7O9DTik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735667106; c=relaxed/simple;
	bh=ZpmvY4WfUCtTIVJc5GldttAgWV/tE9xoQOUP40JR8xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7+kvSgW94ukyYvhXPEYFPz/uXuFw5ufzlvFkuKdMKF18xMiQuf32WM+lnQBAqGa68mHFoSCE7284RsPBng11UsO2Nvd5KknauN8zm/oOyzdW8kJOuvITV2LobTq20hxQA2QIlxgPr9Sos883T8dnnNvFY9vKBJe64dhxYQrGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9iJGnQZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9iJGnQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735667103; x=1767203103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZpmvY4WfUCtTIVJc5GldttAgWV/tE9xoQOUP40JR8xo=;
  b=j9iJGnQZMuJD1jFq+u9j5UheOlqWRJYd6WBz+ZVIs/BWXc/L0plMpE+H
   FqKK2GShBC6UqnhJBcVgNmh6Ky7fsNvVU9TgrjOY7qbUCe05E+9ym2UAV
   5ZdoiEphOs0AfN3OVn7Ip5AOK+wwJGBEjQ/AjNG0MFDUtlLaLnnvTdDBZ
   so0bAjwD1REVwFwU84qh4YQS8FexTlvEB13DBjh76rFjA/57yGyf3arNX
   GYuhJqrpfrQQJzbyuH5FvG4Mg/VY36wxPxst7SuVIAPN8phWW+58A2Mzb
   /sV/W6y3ydWBqyik6kDenQ5DwPHfHb4YWKKM52WeaiDiWR0FaVZTcMRjM
   g==;
X-CSE-ConnectionGUID: FhOd5vhNRwCsHMalIGiIMQ==
X-CSE-MsgGUID: FgmclS0qQvaeIZJX1rIN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47363258"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="47363258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 09:45:02 -0800
X-CSE-ConnectionGUID: Hpukq8BcTRC26tWx2QiCJg==
X-CSE-MsgGUID: auHWF4R5RdOk5m8GIExl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132034202"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Dec 2024 09:45:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSgIc-0007Lv-21;
	Tue, 31 Dec 2024 17:44:58 +0000
Date: Wed, 1 Jan 2025 01:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/firmware/efi/libstub/efi-stub-helper.c:662: warning:
 Function parameter or struct member 'out' not described in 'efi_load_initrd'
Message-ID: <202501010146.LSAElru1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: f4dc7fffa9873db50ec25624572f8217a6225de8 efi: libstub: unify initrd loading between architectures
date:   2 years, 3 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20250101/202501010146.LSAElru1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010146.LSAElru1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010146.LSAElru1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Function parameter or struct member 'initrd' not described in 'efi_load_initrd_dev_path'
   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Excess function parameter 'load_addr' description in 'efi_load_initrd_dev_path'
   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Excess function parameter 'load_size' description in 'efi_load_initrd_dev_path'
>> drivers/firmware/efi/libstub/efi-stub-helper.c:662: warning: Function parameter or struct member 'out' not described in 'efi_load_initrd'


vim +662 drivers/firmware/efi/libstub/efi-stub-helper.c

ec93fc371f014a Ard Biesheuvel      2020-02-03  542  
ec93fc371f014a Ard Biesheuvel      2020-02-03  543  /**
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  544   * efi_load_initrd_dev_path() - load the initrd from the Linux initrd device path
ec93fc371f014a Ard Biesheuvel      2020-02-03  545   * @load_addr:	pointer to store the address where the initrd was loaded
ec93fc371f014a Ard Biesheuvel      2020-02-03  546   * @load_size:	pointer to store the size of the loaded initrd
ec93fc371f014a Ard Biesheuvel      2020-02-03  547   * @max:	upper limit for the initrd memory allocation
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  548   *
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  549   * Return:
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  550   * * %EFI_SUCCESS if the initrd was loaded successfully, in which
ec93fc371f014a Ard Biesheuvel      2020-02-03  551   *   case @load_addr and @load_size are assigned accordingly
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  552   * * %EFI_NOT_FOUND if no LoadFile2 protocol exists on the initrd device path
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  553   * * %EFI_OUT_OF_RESOURCES if memory allocation failed
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  554   * * %EFI_LOAD_ERROR in all other cases
ec93fc371f014a Ard Biesheuvel      2020-02-03  555   */
f61900fd0ebf6c Arvind Sankar       2020-04-30  556  static
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  557  efi_status_t efi_load_initrd_dev_path(struct linux_efi_initrd *initrd,
ec93fc371f014a Ard Biesheuvel      2020-02-03  558  				      unsigned long max)
ec93fc371f014a Ard Biesheuvel      2020-02-03 @559  {
ec93fc371f014a Ard Biesheuvel      2020-02-03  560  	efi_guid_t lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;
ec93fc371f014a Ard Biesheuvel      2020-02-03  561  	efi_device_path_protocol_t *dp;
ec93fc371f014a Ard Biesheuvel      2020-02-03  562  	efi_load_file2_protocol_t *lf2;
ec93fc371f014a Ard Biesheuvel      2020-02-03  563  	efi_handle_t handle;
ec93fc371f014a Ard Biesheuvel      2020-02-03  564  	efi_status_t status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  565  
ec93fc371f014a Ard Biesheuvel      2020-02-03  566  	dp = (efi_device_path_protocol_t *)&initrd_dev_path;
ec93fc371f014a Ard Biesheuvel      2020-02-03  567  	status = efi_bs_call(locate_device_path, &lf2_proto_guid, &dp, &handle);
ec93fc371f014a Ard Biesheuvel      2020-02-03  568  	if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  569  		return status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  570  
ec93fc371f014a Ard Biesheuvel      2020-02-03  571  	status = efi_bs_call(handle_protocol, handle, &lf2_proto_guid,
ec93fc371f014a Ard Biesheuvel      2020-02-03  572  			     (void **)&lf2);
ec93fc371f014a Ard Biesheuvel      2020-02-03  573  	if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  574  		return status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  575  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  576  	initrd->size = 0;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  577  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size, NULL);
ec93fc371f014a Ard Biesheuvel      2020-02-03  578  	if (status != EFI_BUFFER_TOO_SMALL)
ec93fc371f014a Ard Biesheuvel      2020-02-03  579  		return EFI_LOAD_ERROR;
ec93fc371f014a Ard Biesheuvel      2020-02-03  580  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  581  	status = efi_allocate_pages(initrd->size, &initrd->base, max);
ec93fc371f014a Ard Biesheuvel      2020-02-03  582  	if (status != EFI_SUCCESS)
ec93fc371f014a Ard Biesheuvel      2020-02-03  583  		return status;
ec93fc371f014a Ard Biesheuvel      2020-02-03  584  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  585  	status = efi_call_proto(lf2, load_file, dp, false, &initrd->size,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  586  				(void *)initrd->base);
ec93fc371f014a Ard Biesheuvel      2020-02-03  587  	if (status != EFI_SUCCESS) {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  588  		efi_free(initrd->size, initrd->base);
ec93fc371f014a Ard Biesheuvel      2020-02-03  589  		return EFI_LOAD_ERROR;
ec93fc371f014a Ard Biesheuvel      2020-02-03  590  	}
ec93fc371f014a Ard Biesheuvel      2020-02-03  591  	return EFI_SUCCESS;
ec93fc371f014a Ard Biesheuvel      2020-02-03  592  }
f61900fd0ebf6c Arvind Sankar       2020-04-30  593  
f61900fd0ebf6c Arvind Sankar       2020-04-30  594  static
f61900fd0ebf6c Arvind Sankar       2020-04-30  595  efi_status_t efi_load_initrd_cmdline(efi_loaded_image_t *image,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  596  				     struct linux_efi_initrd *initrd,
f61900fd0ebf6c Arvind Sankar       2020-04-30  597  				     unsigned long soft_limit,
f61900fd0ebf6c Arvind Sankar       2020-04-30  598  				     unsigned long hard_limit)
f61900fd0ebf6c Arvind Sankar       2020-04-30  599  {
f61900fd0ebf6c Arvind Sankar       2020-04-30  600  	if (!IS_ENABLED(CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER) ||
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  601  	    (IS_ENABLED(CONFIG_X86) && (!efi_is_native() || image == NULL)))
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  602  		return EFI_UNSUPPORTED;
f61900fd0ebf6c Arvind Sankar       2020-04-30  603  
f61900fd0ebf6c Arvind Sankar       2020-04-30  604  	return handle_cmdline_files(image, L"initrd=", sizeof(L"initrd=") - 2,
f61900fd0ebf6c Arvind Sankar       2020-04-30  605  				    soft_limit, hard_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  606  				    &initrd->base, &initrd->size);
f61900fd0ebf6c Arvind Sankar       2020-04-30  607  }
f61900fd0ebf6c Arvind Sankar       2020-04-30  608  
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  609  static const struct {
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  610  	efi_tcg2_event_t	event_data;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  611  	efi_tcg2_tagged_event_t tagged_event;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  612  	u8			tagged_event_data[];
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  613  } initrd_tcg2_event = {
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  614  	{
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  615  		sizeof(initrd_tcg2_event) + sizeof("Linux initrd"),
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  616  		{
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  617  			sizeof(initrd_tcg2_event.event_data.event_header),
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  618  			EFI_TCG2_EVENT_HEADER_VERSION,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  619  			9,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  620  			EV_EVENT_TAG,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  621  		},
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  622  	},
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  623  	{
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  624  		INITRD_EVENT_TAG_ID,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  625  		sizeof("Linux initrd"),
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  626  	},
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  627  	{ "Linux initrd" },
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  628  };
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  629  
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  630  static void efi_measure_initrd(unsigned long load_addr, unsigned long load_size)
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  631  {
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  632  	efi_guid_t tcg2_guid = EFI_TCG2_PROTOCOL_GUID;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  633  	efi_tcg2_protocol_t *tcg2 = NULL;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  634  	efi_status_t status;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  635  
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  636  	efi_bs_call(locate_protocol, &tcg2_guid, NULL, (void **)&tcg2);
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  637  	if (tcg2) {
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  638  		status = efi_call_proto(tcg2, hash_log_extend_event,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  639  					0, load_addr, load_size,
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  640  					&initrd_tcg2_event.event_data);
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  641  		if (status != EFI_SUCCESS)
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  642  			efi_warn("Failed to measure initrd data: 0x%lx\n",
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  643  				 status);
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  644  		else
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  645  			efi_info("Measured initrd data into PCR %d\n",
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  646  				 initrd_tcg2_event.event_data.event_header.pcr_index);
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  647  	}
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  648  }
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  649  
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  650  /**
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  651   * efi_load_initrd() - Load initial RAM disk
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  652   * @image:	EFI loaded image protocol
947228cb9f1a2c Atish Patra         2021-07-02  653   * @soft_limit:	preferred address for loading the initrd
947228cb9f1a2c Atish Patra         2021-07-02  654   * @hard_limit:	upper limit address for loading the initrd
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  655   *
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  656   * Return:	status code
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  657   */
f61900fd0ebf6c Arvind Sankar       2020-04-30  658  efi_status_t efi_load_initrd(efi_loaded_image_t *image,
f61900fd0ebf6c Arvind Sankar       2020-04-30  659  			     unsigned long soft_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  660  			     unsigned long hard_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  661  			     const struct linux_efi_initrd **out)
f61900fd0ebf6c Arvind Sankar       2020-04-30 @662  {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  663  	efi_guid_t tbl_guid = LINUX_EFI_INITRD_MEDIA_GUID;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  664  	efi_status_t status = EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  665  	struct linux_efi_initrd initrd, *tbl;
f61900fd0ebf6c Arvind Sankar       2020-04-30  666  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  667  	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD) || efi_noinitrd)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  668  		return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  669  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  670  	status = efi_load_initrd_dev_path(&initrd, hard_limit);
f61900fd0ebf6c Arvind Sankar       2020-04-30  671  	if (status == EFI_SUCCESS) {
f61900fd0ebf6c Arvind Sankar       2020-04-30  672  		efi_info("Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path\n");
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  673  		if (initrd.size > 0)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  674  			efi_measure_initrd(initrd.base, initrd.size);
f61900fd0ebf6c Arvind Sankar       2020-04-30  675  	} else if (status == EFI_NOT_FOUND) {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  676  		status = efi_load_initrd_cmdline(image, &initrd, soft_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  677  						 hard_limit);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  678  		/* command line loader disabled or no initrd= passed? */
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  679  		if (status == EFI_UNSUPPORTED || status == EFI_NOT_READY)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  680  			return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  681  		if (status == EFI_SUCCESS)
f61900fd0ebf6c Arvind Sankar       2020-04-30  682  			efi_info("Loaded initrd from command line option\n");
f61900fd0ebf6c Arvind Sankar       2020-04-30  683  	}
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  684  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  685  		goto failed;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  686  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  687  	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(initrd),
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  688  			     (void **)&tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  689  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  690  		goto free_initrd;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  691  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  692  	*tbl = initrd;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  693  	status = efi_bs_call(install_configuration_table, &tbl_guid, tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  694  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  695  		goto free_tbl;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  696  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  697  	if (out)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  698  		*out = tbl;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  699  	return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  700  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  701  free_tbl:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  702  	efi_bs_call(free_pool, tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  703  free_initrd:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  704  	efi_free(initrd.size, initrd.base);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  705  failed:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  706  	efi_err("Failed to load initrd: 0x%lx\n", status);
f61900fd0ebf6c Arvind Sankar       2020-04-30  707  	return status;
f61900fd0ebf6c Arvind Sankar       2020-04-30  708  }
14c574f35cfbc9 Arvind Sankar       2020-05-18  709  

:::::: The code at line 662 was first introduced by commit
:::::: f61900fd0ebf6c6b91719d63272a54f4d11051df efi/libstub: Unify initrd loading across architectures

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
