Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24823CE;
	Tue,  7 Feb 2023 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675770549; x=1707306549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SV7oNY7Daa+I9QuQVk1avEL3V1aeYMqcFxCYy0WJw2E=;
  b=lf4/7b6hkje+UrMHxhjuWX1aaVUrvngBXgdgBXkUUr8oZVXO09NdexdP
   uTTiLoXSLlwwW4BDphST8J58pb7NmkzdauH109BAI/2leDKSA9uB75hQd
   msR9tIWxrfloC6VU4xkGyfMFe4YthFvffBAXhTzdTYbuZmx2XPZmIrxVV
   6ft8ddJRRaKsv5W4nel9K3eAL0ya9aQLmVtUB2t05b/+50D6CSB71593H
   EhvvZkGUan0+tDEZ4lzYeNTqH7SnwS4RL0HuYGRS3D0sYHwIaFlEQHDcw
   gmp3m46c4nU75mh1zT9JnlYH/DFzs4ecxtie6AudygHGFIDA9YPk0gK61
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327173035"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="327173035"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="697255994"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="697255994"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2023 03:49:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPMT5-0003WQ-1L;
	Tue, 07 Feb 2023 11:48:59 +0000
Date: Tue, 7 Feb 2023 19:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] net: add new socket option SO_SETNETNS
Message-ID: <202302071930.65Ha05Kf-lkp@intel.com>
References: <Y9q8Ec1CJILZz7dj@ip-172-31-38-16.us-west-2.compute.internal>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9q8Ec1CJILZz7dj@ip-172-31-38-16.us-west-2.compute.internal>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes net/master linus/master v6.2-rc7]
[cannot apply to net-next/master next-20230207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/net-add-new-socket-option-SO_SETNETNS/20230202-032540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/Y9q8Ec1CJILZz7dj%40ip-172-31-38-16.us-west-2.compute.internal
patch subject: [RFC] net: add new socket option SO_SETNETNS
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20230207/202302071930.65Ha05Kf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/03eff302351f4db1ed733d7b303f3938e511413b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/net-add-new-socket-option-SO_SETNETNS/20230202-032540
        git checkout 03eff302351f4db1ed733d7b303f3938e511413b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/core/sock.c:1538:7: error: use of undeclared identifier 'SO_SETNETNS'
           case SO_SETNETNS:
                ^
   1 error generated.


vim +/SO_SETNETNS +1538 net/core/sock.c

  1426	
  1427		case SO_MAX_PACING_RATE:
  1428			{
  1429			unsigned long ulval = (val == ~0U) ? ~0UL : (unsigned int)val;
  1430	
  1431			if (sizeof(ulval) != sizeof(val) &&
  1432			    optlen >= sizeof(ulval) &&
  1433			    copy_from_sockptr(&ulval, optval, sizeof(ulval))) {
  1434				ret = -EFAULT;
  1435				break;
  1436			}
  1437			if (ulval != ~0UL)
  1438				cmpxchg(&sk->sk_pacing_status,
  1439					SK_PACING_NONE,
  1440					SK_PACING_NEEDED);
  1441			sk->sk_max_pacing_rate = ulval;
  1442			sk->sk_pacing_rate = min(sk->sk_pacing_rate, ulval);
  1443			break;
  1444			}
  1445		case SO_INCOMING_CPU:
  1446			reuseport_update_incoming_cpu(sk, val);
  1447			break;
  1448	
  1449		case SO_CNX_ADVICE:
  1450			if (val == 1)
  1451				dst_negative_advice(sk);
  1452			break;
  1453	
  1454		case SO_ZEROCOPY:
  1455			if (sk->sk_family == PF_INET || sk->sk_family == PF_INET6) {
  1456				if (!(sk_is_tcp(sk) ||
  1457				      (sk->sk_type == SOCK_DGRAM &&
  1458				       sk->sk_protocol == IPPROTO_UDP)))
  1459					ret = -EOPNOTSUPP;
  1460			} else if (sk->sk_family != PF_RDS) {
  1461				ret = -EOPNOTSUPP;
  1462			}
  1463			if (!ret) {
  1464				if (val < 0 || val > 1)
  1465					ret = -EINVAL;
  1466				else
  1467					sock_valbool_flag(sk, SOCK_ZEROCOPY, valbool);
  1468			}
  1469			break;
  1470	
  1471		case SO_TXTIME:
  1472			if (optlen != sizeof(struct sock_txtime)) {
  1473				ret = -EINVAL;
  1474				break;
  1475			} else if (copy_from_sockptr(&sk_txtime, optval,
  1476				   sizeof(struct sock_txtime))) {
  1477				ret = -EFAULT;
  1478				break;
  1479			} else if (sk_txtime.flags & ~SOF_TXTIME_FLAGS_MASK) {
  1480				ret = -EINVAL;
  1481				break;
  1482			}
  1483			/* CLOCK_MONOTONIC is only used by sch_fq, and this packet
  1484			 * scheduler has enough safe guards.
  1485			 */
  1486			if (sk_txtime.clockid != CLOCK_MONOTONIC &&
  1487			    !sockopt_ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN)) {
  1488				ret = -EPERM;
  1489				break;
  1490			}
  1491			sock_valbool_flag(sk, SOCK_TXTIME, true);
  1492			sk->sk_clockid = sk_txtime.clockid;
  1493			sk->sk_txtime_deadline_mode =
  1494				!!(sk_txtime.flags & SOF_TXTIME_DEADLINE_MODE);
  1495			sk->sk_txtime_report_errors =
  1496				!!(sk_txtime.flags & SOF_TXTIME_REPORT_ERRORS);
  1497			break;
  1498	
  1499		case SO_BINDTOIFINDEX:
  1500			ret = sock_bindtoindex_locked(sk, val);
  1501			break;
  1502	
  1503		case SO_BUF_LOCK:
  1504			if (val & ~SOCK_BUF_LOCK_MASK) {
  1505				ret = -EINVAL;
  1506				break;
  1507			}
  1508			sk->sk_userlocks = val | (sk->sk_userlocks &
  1509						  ~SOCK_BUF_LOCK_MASK);
  1510			break;
  1511	
  1512		case SO_RESERVE_MEM:
  1513		{
  1514			int delta;
  1515	
  1516			if (val < 0) {
  1517				ret = -EINVAL;
  1518				break;
  1519			}
  1520	
  1521			delta = val - sk->sk_reserved_mem;
  1522			if (delta < 0)
  1523				sock_release_reserved_memory(sk, -delta);
  1524			else
  1525				ret = sock_reserve_memory(sk, delta);
  1526			break;
  1527		}
  1528	
  1529		case SO_TXREHASH:
  1530			if (val < -1 || val > 1) {
  1531				ret = -EINVAL;
  1532				break;
  1533			}
  1534			/* Paired with READ_ONCE() in tcp_rtx_synack() */
  1535			WRITE_ONCE(sk->sk_txrehash, (u8)val);
  1536			break;
  1537	
> 1538		case SO_SETNETNS:
  1539		{
  1540			struct net *other_ns, *my_ns;
  1541	
  1542			if (sk->sk_family != AF_INET && sk->sk_family != AF_INET6) {
  1543				ret = -EOPNOTSUPP;
  1544				break;
  1545			}
  1546	
  1547			if (sk->sk_type != SOCK_STREAM && sk->sk_type != SOCK_DGRAM) {
  1548				ret = -EOPNOTSUPP;
  1549				break;
  1550			}
  1551	
  1552			other_ns = get_net_ns_by_fd(val);
  1553			if (IS_ERR(other_ns)) {
  1554				ret = PTR_ERR(other_ns);
  1555				break;
  1556			}
  1557	
  1558			if (!ns_capable(other_ns->user_ns, CAP_NET_ADMIN)) {
  1559				ret = -EPERM;
  1560				goto out_err;
  1561			}
  1562	
  1563			/* check that the socket has never been connected or recently disconnected */
  1564			if (sk->sk_state != TCP_CLOSE || sk->sk_shutdown & SHUTDOWN_MASK) {
  1565				ret = -EOPNOTSUPP;
  1566				goto out_err;
  1567			}
  1568	
  1569			/* check that the socket is not bound to an interface*/
  1570			if (sk->sk_bound_dev_if != 0) {
  1571				ret = -EOPNOTSUPP;
  1572				goto out_err;
  1573			}
  1574	
  1575			my_ns = sock_net(sk);
  1576			sock_net_set(sk, other_ns);
  1577			put_net(my_ns);
  1578			break;
  1579	out_err:
  1580			put_net(other_ns);
  1581			break;
  1582		}
  1583	
  1584		default:
  1585			ret = -ENOPROTOOPT;
  1586			break;
  1587		}
  1588		sockopt_release_sock(sk);
  1589		return ret;
  1590	}
  1591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
