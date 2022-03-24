Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347B7E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648140367; x=1679676367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ey/ZpZ4ZKBA2rr8TRQXVVdoOdcy/gvnxkqL/RfDp3iQ=;
  b=fOzzDh8mMALszkfAp1sNxmFhhToe/MISimhstBcgz4TDwyglXqtbaD7U
   5Y2JlAGBAzEJ4g01pB83yUcb+vxBMqVsNhYGaHe6WWQVm+2BVcxoXQIYI
   L4jDQTd4XZugjfLEQo77zcqhLKi+k0kPkt00rJOUmGCn30g1JhV7CjhFZ
   H1v4iUGqjDgtEpyrwzgBDmzDPAqQYarGJcR6/WPBdJOyZSYTRWP+xc0Dj
   8YFB5ouI3hCZY2VTlLKg8XyJv8vGt4Oym7Vv8xGyQxw/rUE0mym4CR+eY
   TW/uzOwLUGhIi2+ayzSEcgDtGkiZNTkX0olWGvOJn5Yrlz4VZPYsyFFpr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238370420"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="238370420"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 09:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="519859778"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Mar 2022 09:46:04 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXQb5-000LFI-Iz; Thu, 24 Mar 2022 16:46:03 +0000
Date: Fri, 25 Mar 2022 00:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar <ssundar@marvell.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	James Smart <james.smart@broadcom.com>,
	Nilesh Javali <njavali@marvell.com>
Subject: drivers/scsi/scsi_transport_fc.c:908:6: warning: variable 'desc_cnt'
 set but not used
Message-ID: <202203250040.RHMqwHeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ed4643521e6af8ab8ed1e467630a85884d2696cf
commit: 3dcfe0de5a9752e646a61f4ce513ac059960c7c3 scsi: fc: Parse FPIN packets and update statistics
date:   1 year, 5 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220325/202203250040.RHMqwHeT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3dcfe0de5a9752e646a61f4ce513ac059960c7c3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3dcfe0de5a9752e646a61f4ce513ac059960c7c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_transport_fc.c:908:6: warning: variable 'desc_cnt' set but not used [-Wunused-but-set-variable]
           u32 desc_cnt = 0, bytes_remain;
               ^
   1 warning generated.


vim +/desc_cnt +908 drivers/scsi/scsi_transport_fc.c

   893	
   894	/**
   895	 * fc_host_rcv_fpin - routine to process a received FPIN.
   896	 * @shost:		host the FPIN was received on
   897	 * @fpin_len:		length of FPIN payload, in bytes
   898	 * @fpin_buf:		pointer to FPIN payload
   899	 *
   900	 * Notes:
   901	 *	This routine assumes no locks are held on entry.
   902	 */
   903	void
   904	fc_host_fpin_rcv(struct Scsi_Host *shost, u32 fpin_len, char *fpin_buf)
   905	{
   906		struct fc_els_fpin *fpin = (struct fc_els_fpin *)fpin_buf;
   907		struct fc_tlv_desc *tlv;
 > 908		u32 desc_cnt = 0, bytes_remain;
   909		u32 dtag;
   910	
   911		/* Update Statistics */
   912		tlv = (struct fc_tlv_desc *)&fpin->fpin_desc[0];
   913		bytes_remain = fpin_len - offsetof(struct fc_els_fpin, fpin_desc);
   914		bytes_remain = min_t(u32, bytes_remain, be32_to_cpu(fpin->desc_len));
   915	
   916		while (bytes_remain >= FC_TLV_DESC_HDR_SZ &&
   917		       bytes_remain >= FC_TLV_DESC_SZ_FROM_LENGTH(tlv)) {
   918			dtag = be32_to_cpu(tlv->desc_tag);
   919			switch (dtag) {
   920			case ELS_DTAG_LNK_INTEGRITY:
   921				fc_fpin_li_stats_update(shost, tlv);
   922				break;
   923			case ELS_DTAG_DELIVERY:
   924				fc_fpin_delivery_stats_update(shost, tlv);
   925				break;
   926			case ELS_DTAG_PEER_CONGEST:
   927				fc_fpin_peer_congn_stats_update(shost, tlv);
   928				break;
   929			case ELS_DTAG_CONGESTION:
   930				fc_fpin_congn_stats_update(shost, tlv);
   931			}
   932	
   933			desc_cnt++;
   934			bytes_remain -= FC_TLV_DESC_SZ_FROM_LENGTH(tlv);
   935			tlv = fc_tlv_next_desc(tlv);
   936		}
   937	
   938		fc_host_post_fc_event(shost, fc_get_event_number(),
   939					FCH_EVT_LINK_FPIN, fpin_len, fpin_buf, 0);
   940	}
   941	EXPORT_SYMBOL(fc_host_fpin_rcv);
   942	
   943	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
