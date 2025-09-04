Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9F2DF68;
	Thu,  4 Sep 2025 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990281; cv=none; b=MFFMLZJ9aKAx6l76aKeU8rz8SmqmE8McIBDpHX7GcV3XuoJuSrcNoFeAxIRZliZ3DLUPlmRvjtoqrXLrbzCI+PMc/oE59YkiPe4TO1kDFlROtL9zvsDmjQHELKtQPCi+9I4yEZO5a5Lj7doAJXfbhm5qii3dZAd6zfn0VLcdNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990281; c=relaxed/simple;
	bh=uHVxlro908sFNMcdd3IAk4dfsfp6f+ud43PdMW6oKms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOLZllAJduJEjDbHerYIhsoAkw6C7rRz+PK2NhoON+vd4LzCxJd+dg5yQkVKOjPyeuiu+NKiawjFgJe8EvTlUYMPg1gPWcD06dBDtTkOywXT9fkqhAHkbVHDXKTSTyogKpYemdmm9WCOge6hnWCnokI9dvjt0bMsJHg0BDEoY5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK1ijoCI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK1ijoCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756990279; x=1788526279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHVxlro908sFNMcdd3IAk4dfsfp6f+ud43PdMW6oKms=;
  b=YK1ijoCI9tKSrDqoIsehk3aPHTv7QKvGtXjJe6dADlB0qwRjkTlC3q5f
   OdZzFN0/WmPhImV6k7D2cngc9hWymc+4s+IV1bqTz14YwBohXU7/2Qa/A
   Yx1DNvGskmCYyAGUAUIloU/nbpOD1rvlUBieQ9xzkbtPDloenHvdaDiv/
   umbNasuAiUCY1v745/4aboQCkG006Cmv4YYBLcAhPfYffRUEWlDWa3Vaf
   3Y71WJqOjGdp1SwPJdnYZk1gxRDyICGAmS0e8AP98oC3niVhVUEtqAk/J
   ArdqzlsF+9MiWQbRlh6WGw5B8q8fAhiZnyEPwR28+EaL7bXqEFjw3PrVs
   Q==;
X-CSE-ConnectionGUID: 7uh+Ldp2QFKvGV1MzkPNkg==
X-CSE-MsgGUID: zlW7IfYFR6aQHmzDUH4nWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59393677"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59393677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:51:18 -0700
X-CSE-ConnectionGUID: 7cMc4u4JTY66v5yJwe3x+Q==
X-CSE-MsgGUID: bg4BOI+cRwmzIOj9ewzUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172334441"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2025 05:51:17 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu9QV-0005J4-1e;
	Thu, 04 Sep 2025 12:51:10 +0000
Date: Thu, 4 Sep 2025 20:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Child <nchild@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream-20250903-1 2/2]
 drivers/infiniband/sw/rdmavt/qp.c:1275:5: warning: no previous prototype for
 function '__rvt_error_qp_locked'
Message-ID: <202509042018.iDxdr7Q3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20250903-1
head:   42ab16807bc676eb7d0d33ede83d44aca682abf2
commit: 42ab16807bc676eb7d0d33ede83d44aca682abf2 [2/2] IB/rdmavt: Fix lock dependency in rvt_send/recv_cq
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250904/202509042018.iDxdr7Q3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042018.iDxdr7Q3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042018.iDxdr7Q3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/sw/rdmavt/qp.c:1275:5: warning: no previous prototype for function '__rvt_error_qp_locked' [-Wmissing-prototypes]
    1275 | int __rvt_error_qp_locked(struct rvt_qp *qp, enum ib_wc_status err)
         |     ^
   drivers/infiniband/sw/rdmavt/qp.c:1275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1275 | int __rvt_error_qp_locked(struct rvt_qp *qp, enum ib_wc_status err)
         | ^
         | static 
>> drivers/infiniband/sw/rdmavt/qp.c:1375:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1375 |                 unsigned long flags;
         |                 ^
   2 warnings generated.


vim +/__rvt_error_qp_locked +1275 drivers/infiniband/sw/rdmavt/qp.c

  1274	
> 1275	int __rvt_error_qp_locked(struct rvt_qp *qp, enum ib_wc_status err)
  1276	{
  1277		struct ib_wc wc;
  1278		int ret = 0;
  1279		struct rvt_dev_info *rdi = ib_to_rvt(qp->ibqp.device);
  1280	
  1281		lockdep_assert_held(&qp->r_lock);
  1282		lockdep_assert_held(&qp->s_lock);
  1283		if (qp->state == IB_QPS_ERR || qp->state == IB_QPS_RESET)
  1284			goto bail;
  1285	
  1286		qp->state = IB_QPS_ERR;
  1287	
  1288		if (qp->s_flags & (RVT_S_TIMER | RVT_S_WAIT_RNR)) {
  1289			qp->s_flags &= ~(RVT_S_TIMER | RVT_S_WAIT_RNR);
  1290			timer_delete(&qp->s_timer);
  1291		}
  1292	
  1293		if (qp->s_flags & RVT_S_ANY_WAIT_SEND)
  1294			qp->s_flags &= ~RVT_S_ANY_WAIT_SEND;
  1295	
  1296		rdi->driver_f.notify_error_qp(qp);
  1297	
  1298		/* Schedule the sending tasklet to drain the send work queue. */
  1299		if (READ_ONCE(qp->s_last) != qp->s_head)
  1300			rdi->driver_f.schedule_send(qp);
  1301	
  1302		rvt_clear_mr_refs(qp, 0);
  1303	
  1304		memset(&wc, 0, sizeof(wc));
  1305		wc.qp = &qp->ibqp;
  1306		wc.opcode = IB_WC_RECV;
  1307	
  1308		if (test_and_clear_bit(RVT_R_WRID_VALID, &qp->r_aflags)) {
  1309			wc.wr_id = qp->r_wr_id;
  1310			wc.status = err;
  1311			rvt_cq_enter(ibcq_to_rvtcq(qp->ibqp.recv_cq), &wc, 1);
  1312		}
  1313		wc.status = IB_WC_WR_FLUSH_ERR;
  1314	
  1315		if (qp->r_rq.kwq) {
  1316			u32 head;
  1317			u32 tail;
  1318			struct rvt_rwq *wq = NULL;
  1319			struct rvt_krwq *kwq = NULL;
  1320	
  1321			spin_lock(&qp->r_rq.kwq->c_lock);
  1322			/* qp->ip used to validate if there is a  user buffer mmaped */
  1323			if (qp->ip) {
  1324				wq = qp->r_rq.wq;
  1325				head = RDMA_READ_UAPI_ATOMIC(wq->head);
  1326				tail = RDMA_READ_UAPI_ATOMIC(wq->tail);
  1327			} else {
  1328				kwq = qp->r_rq.kwq;
  1329				head = kwq->head;
  1330				tail = kwq->tail;
  1331			}
  1332			/* sanity check pointers before trusting them */
  1333			if (head >= qp->r_rq.size)
  1334				head = 0;
  1335			if (tail >= qp->r_rq.size)
  1336				tail = 0;
  1337			while (tail != head) {
  1338				wc.wr_id = rvt_get_rwqe_ptr(&qp->r_rq, tail)->wr_id;
  1339				if (++tail >= qp->r_rq.size)
  1340					tail = 0;
  1341				rvt_cq_enter(ibcq_to_rvtcq(qp->ibqp.recv_cq), &wc, 1);
  1342			}
  1343			if (qp->ip)
  1344				RDMA_WRITE_UAPI_ATOMIC(wq->tail, tail);
  1345			else
  1346				kwq->tail = tail;
  1347			spin_unlock(&qp->r_rq.kwq->c_lock);
  1348		} else if (qp->ibqp.event_handler) {
  1349			ret = 1;
  1350		}
  1351	
  1352	bail:
  1353		return ret;
  1354	}
  1355	
  1356	/**
  1357	 * rvt_error_qp - put a QP into the error state
  1358	 * @qp: the QP to put into the error state
  1359	 * @err: the receive completion error to signal if a RWQE is active
  1360	 * @lock_state: caller ownership representation of r and s lock
  1361	 *
  1362	 * Flushes both send and receive work queues.
  1363	 *
  1364	 * Return: true if last WQE event should be generated.
  1365	 * The QP r_lock and s_lock should be held and interrupts disabled.
  1366	 * If we are already in error state, just return.
  1367	 */
  1368	int rvt_error_qp(struct rvt_qp *qp, enum ib_wc_status err,
  1369			 enum rvt_qp_lock_state lock_state)
  1370	{
  1371		int ret;
  1372	
  1373		switch (lock_state) {
  1374		case RVT_QP_LOCK_STATE_NONE:
> 1375			unsigned long flags;
  1376	
  1377			/* only case where caller may not have handled irqs */
  1378			spin_lock_irqsave(&qp->r_lock, flags);
  1379			spin_lock(&qp->s_lock);
  1380			ret = __rvt_error_qp_locked(qp, err);
  1381			spin_unlock(&qp->s_lock);
  1382			spin_unlock_irqrestore(&qp->r_lock, flags);
  1383			break;
  1384	
  1385		case RVT_QP_LOCK_STATE_S:
  1386			/* r_lock -> s_lock ordering can be broken here iff
  1387			 * no one else is using the r_lock at the moment
  1388			 */
  1389			if (!spin_trylock(&qp->r_lock)) {
  1390				/* otherwise we must respect ordering */
  1391				spin_unlock(&qp->s_lock);
  1392				spin_lock(&qp->r_lock);
  1393				spin_lock(&qp->s_lock);
  1394			}
  1395			ret = __rvt_error_qp_locked(qp, err);
  1396			spin_unlock(&qp->r_lock);
  1397			break;
  1398	
  1399		case RVT_QP_LOCK_STATE_R:
  1400			spin_lock(&qp->s_lock);
  1401			ret = __rvt_error_qp_locked(qp, err);
  1402			spin_unlock(&qp->s_lock);
  1403			break;
  1404	
  1405		case RVT_QP_LOCK_STATE_RS:
  1406			fallthrough;
  1407		default:
  1408			ret = __rvt_error_qp_locked(qp, err);
  1409		}
  1410	
  1411		return ret;
  1412	}
  1413	EXPORT_SYMBOL(rvt_error_qp);
  1414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
