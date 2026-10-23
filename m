Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794569;
	b=foamavbm/WEyBhlR7eAIESGuVIhJAMBD/sxKrj/PdcbOFbC3TdOpH13S8e1Ad/V2j96a
	 9e+7cqFWNs8DhrSa5JPLiPob4K6hV+EYX3sD3tDdrnF1Pv7Q3Iw24b0GXLBwBr8mavD3Y
	 gEcO/n4J/dmuT5EsBLx4HEUbJGlZXQ0Xkq/+v5Hkj/jXIqfrDvOZ6vXc7BIH5zPq8+jir
	 NbFDA7C1A7DCqs2T6dfYyW9YOmYAQn4pvWmE8TDKrcEVAG87gXWEdnxHMqR5NMcCrF/87
	 4asgFqOVaq8kPC3c2N6wTF/U4rlmRkhknT+sDkeQHLWHdYM3K1zAAcfyNmEDZ10hWsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794569;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qkPSQ+kDVu4LC1UJVQGhVAEBaqXfgEPRzT0FBdPdCVU=;
	b=ROA7xMowAbxQEYAChPnqYCmRqDrAVyAaAbdtbAAtuq+F1inqhAitXUc8Dwi1KgdV1mnl
	 5paNCtg8OQ/0JOd0tH8c1ecinkUgzUmC7Xp0fhGH3x72k2H0HNnDVAtvCEcsz6+lRpClb
	 sDnoLu7epxqi64eRXzrLBvdtWLhZlVVL/YMBUZaSvCXBVUPr6QFxzXdjxiG+5XOta8x5r
	 qCvk5y4G/jfcGcdjFMneOKGJH5rgHY52bNcXiUeV7dc/3Iqjo9Ie/2boNjTEuI7RqgclO
	 QQ7npJ/610jN0SfcUq8A6cJ9B5mrtJzpDtziNdRVupOxBrMpL3mVDTIihhs4Vguf2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoUku+CW;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01783606A31E;
	Fri, 23 Oct 2026 22:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01783606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoUku+CW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792794569; x=1824330569;
  h=date:from:to:cc:subject:message-id;
  bh=dIXWv49TX85rRnR9kWC7WgLPbTp0yATA5rYktpUZVkw=;
  b=HoUku+CW0hX/c0CrLEuOa8XU4x6Y24Ye8prrs5wol7D8bP0axdn9vSWg
   c9UqzlXj++ie2wfoGGtxRI2n755qcSbf9dwnk2ydcKUQEQBqCLqHXAzTH
   lCR0WrMvWVoERMjRXCOmNJvG1tJ97tzC0DlreIY2EdGeHoAEQedsBeqKh
   RGNEBFQ8UxKw6SAoeIOL1xfX5kvw6HSPDRkrCQ5q/WDHdb9+V4peeVHwu
   E9peDt05hc/ZfGyRNJdtNJwgxMTdiuEmGv46k9p0tYWMpNtuLryVOjMX9
   KvcgzgGulnTrGJ9fvtt93KSJEzxqnXk3JsWIySwR4NGN17SWSttsUUEfF
   g==;
X-CSE-ConnectionGUID: R1wHIpreT+WljM44k7fzXQ==
X-CSE-MsgGUID: UfbCXfWBSCG6aeYCPprBpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1454191"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1454191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 15:29:28 -0700
X-CSE-ConnectionGUID: rpSzesHQQN64x1d/kaxgEQ==
X-CSE-MsgGUID: MW/o+pPAQoGyJvtGNoTDpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3741926"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2026 15:29:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKNlL-000000002Lh-2Xif;
	Fri, 23 Oct 2026 22:29:23 +0000
Date: Sat, 24 Oct 2026 00:28:30 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:locking 11/12]
 net/bluetooth/l2cap_core.c:1663:4: warning: calling function
 'l2cap_chan_ready' requires holding mutex 'chan->conn->lock' exclusively
Message-ID: <202610240034.EOfSkpzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux locking
head:   e794b69f24da7abb1e5a86052eefaac62f85dcc2
commit: f77da254e15dda2d0cb49a19ca6ee67ef304c1fe [11/12] locking: Call lockdep_assert_held() from __assume_ctx_lock()
config: loongarch-randconfig-2000-20261023 (https://download.01.org/0day-ci/archive/20261024/202610240034.EOfSkpzZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240034.EOfSkpzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240034.EOfSkpzZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/l2cap_core.c:1663:4: warning: calling function 'l2cap_chan_ready' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1663 |                         l2cap_chan_ready(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:1663:4: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:1678:5: warning: calling function '__l2cap_chan_close' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1678 |                                 __l2cap_chan_close(chan, ECONNRESET);
         |                                 ^
   net/bluetooth/l2cap_core.c:1678:5: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:1684:5: warning: calling function 'l2cap_start_connection' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1684 |                                 l2cap_start_connection(chan);
         |                                 ^
   net/bluetooth/l2cap_core.c:1684:5: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:1686:5: warning: calling function '__l2cap_chan_close' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1686 |                                 __l2cap_chan_close(chan, ECONNREFUSED);
         |                                 ^
   net/bluetooth/l2cap_core.c:1686:5: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:1781:4: warning: calling function 'l2cap_le_start' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1781 |                         l2cap_le_start(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:1781:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:1784:5: warning: calling function 'l2cap_chan_ready' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1784 |                                 l2cap_chan_ready(chan);
         |                                 ^
   net/bluetooth/l2cap_core.c:1784:5: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:1786:4: warning: calling function 'l2cap_do_start' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1786 |                         l2cap_do_start(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:1786:4: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:1937:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    1937 |                 l2cap_chan_del(chan, err);
         |                 ^
   net/bluetooth/l2cap_core.c:1937:3: note: found near match 'hcon->l2cap_data->lock'
>> net/bluetooth/l2cap_core.c:4071:11: warning: calling function 'l2cap_chan_try_sibling_lock' requires holding mutex 'data->locked_chan->lock' exclusively [-Wthread-safety-analysis]
    4071 |         locked = l2cap_chan_try_sibling_lock(chan, rsp->locked_chan);
         |                  ^
>> net/bluetooth/l2cap_core.c:4071:11: warning: calling function 'l2cap_chan_try_sibling_lock' requires holding mutex 'data->locked_chan->conn->lock' exclusively [-Wthread-safety-analysis]
>> net/bluetooth/l2cap_core.c:4093:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->lock' exclusively [-Wthread-safety-analysis]
    4093 |                 l2cap_chan_del(chan, ECONNRESET);
         |                 ^
   net/bluetooth/l2cap_core.c:4093:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-analysis]
>> net/bluetooth/l2cap_core.c:4282:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_chan_create().conn->lock' exclusively [-Wthread-safety-precise]
    4282 |                 l2cap_chan_del(chan, 0);
         |                 ^
   net/bluetooth/l2cap_core.c:4282:3: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:4515:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_chan_hold_unless_zero(chan).conn->lock' exclusively [-Wthread-safety-precise]
    4515 |                 l2cap_chan_del(chan, ECONNREFUSED);
         |                 ^
   net/bluetooth/l2cap_core.c:4515:3: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:4651:5: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_get_chan_by_scid(conn, dcid).conn->lock' exclusively [-Wthread-safety-precise]
    4651 |                                 l2cap_chan_ready(chan);
         |                                 ^
   net/bluetooth/l2cap_core.c:4651:5: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:4797:4: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_get_chan_by_scid(conn, scid).conn->lock' exclusively [-Wthread-safety-precise]
    4797 |                         l2cap_chan_ready(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:4797:4: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:4840:2: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_get_chan_by_scid(conn, dcid).conn->lock' exclusively [-Wthread-safety-precise]
    4840 |         l2cap_chan_del(chan, ECONNRESET);
         |         ^
   net/bluetooth/l2cap_core.c:4840:2: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:4882:2: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_get_chan_by_scid(conn, scid).conn->lock' exclusively [-Wthread-safety-precise]
    4882 |         l2cap_chan_del(chan, 0);
         |         ^
   net/bluetooth/l2cap_core.c:4882:2: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:5102:3: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_chan_hold_unless_zero(chan).conn->lock' exclusively [-Wthread-safety-precise]
    5102 |                 l2cap_chan_ready(chan);
         |                 ^
   net/bluetooth/l2cap_core.c:5102:3: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5111:4: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_chan_hold_unless_zero(chan).conn->lock' exclusively [-Wthread-safety-precise]
    5111 |                         l2cap_chan_del(chan, ECONNREFUSED);
         |                         ^
   net/bluetooth/l2cap_core.c:5111:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5126:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_chan_hold_unless_zero(chan).conn->lock' exclusively [-Wthread-safety-precise]
    5126 |                 l2cap_chan_del(chan, ECONNREFUSED);
         |                 ^
   net/bluetooth/l2cap_core.c:5126:3: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:5339:3: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_new_connection(conn, l2cap_global_chan_by_psm(BT_LISTEN, psm, conn->hcon->src, conn->hcon->dst, 128)).conn->lock' exclusively [-Wthread-safety-precise]
    5339 |                 l2cap_chan_ready(chan);
         |                 ^
   net/bluetooth/l2cap_core.c:5339:3: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5573:4: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_new_connection(conn, l2cap_global_chan_by_psm(BT_LISTEN, psm, conn->hcon->src, conn->hcon->dst, 128)).conn->lock' exclusively [-Wthread-safety-precise]
    5573 |                         l2cap_chan_ready(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:5573:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5636:4: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5636 |                         l2cap_chan_del(chan, ECONNREFUSED);
         |                         ^
   net/bluetooth/l2cap_core.c:5636:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5657:4: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5657 |                         l2cap_chan_del(chan, ECONNREFUSED);
         |                         ^
   net/bluetooth/l2cap_core.c:5657:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5689:5: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5689 |                                 l2cap_chan_del(chan, ECONNREFUSED);
         |                                 ^
   net/bluetooth/l2cap_core.c:5689:5: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5704:4: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5704 |                         l2cap_chan_del(chan, ECONNREFUSED);
         |                         ^
   net/bluetooth/l2cap_core.c:5704:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5710:5: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5710 |                                 l2cap_chan_del(chan, ECONNREFUSED);
         |                                 ^
   net/bluetooth/l2cap_core.c:5710:5: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5719:4: warning: calling function 'l2cap_chan_ready' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5719 |                         l2cap_chan_ready(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:5719:4: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5863:3: warning: calling function 'l2cap_chan_del' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    5863 |                 l2cap_chan_del(chan, ECONNRESET);
         |                 ^
   net/bluetooth/l2cap_core.c:5863:3: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:5893:2: warning: calling function 'l2cap_chan_del' requires holding mutex 'l2cap_chan_hold_unless_zero(chan).conn->lock' exclusively [-Wthread-safety-precise]
    5893 |         l2cap_chan_del(chan, ECONNREFUSED);
         |         ^
   net/bluetooth/l2cap_core.c:5893:2: note: found near match 'conn->lock'
>> net/bluetooth/l2cap_core.c:7297:3: warning: calling function 'l2cap_chan_ready' requires holding mutex 'l2cap_get_chan_by_scid(conn, cid).conn->lock' exclusively [-Wthread-safety-precise]
    7297 |                 l2cap_chan_ready(chan);
         |                 ^
   net/bluetooth/l2cap_core.c:7297:3: note: found near match 'conn->lock'
   net/bluetooth/l2cap_core.c:7735:4: warning: calling function 'l2cap_do_start' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    7735 |                         l2cap_do_start(chan);
         |                         ^
   net/bluetooth/l2cap_core.c:7735:4: note: found near match 'l2cap_conn_add(hcon).lock'
>> net/bluetooth/l2cap_core.c:7988:4: warning: calling function 'l2cap_check_encryption' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    7988 |                         l2cap_check_encryption(chan, encrypt);
         |                         ^
   net/bluetooth/l2cap_core.c:7988:4: note: found near match 'hcon->l2cap_data->lock'
   net/bluetooth/l2cap_core.c:7995:5: warning: calling function 'l2cap_start_connection' requires holding mutex 'chan->conn->lock' exclusively [-Wthread-safety-precise]
    7995 |                                 l2cap_start_connection(chan);
         |                                 ^
   net/bluetooth/l2cap_core.c:7995:5: note: found near match 'hcon->l2cap_data->lock'
   35 warnings generated.


vim +1663 net/bluetooth/l2cap_core.c

22121fc9152ca8f net/bluetooth/l2cap.c      Gustavo Padovan        2009-07-23  1648  
^1da177e4c3f415 net/bluetooth/l2cap.c      Linus Torvalds         2005-04-16  1649  /* ---- L2CAP connections ---- */
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1650  static void l2cap_conn_start(struct l2cap_conn *conn)
889dfdde79e27e0 net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1651  	__must_hold(&conn->lock)
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1652  {
3df91ea20e74434 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-21  1653  	struct l2cap_chan *chan, *tmp;
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1654  
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1655  	BT_DBG("conn %p", conn);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1656  
3df91ea20e74434 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-21  1657  	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1658  		l2cap_chan_lock(chan);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1659  
889dfdde79e27e0 net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1660  		lockdep_assert_held(&chan->conn->lock);
889dfdde79e27e0 net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1661  
715ec005cd10c5d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-05-02  1662  		if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED) {
aeaeb4bbca520b8 net/bluetooth/l2cap_core.c Johan Hedberg          2014-09-10 @1663  			l2cap_chan_ready(chan);
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1664  			l2cap_chan_unlock(chan);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1665  			continue;
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1666  		}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1667  
89bc500e41fc5b4 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-03  1668  		if (chan->state == BT_CONNECT) {
e7cafc45258c852 net/bluetooth/l2cap_core.c Johan Hedberg          2014-07-17  1669  			if (!l2cap_chan_check_security(chan, true) ||
b44500351845e4f net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-12  1670  			    !__l2cap_no_conn_pending(chan)) {
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1671  				l2cap_chan_unlock(chan);
47731de789749c9 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-09  1672  				continue;
47731de789749c9 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-09  1673  			}
47731de789749c9 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-09  1674  
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10  1675  			if (!l2cap_mode_supported(chan->mode, conn->feat_mask)
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10  1676  			    && test_bit(CONF_STATE2_DEVICE,
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10  1677  					&chan->conf_state)) {
608e0b7a675b2af net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29 @1678  				__l2cap_chan_close(chan, ECONNRESET);
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1679  				l2cap_chan_unlock(chan);
cf6c2c0b9f47ee3 net/bluetooth/l2cap.c      Gustavo Padovan        2010-06-07  1680  				continue;
cf6c2c0b9f47ee3 net/bluetooth/l2cap.c      Gustavo Padovan        2010-06-07  1681  			}
cf6c2c0b9f47ee3 net/bluetooth/l2cap.c      Gustavo Padovan        2010-06-07  1682  
7af8479d9eb4319 net/bluetooth/l2cap_core.c Luiz Augusto von Dentz 2025-05-07  1683  			if (l2cap_check_enc_key_size(conn->hcon, chan))
93c3e8f5c9a0e4d net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-09-27 @1684  				l2cap_start_connection(chan);
693cd8ce3f88252 net/bluetooth/l2cap_core.c Marcel Holtmann        2019-06-22  1685  			else
608e0b7a675b2af net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1686  				__l2cap_chan_close(chan, ECONNREFUSED);
47731de789749c9 net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-09  1687  
89bc500e41fc5b4 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-03  1688  		} else if (chan->state == BT_CONNECT2) {
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1689  			struct l2cap_conn_rsp rsp;
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1690  			char buf[128];
fe4128e0aabc3c7 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-13  1691  			rsp.scid = cpu_to_le16(chan->dcid);
fe4128e0aabc3c7 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-04-13  1692  			rsp.dcid = cpu_to_le16(chan->scid);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1693  
e7cafc45258c852 net/bluetooth/l2cap_core.c Johan Hedberg          2014-07-17  1694  			if (l2cap_chan_check_security(chan, false)) {
bdc257830760a78 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-14  1695  				if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1696  					rsp.result = cpu_to_le16(L2CAP_CR_PEND);
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1697  					rsp.status = cpu_to_le16(L2CAP_CS_AUTHOR_PEND);
2dc4e5105f012bd net/bluetooth/l2cap_core.c Gustavo Padovan        2012-10-12  1698  					chan->ops->defer(chan);
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15  1699  
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15  1700  				} else {
acdcabf532908fb net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-21  1701  					l2cap_state_change(chan, BT_CONFIG);
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1702  					rsp.result = cpu_to_le16(L2CAP_CR_SUCCESS);
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1703  					rsp.status = cpu_to_le16(L2CAP_CS_NO_INFO);
f66dc81f44d918e net/bluetooth/l2cap.c      Marcel Holtmann        2009-01-15  1704  				}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1705  			} else {
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1706  				rsp.result = cpu_to_le16(L2CAP_CR_PEND);
dcf4adbfdc7ad14 net/bluetooth/l2cap_core.c Joe Perches            2014-03-12  1707  				rsp.status = cpu_to_le16(L2CAP_CS_AUTHEN_PEND);
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1708  			}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1709  
fc7f8a7ed454385 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25  1710  			l2cap_send_cmd(conn, chan->ident, L2CAP_CONN_RSP,
fc7f8a7ed454385 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25  1711  				       sizeof(rsp), &rsp);
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1712  
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10  1713  			if (test_bit(CONF_REQ_SENT, &chan->conf_state) ||
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1714  			    rsp.result != L2CAP_CR_SUCCESS) {
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1715  				l2cap_chan_unlock(chan);
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1716  				continue;
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1717  			}
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1718  
c1360a1cf35117d net/bluetooth/l2cap_core.c Gustavo Padovan        2011-06-10  1719  			set_bit(CONF_REQ_SENT, &chan->conf_state);
e9aeb2ddd441f0c net/bluetooth/l2cap.c      Gustavo Padovan        2010-07-08  1720  			l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_CONF_REQ,
e860d2c904d1a9f net/bluetooth/l2cap_core.c Ben Seri               2017-09-09  1721  				       l2cap_build_conf_req(chan, buf, sizeof(buf)), buf);
73ffa904b78287f net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25  1722  			chan->num_conf_req++;
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1723  		}
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1724  
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1725  		l2cap_chan_unlock(chan);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1726  	}
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1727  }
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1728  
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1729  static void l2cap_le_conn_ready(struct l2cap_conn *conn)
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1730  {
cc8dba2bc302442 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-18  1731  	struct hci_conn *hcon = conn->hcon;
dcc36c16c2f1c98 net/bluetooth/l2cap_core.c Johan Hedberg          2014-07-09  1732  	struct hci_dev *hdev = hcon->hdev;
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1733  
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1734  	BT_DBG("%s conn %p", hdev->name, conn);
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1735  
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1736  	/* For outgoing pairing which doesn't necessarily have an
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1737  	 * associated socket (e.g. mgmt_pair_device).
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1738  	 */
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1739  	if (hcon->out)
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1740  		smp_conn_security(hcon, hcon->pending_sec_level);
cc8dba2bc302442 net/bluetooth/l2cap_core.c Marcel Holtmann        2013-10-18  1741  
74be523ce6bed05 net/bluetooth/l2cap_core.c Archie Pusaka          2021-06-04  1742  	/* For LE peripheral connections, make sure the connection interval
5153ceb9e622f4e net/bluetooth/l2cap_core.c Bhaskar Chowdhury      2021-03-25  1743  	 * is in the range of the minimum and maximum interval that has
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1744  	 * been configured for this connection. If not, then trigger
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1745  	 * the connection update procedure.
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1746  	 */
40bef302f6323d1 net/bluetooth/l2cap_core.c Johan Hedberg          2014-07-16  1747  	if (hcon->role == HCI_ROLE_SLAVE &&
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1748  	    (hcon->le_conn_interval < hcon->le_conn_min_interval ||
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1749  	     hcon->le_conn_interval > hcon->le_conn_max_interval)) {
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1750  		struct l2cap_conn_param_update_req req;
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1751  
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1752  		req.min = cpu_to_le16(hcon->le_conn_min_interval);
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1753  		req.max = cpu_to_le16(hcon->le_conn_max_interval);
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1754  		req.latency = cpu_to_le16(hcon->le_conn_latency);
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1755  		req.to_multiplier = cpu_to_le16(hcon->le_supv_timeout);
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1756  
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1757  		l2cap_send_cmd(conn, l2cap_get_ident(conn),
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1758  			       L2CAP_CONN_PARAM_UPDATE_REQ, sizeof(req), &req);
80afeb6cec3739d net/bluetooth/l2cap_core.c Marcel Holtmann        2014-06-23  1759  	}
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1760  }
b62f328b8f20abe net/bluetooth/l2cap_core.c Ville Tervo            2011-02-10  1761  
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1762  static void l2cap_conn_ready(struct l2cap_conn *conn)
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1763  {
48454079c2d4b9e net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25  1764  	struct l2cap_chan *chan;
cc110922da7e902 net/bluetooth/l2cap_core.c Vinicius Costa Gomes   2012-08-23  1765  	struct hci_conn *hcon = conn->hcon;
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1766  
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1767  	BT_DBG("conn %p", conn);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1768  
aeaeb4bbca520b8 net/bluetooth/l2cap_core.c Johan Hedberg          2014-09-10  1769  	if (hcon->type == ACL_LINK)
aeaeb4bbca520b8 net/bluetooth/l2cap_core.c Johan Hedberg          2014-09-10  1770  		l2cap_request_info(conn);
aeaeb4bbca520b8 net/bluetooth/l2cap_core.c Johan Hedberg          2014-09-10  1771  
ab4eedb790cae44 net/bluetooth/l2cap_core.c Luiz Augusto von Dentz 2025-02-06  1772  	mutex_lock(&conn->lock);
e760ec12134d573 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-07  1773  
3df91ea20e74434 net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-21  1774  	list_for_each_entry(chan, &conn->chan_l, list) {
baa7e1fa6d28704 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-31  1775  
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1776  		l2cap_chan_lock(chan);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1777  
889dfdde79e27e0 net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1778  		lockdep_assert_held(&chan->conn->lock);
889dfdde79e27e0 net/bluetooth/l2cap_core.c Pauli Virtanen         2026-08-29  1779  
cc110922da7e902 net/bluetooth/l2cap_core.c Vinicius Costa Gomes   2012-08-23  1780  		if (hcon->type == LE_LINK) {
f1496dee9cbde2a net/bluetooth/l2cap_core.c Johan Hedberg          2013-05-13 @1781  			l2cap_le_start(chan);
6312845169e8719 net/bluetooth/l2cap_core.c Vinicius Costa Gomes   2011-06-17  1782  		} else if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED) {
aeaeb4bbca520b8 net/bluetooth/l2cap_core.c Johan Hedberg          2014-09-10  1783  			if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_DONE)
74e7574066e020d net/bluetooth/l2cap_core.c Gustavo Padovan        2013-10-15  1784  				l2cap_chan_ready(chan);
1c244f79c0d6abf net/bluetooth/l2cap_core.c Gustavo Padovan        2012-12-07  1785  		} else if (chan->state == BT_CONNECT) {
fc7f8a7ed454385 net/bluetooth/l2cap_core.c Gustavo Padovan        2011-03-25 @1786  			l2cap_do_start(chan);
1c244f79c0d6abf net/bluetooth/l2cap_core.c Gustavo Padovan        2012-12-07  1787  		}
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1788  
6be3655552ee49a net/bluetooth/l2cap_core.c Andrei Emeltchenko     2012-02-22  1789  		l2cap_chan_unlock(chan);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1790  	}
79d554a6976a295 net/bluetooth/l2cap.c      Marcel Holtmann        2008-07-14  1791  
ab4eedb790cae44 net/bluetooth/l2cap_core.c Luiz Augusto von Dentz 2025-02-06  1792  	mutex_unlock(&conn->lock);
61a939c68ee033d net/bluetooth/l2cap_core.c Johan Hedberg          2014-01-17  1793  
79a0572736ad4b9 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-08  1794  	if (hcon->type == LE_LINK)
79a0572736ad4b9 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-08  1795  		l2cap_le_conn_ready(conn);
79a0572736ad4b9 net/bluetooth/l2cap_core.c Johan Hedberg          2014-08-08  1796  
61a939c68ee033d net/bluetooth/l2cap_core.c Johan Hedberg          2014-01-17  1797  	queue_work(hcon->hdev->workqueue, &conn->pending_rx_work);
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1798  }
4e8402a3f884427 net/bluetooth/l2cap.c      Marcel Holtmann        2007-10-20  1799  

:::::: The code at line 1663 was first introduced by commit
:::::: aeaeb4bbca520b862d3b3e7cd74c23042815a160 Bluetooth: Fix L2CAP information request handling for fixed channels

:::::: TO: Johan Hedberg <johan.hedberg@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
