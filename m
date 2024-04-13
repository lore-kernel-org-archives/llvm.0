Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99561CD2A;
	Sat, 13 Apr 2024 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712993112; cv=none; b=ilXO+vt5BYAd32whDz56FtIYH4iEoshz+RBj90ymxguZghaikviZnf6s63CIo+OV6J6Qi+6optMk085K8o4RYwcnyA3tlrsYIfMmRf3UG0GHI+XxIKkYOqRMLttCH6bz9E1fdeSAxY2Md464g99rEteVp/SICg+osTEqOEUeeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712993112; c=relaxed/simple;
	bh=Vn2posedlsVa3ju0PcU1aWwUSqt1EHxgUwxNYoDPnko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uawdHQ+fpcimkP/moaLPJ5CIAo4FFiiOoUWIAcI4MrjNAA591ahpnHVXNsN/kNQ75iUtw9uEuhT+LyM7j9gy2dvo7aNhXq2gSnDWXCaMHcOlCSKk1icAYbAq51WKO00De2iJgQaeTUs5zY8RjHHfoqMS6UPFLTrwp8ppzDwprZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlCZ0WGM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlCZ0WGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712993110; x=1744529110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn2posedlsVa3ju0PcU1aWwUSqt1EHxgUwxNYoDPnko=;
  b=YlCZ0WGMb/iBrSJfSsOYttkuHb87O0oMtbGKLmqOW3gX1q0C63UfUrFD
   negvRyANRaC0wPDho7UsOlZvgqDoJZ8kkNBanRwEoCkSBJ/GTCHi8d44M
   EIsqTu4ZmwpCilADo9teqRis9BWT4rMDMmrU0WM47CPumgX+Dytf0GET5
   Bn/C3mQMdbweetpJi59ckRfDzORt7S45SAUGAuKu5lf/8l9ZTytim/5bm
   l6vg7OHXKdXnMjiGneYRk8GeXbUIFFfxG7lwfwH6tLKrqFRRvJ4OWQ/fT
   kLq4s4wZ2xbF6ttrn9njVo8ZOgXQyydqp4HFyTv6m311rBwrF5T/+19kQ
   Q==;
X-CSE-ConnectionGUID: K5KtlUfnR1WniXOziX04fw==
X-CSE-MsgGUID: Mh2XT5HGTAWmsk5xnhhEIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19845472"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19845472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 00:25:09 -0700
X-CSE-ConnectionGUID: 3R5NuyL9SeGmi3+prbOLMQ==
X-CSE-MsgGUID: 0hVh6pVOSQikBMIFJB8Mvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21420414"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2024 00:25:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXl2-00020e-2C;
	Sat, 13 Apr 2024 07:25:04 +0000
Date: Sat, 13 Apr 2024 15:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 1048/1106]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:715:12: warning: stack frame size
 (1104) exceeds limit (1024) in 'xlnx_hdcp2x_tx_write_msg'
Message-ID: <202404131528.sTqC5YEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   0d9603210775896b7fc08adfa902f815da590092
commit: 5c47c817a83622f4f1eb629ba00ea0203ef21561 [1048/1106] drm: xlnx: hdcp: Fix xlnx_hdcp2x_downstream_capbility() return checks
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240413/202404131528.sTqC5YEt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131528.sTqC5YEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131528.sTqC5YEt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:108:22: warning: variable 'srm_version' set but not used [-Wunused-but-set-variable]
     108 |         u16 num_of_devices, srm_version;
         |                             ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:715:12: warning: stack frame size (1104) exceeds limit (1024) in 'xlnx_hdcp2x_tx_write_msg' [-Wframe-larger-than]
     715 | static int xlnx_hdcp2x_tx_write_msg(struct xlnx_hdcp2x_config *xhdcp2x_tx)
         |            ^
   8 warnings generated.


vim +/xlnx_hdcp2x_tx_write_msg +715 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c

e79876647a9bd6 Lakshmi Prasanna Eachuri 2023-05-03  714  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03 @715  static int xlnx_hdcp2x_tx_write_msg(struct xlnx_hdcp2x_config *xhdcp2x_tx)
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  716  {
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  717  	struct xhdcp2x_tx_msg buffer;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  718  	int message_size = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  719  	int status = -EINVAL;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  720  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  721  	memcpy(&buffer, xhdcp2x_tx->msg_buffer, sizeof(struct xhdcp2x_tx_msg));
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  722  
e79876647a9bd6 Lakshmi Prasanna Eachuri 2023-05-03  723  	if (xhdcp2x_tx->is_hdmi)
e79876647a9bd6 Lakshmi Prasanna Eachuri 2023-05-03  724  		return xlnx_hdmi_hdcp2x_tx_write_msg(xhdcp2x_tx);
e79876647a9bd6 Lakshmi Prasanna Eachuri 2023-05-03  725  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  726  	switch (buffer.msg_type.msg_id) {
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  727  	case HDCP_2_2_AKE_INIT:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  728  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  729  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  730  							HDCP2X_TX_HDCPPORT_R_TX_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  731  							buffer.msg_type.ake_int.r_tx,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  732  							HDCP_2_2_RTX_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  733  		message_size +=
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  734  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  735  							HDCP2X_TX_HDCPPORT_TX_CAPS_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  736  							buffer.msg_type.ake_int.txcaps,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  737  							HDCP2X_TX_TXCAPS_SIZE);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  738  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  739  		if (message_size == (HDCP_2_2_RTX_LEN + HDCP2X_TX_TXCAPS_SIZE))
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  740  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  741  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  742  	case HDCP_2_2_AKE_NO_STORED_KM:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  743  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  744  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  745  						HDCP2X_TX_HDCPPORT_E_KPUB_KM_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  746  						buffer.msg_type.ake_nostored_km.ek_pubkm,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  747  						HDCP2X_TX_HDCPPORT_E_KPUB_KM_SIZE);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  748  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  749  		if (message_size == HDCP2X_TX_HDCPPORT_E_KPUB_KM_SIZE)
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  750  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  751  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  752  	case HDCP_2_2_AKE_STORED_KM:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  753  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  754  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  755  							HDCP2X_TX_HDCPPORT_E_KH_KM_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  756  							buffer.msg_type.ake_stored_km.ekh_km,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  757  							HDCP_2_2_E_KH_KM_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  758  		message_size +=
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  759  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  760  							HDCP2X_TX_HDCPPORT_M_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  761  							buffer.msg_type.ake_stored_km.r_tx,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  762  							HDCP_2_2_E_KH_KM_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  763  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  764  		if (message_size == (HDCP_2_2_E_KH_KM_LEN + HDCP_2_2_E_KH_KM_LEN))
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  765  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  766  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  767  	case HDCP_2_2_LC_INIT:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  768  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  769  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  770  							HDCP2X_TX_HDCPPORT_R_N_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  771  							buffer.msg_type.lcinit.rn,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  772  							HDCP_2_2_RN_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  773  		if (message_size == HDCP_2_2_RN_LEN)
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  774  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  775  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  776  	case HDCP_2_2_SKE_SEND_EKS:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  777  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  778  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  779  							HDCP2X_TX_HDCPPORT_E_DKEY_KS_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  780  							buffer.msg_type.ske_send_eks.edkeys_ks,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  781  							HDCP_2_2_E_DKEY_KS_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  782  		message_size +=
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  783  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  784  							HDCP2X_TX_HDCPPORT_R_IV_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  785  							buffer.msg_type.ske_send_eks.riv,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  786  							HDCP_2_2_RIV_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  787  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  788  		if (message_size == (HDCP_2_2_E_DKEY_KS_LEN +
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  789  				HDCP_2_2_RIV_LEN))
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  790  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  791  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  792  	case HDCP2X_TX_TYPE_VALUE:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  793  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  794  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  795  							HDCP2X_TX_HDCPPORT_TYPE_VALUE_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  796  							(u8 *)&xhdcp2x_tx
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  797  							->xhdcp2x_info.content_stream_type,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  798  							HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  799  		if (message_size == HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE)
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  800  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  801  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  802  	case HDCP_2_2_REP_SEND_ACK:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  803  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  804  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  805  							HDCP2X_TX_HDCPPORT_V_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  806  							buffer.msg_type.rpt_auth_send_ack.V,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  807  							HDCP_2_2_V_PRIME_HALF_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  808  		if (message_size == HDCP_2_2_V_PRIME_HALF_LEN)
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  809  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  810  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  811  	case HDCP_2_2_REP_STREAM_MANAGE:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  812  		message_size =
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  813  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  814  						HDCP2X_TX_HDCPPORT_SEQ_NUM_M_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  815  						buffer.msg_type.rpt_auth_stream_mng.seq_num_m,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  816  						HDCP_2_2_SEQ_NUM_LEN);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  817  		message_size +=
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  818  			xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  819  							HDCP2X_TX_HDCPPORT_K_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  820  							buffer.msg_type.rpt_auth_stream_mng.K,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  821  							HDCP2X_TX_HDCPPORT_K_SIZE);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  822  		message_size +=
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  823  		xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  824  						HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_OFFSET,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  825  						buffer.msg_type.rpt_auth_stream_mng.streamid_type,
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  826  						HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_SIZE);
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  827  		if (message_size == (HDCP_2_2_SEQ_NUM_LEN +
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  828  				HDCP2X_TX_HDCPPORT_K_SIZE +
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  829  				HDCP2X_TX_HDCPPORT_STREAM_ID_TYPE_SIZE))
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  830  			status = 0;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  831  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  832  	default:
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  833  		status = -EINVAL;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  834  		break;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  835  	}
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  836  
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  837  	return status;
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  838  }
f5e31866859a5b Lakshmi Prasanna Eachuri 2023-02-03  839  

:::::: The code at line 715 was first introduced by commit
:::::: f5e31866859a5b682c6668e40f17b5f760dca9c1 drm: xlnx: Add HDCP2X TX support

:::::: TO: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
