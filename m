Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBF24B24E;
	Sat, 11 Jan 2025 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736601545; cv=none; b=HKeZjk2z+5v5l+F+d8/YOm/U0f3CD0IT1qTjeR8zLV5Ln3OMt0b466RHX4e1RThnRTVqHJyMgaN+ekkzA9qtYYii0B+V825AutBTdGkOmnGnH6ggww3HyDdPKvc2YBTaD8zY2aJ8Vu18meYza8O4mfRSkfigwdhP24FjS7+Sso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736601545; c=relaxed/simple;
	bh=0UW8oiq69J/ERPAI8C8ezuulf1QxMCDdlizy0S35R8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJPGKpFyx+5M9FkE4KysHeu6T2uQWJFVqG35/VXP+HAGy8xx7VuJRcOmT7QeNHnEwwbGuAmiKkiZdA5/lio94k/n5yN1fH1Z+9l3LAXPHQE6jxn0hK6787i+6UX/tnVBd58/givNaBUt4/SlYFIeZ5ZjVfaotUsPNgXEnTntdkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGQMVYVK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGQMVYVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736601544; x=1768137544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UW8oiq69J/ERPAI8C8ezuulf1QxMCDdlizy0S35R8E=;
  b=kGQMVYVK81QCjhjhnYtuM+rthIO7X0IO5ZYdq4Dobd+ccZKFcE6tGP27
   FA+zEkqCcSQYQgk8d78LQEJHEI3QfIkRd2oBxTf336KrUR2plZRQLOtx+
   XEFgA/J4WNzIwbbv8JOSshzoKMPd77wKGUxUJb8RxP6jVKUBmliyEIJZP
   uEAapDPsZYATRvH8vcYQ6fjQmVks96lpye1bRDn4+LckTNbsfseKggZep
   Ce6QROR6UVCnPd1SBRFftMrTj6f8kXc/IzSJZAHneaMGylnvHCuzFb0xU
   XAN8YeI1P4x4vqtdvanK9UkEs1ciWVlG/QelVTb/DC19KYCEbvpiruCqN
   g==;
X-CSE-ConnectionGUID: V7StW84YTamOrdePtWz80Q==
X-CSE-MsgGUID: +WltHFl1Q9WeQ9UXxbJacg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48256935"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="48256935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:19:04 -0800
X-CSE-ConnectionGUID: r+fCFodyTYiZjhHouoL4IA==
X-CSE-MsgGUID: NPDEH/wXTG2F2o14yKf/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104169219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 05:19:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbOF-000Kg3-24;
	Sat, 11 Jan 2025 13:18:59 +0000
Date: Sat, 11 Jan 2025 21:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 268/504]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:708:12: warning: stack frame size
 (1104) exceeds limit (1024) in 'xlnx_hdcp2x_tx_write_msg'
Message-ID: <202501112101.bseGgj4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 7767c6c758a3a49cececb97db53bfa3d90d44d85 [268/504] drm: xlnx: ADD HDMI supportive HDCP functionality
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501112101.bseGgj4Z-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112101.bseGgj4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112101.bseGgj4Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:708:12: warning: stack frame size (1104) exceeds limit (1024) in 'xlnx_hdcp2x_tx_write_msg' [-Wframe-larger-than]
     708 | static int xlnx_hdcp2x_tx_write_msg(struct xlnx_hdcp2x_config *xhdcp2x_tx)
         |            ^
   7 warnings generated.


vim +/xlnx_hdcp2x_tx_write_msg +708 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c

7767c6c758a3a4 Lakshmi Prasanna Eachuri 2023-05-03  707  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03 @708  static int xlnx_hdcp2x_tx_write_msg(struct xlnx_hdcp2x_config *xhdcp2x_tx)
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  709  {
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  710  	struct xhdcp2x_tx_msg buffer;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  711  	int message_size = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  712  	int status = -EINVAL;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  713  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  714  	memcpy(&buffer, xhdcp2x_tx->msg_buffer, sizeof(struct xhdcp2x_tx_msg));
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  715  
7767c6c758a3a4 Lakshmi Prasanna Eachuri 2023-05-03  716  	if (xhdcp2x_tx->is_hdmi)
7767c6c758a3a4 Lakshmi Prasanna Eachuri 2023-05-03  717  		return xlnx_hdmi_hdcp2x_tx_write_msg(xhdcp2x_tx);
7767c6c758a3a4 Lakshmi Prasanna Eachuri 2023-05-03  718  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  719  	switch (buffer.msg_type.msg_id) {
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  720  	case HDCP_2_2_AKE_INIT:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  721  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  722  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  723  							HDCP2X_TX_HDCPPORT_R_TX_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  724  							buffer.msg_type.ake_int.r_tx,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  725  							HDCP_2_2_RTX_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  726  		message_size +=
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  727  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  728  							HDCP2X_TX_HDCPPORT_TX_CAPS_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  729  							buffer.msg_type.ake_int.txcaps,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  730  							HDCP2X_TX_TXCAPS_SIZE);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  731  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  732  		if (message_size == (HDCP_2_2_RTX_LEN + HDCP2X_TX_TXCAPS_SIZE))
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  733  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  734  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  735  	case HDCP_2_2_AKE_NO_STORED_KM:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  736  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  737  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  738  						HDCP2X_TX_HDCPPORT_E_KPUB_KM_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  739  						buffer.msg_type.ake_nostored_km.ek_pubkm,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  740  						HDCP2X_TX_HDCPPORT_E_KPUB_KM_SIZE);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  741  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  742  		if (message_size == HDCP2X_TX_HDCPPORT_E_KPUB_KM_SIZE)
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  743  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  744  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  745  	case HDCP_2_2_AKE_STORED_KM:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  746  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  747  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  748  							HDCP2X_TX_HDCPPORT_E_KH_KM_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  749  							buffer.msg_type.ake_stored_km.ekh_km,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  750  							HDCP_2_2_E_KH_KM_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  751  		message_size +=
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  752  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  753  							HDCP2X_TX_HDCPPORT_M_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  754  							buffer.msg_type.ake_stored_km.r_tx,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  755  							HDCP_2_2_E_KH_KM_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  756  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  757  		if (message_size == (HDCP_2_2_E_KH_KM_LEN + HDCP_2_2_E_KH_KM_LEN))
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  758  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  759  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  760  	case HDCP_2_2_LC_INIT:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  761  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  762  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  763  							HDCP2X_TX_HDCPPORT_R_N_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  764  							buffer.msg_type.lcinit.rn,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  765  							HDCP_2_2_RN_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  766  		if (message_size == HDCP_2_2_RN_LEN)
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  767  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  768  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  769  	case HDCP_2_2_SKE_SEND_EKS:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  770  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  771  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  772  							HDCP2X_TX_HDCPPORT_E_DKEY_KS_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  773  							buffer.msg_type.ske_send_eks.edkeys_ks,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  774  							HDCP_2_2_E_DKEY_KS_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  775  		message_size +=
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  776  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  777  							HDCP2X_TX_HDCPPORT_R_IV_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  778  							buffer.msg_type.ske_send_eks.riv,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  779  							HDCP_2_2_RIV_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  780  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  781  		if (message_size == (HDCP_2_2_E_DKEY_KS_LEN +
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  782  				HDCP_2_2_RIV_LEN))
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  783  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  784  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  785  	case HDCP2X_TX_TYPE_VALUE:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  786  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  787  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  788  							HDCP2X_TX_HDCPPORT_TYPE_VALUE_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  789  							(u8 *)&xhdcp2x_tx
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  790  							->xhdcp2x_info.content_stream_type,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  791  							HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  792  		if (message_size == HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE)
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  793  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  794  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  795  	case HDCP_2_2_REP_SEND_ACK:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  796  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  797  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  798  							HDCP2X_TX_HDCPPORT_V_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  799  							buffer.msg_type.rpt_auth_send_ack.V,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  800  							HDCP_2_2_V_PRIME_HALF_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  801  		if (message_size == HDCP_2_2_V_PRIME_HALF_LEN)
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  802  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  803  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  804  	case HDCP_2_2_REP_STREAM_MANAGE:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  805  		message_size =
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  806  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  807  						HDCP2X_TX_HDCPPORT_SEQ_NUM_M_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  808  						buffer.msg_type.rpt_auth_stream_mng.seq_num_m,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  809  						HDCP_2_2_SEQ_NUM_LEN);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  810  		message_size +=
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  811  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  812  							HDCP2X_TX_HDCPPORT_K_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  813  							buffer.msg_type.rpt_auth_stream_mng.K,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  814  							HDCP2X_TX_HDCPPORT_K_SIZE);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  815  		message_size +=
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  816  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  817  						HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_OFFSET,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  818  						buffer.msg_type.rpt_auth_stream_mng.streamid_type,
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  819  						HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_SIZE);
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  820  		if (message_size == (HDCP_2_2_SEQ_NUM_LEN +
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  821  				HDCP2X_TX_HDCPPORT_K_SIZE +
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  822  				HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_SIZE))
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  823  			status = 0;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  824  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  825  	default:
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  826  		status = -EINVAL;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  827  		break;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  828  	}
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  829  
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  830  	return status;
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  831  }
6c8caf3eeadd38 Lakshmi Prasanna Eachuri 2023-02-03  832  

:::::: The code at line 708 was first introduced by commit
:::::: 6c8caf3eeadd38ffab47f6cfb7dba45556256143 drm: xlnx: Add HDCP2X TX support

:::::: TO: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
