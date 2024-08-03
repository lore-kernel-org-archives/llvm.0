Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C349647;
	Sat,  3 Aug 2024 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722674969; cv=none; b=DtRd1dDBxDFJHKIiFCDtoNOJeQh86DQF8hfGeFYP16D0syYT/o0fdVpxBlYH1i7GXWe9aGDvPJuE4qh0TBgmS43fsFvRlfkGNbJ5WBp0DdX5XGgr70ewQ6nPBZoOVRzwpfm1/AhogK6fxsZh0vKc7GEntnBNVRqvoyCEYOR8Agg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722674969; c=relaxed/simple;
	bh=/oZyevdYvcJVkyNkBW1RK2PaK58OJBHj43JTSbZ7GcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J7qnUbdqzmnAnVez6QDp3B79ZwXfvDj0dlNVVDw0v5u7NR79eGEcJbg+gtb0SB12wjR+K2Q3kB8h6JR+2f3RrQG0Lc6laKvyu2avoSKgGnpZPeg1HUuy1U0CY2RTmVzIpqt+Q62bu0f19incX7EVAYKq9TTMnhgu4nqAA/FSXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6igYCSC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6igYCSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722674965; x=1754210965;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/oZyevdYvcJVkyNkBW1RK2PaK58OJBHj43JTSbZ7GcQ=;
  b=i6igYCSCypOIeR1hAsIqZH4P6qf0qNiCkyQoTh1AWRcOA76IzZV+XHnE
   WqKs7K+NmQplwDClR9sEfs7aZJ4VkK/cqTSMRTDaiFkofTxAnVFQQXYKn
   Y3FjtvdytYSWff9rsOWg5txOUpmpGHUIAK2Y8G+VJ6IN8MxPCUrsW5MLV
   icsM4z/rYOysmRJl7u4PrNMvmFJSoVhG4D4Fg/7Vtu3GPYx4rZfyqYli1
   axAxlNiaPsosRlbNPpcLU02gzcG4qGdUJr64L/OO2efa75TMo1zWG/bT/
   LDRvmalyIrRbrO0HurJVJbyMkbyA1vb2W2GZovI9iuXvjn5NBza5C6uN0
   Q==;
X-CSE-ConnectionGUID: wd4jTUeYRLWM5i/Lc7IMVA==
X-CSE-MsgGUID: hXoo1e4uScezPUEYJTmZMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20643860"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20643860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 01:49:24 -0700
X-CSE-ConnectionGUID: ZKPMBru8QGahyLLE7vfIiA==
X-CSE-MsgGUID: 1hQ65n2fTz26S7y/HMOIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60041052"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2024 01:49:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saARu-0000Ks-0S;
	Sat, 03 Aug 2024 08:49:16 +0000
Date: Sat, 3 Aug 2024 16:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:rw_iter 324/440]
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c:749: warning: expecting
 prototype for i40e_dbg_command_write_iter(). Prototype was for
 i40e_dbg_command_write() instead
Message-ID: <202408031611.2gG7z0JI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b9521a4573f2ff4bd91ee66d23e4c41e8e4fab6b
commit: 4c4a41372afd1670b462223b0d8894261324df40 [324/440] drivers/net/ethernet/intel: convert to read/write iterators
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240803/202408031611.2gG7z0JI-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031611.2gG7z0JI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031611.2gG7z0JI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/i40e/i40e_debugfs.c:749: warning: expecting prototype for i40e_dbg_command_write_iter(). Prototype was for i40e_dbg_command_write() instead


vim +749 drivers/net/ethernet/intel/i40e/i40e_debugfs.c

3118025a070f33 Mitch Williams      2017-04-12   742  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   743  /**
4c4a41372afd16 Bui Quang Minh      2024-04-09   744   * i40e_dbg_command_write_iter - write into command datum
4c4a41372afd16 Bui Quang Minh      2024-04-09   745   * @iocb: the kernel io callback (kiocb) struct
4c4a41372afd16 Bui Quang Minh      2024-04-09   746   * @from: iovec iterator
02e9c290814cc1 Jesse Brandeburg    2013-09-11   747   **/
4c4a41372afd16 Bui Quang Minh      2024-04-09   748  static ssize_t i40e_dbg_command_write(struct kiocb *iocb, struct iov_iter *from)
02e9c290814cc1 Jesse Brandeburg    2013-09-11  @749  {
4c4a41372afd16 Bui Quang Minh      2024-04-09   750  	struct i40e_pf *pf = iocb->ki_filp->private_data;
004173cbbf933b Jesse Brandeburg    2013-09-28   751  	char *cmd_buf, *cmd_buf_tmp;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   752  	struct i40e_vsi *vsi;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   753  	int vsi_seid;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   754  	int veb_seid;
3118025a070f33 Mitch Williams      2017-04-12   755  	int vf_id;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   756  	int cnt;
4c4a41372afd16 Bui Quang Minh      2024-04-09   757  	size_t count = iov_iter_count(from);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   758  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   759  	/* don't allow partial writes */
4c4a41372afd16 Bui Quang Minh      2024-04-09   760  	if (iocb->ki_pos != 0)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   761  		return 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   762  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   763  	cmd_buf = kzalloc(count + 1, GFP_KERNEL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   764  	if (!cmd_buf)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   765  		return count;
4c4a41372afd16 Bui Quang Minh      2024-04-09   766  	if (!copy_from_iter_full(cmd_buf, count, from)) {
dda094a312dbb2 Alexey Khoroshilov  2015-02-21   767  		kfree(cmd_buf);
0286c67e710cc8 Rasmus Villemoes    2015-10-17   768  		return -EFAULT;
dda094a312dbb2 Alexey Khoroshilov  2015-02-21   769  	}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   770  	cmd_buf[count] = '\0';
02e9c290814cc1 Jesse Brandeburg    2013-09-11   771  
004173cbbf933b Jesse Brandeburg    2013-09-28   772  	cmd_buf_tmp = strchr(cmd_buf, '\n');
004173cbbf933b Jesse Brandeburg    2013-09-28   773  	if (cmd_buf_tmp) {
004173cbbf933b Jesse Brandeburg    2013-09-28   774  		*cmd_buf_tmp = '\0';
004173cbbf933b Jesse Brandeburg    2013-09-28   775  		count = cmd_buf_tmp - cmd_buf + 1;
004173cbbf933b Jesse Brandeburg    2013-09-28   776  	}
004173cbbf933b Jesse Brandeburg    2013-09-28   777  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   778  	if (strncmp(cmd_buf, "add vsi", 7) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   779  		vsi_seid = -1;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   780  		cnt = sscanf(&cmd_buf[7], "%i", &vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   781  		if (cnt == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   782  			/* default to PF VSI */
43f4466ca91deb Ivan Vecera         2024-04-27   783  			vsi = i40e_pf_get_main_vsi(pf);
43f4466ca91deb Ivan Vecera         2024-04-27   784  			vsi_seid = vsi->seid;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   785  		} else if (vsi_seid < 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   786  			dev_info(&pf->pdev->dev, "add VSI %d: bad vsi seid\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   787  				 vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   788  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   789  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   790  
fc60861e9b0038 Anjali Singhai Jain 2015-05-08   791  		/* By default we are in VEPA mode, if this is the first VF/VMDq
fc60861e9b0038 Anjali Singhai Jain 2015-05-08   792  		 * VSI to be added switch to VEB mode.
fc60861e9b0038 Anjali Singhai Jain 2015-05-08   793  		 */
70756d0a4727fe Ivan Vecera         2023-11-13   794  		if (!test_bit(I40E_FLAG_VEB_MODE_ENA, pf->flags)) {
70756d0a4727fe Ivan Vecera         2023-11-13   795  			set_bit(I40E_FLAG_VEB_MODE_ENA, pf->flags);
ff424188123226 Amritha Nambiar     2017-09-07   796  			i40e_do_reset_safe(pf, I40E_PF_RESET_FLAG);
fc60861e9b0038 Anjali Singhai Jain 2015-05-08   797  		}
fc60861e9b0038 Anjali Singhai Jain 2015-05-08   798  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   799  		vsi = i40e_vsi_setup(pf, I40E_VSI_VMDQ2, vsi_seid, 0);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   800  		if (vsi)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   801  			dev_info(&pf->pdev->dev, "added VSI %d to relay %d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   802  				 vsi->seid, vsi->uplink_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   803  		else
02e9c290814cc1 Jesse Brandeburg    2013-09-11   804  			dev_info(&pf->pdev->dev, "'%s' failed\n", cmd_buf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   805  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   806  	} else if (strncmp(cmd_buf, "del vsi", 7) == 0) {
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   807  		cnt = sscanf(&cmd_buf[7], "%i", &vsi_seid);
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   808  		if (cnt != 1) {
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   809  			dev_info(&pf->pdev->dev,
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   810  				 "del vsi: bad command string, cnt=%d\n",
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   811  				 cnt);
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   812  			goto command_write_done;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28   813  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   814  		vsi = i40e_dbg_find_vsi(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   815  		if (!vsi) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   816  			dev_info(&pf->pdev->dev, "del VSI %d: seid not found\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   817  				 vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   818  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   819  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   820  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   821  		dev_info(&pf->pdev->dev, "deleting VSI %d\n", vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   822  		i40e_vsi_release(vsi);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   823  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   824  	} else if (strncmp(cmd_buf, "add relay", 9) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   825  		struct i40e_veb *veb;
08cdde310e2252 Ivan Vecera         2023-11-24   826  		u8 enabled_tc = 0x1;
b7fac08db5e32a Ivan Vecera         2023-11-24   827  		int uplink_seid;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   828  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   829  		cnt = sscanf(&cmd_buf[9], "%i %i", &uplink_seid, &vsi_seid);
08cdde310e2252 Ivan Vecera         2023-11-24   830  		if (cnt == 0) {
08cdde310e2252 Ivan Vecera         2023-11-24   831  			uplink_seid = 0;
08cdde310e2252 Ivan Vecera         2023-11-24   832  			vsi_seid = 0;
08cdde310e2252 Ivan Vecera         2023-11-24   833  		} else if (cnt != 2) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   834  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   835  				 "add relay: bad command string, cnt=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   836  				 cnt);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   837  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   838  		} else if (uplink_seid < 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   839  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   840  				 "add relay %d: bad uplink seid\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   841  				 uplink_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   842  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   843  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   844  
f09cbb6c94e47b Ivan Vecera         2023-11-24   845  		if (uplink_seid != 0 && uplink_seid != pf->mac_seid) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   846  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   847  				 "add relay: relay uplink %d not found\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   848  				 uplink_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   849  			goto command_write_done;
08cdde310e2252 Ivan Vecera         2023-11-24   850  		} else if (uplink_seid) {
08cdde310e2252 Ivan Vecera         2023-11-24   851  			vsi = i40e_pf_get_vsi_by_seid(pf, vsi_seid);
08cdde310e2252 Ivan Vecera         2023-11-24   852  			if (!vsi) {
08cdde310e2252 Ivan Vecera         2023-11-24   853  				dev_info(&pf->pdev->dev,
08cdde310e2252 Ivan Vecera         2023-11-24   854  					 "add relay: VSI %d not found\n",
08cdde310e2252 Ivan Vecera         2023-11-24   855  					 vsi_seid);
08cdde310e2252 Ivan Vecera         2023-11-24   856  				goto command_write_done;
08cdde310e2252 Ivan Vecera         2023-11-24   857  			}
08cdde310e2252 Ivan Vecera         2023-11-24   858  			enabled_tc = vsi->tc_config.enabled_tc;
08cdde310e2252 Ivan Vecera         2023-11-24   859  		} else if (vsi_seid) {
08cdde310e2252 Ivan Vecera         2023-11-24   860  			dev_info(&pf->pdev->dev,
08cdde310e2252 Ivan Vecera         2023-11-24   861  				 "add relay: VSI must be 0 for floating relay\n");
08cdde310e2252 Ivan Vecera         2023-11-24   862  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   863  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   864  
b92379dc94c1ee Ivan Vecera         2024-04-27   865  		veb = i40e_veb_setup(pf, uplink_seid, vsi_seid, enabled_tc);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   866  		if (veb)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   867  			dev_info(&pf->pdev->dev, "added relay %d\n", veb->seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   868  		else
02e9c290814cc1 Jesse Brandeburg    2013-09-11   869  			dev_info(&pf->pdev->dev, "add relay failed\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11   870  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   871  	} else if (strncmp(cmd_buf, "del relay", 9) == 0) {
b1f1b46f466a08 Ivan Vecera         2023-11-24   872  		struct i40e_veb *veb;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   873  		int i;
b1f1b46f466a08 Ivan Vecera         2023-11-24   874  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   875  		cnt = sscanf(&cmd_buf[9], "%i", &veb_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   876  		if (cnt != 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   877  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   878  				 "del relay: bad command string, cnt=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   879  				 cnt);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   880  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   881  		} else if (veb_seid < 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   882  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   883  				 "del relay %d: bad relay seid\n", veb_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   884  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   885  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   886  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   887  		/* find the veb */
b1f1b46f466a08 Ivan Vecera         2023-11-24   888  		i40e_pf_for_each_veb(pf, i, veb)
b1f1b46f466a08 Ivan Vecera         2023-11-24   889  			if (veb->seid == veb_seid)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   890  				break;
b1f1b46f466a08 Ivan Vecera         2023-11-24   891  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   892  		if (i >= I40E_MAX_VEB) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   893  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   894  				 "del relay: relay %d not found\n", veb_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   895  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   896  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   897  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   898  		dev_info(&pf->pdev->dev, "deleting relay %d\n", veb_seid);
b1f1b46f466a08 Ivan Vecera         2023-11-24   899  		i40e_veb_release(veb);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   900  	} else if (strncmp(cmd_buf, "add pvid", 8) == 0) {
efe1ac25d084fd Toralf Förster      2014-05-20   901  		unsigned int v;
5180ff1364bc26 Jan Sokolowski      2023-01-09   902  		int ret;
5180ff1364bc26 Jan Sokolowski      2023-01-09   903  		u16 vid;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   904  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   905  		cnt = sscanf(&cmd_buf[8], "%i %u", &vsi_seid, &v);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   906  		if (cnt != 2) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   907  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   908  				 "add pvid: bad command string, cnt=%d\n", cnt);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   909  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   910  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   911  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   912  		vsi = i40e_dbg_find_vsi(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   913  		if (!vsi) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   914  			dev_info(&pf->pdev->dev, "add pvid: VSI %d not found\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   915  				 vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   916  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   917  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   918  
efe1ac25d084fd Toralf Förster      2014-05-20   919  		vid = v;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   920  		ret = i40e_vsi_add_pvid(vsi, vid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   921  		if (!ret)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   922  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   923  				 "add pvid: %d added to VSI %d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   924  				 vid, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   925  		else
02e9c290814cc1 Jesse Brandeburg    2013-09-11   926  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   927  				 "add pvid: %d to VSI %d failed, ret=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   928  				 vid, vsi_seid, ret);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   929  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   930  	} else if (strncmp(cmd_buf, "del pvid", 8) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   931  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   932  		cnt = sscanf(&cmd_buf[8], "%i", &vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   933  		if (cnt != 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   934  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   935  				 "del pvid: bad command string, cnt=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   936  				 cnt);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   937  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   938  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   939  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   940  		vsi = i40e_dbg_find_vsi(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   941  		if (!vsi) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   942  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   943  				 "del pvid: VSI %d not found\n", vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   944  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   945  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11   946  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   947  		i40e_vsi_remove_pvid(vsi);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   948  		dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   949  			 "del pvid: removed from VSI %d\n", vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   950  
02e9c290814cc1 Jesse Brandeburg    2013-09-11   951  	} else if (strncmp(cmd_buf, "dump", 4) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   952  		if (strncmp(&cmd_buf[5], "switch", 6) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   953  			i40e_fetch_switch_configuration(pf, true);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   954  		} else if (strncmp(&cmd_buf[5], "vsi", 3) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   955  			cnt = sscanf(&cmd_buf[8], "%i", &vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   956  			if (cnt > 0)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   957  				i40e_dbg_dump_vsi_seid(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   958  			else
02e9c290814cc1 Jesse Brandeburg    2013-09-11   959  				i40e_dbg_dump_vsi_no_seid(pf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   960  		} else if (strncmp(&cmd_buf[5], "veb", 3) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   961  			cnt = sscanf(&cmd_buf[8], "%i", &vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   962  			if (cnt > 0)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   963  				i40e_dbg_dump_veb_seid(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   964  			else
02e9c290814cc1 Jesse Brandeburg    2013-09-11   965  				i40e_dbg_dump_veb_all(pf);
3118025a070f33 Mitch Williams      2017-04-12   966  		} else if (strncmp(&cmd_buf[5], "vf", 2) == 0) {
3118025a070f33 Mitch Williams      2017-04-12   967  			cnt = sscanf(&cmd_buf[7], "%i", &vf_id);
3118025a070f33 Mitch Williams      2017-04-12   968  			if (cnt > 0)
3118025a070f33 Mitch Williams      2017-04-12   969  				i40e_dbg_dump_vf(pf, vf_id);
3118025a070f33 Mitch Williams      2017-04-12   970  			else
3118025a070f33 Mitch Williams      2017-04-12   971  				i40e_dbg_dump_vf_all(pf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   972  		} else if (strncmp(&cmd_buf[5], "desc", 4) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   973  			int ring_id, desc_n;
02e9c290814cc1 Jesse Brandeburg    2013-09-11   974  			if (strncmp(&cmd_buf[10], "rx", 2) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   975  				cnt = sscanf(&cmd_buf[12], "%i %i %i",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   976  					     &vsi_seid, &ring_id, &desc_n);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   977  				i40e_dbg_dump_desc(cnt, vsi_seid, ring_id,
44ea803e2fa7e1 Ciara Loftus        2020-06-23   978  						   desc_n, pf, RING_TYPE_RX);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   979  			} else if (strncmp(&cmd_buf[10], "tx", 2)
02e9c290814cc1 Jesse Brandeburg    2013-09-11   980  					== 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   981  				cnt = sscanf(&cmd_buf[12], "%i %i %i",
02e9c290814cc1 Jesse Brandeburg    2013-09-11   982  					     &vsi_seid, &ring_id, &desc_n);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   983  				i40e_dbg_dump_desc(cnt, vsi_seid, ring_id,
44ea803e2fa7e1 Ciara Loftus        2020-06-23   984  						   desc_n, pf, RING_TYPE_TX);
44ea803e2fa7e1 Ciara Loftus        2020-06-23   985  			} else if (strncmp(&cmd_buf[10], "xdp", 3)
44ea803e2fa7e1 Ciara Loftus        2020-06-23   986  					== 0) {
44ea803e2fa7e1 Ciara Loftus        2020-06-23   987  				cnt = sscanf(&cmd_buf[13], "%i %i %i",
44ea803e2fa7e1 Ciara Loftus        2020-06-23   988  					     &vsi_seid, &ring_id, &desc_n);
44ea803e2fa7e1 Ciara Loftus        2020-06-23   989  				i40e_dbg_dump_desc(cnt, vsi_seid, ring_id,
44ea803e2fa7e1 Ciara Loftus        2020-06-23   990  						   desc_n, pf, RING_TYPE_XDP);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   991  			} else if (strncmp(&cmd_buf[10], "aq", 2) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   992  				i40e_dbg_dump_aq_desc(pf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11   993  			} else {
02e9c290814cc1 Jesse Brandeburg    2013-09-11   994  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   995  					 "dump desc tx <vsi_seid> <ring_id> [<desc_n>]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11   996  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11   997  					 "dump desc rx <vsi_seid> <ring_id> [<desc_n>]\n");
44ea803e2fa7e1 Ciara Loftus        2020-06-23   998  				dev_info(&pf->pdev->dev,
44ea803e2fa7e1 Ciara Loftus        2020-06-23   999  					 "dump desc xdp <vsi_seid> <ring_id> [<desc_n>]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1000  				dev_info(&pf->pdev->dev, "dump desc aq\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1001  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1002  		} else if (strncmp(&cmd_buf[5], "reset stats", 11) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1003  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1004  				 "core reset count: %d\n", pf->corer_count);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1005  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1006  				 "global reset count: %d\n", pf->globr_count);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1007  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1008  				 "emp reset count: %d\n", pf->empr_count);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1009  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1010  				 "pf reset count: %d\n", pf->pfr_count);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1011  		} else if (strncmp(&cmd_buf[5], "port", 4) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1012  			struct i40e_aqc_query_port_ets_config_resp *bw_data;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1013  			struct i40e_dcbx_config *cfg =
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1014  						&pf->hw.local_dcbx_config;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1015  			struct i40e_dcbx_config *r_cfg =
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1016  						&pf->hw.remote_dcbx_config;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1017  			int i, ret;
2ae0bf501425cb Jacob Keller        2016-12-12  1018  			u16 switch_id;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1019  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1020  			bw_data = kzalloc(sizeof(
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1021  				    struct i40e_aqc_query_port_ets_config_resp),
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1022  					  GFP_KERNEL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1023  			if (!bw_data) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1024  				ret = -ENOMEM;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1025  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1026  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1027  
43f4466ca91deb Ivan Vecera         2024-04-27  1028  			vsi = i40e_pf_get_main_vsi(pf);
a01c7f67099259 Alan Brady          2016-08-24  1029  			switch_id =
2ae0bf501425cb Jacob Keller        2016-12-12  1030  				le16_to_cpu(vsi->info.switch_id) &
2ae0bf501425cb Jacob Keller        2016-12-12  1031  					    I40E_AQ_VSI_SW_ID_MASK;
a01c7f67099259 Alan Brady          2016-08-24  1032  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1033  			ret = i40e_aq_query_port_ets_config(&pf->hw,
a01c7f67099259 Alan Brady          2016-08-24  1034  							    switch_id,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1035  							    bw_data, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1036  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1037  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1038  					 "Query Port ETS Config AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1039  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1040  				kfree(bw_data);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1041  				bw_data = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1042  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1043  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1044  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1045  				 "port bw: tc_valid=0x%x tc_strict_prio=0x%x, tc_bw_max=0x%04x,0x%04x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1046  				 bw_data->tc_valid_bits,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1047  				 bw_data->tc_strict_priority_bits,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1048  				 le16_to_cpu(bw_data->tc_bw_max[0]),
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1049  				 le16_to_cpu(bw_data->tc_bw_max[1]));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1050  			for (i = 0; i < I40E_MAX_TRAFFIC_CLASS; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1051  				dev_info(&pf->pdev->dev, "port bw: tc_bw_share=%d tc_bw_limit=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1052  					 bw_data->tc_bw_share_credits[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1053  					 le16_to_cpu(bw_data->tc_bw_limits[i]));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1054  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1055  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1056  			kfree(bw_data);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1057  			bw_data = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1058  
9fa61dd2153a4f Neerav Parikh       2014-11-12  1059  			dev_info(&pf->pdev->dev,
9fa61dd2153a4f Neerav Parikh       2014-11-12  1060  				 "port dcbx_mode=%d\n", cfg->dcbx_mode);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1061  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1062  				 "port ets_cfg: willing=%d cbs=%d, maxtcs=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1063  				 cfg->etscfg.willing, cfg->etscfg.cbs,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1064  				 cfg->etscfg.maxtcs);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1065  			for (i = 0; i < I40E_MAX_TRAFFIC_CLASS; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1066  				dev_info(&pf->pdev->dev, "port ets_cfg: %d prio_tc=%d tcbw=%d tctsa=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1067  					 i, cfg->etscfg.prioritytable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1068  					 cfg->etscfg.tcbwtable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1069  					 cfg->etscfg.tsatable[i]);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1070  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1071  			for (i = 0; i < I40E_MAX_TRAFFIC_CLASS; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1072  				dev_info(&pf->pdev->dev, "port ets_rec: %d prio_tc=%d tcbw=%d tctsa=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1073  					 i, cfg->etsrec.prioritytable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1074  					 cfg->etsrec.tcbwtable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1075  					 cfg->etsrec.tsatable[i]);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1076  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1077  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1078  				 "port pfc_cfg: willing=%d mbc=%d, pfccap=%d pfcenable=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1079  				 cfg->pfc.willing, cfg->pfc.mbc,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1080  				 cfg->pfc.pfccap, cfg->pfc.pfcenable);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1081  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1082  				 "port app_table: num_apps=%d\n", cfg->numapps);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1083  			for (i = 0; i < cfg->numapps; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1084  				dev_info(&pf->pdev->dev, "port app_table: %d prio=%d selector=%d protocol=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1085  					 i, cfg->app[i].priority,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1086  					 cfg->app[i].selector,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1087  					 cfg->app[i].protocolid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1088  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1089  			/* Peer TLV DCBX data */
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1090  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1091  				 "remote port ets_cfg: willing=%d cbs=%d, maxtcs=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1092  				 r_cfg->etscfg.willing,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1093  				 r_cfg->etscfg.cbs, r_cfg->etscfg.maxtcs);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1094  			for (i = 0; i < I40E_MAX_TRAFFIC_CLASS; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1095  				dev_info(&pf->pdev->dev, "remote port ets_cfg: %d prio_tc=%d tcbw=%d tctsa=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1096  					 i, r_cfg->etscfg.prioritytable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1097  					 r_cfg->etscfg.tcbwtable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1098  					 r_cfg->etscfg.tsatable[i]);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1099  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1100  			for (i = 0; i < I40E_MAX_TRAFFIC_CLASS; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1101  				dev_info(&pf->pdev->dev, "remote port ets_rec: %d prio_tc=%d tcbw=%d tctsa=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1102  					 i, r_cfg->etsrec.prioritytable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1103  					 r_cfg->etsrec.tcbwtable[i],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1104  					 r_cfg->etsrec.tsatable[i]);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1105  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1106  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1107  				 "remote port pfc_cfg: willing=%d mbc=%d, pfccap=%d pfcenable=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1108  				 r_cfg->pfc.willing,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1109  				 r_cfg->pfc.mbc,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1110  				 r_cfg->pfc.pfccap,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1111  				 r_cfg->pfc.pfcenable);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1112  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1113  				 "remote port app_table: num_apps=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1114  				 r_cfg->numapps);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1115  			for (i = 0; i < r_cfg->numapps; i++) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1116  				dev_info(&pf->pdev->dev, "remote port app_table: %d prio=%d selector=%d protocol=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1117  					 i, r_cfg->app[i].priority,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1118  					 r_cfg->app[i].selector,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1119  					 r_cfg->app[i].protocolid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1120  			}
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1121  		} else if (strncmp(&cmd_buf[5], "debug fwdata", 12) == 0) {
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1122  			int cluster_id, table_id;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1123  			int index, ret;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1124  			u16 buff_len = 4096;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1125  			u32 next_index;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1126  			u8 next_table;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1127  			u8 *buff;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1128  			u16 rlen;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1129  
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1130  			cnt = sscanf(&cmd_buf[18], "%i %i %i",
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1131  				     &cluster_id, &table_id, &index);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1132  			if (cnt != 3) {
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1133  				dev_info(&pf->pdev->dev,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1134  					 "dump debug fwdata <cluster_id> <table_id> <index>\n");
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1135  				goto command_write_done;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1136  			}
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1137  
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1138  			dev_info(&pf->pdev->dev,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1139  				 "AQ debug dump fwdata params %x %x %x %x\n",
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1140  				 cluster_id, table_id, index, buff_len);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1141  			buff = kzalloc(buff_len, GFP_KERNEL);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1142  			if (!buff)
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1143  				goto command_write_done;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1144  
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1145  			ret = i40e_aq_debug_dump(&pf->hw, cluster_id, table_id,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1146  						 index, buff_len, buff, &rlen,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1147  						 &next_table, &next_index,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1148  						 NULL);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1149  			if (ret) {
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1150  				dev_info(&pf->pdev->dev,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1151  					 "debug dump fwdata AQ Failed %d 0x%x\n",
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1152  					 ret, pf->hw.aq.asq_last_status);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1153  				kfree(buff);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1154  				buff = NULL;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1155  				goto command_write_done;
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1156  			}
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1157  			dev_info(&pf->pdev->dev,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1158  				 "AQ debug dump fwdata rlen=0x%x next_table=0x%x next_index=0x%x\n",
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1159  				 rlen, next_table, next_index);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1160  			print_hex_dump(KERN_INFO, "AQ buffer WB: ",
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1161  				       DUMP_PREFIX_OFFSET, 16, 1,
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1162  				       buff, rlen, true);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1163  			kfree(buff);
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1164  			buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1165  		} else {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1166  			dev_info(&pf->pdev->dev,
44ea803e2fa7e1 Ciara Loftus        2020-06-23  1167  				 "dump desc tx <vsi_seid> <ring_id> [<desc_n>], dump desc rx <vsi_seid> <ring_id> [<desc_n>], dump desc xdp <vsi_seid> <ring_id> [<desc_n>],\n");
7204a785e70cdc Shannon Nelson      2014-10-17  1168  			dev_info(&pf->pdev->dev, "dump switch\n");
7204a785e70cdc Shannon Nelson      2014-10-17  1169  			dev_info(&pf->pdev->dev, "dump vsi [seid]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1170  			dev_info(&pf->pdev->dev, "dump reset stats\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1171  			dev_info(&pf->pdev->dev, "dump port\n");
3118025a070f33 Mitch Williams      2017-04-12  1172  			dev_info(&pf->pdev->dev, "dump vf [vf_id]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1173  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1174  				 "dump debug fwdata <cluster_id> <table_id> <index>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1175  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1176  	} else if (strncmp(cmd_buf, "pfr", 3) == 0) {
69bfb110fd5818 Jesse Brandeburg    2014-02-11  1177  		dev_info(&pf->pdev->dev, "debugfs: forcing PFR\n");
41a1d04b9d2006 Jesse Brandeburg    2015-06-04  1178  		i40e_do_reset_safe(pf, BIT(__I40E_PF_RESET_REQUESTED));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1179  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1180  	} else if (strncmp(cmd_buf, "corer", 5) == 0) {
69bfb110fd5818 Jesse Brandeburg    2014-02-11  1181  		dev_info(&pf->pdev->dev, "debugfs: forcing CoreR\n");
41a1d04b9d2006 Jesse Brandeburg    2015-06-04  1182  		i40e_do_reset_safe(pf, BIT(__I40E_CORE_RESET_REQUESTED));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1183  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1184  	} else if (strncmp(cmd_buf, "globr", 5) == 0) {
69bfb110fd5818 Jesse Brandeburg    2014-02-11  1185  		dev_info(&pf->pdev->dev, "debugfs: forcing GlobR\n");
41a1d04b9d2006 Jesse Brandeburg    2015-06-04  1186  		i40e_do_reset_safe(pf, BIT(__I40E_GLOBAL_RESET_REQUESTED));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1187  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1188  	} else if (strncmp(cmd_buf, "read", 4) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1189  		u32 address;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1190  		u32 value;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1191  
2706a20e0bab5b Shannon Nelson      2013-11-26  1192  		cnt = sscanf(&cmd_buf[4], "%i", &address);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1193  		if (cnt != 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1194  			dev_info(&pf->pdev->dev, "read <reg>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1195  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1196  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1197  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1198  		/* check the range on address */
2ac8b675d9466b Shannon Nelson      2015-07-23  1199  		if (address > (pf->ioremap_len - sizeof(u32))) {
2ac8b675d9466b Shannon Nelson      2015-07-23  1200  			dev_info(&pf->pdev->dev, "read reg address 0x%08x too large, max=0x%08lx\n",
e88ae667ecccf1 Jesse Brandeburg    2015-08-13  1201  				 address, (unsigned long int)(pf->ioremap_len - sizeof(u32)));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1202  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1203  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1204  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1205  		value = rd32(&pf->hw, address);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1206  		dev_info(&pf->pdev->dev, "read: 0x%08x = 0x%08x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1207  			 address, value);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1208  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1209  	} else if (strncmp(cmd_buf, "write", 5) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1210  		u32 address, value;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1211  
2706a20e0bab5b Shannon Nelson      2013-11-26  1212  		cnt = sscanf(&cmd_buf[5], "%i %i", &address, &value);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1213  		if (cnt != 2) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1214  			dev_info(&pf->pdev->dev, "write <reg> <value>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1215  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1216  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1217  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1218  		/* check the range on address */
2ac8b675d9466b Shannon Nelson      2015-07-23  1219  		if (address > (pf->ioremap_len - sizeof(u32))) {
2ac8b675d9466b Shannon Nelson      2015-07-23  1220  			dev_info(&pf->pdev->dev, "write reg address 0x%08x too large, max=0x%08lx\n",
e88ae667ecccf1 Jesse Brandeburg    2015-08-13  1221  				 address, (unsigned long int)(pf->ioremap_len - sizeof(u32)));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1222  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1223  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1224  		wr32(&pf->hw, address, value);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1225  		value = rd32(&pf->hw, address);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1226  		dev_info(&pf->pdev->dev, "write: 0x%08x = 0x%08x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1227  			 address, value);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1228  	} else if (strncmp(cmd_buf, "clear_stats", 11) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1229  		if (strncmp(&cmd_buf[12], "vsi", 3) == 0) {
2706a20e0bab5b Shannon Nelson      2013-11-26  1230  			cnt = sscanf(&cmd_buf[15], "%i", &vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1231  			if (cnt == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1232  				int i;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1233  
b1f1b46f466a08 Ivan Vecera         2023-11-24  1234  				i40e_pf_for_each_vsi(pf, i, vsi)
b1f1b46f466a08 Ivan Vecera         2023-11-24  1235  					i40e_vsi_reset_stats(vsi);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1236  				dev_info(&pf->pdev->dev, "vsi clear stats called for all vsi's\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1237  			} else if (cnt == 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1238  				vsi = i40e_dbg_find_vsi(pf, vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1239  				if (!vsi) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1240  					dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1241  						 "clear_stats vsi: bad vsi %d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1242  						 vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1243  					goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1244  				}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1245  				i40e_vsi_reset_stats(vsi);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1246  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1247  					 "vsi clear stats called for vsi %d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1248  					 vsi_seid);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1249  			} else {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1250  				dev_info(&pf->pdev->dev, "clear_stats vsi [seid]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1251  			}
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1252  		} else if (strncmp(&cmd_buf[12], "port", 4) == 0) {
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1253  			if (pf->hw.partition_id == 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1254  				i40e_pf_reset_stats(pf);
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1255  				dev_info(&pf->pdev->dev, "port stats cleared\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1256  			} else {
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1257  				dev_info(&pf->pdev->dev, "clear port stats not allowed on this port partition\n");
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1258  			}
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1259  		} else {
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1260  			dev_info(&pf->pdev->dev, "clear_stats vsi [seid] or clear_stats port\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1261  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1262  	} else if (strncmp(cmd_buf, "send aq_cmd", 11) == 0) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1263  		struct i40e_aq_desc *desc;
5180ff1364bc26 Jan Sokolowski      2023-01-09  1264  		int ret;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1265  
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1266  		desc = kzalloc(sizeof(struct i40e_aq_desc), GFP_KERNEL);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1267  		if (!desc)
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1268  			goto command_write_done;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1269  		cnt = sscanf(&cmd_buf[11],
fbe82101007337 Shannon Nelson      2014-11-11  1270  			     "%hi %hi %hi %hi %i %i %i %i %i %i",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1271  			     &desc->flags,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1272  			     &desc->opcode, &desc->datalen, &desc->retval,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1273  			     &desc->cookie_high, &desc->cookie_low,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1274  			     &desc->params.internal.param0,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1275  			     &desc->params.internal.param1,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1276  			     &desc->params.internal.param2,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1277  			     &desc->params.internal.param3);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1278  		if (cnt != 10) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1279  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1280  				 "send aq_cmd: bad command string, cnt=%d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1281  				 cnt);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1282  			kfree(desc);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1283  			desc = NULL;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1284  			goto command_write_done;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1285  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1286  		ret = i40e_asq_send_command(&pf->hw, desc, NULL, 0, NULL);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1287  		if (!ret) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1288  			dev_info(&pf->pdev->dev, "AQ command sent Status : Success\n");
230f3d53a5477b Jan Sokolowski      2023-07-28  1289  		} else if (ret == -EIO) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1290  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1291  				 "AQ command send failed Opcode %x AQ Error: %d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1292  				 desc->opcode, pf->hw.aq.asq_last_status);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1293  		} else {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1294  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1295  				 "AQ command send failed Opcode %x Status: %d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1296  				 desc->opcode, ret);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1297  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1298  		dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1299  			 "AQ desc WB 0x%04x 0x%04x 0x%04x 0x%04x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1300  			 desc->flags, desc->opcode, desc->datalen, desc->retval,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1301  			 desc->cookie_high, desc->cookie_low,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1302  			 desc->params.internal.param0,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1303  			 desc->params.internal.param1,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1304  			 desc->params.internal.param2,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1305  			 desc->params.internal.param3);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1306  		kfree(desc);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1307  		desc = NULL;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1308  	} else if (strncmp(cmd_buf, "send indirect aq_cmd", 20) == 0) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1309  		struct i40e_aq_desc *desc;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1310  		u16 buffer_len;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1311  		u8 *buff;
5180ff1364bc26 Jan Sokolowski      2023-01-09  1312  		int ret;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1313  
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1314  		desc = kzalloc(sizeof(struct i40e_aq_desc), GFP_KERNEL);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1315  		if (!desc)
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1316  			goto command_write_done;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1317  		cnt = sscanf(&cmd_buf[20],
fbe82101007337 Shannon Nelson      2014-11-11  1318  			     "%hi %hi %hi %hi %i %i %i %i %i %i %hi",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1319  			     &desc->flags,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1320  			     &desc->opcode, &desc->datalen, &desc->retval,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1321  			     &desc->cookie_high, &desc->cookie_low,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1322  			     &desc->params.internal.param0,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1323  			     &desc->params.internal.param1,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1324  			     &desc->params.internal.param2,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1325  			     &desc->params.internal.param3,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1326  			     &buffer_len);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1327  		if (cnt != 11) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1328  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1329  				 "send indirect aq_cmd: bad command string, cnt=%d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1330  				 cnt);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1331  			kfree(desc);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1332  			desc = NULL;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1333  			goto command_write_done;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1334  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1335  		/* Just stub a buffer big enough in case user messed up */
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1336  		if (buffer_len == 0)
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1337  			buffer_len = 1280;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1338  
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1339  		buff = kzalloc(buffer_len, GFP_KERNEL);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1340  		if (!buff) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1341  			kfree(desc);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1342  			desc = NULL;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1343  			goto command_write_done;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1344  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1345  		desc->flags |= cpu_to_le16((u16)I40E_AQ_FLAG_BUF);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1346  		ret = i40e_asq_send_command(&pf->hw, desc, buff,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1347  					    buffer_len, NULL);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1348  		if (!ret) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1349  			dev_info(&pf->pdev->dev, "AQ command sent Status : Success\n");
230f3d53a5477b Jan Sokolowski      2023-07-28  1350  		} else if (ret == -EIO) {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1351  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1352  				 "AQ command send failed Opcode %x AQ Error: %d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1353  				 desc->opcode, pf->hw.aq.asq_last_status);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1354  		} else {
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1355  			dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1356  				 "AQ command send failed Opcode %x Status: %d\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1357  				 desc->opcode, ret);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1358  		}
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1359  		dev_info(&pf->pdev->dev,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1360  			 "AQ desc WB 0x%04x 0x%04x 0x%04x 0x%04x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1361  			 desc->flags, desc->opcode, desc->datalen, desc->retval,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1362  			 desc->cookie_high, desc->cookie_low,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1363  			 desc->params.internal.param0,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1364  			 desc->params.internal.param1,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1365  			 desc->params.internal.param2,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1366  			 desc->params.internal.param3);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1367  		print_hex_dump(KERN_INFO, "AQ buffer WB: ",
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1368  			       DUMP_PREFIX_OFFSET, 16, 1,
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1369  			       buff, buffer_len, true);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1370  		kfree(buff);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1371  		buff = NULL;
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1372  		kfree(desc);
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1373  		desc = NULL;
e17ff05c5d9ee6 Anjali Singhai Jain 2014-06-04  1374  	} else if (strncmp(cmd_buf, "fd current cnt", 14) == 0) {
e17ff05c5d9ee6 Anjali Singhai Jain 2014-06-04  1375  		dev_info(&pf->pdev->dev, "FD current total filter count for this interface: %d\n",
e17ff05c5d9ee6 Anjali Singhai Jain 2014-06-04  1376  			 i40e_get_current_fd_count(pf));
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1377  	} else if (strncmp(cmd_buf, "lldp", 4) == 0) {
43f4466ca91deb Ivan Vecera         2024-04-27  1378  		/* Get main VSI */
43f4466ca91deb Ivan Vecera         2024-04-27  1379  		struct i40e_vsi *main_vsi = i40e_pf_get_main_vsi(pf);
43f4466ca91deb Ivan Vecera         2024-04-27  1380  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1381  		if (strncmp(&cmd_buf[5], "stop", 4) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1382  			int ret;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1383  
c65e78f87f8131 Aleksandr Loktionov 2019-02-28  1384  			ret = i40e_aq_stop_lldp(&pf->hw, false, false, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1385  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1386  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1387  					 "Stop LLDP AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1388  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1389  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1390  			}
4e3b35b044ea51 Neerav Parikh       2014-01-17  1391  			ret = i40e_aq_add_rem_control_packet_filter(&pf->hw,
43f4466ca91deb Ivan Vecera         2024-04-27  1392  						pf->hw.mac.addr, ETH_P_LLDP, 0,
43f4466ca91deb Ivan Vecera         2024-04-27  1393  						main_vsi->seid, 0, true, NULL,
43f4466ca91deb Ivan Vecera         2024-04-27  1394  						NULL);
4e3b35b044ea51 Neerav Parikh       2014-01-17  1395  			if (ret) {
4e3b35b044ea51 Neerav Parikh       2014-01-17  1396  				dev_info(&pf->pdev->dev,
4e3b35b044ea51 Neerav Parikh       2014-01-17  1397  					"%s: Add Control Packet Filter AQ command failed =0x%x\n",
4e3b35b044ea51 Neerav Parikh       2014-01-17  1398  					__func__, pf->hw.aq.asq_last_status);
4e3b35b044ea51 Neerav Parikh       2014-01-17  1399  				goto command_write_done;
4e3b35b044ea51 Neerav Parikh       2014-01-17  1400  			}
4e3b35b044ea51 Neerav Parikh       2014-01-17  1401  #ifdef CONFIG_I40E_DCB
4e3b35b044ea51 Neerav Parikh       2014-01-17  1402  			pf->dcbx_cap = DCB_CAP_DCBX_HOST |
4e3b35b044ea51 Neerav Parikh       2014-01-17  1403  				       DCB_CAP_DCBX_VER_IEEE;
4e3b35b044ea51 Neerav Parikh       2014-01-17  1404  #endif /* CONFIG_I40E_DCB */
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1405  		} else if (strncmp(&cmd_buf[5], "start", 5) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1406  			int ret;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1407  
4e3b35b044ea51 Neerav Parikh       2014-01-17  1408  			ret = i40e_aq_add_rem_control_packet_filter(&pf->hw,
43f4466ca91deb Ivan Vecera         2024-04-27  1409  						pf->hw.mac.addr, ETH_P_LLDP, 0,
43f4466ca91deb Ivan Vecera         2024-04-27  1410  						main_vsi->seid, 0, false, NULL,
43f4466ca91deb Ivan Vecera         2024-04-27  1411  						NULL);
4e3b35b044ea51 Neerav Parikh       2014-01-17  1412  			if (ret) {
4e3b35b044ea51 Neerav Parikh       2014-01-17  1413  				dev_info(&pf->pdev->dev,
4e3b35b044ea51 Neerav Parikh       2014-01-17  1414  					"%s: Remove Control Packet Filter AQ command failed =0x%x\n",
4e3b35b044ea51 Neerav Parikh       2014-01-17  1415  					__func__, pf->hw.aq.asq_last_status);
4e3b35b044ea51 Neerav Parikh       2014-01-17  1416  				/* Continue and start FW LLDP anyways */
4e3b35b044ea51 Neerav Parikh       2014-01-17  1417  			}
4e3b35b044ea51 Neerav Parikh       2014-01-17  1418  
c65e78f87f8131 Aleksandr Loktionov 2019-02-28  1419  			ret = i40e_aq_start_lldp(&pf->hw, false, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1420  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1421  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1422  					 "Start LLDP AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1423  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1424  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1425  			}
4e3b35b044ea51 Neerav Parikh       2014-01-17  1426  #ifdef CONFIG_I40E_DCB
4e3b35b044ea51 Neerav Parikh       2014-01-17  1427  			pf->dcbx_cap = DCB_CAP_DCBX_LLD_MANAGED |
4e3b35b044ea51 Neerav Parikh       2014-01-17  1428  				       DCB_CAP_DCBX_VER_IEEE;
4e3b35b044ea51 Neerav Parikh       2014-01-17  1429  #endif /* CONFIG_I40E_DCB */
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1430  		} else if (strncmp(&cmd_buf[5],
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1431  			   "get local", 9) == 0) {
738a9e9b641192 Shannon Nelson      2013-09-28  1432  			u16 llen, rlen;
3753cb240b13c2 Neerav Parikh       2013-11-26  1433  			int ret;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1434  			u8 *buff;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1435  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1436  			buff = kzalloc(I40E_LLDPDU_SIZE, GFP_KERNEL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1437  			if (!buff)
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1438  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1439  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1440  			ret = i40e_aq_get_lldp_mib(&pf->hw, 0,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1441  						   I40E_AQ_LLDP_MIB_LOCAL,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1442  						   buff, I40E_LLDPDU_SIZE,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1443  						   &llen, &rlen, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1444  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1445  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1446  					 "Get LLDP MIB (local) AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1447  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1448  				kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1449  				buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1450  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1451  			}
3753cb240b13c2 Neerav Parikh       2013-11-26  1452  			dev_info(&pf->pdev->dev, "LLDP MIB (local)\n");
3753cb240b13c2 Neerav Parikh       2013-11-26  1453  			print_hex_dump(KERN_INFO, "LLDP MIB (local): ",
3753cb240b13c2 Neerav Parikh       2013-11-26  1454  				       DUMP_PREFIX_OFFSET, 16, 1,
3753cb240b13c2 Neerav Parikh       2013-11-26  1455  				       buff, I40E_LLDPDU_SIZE, true);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1456  			kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1457  			buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1458  		} else if (strncmp(&cmd_buf[5], "get remote", 10) == 0) {
738a9e9b641192 Shannon Nelson      2013-09-28  1459  			u16 llen, rlen;
3753cb240b13c2 Neerav Parikh       2013-11-26  1460  			int ret;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1461  			u8 *buff;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1462  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1463  			buff = kzalloc(I40E_LLDPDU_SIZE, GFP_KERNEL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1464  			if (!buff)
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1465  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1466  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1467  			ret = i40e_aq_get_lldp_mib(&pf->hw,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1468  					I40E_AQ_LLDP_BRIDGE_TYPE_NEAREST_BRIDGE,
c27936e7b2d57a Neerav Parikh       2014-06-03  1469  					I40E_AQ_LLDP_MIB_REMOTE,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1470  					buff, I40E_LLDPDU_SIZE,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1471  					&llen, &rlen, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1472  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1473  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1474  					 "Get LLDP MIB (remote) AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1475  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1476  				kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1477  				buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1478  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1479  			}
3753cb240b13c2 Neerav Parikh       2013-11-26  1480  			dev_info(&pf->pdev->dev, "LLDP MIB (remote)\n");
3753cb240b13c2 Neerav Parikh       2013-11-26  1481  			print_hex_dump(KERN_INFO, "LLDP MIB (remote): ",
3753cb240b13c2 Neerav Parikh       2013-11-26  1482  				       DUMP_PREFIX_OFFSET, 16, 1,
3753cb240b13c2 Neerav Parikh       2013-11-26  1483  				       buff, I40E_LLDPDU_SIZE, true);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1484  			kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1485  			buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1486  		} else if (strncmp(&cmd_buf[5], "event on", 8) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1487  			int ret;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1488  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1489  			ret = i40e_aq_cfg_lldp_mib_change_event(&pf->hw,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1490  								true, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1491  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1492  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1493  					 "Config LLDP MIB Change Event (on) AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1494  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1495  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1496  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1497  		} else if (strncmp(&cmd_buf[5], "event off", 9) == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1498  			int ret;
6995b36c0fc3dd Jesse Brandeburg    2015-08-28  1499  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1500  			ret = i40e_aq_cfg_lldp_mib_change_event(&pf->hw,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1501  								false, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1502  			if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1503  				dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1504  					 "Config LLDP MIB Change Event (off) AQ command failed =0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1505  					 pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1506  				goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1507  			}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1508  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1509  	} else if (strncmp(cmd_buf, "nvm read", 8) == 0) {
3753cb240b13c2 Neerav Parikh       2013-11-26  1510  		u16 buffer_len, bytes;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1511  		u16 module;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1512  		u32 offset;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1513  		u16 *buff;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1514  		int ret;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1515  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1516  		cnt = sscanf(&cmd_buf[8], "%hx %x %hx",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1517  			     &module, &offset, &buffer_len);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1518  		if (cnt == 0) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1519  			module = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1520  			offset = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1521  			buffer_len = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1522  		} else if (cnt == 1) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1523  			offset = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1524  			buffer_len = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1525  		} else if (cnt == 2) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1526  			buffer_len = 0;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1527  		} else if (cnt > 3) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1528  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1529  				 "nvm read: bad command string, cnt=%d\n", cnt);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1530  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1531  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1532  
520dfd8b09dc9f Jesse Brandeburg    2013-09-28  1533  		/* set the max length */
520dfd8b09dc9f Jesse Brandeburg    2013-09-28  1534  		buffer_len = min_t(u16, buffer_len, I40E_MAX_AQ_BUF_SIZE/2);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1535  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1536  		bytes = 2 * buffer_len;
520dfd8b09dc9f Jesse Brandeburg    2013-09-28  1537  
520dfd8b09dc9f Jesse Brandeburg    2013-09-28  1538  		/* read at least 1k bytes, no more than 4kB */
520dfd8b09dc9f Jesse Brandeburg    2013-09-28  1539  		bytes = clamp(bytes, (u16)1024, (u16)I40E_MAX_AQ_BUF_SIZE);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1540  		buff = kzalloc(bytes, GFP_KERNEL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1541  		if (!buff)
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1542  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1543  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1544  		ret = i40e_acquire_nvm(&pf->hw, I40E_RESOURCE_READ);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1545  		if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1546  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1547  				 "Failed Acquiring NVM resource for read err=%d status=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1548  				 ret, pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1549  			kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1550  			goto command_write_done;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1551  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1552  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1553  		ret = i40e_aq_read_nvm(&pf->hw, module, (2 * offset),
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1554  				       bytes, (u8 *)buff, true, NULL);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1555  		i40e_release_nvm(&pf->hw);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1556  		if (ret) {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1557  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1558  				 "Read NVM AQ failed err=%d status=0x%x\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1559  				 ret, pf->hw.aq.asq_last_status);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1560  		} else {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1561  			dev_info(&pf->pdev->dev,
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1562  				 "Read NVM module=0x%x offset=0x%x words=%d\n",
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1563  				 module, offset, buffer_len);
a45e88c9db90c8 Anjali Singhai Jain 2013-11-28  1564  			if (bytes)
3753cb240b13c2 Neerav Parikh       2013-11-26  1565  				print_hex_dump(KERN_INFO, "NVM Dump: ",
3753cb240b13c2 Neerav Parikh       2013-11-26  1566  					DUMP_PREFIX_OFFSET, 16, 2,
a45e88c9db90c8 Anjali Singhai Jain 2013-11-28  1567  					buff, bytes, true);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1568  		}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1569  		kfree(buff);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1570  		buff = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1571  	} else {
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1572  		dev_info(&pf->pdev->dev, "unknown command '%s'\n", cmd_buf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1573  		dev_info(&pf->pdev->dev, "available commands\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1574  		dev_info(&pf->pdev->dev, "  add vsi [relay_seid]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1575  		dev_info(&pf->pdev->dev, "  del vsi [vsi_seid]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1576  		dev_info(&pf->pdev->dev, "  add relay <uplink_seid> <vsi_seid>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1577  		dev_info(&pf->pdev->dev, "  del relay <relay_seid>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1578  		dev_info(&pf->pdev->dev, "  add pvid <vsi_seid> <vid>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1579  		dev_info(&pf->pdev->dev, "  del pvid <vsi_seid>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1580  		dev_info(&pf->pdev->dev, "  dump switch\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1581  		dev_info(&pf->pdev->dev, "  dump vsi [seid]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1582  		dev_info(&pf->pdev->dev, "  dump desc tx <vsi_seid> <ring_id> [<desc_n>]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1583  		dev_info(&pf->pdev->dev, "  dump desc rx <vsi_seid> <ring_id> [<desc_n>]\n");
44ea803e2fa7e1 Ciara Loftus        2020-06-23  1584  		dev_info(&pf->pdev->dev, "  dump desc xdp <vsi_seid> <ring_id> [<desc_n>]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1585  		dev_info(&pf->pdev->dev, "  dump desc aq\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1586  		dev_info(&pf->pdev->dev, "  dump reset stats\n");
3169c323cf9dc3 Jesse Brandeburg    2015-04-07  1587  		dev_info(&pf->pdev->dev, "  dump debug fwdata <cluster_id> <table_id> <index>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1588  		dev_info(&pf->pdev->dev, "  read <reg>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1589  		dev_info(&pf->pdev->dev, "  write <reg> <value>\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1590  		dev_info(&pf->pdev->dev, "  clear_stats vsi [seid]\n");
694dc1cb0d32b0 Shannon Nelson      2015-01-24  1591  		dev_info(&pf->pdev->dev, "  clear_stats port\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1592  		dev_info(&pf->pdev->dev, "  pfr\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1593  		dev_info(&pf->pdev->dev, "  corer\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1594  		dev_info(&pf->pdev->dev, "  globr\n");
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1595  		dev_info(&pf->pdev->dev, "  send aq_cmd <flags> <opcode> <datalen> <retval> <cookie_h> <cookie_l> <param0> <param1> <param2> <param3>\n");
f1143c4b0f602c Anjali Singhai Jain 2013-11-28  1596  		dev_info(&pf->pdev->dev, "  send indirect aq_cmd <flags> <opcode> <datalen> <retval> <cookie_h> <cookie_l> <param0> <param1> <param2> <param3> <buffer_len>\n");
e17ff05c5d9ee6 Anjali Singhai Jain 2014-06-04  1597  		dev_info(&pf->pdev->dev, "  fd current cnt");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1598  		dev_info(&pf->pdev->dev, "  lldp start\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1599  		dev_info(&pf->pdev->dev, "  lldp stop\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1600  		dev_info(&pf->pdev->dev, "  lldp get local\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1601  		dev_info(&pf->pdev->dev, "  lldp get remote\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1602  		dev_info(&pf->pdev->dev, "  lldp event on\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1603  		dev_info(&pf->pdev->dev, "  lldp event off\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1604  		dev_info(&pf->pdev->dev, "  nvm read [module] [word_offset] [word_count]\n");
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1605  	}
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1606  
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1607  command_write_done:
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1608  	kfree(cmd_buf);
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1609  	cmd_buf = NULL;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1610  	return count;
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1611  }
02e9c290814cc1 Jesse Brandeburg    2013-09-11  1612  

:::::: The code at line 749 was first introduced by commit
:::::: 02e9c290814cc143ceccecb14eac3e7a05da745e i40e: debugfs interface

:::::: TO: Jesse Brandeburg <jesse.brandeburg@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
