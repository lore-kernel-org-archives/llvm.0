Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7A3B4E9D;
	Sat,  8 Aug 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219935; cv=none; b=CxvDplJjgY9418/tz8/IM9C61usONJ8cCdhgZhO1/MxRayrdxnBpJ9cgW7BBLXqvMPgF/YPaO/uRnv9bOm3bwZV2D68Ha32wPVAGYKgw4fMfWUsGzJH9muKYUJm91la7kzEaZQ8ZG8rY830GQiv96y/1e0Szj9ZmmUp/8XdmDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219935; c=relaxed/simple;
	bh=qIAXlSVCbIrkqXx8dbbyDUXLNIHutGGxgXtCWCqafkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jt7gCkyk0g8rY+GhUq1cod0y+gQMK0eaYnc1tOWjwzXptOG7Zpl9wOtutYCs6hC57BpUISVMQ9iUJOffUQMqtgM04XKLgkRDkgp1RcWEYpvxgZULM0C3goR5qNTKvKfXpPin4KTT77ydMGp8NWw6GmWVCzCTm1tnIwJrM9mRgYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gz57Sr3w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gz57Sr3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786219929; x=1817755929;
  h=date:from:to:cc:subject:message-id;
  bh=qIAXlSVCbIrkqXx8dbbyDUXLNIHutGGxgXtCWCqafkE=;
  b=Gz57Sr3whNohwxXisUHtL7SREMb+ONyCx5mq0KdqCscc4VAoU2afMBuI
   y/GoyZaxvXsob6qPU7B4+fO5ZPMZHc87kFd3QHj3CmlLU1XMpl/6BkF11
   MnELLZsTwIlkH4PPV34VxcFRGVcz2z0sqFlLCVSEMO8LJUtftnVU8lAw4
   RbRnqUMOi/pQWpdxqtuNAa1z4UtI94jmygFsDCqZSIL4GD5n5EacWu9DI
   bs2ivathp7i7B/ZmXGCrpq0PwUKMGZSOyS16qU4HXVXCHR0AwYzamzEFk
   Rp9enWYFnnWcpfXYjMvJci8U7mwuyGlNGPfzTnaqv4cQM1E++gt98Eygw
   w==;
X-CSE-ConnectionGUID: rCh/lz7qTVa2XocEGF4alQ==
X-CSE-MsgGUID: H4b7ExmLQ8yMTeaf+HATyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86646538"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86646538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 13:12:04 -0700
X-CSE-ConnectionGUID: Za/Zmm3rSFG0ILthvx323Q==
X-CSE-MsgGUID: DcugJfA6R0mEDduo+Q1d3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="266531828"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2026 13:12:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsnOi-00000000Kjd-0neJ;
	Sat, 08 Aug 2026 20:12:00 +0000
Date: Sun, 09 Aug 2026 04:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 7751/13846]
 drivers/scsi/ibmvscsi/ibmvfc-core.c:6134:15: warning: variable 'rport' is
 uninitialized when used here
Message-ID: <202608090302.BHg1qKEA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 696d1cc2aaa2d7041b64ea714a7460e2d365235c [7751/13846] scsi: ibmvfc: process NVMe/FC rports in work thread
config: powerpc-ppc64_defconfig (https://download.01.org/0day-ci/archive/20260809/202608090302.BHg1qKEA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608090302.BHg1qKEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090302.BHg1qKEA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ibmvscsi/ibmvfc-core.c:6134:15: warning: variable 'rport' is uninitialized when used here [-Wuninitialized]
    6134 |                         } else if (rport && tgt->action == IBMVFC_TGT_ACTION_DEL_AND_LOGOUT_RPORT) {
         |                                    ^~~~~
   drivers/scsi/ibmvscsi/ibmvfc-core.c:5967:24: note: initialize the variable 'rport' to silence this warning
    5967 |         struct fc_rport *rport;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +/rport +6134 drivers/scsi/ibmvscsi/ibmvfc-core.c

  5957	
  5958	/**
  5959	 * ibmvfc_do_work - Do task level work
  5960	 * @vhost:		ibmvfc host struct
  5961	 *
  5962	 **/
  5963	static void ibmvfc_do_work(struct ibmvfc_host *vhost)
  5964	{
  5965		struct ibmvfc_target *tgt;
  5966		unsigned long flags;
  5967		struct fc_rport *rport;
  5968		struct nvme_fc_remote_port *nvme_rport;
  5969		LIST_HEAD(purge);
  5970		int rc;
  5971	
  5972		ibmvfc_log_ae(vhost, vhost->events_to_log);
  5973		spin_lock_irqsave(vhost->host->host_lock, flags);
  5974		vhost->events_to_log = 0;
  5975		switch (vhost->action) {
  5976		case IBMVFC_HOST_ACTION_NONE:
  5977		case IBMVFC_HOST_ACTION_LOGO_WAIT:
  5978		case IBMVFC_HOST_ACTION_INIT_WAIT:
  5979			break;
  5980		case IBMVFC_HOST_ACTION_RESET:
  5981			list_splice_init(&vhost->purge, &purge);
  5982			spin_unlock_irqrestore(vhost->host->host_lock, flags);
  5983			ibmvfc_complete_purge(&purge);
  5984			ibmvfc_nvme_unregister(vhost);
  5985			rc = ibmvfc_reset_crq(vhost);
  5986	
  5987			spin_lock_irqsave(vhost->host->host_lock, flags);
  5988			if (!rc || rc == H_CLOSED)
  5989				vio_enable_interrupts(to_vio_dev(vhost->dev));
  5990			if (vhost->action == IBMVFC_HOST_ACTION_RESET) {
  5991				/*
  5992				 * The only action we could have changed to would have
  5993				 * been reenable, in which case, we skip the rest of
  5994				 * this path and wait until we've done the re-enable
  5995				 * before sending the crq init.
  5996				 */
  5997				vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
  5998	
  5999				if (rc || (rc = ibmvfc_send_crq_init(vhost)) ||
  6000				    (rc = vio_enable_interrupts(to_vio_dev(vhost->dev)))) {
  6001					ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
  6002					dev_err(vhost->dev, "Error after reset (rc=%d)\n", rc);
  6003				}
  6004			}
  6005			break;
  6006		case IBMVFC_HOST_ACTION_REENABLE:
  6007			list_splice_init(&vhost->purge, &purge);
  6008			spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6009			ibmvfc_complete_purge(&purge);
  6010			rc = ibmvfc_reenable_crq_queue(vhost);
  6011	
  6012			spin_lock_irqsave(vhost->host->host_lock, flags);
  6013			if (vhost->action == IBMVFC_HOST_ACTION_REENABLE) {
  6014				/*
  6015				 * The only action we could have changed to would have
  6016				 * been reset, in which case, we skip the rest of this
  6017				 * path and wait until we've done the reset before
  6018				 * sending the crq init.
  6019				 */
  6020				vhost->action = IBMVFC_HOST_ACTION_TGT_DEL;
  6021				if (rc || (rc = ibmvfc_send_crq_init(vhost))) {
  6022					ibmvfc_link_down(vhost, IBMVFC_LINK_DEAD);
  6023					dev_err(vhost->dev, "Error after enable (rc=%d)\n", rc);
  6024				}
  6025			}
  6026			break;
  6027		case IBMVFC_HOST_ACTION_LOGO:
  6028			vhost->job_step(vhost);
  6029			break;
  6030		case IBMVFC_HOST_ACTION_INIT:
  6031			BUG_ON(vhost->state != IBMVFC_INITIALIZING);
  6032			if (vhost->delay_init) {
  6033				vhost->delay_init = 0;
  6034				spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6035				ssleep(15);
  6036				return;
  6037			} else
  6038				vhost->job_step(vhost);
  6039			break;
  6040		case IBMVFC_HOST_ACTION_QUERY:
  6041			list_for_each_entry(tgt, &vhost->scsi_scrqs.targets, queue)
  6042				ibmvfc_init_tgt(tgt, ibmvfc_tgt_query_target);
  6043			list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue)
  6044				ibmvfc_init_tgt(tgt, ibmvfc_tgt_query_target);
  6045			ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY_TGTS);
  6046			break;
  6047		case IBMVFC_HOST_ACTION_QUERY_TGTS:
  6048			list_for_each_entry(tgt, &vhost->scsi_scrqs.targets, queue) {
  6049				if (tgt->action == IBMVFC_TGT_ACTION_INIT) {
  6050					tgt->job_step(tgt);
  6051					break;
  6052				}
  6053			}
  6054			list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue) {
  6055				if (tgt->action == IBMVFC_TGT_ACTION_INIT) {
  6056					tgt->job_step(tgt);
  6057					break;
  6058				}
  6059			}
  6060	
  6061			if (!ibmvfc_dev_init_to_do(vhost))
  6062				ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_TGT_DEL);
  6063			break;
  6064		case IBMVFC_HOST_ACTION_TGT_DEL:
  6065		case IBMVFC_HOST_ACTION_TGT_DEL_FAILED:
  6066			list_for_each_entry(tgt, &vhost->scsi_scrqs.targets, queue) {
  6067				if (tgt->action == IBMVFC_TGT_ACTION_LOGOUT_RPORT) {
  6068					tgt->job_step(tgt);
  6069					break;
  6070				}
  6071			}
  6072			list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue) {
  6073				if (tgt->action == IBMVFC_TGT_ACTION_LOGOUT_RPORT) {
  6074					tgt->job_step(tgt);
  6075					break;
  6076				}
  6077			}
  6078	
  6079			if (ibmvfc_dev_logo_to_do(vhost)) {
  6080				spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6081				return;
  6082			}
  6083	
  6084			list_for_each_entry(tgt, &vhost->scsi_scrqs.targets, queue) {
  6085				if (tgt->action == IBMVFC_TGT_ACTION_DEL_RPORT) {
  6086					tgt_dbg(tgt, "Deleting rport\n");
  6087					rport = tgt->rport;
  6088					tgt->rport = NULL;
  6089					list_del(&tgt->queue);
  6090					ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_DELETED_RPORT);
  6091					spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6092					if (rport)
  6093						fc_remote_port_delete(rport);
  6094					timer_delete_sync(&tgt->timer);
  6095					kref_put(&tgt->kref, ibmvfc_release_tgt);
  6096					return;
  6097				} else if (tgt->action == IBMVFC_TGT_ACTION_DEL_AND_LOGOUT_RPORT) {
  6098					tgt_dbg(tgt, "Deleting rport with I/O outstanding\n");
  6099					rport = tgt->rport;
  6100					tgt->rport = NULL;
  6101					tgt->init_retries = 0;
  6102					ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_LOGOUT_DELETED_RPORT);
  6103	
  6104					/*
  6105					 * If fast fail is enabled, we wait for it to fire and then clean up
  6106					 * the old port, since we expect the fast fail timer to clean up the
  6107					 * outstanding I/O faster than waiting for normal command timeouts.
  6108					 * However, if fast fail is disabled, any I/O outstanding to the
  6109					 * rport LUNs will stay outstanding indefinitely, since the EH handlers
  6110					 * won't get invoked for I/O's timing out. If this is a NPIV failover
  6111					 * scenario, the better alternative is to use the move login.
  6112					 */
  6113					if (rport && rport->fast_io_fail_tmo == -1)
  6114						tgt->move_login = 1;
  6115					spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6116					if (rport)
  6117						fc_remote_port_delete(rport);
  6118					return;
  6119				}
  6120			}
  6121	
  6122			list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue) {
  6123				if (tgt->action == IBMVFC_TGT_ACTION_DEL_RPORT) {
  6124					tgt_dbg(tgt, "Deleteing NVMe rport\n");
  6125					nvme_rport = tgt->nvme_remote_port;
  6126					list_del(&tgt->queue);
  6127					ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_DELETED_RPORT);
  6128					spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6129					if (nvme_rport)
  6130						ibmvfc_nvme_unregister_remoteport(tgt);
  6131					timer_delete_sync(&tgt->timer);
  6132					kref_put(&tgt->kref, ibmvfc_release_tgt);
  6133					return;
> 6134				} else if (rport && tgt->action == IBMVFC_TGT_ACTION_DEL_AND_LOGOUT_RPORT) {
  6135					tgt_dbg(tgt, "Deleting NVMe rport with outstanding I/O\n");
  6136					nvme_rport = tgt->nvme_remote_port;
  6137					ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_LOGOUT_DELETED_RPORT);
  6138					tgt->init_retries = 0;
  6139					spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6140					if (nvme_rport)
  6141						ibmvfc_nvme_unregister_remoteport(tgt);
  6142					return;
  6143				}
  6144			}
  6145	
  6146			if (vhost->state == IBMVFC_INITIALIZING) {
  6147				if (vhost->action == IBMVFC_HOST_ACTION_TGT_DEL_FAILED) {
  6148					if (vhost->reinit) {
  6149						vhost->reinit = 0;
  6150						scsi_block_requests(vhost->host);
  6151						ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_QUERY);
  6152						spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6153					} else {
  6154						ibmvfc_set_host_state(vhost, IBMVFC_ACTIVE);
  6155						ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_NONE);
  6156						wake_up(&vhost->init_wait_q);
  6157						schedule_work(&vhost->rport_add_work_q);
  6158						vhost->init_retries = 0;
  6159						spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6160						scsi_unblock_requests(vhost->host);
  6161					}
  6162	
  6163					return;
  6164				} else {
  6165					ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT);
  6166					vhost->job_step = ibmvfc_discover_targets;
  6167				}
  6168			} else {
  6169				ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_NONE);
  6170				spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6171				scsi_unblock_requests(vhost->host);
  6172				wake_up(&vhost->init_wait_q);
  6173				return;
  6174			}
  6175			break;
  6176		case IBMVFC_HOST_ACTION_ALLOC_TGTS:
  6177			ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_TGT_INIT);
  6178			spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6179			ibmvfc_alloc_targets(vhost);
  6180			spin_lock_irqsave(vhost->host->host_lock, flags);
  6181			break;
  6182		case IBMVFC_HOST_ACTION_TGT_INIT:
  6183			list_for_each_entry(tgt, &vhost->scsi_scrqs.targets, queue) {
  6184				if (tgt->action == IBMVFC_TGT_ACTION_INIT) {
  6185					tgt->job_step(tgt);
  6186					break;
  6187				}
  6188			}
  6189			list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue) {
  6190				if (tgt->action == IBMVFC_TGT_ACTION_INIT) {
  6191					tgt->job_step(tgt);
  6192					break;
  6193				}
  6194			}
  6195	
  6196			if (!ibmvfc_dev_init_to_do(vhost))
  6197				ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_TGT_DEL_FAILED);
  6198			break;
  6199		default:
  6200			break;
  6201		}
  6202	
  6203		spin_unlock_irqrestore(vhost->host->host_lock, flags);
  6204	}
  6205	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
