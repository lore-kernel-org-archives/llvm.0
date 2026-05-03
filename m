Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA1273D6D;
	Sun,  3 May 2026 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777815415; cv=none; b=eUz7bnnAQu418k09rowT7NoW85XSbVTT8G/26z+jCoQTcAeQjCPb+M8wlvvUgtwOMsVCMuPdHjdxlCi9yGvGWazTELBApTDB0hnsi9cjSd3w11z4iMx+4KNyIjJd1uxE0uMLg1XFVdfIERAAElsoirm2zWoSlyCMW1ckEjhY09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777815415; c=relaxed/simple;
	bh=cAO95JhhJNuAtI8Cu6+MP/8OZX3nammT0chQoKNucnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+mBetUuRkcYIZwCF71jTbbnE6xOF4jP1wZoPpd6g77dS43a8JyMgGKRwSBnXv1JfPPwz5SX+d4E+s66CS1/L6ttkGgT4TZfUmw3ToKd/rBT3/YSRPooVvNvVl+ArSb2q1MTBTv/CwG+DkrIJrjj0D09pxEk3pmUEJnYuHHg+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf51ANzD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf51ANzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777815413; x=1809351413;
  h=date:from:to:cc:subject:message-id;
  bh=cAO95JhhJNuAtI8Cu6+MP/8OZX3nammT0chQoKNucnk=;
  b=Zf51ANzD+BE/M1uVguonZGQfGke+6vmCktIokcdP4JfqmuRSW7ywp7Kf
   y9BW2aIfrBN+GgRxJ8SQOS5AaOSHV9PjQXrsD9meo7f0oL+85C1AD1DLc
   OYMo0p1oLnrkNi42NkfQDYcqxsCjQN7lYLgPiDj8LuEXF22N3ohf6OPAH
   KbBkKjep+sfMPmdK7bqfIapzxNdw/doqtYLvwzQVNCmWMlJWt5MCxabvC
   K0u0aK/UJY9WXyv1hiaYLlMSlCAyMmPRz2mXSvW03MFrxAj+YKlzhdKgg
   Vv4dqob1Nk/mrfcQnRxNGDMCS/9B5iyh02qo4otAUUkNxwfK/euB9xxSi
   Q==;
X-CSE-ConnectionGUID: VNjgtxHsSniUNzh9yI/0Gw==
X-CSE-MsgGUID: D/ZO9A99Rsm75+sxsvYPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89285390"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89285390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 06:36:52 -0700
X-CSE-ConnectionGUID: 8U+tKxSCQF+g+8CMrwbhCg==
X-CSE-MsgGUID: 2sxRfqzLRaam+74qCBrPvw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 May 2026 06:36:51 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJX04-000000002bl-2Clk;
	Sun, 03 May 2026 13:36:48 +0000
Date: Sun, 03 May 2026 21:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 46/50] fs/9p/vfs_addr.c:79:6:
 warning: variable 'len' is used uninitialized whenever 'if' condition is true
Message-ID: <202605032150.Zu7t6u9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   2c55c7cf98847d593219ef29d3fedfd551d6f55f
commit: e192187e9d3cdb786b7b6aeb6fc6d4048a806004 [46/50] netfs: Combine prepare and issue ops and grab the buffers on request
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032150.Zu7t6u9z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032150.Zu7t6u9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032150.Zu7t6u9z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/9p/vfs_addr.c:79:6: warning: variable 'len' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      79 |         if (err < 0)
         |             ^~~~~~~
   fs/9p/vfs_addr.c:90:51: note: uninitialized use occurs here
      90 |         return netfs_write_subrequest_terminated(subreq, len ?: err);
         |                                                          ^~~
   fs/9p/vfs_addr.c:79:2: note: remove the 'if' if its condition is always false
      79 |         if (err < 0)
         |         ^~~~~~~~~~~~
      80 |                 goto term;
         |                 ~~~~~~~~~
   fs/9p/vfs_addr.c:74:14: note: initialize the variable 'len' to silence this warning
      74 |         int err, len;
         |                     ^
         |                      = 0
   1 warning generated.
--
>> fs/netfs/write_collect.c:155:7: warning: variable 'fpos' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     155 |                 if (!bvecq->bv[slot].bv_page) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/write_collect.c:187:7: note: uninitialized use occurs here
     187 |                 if (fpos + fsize >= collected_to)
         |                     ^~~~
   fs/netfs/write_collect.c:155:3: note: remove the 'if' if its condition is always false
     155 |                 if (!bvecq->bv[slot].bv_page) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                         WARN_ONCE(1, "R=%08x slot already cleared?\n", wreq->debug_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |                         fsize = bvecq->bv[slot].bv_len;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     158 |                         goto skip;
         |                         ~~~~~~~~~~
     159 |                 }
         |                 ~
   fs/netfs/write_collect.c:137:26: note: initialize the variable 'fpos' to silence this warning
     137 |                 unsigned long long fpos, fend;
         |                                        ^
         |                                         = 0
   1 warning generated.
--
>> fs/netfs/read_pgpriv2.c:204:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     204 |         return ret;
         |                ^~~
   fs/netfs/read_pgpriv2.c:187:9: note: initialize the variable 'ret' to silence this warning
     187 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +79 fs/9p/vfs_addr.c

    66	
    67	/*
    68	 * Issue a subrequest to write to the server.
    69	 */
    70	static void v9fs_issue_write(struct netfs_io_subrequest *subreq)
    71	{
    72		struct iov_iter iter;
    73		struct p9_fid *fid = subreq->rreq->netfs_priv;
    74		int err, len;
    75	
    76		subreq->len = umin(subreq->len, fid->clnt->msize - P9_IOHDRSZ);
    77	
    78		err = netfs_prepare_write_buffer(subreq, INT_MAX);
  > 79		if (err < 0)
    80			goto term;
    81	
    82		iov_iter_bvec_queue(&iter, ITER_SOURCE, subreq->content.bvecq,
    83				    subreq->content.slot, subreq->content.offset, subreq->len);
    84	
    85		len = p9_client_write(fid, subreq->start, &iter, &err);
    86		if (len > 0)
    87			__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
    88	
    89	term:
    90		return netfs_write_subrequest_terminated(subreq, len ?: err);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
