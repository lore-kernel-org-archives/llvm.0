Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB538477;
	Fri, 13 Oct 2023 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAdqAWll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697192691; x=1728728691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NcXW6N98kQKA16p3mDMdWV8s3wDxQfCOCXaTZvHgzg=;
  b=MAdqAWllWbSUIx/b8454pO1Ac/vq7Gm83gWNQSfrxlDRpAgjKg1+uYBv
   oe2YwVHg+E12Eb20bN3y4klp7bT/E+5PWCVK8903iFoB9IWbuI2AdgjYC
   AqeCkVx3nm9gWlmt4U72xfRhueCkYALB3Sq9L8k7fXPy6Uv7wP++ZO5KY
   OhiLWZBykMEooXgT3Zp+XSgJ39XvieM9MnuNSegfVL2JF7OpZ9zZtQkhX
   7YBiAel3stRMRv7htIJ4WVx0xn/ncgmV6APlrhoVM613TEy87MGBLV5De
   u2KYrd5OyzbDsr9DysuiNxUrPUoVQyn2a9L/UDTZsqnFiY/5SK8zZoOEv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375499619"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375499619"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731318522"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731318522"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:24:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFLa-0004ct-25;
	Fri, 13 Oct 2023 10:24:46 +0000
Date: Fri, 13 Oct 2023 18:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 49/52] fs/smb/client/cifssmb.c:1648:7:
 warning: variable 'result' is used uninitialized whenever switch case is
 taken
Message-ID: <202310131839.i9sJEKdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   85dec73045983f5aa1f9dab3a2176104f449f096
commit: 7b10d4d9edcb94c0584d5e5b656fec33fc87becf [49/52] cifs: Cut over to using netfslib
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231013/202310131839.i9sJEKdE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131839.i9sJEKdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131839.i9sJEKdE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifssmb.c:1648:7: warning: variable 'result' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case MID_REQUEST_SUBMITTED:
                ^~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsglob.h:1794:33: note: expanded from macro 'MID_REQUEST_SUBMITTED'
   #define   MID_REQUEST_SUBMITTED 2
                                   ^
   fs/smb/client/cifssmb.c:1657:52: note: uninitialized use occurs here
           netfs_write_subrequest_terminated(&wdata->subreq, result, true);
                                                             ^~~~~~
   fs/smb/client/cifssmb.c:1649:7: warning: variable 'result' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case MID_RETRY_NEEDED:
                ^~~~~~~~~~~~~~~~
   fs/smb/client/cifsglob.h:1796:33: note: expanded from macro 'MID_RETRY_NEEDED'
   #define   MID_RETRY_NEEDED      8 /* session closed while this request out */
                                   ^
   fs/smb/client/cifssmb.c:1657:52: note: uninitialized use occurs here
           netfs_write_subrequest_terminated(&wdata->subreq, result, true);
                                                             ^~~~~~
>> fs/smb/client/cifssmb.c:1652:2: warning: variable 'result' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   fs/smb/client/cifssmb.c:1657:52: note: uninitialized use occurs here
           netfs_write_subrequest_terminated(&wdata->subreq, result, true);
                                                             ^~~~~~
   fs/smb/client/cifssmb.c:1622:16: note: initialize the variable 'result' to silence this warning
           ssize_t result;
                         ^
                          = 0
   In file included from fs/smb/client/cifssmb.c:17:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:9:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:23:
   In file included from arch/x86/include/asm/msr.h:11:
   In file included from arch/x86/include/asm/cpumask.h:5:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:255:
   include/linux/fortify-string.h:588:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
                           __read_overflow2_field(q_size_field, size);
                           ^
   4 warnings generated.


vim +/result +1648 fs/smb/client/cifssmb.c

^1da177e4c3f41 fs/cifs/cifssmb.c       Linus Torvalds  2005-04-16  1610  
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1611  /*
7c9421e1a9ce8d fs/cifs/cifssmb.c       Pavel Shilovsky 2012-03-23  1612   * Check the mid_state and signature on received buffer (if any), and queue the
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1613   * workqueue completion task.
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1614   */
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1615  static void
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1616  cifs_writev_callback(struct mid_q_entry *mid)
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1617  {
0b24d6edc9fa9e fs/smb/client/cifssmb.c David Howells   2023-10-06  1618  	struct cifs_io_subrequest *wdata = mid->callback_data;
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1619  	struct cifs_tcon *tcon = tlink_tcon(wdata->req->cfile->tlink);
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1620  	WRITE_RSP *smb = (WRITE_RSP *)mid->resp_buf;
34f4deb7c56c6f fs/cifs/cifssmb.c       Pavel Shilovsky 2019-01-16  1621  	struct cifs_credits credits = { .value = 1, .instance = 0 };
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1622  	ssize_t result;
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1623  	size_t written;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1624  
7c9421e1a9ce8d fs/cifs/cifssmb.c       Pavel Shilovsky 2012-03-23  1625  	switch (mid->mid_state) {
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1626  	case MID_RESPONSE_RECEIVED:
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1627  		result = cifs_check_receive(mid, tcon->ses->server, 0);
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1628  		if (result != 0)
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1629  			break;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1630  
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1631  		written = le16_to_cpu(smb->CountHigh);
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1632  		written <<= 16;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1633  		written += le16_to_cpu(smb->Count);
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1634  		/*
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1635  		 * Mask off high 16 bits when bytes written as returned
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1636  		 * by the server is greater than bytes requested by the
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1637  		 * client. OS/2 servers are known to set incorrect
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1638  		 * CountHigh values.
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1639  		 */
7e1f7bfdd78e11 fs/smb/client/cifssmb.c David Howells   2023-10-06  1640  		if (written > wdata->subreq.len)
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1641  			written &= 0xFFFF;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1642  
7e1f7bfdd78e11 fs/smb/client/cifssmb.c David Howells   2023-10-06  1643  		if (written < wdata->subreq.len)
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1644  			result = -ENOSPC;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1645  		else
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1646  			result = written;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1647  		break;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19 @1648  	case MID_REQUEST_SUBMITTED:
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19 @1649  	case MID_RETRY_NEEDED:
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1650  		wdata->result = -EAGAIN;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1651  		break;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19 @1652  	default:
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1653  		wdata->result = -EIO;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1654  		break;
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1655  	}
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1656  
7b10d4d9edcb94 fs/smb/client/cifssmb.c David Howells   2023-10-06  1657  	netfs_write_subrequest_terminated(&wdata->subreq, result, true);
70f08f914a37a0 fs/cifs/cifssmb.c       Enzo Matsumiya  2022-08-05  1658  	release_mid(mid);
34f4deb7c56c6f fs/cifs/cifssmb.c       Pavel Shilovsky 2019-01-16  1659  	add_credits(tcon->ses->server, &credits, 0);
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1660  }
c28c89fc43e3f8 fs/cifs/cifssmb.c       Jeff Layton     2011-05-19  1661  

:::::: The code at line 1648 was first introduced by commit
:::::: c28c89fc43e3f81436efc4748837534d4d46f90c cifs: add cifs_async_writev

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
