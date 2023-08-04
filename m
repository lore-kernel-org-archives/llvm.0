Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FB19883;
	Fri,  4 Aug 2023 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691165410; x=1722701410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmor2041b+gz1MY50ox2OlUMvaRgmnWd25aFcinBLWc=;
  b=GQ4cUbM8t0Rn548++fCVJaTu/NUYOtjUMe5I9JwLzFZCXuCrf6j588ZN
   iP3Jm2mjo9XgsT6trkSAj5GAEUfkFrlaio+NZ8MWTJL+0cL7xwf52eYoM
   7DMIjaWWYxyKvbjn8kq3Fxal1FYT4s+YbQvmEgOm6IOtKAVNNpVAvFKhX
   Pz8mThHl2F6A9CDH6Zeoib/P1ohdOpW1XcD9Y86Ynd8/qJKeIJ2YKL3/b
   xNucBOJliXFrZiO1PLWgWXRYRIExsX2b6Ui6/PJgB4nVX+6vOZ5F5g/96
   jMzDPUQ8rppmmdtWG6OoxMGI+k22J36SOutpDBNeqt6xzB6f+IjeFWWAB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="349779826"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="349779826"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 09:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730108562"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="730108562"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Aug 2023 09:09:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRxMy-0002xt-3A;
	Fri, 04 Aug 2023 16:09:40 +0000
Date: Sat, 5 Aug 2023 00:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 15/18] net/ceph/osd_client.c:4536:13: error:
 no member named 'preply_pages' in 'struct ceph_osd_linger_request'
Message-ID: <202308050000.GRkusrdu-lkp@intel.com>
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
commit: 487d6fc2718f9fb12bc63b41b30d60f0eb0b0459 [15/18] ceph: Convert ceph_osdc_notify() reply to ceph_databuf
config: hexagon-randconfig-r022-20230731 (https://download.01.org/0day-ci/archive/20230805/202308050000.GRkusrdu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050000.GRkusrdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050000.GRkusrdu-lkp@intel.com/

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
>> net/ceph/osd_client.c:4536:13: error: no member named 'preply_pages' in 'struct ceph_osd_linger_request'
    4536 |                                         *lreq->preply_pages = data->pages;
         |                                          ~~~~  ^
>> net/ceph/osd_client.c:4537:13: error: no member named 'preply_len' in 'struct ceph_osd_linger_request'
    4537 |                                         *lreq->preply_len = data->length;
         |                                          ~~~~  ^
   6 warnings and 2 errors generated.


vim +4536 net/ceph/osd_client.c

a02a946dfe9633 Ilya Dryomov  2017-06-19  4470  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4471  /*
922dab6134178c Ilya Dryomov  2016-05-26  4472   * Process osd watch notifications
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4473   */
922dab6134178c Ilya Dryomov  2016-05-26  4474  static void handle_watch_notify(struct ceph_osd_client *osdc,
922dab6134178c Ilya Dryomov  2016-05-26  4475  				struct ceph_msg *msg)
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4476  {
922dab6134178c Ilya Dryomov  2016-05-26  4477  	void *p = msg->front.iov_base;
922dab6134178c Ilya Dryomov  2016-05-26  4478  	void *const end = p + msg->front.iov_len;
922dab6134178c Ilya Dryomov  2016-05-26  4479  	struct ceph_osd_linger_request *lreq;
922dab6134178c Ilya Dryomov  2016-05-26  4480  	struct linger_work *lwork;
922dab6134178c Ilya Dryomov  2016-05-26  4481  	u8 proto_ver, opcode;
922dab6134178c Ilya Dryomov  2016-05-26  4482  	u64 cookie, notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4483  	u64 notifier_id = 0;
1907920324f1f3 Ilya Dryomov  2016-04-28  4484  	s32 return_code = 0;
922dab6134178c Ilya Dryomov  2016-05-26  4485  	void *payload = NULL;
922dab6134178c Ilya Dryomov  2016-05-26  4486  	u32 payload_len = 0;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4487  
922dab6134178c Ilya Dryomov  2016-05-26  4488  	ceph_decode_8_safe(&p, end, proto_ver, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4489  	ceph_decode_8_safe(&p, end, opcode, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4490  	ceph_decode_64_safe(&p, end, cookie, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4491  	p += 8; /* skip ver */
922dab6134178c Ilya Dryomov  2016-05-26  4492  	ceph_decode_64_safe(&p, end, notify_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4493  
922dab6134178c Ilya Dryomov  2016-05-26  4494  	if (proto_ver >= 1) {
922dab6134178c Ilya Dryomov  2016-05-26  4495  		ceph_decode_32_safe(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4496  		ceph_decode_need(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4497  		payload = p;
922dab6134178c Ilya Dryomov  2016-05-26  4498  		p += payload_len;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4499  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4500  
922dab6134178c Ilya Dryomov  2016-05-26  4501  	if (le16_to_cpu(msg->hdr.version) >= 2)
1907920324f1f3 Ilya Dryomov  2016-04-28  4502  		ceph_decode_32_safe(&p, end, return_code, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4503  
922dab6134178c Ilya Dryomov  2016-05-26  4504  	if (le16_to_cpu(msg->hdr.version) >= 3)
922dab6134178c Ilya Dryomov  2016-05-26  4505  		ceph_decode_64_safe(&p, end, notifier_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4506  
922dab6134178c Ilya Dryomov  2016-05-26  4507  	down_read(&osdc->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4508  	lreq = lookup_linger_osdc(&osdc->linger_requests, cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4509  	if (!lreq) {
922dab6134178c Ilya Dryomov  2016-05-26  4510  		dout("%s opcode %d cookie %llu dne\n", __func__, opcode,
922dab6134178c Ilya Dryomov  2016-05-26  4511  		     cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4512  		goto out_unlock_osdc;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4513  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4514  
922dab6134178c Ilya Dryomov  2016-05-26  4515  	mutex_lock(&lreq->lock);
1907920324f1f3 Ilya Dryomov  2016-04-28  4516  	dout("%s opcode %d cookie %llu lreq %p is_watch %d\n", __func__,
1907920324f1f3 Ilya Dryomov  2016-04-28  4517  	     opcode, cookie, lreq, lreq->is_watch);
922dab6134178c Ilya Dryomov  2016-05-26  4518  	if (opcode == CEPH_WATCH_EVENT_DISCONNECT) {
922dab6134178c Ilya Dryomov  2016-05-26  4519  		if (!lreq->last_error) {
922dab6134178c Ilya Dryomov  2016-05-26  4520  			lreq->last_error = -ENOTCONN;
922dab6134178c Ilya Dryomov  2016-05-26  4521  			queue_watch_error(lreq);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4522  		}
1907920324f1f3 Ilya Dryomov  2016-04-28  4523  	} else if (!lreq->is_watch) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4524  		/* CEPH_WATCH_EVENT_NOTIFY_COMPLETE */
1907920324f1f3 Ilya Dryomov  2016-04-28  4525  		if (lreq->notify_id && lreq->notify_id != notify_id) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4526  			dout("lreq %p notify_id %llu != %llu, ignoring\n", lreq,
1907920324f1f3 Ilya Dryomov  2016-04-28  4527  			     lreq->notify_id, notify_id);
1907920324f1f3 Ilya Dryomov  2016-04-28  4528  		} else if (!completion_done(&lreq->notify_finish_wait)) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4529  			struct ceph_msg_data *data =
0d9c1ab3be4c01 Ilya Dryomov  2018-10-15  4530  			    msg->num_data_items ? &msg->data[0] : NULL;
1907920324f1f3 Ilya Dryomov  2016-04-28  4531  
1907920324f1f3 Ilya Dryomov  2016-04-28  4532  			if (data) {
487d6fc2718f9f David Howells 2023-08-03  4533  				if (lreq->reply) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4534  					WARN_ON(data->type !=
1907920324f1f3 Ilya Dryomov  2016-04-28  4535  							CEPH_MSG_DATA_PAGES);
1907920324f1f3 Ilya Dryomov  2016-04-28 @4536  					*lreq->preply_pages = data->pages;
1907920324f1f3 Ilya Dryomov  2016-04-28 @4537  					*lreq->preply_len = data->length;
e886274031200b Ilya Dryomov  2020-03-10  4538  					data->own_pages = false;
1907920324f1f3 Ilya Dryomov  2016-04-28  4539  				}
1907920324f1f3 Ilya Dryomov  2016-04-28  4540  			}
1907920324f1f3 Ilya Dryomov  2016-04-28  4541  			lreq->notify_finish_error = return_code;
1907920324f1f3 Ilya Dryomov  2016-04-28  4542  			complete_all(&lreq->notify_finish_wait);
1907920324f1f3 Ilya Dryomov  2016-04-28  4543  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4544  	} else {
922dab6134178c Ilya Dryomov  2016-05-26  4545  		/* CEPH_WATCH_EVENT_NOTIFY */
922dab6134178c Ilya Dryomov  2016-05-26  4546  		lwork = lwork_alloc(lreq, do_watch_notify);
922dab6134178c Ilya Dryomov  2016-05-26  4547  		if (!lwork) {
922dab6134178c Ilya Dryomov  2016-05-26  4548  			pr_err("failed to allocate notify-lwork\n");
922dab6134178c Ilya Dryomov  2016-05-26  4549  			goto out_unlock_lreq;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4550  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4551  
922dab6134178c Ilya Dryomov  2016-05-26  4552  		lwork->notify.notify_id = notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4553  		lwork->notify.notifier_id = notifier_id;
922dab6134178c Ilya Dryomov  2016-05-26  4554  		lwork->notify.payload = payload;
922dab6134178c Ilya Dryomov  2016-05-26  4555  		lwork->notify.payload_len = payload_len;
922dab6134178c Ilya Dryomov  2016-05-26  4556  		lwork->notify.msg = ceph_msg_get(msg);
922dab6134178c Ilya Dryomov  2016-05-26  4557  		lwork_queue(lwork);
91883cd27c4e25 Ilya Dryomov  2014-09-11  4558  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4559  
922dab6134178c Ilya Dryomov  2016-05-26  4560  out_unlock_lreq:
922dab6134178c Ilya Dryomov  2016-05-26  4561  	mutex_unlock(&lreq->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4562  out_unlock_osdc:
922dab6134178c Ilya Dryomov  2016-05-26  4563  	up_read(&osdc->lock);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4564  	return;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4565  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4566  bad:
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4567  	pr_err("osdc handle_watch_notify corrupt msg\n");
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4568  }
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4569  

:::::: The code at line 4536 was first introduced by commit
:::::: 1907920324f1f3ebb6618344417c03a2863bba01 libceph: support for sending notifies

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
