Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231C1805E;
	Wed, 31 Jul 2024 03:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722398298; cv=none; b=T8r/Nlx7ElB1BM6gY/hm4sXqxisO9dycIqKNRYeFANB3GrCCmKtbwT4VBy3BoMrD37u/UF58OXcbev+wvIZ830dVGt7v3Wv0V7yBCYaSRBNu37uzDcF4Po1w4x90xGeynruCs+BJC9nAiJqMDCwRk6qUjd+k/MpMgd8/9P5gNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722398298; c=relaxed/simple;
	bh=LEhaWCJvLtZ73LaVhSfR1ZVv5BLP3SoBV3qy5RfJm28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4fvlyj9QzfCs2x+pC2pPDM/XjasJyOubvB7VPNsXdKneDEkyEgw8l5/Em4Bf2HGXOU+B6QA1jnL1wuwpx2SA4n4GQX2K0hAxHnI5i4oRVHdOhk85MVNNCQXUFXbRcnXmeD3GBM2CzJ2/0Lo4LKTbI2zIv6dcMj3U/lcUE04Jdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3WS8hoI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3WS8hoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722398297; x=1753934297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEhaWCJvLtZ73LaVhSfR1ZVv5BLP3SoBV3qy5RfJm28=;
  b=K3WS8hoIO0KbIYgUpsMOo3ZycB82UeCu8+ai6Z0wjuKdtyqdrdD51G31
   u2raYtRpYN9AWh51yv2BgGWxA1aXlbe/t59MK7GzcjTAGJ1nVVSK52fTK
   0U4d3mJXJRJPA5yH3Uu3aK3in4Js3w/Rc+Qmq13fXPLGyQBcTCnOuxrAV
   2Z+0e2dnJkZRBDqSxHwu2Lt2DHveu4WtqE99ozwGwCEftcbZ0k0GgwGBa
   aDY0SpS8evB287jDoLKyXjW32ygsAgEQSGfRKo+7TcfE9LRsnjQ6dWFhW
   2FM9Ab2pNcfiLUqiydyX3Se36QjInrb2N5XUYhG2euFnAveMMmmnWOC08
   A==;
X-CSE-ConnectionGUID: 2lYUaTJhRY+p5xhYs8Nqzw==
X-CSE-MsgGUID: KBJyyQMWSOugwfjTJmKb1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31404935"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="31404935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 20:58:15 -0700
X-CSE-ConnectionGUID: oAhEydHWSMebjjFzoVQe0w==
X-CSE-MsgGUID: Z4+zund4S/2vL67cb110xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="85187596"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2024 20:58:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ0Ta-000tiw-2L;
	Wed, 31 Jul 2024 03:58:10 +0000
Date: Wed, 31 Jul 2024 11:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:fix_dbc_halted_ep 1/1]
 drivers/usb/host/xhci-dbgcap.c:854:47: warning: variable 'ctrl' is
 uninitialized when used here
Message-ID: <202407311141.IdcYh2WX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_halted_ep
head:   8532b621314e93336535528d5d45e41974c75e01
commit: 8532b621314e93336535528d5d45e41974c75e01 [1/1] xhci: dbc: Fix handling halted endpoints
config: i386-buildonly-randconfig-005-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311141.IdcYh2WX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311141.IdcYh2WX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311141.IdcYh2WX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-dbgcap.c:854:47: warning: variable 'ctrl' is uninitialized when used here [-Wuninitialized]
     854 |                 handle_ep_halt_changes(dbc, get_in_ep(dbc), ctrl & DBC_CTRL_HALT_IN_TR);
         |                                                             ^~~~
   drivers/usb/host/xhci-dbgcap.c:803:12: note: initialize the variable 'ctrl' to silence this warning
     803 |         u32                     ctrl, portsc;
         |                                     ^
         |                                      = 0
   1 warning generated.


vim +/ctrl +854 drivers/usb/host/xhci-dbgcap.c

   798	
   799	static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
   800	{
   801		dma_addr_t		deq;
   802		union xhci_trb		*evt;
   803		u32			ctrl, portsc;
   804		bool			update_erdp = false;
   805	
   806		/* DbC state machine: */
   807		switch (dbc->state) {
   808		case DS_DISABLED:
   809		case DS_INITIALIZED:
   810	
   811			return EVT_ERR;
   812		case DS_ENABLED:
   813			portsc = readl(&dbc->regs->portsc);
   814			if (portsc & DBC_PORTSC_CONN_STATUS) {
   815				dbc->state = DS_CONNECTED;
   816				dev_info(dbc->dev, "DbC connected\n");
   817			}
   818	
   819			return EVT_DONE;
   820		case DS_CONNECTED:
   821			ctrl = readl(&dbc->regs->control);
   822			if (ctrl & DBC_CTRL_DBC_RUN) {
   823				dbc->state = DS_CONFIGURED;
   824				dev_info(dbc->dev, "DbC configured\n");
   825				portsc = readl(&dbc->regs->portsc);
   826				writel(portsc, &dbc->regs->portsc);
   827				return EVT_GSER;
   828			}
   829	
   830			return EVT_DONE;
   831		case DS_CONFIGURED:
   832			/* Handle cable unplug event: */
   833			portsc = readl(&dbc->regs->portsc);
   834			if (!(portsc & DBC_PORTSC_PORT_ENABLED) &&
   835			    !(portsc & DBC_PORTSC_CONN_STATUS)) {
   836				dev_info(dbc->dev, "DbC cable unplugged\n");
   837				dbc->state = DS_ENABLED;
   838				xhci_dbc_flush_requests(dbc);
   839	
   840				return EVT_DISC;
   841			}
   842	
   843			/* Handle debug port reset event: */
   844			if (portsc & DBC_PORTSC_RESET_CHANGE) {
   845				dev_info(dbc->dev, "DbC port reset\n");
   846				writel(portsc, &dbc->regs->portsc);
   847				dbc->state = DS_ENABLED;
   848				xhci_dbc_flush_requests(dbc);
   849	
   850				return EVT_DISC;
   851			}
   852	
   853			/* Check and handle changes in endpoint halt status */
 > 854			handle_ep_halt_changes(dbc, get_in_ep(dbc), ctrl & DBC_CTRL_HALT_IN_TR);
   855			handle_ep_halt_changes(dbc, get_out_ep(dbc), ctrl & DBC_CTRL_HALT_OUT_TR);
   856	
   857			/* Clear DbC run change bit: */
   858			if (ctrl & DBC_CTRL_DBC_RUN_CHANGE) {
   859				writel(ctrl, &dbc->regs->control);
   860				ctrl = readl(&dbc->regs->control);
   861			}
   862			break;
   863		default:
   864			dev_err(dbc->dev, "Unknown DbC state %d\n", dbc->state);
   865			break;
   866		}
   867	
   868		/* Handle the events in the event ring: */
   869		evt = dbc->ring_evt->dequeue;
   870		while ((le32_to_cpu(evt->event_cmd.flags) & TRB_CYCLE) ==
   871				dbc->ring_evt->cycle_state) {
   872			/*
   873			 * Add a barrier between reading the cycle flag and any
   874			 * reads of the event's flags/data below:
   875			 */
   876			rmb();
   877	
   878			trace_xhci_dbc_handle_event(dbc->ring_evt, &evt->generic);
   879	
   880			switch (le32_to_cpu(evt->event_cmd.flags) & TRB_TYPE_BITMASK) {
   881			case TRB_TYPE(TRB_PORT_STATUS):
   882				dbc_handle_port_status(dbc, evt);
   883				break;
   884			case TRB_TYPE(TRB_TRANSFER):
   885				dbc_handle_xfer_event(dbc, evt);
   886				break;
   887			default:
   888				break;
   889			}
   890	
   891			inc_evt_deq(dbc->ring_evt);
   892	
   893			evt = dbc->ring_evt->dequeue;
   894			update_erdp = true;
   895		}
   896	
   897		/* Update event ring dequeue pointer: */
   898		if (update_erdp) {
   899			deq = xhci_trb_virt_to_dma(dbc->ring_evt->deq_seg,
   900						   dbc->ring_evt->dequeue);
   901			lo_hi_writeq(deq, &dbc->regs->erdp);
   902		}
   903	
   904		return EVT_DONE;
   905	}
   906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
