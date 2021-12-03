Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ABF68
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 16:14:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="300385395"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="300385395"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 08:10:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="561760484"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2021 08:10:15 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtB8Y-000Hla-J3; Fri, 03 Dec 2021 16:10:14 +0000
Date: Sat, 4 Dec 2021 00:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>,
	"Paulo Alcantara (SUSE)" <pc@cjr.nz>
Subject: [linux-next:master 4708/5128] fs/cifs/connect.c:1566:12: error: no
 member named 'fscache' in 'struct TCP_Server_Info'
Message-ID: <202112040002.zM4QXUGg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: c148f8eb032ffcbbb33b3c1aa1dd68ba97214562 [4708/5128] cifs: add server conn_id to fscache client cookie
config: hexagon-buildonly-randconfig-r006-20211202 (https://download.01.org/0day-ci/archive/20211204/202112040002.zM4QXUGg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c148f8eb032ffcbbb33b3c1aa1dd68ba97214562
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c148f8eb032ffcbbb33b3c1aa1dd68ba97214562
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 7afeac307a9561e3a93682c1e7eb22f918aa1187 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> fs/cifs/connect.c:1566:12: error: no member named 'fscache' in 'struct TCP_Server_Info'
                   tcp_ses->fscache = tcp_ses->primary_server->fscache;
                   ~~~~~~~  ^
   fs/cifs/connect.c:1566:47: error: no member named 'fscache' in 'struct TCP_Server_Info'
                   tcp_ses->fscache = tcp_ses->primary_server->fscache;
                                      ~~~~~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.


vim +1566 fs/cifs/connect.c

  1412	
  1413	struct TCP_Server_Info *
  1414	cifs_get_tcp_session(struct smb3_fs_context *ctx,
  1415			     struct TCP_Server_Info *primary_server)
  1416	{
  1417		struct TCP_Server_Info *tcp_ses = NULL;
  1418		int rc;
  1419	
  1420		cifs_dbg(FYI, "UNC: %s\n", ctx->UNC);
  1421	
  1422		/* see if we already have a matching tcp_ses */
  1423		tcp_ses = cifs_find_tcp_session(ctx);
  1424		if (tcp_ses)
  1425			return tcp_ses;
  1426	
  1427		tcp_ses = kzalloc(sizeof(struct TCP_Server_Info), GFP_KERNEL);
  1428		if (!tcp_ses) {
  1429			rc = -ENOMEM;
  1430			goto out_err;
  1431		}
  1432	
  1433		tcp_ses->hostname = kstrdup(ctx->server_hostname, GFP_KERNEL);
  1434		if (!tcp_ses->hostname) {
  1435			rc = -ENOMEM;
  1436			goto out_err;
  1437		}
  1438	
  1439		if (ctx->nosharesock)
  1440			tcp_ses->nosharesock = true;
  1441	
  1442		tcp_ses->ops = ctx->ops;
  1443		tcp_ses->vals = ctx->vals;
  1444		cifs_set_net_ns(tcp_ses, get_net(current->nsproxy->net_ns));
  1445	
  1446		tcp_ses->conn_id = atomic_inc_return(&tcpSesNextId);
  1447		tcp_ses->noblockcnt = ctx->rootfs;
  1448		tcp_ses->noblocksnd = ctx->noblocksnd || ctx->rootfs;
  1449		tcp_ses->noautotune = ctx->noautotune;
  1450		tcp_ses->tcp_nodelay = ctx->sockopt_tcp_nodelay;
  1451		tcp_ses->rdma = ctx->rdma;
  1452		tcp_ses->in_flight = 0;
  1453		tcp_ses->max_in_flight = 0;
  1454		tcp_ses->credits = 1;
  1455		if (primary_server) {
  1456			spin_lock(&cifs_tcp_ses_lock);
  1457			++primary_server->srv_count;
  1458			tcp_ses->primary_server = primary_server;
  1459			spin_unlock(&cifs_tcp_ses_lock);
  1460		}
  1461		init_waitqueue_head(&tcp_ses->response_q);
  1462		init_waitqueue_head(&tcp_ses->request_q);
  1463		INIT_LIST_HEAD(&tcp_ses->pending_mid_q);
  1464		mutex_init(&tcp_ses->srv_mutex);
  1465		memcpy(tcp_ses->workstation_RFC1001_name,
  1466			ctx->source_rfc1001_name, RFC1001_NAME_LEN_WITH_NULL);
  1467		memcpy(tcp_ses->server_RFC1001_name,
  1468			ctx->target_rfc1001_name, RFC1001_NAME_LEN_WITH_NULL);
  1469		tcp_ses->session_estab = false;
  1470		tcp_ses->sequence_number = 0;
  1471		tcp_ses->reconnect_instance = 1;
  1472		tcp_ses->lstrp = jiffies;
  1473		tcp_ses->compress_algorithm = cpu_to_le16(ctx->compression);
  1474		spin_lock_init(&tcp_ses->req_lock);
  1475		INIT_LIST_HEAD(&tcp_ses->tcp_ses_list);
  1476		INIT_LIST_HEAD(&tcp_ses->smb_ses_list);
  1477		INIT_DELAYED_WORK(&tcp_ses->echo, cifs_echo_request);
  1478		INIT_DELAYED_WORK(&tcp_ses->resolve, cifs_resolve_server);
  1479		INIT_DELAYED_WORK(&tcp_ses->reconnect, smb2_reconnect_server);
  1480		mutex_init(&tcp_ses->reconnect_mutex);
  1481	#ifdef CONFIG_CIFS_DFS_UPCALL
  1482		mutex_init(&tcp_ses->refpath_lock);
  1483	#endif
  1484		memcpy(&tcp_ses->srcaddr, &ctx->srcaddr,
  1485		       sizeof(tcp_ses->srcaddr));
  1486		memcpy(&tcp_ses->dstaddr, &ctx->dstaddr,
  1487			sizeof(tcp_ses->dstaddr));
  1488		if (ctx->use_client_guid)
  1489			memcpy(tcp_ses->client_guid, ctx->client_guid,
  1490			       SMB2_CLIENT_GUID_SIZE);
  1491		else
  1492			generate_random_uuid(tcp_ses->client_guid);
  1493		/*
  1494		 * at this point we are the only ones with the pointer
  1495		 * to the struct since the kernel thread not created yet
  1496		 * no need to spinlock this init of tcpStatus or srv_count
  1497		 */
  1498		tcp_ses->tcpStatus = CifsNew;
  1499		++tcp_ses->srv_count;
  1500	
  1501		if (ctx->echo_interval >= SMB_ECHO_INTERVAL_MIN &&
  1502			ctx->echo_interval <= SMB_ECHO_INTERVAL_MAX)
  1503			tcp_ses->echo_interval = ctx->echo_interval * HZ;
  1504		else
  1505			tcp_ses->echo_interval = SMB_ECHO_INTERVAL_DEFAULT * HZ;
  1506		if (tcp_ses->rdma) {
  1507	#ifndef CONFIG_CIFS_SMB_DIRECT
  1508			cifs_dbg(VFS, "CONFIG_CIFS_SMB_DIRECT is not enabled\n");
  1509			rc = -ENOENT;
  1510			goto out_err_crypto_release;
  1511	#endif
  1512			tcp_ses->smbd_conn = smbd_get_connection(
  1513				tcp_ses, (struct sockaddr *)&ctx->dstaddr);
  1514			if (tcp_ses->smbd_conn) {
  1515				cifs_dbg(VFS, "RDMA transport established\n");
  1516				rc = 0;
  1517				goto smbd_connected;
  1518			} else {
  1519				rc = -ENOENT;
  1520				goto out_err_crypto_release;
  1521			}
  1522		}
  1523		rc = ip_connect(tcp_ses);
  1524		if (rc < 0) {
  1525			cifs_dbg(VFS, "Error connecting to socket. Aborting operation.\n");
  1526			goto out_err_crypto_release;
  1527		}
  1528	smbd_connected:
  1529		/*
  1530		 * since we're in a cifs function already, we know that
  1531		 * this will succeed. No need for try_module_get().
  1532		 */
  1533		__module_get(THIS_MODULE);
  1534		tcp_ses->tsk = kthread_run(cifs_demultiplex_thread,
  1535					  tcp_ses, "cifsd");
  1536		if (IS_ERR(tcp_ses->tsk)) {
  1537			rc = PTR_ERR(tcp_ses->tsk);
  1538			cifs_dbg(VFS, "error %d create cifsd thread\n", rc);
  1539			module_put(THIS_MODULE);
  1540			goto out_err_crypto_release;
  1541		}
  1542		tcp_ses->min_offload = ctx->min_offload;
  1543		/*
  1544		 * at this point we are the only ones with the pointer
  1545		 * to the struct since the kernel thread not created yet
  1546		 * no need to spinlock this update of tcpStatus
  1547		 */
  1548		tcp_ses->tcpStatus = CifsNeedNegotiate;
  1549	
  1550		if ((ctx->max_credits < 20) || (ctx->max_credits > 60000))
  1551			tcp_ses->max_credits = SMB2_MAX_CREDITS_AVAILABLE;
  1552		else
  1553			tcp_ses->max_credits = ctx->max_credits;
  1554	
  1555		tcp_ses->nr_targets = 1;
  1556		tcp_ses->ignore_signature = ctx->ignore_signature;
  1557		/* thread spawned, put it on the list */
  1558		spin_lock(&cifs_tcp_ses_lock);
  1559		list_add(&tcp_ses->tcp_ses_list, &cifs_tcp_ses_list);
  1560		spin_unlock(&cifs_tcp_ses_lock);
  1561	
  1562		/* fscache server cookies are based on primary channel only */
  1563		if (!CIFS_SERVER_IS_CHAN(tcp_ses))
  1564			cifs_fscache_get_client_cookie(tcp_ses);
  1565		else
> 1566			tcp_ses->fscache = tcp_ses->primary_server->fscache;
  1567	
  1568		/* queue echo request delayed work */
  1569		queue_delayed_work(cifsiod_wq, &tcp_ses->echo, tcp_ses->echo_interval);
  1570	
  1571		/* queue dns resolution delayed work */
  1572		cifs_dbg(FYI, "%s: next dns resolution scheduled for %d seconds in the future\n",
  1573			 __func__, SMB_DNS_RESOLVE_INTERVAL_DEFAULT);
  1574	
  1575		queue_delayed_work(cifsiod_wq, &tcp_ses->resolve, (SMB_DNS_RESOLVE_INTERVAL_DEFAULT * HZ));
  1576	
  1577		return tcp_ses;
  1578	
  1579	out_err_crypto_release:
  1580		cifs_crypto_secmech_release(tcp_ses);
  1581	
  1582		put_net(cifs_net_ns(tcp_ses));
  1583	
  1584	out_err:
  1585		if (tcp_ses) {
  1586			if (CIFS_SERVER_IS_CHAN(tcp_ses))
  1587				cifs_put_tcp_session(tcp_ses->primary_server, false);
  1588			kfree(tcp_ses->hostname);
  1589			if (tcp_ses->ssocket)
  1590				sock_release(tcp_ses->ssocket);
  1591			kfree(tcp_ses);
  1592		}
  1593		return ERR_PTR(rc);
  1594	}
  1595	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
