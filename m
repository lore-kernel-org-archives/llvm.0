Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2C6AF88;
	Wed, 20 Mar 2024 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710965487; cv=none; b=Oe2VUor6R1i1DYDvbQVuVfhxNKUv+0Gu3ca7FIflneaKXa+LcvYrC5JueJpeKXFBYctfS9J6iJW5yjECmUXEYXKtkuWSPzd/3sKPWji8sV4F4Fr0VAwZbsWuJzTkW27nyRvY/JN6YPheJAesGyfzI3Ih2ZuMBWoWkejcVY2J1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710965487; c=relaxed/simple;
	bh=pwa7U1Eqm6iQF1ZEvKGZJ8ZykOx4moiyXvldUWzIdTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VweGNh2beRSJNGvkzBjl/P3jqHxTiTMQCX28MuzVGy854UpIFYJh+HWZ5GcA+Aww9GDJzV++rUXm2FsNYF1BJ7b1xM55e5PuIo+TgHRlylew9ITnjxCnEWSQr20c22uhXov6hfgb0e9Js6Ie1nMUsR7oK1H0cmF3MvpCw8QTELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdTW6oVp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdTW6oVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710965484; x=1742501484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwa7U1Eqm6iQF1ZEvKGZJ8ZykOx4moiyXvldUWzIdTY=;
  b=VdTW6oVpAH0nip5r0meF5s1tVKm+/5UnPeAWp6plqJBVPYuZoWD2JAMx
   /64JF0qzWDrZooLAJqZVfH542KBPUVV97QWLpZoL1kvmIqpwW/dJ6fUL3
   v0EEtT4efqGYXDRHorCtKZjxPeYEwBqpE1+xIy1BkAZxZlC7W0rA0k5FA
   CwuEcHcSggqbS1dv860hfn7bgnGlPfbxUTXZRKiSUFHWsjeWTKaNoGn4K
   ksd/aWV+jShG8XacXXotoXVhzCTHPDWjl8nWRZVjPqmL3p/ZdALmd4hzH
   ief3D+EkMQIvxmJ3ZQr1xHCAJcvnjUH0DxiQyrO5/OQ/npdGxtUvjUux0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23419384"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="23419384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 13:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14288154"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2024 13:11:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn2HQ-000IuN-0Q;
	Wed, 20 Mar 2024 20:11:20 +0000
Date: Thu, 21 Mar 2024 04:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Edwards <cfsworks@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND v2 RFC 3/5] i2c: mv64xxx: Refactor FSM
Message-ID: <202403210350.eofnJoJU-lkp@intel.com>
References: <65fa759e.5d0a0220.fe5f7.1fa2@mx.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fa759e.5d0a0220.fe5f7.1fa2@mx.google.com>

Hi Sam,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.8 next-20240320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Edwards/i2c-mv64xxx-Clear-bus-errors-before-transfer/20240320-133733
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/65fa759e.5d0a0220.fe5f7.1fa2%40mx.google.com
patch subject: [RESEND v2 RFC 3/5] i2c: mv64xxx: Refactor FSM
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240321/202403210350.eofnJoJU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210350.eofnJoJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210350.eofnJoJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-mv64xxx.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-mv64xxx.c:440:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     440 |         }
         |         ^
   2 warnings generated.


vim +440 drivers/i2c/busses/i2c-mv64xxx.c

1873c8bc09771f Sam Edwards    2024-03-19  306  
^1da177e4c3f41 Linus Torvalds 2005-04-16  307  static void
^1da177e4c3f41 Linus Torvalds 2005-04-16  308  mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
^1da177e4c3f41 Linus Torvalds 2005-04-16  309  {
1873c8bc09771f Sam Edwards    2024-03-19  310  	enum mv64xxx_i2c_event event;
1873c8bc09771f Sam Edwards    2024-03-19  311  	enum mv64xxx_i2c_state prev_state = drv_data->state;
1873c8bc09771f Sam Edwards    2024-03-19  312  
1873c8bc09771f Sam Edwards    2024-03-19  313  	drv_data->action = MV64XXX_I2C_ACTION_INVALID;
1873c8bc09771f Sam Edwards    2024-03-19  314  
^1da177e4c3f41 Linus Torvalds 2005-04-16  315  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  316  	 * If state is idle, then this is likely the remnants of an old
^1da177e4c3f41 Linus Torvalds 2005-04-16  317  	 * operation that driver has given up on or the user has killed.
^1da177e4c3f41 Linus Torvalds 2005-04-16  318  	 * If so, issue the stop condition and go to idle.
^1da177e4c3f41 Linus Torvalds 2005-04-16  319  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  320  	if (drv_data->state == MV64XXX_I2C_STATE_IDLE) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  321  		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  322  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  323  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  324  
1873c8bc09771f Sam Edwards    2024-03-19  325  	/*
1873c8bc09771f Sam Edwards    2024-03-19  326  	 * The FSM is broken into 3 parts:
1873c8bc09771f Sam Edwards    2024-03-19  327  	 * 1) Decode `status` to determine the underlying hardware event
1873c8bc09771f Sam Edwards    2024-03-19  328  	 * 2) Handle hardware event driven state transitions
1873c8bc09771f Sam Edwards    2024-03-19  329  	 * 3) Perform internal state transitions and action emission
1873c8bc09771f Sam Edwards    2024-03-19  330  	 */
1873c8bc09771f Sam Edwards    2024-03-19  331  	event = mv64xxx_i2c_decode_status(drv_data, status);
1873c8bc09771f Sam Edwards    2024-03-19  332  
1873c8bc09771f Sam Edwards    2024-03-19  333  	/* Handle event; determine state transition */
1873c8bc09771f Sam Edwards    2024-03-19  334  	switch (event) {
1873c8bc09771f Sam Edwards    2024-03-19  335  	case MV64XXX_I2C_EVENT_STARTED:
1873c8bc09771f Sam Edwards    2024-03-19  336  		drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  337  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  338  
1873c8bc09771f Sam Edwards    2024-03-19  339  	case MV64XXX_I2C_EVENT_ADDR_ACK:
1873c8bc09771f Sam Edwards    2024-03-19  340  		if ((drv_data->state == MV64XXX_I2C_STATE_SEND_ADDR_1)
1873c8bc09771f Sam Edwards    2024-03-19  341  		    && (drv_data->msg->flags & I2C_M_TEN))
1873c8bc09771f Sam Edwards    2024-03-19  342  			drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_2;
1873c8bc09771f Sam Edwards    2024-03-19  343  		else if (drv_data->msg->flags & I2C_M_RD)
1873c8bc09771f Sam Edwards    2024-03-19  344  			drv_data->state = MV64XXX_I2C_STATE_READ;
1873c8bc09771f Sam Edwards    2024-03-19  345  		else
1873c8bc09771f Sam Edwards    2024-03-19  346  			drv_data->state = MV64XXX_I2C_STATE_WRITE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  347  		break;
1873c8bc09771f Sam Edwards    2024-03-19  348  
1873c8bc09771f Sam Edwards    2024-03-19  349  	case MV64XXX_I2C_EVENT_ADDR_NO_ACK:
1873c8bc09771f Sam Edwards    2024-03-19  350  	case MV64XXX_I2C_EVENT_WR_NO_ACK:
1873c8bc09771f Sam Edwards    2024-03-19  351  		/* Doesn't seem to be a device at other end */
e91c021c487110 Mark A. Greer  2005-12-18  352  		drv_data->state = MV64XXX_I2C_STATE_IDLE;
1873c8bc09771f Sam Edwards    2024-03-19  353  		break;
1873c8bc09771f Sam Edwards    2024-03-19  354  
1873c8bc09771f Sam Edwards    2024-03-19  355  	case MV64XXX_I2C_EVENT_WR_ACK:
1873c8bc09771f Sam Edwards    2024-03-19  356  		break;
1873c8bc09771f Sam Edwards    2024-03-19  357  
1873c8bc09771f Sam Edwards    2024-03-19  358  	case MV64XXX_I2C_EVENT_RD_ACKED:
1873c8bc09771f Sam Edwards    2024-03-19  359  		BUG_ON(drv_data->bytes_left == 0);
1873c8bc09771f Sam Edwards    2024-03-19  360  		break;
1873c8bc09771f Sam Edwards    2024-03-19  361  
1873c8bc09771f Sam Edwards    2024-03-19  362  	case MV64XXX_I2C_EVENT_RD_UNACKED:
1873c8bc09771f Sam Edwards    2024-03-19  363  		BUG_ON(drv_data->bytes_left != 0);
1873c8bc09771f Sam Edwards    2024-03-19  364  		break;
1873c8bc09771f Sam Edwards    2024-03-19  365  
1873c8bc09771f Sam Edwards    2024-03-19  366  	case MV64XXX_I2C_EVENT_INVALID:
1873c8bc09771f Sam Edwards    2024-03-19  367  	default:
1873c8bc09771f Sam Edwards    2024-03-19  368  		dev_err(&drv_data->adapter.dev,
1873c8bc09771f Sam Edwards    2024-03-19  369  			"mv64xxx_i2c_fsm: Ctlr Error -- state: 0x%x, "
1873c8bc09771f Sam Edwards    2024-03-19  370  			"status: 0x%x, event: 0x%x, addr: 0x%x, flags: 0x%x\n",
1873c8bc09771f Sam Edwards    2024-03-19  371  			 drv_data->state, status, event, drv_data->msg->addr,
1873c8bc09771f Sam Edwards    2024-03-19  372  			 drv_data->msg->flags);
1873c8bc09771f Sam Edwards    2024-03-19  373  		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
1873c8bc09771f Sam Edwards    2024-03-19  374  		mv64xxx_i2c_hw_init(drv_data);
1873c8bc09771f Sam Edwards    2024-03-19  375  		i2c_recover_bus(&drv_data->adapter);
1873c8bc09771f Sam Edwards    2024-03-19  376  		drv_data->rc = -EAGAIN;
1873c8bc09771f Sam Edwards    2024-03-19  377  		return;
^1da177e4c3f41 Linus Torvalds 2005-04-16  378  	}
1873c8bc09771f Sam Edwards    2024-03-19  379  
1873c8bc09771f Sam Edwards    2024-03-19  380  	/* Internal FSM transitions and action emission */
1873c8bc09771f Sam Edwards    2024-03-19  381  	switch (drv_data->state) {
1873c8bc09771f Sam Edwards    2024-03-19  382  	case MV64XXX_I2C_STATE_IDLE:
1873c8bc09771f Sam Edwards    2024-03-19  383  		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
1873c8bc09771f Sam Edwards    2024-03-19  384  		drv_data->rc = -ENXIO;
1873c8bc09771f Sam Edwards    2024-03-19  385  		break;
1873c8bc09771f Sam Edwards    2024-03-19  386  
1873c8bc09771f Sam Edwards    2024-03-19  387  	case MV64XXX_I2C_STATE_SEND_ADDR_1:
1873c8bc09771f Sam Edwards    2024-03-19  388  		drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  389  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  390  
1873c8bc09771f Sam Edwards    2024-03-19  391  	case MV64XXX_I2C_STATE_SEND_ADDR_2:
^1da177e4c3f41 Linus Torvalds 2005-04-16  392  		drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  393  		break;
1873c8bc09771f Sam Edwards    2024-03-19  394  
1873c8bc09771f Sam Edwards    2024-03-19  395  	case MV64XXX_I2C_STATE_READ:
^1da177e4c3f41 Linus Torvalds 2005-04-16  396  		if (drv_data->bytes_left == 0) {
1873c8bc09771f Sam Edwards    2024-03-19  397  			if (prev_state == MV64XXX_I2C_STATE_READ)
1873c8bc09771f Sam Edwards    2024-03-19  398  				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA_STOP;
1873c8bc09771f Sam Edwards    2024-03-19  399  			else
^1da177e4c3f41 Linus Torvalds 2005-04-16  400  				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  401  			drv_data->state = MV64XXX_I2C_STATE_IDLE;
1873c8bc09771f Sam Edwards    2024-03-19  402  		} else {
1873c8bc09771f Sam Edwards    2024-03-19  403  			if (prev_state == MV64XXX_I2C_STATE_READ)
^1da177e4c3f41 Linus Torvalds 2005-04-16  404  				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
1873c8bc09771f Sam Edwards    2024-03-19  405  			else
1873c8bc09771f Sam Edwards    2024-03-19  406  				drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
1873c8bc09771f Sam Edwards    2024-03-19  407  
1873c8bc09771f Sam Edwards    2024-03-19  408  			/*
1873c8bc09771f Sam Edwards    2024-03-19  409  			 * bytes_left counts the remaining read actions to send
1873c8bc09771f Sam Edwards    2024-03-19  410  			 * to the hardware, not the remaining bytes to be
1873c8bc09771f Sam Edwards    2024-03-19  411  			 * retrieved from the data register
1873c8bc09771f Sam Edwards    2024-03-19  412  			 */
1873c8bc09771f Sam Edwards    2024-03-19  413  			if (drv_data->aborting)
1873c8bc09771f Sam Edwards    2024-03-19  414  				drv_data->bytes_left = 0;
1873c8bc09771f Sam Edwards    2024-03-19  415  			else
^1da177e4c3f41 Linus Torvalds 2005-04-16  416  				drv_data->bytes_left--;
^1da177e4c3f41 Linus Torvalds 2005-04-16  417  
1873c8bc09771f Sam Edwards    2024-03-19  418  			if (drv_data->bytes_left == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  419  				drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_ACK;
1873c8bc09771f Sam Edwards    2024-03-19  420  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  421  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  422  
1873c8bc09771f Sam Edwards    2024-03-19  423  	case MV64XXX_I2C_STATE_WRITE:
1873c8bc09771f Sam Edwards    2024-03-19  424  		if ((drv_data->bytes_left == 0)
1873c8bc09771f Sam Edwards    2024-03-19  425  		    || (drv_data->aborting && (drv_data->byte_posn != 0))) {
1873c8bc09771f Sam Edwards    2024-03-19  426  			if (drv_data->send_stop || drv_data->aborting) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  427  				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  428  				drv_data->state = MV64XXX_I2C_STATE_IDLE;
1873c8bc09771f Sam Edwards    2024-03-19  429  			} else {
1873c8bc09771f Sam Edwards    2024-03-19  430  				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
1873c8bc09771f Sam Edwards    2024-03-19  431  				drv_data->state = MV64XXX_I2C_STATE_RESTART;
1873c8bc09771f Sam Edwards    2024-03-19  432  			}
1873c8bc09771f Sam Edwards    2024-03-19  433  		} else {
1873c8bc09771f Sam Edwards    2024-03-19  434  			drv_data->action = MV64XXX_I2C_ACTION_SEND_DATA;
1873c8bc09771f Sam Edwards    2024-03-19  435  			drv_data->bytes_left--;
1873c8bc09771f Sam Edwards    2024-03-19  436  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  437  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  438  
^1da177e4c3f41 Linus Torvalds 2005-04-16  439  	default:
^1da177e4c3f41 Linus Torvalds 2005-04-16 @440  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  441  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  442  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
