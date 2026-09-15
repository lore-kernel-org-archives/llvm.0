Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C043B6D3;
	Tue, 15 Sep 2026 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509738; cv=none; b=dLTmVAY/+UjhJnGN9WcaCN/zY2jBCbdb8nmda7n1ZYrXRWU29uWf+TNW7HMcX9vLS/Cx4bWIwbWc9G9DXQmP8UxuOTQmNTE9p0uD05HirDL4CJlDicbc9KmzyL2sROsyWgXULf/IoWXAkgsEg/v/OOazprKpLewoBTTdIrk8F9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509738; c=relaxed/simple;
	bh=e6wNEF5g25xqqMrhIjCRxrRUdaK3FoQMy1jZY9qpHIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRbltpFlcoIVqWjfbfoHpERfQSqRa5wnYqWJkBezhmA55wEICKSmtwtbBrZRooS9Wwv/zE+LxPRWbdXrOHvtX7CJlMzhz0MDxibbZBTkU5tRZSKRX5JAU8sVwEPrNhmv/MIfsTJOtzraPCwGwmN7dNWhN8PQRBgITszBDRxux+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJOYV2mj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJOYV2mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789509736; x=1821045736;
  h=date:from:to:cc:subject:message-id;
  bh=e6wNEF5g25xqqMrhIjCRxrRUdaK3FoQMy1jZY9qpHIQ=;
  b=iJOYV2mjaftMcuKx9gpmQWFuxe8FzxJwDyusAt2nuMCEutsYAz1pV9X0
   CU8zqwwO37rAJkLQPmlvXoH102iyeyuG4TC4ZCx4UEB/UtYaGZy/msPue
   H+XamNsoihYSAgdZVfZ3xq5vKBKu3dBN+rIljrEipWHpjpfGiWr7SrZNr
   GEutCPJ6JcMen02E+c0kWmzMSd/Zre/bwhl+5oDHwym72dsWznGVrWF7R
   oZPnGsTr7q8iLXXPnzQITMPw1fahR6R6aBucBQ+pkhpgUEjaY/VW46MCS
   hDW+fq6iDOD2Q4PvMSm8LoRWSSl4wEG7OiZ7w+4AlahBwO6RoZgLZYLVT
   w==;
X-CSE-ConnectionGUID: ljibsLD0QmOM0zL1R3Rc0w==
X-CSE-MsgGUID: fSa7v6CkTvS8Vwz3vJb/ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89929081"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89929081"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 15:02:15 -0700
X-CSE-ConnectionGUID: nEMKgGo8QdKmX4Q8lysKgQ==
X-CSE-MsgGUID: aHNgzJIEQyS8PqWAlwjaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266933268"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2026 15:02:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6bEA-0000000057V-15Pn;
	Tue, 15 Sep 2026 22:02:10 +0000
Date: Wed, 16 Sep 2026 06:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:imx/ele 5/7]
 drivers/firmware/imx/ele_fw_api.c:311:28: error: use of undeclared identifier
 '__free_kfree'; did you mean '__free_pages'?
Message-ID: <202609160545.zdLFFcfQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/ele
head:   211dcfe620fc1038ac5de521d170ea2390c15aea
commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f [5/7] firmware: imx: adds miscdev
config: arm-randconfig-003-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160545.zdLFFcfQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160545.zdLFFcfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160545.zdLFFcfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/ele_fw_api.c:311:28: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     311 |         struct se_api_msg *tx_msg __free(kfree) =
         |                                   ^~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:149:1: note: expanded from here
     149 | __free_kfree
         | ^~~~~~~~~~~~
   include/linux/gfp.h:342:13: note: '__free_pages' declared here
     342 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/firmware/imx/ele_fw_api.c:311:28: error: 'cleanup' function '__free_pages' must take 1 parameter
     311 |         struct se_api_msg *tx_msg __free(kfree) =
         |                                   ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:149:1: note: expanded from here
     149 | __free_kfree
         | ^
>> drivers/firmware/imx/ele_fw_api.c:312:3: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |                 kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
         |                 ^
>> drivers/firmware/imx/ele_fw_api.c:311:21: error: incompatible integer to pointer conversion initializing 'struct se_api_msg *' with an expression of type 'int' [-Wint-conversion]
     311 |         struct se_api_msg *tx_msg __free(kfree) =
         |                            ^
     312 |                 kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:313:28: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     313 |         struct se_api_msg *rx_msg __free(kfree) =
         |                                   ^~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:154:1: note: expanded from here
     154 | __free_kfree
         | ^~~~~~~~~~~~
   include/linux/gfp.h:342:13: note: '__free_pages' declared here
     342 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/firmware/imx/ele_fw_api.c:313:28: error: 'cleanup' function '__free_pages' must take 1 parameter
     313 |         struct se_api_msg *rx_msg __free(kfree) =
         |                                   ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:154:1: note: expanded from here
     154 | __free_kfree
         | ^
   drivers/firmware/imx/ele_fw_api.c:313:21: error: incompatible integer to pointer conversion initializing 'struct se_api_msg *' with an expression of type 'int' [-Wint-conversion]
     313 |         struct se_api_msg *rx_msg __free(kfree) =
         |                            ^
     314 |                 kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:368:28: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     368 |         struct se_api_msg *tx_msg __free(kfree) =
         |                                   ^~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:159:1: note: expanded from here
     159 | __free_kfree
         | ^~~~~~~~~~~~
   include/linux/gfp.h:342:13: note: '__free_pages' declared here
     342 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/firmware/imx/ele_fw_api.c:368:28: error: 'cleanup' function '__free_pages' must take 1 parameter
     368 |         struct se_api_msg *tx_msg __free(kfree) =
         |                                   ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:159:1: note: expanded from here
     159 | __free_kfree
         | ^
   drivers/firmware/imx/ele_fw_api.c:369:3: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     369 |                 kzalloc(ELE_STORAGE_CLOSE_REQ_SZ, GFP_KERNEL);
         |                 ^
   drivers/firmware/imx/ele_fw_api.c:368:21: error: incompatible integer to pointer conversion initializing 'struct se_api_msg *' with an expression of type 'int' [-Wint-conversion]
     368 |         struct se_api_msg *tx_msg __free(kfree) =
         |                            ^
     369 |                 kzalloc(ELE_STORAGE_CLOSE_REQ_SZ, GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:370:28: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     370 |         struct se_api_msg *rx_msg __free(kfree) =
         |                                   ^~~~~~~~~~~~~
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^~~~~~~~~~~~~~
   <scratch space>:164:1: note: expanded from here
     164 | __free_kfree
         | ^~~~~~~~~~~~
   include/linux/gfp.h:342:13: note: '__free_pages' declared here
     342 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/firmware/imx/ele_fw_api.c:370:28: error: 'cleanup' function '__free_pages' must take 1 parameter
     370 |         struct se_api_msg *rx_msg __free(kfree) =
         |                                   ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:164:1: note: expanded from here
     164 | __free_kfree
         | ^
   drivers/firmware/imx/ele_fw_api.c:370:21: error: incompatible integer to pointer conversion initializing 'struct se_api_msg *' with an expression of type 'int' [-Wint-conversion]
     370 |         struct se_api_msg *rx_msg __free(kfree) =
         |                            ^
     371 |                 kzalloc(ELE_STORAGE_CLOSE_RSP_SZ, GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 errors generated.


vim +311 drivers/firmware/imx/ele_fw_api.c

   308	
   309	int se_close_session(struct se_if_device_ctx *dev_ctx, u32 session_hdl)
   310	{
 > 311		struct se_api_msg *tx_msg __free(kfree) =
 > 312			kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
   313		struct se_api_msg *rx_msg __free(kfree) =
   314			kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
   315		struct se_if_priv *priv;
   316		int ret;
   317	
   318		if (!dev_ctx || !dev_ctx->priv)
   319			return -EINVAL;
   320	
   321		if (!tx_msg || !rx_msg)
   322			return -ENOMEM;
   323	
   324		priv = dev_ctx->priv;
   325	
   326		/*
   327		 * Session close is a FW-API command; pass is_base_api=false so the
   328		 * header carries fw_api_ver.
   329		 */
   330		se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
   331				    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, false);
   332	
   333		tx_msg->data[0] = session_hdl;
   334	
   335		/*
   336		 * Transmit on the caller's own context. Using dev_ctx (rather than
   337		 * hardcoding priv->priv_dev_ctx) keeps a userspace close() subject to
   338		 * the going_away check in ele_msg_send_rcv(): if unbind has begun and
   339		 * freed priv->tx_chan, the send is rejected with -ENODEV instead of
   340		 * touching the freed mailbox channel.
   341		 *
   342		 * The teardown and fw_busy-recovery paths instead reserve the messaging
   343		 * interface for their own task via se_reserve_msg_if() before calling
   344		 * this. That reservation (msg_excl_owner == current) is what makes
   345		 * ele_msg_send_rcv() let their resync closes through the going_away and
   346		 * fw_busy gates; they also pass priv_dev_ctx so the wait is the
   347		 * uninterruptible internal-context wait.
   348		 */
   349	
   350		ret = ele_msg_send_rcv(dev_ctx,
   351				       tx_msg,
   352				       ELE_SESSION_CLOSE_REQ_SZ,
   353				       rx_msg,
   354				       ELE_SESSION_CLOSE_RSP_SZ, NULL);
   355		if (ret < 0)
   356			return ret;
   357	
   358		ret = se_val_rsp_hdr_n_status(dev_ctx,
   359					      rx_msg,
   360					      ELE_SESSION_CLOSE_REQ,
   361					      ELE_SESSION_CLOSE_RSP_SZ,
   362					      priv->if_defs->fw_api_ver);
   363		return ret;
   364	}
   365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
