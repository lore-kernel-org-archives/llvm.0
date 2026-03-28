Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5981E0DE8;
	Sat, 28 Mar 2026 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658143; cv=none; b=Men2CQHYnn5BRwAowSQaNwKl/DOok+GHqck1qYZFwlHu3zKZYkAcxW58+CJ+NlpRtWZ3yBVvBsufSkFFTcVLE6ADEydkDvermFdgSH0DSglbsVuDlj99hnAkcR8d2S1Efl/ymvAdaJtLEpD2jGgGZrjucphoW6UcAmVloee/PTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658143; c=relaxed/simple;
	bh=El/256jYWsu6V5IbeDckvzl9Zo/Ioi0mEn8L/tAatYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rys1BfmDP9WZMPmc2linQrPveiSxOq73i15baI9kmaAC7OAcylYTRnooby5Inie6Xle7Xxb0fpDDU3HulYiLUkD2kY8lMwKUOSbIDvNQwQWB7nowcsjryymejwVi6Ki5k/p8FvPYT5i0APhrw6GQHUnq/z513S6lJdING9z65Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFEW8zYR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFEW8zYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774658142; x=1806194142;
  h=date:from:to:cc:subject:message-id;
  bh=El/256jYWsu6V5IbeDckvzl9Zo/Ioi0mEn8L/tAatYE=;
  b=XFEW8zYRfk+f03qXdb1IeKXKFaH0ETuh55XjcDBjZMqjKRVsQkwvnNZL
   81/PuOW/5mFnIHyLCNtvybz7Sp7y1gnnURmAKYkSkeiLPHaaGNSAo9uJn
   22dDxDhqCX+KJcb/YXx7HkAaKHz2ByrXBxFSfddbjpTqcsXbnB+7iw98V
   THz9sTZGjPGvF7aHy8gR57eyvvP1R0dspXi4yftJm/F6VUhSI4KVISodD
   zS96D8tmn93751+R7PD6IR8Zz0zpe/C6PmxX1VjtttNeA2xVGcCChw6m5
   8RzGOETeJBylPkzJqC6MwOZiL/d3mDXyve04aXZsdmuH0cIpgLFPJcDAL
   A==;
X-CSE-ConnectionGUID: dWKlcpA6QmmxzjbjuXxVKA==
X-CSE-MsgGUID: d79Wl0ruTjSEnPBJWgN66g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86043645"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="86043645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:35:42 -0700
X-CSE-ConnectionGUID: MEtNqFrlTdy62lobvOIaKQ==
X-CSE-MsgGUID: g4w1gOAETg+4wIvmdNbxbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="225364372"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2026 17:35:39 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6HeL-00000000Aw9-0xaw;
	Sat, 28 Mar 2026 00:35:37 +0000
Date: Sat, 28 Mar 2026 08:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 26/26] fs/9p/vfs_addr.c:79:6:
 warning: variable 'len' is used uninitialized whenever 'if' condition is true
Message-ID: <202603280825.Y6K0aokp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   13e05ee43d1290bb487ef5318b4d2d27be8ce4b5
commit: 13e05ee43d1290bb487ef5318b4d2d27be8ce4b5 [26/26] netfs: Combine prepare and issue ops and grab the buffers on request
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603280825.Y6K0aokp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280825.Y6K0aokp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280825.Y6K0aokp-lkp@intel.com/

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
   fs/netfs/buffered_read.c:226:26: warning: unused variable 'stream' [-Wunused-variable]
     226 |         struct netfs_io_stream *stream = &rreq->io_streams[0];
         |                                 ^~~~~~
>> fs/netfs/buffered_read.c:223:6: warning: no previous prototype for function 'netfs_mark_read_submission' [-Wmissing-prototypes]
     223 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
         |      ^
   fs/netfs/buffered_read.c:223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     223 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
         | ^
         | static 
   2 warnings generated.
--
>> fs/netfs/read_pgpriv2.c:199:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     199 |         return ret;
         |                ^~~
   fs/netfs/read_pgpriv2.c:182:9: note: initialize the variable 'ret' to silence this warning
     182 |         int ret;
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
