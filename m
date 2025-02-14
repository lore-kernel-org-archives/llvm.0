Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99B2153FA;
	Fri, 14 Feb 2025 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536635; cv=none; b=SnKKFKSy5IyZqs3SiZ94e0HECWFRD0XLJrNwSNzKP81vu6uBCcX0JBmN0ioCpsgpgblbzOReLR6kvdYdS9DICzwkPCJTUd5tDo3jLeWx67XxRpseNVO/kdCoCwFSEVdPPG5IbEZpw1pjybgDkSc9TjBP4f/qLqgsaQJjPDDsLqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536635; c=relaxed/simple;
	bh=esM/OM2yPJYWFtfXXux1i1bWKLQTAJzMDIjxpI4kp5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnY/wLm99p502W2J7cBDE7pEUH6/qZMCvYasPF6q1m8ylmCGOXB9/MhC9vU3VD5v/ZDNTPA1pXGlV+9hfcSQp4FgjRzHimR28kzTSkGJp6FbwgNb1+gL6zcYeQZtr5kph2agyE/90z/7eXNqHzOCsOcSNnDG6scHq5ob7RXhzzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7XUAVsJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7XUAVsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739536633; x=1771072633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esM/OM2yPJYWFtfXXux1i1bWKLQTAJzMDIjxpI4kp5A=;
  b=j7XUAVsJir/Fok1cb05QsBixkttu1KlHLvBCYcpyjxmud7lnuM9tVNFl
   dDn9rUOVDn5AXYPAuNP7QIJyWC1YKKnmhWsd215YnYS/XG/W8iK8D9Nhu
   XXiXgNzNCQXMjbI/bua2plSzlSoEzSG6VUuLD+xJxq1bwFEikFpgBAQpu
   t76lJAHdli4d1s6/Ftyp7fsLNOMAKJIqFu72Na7rnTHlT8zW6zJJLXH1b
   u/EVQnvU8sfGv3Dt6eoJ240YUDroAg7CdcwLCMAoLlwvkJFuLBVUnULTy
   ojd/8WAfTxK50NAWBZ/0y7wP3Zd9S9ap9ZsMO9n3yVCz4pgvfezCdhlqH
   w==;
X-CSE-ConnectionGUID: WGxa7YNgQp+p0ml92+SnJw==
X-CSE-MsgGUID: oa/DUThQQNGgCcRS/0g/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62748473"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="62748473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:37:13 -0800
X-CSE-ConnectionGUID: LB759n1cSfW+pJZyviUEog==
X-CSE-MsgGUID: efJttU9MRleC2G7XA/iF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150624150"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2025 04:37:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiuwP-0019Xf-06;
	Fri, 14 Feb 2025 12:37:09 +0000
Date: Fri, 14 Feb 2025 20:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Gospodarek <gospo@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [djiang:cxl/fwctl 10/25] drivers/fwctl/bnxt/bnxt.c:163:18: error:
 expected ';' after top level declarator
Message-ID: <202502142014.N6TWWchD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 7b83e1a83f6e78333aa6f558fcd84cbc3d7cbe47 [10/25] fwctl/bnxt: Support communicating with bnxt fw
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250214/202502142014.N6TWWchD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142014.N6TWWchD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142014.N6TWWchD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/fwctl/bnxt/bnxt.c:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/fwctl/bnxt/bnxt.c:12:
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:1689:35: error: field has incomplete type 'struct hwrm_port_phy_qcfg_output'
    1689 |         struct hwrm_port_phy_qcfg_output phy_qcfg_resp;
         |                                          ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:1689:9: note: forward declaration of 'struct hwrm_port_phy_qcfg_output'
    1689 |         struct hwrm_port_phy_qcfg_output phy_qcfg_resp;
         |                ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:1970:35: error: use of undeclared identifier 'FUNC_BACKING_STORE_QCAPS_V2_REQ_TYPE_RIGP1_TRACE'
    1970 |         struct bnxt_ctx_mem_type        ctx_arr[BNXT_CTX_V2_MAX];
         |                                                 ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:1962:26: note: expanded from macro 'BNXT_CTX_V2_MAX'
    1962 | #define BNXT_CTX_V2_MAX (BNXT_CTX_RIGP1 + 1)
         |                          ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:1958:24: note: expanded from macro 'BNXT_CTX_RIGP1'
    1958 | #define BNXT_CTX_RIGP1  FUNC_BACKING_STORE_QCAPS_V2_REQ_TYPE_RIGP1_TRACE
         |                         ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:2399:20: error: use of undeclared identifier 'HW_HASH_KEY_SIZE'
    2399 |         u8                      rss_hash_key[HW_HASH_KEY_SIZE];
         |                                              ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:2540:29: error: field has incomplete type 'struct hwrm_ver_get_output'
    2540 |         struct hwrm_ver_get_output      ver_resp;
         |                                         ^
   arch/riscv/include/../../../drivers/net/ethernet/broadcom/bnxt/bnxt.h:2540:9: note: forward declaration of 'struct hwrm_ver_get_output'
    2540 |         struct hwrm_ver_get_output      ver_resp;
         |                ^
   drivers/fwctl/bnxt/bnxt.c:74:13: error: incomplete definition of type 'struct input'
      74 |         switch (req->req_type) {
         |                 ~~~^
   drivers/fwctl/bnxt/bnxt.c:72:9: note: forward declaration of 'struct input'
      72 |         struct input *req = (struct input *)hwrm_in->msg;
         |                ^
   drivers/fwctl/bnxt/bnxt.c:75:7: error: use of undeclared identifier 'HWRM_VER_GET'
      75 |         case HWRM_VER_GET:
         |              ^
>> drivers/fwctl/bnxt/bnxt.c:163:18: error: expected ';' after top level declarator
     163 | MODULE_IMPORT_NS(BNXT);
         |                  ^
   drivers/fwctl/bnxt/bnxt.c:164:18: error: expected ';' after top level declarator
     164 | MODULE_IMPORT_NS(FWCTL);
         |                  ^
   3 warnings and 8 errors generated.


vim +163 drivers/fwctl/bnxt/bnxt.c

    56	
    57	/*
    58	 * bnxt_fw_msg->msg has the whole command
    59	 * the start of message is of type struct input
    60	 * struct input {
    61	 *         __le16  req_type;
    62	 *         __le16  cmpl_ring;
    63	 *         __le16  seq_id;
    64	 *         __le16  target_id;
    65	 *         __le64  resp_addr;
    66	 * };
    67	 * so the hwrm op should be (struct input *)(hwrm_in->msg)->req_type
    68	 */
    69	static bool bnxtctl_validate_rpc(struct fwctl_uctx *uctx,
    70					 struct bnxt_fw_msg *hwrm_in)
    71	{
    72		struct input *req = (struct input *)hwrm_in->msg;
    73	
  > 74		switch (req->req_type) {
    75		case HWRM_VER_GET:
    76			return true;
    77		default:
    78			return false;
    79		}
    80	}
    81	
    82	static void *bnxtctl_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
    83				    void *in, size_t in_len, size_t *out_len)
    84	{
    85		struct bnxtctl_dev *bnxtctl =
    86			container_of(uctx->fwctl, struct bnxtctl_dev, fwctl);
    87		struct bnxt_aux_priv *bnxt_aux_priv = bnxtctl->aux_priv;
    88		/* FIXME: Check me */
    89		struct bnxt_fw_msg rpc_in = {
    90			// FIXME: does bnxt_send_msg() copy?
    91			.msg = in,
    92			.msg_len = in_len,
    93			.resp = in,
    94			// FIXME: Dynamic memory for out_len
    95			.resp_max_len = in_len,
    96		};
    97		int rc;
    98	
    99		if (!bnxtctl_validate_rpc(uctx, &rpc_in))
   100			return ERR_PTR(-EPERM);
   101	
   102		rc = bnxt_send_msg(bnxt_aux_priv->edev, &rpc_in);
   103		if (!rc)
   104			return ERR_PTR(-EOPNOTSUPP);
   105		return in;
   106	}
   107	
   108	static const struct fwctl_ops bnxtctl_ops = {
   109		.device_type = FWCTL_DEVICE_TYPE_BNXT,
   110		.uctx_size = sizeof(struct bnxtctl_uctx),
   111		.open_uctx = bnxtctl_open_uctx,
   112		.close_uctx = bnxtctl_close_uctx,
   113		.info = bnxtctl_info,
   114		.fw_rpc = bnxtctl_fw_rpc,
   115	};
   116	
   117	static int bnxtctl_probe(struct auxiliary_device *adev,
   118				 const struct auxiliary_device_id *id)
   119	{
   120		struct bnxt_aux_priv *aux_priv =
   121			container_of(adev, struct bnxt_aux_priv, aux_dev);
   122		struct bnxtctl_dev *bnxtctl __free(bnxtctl) =
   123			fwctl_alloc_device(&aux_priv->edev->pdev->dev, &bnxtctl_ops,
   124					   struct bnxtctl_dev, fwctl);
   125		int rc;
   126	
   127		if (!bnxtctl)
   128			return -ENOMEM;
   129	
   130		bnxtctl->aux_priv = aux_priv;
   131	
   132		rc = fwctl_register(&bnxtctl->fwctl);
   133		if (rc)
   134			return rc;
   135	
   136		auxiliary_set_drvdata(adev, no_free_ptr(bnxtctl));
   137		return 0;
   138	}
   139	
   140	static void bnxtctl_remove(struct auxiliary_device *adev)
   141	{
   142		struct bnxtctl_dev *ctldev = auxiliary_get_drvdata(adev);
   143	
   144		fwctl_unregister(&ctldev->fwctl);
   145		fwctl_put(&ctldev->fwctl);
   146	}
   147	
   148	static const struct auxiliary_device_id bnxtctl_id_table[] = {
   149		{ .name = "bnxt_en.fwctl", },
   150		{},
   151	};
   152	MODULE_DEVICE_TABLE(auxiliary, bnxtctl_id_table);
   153	
   154	static struct auxiliary_driver bnxtctl_driver = {
   155		.name = "bnxt_fwctl",
   156		.probe = bnxtctl_probe,
   157		.remove = bnxtctl_remove,
   158		.id_table = bnxtctl_id_table,
   159	};
   160	
   161	module_auxiliary_driver(bnxtctl_driver);
   162	
 > 163	MODULE_IMPORT_NS(BNXT);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
