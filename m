Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B447B
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656524768; x=1688060768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9HK4ylooK7Tf08M3sTXhqwwWVQ3meqXzDez1Ryq2rc=;
  b=gwXz9B0ToE+Hv+rEh+tlIgeT4zrDxh7XePjasfQHxX/vakxWWPp0id8L
   ETpkXiq82WiCU7wNeJ8XpRuKb5hsRz9QgIBYJ/GnkeGuevEBLa3TeGBPz
   zIqfMqxIrVk1aBDCVZfxq0QBvua02+ixrOSMb6vKulRdg6g+eLjJd9rnP
   CXfIEjg0EpNVlBzuu2SYovgijnSt1SzYU5aS3SgjHb1MnFG9OFh3qiKKc
   V1XVrOtRbRs1VeAmRqnN/FeFKszF5OES+60XbNeWxog4K+CppmpuxhVv3
   jxEluQW+avUvrtwkjiQk5UTciW3ZGWAT7ioEBwKIkmiTI9QR2J0mEsVuN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282836266"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="282836266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 10:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="595331945"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2022 10:46:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6blN-000BNo-F0;
	Wed, 29 Jun 2022 17:46:05 +0000
Date: Thu, 30 Jun 2022 01:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Adamson <alan.adamson@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-5.19 5/5] drivers/nvme/target/core.c:1379:11:
 error: no member named 'clear_ids' in 'struct nvmet_subsys'
Message-ID: <202206300158.HnaC96OB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-5.19
head:   74138c25fae3f1989bef321bfffa324b1cb19dbc
commit: 74138c25fae3f1989bef321bfffa324b1cb19dbc [5/5] nvmet: add a clear_ids attribute for passthru targets
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220630/202206300158.HnaC96OB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-5.19
        git checkout 74138c25fae3f1989bef321bfffa324b1cb19dbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/target/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/nvme/target/core.c:1379:11: error: no member named 'clear_ids' in 'struct nvmet_subsys'
                   subsys->clear_ids = 1;
                   ~~~~~~  ^
   1 error generated.


vim +1379 drivers/nvme/target/core.c

  1337	
  1338	u16 nvmet_alloc_ctrl(const char *subsysnqn, const char *hostnqn,
  1339			struct nvmet_req *req, u32 kato, struct nvmet_ctrl **ctrlp)
  1340	{
  1341		struct nvmet_subsys *subsys;
  1342		struct nvmet_ctrl *ctrl;
  1343		int ret;
  1344		u16 status;
  1345	
  1346		status = NVME_SC_CONNECT_INVALID_PARAM | NVME_SC_DNR;
  1347		subsys = nvmet_find_get_subsys(req->port, subsysnqn);
  1348		if (!subsys) {
  1349			pr_warn("connect request for invalid subsystem %s!\n",
  1350				subsysnqn);
  1351			req->cqe->result.u32 = IPO_IATTR_CONNECT_DATA(subsysnqn);
  1352			req->error_loc = offsetof(struct nvme_common_command, dptr);
  1353			goto out;
  1354		}
  1355	
  1356		down_read(&nvmet_config_sem);
  1357		if (!nvmet_host_allowed(subsys, hostnqn)) {
  1358			pr_info("connect by host %s for subsystem %s not allowed\n",
  1359				hostnqn, subsysnqn);
  1360			req->cqe->result.u32 = IPO_IATTR_CONNECT_DATA(hostnqn);
  1361			up_read(&nvmet_config_sem);
  1362			status = NVME_SC_CONNECT_INVALID_HOST | NVME_SC_DNR;
  1363			req->error_loc = offsetof(struct nvme_common_command, dptr);
  1364			goto out_put_subsystem;
  1365		}
  1366		up_read(&nvmet_config_sem);
  1367	
  1368		status = NVME_SC_INTERNAL;
  1369		ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
  1370		if (!ctrl)
  1371			goto out_put_subsystem;
  1372		mutex_init(&ctrl->lock);
  1373	
  1374		ctrl->port = req->port;
  1375		ctrl->ops = req->ops;
  1376	
  1377		/* By default, set loop targets to clear IDS by default */
  1378		if (ctrl->port->disc_addr.trtype == NVMF_TRTYPE_LOOP)
> 1379			subsys->clear_ids = 1;
  1380	
  1381		INIT_WORK(&ctrl->async_event_work, nvmet_async_event_work);
  1382		INIT_LIST_HEAD(&ctrl->async_events);
  1383		INIT_RADIX_TREE(&ctrl->p2p_ns_map, GFP_KERNEL);
  1384		INIT_WORK(&ctrl->fatal_err_work, nvmet_fatal_error_handler);
  1385		INIT_DELAYED_WORK(&ctrl->ka_work, nvmet_keep_alive_timer);
  1386	
  1387		memcpy(ctrl->subsysnqn, subsysnqn, NVMF_NQN_SIZE);
  1388		memcpy(ctrl->hostnqn, hostnqn, NVMF_NQN_SIZE);
  1389	
  1390		kref_init(&ctrl->ref);
  1391		ctrl->subsys = subsys;
  1392		nvmet_init_cap(ctrl);
  1393		WRITE_ONCE(ctrl->aen_enabled, NVMET_AEN_CFG_OPTIONAL);
  1394	
  1395		ctrl->changed_ns_list = kmalloc_array(NVME_MAX_CHANGED_NAMESPACES,
  1396				sizeof(__le32), GFP_KERNEL);
  1397		if (!ctrl->changed_ns_list)
  1398			goto out_free_ctrl;
  1399	
  1400		ctrl->sqs = kcalloc(subsys->max_qid + 1,
  1401				sizeof(struct nvmet_sq *),
  1402				GFP_KERNEL);
  1403		if (!ctrl->sqs)
  1404			goto out_free_changed_ns_list;
  1405	
  1406		if (subsys->cntlid_min > subsys->cntlid_max)
  1407			goto out_free_sqs;
  1408	
  1409		ret = ida_alloc_range(&cntlid_ida,
  1410				     subsys->cntlid_min, subsys->cntlid_max,
  1411				     GFP_KERNEL);
  1412		if (ret < 0) {
  1413			status = NVME_SC_CONNECT_CTRL_BUSY | NVME_SC_DNR;
  1414			goto out_free_sqs;
  1415		}
  1416		ctrl->cntlid = ret;
  1417	
  1418		/*
  1419		 * Discovery controllers may use some arbitrary high value
  1420		 * in order to cleanup stale discovery sessions
  1421		 */
  1422		if (nvmet_is_disc_subsys(ctrl->subsys) && !kato)
  1423			kato = NVMET_DISC_KATO_MS;
  1424	
  1425		/* keep-alive timeout in seconds */
  1426		ctrl->kato = DIV_ROUND_UP(kato, 1000);
  1427	
  1428		ctrl->err_counter = 0;
  1429		spin_lock_init(&ctrl->error_lock);
  1430	
  1431		nvmet_start_keep_alive_timer(ctrl);
  1432	
  1433		mutex_lock(&subsys->lock);
  1434		list_add_tail(&ctrl->subsys_entry, &subsys->ctrls);
  1435		nvmet_setup_p2p_ns_map(ctrl, req);
  1436		mutex_unlock(&subsys->lock);
  1437	
  1438		*ctrlp = ctrl;
  1439		return 0;
  1440	
  1441	out_free_sqs:
  1442		kfree(ctrl->sqs);
  1443	out_free_changed_ns_list:
  1444		kfree(ctrl->changed_ns_list);
  1445	out_free_ctrl:
  1446		kfree(ctrl);
  1447	out_put_subsystem:
  1448		nvmet_subsys_put(subsys);
  1449	out:
  1450		return status;
  1451	}
  1452	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
