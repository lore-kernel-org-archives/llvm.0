Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A3B847E;
	Sat,  6 Jan 2024 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNSKUoos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704558467; x=1736094467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s2xOe7AnIKqVZIRBHetIwS6LF1GxLFtiXjzTZ9riLf0=;
  b=SNSKUooszVGBpxmDT6iU8JEGc+aCEnX6QTjqEh0OOD/8+Ib2lOgO07Sp
   3cBhqnv1LfvG3vLJ1TPF33ClQ9zIFeIZhlzoA4K5fDsiyb/oJnouxAPXv
   BAoFGmpqo0/xYCgQPniUISRk0wR8xVuYzHdWeU9NEUcZPSuFd+VtRDB9q
   uuYxHTV+MYJxXBq1/4/rCvW/1mBR4DHuBhNNAVbu+Oe69Qm6lIfZMdCGS
   CxYA04Mo7pbxv1oYrIWxZ+AT24Lye7iCOuzL43/3jyGXNsvMAlfydgd+6
   zefliMnPOuOIrujzECYhMXqlHR9uAEJrcf+pXD8F99XY/vQRjFZ0U4Job
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="397391850"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="397391850"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 08:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="871484904"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="871484904"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2024 08:27:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM9WP-0002jQ-2X;
	Sat, 06 Jan 2024 16:27:41 +0000
Date: Sun, 7 Jan 2024 00:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: [drm-xe:drm-xe-next 9/10] drivers/gpu/drm/xe/xe_guc_relay.c:863:52:
 error: call to undeclared function 'kunit_get_current_test'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202401070036.60pNn4uZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   cca0607b6f6a21bee68c092ed7ad9f3322e54523
commit: 27b717bac93fb9a28f37ba17f3f4aa220fedae21 [9/10] drm/xe/kunit: Add GuC Relay kunit tests
config: x86_64-randconfig-006-20240106 (https://download.01.org/0day-ci/archive/20240107/202401070036.60pNn4uZ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070036.60pNn4uZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070036.60pNn4uZ-lkp@intel.com/

Note: the drm-xe/drm-xe-next HEAD cca0607b6f6a21bee68c092ed7ad9f3322e54523 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_relay.c:863:52: error: call to undeclared function 'kunit_get_current_test'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     863 |         if (unlikely(!IS_SRIOV_VF(relay_to_xe(relay)) && !kunit_get_current_test()))
         |                                                           ^
   drivers/gpu/drm/xe/xe_guc_relay.c:909:52: error: call to undeclared function 'kunit_get_current_test'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     909 |         if (unlikely(!IS_SRIOV_PF(relay_to_xe(relay)) && !kunit_get_current_test()))
         |                                                           ^
   2 errors generated.


vim +/kunit_get_current_test +863 drivers/gpu/drm/xe/xe_guc_relay.c

   840	
   841	/**
   842	 * xe_guc_relay_process_guc2vf - Handle relay notification message from the GuC.
   843	 * @relay: the &xe_guc_relay which will handle the message
   844	 * @msg: message to be handled
   845	 * @len: length of the message (in dwords)
   846	 *
   847	 * This function will handle relay messages received from the GuC.
   848	 *
   849	 * This function is can only be used if driver is running in SR-IOV mode.
   850	 *
   851	 * Return: 0 on success or a negative error code on failure.
   852	 */
   853	int xe_guc_relay_process_guc2vf(struct xe_guc_relay *relay, const u32 *msg, u32 len)
   854	{
   855		u32 rid;
   856	
   857		relay_assert(relay, len >= GUC_HXG_MSG_MIN_LEN);
   858		relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
   859		relay_assert(relay, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
   860		relay_assert(relay, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
   861			     XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF);
   862	
 > 863		if (unlikely(!IS_SRIOV_VF(relay_to_xe(relay)) && !kunit_get_current_test()))
   864			return -EPERM;
   865	
   866		if (unlikely(!relay_is_ready(relay)))
   867			return -ENODEV;
   868	
   869		if (unlikely(len < GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN))
   870			return -EPROTO;
   871	
   872		if (unlikely(len > GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN))
   873			return -EMSGSIZE;
   874	
   875		if (unlikely(FIELD_GET(GUC_HXG_EVENT_MSG_0_DATA0, msg[0])))
   876			return -EPFNOSUPPORT;
   877	
   878		rid = FIELD_GET(GUC2VF_RELAY_FROM_PF_EVENT_MSG_1_RELAY_ID, msg[1]);
   879	
   880		return relay_process_msg(relay, PFID, rid,
   881					 msg + GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN,
   882					 len - GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN);
   883	}
   884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
