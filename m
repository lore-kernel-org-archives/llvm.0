Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00617F;
	Mon,  3 Apr 2023 00:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680480278; x=1712016278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbxqdmEvYFWgf+tUAphXC3bJt33iAbEci6SiQWgEWgI=;
  b=OIMPaFdeLpt119d1HucYYK70zFbEU+KFRafLuU3ik2r8MUshiCD0jLFa
   23+vOIMYJ3CI0V6+wumIgXW3PhLTu+BUSf47GGYneuttPsOhnyIf06m1A
   a2cpWcLnwdvrbjO4Pj7CEearyM/+dd2ZU0CAONd1c1R6bXwxxLJ16cA9q
   BgpDJQtxvw4UYpq2BxJ7nKBubG99iJEr/3nzUvDoZcySVFKVhpYc4J3O1
   8HbGAWU83N/BAABw0LzmHL/EAINsRkGdwHjEIk6snH2e/8+emtJ/A4rq+
   F0+fisU4OAk0Vo+SVEf6PubNDaR/y6AVqwbcSflRG7FgoB4rv5jpUcDx2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="339274284"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="339274284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 17:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635915631"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="635915631"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 17:04:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj7gX-000NoL-33;
	Mon, 03 Apr 2023 00:04:33 +0000
Date: Mon, 3 Apr 2023 08:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Brady <alan.brady@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alice Michael <alice.michael@intel.com>,
	Joshua Hay <joshua.a.hay@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>
Subject: [tnguy-next-queue:10GbE 7/15]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2078:5: warning: stack frame
 size (1060) exceeds limit (1024) in 'idpf_vport_queue_ids_init'
Message-ID: <202304030851.mfpEjcJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 10GbE
head:   e8a488d38e0a75704e37e952fedd329e977df362
commit: c9dfaffe4fcde55903d7e85a60e3a2ddf4ccd188 [7/15] idpf: configure resources for TX queues
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230403/202304030851.mfpEjcJX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=c9dfaffe4fcde55903d7e85a60e3a2ddf4ccd188
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue 10GbE
        git checkout c9dfaffe4fcde55903d7e85a60e3a2ddf4ccd188
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/platform/ drivers/net/ethernet/intel/idpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030851.mfpEjcJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2078:5: warning: stack frame size (1060) exceeds limit (1024) in 'idpf_vport_queue_ids_init' [-Wframe-larger-than]
   int idpf_vport_queue_ids_init(struct idpf_vport *vport)
       ^
   1 warning generated.


vim +/idpf_vport_queue_ids_init +2078 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  2070	
  2071	/**
  2072	 * idpf_vport_queue_ids_init - Initialize queue ids from Mailbox parameters
  2073	 * @vport: virtual port for which the queues ids are initialized
  2074	 *
  2075	 * Will initialize all queue ids with ids received as mailbox parameters.
  2076	 * Returns 0 on success, negative if all the queues are not initialized.
  2077	 */
> 2078	int idpf_vport_queue_ids_init(struct idpf_vport *vport)
  2079	{
  2080		struct virtchnl2_create_vport *vport_params;
  2081		struct virtchnl2_queue_reg_chunks *chunks;
  2082		struct idpf_vport_config *vport_config;
  2083		u16 vport_idx = vport->idx;
  2084		/* We may never deal with more than 256 same type of queues */
  2085	#define IDPF_MAX_QIDS	256
  2086		u32 qids[IDPF_MAX_QIDS];
  2087		int num_ids;
  2088		u16 q_type;
  2089	
  2090		vport_config = vport->adapter->vport_config[vport_idx];
  2091		if (vport_config->req_qs_chunks) {
  2092			struct virtchnl2_add_queues *vc_aq =
  2093				(struct virtchnl2_add_queues *)vport_config->req_qs_chunks;
  2094			chunks = &vc_aq->chunks;
  2095		} else {
  2096			vport_params = (struct virtchnl2_create_vport *)
  2097					vport->adapter->vport_params_recvd[vport_idx];
  2098			chunks = &vport_params->chunks;
  2099		}
  2100	
  2101		num_ids = idpf_vport_get_queue_ids(qids, IDPF_MAX_QIDS,
  2102						   VIRTCHNL2_QUEUE_TYPE_TX,
  2103						   chunks);
  2104		if (num_ids < vport->num_txq)
  2105			return -EINVAL;
  2106		num_ids = __idpf_vport_queue_ids_init(vport, qids, num_ids,
  2107						      VIRTCHNL2_QUEUE_TYPE_TX);
  2108		if (num_ids < vport->num_txq)
  2109			return -EINVAL;
  2110	
  2111		if (!idpf_is_queue_model_split(vport->txq_model))
  2112			return 0;
  2113	
  2114		q_type = VIRTCHNL2_QUEUE_TYPE_TX_COMPLETION;
  2115		num_ids = idpf_vport_get_queue_ids(qids, IDPF_MAX_QIDS, q_type, chunks);
  2116		if (num_ids < vport->num_complq)
  2117			return -EINVAL;
  2118		num_ids = __idpf_vport_queue_ids_init(vport, qids, num_ids, q_type);
  2119		if (num_ids < vport->num_complq)
  2120			return -EINVAL;
  2121	
  2122		return 0;
  2123	}
  2124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
