Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011BA29;
	Sat, 15 Apr 2023 06:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681539260; x=1713075260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LajVrvVCRj7BtcXaknNG22ssiqfF2rd7Gvy6aUcOhGI=;
  b=dY9FAgl2Y28ZxJNecsm81P+/JM3ls2koTGPFjxLSllOvA9oxANTi/Quc
   i3ESbSyXe0XAx8dI3yxQja0akaRWHgtvTMBQFDVNbsJpzwLYipSI4w2IN
   oamYPJ6WPNazFhf7K6CIj7q7iGgOl5ryec/CJAVzriAAZT+HUk/NJnTHe
   CdRgm4k++76KdgPP4Vs/DVMZbKidEVYVZtyXhtM26oLhEE7lT1MrjZiBj
   X8nYnq/hojGIfUpIO59tHXYi1Bg0uKPgAyvuuAX/3WeK/v8OPTbdCKKNb
   N/N4smV1HrR9ASI/GQVF8yaLFUtqWDjJpXgEpdN/avZrpyf4eIaBsNald
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="409832240"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="409832240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864444480"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="864444480"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 23:14:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZAt-000aZd-0p;
	Sat, 15 Apr 2023 06:14:15 +0000
Date: Sat, 15 Apr 2023 14:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
Message-ID: <202304151306.Z5FbLtBt-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v2-3-079cc7cee62e%40bytedance.com
patch subject: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304151306.Z5FbLtBt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
        git checkout de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151306.Z5FbLtBt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/vmw_vsock/vmci_transport.c:1326:3: error: expected expression
                   struct sockaddr_vm_rcu *remote_addr;
                   ^
>> net/vmw_vsock/vmci_transport.c:1329:3: error: use of undeclared identifier 'remote_addr'
                   remote_addr = rcu_dereference(vsk->remote_addr);
                   ^
   net/vmw_vsock/vmci_transport.c:1330:8: error: use of undeclared identifier 'remote_addr'
                   if (!remote_addr) {
                        ^
   net/vmw_vsock/vmci_transport.c:1338:33: error: use of undeclared identifier 'remote_addr'
                       || pkt->dg.src.context != remote_addr->addr.svm_cid
                                                 ^
   net/vmw_vsock/vmci_transport.c:1339:27: error: use of undeclared identifier 'remote_addr'
                       || pkt->src_port != remote_addr->addr.svm_port
                                           ^
   5 errors generated.


vim +1326 net/vmw_vsock/vmci_transport.c

  1292	
  1293	static int
  1294	vmci_transport_recv_connecting_client(struct sock *sk,
  1295					      struct vmci_transport_packet *pkt)
  1296	{
  1297		struct vsock_sock *vsk;
  1298		int err;
  1299		int skerr;
  1300	
  1301		vsk = vsock_sk(sk);
  1302	
  1303		switch (pkt->type) {
  1304		case VMCI_TRANSPORT_PACKET_TYPE_ATTACH:
  1305			if (vmci_handle_is_invalid(pkt->u.handle) ||
  1306			    !vmci_handle_is_equal(pkt->u.handle,
  1307						  vmci_trans(vsk)->qp_handle)) {
  1308				skerr = EPROTO;
  1309				err = -EINVAL;
  1310				goto destroy;
  1311			}
  1312	
  1313			/* Signify the socket is connected and wakeup the waiter in
  1314			 * connect(). Also place the socket in the connected table for
  1315			 * accounting (it can already be found since it's in the bound
  1316			 * table).
  1317			 */
  1318			sk->sk_state = TCP_ESTABLISHED;
  1319			sk->sk_socket->state = SS_CONNECTED;
  1320			vsock_insert_connected(vsk);
  1321			sk->sk_state_change(sk);
  1322	
  1323			break;
  1324		case VMCI_TRANSPORT_PACKET_TYPE_NEGOTIATE:
  1325		case VMCI_TRANSPORT_PACKET_TYPE_NEGOTIATE2:
> 1326			struct sockaddr_vm_rcu *remote_addr;
  1327	
  1328			rcu_read_lock();
> 1329			remote_addr = rcu_dereference(vsk->remote_addr);
  1330			if (!remote_addr) {
  1331				skerr = EPROTO;
  1332				err = -EINVAL;
  1333				rcu_read_unlock();
  1334				goto destroy;
  1335			}
  1336	
  1337			if (pkt->u.size == 0
  1338			    || pkt->dg.src.context != remote_addr->addr.svm_cid
  1339			    || pkt->src_port != remote_addr->addr.svm_port
  1340			    || !vmci_handle_is_invalid(vmci_trans(vsk)->qp_handle)
  1341			    || vmci_trans(vsk)->qpair
  1342			    || vmci_trans(vsk)->produce_size != 0
  1343			    || vmci_trans(vsk)->consume_size != 0
  1344			    || vmci_trans(vsk)->detach_sub_id != VMCI_INVALID_ID) {
  1345				skerr = EPROTO;
  1346				err = -EINVAL;
  1347				rcu_read_unlock();
  1348				goto destroy;
  1349			}
  1350			rcu_read_unlock();
  1351	
  1352			err = vmci_transport_recv_connecting_client_negotiate(sk, pkt);
  1353			if (err) {
  1354				skerr = -err;
  1355				goto destroy;
  1356			}
  1357	
  1358			break;
  1359		case VMCI_TRANSPORT_PACKET_TYPE_INVALID:
  1360			err = vmci_transport_recv_connecting_client_invalid(sk, pkt);
  1361			if (err) {
  1362				skerr = -err;
  1363				goto destroy;
  1364			}
  1365	
  1366			break;
  1367		case VMCI_TRANSPORT_PACKET_TYPE_RST:
  1368			/* Older versions of the linux code (WS 6.5 / ESX 4.0) used to
  1369			 * continue processing here after they sent an INVALID packet.
  1370			 * This meant that we got a RST after the INVALID. We ignore a
  1371			 * RST after an INVALID. The common code doesn't send the RST
  1372			 * ... so we can hang if an old version of the common code
  1373			 * fails between getting a REQUEST and sending an OFFER back.
  1374			 * Not much we can do about it... except hope that it doesn't
  1375			 * happen.
  1376			 */
  1377			if (vsk->ignore_connecting_rst) {
  1378				vsk->ignore_connecting_rst = false;
  1379			} else {
  1380				skerr = ECONNRESET;
  1381				err = 0;
  1382				goto destroy;
  1383			}
  1384	
  1385			break;
  1386		default:
  1387			/* Close and cleanup the connection. */
  1388			skerr = EPROTO;
  1389			err = -EINVAL;
  1390			goto destroy;
  1391		}
  1392	
  1393		return 0;
  1394	
  1395	destroy:
  1396		vmci_transport_send_reset(sk, pkt);
  1397	
  1398		sk->sk_state = TCP_CLOSE;
  1399		sk->sk_err = skerr;
  1400		sk_error_report(sk);
  1401		return err;
  1402	}
  1403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
