Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE555C08;
	Mon,  8 Jan 2024 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuE/+hAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704756435; x=1736292435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=joC1a6aoOwPSOB4mechVjAGhoyUJl5+Rf1FFlOgT6h0=;
  b=iuE/+hARJ8piSoNXCqFSVvkTAKHbB01NPkag5jpoeecaNbWUMnhAuDNm
   9m9RhH0Pv0XOyVVk8eQB37WVAdrFRe6dr8fCeeMyCuLKft+UGqACj27Af
   TnDKVH2/8DxX9cp98h4tmEBZYs+0FLS+GPMYYk/sDigyX1Ys76VA+OYE8
   zVc2sHCOPw3q7IwXb1RkK2PTOYRE628pCfp0EeqkiOT73GvXO6xz48QOJ
   CANAL+LOe4sQE1GvWo5ceMVow/3KWhxsiFPvXc9k/yel4U2fm6IU+2zeF
   4Lb9ZuEiwwm4K9uXvdKuNJo/RjwquF1csSEwymhLDqS83IRbWbOWSqQSW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462313472"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="462313472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 15:27:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="815764922"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="815764922"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2024 15:27:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMz1T-0005Dq-0F;
	Mon, 08 Jan 2024 23:27:11 +0000
Date: Tue, 9 Jan 2024 07:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 54/69]
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3166:5: warning: no previous
 prototype for function 'iwl_fw_send_timestamp_marker_cmd'
Message-ID: <202401090718.CZJR0atf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   9020873b750549845a4f4526137b2e66d9001bcc
commit: 38ffad1e8048085517946d1230f7e249b6c0db72 [54/69] MVM_CORE80
config: i386-buildonly-randconfig-003-20240109 (https://download.01.org/0day-ci/archive/20240109/202401090718.CZJR0atf-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090718.CZJR0atf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090718.CZJR0atf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3166:5: warning: no previous prototype for function 'iwl_fw_send_timestamp_marker_cmd' [-Wmissing-prototypes]
    3166 | int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
         |     ^
   drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3166 | int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
         | ^
         | static 
   1 warning generated.


vim +/iwl_fw_send_timestamp_marker_cmd +3166 drivers/net/wireless/intel/iwlwifi/fw/dbg.c

b721f5b1be18ae6 Shahar S Matityahu 2019-05-21  3165  
eeef0168e325573 Miri Korenblit     2023-06-20 @3166  int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
eeef0168e325573 Miri Korenblit     2023-06-20  3167  {
eeef0168e325573 Miri Korenblit     2023-06-20  3168  	struct iwl_mvm_marker marker = {
eeef0168e325573 Miri Korenblit     2023-06-20  3169  		.dw_len = sizeof(struct iwl_mvm_marker) / 4,
eeef0168e325573 Miri Korenblit     2023-06-20  3170  		.marker_id = MARKER_ID_SYNC_CLOCK,
eeef0168e325573 Miri Korenblit     2023-06-20  3171  	};
eeef0168e325573 Miri Korenblit     2023-06-20  3172  	struct iwl_host_cmd hcmd = {
eeef0168e325573 Miri Korenblit     2023-06-20  3173  		.flags = CMD_ASYNC,
eeef0168e325573 Miri Korenblit     2023-06-20  3174  		.id = WIDE_ID(LONG_GROUP, MARKER_CMD),
eeef0168e325573 Miri Korenblit     2023-06-20  3175  		.dataflags = {},
eeef0168e325573 Miri Korenblit     2023-06-20  3176  	};
eeef0168e325573 Miri Korenblit     2023-06-20  3177  	struct iwl_mvm_marker_rsp *resp;
eeef0168e325573 Miri Korenblit     2023-06-20  3178  	int cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
eeef0168e325573 Miri Korenblit     2023-06-20  3179  					    WIDE_ID(LONG_GROUP, MARKER_CMD),
eeef0168e325573 Miri Korenblit     2023-06-20  3180  					    IWL_FW_CMD_VER_UNKNOWN);
eeef0168e325573 Miri Korenblit     2023-06-20  3181  	int ret;
eeef0168e325573 Miri Korenblit     2023-06-20  3182  
eeef0168e325573 Miri Korenblit     2023-06-20  3183  	if (cmd_ver == 1) {
eeef0168e325573 Miri Korenblit     2023-06-20  3184  		/* the real timestamp is taken from the ftrace clock
eeef0168e325573 Miri Korenblit     2023-06-20  3185  		 * this is for finding the match between fw and kernel logs
eeef0168e325573 Miri Korenblit     2023-06-20  3186  		 */
eeef0168e325573 Miri Korenblit     2023-06-20  3187  		marker.timestamp = cpu_to_le64(fwrt->timestamp.seq++);
eeef0168e325573 Miri Korenblit     2023-06-20  3188  	} else if (cmd_ver == 2) {
eeef0168e325573 Miri Korenblit     2023-06-20  3189  		marker.timestamp = cpu_to_le64(ktime_get_boottime_ns());
eeef0168e325573 Miri Korenblit     2023-06-20  3190  	} else {
eeef0168e325573 Miri Korenblit     2023-06-20  3191  		IWL_DEBUG_INFO(fwrt,
eeef0168e325573 Miri Korenblit     2023-06-20  3192  			       "Invalid version of Marker CMD. Ver = %d\n",
eeef0168e325573 Miri Korenblit     2023-06-20  3193  			       cmd_ver);
eeef0168e325573 Miri Korenblit     2023-06-20  3194  		return -EINVAL;
eeef0168e325573 Miri Korenblit     2023-06-20  3195  	}
eeef0168e325573 Miri Korenblit     2023-06-20  3196  
eeef0168e325573 Miri Korenblit     2023-06-20  3197  	hcmd.data[0] = &marker;
eeef0168e325573 Miri Korenblit     2023-06-20  3198  	hcmd.len[0] = sizeof(marker);
eeef0168e325573 Miri Korenblit     2023-06-20  3199  
eeef0168e325573 Miri Korenblit     2023-06-20  3200  	ret = iwl_trans_send_cmd(fwrt->trans, &hcmd);
eeef0168e325573 Miri Korenblit     2023-06-20  3201  
eeef0168e325573 Miri Korenblit     2023-06-20  3202  	if (cmd_ver > 1 && hcmd.resp_pkt) {
eeef0168e325573 Miri Korenblit     2023-06-20  3203  		resp = (void *)hcmd.resp_pkt->data;
38ffad1e8048085 Emmanuel Grumbach  2024-01-07  3204  		IWL_DEBUG_INFO(fwrt, "FW GP2 time: %u\n", le32_to_cpu(resp->gp2));
eeef0168e325573 Miri Korenblit     2023-06-20  3205  	}
eeef0168e325573 Miri Korenblit     2023-06-20  3206  
eeef0168e325573 Miri Korenblit     2023-06-20  3207  	return ret;
eeef0168e325573 Miri Korenblit     2023-06-20  3208  }
eeef0168e325573 Miri Korenblit     2023-06-20  3209  

:::::: The code at line 3166 was first introduced by commit
:::::: eeef0168e3255732650ee81771e0d7e26e06a534 wifi: iwlwifi: fw: send marker cmd before suspend cmd

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
