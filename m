Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9973C0A;
	Wed, 29 Mar 2023 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680121874; x=1711657874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MhoV4VjXrS5BMRk/kCdWnDUu2s9zsiCgFBB/jo3vPlk=;
  b=nKIfe8ZkjhcmfenvpIM2qeqRtxI8/Lc3VVySqluA8/bg4WryRrwL5aSl
   KNcV5xsKBXobtlon/35Rjen6nD8GooqCVHG0MAFbWxPECxS0Lmgj4JP5+
   TWNhhMENEtQckguuR0tUKHYqkHZjSl92sG7QwGCnP38Y7QkcnecRoRWgi
   z5Edg6rwl/Bq78wiIy3ukYfTbRnh7mB3BWCM0Ut7c3s0P5MzHuMQxBmwd
   h8SR7rEk7yMDa7qDC++siZ7D/O1yc93vK4Fcy0ygPqkAo/Ztx7rIs9dy+
   neIY681hXEf8cBR2TtKTVFlrk02NOT2NgI6cfW817S4SCrQukLWR6//8J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342604579"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="342604579"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014174697"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="1014174697"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2023 13:31:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phcRr-000JvY-2e;
	Wed, 29 Mar 2023 20:31:11 +0000
Date: Thu, 30 Mar 2023 04:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v8 17/20]
 drivers/nvme/target/tcp.c:1801:1: warning: unused label 'out_free_queue'
Message-ID: <202303300416.aEtu4DXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v8
head:   b160cccb84362674ac09fb349ab21bd2339eb28e
commit: 1cf4b56e63dd687ede53ffa0d0766afa5e1f6cc2 [17/20] nvmet-tcp: enable TLS handshake upcall
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230330/202303300416.aEtu4DXp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=1cf4b56e63dd687ede53ffa0d0766afa5e1f6cc2
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v8
        git checkout 1cf4b56e63dd687ede53ffa0d0766afa5e1f6cc2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/ drivers/nvme/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300416.aEtu4DXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/tcp.c:1801:1: warning: unused label 'out_free_queue' [-Wunused-label]
   out_free_queue:
   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/out_free_queue +1801 drivers/nvme/target/tcp.c

1368784072dae6 Hannes Reinecke 2023-03-04  1748  
44f331a630bdc7 Sagi Grimberg   2022-02-14  1749  	queue->idx = ida_alloc(&nvmet_tcp_queue_ida, GFP_KERNEL);
872d26a391da92 Sagi Grimberg   2018-12-03  1750  	if (queue->idx < 0) {
872d26a391da92 Sagi Grimberg   2018-12-03  1751  		ret = queue->idx;
1368784072dae6 Hannes Reinecke 2023-03-04  1752  		goto out_sock;
872d26a391da92 Sagi Grimberg   2018-12-03  1753  	}
872d26a391da92 Sagi Grimberg   2018-12-03  1754  
872d26a391da92 Sagi Grimberg   2018-12-03  1755  	ret = nvmet_tcp_alloc_cmd(queue, &queue->connect);
872d26a391da92 Sagi Grimberg   2018-12-03  1756  	if (ret)
872d26a391da92 Sagi Grimberg   2018-12-03  1757  		goto out_ida_remove;
872d26a391da92 Sagi Grimberg   2018-12-03  1758  
872d26a391da92 Sagi Grimberg   2018-12-03  1759  	ret = nvmet_sq_init(&queue->nvme_sq);
872d26a391da92 Sagi Grimberg   2018-12-03  1760  	if (ret)
872d26a391da92 Sagi Grimberg   2018-12-03  1761  		goto out_free_connect;
872d26a391da92 Sagi Grimberg   2018-12-03  1762  
872d26a391da92 Sagi Grimberg   2018-12-03  1763  	nvmet_prepare_receive_pdu(queue);
872d26a391da92 Sagi Grimberg   2018-12-03  1764  
872d26a391da92 Sagi Grimberg   2018-12-03  1765  	mutex_lock(&nvmet_tcp_queue_mutex);
872d26a391da92 Sagi Grimberg   2018-12-03  1766  	list_add_tail(&queue->queue_list, &nvmet_tcp_queue_list);
872d26a391da92 Sagi Grimberg   2018-12-03  1767  	mutex_unlock(&nvmet_tcp_queue_mutex);
872d26a391da92 Sagi Grimberg   2018-12-03  1768  
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1769  #ifdef CONFIG_NVME_TLS
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1770  	if (queue->state == NVMET_TCP_Q_TLS_HANDSHAKE) {
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1771  		struct sock *sk = queue->sock->sk;
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1772  
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1773  		/* Restore the default callbacks before starting upcall */
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1774  		read_lock_bh(&sk->sk_callback_lock);
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1775  		sk->sk_user_data = NULL;
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1776  		sk->sk_data_ready = port->data_ready;
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1777  		read_unlock_bh(&sk->sk_callback_lock);
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1778  		if (!nvmet_tcp_tls_handshake(queue))
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1779  			return;
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1780  
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1781  		/* TLS handshake failed, terminate the connection */
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1782  		goto out_destroy_sq;
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1783  	}
1cf4b56e63dd68 Hannes Reinecke 2023-02-14  1784  #endif
872d26a391da92 Sagi Grimberg   2018-12-03  1785  	ret = nvmet_tcp_set_queue_sock(queue);
872d26a391da92 Sagi Grimberg   2018-12-03  1786  	if (ret)
872d26a391da92 Sagi Grimberg   2018-12-03  1787  		goto out_destroy_sq;
872d26a391da92 Sagi Grimberg   2018-12-03  1788  
1368784072dae6 Hannes Reinecke 2023-03-04  1789  	return;
872d26a391da92 Sagi Grimberg   2018-12-03  1790  out_destroy_sq:
872d26a391da92 Sagi Grimberg   2018-12-03  1791  	mutex_lock(&nvmet_tcp_queue_mutex);
872d26a391da92 Sagi Grimberg   2018-12-03  1792  	list_del_init(&queue->queue_list);
872d26a391da92 Sagi Grimberg   2018-12-03  1793  	mutex_unlock(&nvmet_tcp_queue_mutex);
872d26a391da92 Sagi Grimberg   2018-12-03  1794  	nvmet_sq_destroy(&queue->nvme_sq);
872d26a391da92 Sagi Grimberg   2018-12-03  1795  out_free_connect:
872d26a391da92 Sagi Grimberg   2018-12-03  1796  	nvmet_tcp_free_cmd(&queue->connect);
872d26a391da92 Sagi Grimberg   2018-12-03  1797  out_ida_remove:
44f331a630bdc7 Sagi Grimberg   2022-02-14  1798  	ida_free(&nvmet_tcp_queue_ida, queue->idx);
1368784072dae6 Hannes Reinecke 2023-03-04  1799  out_sock:
1368784072dae6 Hannes Reinecke 2023-03-04  1800  	nvmet_tcp_close_sock(queue);
872d26a391da92 Sagi Grimberg   2018-12-03 @1801  out_free_queue:
872d26a391da92 Sagi Grimberg   2018-12-03  1802  	kfree(queue);
1368784072dae6 Hannes Reinecke 2023-03-04  1803  	pr_err("failed to allocate queue");
872d26a391da92 Sagi Grimberg   2018-12-03  1804  }
872d26a391da92 Sagi Grimberg   2018-12-03  1805  

:::::: The code at line 1801 was first introduced by commit
:::::: 872d26a391da92ed8f0c0f5cb5fef428067b7f30 nvmet-tcp: add NVMe over TCP target driver

:::::: TO: Sagi Grimberg <sagi@lightbitslabs.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
