Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499584;
	b=wKKjJs1IL5Xf/7XlxmlE7kJdcDy1gN0ayMAFOnnnPBaEy6Tgliybn1Su4TfXqa1XxsNG
	 8yOzjhkox9ydAkfuuMt7jVK1P5MNLuTpR2O74HobEFoGGdrJAs6gdscYFAsMrNAL/Fzw3
	 iTIaqqdN9u7fWU78VblyrzsJKF85oZg1QrEieG6+Xub0khiAKUXOCKcAIQCffWEeFhDCv
	 TxKh3TZkcqTRtEYl4xrVsdAjxyihoWCN6+yOx92qrdpDsL1H4xO6YHL2TsK6oyCOYowAz
	 gHvNY7BB2RUmbgygjD1Q3zeysRmsUnW6HXH64E5b6VLRMQ6XHXCIRSXuDcvTl7oDMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3l+OQc0sj7Cqms0QiG56zxl/FKhVTfg+wB/xoAJPbMA=;
	b=3XOwpSzaGSNumC0ekuSLdF8ZlGA0D/f+nkNPFd3zgA75S7x2JpEvuVSeVV+ha0Ou/2LH
	 6FGeW4wSO+c5+MnPbxlxsXWifCnSUywL+Jixc5VpAHX4AUQq6WGSb+M/RGPq1/gOwi1kl
	 mFiFLskPOJKIxKjhjsZ15ip8Mr1i+v2rpncaMamBNqO0XnZ8yWAVepCDAV8sgEHlAcYIZ
	 Sc1D5D7Vh9dQ3nd3R0in3azI+C9iPh8knrqitM3ghlJ6bGvOyuBisKTU3cNJX7It4VXyd
	 5S5DalPy/GPEc+IcslINz5reWErbC/WXuuuyS+cQ7KLMlmq76mPbqCuXQjsfspQ7ejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOyDWUux;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A77606A331;
	Thu, 12 Nov 2026 16:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A77606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOyDWUux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794499585; x=1826035585;
  h=date:from:to:cc:subject:message-id;
  bh=KG15XREHPQl3eGAflNNpwQhr+nUda6Lpeg33e6DxBS4=;
  b=OOyDWUuxTue7slxbVG4XnjYJSZPqMu19iUy2gD0mrFslk05JTaorLs6K
   TpszUngNfFhIUOfXv6P+3qWlGRzUNYaAVLkZ19ZbNeZC5XeKtDn5T2AiM
   Gw+HvgHShyUuzmYzRzNFaTGaMx1aw0IAQIr1BLdBYRBgt+Egv/juXMO2l
   LXVpN/g97c3+nEbSFBdlEteSYXjXrwVNZgQqIzaKsnMKO02SyjmkBTPIa
   SM8A5B0DWQdvMq6DRPhYP1zPvG1XoH9H/k8Tg2cAXo9pKnMCowrvu1z/M
   Siv2SbQDRf1J75gbcVt1EU8zbUPS9tp7wygra1z5p3/yf/3tJaBHMGQUB
   g==;
X-CSE-ConnectionGUID: Y2yppC5GTbW6Jw6KNN6K0A==
X-CSE-MsgGUID: mlIkKvnnTq+hn8KFk6zVdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3287573"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3287573"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:06:24 -0800
X-CSE-ConnectionGUID: UaPmiAp7Rji80FbtkPHIYQ==
X-CSE-MsgGUID: U0anjnn/Roa6sWDTcmavIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8565473"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2026 08:06:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXJb-000000011gj-2vml;
	Thu, 12 Nov 2026 16:06:19 +0000
Date: Fri, 13 Nov 2026 00:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 441/444]
 net/bluetooth/hidp/core.c:318:2: warning: releasing mutex
 'hid->driver_data->report_mutex' that was not held
Message-ID: <202611122321.CxbSh9MK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   31d2f6adb5d0feeb2be269c03dc5bb6245e05a88
commit: 3d606dbf0b3cbf6ee5188f36136fc48d9a7f4182 [441/444] treewide: Annotate interruptible and killable locks with range acquire
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611122321.CxbSh9MK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c628d639fc66f8e6d8ab1f0cc6b1df38f974e020)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122321.CxbSh9MK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122321.CxbSh9MK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/hidp/core.c:318:2: warning: releasing mutex 'hid->driver_data->report_mutex' that was not held [-Wthread-safety-analysis]
     318 |         mutex_unlock(&session->report_mutex);
         |         ^
   net/bluetooth/hidp/core.c:324:2: warning: releasing mutex 'hid->driver_data->report_mutex' that was not held [-Wthread-safety-analysis]
     324 |         mutex_unlock(&session->report_mutex);
         |         ^
   net/bluetooth/hidp/core.c:389:2: warning: releasing mutex 'hid->driver_data->report_mutex' that was not held [-Wthread-safety-analysis]
     389 |         mutex_unlock(&session->report_mutex);
         |         ^
   3 warnings generated.


vim +318 net/bluetooth/hidp/core.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  242  
0ff1731a1ae51e Alan Ott         2011-01-18  243  static int hidp_get_raw_report(struct hid_device *hid,
0ff1731a1ae51e Alan Ott         2011-01-18  244  		unsigned char report_number,
0ff1731a1ae51e Alan Ott         2011-01-18  245  		unsigned char *data, size_t count,
0ff1731a1ae51e Alan Ott         2011-01-18  246  		unsigned char report_type)
0ff1731a1ae51e Alan Ott         2011-01-18  247  {
0ff1731a1ae51e Alan Ott         2011-01-18  248  	struct hidp_session *session = hid->driver_data;
0ff1731a1ae51e Alan Ott         2011-01-18  249  	struct sk_buff *skb;
0ff1731a1ae51e Alan Ott         2011-01-18  250  	size_t len;
0ff1731a1ae51e Alan Ott         2011-01-18  251  	int numbered_reports = hid->report_enum[report_type].numbered;
794d175698f0e7 David Rheinsberg 2011-08-26  252  	int ret;
0ff1731a1ae51e Alan Ott         2011-01-18  253  
fd86c9becc1154 Karl Relton      2013-02-20  254  	if (atomic_read(&session->terminate))
fd86c9becc1154 Karl Relton      2013-02-20  255  		return -EIO;
fd86c9becc1154 Karl Relton      2013-02-20  256  
0ff1731a1ae51e Alan Ott         2011-01-18  257  	switch (report_type) {
0ff1731a1ae51e Alan Ott         2011-01-18  258  	case HID_FEATURE_REPORT:
0ff1731a1ae51e Alan Ott         2011-01-18  259  		report_type = HIDP_TRANS_GET_REPORT | HIDP_DATA_RTYPE_FEATURE;
0ff1731a1ae51e Alan Ott         2011-01-18  260  		break;
0ff1731a1ae51e Alan Ott         2011-01-18  261  	case HID_INPUT_REPORT:
0ff1731a1ae51e Alan Ott         2011-01-18  262  		report_type = HIDP_TRANS_GET_REPORT | HIDP_DATA_RTYPE_INPUT;
0ff1731a1ae51e Alan Ott         2011-01-18  263  		break;
0ff1731a1ae51e Alan Ott         2011-01-18  264  	case HID_OUTPUT_REPORT:
0ff1731a1ae51e Alan Ott         2011-01-18  265  		report_type = HIDP_TRANS_GET_REPORT | HIDP_DATA_RTYPE_OUPUT;
0ff1731a1ae51e Alan Ott         2011-01-18  266  		break;
0ff1731a1ae51e Alan Ott         2011-01-18  267  	default:
0ff1731a1ae51e Alan Ott         2011-01-18  268  		return -EINVAL;
0ff1731a1ae51e Alan Ott         2011-01-18  269  	}
0ff1731a1ae51e Alan Ott         2011-01-18  270  
0ff1731a1ae51e Alan Ott         2011-01-18  271  	if (mutex_lock_interruptible(&session->report_mutex))
0ff1731a1ae51e Alan Ott         2011-01-18  272  		return -ERESTARTSYS;
0ff1731a1ae51e Alan Ott         2011-01-18  273  
0ff1731a1ae51e Alan Ott         2011-01-18  274  	/* Set up our wait, and send the report request to the device. */
0ff1731a1ae51e Alan Ott         2011-01-18  275  	session->waiting_report_type = report_type & HIDP_DATA_RTYPE_MASK;
0ff1731a1ae51e Alan Ott         2011-01-18  276  	session->waiting_report_number = numbered_reports ? report_number : -1;
0ff1731a1ae51e Alan Ott         2011-01-18  277  	set_bit(HIDP_WAITING_FOR_RETURN, &session->flags);
0ff1731a1ae51e Alan Ott         2011-01-18  278  	data[0] = report_number;
41edc0c0341604 David Rheinsberg 2013-04-06  279  	ret = hidp_send_ctrl_message(session, report_type, data, 1);
8bb3537095f107 Dan Elkouby      2019-09-06  280  	if (ret < 0)
794d175698f0e7 David Rheinsberg 2011-08-26  281  		goto err;
0ff1731a1ae51e Alan Ott         2011-01-18  282  
0ff1731a1ae51e Alan Ott         2011-01-18  283  	/* Wait for the return of the report. The returned report
0ff1731a1ae51e Alan Ott         2011-01-18  284  	   gets put in session->report_return.  */
e3492dc3760ceb David Rheinsberg 2013-04-06  285  	while (test_bit(HIDP_WAITING_FOR_RETURN, &session->flags) &&
e3492dc3760ceb David Rheinsberg 2013-04-06  286  	       !atomic_read(&session->terminate)) {
0ff1731a1ae51e Alan Ott         2011-01-18  287  		int res;
0ff1731a1ae51e Alan Ott         2011-01-18  288  
0ff1731a1ae51e Alan Ott         2011-01-18  289  		res = wait_event_interruptible_timeout(session->report_queue,
e3492dc3760ceb David Rheinsberg 2013-04-06  290  			!test_bit(HIDP_WAITING_FOR_RETURN, &session->flags)
e3492dc3760ceb David Rheinsberg 2013-04-06  291  				|| atomic_read(&session->terminate),
0ff1731a1ae51e Alan Ott         2011-01-18  292  			5*HZ);
0ff1731a1ae51e Alan Ott         2011-01-18  293  		if (res == 0) {
0ff1731a1ae51e Alan Ott         2011-01-18  294  			/* timeout */
794d175698f0e7 David Rheinsberg 2011-08-26  295  			ret = -EIO;
794d175698f0e7 David Rheinsberg 2011-08-26  296  			goto err;
0ff1731a1ae51e Alan Ott         2011-01-18  297  		}
0ff1731a1ae51e Alan Ott         2011-01-18  298  		if (res < 0) {
0ff1731a1ae51e Alan Ott         2011-01-18  299  			/* signal */
794d175698f0e7 David Rheinsberg 2011-08-26  300  			ret = -ERESTARTSYS;
794d175698f0e7 David Rheinsberg 2011-08-26  301  			goto err;
0ff1731a1ae51e Alan Ott         2011-01-18  302  		}
0ff1731a1ae51e Alan Ott         2011-01-18  303  	}
0ff1731a1ae51e Alan Ott         2011-01-18  304  
0ff1731a1ae51e Alan Ott         2011-01-18  305  	skb = session->report_return;
0ff1731a1ae51e Alan Ott         2011-01-18  306  	if (skb) {
0ff1731a1ae51e Alan Ott         2011-01-18  307  		len = skb->len < count ? skb->len : count;
0ff1731a1ae51e Alan Ott         2011-01-18  308  		memcpy(data, skb->data, len);
0ff1731a1ae51e Alan Ott         2011-01-18  309  
0ff1731a1ae51e Alan Ott         2011-01-18  310  		kfree_skb(skb);
0ff1731a1ae51e Alan Ott         2011-01-18  311  		session->report_return = NULL;
0ff1731a1ae51e Alan Ott         2011-01-18  312  	} else {
0ff1731a1ae51e Alan Ott         2011-01-18  313  		/* Device returned a HANDSHAKE, indicating  protocol error. */
0ff1731a1ae51e Alan Ott         2011-01-18  314  		len = -EIO;
0ff1731a1ae51e Alan Ott         2011-01-18  315  	}
0ff1731a1ae51e Alan Ott         2011-01-18  316  
0ff1731a1ae51e Alan Ott         2011-01-18  317  	clear_bit(HIDP_WAITING_FOR_RETURN, &session->flags);
0ff1731a1ae51e Alan Ott         2011-01-18 @318  	mutex_unlock(&session->report_mutex);
0ff1731a1ae51e Alan Ott         2011-01-18  319  
0ff1731a1ae51e Alan Ott         2011-01-18  320  	return len;
0ff1731a1ae51e Alan Ott         2011-01-18  321  
794d175698f0e7 David Rheinsberg 2011-08-26  322  err:
0ff1731a1ae51e Alan Ott         2011-01-18  323  	clear_bit(HIDP_WAITING_FOR_RETURN, &session->flags);
0ff1731a1ae51e Alan Ott         2011-01-18  324  	mutex_unlock(&session->report_mutex);
794d175698f0e7 David Rheinsberg 2011-08-26  325  	return ret;
0ff1731a1ae51e Alan Ott         2011-01-18  326  }
0ff1731a1ae51e Alan Ott         2011-01-18  327  

:::::: The code at line 318 was first introduced by commit
:::::: 0ff1731a1ae51e8e48cd559d70db536281c47f8e HID: bt: Add support for hidraw HIDIOCGFEATURE and HIDIOCSFEATURE

:::::: TO: Alan Ott <alan@signal11.us>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
