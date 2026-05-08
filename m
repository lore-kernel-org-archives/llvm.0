Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321D23E342;
	Fri,  8 May 2026 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269530; cv=none; b=Tl2wcJEeQ/H/AxO0eMk+9A/6cApOdvN0t94rxipcRxw8+kUhiyVvNfQ3p2p0xDFAoerQus6N+M6Hk8RpzT0DPQ0FOz2bSH+UWqcLlxs1YvDMix+TEZNfkgHah656uDByMnJVlLm2PpYJM+li6ewa7UyaChFiCY+dr3sSaGAKcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269530; c=relaxed/simple;
	bh=HwKvq4q8TK2p9jwFGjXBQMITa7HU6BaZtSS3UoV+uHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERsFtaNEPkNQnEjSb63SgFAmUBa9c6pZKly68aCCLsubsKXhDFn6Br4DXk7AGnfh3i5QvNUaYoc4gZx9t7MF1h5luaRw4iASpllDH1p2/uN4HKbxxSPYNvPiaVhpF8fDbX7VxwPeOKfit5Gb4UdZWEfnY/8pNLPYLFJbGooIrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMfiTDhe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMfiTDhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778269528; x=1809805528;
  h=date:from:to:cc:subject:message-id;
  bh=HwKvq4q8TK2p9jwFGjXBQMITa7HU6BaZtSS3UoV+uHQ=;
  b=EMfiTDheTbpc1+yTWYCsncyjC5K+wbfeNPZzSgkkPJ+Bn3+ys/jHv7of
   /8YJeBfEKiIJBF0t/JHs1HO9jqpf3yNuYjzD7lqXbhrysdHn1VY9n1s5h
   SdrNf/TH1bjA9jvgNlQxqYqvkNawjYJADlNHFVOYRoebHj8th0tCcvdVS
   zfXNkdxvNStivUxrh3B045+nqMYNVt0jag/lhV3H7K0iB71NexsqXZa9y
   DQcXVsmK1UfMveR7W8iyUxjNM7Wqhx4XN09RuOvwa5RXa+W9acuit5XmV
   7pZVlxRyKpFn2vyBXuw3MBNosWgBXnUIvqeKb49FmdseIQjEUgoOkH7hX
   w==;
X-CSE-ConnectionGUID: tPnPwBOrTmixNEkbpltRiA==
X-CSE-MsgGUID: JPMboJhhQ4uMu5T/n+oXeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79104254"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79104254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 12:45:27 -0700
X-CSE-ConnectionGUID: 0tGEGSzvQHKJkipYUuIvrw==
X-CSE-MsgGUID: UGHV9f4vR4WK06xgOPMxUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241205079"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2026 12:45:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLR8V-000000000OT-2wpD;
	Fri, 08 May 2026 19:45:23 +0000
Date: Sat, 09 May 2026 03:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 7/13] io_uring/rw.c:1265:10: error:
 call to undeclared function 'io_slot_iopoll'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202605090326.8Rj9oSAp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   2bbc5f014e3a6c148a49af38c5f288ee510ca57b
commit: 715e17fed1f6415643c698c612c79de00fa3b56b [7/13] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: arm64-randconfig-001-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090326.8Rj9oSAp-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090326.8Rj9oSAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090326.8Rj9oSAp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rw.c:1265:10: error: call to undeclared function 'io_slot_iopoll'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return io_slot_iopoll(req, iob, poll_flags);
                          ^
   io_uring/rw.c:1265:10: note: did you mean 'io_do_iopoll'?
   io_uring/io_uring.h:202:5: note: 'io_do_iopoll' declared here
   int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin);
       ^
   1 error generated.


vim +/io_slot_iopoll +1265 io_uring/rw.c

  1252	
  1253	static int io_uring_classic_poll(struct io_kiocb *req, struct io_comp_batch *iob,
  1254					unsigned int poll_flags)
  1255	{
  1256		struct file *file = req->file;
  1257	
  1258		if (io_is_uring_cmd(req)) {
  1259			struct io_uring_cmd *ioucmd;
  1260	
  1261			ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
  1262			return file->f_op->uring_cmd_iopoll(ioucmd, iob, poll_flags);
  1263		} else if (io_is_slot_op(req)) {
  1264			/* slot ops have no file assigned, use private poll handler */
> 1265			return io_slot_iopoll(req, iob, poll_flags);
  1266		} else {
  1267			struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
  1268	
  1269			return file->f_op->iopoll(&rw->kiocb, iob, poll_flags);
  1270		}
  1271	}
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
