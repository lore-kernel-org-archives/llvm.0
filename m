Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8B3F5BC2;
	Tue,  9 Jun 2026 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046558; cv=none; b=rcRMpEzSjVa3HFnWCjbzo+I5uNuqWR15h5F8TyvzCq3CYflZz+MKkJ/e2vmvcK/cR1P1M8Q/Uox0TtgexsvxhuubhllTF1HnK5x7aN+j2xRUAprzQy4nfdab8QDi9YfN52if2Y1tYv92v1KJXcwOt6wGS0N6XaxHQrfPQmyTKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046558; c=relaxed/simple;
	bh=1OjaBozmMS7OkEWtwI0fZZy/7aRXgKMoI2DySNHayFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAV9a+GULB0D16B5zZ02Ydpfdl+J/pkntUNzuEjLROnZFY/+GZ84HO1VgnZc4p/45PulTTLXRpL5j6xtIOGuZY0o5b09LAWt1wVld/4TH+Niwfzn128TMdIGlhlpJ/xThi2X9XOf+44irO2zNFDDiTNEMBiWnW654XniE06H6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMjVELSY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMjVELSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781046556; x=1812582556;
  h=date:from:to:cc:subject:message-id;
  bh=1OjaBozmMS7OkEWtwI0fZZy/7aRXgKMoI2DySNHayFU=;
  b=kMjVELSYw/wSDmfoyLYIy2OziGXn8bp1O0xA9C0ZLzNgb/oLxb+7Ce9f
   Sivu1mLBvmJpzga2Gp8zPblBNOKgIyMyoMNtcX32/o3qwggXTh6sKtbFZ
   gblspU1hffrSHRRjKLt9tnjRQ+kVhJUieAVSsjhGZnE862YkwGOZruDdg
   vjlHHrCcv7rD3dvC7O+Hxq5jKmALjWgxY1i31KYljDZZdlE0xl3QWgX6/
   SSmBsJAQ9i5ogVr5uWsWiZmiTGHPloT5eFhbnr/iXwmeMStHUxmmJNQYq
   zWG/mQ1dhSuvJU1cY8g7PRbr6e3SFMOPpgPOxZ5ac3tF/mA2lOPLU/BqE
   Q==;
X-CSE-ConnectionGUID: +Y/zdWSWRPeG/8LVhbtXUg==
X-CSE-MsgGUID: NyaI9w9gRDWncRp8uNTnDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104491826"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="104491826"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 16:09:14 -0700
X-CSE-ConnectionGUID: tMH0RdOwQyCgGB3Lrd4dPw==
X-CSE-MsgGUID: JRHD+VwiSXaxEyGIAFZ1jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245150781"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 16:09:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX5ZF-00000000KeY-3uQf;
	Tue, 09 Jun 2026 23:09:09 +0000
Date: Wed, 10 Jun 2026 07:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 22/22] fs/9p/vfs_addr.c:79:6:
 warning: variable 'len' is used uninitialized whenever 'if' condition is true
Message-ID: <202606100718.e78jIMlQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   1d9a108be2c6acdd19dfad7fd3f536c79810dafa
commit: 1d9a108be2c6acdd19dfad7fd3f536c79810dafa [22/22] netfs: Combine prepare and issue ops and grab the buffers on request
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606100718.e78jIMlQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100718.e78jIMlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100718.e78jIMlQ-lkp@intel.com/

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
>> fs/netfs/write_collect.c:154:7: warning: variable 'fpos' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     154 |                 if (!bvecq->bv[slot].bv_page) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/write_collect.c:186:7: note: uninitialized use occurs here
     186 |                 if (fpos + fsize >= collected_to)
         |                     ^~~~
   fs/netfs/write_collect.c:154:3: note: remove the 'if' if its condition is always false
     154 |                 if (!bvecq->bv[slot].bv_page) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     155 |                         WARN_ONCE(1, "R=%08x slot already cleared?\n", wreq->debug_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                         fsize = bvecq->bv[slot].bv_len;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |                         goto skip;
         |                         ~~~~~~~~~~
     158 |                 }
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
