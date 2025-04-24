Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CA28A1E1;
	Thu, 24 Apr 2025 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531882; cv=none; b=KfI++gv3hfVmadqdVnv2bIsW6tq27OctEczRQOSkzt2HIx7FWe9FwxKz30AXAuvP7C02gTpmB3sO5o0Pdayz1uON3vLO2OJLx+FhdM+t8VVoL/Wbw5iZ19931sUFG0hofRcgMtFDYHJyRHfVhgaYjSBiReNEXAXGwHYcwL30RWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531882; c=relaxed/simple;
	bh=PlXjq0dvXXKkvf064MRiw1gtOEvHJreIjrKAHL+svPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DL7ciCJG7mVmNk6/G64DmWFxEm2fX9zng8kQOJ2OFckoW5oehAS8+onTsimGudRPMilsvHzmQavvscJ0ctWrdOBIb6455kyZxMlImA8aIpnZr5me5cU2972PJ0AG1tjplQ39GZAsgQCuqFwaGAAZY47n6A5xpv96I7ZNS0vSFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CACLwExt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CACLwExt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745531880; x=1777067880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlXjq0dvXXKkvf064MRiw1gtOEvHJreIjrKAHL+svPk=;
  b=CACLwExteDl9DnyoeL6bjwBBdhrx7LU3SJoB6lNdC+xWU79QPZo2gyj4
   eJLgjCbpyEBLvAhhbZ++HalGmpbjB75WWY6SkBfbqMO5pIkQDKKSOpfZc
   VlNxkF4YGzHtSnvc9cvATzdnM6oVVXZSChOMvWWUGaMfaOiNTzVGRnkIW
   VB/6AKeQ5atPapg1p1IJX6RjQQ6xXT38vAWClZ6SkPx6QP7xIiEwZZwuo
   xgX5ETuqiC5BSMBt8DNhcaVr/VxIAkeMvLqxQvHMmPB2aZlXXk5FquTWy
   vs7skFmWxeizHeDcIwxJvAlZf73Z+kV/bnRiieqO0tNLIgQOT+u25a+8S
   A==;
X-CSE-ConnectionGUID: FkKLmdZ8T267Pq9pboO7nA==
X-CSE-MsgGUID: MmZmTBW0S/ipKhy4yLX0eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64603963"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="64603963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 14:57:59 -0700
X-CSE-ConnectionGUID: lXP+fitwQE2gD9MAzW/wQw==
X-CSE-MsgGUID: wcEx60nrQsyK2HVwR2puZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133659198"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2025 14:57:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u84Zv-0004cl-2U;
	Thu, 24 Apr 2025 21:57:55 +0000
Date: Fri, 25 Apr 2025 05:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: [linux-next:master 4516/6092]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:10188:21: error: use of undeclared
 identifier 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT'
Message-ID: <202504250543.nHH98zvp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 0fcad44a86bdc2b5f202d91ba1eeeee6fceb7b25 [4516/6092] bnxt_en: Change FW message timeout warning
config: i386-buildonly-randconfig-003-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250543.nHH98zvp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250543.nHH98zvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250543.nHH98zvp-lkp@intel.com/

Note: the linux-next/master HEAD 393d0c54cae31317deaa9043320c5fd9454deabc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10188:21: error: use of undeclared identifier 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT'
    10188 |             max_tmo_secs > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT) {
          |                            ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10188:21: error: use of undeclared identifier 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT'
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10188:21: error: use of undeclared identifier 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT'
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10190:22: error: use of undeclared identifier 'CONFIG_DEFAULT_HUNG_TASK_TIMEOUT'
    10190 |                             max_tmo_secs, CONFIG_DEFAULT_HUNG_TASK_TIMEOUT);
          |                                           ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:15080:44: warning: shift count >= width of type [-Wshift-count-overflow]
    15080 |         if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0 &&
          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
    15081 |             dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
          |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:15080:44: warning: shift count >= width of type [-Wshift-count-overflow]
    15080 |         if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0 &&
          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
    15081 |             dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
          |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:15080:44: warning: shift count >= width of type [-Wshift-count-overflow]
    15080 |         if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0 &&
          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
    15081 |             dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
          |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   3 warnings and 4 errors generated.


vim +/CONFIG_DEFAULT_HUNG_TASK_TIMEOUT +10188 drivers/net/ethernet/broadcom/bnxt/bnxt.c

 10106	
 10107	static int bnxt_hwrm_ver_get(struct bnxt *bp)
 10108	{
 10109		struct hwrm_ver_get_output *resp;
 10110		struct hwrm_ver_get_input *req;
 10111		u16 fw_maj, fw_min, fw_bld, fw_rsv;
 10112		u32 dev_caps_cfg, hwrm_ver;
 10113		int rc, len, max_tmo_secs;
 10114	
 10115		rc = hwrm_req_init(bp, req, HWRM_VER_GET);
 10116		if (rc)
 10117			return rc;
 10118	
 10119		hwrm_req_flags(bp, req, BNXT_HWRM_FULL_WAIT);
 10120		bp->hwrm_max_req_len = HWRM_MAX_REQ_LEN;
 10121		req->hwrm_intf_maj = HWRM_VERSION_MAJOR;
 10122		req->hwrm_intf_min = HWRM_VERSION_MINOR;
 10123		req->hwrm_intf_upd = HWRM_VERSION_UPDATE;
 10124	
 10125		resp = hwrm_req_hold(bp, req);
 10126		rc = hwrm_req_send(bp, req);
 10127		if (rc)
 10128			goto hwrm_ver_get_exit;
 10129	
 10130		memcpy(&bp->ver_resp, resp, sizeof(struct hwrm_ver_get_output));
 10131	
 10132		bp->hwrm_spec_code = resp->hwrm_intf_maj_8b << 16 |
 10133				     resp->hwrm_intf_min_8b << 8 |
 10134				     resp->hwrm_intf_upd_8b;
 10135		if (resp->hwrm_intf_maj_8b < 1) {
 10136			netdev_warn(bp->dev, "HWRM interface %d.%d.%d is older than 1.0.0.\n",
 10137				    resp->hwrm_intf_maj_8b, resp->hwrm_intf_min_8b,
 10138				    resp->hwrm_intf_upd_8b);
 10139			netdev_warn(bp->dev, "Please update firmware with HWRM interface 1.0.0 or newer.\n");
 10140		}
 10141	
 10142		hwrm_ver = HWRM_VERSION_MAJOR << 16 | HWRM_VERSION_MINOR << 8 |
 10143				HWRM_VERSION_UPDATE;
 10144	
 10145		if (bp->hwrm_spec_code > hwrm_ver)
 10146			snprintf(bp->hwrm_ver_supp, FW_VER_STR_LEN, "%d.%d.%d",
 10147				 HWRM_VERSION_MAJOR, HWRM_VERSION_MINOR,
 10148				 HWRM_VERSION_UPDATE);
 10149		else
 10150			snprintf(bp->hwrm_ver_supp, FW_VER_STR_LEN, "%d.%d.%d",
 10151				 resp->hwrm_intf_maj_8b, resp->hwrm_intf_min_8b,
 10152				 resp->hwrm_intf_upd_8b);
 10153	
 10154		fw_maj = le16_to_cpu(resp->hwrm_fw_major);
 10155		if (bp->hwrm_spec_code > 0x10803 && fw_maj) {
 10156			fw_min = le16_to_cpu(resp->hwrm_fw_minor);
 10157			fw_bld = le16_to_cpu(resp->hwrm_fw_build);
 10158			fw_rsv = le16_to_cpu(resp->hwrm_fw_patch);
 10159			len = FW_VER_STR_LEN;
 10160		} else {
 10161			fw_maj = resp->hwrm_fw_maj_8b;
 10162			fw_min = resp->hwrm_fw_min_8b;
 10163			fw_bld = resp->hwrm_fw_bld_8b;
 10164			fw_rsv = resp->hwrm_fw_rsvd_8b;
 10165			len = BC_HWRM_STR_LEN;
 10166		}
 10167		bp->fw_ver_code = BNXT_FW_VER_CODE(fw_maj, fw_min, fw_bld, fw_rsv);
 10168		snprintf(bp->fw_ver_str, len, "%d.%d.%d.%d", fw_maj, fw_min, fw_bld,
 10169			 fw_rsv);
 10170	
 10171		if (strlen(resp->active_pkg_name)) {
 10172			int fw_ver_len = strlen(bp->fw_ver_str);
 10173	
 10174			snprintf(bp->fw_ver_str + fw_ver_len,
 10175				 FW_VER_STR_LEN - fw_ver_len - 1, "/pkg %s",
 10176				 resp->active_pkg_name);
 10177			bp->fw_cap |= BNXT_FW_CAP_PKG_VER;
 10178		}
 10179	
 10180		bp->hwrm_cmd_timeout = le16_to_cpu(resp->def_req_timeout);
 10181		if (!bp->hwrm_cmd_timeout)
 10182			bp->hwrm_cmd_timeout = DFLT_HWRM_CMD_TIMEOUT;
 10183		bp->hwrm_cmd_max_timeout = le16_to_cpu(resp->max_req_timeout) * 1000;
 10184		if (!bp->hwrm_cmd_max_timeout)
 10185			bp->hwrm_cmd_max_timeout = HWRM_CMD_MAX_TIMEOUT;
 10186		max_tmo_secs = bp->hwrm_cmd_max_timeout / 1000;
 10187		if (bp->hwrm_cmd_max_timeout > HWRM_CMD_MAX_TIMEOUT ||
 10188		    max_tmo_secs > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT) {
 10189			netdev_warn(bp->dev, "Device requests max timeout of %d seconds, may trigger hung task watchdog (kernel default %ds)\n",
 10190				    max_tmo_secs, CONFIG_DEFAULT_HUNG_TASK_TIMEOUT);
 10191		}
 10192	
 10193		if (resp->hwrm_intf_maj_8b >= 1) {
 10194			bp->hwrm_max_req_len = le16_to_cpu(resp->max_req_win_len);
 10195			bp->hwrm_max_ext_req_len = le16_to_cpu(resp->max_ext_req_len);
 10196		}
 10197		if (bp->hwrm_max_ext_req_len < HWRM_MAX_REQ_LEN)
 10198			bp->hwrm_max_ext_req_len = HWRM_MAX_REQ_LEN;
 10199	
 10200		bp->chip_num = le16_to_cpu(resp->chip_num);
 10201		bp->chip_rev = resp->chip_rev;
 10202		if (bp->chip_num == CHIP_NUM_58700 && !resp->chip_rev &&
 10203		    !resp->chip_metal)
 10204			bp->flags |= BNXT_FLAG_CHIP_NITRO_A0;
 10205	
 10206		dev_caps_cfg = le32_to_cpu(resp->dev_caps_cfg);
 10207		if ((dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_SHORT_CMD_SUPPORTED) &&
 10208		    (dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_SHORT_CMD_REQUIRED))
 10209			bp->fw_cap |= BNXT_FW_CAP_SHORT_CMD;
 10210	
 10211		if (dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_KONG_MB_CHNL_SUPPORTED)
 10212			bp->fw_cap |= BNXT_FW_CAP_KONG_MB_CHNL;
 10213	
 10214		if (dev_caps_cfg &
 10215		    VER_GET_RESP_DEV_CAPS_CFG_FLOW_HANDLE_64BIT_SUPPORTED)
 10216			bp->fw_cap |= BNXT_FW_CAP_OVS_64BIT_HANDLE;
 10217	
 10218		if (dev_caps_cfg &
 10219		    VER_GET_RESP_DEV_CAPS_CFG_TRUSTED_VF_SUPPORTED)
 10220			bp->fw_cap |= BNXT_FW_CAP_TRUSTED_VF;
 10221	
 10222		if (dev_caps_cfg &
 10223		    VER_GET_RESP_DEV_CAPS_CFG_CFA_ADV_FLOW_MGNT_SUPPORTED)
 10224			bp->fw_cap |= BNXT_FW_CAP_CFA_ADV_FLOW;
 10225	
 10226	hwrm_ver_get_exit:
 10227		hwrm_req_drop(bp, req);
 10228		return rc;
 10229	}
 10230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
