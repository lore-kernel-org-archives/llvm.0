Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA211AA6B;
	Fri,  4 Aug 2023 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691169106; x=1722705106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvOSXGS1o/GQNWpF5PsZ8UPkk85SB0OYHEVVnqXsq14=;
  b=AIViIh1nXYM6/vMKl+SVJmK18Cd2WAg0OfV29qMZ163Ssp200PUhfvDI
   47Ft+2oCQtAEQjjZ7w/Cpx4lO/bxMiS1/ZGZzbVKfJSSZ3g0BXQsxVgQa
   WDC4+bRWeoSWrwB/NVpGAUWV7jsruU9k8FbcRdSqr15tqo4h1y9NCiGg4
   N5ZXwB31ZSH/OaWuEtV/2jN5j/9pWzhZlyJgWokv1QiXmFzym73HUVlZX
   HoBtmrnKTseyDEDyzlXqxk1mUGXUb984jg/YT2KsFHS2TWsODsEcOvU4o
   jNblZQfnM+kwnfq7F3I1lW9rRX/D6J0HGfQTaOAGeU4To62SkzQ7Fbde/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360258668"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="360258668"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 10:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="800130284"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="800130284"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2023 10:11:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRyL0-000303-15;
	Fri, 04 Aug 2023 17:11:42 +0000
Date: Sat, 5 Aug 2023 01:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 17/18] net/ceph/osd_client.c:4479:34: error:
 no member named 'pages' in 'struct ceph_msg_data'
Message-ID: <202308050140.qJfmkX4j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5
commit: 70a81323ce650a06f02e5fb311e688cb03274ca9 [17/18] ceph: Remove CEPH_MSG_DATA_PAGES and its helpers
config: hexagon-randconfig-r022-20230731 (https://download.01.org/0day-ci/archive/20230805/202308050140.qJfmkX4j-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050140.qJfmkX4j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050140.qJfmkX4j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/ceph/osd_client.c:7:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/ceph/osd_client.c:7:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/ceph/osd_client.c:7:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   net/ceph/osd_client.c:4478:8: error: use of undeclared identifier 'CEPH_MSG_DATA_PAGES'
    4478 |                                                         CEPH_MSG_DATA_PAGES);
         |                                                         ^
   net/ceph/osd_client.c:4479:13: error: no member named 'preply_pages' in 'struct ceph_osd_linger_request'
    4479 |                                         *lreq->preply_pages = data->pages;
         |                                          ~~~~  ^
>> net/ceph/osd_client.c:4479:34: error: no member named 'pages' in 'struct ceph_msg_data'
    4479 |                                         *lreq->preply_pages = data->pages;
         |                                                               ~~~~  ^
   net/ceph/osd_client.c:4480:13: error: no member named 'preply_len' in 'struct ceph_osd_linger_request'
    4480 |                                         *lreq->preply_len = data->length;
         |                                          ~~~~  ^
>> net/ceph/osd_client.c:4480:32: error: no member named 'length' in 'struct ceph_msg_data'
    4480 |                                         *lreq->preply_len = data->length;
         |                                                             ~~~~  ^
>> net/ceph/osd_client.c:4481:12: error: no member named 'own_pages' in 'struct ceph_msg_data'
    4481 |                                         data->own_pages = false;
         |                                         ~~~~  ^
   6 warnings and 6 errors generated.


vim +4479 net/ceph/osd_client.c

a02a946dfe9633 Ilya Dryomov  2017-06-19  4413  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4414  /*
922dab6134178c Ilya Dryomov  2016-05-26  4415   * Process osd watch notifications
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4416   */
922dab6134178c Ilya Dryomov  2016-05-26  4417  static void handle_watch_notify(struct ceph_osd_client *osdc,
922dab6134178c Ilya Dryomov  2016-05-26  4418  				struct ceph_msg *msg)
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4419  {
922dab6134178c Ilya Dryomov  2016-05-26  4420  	void *p = msg->front.iov_base;
922dab6134178c Ilya Dryomov  2016-05-26  4421  	void *const end = p + msg->front.iov_len;
922dab6134178c Ilya Dryomov  2016-05-26  4422  	struct ceph_osd_linger_request *lreq;
922dab6134178c Ilya Dryomov  2016-05-26  4423  	struct linger_work *lwork;
922dab6134178c Ilya Dryomov  2016-05-26  4424  	u8 proto_ver, opcode;
922dab6134178c Ilya Dryomov  2016-05-26  4425  	u64 cookie, notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4426  	u64 notifier_id = 0;
1907920324f1f3 Ilya Dryomov  2016-04-28  4427  	s32 return_code = 0;
922dab6134178c Ilya Dryomov  2016-05-26  4428  	void *payload = NULL;
922dab6134178c Ilya Dryomov  2016-05-26  4429  	u32 payload_len = 0;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4430  
922dab6134178c Ilya Dryomov  2016-05-26  4431  	ceph_decode_8_safe(&p, end, proto_ver, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4432  	ceph_decode_8_safe(&p, end, opcode, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4433  	ceph_decode_64_safe(&p, end, cookie, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4434  	p += 8; /* skip ver */
922dab6134178c Ilya Dryomov  2016-05-26  4435  	ceph_decode_64_safe(&p, end, notify_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4436  
922dab6134178c Ilya Dryomov  2016-05-26  4437  	if (proto_ver >= 1) {
922dab6134178c Ilya Dryomov  2016-05-26  4438  		ceph_decode_32_safe(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4439  		ceph_decode_need(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4440  		payload = p;
922dab6134178c Ilya Dryomov  2016-05-26  4441  		p += payload_len;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4442  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4443  
922dab6134178c Ilya Dryomov  2016-05-26  4444  	if (le16_to_cpu(msg->hdr.version) >= 2)
1907920324f1f3 Ilya Dryomov  2016-04-28  4445  		ceph_decode_32_safe(&p, end, return_code, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4446  
922dab6134178c Ilya Dryomov  2016-05-26  4447  	if (le16_to_cpu(msg->hdr.version) >= 3)
922dab6134178c Ilya Dryomov  2016-05-26  4448  		ceph_decode_64_safe(&p, end, notifier_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4449  
922dab6134178c Ilya Dryomov  2016-05-26  4450  	down_read(&osdc->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4451  	lreq = lookup_linger_osdc(&osdc->linger_requests, cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4452  	if (!lreq) {
922dab6134178c Ilya Dryomov  2016-05-26  4453  		dout("%s opcode %d cookie %llu dne\n", __func__, opcode,
922dab6134178c Ilya Dryomov  2016-05-26  4454  		     cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4455  		goto out_unlock_osdc;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4456  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4457  
922dab6134178c Ilya Dryomov  2016-05-26  4458  	mutex_lock(&lreq->lock);
1907920324f1f3 Ilya Dryomov  2016-04-28  4459  	dout("%s opcode %d cookie %llu lreq %p is_watch %d\n", __func__,
1907920324f1f3 Ilya Dryomov  2016-04-28  4460  	     opcode, cookie, lreq, lreq->is_watch);
922dab6134178c Ilya Dryomov  2016-05-26  4461  	if (opcode == CEPH_WATCH_EVENT_DISCONNECT) {
922dab6134178c Ilya Dryomov  2016-05-26  4462  		if (!lreq->last_error) {
922dab6134178c Ilya Dryomov  2016-05-26  4463  			lreq->last_error = -ENOTCONN;
922dab6134178c Ilya Dryomov  2016-05-26  4464  			queue_watch_error(lreq);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4465  		}
1907920324f1f3 Ilya Dryomov  2016-04-28  4466  	} else if (!lreq->is_watch) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4467  		/* CEPH_WATCH_EVENT_NOTIFY_COMPLETE */
1907920324f1f3 Ilya Dryomov  2016-04-28  4468  		if (lreq->notify_id && lreq->notify_id != notify_id) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4469  			dout("lreq %p notify_id %llu != %llu, ignoring\n", lreq,
1907920324f1f3 Ilya Dryomov  2016-04-28  4470  			     lreq->notify_id, notify_id);
1907920324f1f3 Ilya Dryomov  2016-04-28  4471  		} else if (!completion_done(&lreq->notify_finish_wait)) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4472  			struct ceph_msg_data *data =
0d9c1ab3be4c01 Ilya Dryomov  2018-10-15  4473  			    msg->num_data_items ? &msg->data[0] : NULL;
1907920324f1f3 Ilya Dryomov  2016-04-28  4474  
1907920324f1f3 Ilya Dryomov  2016-04-28  4475  			if (data) {
487d6fc2718f9f David Howells 2023-08-03  4476  				if (lreq->reply) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4477  					WARN_ON(data->type !=
1907920324f1f3 Ilya Dryomov  2016-04-28  4478  							CEPH_MSG_DATA_PAGES);
1907920324f1f3 Ilya Dryomov  2016-04-28 @4479  					*lreq->preply_pages = data->pages;
1907920324f1f3 Ilya Dryomov  2016-04-28 @4480  					*lreq->preply_len = data->length;
e886274031200b Ilya Dryomov  2020-03-10 @4481  					data->own_pages = false;
1907920324f1f3 Ilya Dryomov  2016-04-28  4482  				}
1907920324f1f3 Ilya Dryomov  2016-04-28  4483  			}
1907920324f1f3 Ilya Dryomov  2016-04-28  4484  			lreq->notify_finish_error = return_code;
1907920324f1f3 Ilya Dryomov  2016-04-28  4485  			complete_all(&lreq->notify_finish_wait);
1907920324f1f3 Ilya Dryomov  2016-04-28  4486  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4487  	} else {
922dab6134178c Ilya Dryomov  2016-05-26  4488  		/* CEPH_WATCH_EVENT_NOTIFY */
922dab6134178c Ilya Dryomov  2016-05-26  4489  		lwork = lwork_alloc(lreq, do_watch_notify);
922dab6134178c Ilya Dryomov  2016-05-26  4490  		if (!lwork) {
922dab6134178c Ilya Dryomov  2016-05-26  4491  			pr_err("failed to allocate notify-lwork\n");
922dab6134178c Ilya Dryomov  2016-05-26  4492  			goto out_unlock_lreq;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4493  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4494  
922dab6134178c Ilya Dryomov  2016-05-26  4495  		lwork->notify.notify_id = notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4496  		lwork->notify.notifier_id = notifier_id;
922dab6134178c Ilya Dryomov  2016-05-26  4497  		lwork->notify.payload = payload;
922dab6134178c Ilya Dryomov  2016-05-26  4498  		lwork->notify.payload_len = payload_len;
922dab6134178c Ilya Dryomov  2016-05-26  4499  		lwork->notify.msg = ceph_msg_get(msg);
922dab6134178c Ilya Dryomov  2016-05-26  4500  		lwork_queue(lwork);
91883cd27c4e25 Ilya Dryomov  2014-09-11  4501  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4502  
922dab6134178c Ilya Dryomov  2016-05-26  4503  out_unlock_lreq:
922dab6134178c Ilya Dryomov  2016-05-26  4504  	mutex_unlock(&lreq->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4505  out_unlock_osdc:
922dab6134178c Ilya Dryomov  2016-05-26  4506  	up_read(&osdc->lock);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4507  	return;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4508  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4509  bad:
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4510  	pr_err("osdc handle_watch_notify corrupt msg\n");
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4511  }
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4512  

:::::: The code at line 4479 was first introduced by commit
:::::: 1907920324f1f3ebb6618344417c03a2863bba01 libceph: support for sending notifies

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
