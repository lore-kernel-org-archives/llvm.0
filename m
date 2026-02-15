Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3B199E94;
	Sun, 15 Feb 2026 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771130298; cv=none; b=W6n5HMDR8Q1axQC4Cv6+8LbWh2RWEurciY6OI3HdvoxUIpjn6IvKBymi1lHGBhLttjC7mg1LL80RZeyKq82Wfc3z0XM9V3jjE0mrBHrvFq4RiHKBOBuosFG2IwfUoezzFAJCTzWTIfkZgOvzompBWZt/a9ygXUNKJdsJWF9g/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771130298; c=relaxed/simple;
	bh=IOHZDqzGlOj5FKqzh2vYIIxqTX4vZM/Qx6T83Fnk9Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXx9chNkYwSKAhl6gSQRVG59JHUhmlF54yiExpleDodm4VXTslzhasBGusyGlpWLu9xKvni2lnpMJQ+xB0DIWX30Sflf60y8tXsaEBCmyRBJMb25t1KUuX7SGnzNPxhEF7cvUaj22YbwdWEWonsIr+DjdTTuUla81C9V5QCYGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNQwfmgW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNQwfmgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771130297; x=1802666297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IOHZDqzGlOj5FKqzh2vYIIxqTX4vZM/Qx6T83Fnk9Vs=;
  b=RNQwfmgWX371ZCjDqWLJH6NWOeQ0iboUpNZKAoRYUfabNdfhzLl+Yg48
   zjmJBQBgzTPC6hofK6iYNe4PkU1vxPlVpntMjaBDItGRcjf0egm7ryPBL
   x+jlHCk5nfAjBbR3YFhwg6yW+sthhWIoSbyyEe697+9WRp5iJqhQ4TjWi
   Zvg/NetrYicgBFDEWeGqdj9GQyltxmBtX/CZyqhOCAuNZ63JMpcYAuzPo
   4k+UsuVQqqPIn8PleB1eKr8CBAt+OmkKNKIN8F8NZJdIHm0TGTuHoEaiD
   Hn3xAMy6L3qBDZM/WEEny4+PESJoO+50Sk49dijk+469cGyYvSfChAKmE
   w==;
X-CSE-ConnectionGUID: D1wKfZvvTiukhgvp4HYvBA==
X-CSE-MsgGUID: 9ZHdXGhpTACLGAhrIHEw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72302921"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72302921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 20:38:14 -0800
X-CSE-ConnectionGUID: BzrQrbk5R3WQ2AkzGB8gYg==
X-CSE-MsgGUID: 9MtltZT9S+W6+ZkSMJ80pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213122803"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2026 20:38:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrTtb-00000000xQS-0ocs;
	Sun, 15 Feb 2026 04:38:11 +0000
Date: Sun, 15 Feb 2026 12:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
Message-ID: <202602151243.pv13LBdT-lkp@intel.com>
References: <20260213100736.2914690-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213100736.2914690-3-guanyulin@google.com>

Hi Guan-Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guan-Yu-Lin/usb-offload-move-device-locking-to-callers-in-offload-c/20260213-181132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260213100736.2914690-3-guanyulin%40google.com
patch subject: [RFC PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260215/202602151243.pv13LBdT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151243.pv13LBdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151243.pv13LBdT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/usb/qcom/qc_audio_offload.c:1608:4: error: cannot jump from this goto statement to its label
    1608 |                         goto response;
         |                         ^
   sound/usb/qcom/qc_audio_offload.c:1616:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1616 |         guard(device)(&udev->dev);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:78:1: note: expanded from here
      78 | __UNIQUE_ID_guard_609
         | ^
   sound/usb/qcom/qc_audio_offload.c:1598:5: error: cannot jump from this goto statement to its label
    1598 |                                 goto response;
         |                                 ^
   sound/usb/qcom/qc_audio_offload.c:1616:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1616 |         guard(device)(&udev->dev);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:78:1: note: expanded from here
      78 | __UNIQUE_ID_guard_609
         | ^
   sound/usb/qcom/qc_audio_offload.c:1591:3: error: cannot jump from this goto statement to its label
    1591 |                 goto response;
         |                 ^
   sound/usb/qcom/qc_audio_offload.c:1616:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1616 |         guard(device)(&udev->dev);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:78:1: note: expanded from here
      78 | __UNIQUE_ID_guard_609
         | ^
   sound/usb/qcom/qc_audio_offload.c:1583:3: error: cannot jump from this goto statement to its label
    1583 |                 goto response;
         |                 ^
   sound/usb/qcom/qc_audio_offload.c:1616:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1616 |         guard(device)(&udev->dev);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:78:1: note: expanded from here
      78 | __UNIQUE_ID_guard_609
         | ^
   sound/usb/qcom/qc_audio_offload.c:1576:3: error: cannot jump from this goto statement to its label
    1576 |                 goto response;
         |                 ^
   sound/usb/qcom/qc_audio_offload.c:1616:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1616 |         guard(device)(&udev->dev);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b


vim +1608 sound/usb/qcom/qc_audio_offload.c

326bbc348298ab Wesley Cheng 2025-04-09  1516  
326bbc348298ab Wesley Cheng 2025-04-09  1517  /**
326bbc348298ab Wesley Cheng 2025-04-09  1518   * handle_uaudio_stream_req() - handle stream enable/disable request
326bbc348298ab Wesley Cheng 2025-04-09  1519   * @handle: QMI client handle
326bbc348298ab Wesley Cheng 2025-04-09  1520   * @sq: qrtr socket
326bbc348298ab Wesley Cheng 2025-04-09  1521   * @txn: QMI transaction context
326bbc348298ab Wesley Cheng 2025-04-09  1522   * @decoded_msg: decoded QMI message
326bbc348298ab Wesley Cheng 2025-04-09  1523   *
326bbc348298ab Wesley Cheng 2025-04-09  1524   * Main handler for the QMI stream enable/disable requests.  This executes the
326bbc348298ab Wesley Cheng 2025-04-09  1525   * corresponding enable/disable stream apis, respectively.
326bbc348298ab Wesley Cheng 2025-04-09  1526   *
326bbc348298ab Wesley Cheng 2025-04-09  1527   */
326bbc348298ab Wesley Cheng 2025-04-09  1528  static void handle_uaudio_stream_req(struct qmi_handle *handle,
326bbc348298ab Wesley Cheng 2025-04-09  1529  				     struct sockaddr_qrtr *sq,
326bbc348298ab Wesley Cheng 2025-04-09  1530  				     struct qmi_txn *txn,
326bbc348298ab Wesley Cheng 2025-04-09  1531  				     const void *decoded_msg)
326bbc348298ab Wesley Cheng 2025-04-09  1532  {
326bbc348298ab Wesley Cheng 2025-04-09  1533  	struct qmi_uaudio_stream_req_msg_v01 *req_msg;
326bbc348298ab Wesley Cheng 2025-04-09  1534  	struct qmi_uaudio_stream_resp_msg_v01 resp = {{0}, 0};
326bbc348298ab Wesley Cheng 2025-04-09  1535  	struct uaudio_qmi_svc *svc = uaudio_svc;
326bbc348298ab Wesley Cheng 2025-04-09  1536  	struct snd_usb_audio *chip = NULL;
326bbc348298ab Wesley Cheng 2025-04-09  1537  	struct snd_usb_substream *subs;
326bbc348298ab Wesley Cheng 2025-04-09  1538  	struct usb_host_endpoint *ep;
326bbc348298ab Wesley Cheng 2025-04-09  1539  	int datainterval = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1540  	int info_idx = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1541  	struct intf_info *info;
326bbc348298ab Wesley Cheng 2025-04-09  1542  	u8 pcm_card_num;
326bbc348298ab Wesley Cheng 2025-04-09  1543  	u8 pcm_dev_num;
326bbc348298ab Wesley Cheng 2025-04-09  1544  	u8 direction;
0357ca53e65e90 Guan-Yu Lin  2026-02-13  1545  	struct usb_device *udev = NULL;
326bbc348298ab Wesley Cheng 2025-04-09  1546  	int ret = 0;
326bbc348298ab Wesley Cheng 2025-04-09  1547  
326bbc348298ab Wesley Cheng 2025-04-09  1548  	if (!svc->client_connected) {
326bbc348298ab Wesley Cheng 2025-04-09  1549  		svc->client_sq = *sq;
326bbc348298ab Wesley Cheng 2025-04-09  1550  		svc->client_connected = true;
326bbc348298ab Wesley Cheng 2025-04-09  1551  	}
326bbc348298ab Wesley Cheng 2025-04-09  1552  
326bbc348298ab Wesley Cheng 2025-04-09  1553  	mutex_lock(&qdev_mutex);
326bbc348298ab Wesley Cheng 2025-04-09  1554  	req_msg = (struct qmi_uaudio_stream_req_msg_v01 *)decoded_msg;
326bbc348298ab Wesley Cheng 2025-04-09  1555  	if (!req_msg->audio_format_valid || !req_msg->bit_rate_valid ||
326bbc348298ab Wesley Cheng 2025-04-09  1556  	    !req_msg->number_of_ch_valid || !req_msg->xfer_buff_size_valid) {
326bbc348298ab Wesley Cheng 2025-04-09  1557  		ret = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1558  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1559  	}
326bbc348298ab Wesley Cheng 2025-04-09  1560  
326bbc348298ab Wesley Cheng 2025-04-09  1561  	if (!uaudio_qdev) {
326bbc348298ab Wesley Cheng 2025-04-09  1562  		ret = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1563  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1564  	}
326bbc348298ab Wesley Cheng 2025-04-09  1565  
326bbc348298ab Wesley Cheng 2025-04-09  1566  	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
326bbc348298ab Wesley Cheng 2025-04-09  1567  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
326bbc348298ab Wesley Cheng 2025-04-09  1568  	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
326bbc348298ab Wesley Cheng 2025-04-09  1569  	if (pcm_card_num >= SNDRV_CARDS) {
326bbc348298ab Wesley Cheng 2025-04-09  1570  		ret = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1571  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1572  	}
326bbc348298ab Wesley Cheng 2025-04-09  1573  
326bbc348298ab Wesley Cheng 2025-04-09  1574  	if (req_msg->audio_format > USB_QMI_PCM_FORMAT_U32_BE) {
326bbc348298ab Wesley Cheng 2025-04-09  1575  		ret = -EINVAL;
326bbc348298ab Wesley Cheng 2025-04-09  1576  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1577  	}
326bbc348298ab Wesley Cheng 2025-04-09  1578  
326bbc348298ab Wesley Cheng 2025-04-09  1579  	subs = find_substream(pcm_card_num, pcm_dev_num, direction);
326bbc348298ab Wesley Cheng 2025-04-09  1580  	chip = uadev[pcm_card_num].chip;
326bbc348298ab Wesley Cheng 2025-04-09  1581  	if (!subs || !chip || atomic_read(&chip->shutdown)) {
326bbc348298ab Wesley Cheng 2025-04-09  1582  		ret = -ENODEV;
326bbc348298ab Wesley Cheng 2025-04-09  1583  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1584  	}
326bbc348298ab Wesley Cheng 2025-04-09  1585  
326bbc348298ab Wesley Cheng 2025-04-09  1586  	info_idx = info_idx_from_ifnum(pcm_card_num, subs->cur_audiofmt ?
326bbc348298ab Wesley Cheng 2025-04-09  1587  			subs->cur_audiofmt->iface : -1, req_msg->enable);
326bbc348298ab Wesley Cheng 2025-04-09  1588  	if (atomic_read(&chip->shutdown) || !subs->stream || !subs->stream->pcm ||
326bbc348298ab Wesley Cheng 2025-04-09  1589  	    !subs->stream->chip) {
326bbc348298ab Wesley Cheng 2025-04-09  1590  		ret = -ENODEV;
326bbc348298ab Wesley Cheng 2025-04-09  1591  		goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1592  	}
326bbc348298ab Wesley Cheng 2025-04-09  1593  
e5d3eeb4261a3a Takashi Iwai 2025-08-29  1594  	scoped_guard(mutex, &chip->mutex) {
326bbc348298ab Wesley Cheng 2025-04-09  1595  		if (req_msg->enable) {
6a348e9236c336 Wesley Cheng 2025-04-09  1596  			if (info_idx < 0 || chip->system_suspend || subs->opened) {
326bbc348298ab Wesley Cheng 2025-04-09  1597  				ret = -EBUSY;
326bbc348298ab Wesley Cheng 2025-04-09  1598  				goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1599  			}
6a348e9236c336 Wesley Cheng 2025-04-09  1600  			subs->opened = 1;
326bbc348298ab Wesley Cheng 2025-04-09  1601  		}
e5d3eeb4261a3a Takashi Iwai 2025-08-29  1602  	}
326bbc348298ab Wesley Cheng 2025-04-09  1603  
326bbc348298ab Wesley Cheng 2025-04-09  1604  	if (req_msg->service_interval_valid) {
326bbc348298ab Wesley Cheng 2025-04-09  1605  		ret = get_data_interval_from_si(subs,
326bbc348298ab Wesley Cheng 2025-04-09  1606  						req_msg->service_interval);
326bbc348298ab Wesley Cheng 2025-04-09  1607  		if (ret == -EINVAL)
326bbc348298ab Wesley Cheng 2025-04-09 @1608  			goto response;
326bbc348298ab Wesley Cheng 2025-04-09  1609  
326bbc348298ab Wesley Cheng 2025-04-09  1610  		datainterval = ret;
326bbc348298ab Wesley Cheng 2025-04-09  1611  	}
326bbc348298ab Wesley Cheng 2025-04-09  1612  
326bbc348298ab Wesley Cheng 2025-04-09  1613  	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
326bbc348298ab Wesley Cheng 2025-04-09  1614  
0357ca53e65e90 Guan-Yu Lin  2026-02-13  1615  	udev = subs->dev;
0357ca53e65e90 Guan-Yu Lin  2026-02-13  1616  	guard(device)(&udev->dev);
326bbc348298ab Wesley Cheng 2025-04-09  1617  	if (req_msg->enable) {
326bbc348298ab Wesley Cheng 2025-04-09  1618  		ret = enable_audio_stream(subs,
326bbc348298ab Wesley Cheng 2025-04-09  1619  					  map_pcm_format(req_msg->audio_format),
326bbc348298ab Wesley Cheng 2025-04-09  1620  					  req_msg->number_of_ch, req_msg->bit_rate,
326bbc348298ab Wesley Cheng 2025-04-09  1621  					  datainterval);
326bbc348298ab Wesley Cheng 2025-04-09  1622  
326bbc348298ab Wesley Cheng 2025-04-09  1623  		if (!ret)
326bbc348298ab Wesley Cheng 2025-04-09  1624  			ret = prepare_qmi_response(subs, req_msg, &resp,
326bbc348298ab Wesley Cheng 2025-04-09  1625  						   info_idx);
6a348e9236c336 Wesley Cheng 2025-04-09  1626  		if (ret < 0) {
e5d3eeb4261a3a Takashi Iwai 2025-08-29  1627  			guard(mutex)(&chip->mutex);
6a348e9236c336 Wesley Cheng 2025-04-09  1628  			subs->opened = 0;
6a348e9236c336 Wesley Cheng 2025-04-09  1629  		}
326bbc348298ab Wesley Cheng 2025-04-09  1630  	} else {
326bbc348298ab Wesley Cheng 2025-04-09  1631  		info = &uadev[pcm_card_num].info[info_idx];
326bbc348298ab Wesley Cheng 2025-04-09  1632  		if (info->data_ep_pipe) {
326bbc348298ab Wesley Cheng 2025-04-09  1633  			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
326bbc348298ab Wesley Cheng 2025-04-09  1634  					       info->data_ep_pipe);
326bbc348298ab Wesley Cheng 2025-04-09  1635  			if (ep) {
326bbc348298ab Wesley Cheng 2025-04-09  1636  				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
326bbc348298ab Wesley Cheng 2025-04-09  1637  							    ep);
326bbc348298ab Wesley Cheng 2025-04-09  1638  				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
326bbc348298ab Wesley Cheng 2025-04-09  1639  							      ep);
326bbc348298ab Wesley Cheng 2025-04-09  1640  			}
326bbc348298ab Wesley Cheng 2025-04-09  1641  
326bbc348298ab Wesley Cheng 2025-04-09  1642  			info->data_ep_pipe = 0;
326bbc348298ab Wesley Cheng 2025-04-09  1643  		}
326bbc348298ab Wesley Cheng 2025-04-09  1644  
326bbc348298ab Wesley Cheng 2025-04-09  1645  		if (info->sync_ep_pipe) {
326bbc348298ab Wesley Cheng 2025-04-09  1646  			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
326bbc348298ab Wesley Cheng 2025-04-09  1647  					       info->sync_ep_pipe);
326bbc348298ab Wesley Cheng 2025-04-09  1648  			if (ep) {
326bbc348298ab Wesley Cheng 2025-04-09  1649  				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
326bbc348298ab Wesley Cheng 2025-04-09  1650  							    ep);
326bbc348298ab Wesley Cheng 2025-04-09  1651  				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
326bbc348298ab Wesley Cheng 2025-04-09  1652  							      ep);
326bbc348298ab Wesley Cheng 2025-04-09  1653  			}
326bbc348298ab Wesley Cheng 2025-04-09  1654  
326bbc348298ab Wesley Cheng 2025-04-09  1655  			info->sync_ep_pipe = 0;
326bbc348298ab Wesley Cheng 2025-04-09  1656  		}
326bbc348298ab Wesley Cheng 2025-04-09  1657  
326bbc348298ab Wesley Cheng 2025-04-09  1658  		disable_audio_stream(subs);
e5d3eeb4261a3a Takashi Iwai 2025-08-29  1659  		guard(mutex)(&chip->mutex);
6a348e9236c336 Wesley Cheng 2025-04-09  1660  		subs->opened = 0;
326bbc348298ab Wesley Cheng 2025-04-09  1661  	}
326bbc348298ab Wesley Cheng 2025-04-09  1662  
326bbc348298ab Wesley Cheng 2025-04-09  1663  response:
326bbc348298ab Wesley Cheng 2025-04-09  1664  	if (!req_msg->enable && ret != -EINVAL && ret != -ENODEV) {
e5d3eeb4261a3a Takashi Iwai 2025-08-29  1665  		guard(mutex)(&chip->mutex);
326bbc348298ab Wesley Cheng 2025-04-09  1666  		if (info_idx >= 0) {
326bbc348298ab Wesley Cheng 2025-04-09  1667  			info = &uadev[pcm_card_num].info[info_idx];
326bbc348298ab Wesley Cheng 2025-04-09  1668  			uaudio_dev_intf_cleanup(uadev[pcm_card_num].udev,
326bbc348298ab Wesley Cheng 2025-04-09  1669  						info);
326bbc348298ab Wesley Cheng 2025-04-09  1670  		}
326bbc348298ab Wesley Cheng 2025-04-09  1671  		if (atomic_read(&uadev[pcm_card_num].in_use))
326bbc348298ab Wesley Cheng 2025-04-09  1672  			kref_put(&uadev[pcm_card_num].kref,
326bbc348298ab Wesley Cheng 2025-04-09  1673  				 uaudio_dev_release);
326bbc348298ab Wesley Cheng 2025-04-09  1674  	}
326bbc348298ab Wesley Cheng 2025-04-09  1675  	mutex_unlock(&qdev_mutex);
326bbc348298ab Wesley Cheng 2025-04-09  1676  
326bbc348298ab Wesley Cheng 2025-04-09  1677  	resp.usb_token = req_msg->usb_token;
326bbc348298ab Wesley Cheng 2025-04-09  1678  	resp.usb_token_valid = 1;
326bbc348298ab Wesley Cheng 2025-04-09  1679  	resp.internal_status = ret;
326bbc348298ab Wesley Cheng 2025-04-09  1680  	resp.internal_status_valid = 1;
326bbc348298ab Wesley Cheng 2025-04-09  1681  	resp.status = ret ? USB_QMI_STREAM_REQ_FAILURE_V01 : ret;
326bbc348298ab Wesley Cheng 2025-04-09  1682  	resp.status_valid = 1;
326bbc348298ab Wesley Cheng 2025-04-09  1683  	ret = qmi_send_response(svc->uaudio_svc_hdl, sq, txn,
326bbc348298ab Wesley Cheng 2025-04-09  1684  				QMI_UAUDIO_STREAM_RESP_V01,
326bbc348298ab Wesley Cheng 2025-04-09  1685  				QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN,
326bbc348298ab Wesley Cheng 2025-04-09  1686  				qmi_uaudio_stream_resp_msg_v01_ei, &resp);
326bbc348298ab Wesley Cheng 2025-04-09  1687  }
326bbc348298ab Wesley Cheng 2025-04-09  1688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
