Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F9C2D2;
	Thu, 30 Mar 2023 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680152854; x=1711688854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/n81rAwGm0MjFGNIn3ttvLyj47mcPs1x11Cpc4sSMsE=;
  b=imnQ5YEJI25n+Z8/wg3ovuHsVjzDHc6yo/uIYDlF54TKnRnZ2HhxZlxL
   PVyeX8kspx74gFBa+eqmKfHirXKsFoCYjlJtxerU2V5ygoVhf9Iww3bCB
   QXkmMdTIVb7+754pr33wGTcXyrkZBraRLimZ7lxnirG39EUKWx6KXyja/
   +HYZ/qPBrwQ1oMfM3WIL3OYZlGZNsnho/l86I1O8gga+jtpuez8Avm8gL
   uv0Eg1lQKExChN37sDxcDbMgD1hTefWfAMmqD24YQ5/VHwVW2rTdng8z2
   Qy1FrropCe1CSurzl+N+lakLrIYs0K+DdMjb9yiAjSbrFGmzDhq0Y213l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321454907"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="321454907"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 22:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808497386"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808497386"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2023 22:07:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phkVX-000KO0-1L;
	Thu, 30 Mar 2023 05:07:31 +0000
Date: Thu, 30 Mar 2023 13:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next 07/15] idpf: configure
 resources for TX queues
Message-ID: <202303301214.KYI9iZcx-lkp@intel.com>
References: <20230329140404.1647925-8-pavan.kumar.linga@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329140404.1647925-8-pavan.kumar.linga@intel.com>

Hi Pavan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavan-Kumar-Linga/virtchnl-add-virtchnl-version-2-ops/20230329-221347
patch link:    https://lore.kernel.org/r/20230329140404.1647925-8-pavan.kumar.linga%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next 07/15] idpf: configure resources for TX queues
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303301214.KYI9iZcx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/306315c1a27395f92f28516fab2493fc68884130
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pavan-Kumar-Linga/virtchnl-add-virtchnl-version-2-ops/20230329-221347
        git checkout 306315c1a27395f92f28516fab2493fc68884130
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/intel/idpf/ drivers/tty/serial/8250/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301214.KYI9iZcx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2078:5: warning: stack frame size (1120) exceeds limit (1024) in 'idpf_vport_queue_ids_init' [-Wframe-larger-than]
   int idpf_vport_queue_ids_init(struct idpf_vport *vport)
       ^
   76/1120 (6.79%) spills, 1044/1120 (93.21%) variables
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
