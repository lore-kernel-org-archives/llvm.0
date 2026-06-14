Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9492D6E58;
	Sun, 14 Jun 2026 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451639; cv=none; b=ZeGoXOwISdhizXMdqmJIKiDFuFq1Gezs5c001n9X8sgo6qqu3eaxu7vrt7dovPLjkkCA4RKNRK9eoqCy1pYycBq0+83VLbWhQqsdlY6acjtWq1cBONUkaVZhetzEMhyl9y9kDzsYgv2svC7T1riA/PDODHBTCt9trIzXeESaQHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451639; c=relaxed/simple;
	bh=1r0KCW4bdSBlHqcx4SUHEcGnt15MApLhhu0KVjwgvPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FpJTBoNUHX6KK9txDIDYULtdxrswimAp9AeVMmdakNID+d+Tfkeb1p7zfUhnaujs/LuZXZJzZKuu69DMfMLnki9Nipsuuehd70VJBGDL+0woSnLrIGqpH/3qknT0t5Ot1uMfgYv2LGEijZ5THwExrA9wsZxrYBfK8P/J/yvcwCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oE9lHq/4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oE9lHq/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781451637; x=1812987637;
  h=date:from:to:cc:subject:message-id;
  bh=1r0KCW4bdSBlHqcx4SUHEcGnt15MApLhhu0KVjwgvPU=;
  b=oE9lHq/48SGRCW+w0reY9LNMULWaVVLXZiY98re0QadUko+slWJZrx6m
   Pnzg3JJmKGE+pHo/YMPdxaMyrxQRPzIqO4jWpNzWW3U3L/haE0ZD4kWuf
   DLJzlb0O/4SFKyookO9LSDujtGchNJXkgnjxLVn8C5Z6MsxmuCxJ40gbv
   dC7AeDMJUvbWS4jVrtWwiDKj5RASO3Hw7CPHHEuEwS0KiJ9EcsB5i156f
   +SJTmjnB/I4QYHb5g8SwNujji89misDiwhUF5gBceMM0zVnxMYxnh1eE8
   OvP7kVKby7fc+F+jdMpYKkvdFkJIFrwxT3N/OJDT7HQDYmQA5CPOVB0Li
   Q==;
X-CSE-ConnectionGUID: MLhFJ9CaTXSEAGm+6w8Fig==
X-CSE-MsgGUID: DJwTrBCfR6+mGjk8q5LQqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92768269"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="92768269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 08:40:36 -0700
X-CSE-ConnectionGUID: TuZY7+yJTYuJkrePm9+hgA==
X-CSE-MsgGUID: vgP1WZMIQyussO8Fmnl43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="247353990"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Jun 2026 08:40:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYmwp-000000004hl-1fbL;
	Sun, 14 Jun 2026 15:40:31 +0000
Date: Sun, 14 Jun 2026 17:39:53 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:283:7:
 warning: variable 'kctx_tx' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202606141750.2viU74v0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Add-Midpath-channel-information/20260614-153302
head:   e407d35b9928aa3878a575a8ceeddff2537b1b69
commit: 0d2b843e6c9772755c9d48a80e053189fb4650fd bnxt_en: Support kTLS TX offload by implementing .tls_dev_add/del()
date:   8 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260614/202606141750.2viU74v0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141750.2viU74v0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141750.2viU74v0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:283:7: warning: variable 'kctx_tx' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     283 |                 if (retry_cnt++ > KTLS_RETRY_MAX) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:319:8: note: uninitialized use occurs here
     319 |         kfree(kctx_tx);
         |               ^~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:283:3: note: remove the 'if' if its condition is always false
     283 |                 if (retry_cnt++ > KTLS_RETRY_MAX) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     284 |                         atomic64_inc(&ktls->counters[BNXT_KTLS_ERR_RETRY_EXCEEDED]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     285 |                         netdev_warn(dev, "%s timed out waiting for device, state %lx\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                                     __func__, bp->state);
         |                                     ~~~~~~~~~~~~~~~~~~~~~
     287 |                         goto free;
         |                         ~~~~~~~~~~
     288 |                 }
         |                 ~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:277:7: warning: variable 'kctx_tx' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     277 |                 if (!netif_running(dev) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~
     278 |                     test_bit(BNXT_STATE_IN_FW_RESET, &bp->state))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:319:8: note: uninitialized use occurs here
     319 |         kfree(kctx_tx);
         |               ^~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:277:3: note: remove the 'if' if its condition is always false
     277 |                 if (!netif_running(dev) ||
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
     278 |                     test_bit(BNXT_STATE_IN_FW_RESET, &bp->state))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     279 |                         goto free;
         |                         ~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:277:7: warning: variable 'kctx_tx' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     277 |                 if (!netif_running(dev) ||
         |                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:319:8: note: uninitialized use occurs here
     319 |         kfree(kctx_tx);
         |               ^~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:277:7: note: remove the '||' if its condition is always false
     277 |                 if (!netif_running(dev) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c:260:42: note: initialize the variable 'kctx_tx' to silence this warning
     260 |         struct bnxt_ktls_offload_ctx_tx *kctx_tx;
         |                                                 ^
         |                                                  = NULL
   3 warnings generated.
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_en.o: warning: objtool: bnxt_ktls_dev_del(): unexpected end of section .text


vim +283 drivers/net/ethernet/broadcom/bnxt/bnxt_ktls.c

   255	
   256	static void bnxt_ktls_dev_del(struct net_device *dev,
   257				      struct tls_context *tls_ctx,
   258				      enum tls_offload_ctx_dir direction)
   259	{
   260		struct bnxt_ktls_offload_ctx_tx *kctx_tx;
   261		struct bnxt *bp = netdev_priv(dev);
   262		struct bnxt_crypto_info *crypto;
   263		struct bnxt_tls_info *ktls;
   264		struct bnxt_kctx *kctx;
   265		int retry_cnt = 0;
   266		u8 kind;
   267		u32 kid;
   268	
   269		ktls = bp->ktls_info;
   270	retry:
   271		if (!test_bit(BNXT_STATE_OPEN, &bp->state)) {
   272			/* During ifdown or FW reset, all connections will be torn
   273			 * down by bnxt_crypto_del_all() / FUNC_RESET, so nothing to
   274			 * do here.  Only a reconfiguration is transient and
   275			 * __bnxt_open_nic() will set BNXT_STATE_OPEN again and wake us.
   276			 */
 > 277			if (!netif_running(dev) ||
   278			    test_bit(BNXT_STATE_IN_FW_RESET, &bp->state))
   279				goto free;
   280			/* Bound the wait so a wedged reconfig can't block the kTLS
   281			 * destruct work indefinitely.
   282			 */
 > 283			if (retry_cnt++ > KTLS_RETRY_MAX) {
   284				atomic64_inc(&ktls->counters[BNXT_KTLS_ERR_RETRY_EXCEEDED]);
   285				netdev_warn(dev, "%s timed out waiting for device, state %lx\n",
   286					    __func__, bp->state);
   287				goto free;
   288			}
   289			wait_event_timeout(ktls->open_wq,
   290					   test_bit(BNXT_STATE_OPEN, &bp->state) ||
   291					   !netif_running(dev) ||
   292					   test_bit(BNXT_STATE_IN_FW_RESET, &bp->state),
   293					   msecs_to_jiffies(KTLS_WAIT_TMO_MS));
   294			goto retry;
   295		}
   296		atomic_inc(&ktls->pending);
   297		/* Make sure bnxt_close_nic() sees pending before we check the
   298		 * BNXT_STATE_OPEN flag.
   299		 */
   300		smp_mb__after_atomic();
   301		if (!test_bit(BNXT_STATE_OPEN, &bp->state)) {
   302			atomic_dec(&ktls->pending);
   303			goto retry;
   304		}
   305	
   306		crypto = bp->crypto_info;
   307		kctx_tx = bnxt_get_ktls_ctx_tx(tls_ctx);
   308		kid = kctx_tx->kid;
   309		kctx = &crypto->kctx[BNXT_TX_CRYPTO_KEY_TYPE];
   310		kind = BNXT_CTX_KIND_CK_TX;
   311		atomic64_inc(&ktls->counters[BNXT_KTLS_TX_DEL]);
   312		if (bnxt_kid_valid(kctx, kid) &&
   313		    !bnxt_crypto_del(bp, kctx->type, kind, kid))
   314			bnxt_free_one_kctx(kctx, kid);
   315	
   316		atomic_dec(&ktls->pending);
   317	free:
   318		bnxt_set_ktls_ctx_tx(tls_ctx, NULL);
   319		kfree(kctx_tx);
   320	}
   321	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
