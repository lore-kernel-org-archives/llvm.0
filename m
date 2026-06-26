Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF983A4F36;
	Fri, 26 Jun 2026 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505676; cv=none; b=dFtnc13fjCZMBBCSQdEAewk18gQUmWcg955FeZmjftM6cd0oCU6mf6YV9jpW6CXgVOJz3jcN6DU+ypotCZ8HOTQFKm19O949Y1Qq54RqlY+6PtXJB4ZF8ykYgHG1Lv1C2i4orDc9J5j7d7USiD3Bb6GF6LSvviBDjmgqLbPSjwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505676; c=relaxed/simple;
	bh=tRG8N/qZ3iQeDFaNwTBwhXTwT0NXzga6uH3lcwzx2y0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tjotQoDZET2egvoKvSsbJTrZOnr6xWv43RLMJo0r4I4I8rsi5tflmBGEJQI26CXw9ao7PLjl4wm55F+jJDAg8+ue8Xg7X7wDRbjmkxArIlSUPhTucWbxdPVGZkiczk5lpoONKIiXvJttZE+ZPyEHHZdU4viSHrgyUMaajvlvq9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI2G4cCB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI2G4cCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782505675; x=1814041675;
  h=date:from:to:cc:subject:message-id;
  bh=tRG8N/qZ3iQeDFaNwTBwhXTwT0NXzga6uH3lcwzx2y0=;
  b=iI2G4cCBzs0RgUgAuqzr4Jm476CKUE4707+sLb7/E0h/7SuUZGk7HKGQ
   bwyAyDoqlVkD1RPk9HSnCRcUVG3k9CEg5qT3JWKOYfYLMUf4Wcih1p1Jo
   HvM2OnQ/ZKoq4rT4aa5rDxO0IsYfEs4DII31Eepxjx+nFIq4j/AlQ6lIU
   jPdpaR6RnSSywuk2/ZJ3gEm8/+VlGZObvLeLqBCTnErEs0nZq5YwNe8ro
   jW+DDg6NJvmLdkZDYPN2gi9vu/rVmzDHykmdeVRJTGvqXQ/4+I/5x0957
   7tAUlFOzRJ/dlISJhd+3uuviFJwos4c2qHialBA7itJJ20bd2Rkjf6CIt
   Q==;
X-CSE-ConnectionGUID: +FOFDP7FRxGxSqzyntkP+Q==
X-CSE-MsgGUID: 6P2ZeBR/TxOkEoJq02bhdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="86993467"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="86993467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 13:27:55 -0700
X-CSE-ConnectionGUID: /7QorXBCSWCuzfOHUxPAOg==
X-CSE-MsgGUID: wKW8kyEOQYCHO9K6o6h9tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="281496182"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Jun 2026 13:27:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdD9S-000000005Pl-1u05;
	Fri, 26 Jun 2026 20:27:50 +0000
Date: Sat, 27 Jun 2026 04:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Wang, Hang Suan" <hang.suan.wang@altera.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:socfpga_fcs_v1 1/4]
 drivers/firmware/stratix10-svc.c:1335:13: warning: variable 'pmem' is
 uninitialized when used here
Message-ID: <202606270412.GSfC6eHB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_fcs_v1
head:   2de200789f740e5728f4247447495d1f1035a4ec
commit: a662668d29291c2ceafbd7e8067b4e3cd737c840 [1/4] firmware: stratix10-svc: add FCS crypto-service commands for Agilex5
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260627/202606270412.GSfC6eHB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270412.GSfC6eHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270412.GSfC6eHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/stratix10-svc.c:1335:13: warning: variable 'pmem' is uninitialized when used here [-Wuninitialized]
    1335 |                 args.a5 = pmem->paddr;
         |                           ^~~~
   drivers/firmware/stratix10-svc.c:1279:37: note: initialize the variable 'pmem' to silence this warning
    1279 |         struct stratix10_svc_data_mem *pmem;
         |                                            ^
         |                                             = NULL
   1 warning generated.


vim +/pmem +1335 drivers/firmware/stratix10-svc.c

  1244	
  1245	/**
  1246	 * stratix10_svc_async_send - Send an asynchronous message to the
  1247	 *                            Stratix10 service
  1248	 * @chan: Pointer to the service channel structure
  1249	 * @msg: Pointer to the message to be sent
  1250	 * @handler: Pointer to the handler for the asynchronous message
  1251	 *           used by caller for later reference.
  1252	 * @cb: Callback function to be called upon completion
  1253	 * @cb_arg: Argument to be passed to the callback function
  1254	 *
  1255	 * This function sends an asynchronous message to the SDM mailbox in
  1256	 * EL3 secure firmware. It performs various checks and setups,
  1257	 * including allocating a job ID, setting up the transaction ID and
  1258	 * packaging it to El3 firmware. The function handles different
  1259	 * commands by setting up the appropriate arguments for the SMC call.
  1260	 * If the SMC call is successful, the handler is set up and the
  1261	 * function returns 0. If the SMC call fails, appropriate error
  1262	 * handling is performed along with cleanup of resources.
  1263	 *
  1264	 * Return: 0 on success, -EINVAL for invalid argument, -ENOMEM if
  1265	 * memory is not available, -EAGAIN if EL3 firmware is busy, -EBADF
  1266	 * if the message is rejected by EL3 firmware and -EIO on other
  1267	 * errors from EL3 firmware.
  1268	 */
  1269	int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
  1270				     void **handler, async_callback_t cb, void *cb_arg)
  1271	{
  1272		struct arm_smccc_1_2_regs args = { 0 }, res = { 0 };
  1273		struct stratix10_svc_async_handler *handle = NULL;
  1274		struct stratix10_svc_client_msg *p_msg =
  1275			(struct stratix10_svc_client_msg *)msg;
  1276		struct stratix10_svc_controller *ctrl;
  1277		struct stratix10_async_ctrl *actrl;
  1278		struct stratix10_async_chan *achan;
  1279		struct stratix10_svc_data_mem *pmem;
  1280		int ret = 0;
  1281	
  1282		if (!chan || !msg || !handler)
  1283			return -EINVAL;
  1284	
  1285		achan = chan->async_chan;
  1286		ctrl = chan->ctrl;
  1287		actrl = &ctrl->actrl;
  1288	
  1289		if (!actrl->initialized) {
  1290			dev_err(ctrl->dev, "Async controller not initialized\n");
  1291			return -EINVAL;
  1292		}
  1293	
  1294		if (!achan) {
  1295			dev_err(ctrl->dev, "Async channel not allocated\n");
  1296			return -EINVAL;
  1297		}
  1298	
  1299		handle = kzalloc(sizeof(*handle), GFP_KERNEL);
  1300		if (!handle)
  1301			return -ENOMEM;
  1302	
  1303		ret = ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
  1304				    GFP_KERNEL);
  1305		if (ret < 0) {
  1306			dev_err(ctrl->dev, "Failed to allocate job id\n");
  1307			kfree(handle);
  1308			return -ENOMEM;
  1309		}
  1310	
  1311		handle->transaction_id =
  1312			STRATIX10_SET_TRANSACTIONID(achan->async_client_id, ret);
  1313		handle->cb = cb;
  1314		handle->msg = p_msg;
  1315		handle->cb_arg = cb_arg;
  1316		handle->achan = achan;
  1317	
  1318		/*set the transaction jobid in args.a1*/
  1319		args.a1 =
  1320			STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
  1321	
  1322		switch (p_msg->command) {
  1323		case COMMAND_FCS_CRYPTO_OPEN_SESSION:
  1324			args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
  1325			break;
  1326		case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
  1327			args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
  1328			args.a2 = p_msg->arg[0];
  1329			break;
  1330		case COMMAND_FCS_SDOS_DATA_EXT:
  1331			args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
  1332			args.a2 = p_msg->arg[0];
  1333			args.a3 = p_msg->arg[1];
  1334			args.a4 = p_msg->arg[2];
> 1335			args.a5 = pmem->paddr;
  1336			args.a6 = p_msg->payload_length;
  1337			args.a7 = pmem->paddr;
  1338			args.a8 = p_msg->payload_length_output;
  1339			args.a9 = p_msg->arg[3];
  1340			args.a10 = pmem->paddr;
  1341			args.a11 = pmem->paddr;
  1342			break;
  1343		case COMMAND_RSU_GET_SPT_TABLE:
  1344			args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
  1345			break;
  1346		case COMMAND_RSU_STATUS:
  1347			args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_ERROR_STATUS;
  1348			break;
  1349		case COMMAND_RSU_NOTIFY:
  1350			args.a0 = INTEL_SIP_SMC_ASYNC_RSU_NOTIFY;
  1351			args.a2 = p_msg->arg[0];
  1352			break;
  1353		default:
  1354			dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
  1355			ret = -EINVAL;
  1356			goto deallocate_id;
  1357		}
  1358	
  1359		/**
  1360		 * There is a chance that during the execution of async_send()
  1361		 * in one core, an interrupt might be received in another core;
  1362		 * to mitigate this we are adding the handle to the DB and then
  1363		 * send the smc call. If the smc call is rejected or busy then
  1364		 * we will deallocate the handle for the client to retry again.
  1365		 */
  1366		scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
  1367			hash_add(actrl->trx_list, &handle->next,
  1368				 handle->transaction_id);
  1369		}
  1370	
  1371		actrl->invoke_fn(actrl, &args, &res);
  1372	
  1373		switch (res.a0) {
  1374		case INTEL_SIP_SMC_STATUS_OK:
  1375			dev_dbg(ctrl->dev,
  1376				"Async message sent with transaction_id 0x%02x\n",
  1377				handle->transaction_id);
  1378			*handler = handle;
  1379			return 0;
  1380		case INTEL_SIP_SMC_STATUS_BUSY:
  1381			dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
  1382			ret = -EAGAIN;
  1383			break;
  1384		case INTEL_SIP_SMC_STATUS_REJECTED:
  1385			dev_err(ctrl->dev, "Async message rejected\n");
  1386			ret = -EBADF;
  1387			break;
  1388		default:
  1389			dev_err(ctrl->dev,
  1390				"Failed to send async message ,got status as %ld\n",
  1391				res.a0);
  1392			ret = -EIO;
  1393		}
  1394	
  1395		scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
  1396			hash_del(&handle->next);
  1397		}
  1398	
  1399	deallocate_id:
  1400		ida_free(&achan->job_id_pool,
  1401			 STRATIX10_GET_JOBID(handle->transaction_id));
  1402		kfree(handle);
  1403		return ret;
  1404	}
  1405	EXPORT_SYMBOL_GPL(stratix10_svc_async_send);
  1406	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
