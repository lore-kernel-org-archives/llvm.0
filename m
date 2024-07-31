Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0539214B097;
	Wed, 31 Jul 2024 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722469813; cv=none; b=R/h3sKdAl+3xM6BxeRuB95zPMFxJwt4GicC6JtjKaX3g4UD3zWLiDxZUtGYb7INFMC8ms+AkespAdeBnxspMEDJwpMND1bqI3vaQhhmcxWFe9MZA/kua/9T+Zq9Y2WFyDhhvbGIIyMmT0HhToTcATtNYLxIPV9no1D+vxjE1NFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722469813; c=relaxed/simple;
	bh=4HLecaxdK+yfbz/zGjVVi+UUyI4yNOMCKZGAv9vWrP8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIWR0X+LLYoSFKyC08xlfs/sSTBSGLYqbUMLmyWXSVIzZE2wPlL72A0muleY18H0tlV6qWwRJ5SIVyV9gutLnKNen/1YZiWflT3FfkN3vFMh0j0TuewSMl41givvEemkZzmaqaL2XdpSLxWnOvU71RO+bwNo+FhFZ42QNLcLDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2lfYPsg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2lfYPsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722469811; x=1754005811;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4HLecaxdK+yfbz/zGjVVi+UUyI4yNOMCKZGAv9vWrP8=;
  b=A2lfYPsgkDY/TAOr7yJcUJHpS3/J9DBEQJJsKpidjbdEsYgF2dsi9zIK
   XFfOwSMKExlqV0Wh9I8k5PrHi7L8Pnzg8BPuD1oFFcI43ZP4pmM9js3cC
   hzzs3VU94y+F0BTLu2bHtA4fRxIv7vzlLhxaHAOywOXqDB5PDv7xlCXbb
   Zq0Venr3XRFJDn3X2tYjTEx9KNYJ2Lf03qX9XE26RvXvvv3jhzV4c6E4a
   dTyqOMo8qrK8zvaOKzH8W443nBGrlKjiqQoRSwghnEepID9CGAOHmBOIX
   DaAKp420epYwqZDbKGMaIXDhntBq1hhZoz3CixgENqcW7Xi54fUQSN+il
   Q==;
X-CSE-ConnectionGUID: FpHokta5TPS2wg1+2QkDQQ==
X-CSE-MsgGUID: 9bKBVO48Sw+1jZZpAIVIIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37858612"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="37858612"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 16:50:08 -0700
X-CSE-ConnectionGUID: sljn90/LTayqrBSzVDSzcQ==
X-CSE-MsgGUID: xlcDpGqNSMevAut1eEJz3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="55092135"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2024 16:50:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZJ52-000uwk-14;
	Wed, 31 Jul 2024 23:50:04 +0000
Date: Thu, 1 Aug 2024 07:49:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: rust_doctest_kernel_net_phy_rs_0+0x3f:
 missing int3 after ret
Message-ID: <202408010754.pO5KhFPb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b136cc63d2a9ddd60d4699552b69c214b32964
commit: 4589f199eb68afd462bd792f730c7936fe3dafb5 Merge branch 'x86/bugs' into x86/core, to pick up pending changes before dependent patches
date:   6 months ago
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010754.pO5KhFPb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010754.pO5KhFPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010754.pO5KhFPb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs9B_Cs7fGah6ScHfQ_4uapiNtB6_15sg_mapping_iterNtNtCs7qddEHlz8fK_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9C_Cs7fGah6ScHfQ_4uapiNtB6_22in6_addr__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9D_Cs7fGah6ScHfQ_4uapiNtB6_8in6_addrNtNtCs7qddEHlz8fK_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9E_Cs7fGah6ScHfQ_4uapiNtB6_12sockaddr_in6NtNtCs7qddEHlz8fK_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9F_Cs7fGah6ScHfQ_4uapiNtB6_9ipv6_mreqNtNtCs7qddEHlz8fK_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9G_Cs7fGah6ScHfQ_4uapiNtB6_17in6_flowlabel_reqNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9I_Cs7fGah6ScHfQ_4uapiNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9L_Cs7fGah6ScHfQ_4uapiNtB6_27flow_dissector_key_enc_optsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9M_Cs7fGah6ScHfQ_4uapiNtB6_29flow_dissector_key_ipv6_addrsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9N_Cs7fGah6ScHfQ_4uapiNtB6_38flow_dissector_key_addrs__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9O_Cs7fGah6ScHfQ_4uapiNtB6_24flow_dissector_key_addrsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9V_Cs7fGah6ScHfQ_4uapiNtB6_14flow_dissectorNtNtCs7qddEHlz8fK_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9W_Cs7fGah6ScHfQ_4uapiNtB6_9flow_keysNtNtCs7qddEHlz8fK_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa0_Cs7fGah6ScHfQ_4uapiNtB6_12tpacket3_hdrNtNtCs7qddEHlz8fK_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa3_Cs7fGah6ScHfQ_4uapiNtB6_14tpacket_hdr_v1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa5_Cs7fGah6ScHfQ_4uapiNtB6_18tpacket_block_descNtNtCs7qddEHlz8fK_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa6_Cs7fGah6ScHfQ_4uapiNtB6_13tpacket_req_uNtNtCs7qddEHlz8fK_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa8_Cs7fGah6ScHfQ_4uapiNtB6_6flowi4NtNtCs7qddEHlz8fK_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa9_Cs7fGah6ScHfQ_4uapiNtB6_6flowi6NtNtCs7qddEHlz8fK_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaa_Cs7fGah6ScHfQ_4uapiNtB6_19flowi__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsab_Cs7fGah6ScHfQ_4uapiNtB6_5flowiNtNtCs7qddEHlz8fK_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaf_Cs7fGah6ScHfQ_4uapiNtB6_12sk_buff_headNtNtCs7qddEHlz8fK_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsam_Cs7fGah6ScHfQ_4uapiNtB6_15ubuf_info_msgzcNtNtCs7qddEHlz8fK_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsap_Cs7fGah6ScHfQ_4uapiNtB6_15skb_shared_infoNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsar_Cs7fGah6ScHfQ_4uapiNtB6_35sk_buff__bindgen_ty_1__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaB_Cs7fGah6ScHfQ_4uapiNtB6_35sk_buff__bindgen_ty_5__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaK_Cs7fGah6ScHfQ_4uapiNtB6_21sk_buff__bindgen_ty_5NtNtCs7qddEHlz8fK_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaL_Cs7fGah6ScHfQ_4uapiNtB6_7sk_buffNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaN_Cs7fGah6ScHfQ_4uapiNtB6_15sk_buff_fclonesNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaO_Cs7fGah6ScHfQ_4uapiNtB6_13skb_seq_stateNtNtCs7qddEHlz8fK_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaQ_Cs7fGah6ScHfQ_4uapiNtB6_9sockptr_tNtNtCs7qddEHlz8fK_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaS_Cs7fGah6ScHfQ_4uapiNtB6_9socket_wqNtNtCs7qddEHlz8fK_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaT_Cs7fGah6ScHfQ_4uapiNtB6_6socketNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaV_Cs7fGah6ScHfQ_4uapiNtB6_17read_descriptor_tNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaW_Cs7fGah6ScHfQ_4uapiNtB6_9proto_opsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaZ_Cs7fGah6ScHfQ_4uapiNtB6_7nsproxyNtNtCs7qddEHlz8fK_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb1_Cs7fGah6ScHfQ_4uapiNtB6_14compat_rtentryNtNtCs7qddEHlz8fK_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb2_Cs7fGah6ScHfQ_4uapiNtB6_16compat_group_reqNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb3_Cs7fGah6ScHfQ_4uapiNtB6_23compat_group_source_reqNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb4_Cs7fGah6ScHfQ_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb5_Cs7fGah6ScHfQ_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb6_Cs7fGah6ScHfQ_4uapiNtB6_33compat_group_filter__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb7_Cs7fGah6ScHfQ_4uapiNtB6_19compat_group_filterNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb8_Cs7fGah6ScHfQ_4uapiNtB6_11scm_fp_listNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb9_Cs7fGah6ScHfQ_4uapiNtB6_10scm_cookieNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsba_Cs7fGah6ScHfQ_4uapiNtB6_17netlink_skb_parmsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbb_Cs7fGah6ScHfQ_4uapiNtB6_18netlink_kernel_cfgNtNtCs7qddEHlz8fK_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbc_Cs7fGah6ScHfQ_4uapiNtB6_15netlink_ext_ackNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbe_Cs7fGah6ScHfQ_4uapiNtB6_16netlink_callbackNtNtCs7qddEHlz8fK_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbg_Cs7fGah6ScHfQ_4uapiNtB6_20netlink_dump_controlNtNtCs7qddEHlz8fK_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbi_Cs7fGah6ScHfQ_4uapiNtB6_15ethtool_tunableNtNtCs7qddEHlz8fK_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbk_Cs7fGah6ScHfQ_4uapiNtB6_20ethtool_rx_flow_specNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbm_Cs7fGah6ScHfQ_4uapiNtB6_13ethtool_rxnfcNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbn_Cs7fGah6ScHfQ_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbo_Cs7fGah6ScHfQ_4uapiNtB6_27ethtool_rx_ntuple_flow_specNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbp_Cs7fGah6ScHfQ_4uapiNtB6_17ethtool_rx_ntupleNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbq_Cs7fGah6ScHfQ_4uapiNtB6_13ethtool_flashNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbr_Cs7fGah6ScHfQ_4uapiNtB6_20ethtool_per_queue_opNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbt_Cs7fGah6ScHfQ_4uapiNtB6_20compat_ethtool_rxnfcNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbw_Cs7fGah6ScHfQ_4uapiNtB6_35ethtool_eth_mac_stats__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbx_Cs7fGah6ScHfQ_4uapiNtB6_21ethtool_eth_mac_statsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbB_Cs7fGah6ScHfQ_4uapiNtB6_22ethtool_eth_ctrl_statsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbD_Cs7fGah6ScHfQ_4uapiNtB6_19ethtool_pause_statsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbE_Cs7fGah6ScHfQ_4uapiNtB6_32ethtool_rmon_stats__bindgen_ty_1NtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbF_Cs7fGah6ScHfQ_4uapiNtB6_18ethtool_rmon_statsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbG_Cs7fGah6ScHfQ_4uapiNtB6_21ethtool_module_eepromNtNtCs7qddEHlz8fK_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbH_Cs7fGah6ScHfQ_4uapiNtB6_32ethtool_module_power_mode_paramsNtNtCs7qddEHlz8fK_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbI_Cs7fGah6ScHfQ_4uapiNtB6_16ethtool_mm_stateNtNtCs7qddEHlz8fK_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbJ_Cs7fGah6ScHfQ_4uapiNtB6_18ethtool_rxfh_paramNtNtCs7qddEHlz8fK_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbN_Cs7fGah6ScHfQ_4uapiNtB6_24ethtool_forced_speed_mapNtNtCs7qddEHlz8fK_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3U2ICTymERh_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECs1Q5W6EJenka_25doctests_kernel_generated+0x9d: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs7qddEHlz8fK_4core3ptr13drop_in_placeNtNtCsjDtqRIL3JAG_6kernel3str16CStrConvertErrorECs1Q5W6EJenka_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs7qddEHlz8fK_4core3ptr13drop_in_placeNtNtCsjDtqRIL3JAG_6kernel5error5ErrorECs1Q5W6EJenka_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs7qddEHlz8fK_4core3ptr13drop_in_placeRjECs1Q5W6EJenka_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs3U2ICTymERh_5alloc7raw_vecINtB4_6RawVechE20try_reserve_for_pushCs1Q5W6EJenka_25doctests_kernel_generated+0xad: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsP_NtCs7qddEHlz8fK_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCs1Q5W6EJenka_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsP_NtCs7qddEHlz8fK_4core3fmtRTmENtB5_5Debug3fmtCs1Q5W6EJenka_25doctests_kernel_generated+0x48: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_0+0x46: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_1+0xfd: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_08bindings11destroy_foo+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_08bindings10enable_foo+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_0NtB4_6RawFoo3new+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_4+0x118: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_5+0x46: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_6+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_7+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_8+0x46: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_9+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_94main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_468_0NtB2_3Foo3new+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_10+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_12+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_13+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_14+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_15+0xd0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_16+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_17+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_net_phy_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_prelude_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_0+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_1+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_2+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_3+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_4+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_5+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_6+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_7+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_8+0xbf: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_static_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_0+0x2a7: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_1+0x375: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_2+0x1f1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_3+0xfb: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_4+0xfa: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x224: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_0+0x182: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_2+0x3d5: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_3+0x3db: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_4+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_5+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_6+0x4c8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_0+0x182: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_1+0x1a8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_2+0x190: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_3+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_4+0x99: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_5+0x37f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_6+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_7+0x190: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_condvar_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_0+0x48c: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_0+0x47d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_locked_by_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_0+0x5b: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_1+0x63: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_0+0xd3: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_1+0x219: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated30rust_doctest_kernel_types_rs_14main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_132_08example3+0x1d8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_2+0x11d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCs1Q5W6EJenka_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCsjDtqRIL3JAG_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCs1Q5W6EJenka_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_78_0NtB4_8MyStructINtNtCsjDtqRIL3JAG_6kernel9workqueue8WorkItemKy1_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCs1Q5W6EJenka_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_78_0NtB5_8MyStructINtNtCsjDtqRIL3JAG_6kernel9workqueue8WorkItemKy2_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_01__NtB2_12___ThePinDataNtNtCs7qddEHlz8fK_4core5clone5Clone5clone+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_01__NtB7_3FooNtNtNtCs7qddEHlz8fK_4core3ops4drop4Drop4drop+0x57: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_0NtB2_3FooNtNtCsjDtqRIL3JAG_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCs1Q5W6EJenka_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_0NtB5_6RawFooNtNtCsjDtqRIL3JAG_6kernel4init10PinnedDrop4drop+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNtNvNvNvCs1Q5W6EJenka_25doctests_kernel_generated32rust_doctest_kernel_net_phy_rs_04main63__doctest_main__kbuild_src_consumer_rust_kernel_net_phy_rs_765_024module_phy_driver_sample1__NtB4_6ModuleNtCsjDtqRIL3JAG_6kernel6Module4init+0x42: missing int3 after ret
>> vmlinux.o: warning: objtool: __rust_sample_phy_init+0x60: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3U2ICTymERh_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECs8qPTFNYbeo5_12rust_minimal+0x9d: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs7qddEHlz8fK_4core3ptr13drop_in_placeINtNtB4_6option6OptionNtCs8qPTFNYbeo5_12rust_minimal11RustMinimalEEB14_+0xde: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs7qddEHlz8fK_4core3ptr13drop_in_placeRjECs8qPTFNYbeo5_12rust_minimal+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs3U2ICTymERh_5alloc7raw_vecINtB4_6RawVeclE20try_reserve_for_pushCs8qPTFNYbeo5_12rust_minimal+0xbd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsk_NtCs3U2ICTymERh_5alloc3vecINtB5_3VeclENtNtCs7qddEHlz8fK_4core3fmt5Debug3fmtCs8qPTFNYbeo5_12rust_minimal+0x75: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCs8qPTFNYbeo5_12rust_minimalNtB2_11RustMinimalNtCsjDtqRIL3JAG_6kernel6Module4init+0x1d3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_Cs8qPTFNYbeo5_12rust_minimalNtB4_11RustMinimalNtNtNtCs7qddEHlz8fK_4core3ops4drop4Drop4drop+0xab: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_minimal_init+0x41: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCslMEAqMYsHjj_10rust_printNtB2_9RustPrintNtCsjDtqRIL3JAG_6kernel6Module4init+0xa58: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CslMEAqMYsHjj_10rust_printNtB4_9RustPrintNtNtNtCs7qddEHlz8fK_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_print_init+0x78: missing int3 after ret


objdump-func vmlinux.o rust_doctest_kernel_net_phy_rs_0:
0000 00000000000db960 <rust_doctest_kernel_net_phy_rs_0>:
0000    db960:	48 83 ec 38          	sub    $0x38,%rsp
0004    db964:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0009    db969:	48 c7 44 24 08 00 00 00 00 	movq   $0x0,0x8(%rsp)	db96e: R_X86_64_32S	.rodata+0x10988
0012    db972:	48 c7 44 24 10 01 00 00 00 	movq   $0x1,0x10(%rsp)
001b    db97b:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)
0024    db984:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)	db989: R_X86_64_32S	.rodata+0xff68
002d    db98d:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0036    db996:	e8 00 00 00 00       	call   db99b <rust_doctest_kernel_net_phy_rs_0+0x3b>	db997: R_X86_64_PLT32	_RNvNtCsjDtqRIL3JAG_6kernel5kunit4info-0x4
003b    db99b:	48 83 c4 38          	add    $0x38,%rsp
003f    db99f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
