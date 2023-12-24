Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B2E56E;
	Sun, 24 Dec 2023 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqjCIEO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703453057; x=1734989057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BBFwyEnt2DiXkHPCWfBeAbEXEvEVcR4OcBWE+R9B9cc=;
  b=mqjCIEO6mcVhfQh6zbbeCNs94L0dyaaLQvfRMyAJjcveZhUgcgMmV4Pp
   taGnwh2WdJlAJF6FT+FNnWSrJO6iC7B6kZIE6QedVAhnUNzJfjRVReINj
   2cFwad2ESuuDFnSrr9Qifj+/UX6AJq/4bmgWYBpUGwFYuM2F2V6tr3hhq
   I4f1NJD54/GIiXyzhvhCRqUrST10s8BXN/dIUaDlz+3U2IywM8m2mUTPc
   Phtn07cBOSVMYJcOYKvU+D7vLacZC+Wl+SAdV4ZZIL4dMYI3lZ+nHrm0e
   GCmpTrBygDaXY+brSHgQxCQ2SCPTDV4kYeLUcLELtBZp+d64IkEEKHoVi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="376388657"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="376388657"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 13:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="781113113"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="781113113"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Dec 2023 13:24:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHVxD-000Cf5-2Q;
	Sun, 24 Dec 2023 21:24:12 +0000
Date: Mon, 25 Dec 2023 05:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 48/48]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:1150: warning: Function parameter
 or member 'qid' not described in 'idpf_xsk_wakeup'
Message-ID: <202312250532.eKh1tVB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   2ad48b3813615378a8dc05f601405904a3e11ad5
commit: 2ad48b3813615378a8dc05f601405904a3e11ad5 [48/48] idpf: enable XSk features and ndo_xsk_wakeup
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231225/202312250532.eKh1tVB8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250532.eKh1tVB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250532.eKh1tVB8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter or member 't' not described in 'idpf_xsk_setup_queue'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:502: warning: Excess function parameter 'pool' description in 'idpf_xsk_pool_enable'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:709: warning: Excess function parameter 'adapter' description in 'idpf_check_alloc_rx_buffers_zc'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:911: warning: Function parameter or member 'sq' not described in 'idpf_xsk_xmit_pkt'
   drivers/net/ethernet/intel/idpf/idpf_xsk.c:911: warning: expecting prototype for idpf_xmit_pkt(). Prototype was for idpf_xsk_xmit_pkt() instead
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:1150: warning: Function parameter or member 'qid' not described in 'idpf_xsk_wakeup'
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:1150: warning: Excess function parameter 'queue_id' description in 'idpf_xsk_wakeup'


vim +1150 drivers/net/ethernet/intel/idpf/idpf_xsk.c

  1140	
  1141	/**
  1142	 * idpf_xsk_wakeup - Implements ndo_xsk_wakeup
  1143	 * @netdev: net_device
  1144	 * @queue_id: queue to wake up
  1145	 * @flags: ignored in our case, since we have Rx and Tx in the same NAPI
  1146	 *
  1147	 * Returns negative on error, zero otherwise.
  1148	 */
  1149	int idpf_xsk_wakeup(struct net_device *netdev, u32 qid, u32 flags)
> 1150	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
