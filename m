Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABAD17720;
	Tue, 18 Jul 2023 21:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689715979; x=1721251979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sDxCVDhr9Q1N3y2NXPyLOooF5+tBO4NJYYWmgJPQVvI=;
  b=co85oKucEy//hr42XcU1QZqDyA5tUGzpW1AHLJ7du/Z2vfyWGXaM4lGp
   YrDX0+mp5+6dHjaKUmCvbf3HIF15Id5xCklCQb4FyeM4fTTXE193gqKxI
   Igj8zDysIA6uQPgWjamizDmNmpO73MZ7gJEcnx5EzgFjq3Mo1HrdshiML
   i5VIZYMyFdxy/GyE/rZa0tvR0d5qzH8gPH5bvhDEmof1aqIuz+z+FrnGa
   T+Xh56tbJr7X3dtDkdKdJOa1f12UCJp4ngFR3YY35NwemqJNdnyYIky1f
   gBZq2suPbAICTzT16ZtJnk3PbzX6Tmj5g99w6IZ/h/gnTetzRqzjGUz3T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397166269"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="397166269"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 14:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="674067307"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="674067307"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 14:32:56 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLsJT-0003tx-23;
	Tue, 18 Jul 2023 21:32:55 +0000
Date: Wed, 19 Jul 2023 05:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/4] cxl: mbox: Preparatory move of functions to
 core/mbox.c
Message-ID: <202307190524.MOiahVHP-lkp@intel.com>
References: <20230717162557.8625-2-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717162557.8625-2-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on pci/next pci/for-linus linus/master v6.5-rc2 next-20230718]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-mbox-Preparatory-move-of-functions-to-core-mbox-c/20230718-181730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230717162557.8625-2-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH v3 1/4] cxl: mbox: Preparatory move of functions to core/mbox.c
config: i386-randconfig-i016-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190524.MOiahVHP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190524.MOiahVHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190524.MOiahVHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:219:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_BG_CMD_STATUS_OFFSET);
                 ^
   drivers/cxl/core/mbox.c:278:4: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
                           ^
>> drivers/cxl/core/mbox.c:307:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           writeq(cmd_reg, cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
           ^
   drivers/cxl/core/mbox.c:317:19: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   u64 md_status = readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
                                   ^
   drivers/cxl/core/mbox.c:324:15: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           status_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_STATUS_OFFSET);
                        ^
   5 errors generated.


vim +/readq +219 drivers/cxl/core/mbox.c

   214	
   215	bool cxl_mbox_background_complete(struct cxl_dev_state *cxlds)
   216	{
   217		u64 reg;
   218	
 > 219		reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_BG_CMD_STATUS_OFFSET);
   220		return FIELD_GET(CXLDEV_MBOX_BG_CMD_COMMAND_PCT_MASK, reg) == 100;
   221	}
   222	EXPORT_SYMBOL_NS_GPL(cxl_mbox_background_complete, CXL);
   223	
   224	/**
   225	 * __cxl_pci_mbox_send_cmd() - Execute a mailbox command
   226	 * @mds: The memory device driver data
   227	 * @mbox_cmd: Command to send to the memory device.
   228	 *
   229	 * Context: Any context. Expects mbox_mutex to be held.
   230	 * Return: -ETIMEDOUT if timeout occurred waiting for completion. 0 on success.
   231	 *         Caller should check the return code in @mbox_cmd to make sure it
   232	 *         succeeded.
   233	 *
   234	 * This is a generic form of the CXL mailbox send command thus only using the
   235	 * registers defined by the mailbox capability ID - CXL 2.0 8.2.8.4. Memory
   236	 * devices, and perhaps other types of CXL devices may have further information
   237	 * available upon error conditions. Driver facilities wishing to send mailbox
   238	 * commands should use the wrapper command.
   239	 *
   240	 * The CXL spec allows for up to two mailboxes. The intention is for the primary
   241	 * mailbox to be OS controlled and the secondary mailbox to be used by system
   242	 * firmware. This allows the OS and firmware to communicate with the device and
   243	 * not need to coordinate with each other. The driver only uses the primary
   244	 * mailbox.
   245	 */
   246	static int __cxl_pci_mbox_send_cmd(struct cxl_memdev_state *mds,
   247					   struct cxl_mbox_cmd *mbox_cmd)
   248	{
   249		struct cxl_dev_state *cxlds = &mds->cxlds;
   250		void __iomem *payload = cxlds->regs.mbox + CXLDEV_MBOX_PAYLOAD_OFFSET;
   251		struct device *dev = cxlds->dev;
   252		u64 cmd_reg, status_reg;
   253		size_t out_len;
   254		int rc;
   255	
   256		lockdep_assert_held(&mds->mbox_mutex);
   257	
   258		/*
   259		 * Here are the steps from 8.2.8.4 of the CXL 2.0 spec.
   260		 *   1. Caller reads MB Control Register to verify doorbell is clear
   261		 *   2. Caller writes Command Register
   262		 *   3. Caller writes Command Payload Registers if input payload is non-empty
   263		 *   4. Caller writes MB Control Register to set doorbell
   264		 *   5. Caller either polls for doorbell to be clear or waits for interrupt if configured
   265		 *   6. Caller reads MB Status Register to fetch Return code
   266		 *   7. If command successful, Caller reads Command Register to get Payload Length
   267		 *   8. If output payload is non-empty, host reads Command Payload Registers
   268		 *
   269		 * Hardware is free to do whatever it wants before the doorbell is rung,
   270		 * and isn't allowed to change anything after it clears the doorbell. As
   271		 * such, steps 2 and 3 can happen in any order, and steps 6, 7, 8 can
   272		 * also happen in any order (though some orders might not make sense).
   273		 */
   274	
   275		/* #1 */
   276		if (cxl_doorbell_busy(cxlds)) {
   277			u64 md_status =
   278				readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
   279	
   280			cxl_cmd_err(cxlds->dev, mbox_cmd, md_status,
   281				    "mailbox queue busy");
   282			return -EBUSY;
   283		}
   284	
   285		/*
   286		 * With sanitize polling, hardware might be done and the poller still
   287		 * not be in sync. Ensure no new command comes in until so. Keep the
   288		 * hardware semantics and only allow device health status.
   289		 */
   290		if (mds->security.poll_tmo_secs > 0) {
   291			if (mbox_cmd->opcode != CXL_MBOX_OP_GET_HEALTH_INFO)
   292				return -EBUSY;
   293		}
   294	
   295		cmd_reg = FIELD_PREP(CXLDEV_MBOX_CMD_COMMAND_OPCODE_MASK,
   296				     mbox_cmd->opcode);
   297		if (mbox_cmd->size_in) {
   298			if (WARN_ON(!mbox_cmd->payload_in))
   299				return -EINVAL;
   300	
   301			cmd_reg |= FIELD_PREP(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK,
   302					      mbox_cmd->size_in);
   303			memcpy_toio(payload, mbox_cmd->payload_in, mbox_cmd->size_in);
   304		}
   305	
   306		/* #2, #3 */
 > 307		writeq(cmd_reg, cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
   308	
   309		/* #4 */
   310		dev_dbg(dev, "Sending command: 0x%04x\n", mbox_cmd->opcode);
   311		writel(CXLDEV_MBOX_CTRL_DOORBELL,
   312		       cxlds->regs.mbox + CXLDEV_MBOX_CTRL_OFFSET);
   313	
   314		/* #5 */
   315		rc = cxl_pci_mbox_wait_for_doorbell(cxlds);
   316		if (rc == -ETIMEDOUT) {
   317			u64 md_status = readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
   318	
   319			cxl_cmd_err(cxlds->dev, mbox_cmd, md_status, "mailbox timeout");
   320			return rc;
   321		}
   322	
   323		/* #6 */
   324		status_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_STATUS_OFFSET);
   325		mbox_cmd->return_code =
   326			FIELD_GET(CXLDEV_MBOX_STATUS_RET_CODE_MASK, status_reg);
   327	
   328		/*
   329		 * Handle the background command in a synchronous manner.
   330		 *
   331		 * All other mailbox commands will serialize/queue on the mbox_mutex,
   332		 * which we currently hold. Furthermore this also guarantees that
   333		 * cxl_mbox_background_complete() checks are safe amongst each other,
   334		 * in that no new bg operation can occur in between.
   335		 *
   336		 * Background operations are timesliced in accordance with the nature
   337		 * of the command. In the event of timeout, the mailbox state is
   338		 * indeterminate until the next successful command submission and the
   339		 * driver can get back in sync with the hardware state.
   340		 */
   341		if (mbox_cmd->return_code == CXL_MBOX_CMD_RC_BACKGROUND) {
   342			u64 bg_status_reg;
   343			int i, timeout;
   344	
   345			/*
   346			 * Sanitization is a special case which monopolizes the device
   347			 * and cannot be timesliced. Handle asynchronously instead,
   348			 * and allow userspace to poll(2) for completion.
   349			 */
   350			if (mbox_cmd->opcode == CXL_MBOX_OP_SANITIZE) {
   351				if (mds->security.poll) {
   352					/* hold the device throughout */
   353					get_device(cxlds->dev);
   354	
   355					/* give first timeout a second */
   356					timeout = 1;
   357					mds->security.poll_tmo_secs = timeout;
   358					queue_delayed_work(system_wq,
   359							   &mds->security.poll_dwork,
   360							   timeout * HZ);
   361				}
   362	
   363				dev_dbg(dev, "Sanitization operation started\n");
   364				goto success;
   365			}
   366	
   367			dev_dbg(dev, "Mailbox background operation (0x%04x) started\n",
   368				mbox_cmd->opcode);
   369	
   370			timeout = mbox_cmd->poll_interval_ms;
   371			for (i = 0; i < mbox_cmd->poll_count; i++) {
   372				if (rcuwait_wait_event_timeout(&mds->mbox_wait,
   373					       cxl_mbox_background_complete(cxlds),
   374					       TASK_UNINTERRUPTIBLE,
   375					       msecs_to_jiffies(timeout)) > 0)
   376					break;
   377			}
   378	
   379			if (!cxl_mbox_background_complete(cxlds)) {
   380				dev_err(dev, "timeout waiting for background (%d ms)\n",
   381					timeout * mbox_cmd->poll_count);
   382				return -ETIMEDOUT;
   383			}
   384	
   385			bg_status_reg = readq(cxlds->regs.mbox +
   386					      CXLDEV_MBOX_BG_CMD_STATUS_OFFSET);
   387			mbox_cmd->return_code =
   388				FIELD_GET(CXLDEV_MBOX_BG_CMD_COMMAND_RC_MASK,
   389					  bg_status_reg);
   390			dev_dbg(dev,
   391				"Mailbox background operation (0x%04x) completed\n",
   392				mbox_cmd->opcode);
   393		}
   394	
   395		if (mbox_cmd->return_code != CXL_MBOX_CMD_RC_SUCCESS) {
   396			dev_dbg(dev, "Mailbox operation had an error: %s\n",
   397				cxl_mbox_cmd_rc2str(mbox_cmd));
   398			return 0; /* completed but caller must check return_code */
   399		}
   400	
   401	success:
   402		/* #7 */
   403		cmd_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
   404		out_len = FIELD_GET(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK, cmd_reg);
   405	
   406		/* #8 */
   407		if (out_len && mbox_cmd->payload_out) {
   408			/*
   409			 * Sanitize the copy. If hardware misbehaves, out_len per the
   410			 * spec can actually be greater than the max allowed size (21
   411			 * bits available but spec defined 1M max). The caller also may
   412			 * have requested less data than the hardware supplied even
   413			 * within spec.
   414			 */
   415			size_t n;
   416	
   417			n = min3(mbox_cmd->size_out, mds->payload_size, out_len);
   418			memcpy_fromio(mbox_cmd->payload_out, payload, n);
   419			mbox_cmd->size_out = n;
   420		} else {
   421			mbox_cmd->size_out = 0;
   422		}
   423	
   424		return 0;
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
