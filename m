Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1C2CA6;
	Tue, 14 Mar 2023 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678826528; x=1710362528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNG6DsJAF5fah55f4hAcYKeoJ1wAZ+peo1HXEHZDWHg=;
  b=JLVMT1XrVcdKKyQEMmnu6QgraF+9rZ/6OM5oScVOv1x/AJYliIugPboO
   7YRRU/6zQA0TA9cmdDO0yBKwBKpkhZ57YNXhj6UXG7VZkfOCYjhUBV9PL
   XAUUeCfFvF9Wbgpt02o18K4xW5TpT/TBCUxhyYZyCYHYtzz1OiIcVjjlt
   CPgHsnAu6TWGaa1Kh5oNOssJUWZpXe5bvzF9Fj9JEi9xq++bKSkjrqVkb
   qOdIefyYNOBo8Phr3/Mkct6AjBunJKF8YQnbrUeEngQOiI7rcaFEG86N0
   dmTKdg6QhtkOSuDRUTNawf8nH4+rVxPKoe6qwgITWbEUVs1Vu4IB1HsSE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321383315"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="321383315"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 13:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709427740"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="709427740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 13:40:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcBRy-0007BI-2b;
	Tue, 14 Mar 2023 20:40:50 +0000
Date: Wed, 15 Mar 2023 04:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 35/39] drivers/nvme/host/tcp.c:998:10: error:
 call to undeclared function 'kernel_sendpage'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202303150406.0meUzgDT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 16c1a5866002502b637ee10de3f53e4b6da13696 [35/39] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: hexagon-randconfig-r023-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150406.0meUzgDT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=16c1a5866002502b637ee10de3f53e4b6da13696
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 16c1a5866002502b637ee10de3f53e4b6da13696
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/nvme/host/ fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150406.0meUzgDT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/tcp.c:12:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/nvme/host/tcp.c:12:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/nvme/host/tcp.c:12:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/nvme/host/tcp.c:998:10: error: call to undeclared function 'kernel_sendpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = kernel_sendpage(queue->sock, page, offset, len,
                                 ^
   drivers/nvme/host/tcp.c:998:10: note: did you mean 'kernel_sendmsg'?
   include/linux/net.h:324:5: note: 'kernel_sendmsg' declared here
   int kernel_sendmsg(struct socket *sock, struct msghdr *msg, struct kvec *vec,
       ^
>> drivers/nvme/host/tcp.c:1001:10: error: call to undeclared function 'sock_no_sendpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = sock_no_sendpage(queue->sock, page, offset, len,
                                 ^
   drivers/nvme/host/tcp.c:1001:10: note: did you mean 'sock_no_sendmsg'?
   include/net/sock.h:1902:5: note: 'sock_no_sendmsg' declared here
   int sock_no_sendmsg(struct socket *, struct msghdr *, size_t);
       ^
   drivers/nvme/host/tcp.c:1056:8: error: call to undeclared function 'kernel_sendpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
                 ^
   drivers/nvme/host/tcp.c:1089:9: error: call to undeclared function 'kernel_sendpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = kernel_sendpage(queue->sock, virt_to_page(pdu),
                         ^
   drivers/nvme/host/tcp.c:1093:9: error: call to undeclared function 'sock_no_sendpage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = sock_no_sendpage(queue->sock, virt_to_page(pdu),
                         ^
   6 warnings and 5 errors generated.


vim +/kernel_sendpage +998 drivers/nvme/host/tcp.c

3f2304f8c6d6ed Sagi Grimberg        2018-12-03   977  
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   978  static int nvme_tcp_try_send_data(struct nvme_tcp_request *req)
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   979  {
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   980  	struct nvme_tcp_queue *queue = req->queue;
25e1f67eda4a19 Sagi Grimberg        2021-10-24   981  	int req_data_len = req->data_len;
c2700d2886a87f Varun Prakash        2022-01-22   982  	u32 h2cdata_left = req->h2cdata_left;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   983  
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   984  	while (true) {
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   985  		struct page *page = nvme_tcp_req_cur_page(req);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   986  		size_t offset = nvme_tcp_req_cur_offset(req);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   987  		size_t len = nvme_tcp_req_cur_length(req);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   988  		bool last = nvme_tcp_pdu_last_send(req, len);
25e1f67eda4a19 Sagi Grimberg        2021-10-24   989  		int req_data_sent = req->data_sent;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   990  		int ret, flags = MSG_DONTWAIT;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   991  
122e5b9f3d370a Sagi Grimberg        2020-06-18   992  		if (last && !queue->data_digest && !nvme_tcp_queue_more(queue))
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   993  			flags |= MSG_EOR;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   994  		else
5bb052d7aad1f4 Sagi Grimberg        2020-05-04   995  			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03   996  
7d4194abfc4de1 Coly Li              2020-10-02   997  		if (sendpage_ok(page)) {
7d4194abfc4de1 Coly Li              2020-10-02  @998  			ret = kernel_sendpage(queue->sock, page, offset, len,
37c15219599f7a Mikhail Skorzhinskii 2019-07-08   999  					flags);
37c15219599f7a Mikhail Skorzhinskii 2019-07-08  1000  		} else {
7d4194abfc4de1 Coly Li              2020-10-02 @1001  			ret = sock_no_sendpage(queue->sock, page, offset, len,
37c15219599f7a Mikhail Skorzhinskii 2019-07-08  1002  					flags);
37c15219599f7a Mikhail Skorzhinskii 2019-07-08  1003  		}
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1004  		if (ret <= 0)
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1005  			return ret;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1006  
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1007  		if (queue->data_digest)
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1008  			nvme_tcp_ddgst_update(queue->snd_hash, page,
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1009  					offset, ret);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1010  
e371af033c560b Sagi Grimberg        2021-09-14  1011  		/*
e371af033c560b Sagi Grimberg        2021-09-14  1012  		 * update the request iterator except for the last payload send
e371af033c560b Sagi Grimberg        2021-09-14  1013  		 * in the request where we don't want to modify it as we may
e371af033c560b Sagi Grimberg        2021-09-14  1014  		 * compete with the RX path completing the request.
e371af033c560b Sagi Grimberg        2021-09-14  1015  		 */
25e1f67eda4a19 Sagi Grimberg        2021-10-24  1016  		if (req_data_sent + ret < req_data_len)
e371af033c560b Sagi Grimberg        2021-09-14  1017  			nvme_tcp_advance_req(req, ret);
e371af033c560b Sagi Grimberg        2021-09-14  1018  
e371af033c560b Sagi Grimberg        2021-09-14  1019  		/* fully successful last send in current PDU */
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1020  		if (last && ret == len) {
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1021  			if (queue->data_digest) {
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1022  				nvme_tcp_ddgst_final(queue->snd_hash,
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1023  					&req->ddgst);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1024  				req->state = NVME_TCP_SEND_DDGST;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1025  				req->offset = 0;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1026  			} else {
c2700d2886a87f Varun Prakash        2022-01-22  1027  				if (h2cdata_left)
c2700d2886a87f Varun Prakash        2022-01-22  1028  					nvme_tcp_setup_h2c_data_pdu(req);
c2700d2886a87f Varun Prakash        2022-01-22  1029  				else
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1030  					nvme_tcp_done_send_req(queue);
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1031  			}
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1032  			return 1;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1033  		}
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1034  	}
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1035  	return -EAGAIN;
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1036  }
3f2304f8c6d6ed Sagi Grimberg        2018-12-03  1037  

:::::: The code at line 998 was first introduced by commit
:::::: 7d4194abfc4de13a2663c7fee6891de8360f7a52 nvme-tcp: check page by sendpage_ok() before calling kernel_sendpage()

:::::: TO: Coly Li <colyli@suse.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
