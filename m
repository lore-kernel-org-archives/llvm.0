Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B7425154;
	Tue, 25 Jul 2023 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690305765; x=1721841765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRhQcc96PP4oy5wmUOE3gF8648ImIX2lw3urPyzqToI=;
  b=EssoiNYtgg8oSDJkA/5ZmHdOGUr4sH6OzNJ5in0LjPq8U/yKGcbxIK8Y
   I3ORGZTkKrY34A3F1s60cDxPMog378hotf0ZlVFihjsJrD0RwTJfvvO7D
   IGBbkRgcuDyZw5o/N1M3u754rZjo8NIsV785wFKwzO+fEUkScPeoJMtaN
   wflNTSx45b8lFSIcDPo6QdjqLthe2JG8od9IhtyINFOVPTeOmKCIFUBpX
   NGInFgP1R8v2SeKSnvTcKLLHgiX5rGcmp4tpg+u4YW/hE8EEeTJ2tk3em
   SsRWvMo4d+ThsrQ2b7gIKFeQN5xiiSGPCFuJx4IEK3dR9mmYHsApqBmRe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431602611"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="431602611"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 10:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729458896"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="729458896"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 10:22:42 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOLk9-0000BG-0H;
	Tue, 25 Jul 2023 17:22:41 +0000
Date: Wed, 26 Jul 2023 01:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_notify 9/16]
 drivers/firmware/arm_ffa/driver.c:692:36: warning: variable 'total_ids' set
 but not used
Message-ID: <202307260156.NcqZ6DHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git ffa_notify
head:   50176e212a1e52a7fc37c2ea8f7e0d5937c62955
commit: 155aaa7b3f3d4875ce6c6b154f95868f8a483686 [9/16] firmware: arm_ffa: Implement the NOTIFICATION_INFO_GET interface
config: arm64-randconfig-r032-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260156.NcqZ6DHJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260156.NcqZ6DHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260156.NcqZ6DHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/driver.c:692:36: warning: variable 'total_ids' set but not used [-Wunused-but-set-variable]
     692 |         u8 count_of_lists, ids_processed, total_ids = 0;
         |                                           ^
   drivers/firmware/arm_ffa/driver.c:614:12: warning: unused function 'ffa_notification_bind' [-Wunused-function]
     614 | static int ffa_notification_bind(u16 dst_id, u64 notif_bitmap, u32 flags)
         |            ^
   drivers/firmware/arm_ffa/driver.c:619:12: warning: unused function 'ffa_notification_unbind' [-Wunused-function]
     619 | static int ffa_notification_unbind(u16 dst_id, u64 notif_bitmap)
         |            ^
   drivers/firmware/arm_ffa/driver.c:625:5: warning: unused function 'ffa_notification_set' [-Wunused-function]
     625 | int ffa_notification_set(u16 src_id, u16 dst_id, u32 flags, u64 notif_bitmap)
         |     ^
   drivers/firmware/arm_ffa/driver.c:651:12: warning: unused function 'ffa_notification_get' [-Wunused-function]
     651 | static int ffa_notification_get(u32 flags, struct ffa_notif_bitmaps *notif)
         |            ^
   drivers/firmware/arm_ffa/driver.c:687:13: warning: unused function 'ffa_notification_info_get64' [-Wunused-function]
     687 | static void ffa_notification_info_get64(void)
         |             ^
   6 warnings generated.


vim +/total_ids +692 drivers/firmware/arm_ffa/driver.c

   686	
   687	static void ffa_notification_info_get64(void)
   688	{
   689		ffa_value_t ret;
   690		u64 id_list, ids_count[MAX_IDS_64];
   691		u32 idx, list;
 > 692		u8 count_of_lists, ids_processed, total_ids = 0;
   693	
   694		do {
   695			invoke_ffa_fn((ffa_value_t){
   696				  .a0 = FFA_FN_NATIVE(NOTIFICATION_INFO_GET),
   697				  }, &ret);
   698	
   699			if (ret.a0 != FFA_FN_NATIVE(SUCCESS)) {
   700				if (ret.a2 == FFA_RET_NO_DATA)
   701					pr_debug("No data available for Notification Info Get\n");
   702	
   703				pr_err("Notification Info Get Failed: 0x%lx(0x%lx)", ret.a0, ret.a2);
   704				return;
   705			}
   706	
   707			ids_processed = 0;
   708			count_of_lists = FIELD_GET(NOTIFICATION_INFO_GET_ID_COUNT, ret.a2);
   709			id_list = FIELD_GET(ID_LIST_MASK_64, ret.a2);
   710	
   711			for (idx= 0; idx < count_of_lists; idx++) {
   712				ids_count[idx] = (id_list & 0x3) + 1;
   713				total_ids += ids_count[idx];
   714				id_list = id_list >> 2;
   715			}
   716	
   717			/* Process IDs */
   718			/* For each notification make our call back */
   719			for (list = 0; list < count_of_lists; list++) {
   720				u16 *packed_id_list = (u16 *)&ret.a3, vcpu_id, partition_id;
   721	
   722				if (ids_processed >= MAX_IDS_64 - 1)
   723					break;
   724	
   725				partition_id = packed_id_list[++ids_processed];
   726	
   727				/* Global Notification, no vcpu IDs to process. */
   728				if (!ids_count[list]) {
   729					pr_debug("Calling global schedule receiver callback for 0x%x\n", partition_id);
   730					__do_sched_recv_cb(partition_id, 0, false);
   731				} else {
   732					/* Per vCPU Notification, process X IDs based on length of list specified. */
   733					/* Use IDs count (count from 0) as vcpu count. */
   734					for (idx = 0; idx < ids_count[list]; idx++) {
   735						if (ids_processed >= MAX_IDS_64 - 1)
   736							break;
   737						/* The next ID to unpack is a vcpu ID, retrieve and increment count. */
   738						vcpu_id = packed_id_list[++ids_processed];
   739						pr_debug("Calling schedule receiver callback for 0x%x for vcpu: %d\n",
   740							partition_id, vcpu_id);
   741						__do_sched_recv_cb(partition_id, vcpu_id, true);
   742					}
   743				}
   744			}
   745		} while(ret.a2 & NOTIFICATION_INFO_GET_MORE_PENDING);
   746	}
   747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
