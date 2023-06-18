Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486915CE;
	Sun, 18 Jun 2023 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687090578; x=1718626578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWm3kenZVu59Vo3msG0GuZzxYCAvlgL/tVzezWrJQV8=;
  b=MpxAYXQyLed2AERqtHP1D3gIcmdzVDd9I4P5PG4G0bNEKGDkj1aOjArr
   /OFLIstzf6O+DPnA1yzTBZEg9VieUy0sZRd2w3GVVhcfb0ytvsx/IacEq
   RVfXEWXUtn7xdQXrYHqZoztmozgyuPU42k+JU/WRTHeXaYJooDe6veMVE
   5Nc2cO3Uapvr9jyqsHoaMW/SIljlb9jCTi5E2Wdak5wPGNfqrMkyFWqll
   FubxtE9Z8kc3zZMg+bPXTCDp2lJmCRrx4xReEydqfYzA9id88Sk1KLq8m
   bczfm6zZ4smPtYrTbO5sRASif5q7coqxrY7lZT4p7sAGPO+NfN39sMP6w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425421850"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="425421850"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 05:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="857924319"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="857924319"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2023 05:16:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qArKJ-0003hY-15;
	Sun, 18 Jun 2023 12:16:15 +0000
Date: Sun, 18 Jun 2023 20:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending-all 89/105]
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3157:5: warning: no previous
 prototype for function 'iwl_fw_send_timestamp_marker_cmd'
Message-ID: <202306182027.bfngOrWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending-all
head:   7016c057949e578df3f1b0001d0b312fe6b65ab5
commit: 5fa7b778731ba201d776e18a2b859f7a2f761180 [89/105] wifi: iwlwifi: send marker cmd before suspend cmd
config: x86_64-buildonly-randconfig-r003-20230618 (https://download.01.org/0day-ci/archive/20230618/202306182027.bfngOrWo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306182027.bfngOrWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306182027.bfngOrWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3157:5: warning: no previous prototype for function 'iwl_fw_send_timestamp_marker_cmd' [-Wmissing-prototypes]
   int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
       ^
   drivers/net/wireless/intel/iwlwifi/fw/dbg.c:3157:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
   ^
   static 
   1 warning generated.


vim +/iwl_fw_send_timestamp_marker_cmd +3157 drivers/net/wireless/intel/iwlwifi/fw/dbg.c

  3156	
> 3157	int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
  3158	{
  3159		struct iwl_mvm_marker marker = {
  3160			.dw_len = sizeof(struct iwl_mvm_marker) / 4,
  3161			.marker_id = MARKER_ID_SYNC_CLOCK,
  3162		};
  3163		struct iwl_host_cmd hcmd = {
  3164			.flags = CMD_ASYNC,
  3165			.id = WIDE_ID(LONG_GROUP, MARKER_CMD),
  3166			.dataflags = {},
  3167		};
  3168		struct iwl_mvm_marker_rsp *resp;
  3169		int cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
  3170						    WIDE_ID(LONG_GROUP, MARKER_CMD),
  3171						    IWL_FW_CMD_VER_UNKNOWN);
  3172		int ret;
  3173	
  3174		if (cmd_ver == 1) {
  3175			/* the real timestamp is taken from the ftrace clock
  3176			 * this is for finding the match between fw and kernel logs
  3177			 */
  3178			marker.timestamp = cpu_to_le64(fwrt->timestamp.seq++);
  3179		} else if (cmd_ver == 2) {
  3180			marker.timestamp = cpu_to_le64(ktime_get_boottime_ns());
  3181		} else {
  3182			IWL_DEBUG_INFO(fwrt,
  3183				       "Invalid version of Marker CMD. Ver = %d\n",
  3184				       cmd_ver);
  3185			return -EINVAL;
  3186		}
  3187	
  3188		hcmd.data[0] = &marker;
  3189		hcmd.len[0] = sizeof(marker);
  3190	
  3191		ret = iwl_trans_send_cmd(fwrt->trans, &hcmd);
  3192	
  3193		if (cmd_ver > 1 && hcmd.resp_pkt) {
  3194			resp = (void *)hcmd.resp_pkt->data;
  3195			IWL_DEBUG_INFO(fwrt, "FW GP2 time: %u\n", le32_to_cpu(resp->gp2));
  3196		}
  3197	
  3198		return ret;
  3199	}
  3200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
