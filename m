Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037E56B6E;
	Sat,  6 Apr 2024 22:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712443617; cv=none; b=ThK2e3I2zRVDI2LehkNfqZfjno54xrJuWiUusn4Mjj33ZnwhzFwb8t7y+b3zSvonlfgZJTt1mfC67CfqJ1IUbTCAGMXGiHJtw97QEOysOkP4VOtGCZZsk5XX7ZvxFM/j2Hq5Hc8+gplcpMhnJDmkU7ICcuWrst4jC1qCg6KBg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712443617; c=relaxed/simple;
	bh=d0ogUsvSXydwIzOgNZikQFBMTXHv/wgoX2LnSv1cP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKtOzUfaZAXpRHhfza9hCROHRfLLIRafPO/RrvDMaUMktDRyBIuay7NkcrWKy0EIdgxuc0NlwIlXGGSY0vktw55XYO5w28LgYeBL/+3JSntO1UYiHcRC7quCxaGVCLErVy/g3A1aE0Ug4GYp4BLvz/8OYAMYRPpcwceLkXNkVMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uqr1B1et; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uqr1B1et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712443615; x=1743979615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0ogUsvSXydwIzOgNZikQFBMTXHv/wgoX2LnSv1cP/A=;
  b=Uqr1B1etxXphpO4vL2haoUam2qEPAFHPi7hRqFEQ1eTR9oF8R+SJi/bO
   QPPrqv5lhlwxVq9Q71XsoocgxThRNzqvCN3Le7LeqD4JSGZwEs6fMGacx
   D7GjlNwRN+EGbrG6TnOCL9n/WkdEI/xuk2UFFCeMoa9PTjNoORSP5WULq
   OptpxkfMmdnOz594sr2M2Gn0i9FZyaS0C6XVhxHBW+efy1ZLGNdH9ifOg
   OYG0G9X2We0kioq0HF/xurHhlRLslq2zzfgkG72M4kvRj1k5JRZ4ebE5B
   COMzmB0QdsKbCXtBcc99wAn1sl7D6sKmapBBTSnoj1ASW/Utf6DbKApiB
   w==;
X-CSE-ConnectionGUID: 5bqdN5SbT329cITBTAob0Q==
X-CSE-MsgGUID: i6LvRUyTQEqsgNMqxu4Wsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="25251929"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="25251929"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:46:52 -0700
X-CSE-ConnectionGUID: qp+VEu1SQ6ifiEnzMObW2Q==
X-CSE-MsgGUID: ht26lnRmTtyCTRV1AT61VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="23995110"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Apr 2024 15:46:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEoD-0003vC-1S;
	Sat, 06 Apr 2024 22:46:49 +0000
Date: Sun, 7 Apr 2024 06:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 130/133]
 drivers/remoteproc/remoteproc_debugfs.c:73:17: error: implicit declaration
 of function 'iov_iter_count' is invalid in C99
Message-ID: <202404070655.26s12eRv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 14b8211dc0e4d288a7ee2471979269d33e83f29f [130/133] drivers/remoteproc: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240407/202404070655.26s12eRv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070655.26s12eRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070655.26s12eRv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/remoteproc_debugfs.c:73:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
>> drivers/remoteproc/remoteproc_debugfs.c:80:9: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = !copy_from_iter_full(buf, count, from);
                  ^
   drivers/remoteproc/remoteproc_debugfs.c:80:9: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   drivers/remoteproc/remoteproc_debugfs.c:207:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
   drivers/remoteproc/remoteproc_debugfs.c:214:9: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = !copy_from_iter_full(buf, count, from);
                  ^
   4 errors generated.


vim +/iov_iter_count +73 drivers/remoteproc/remoteproc_debugfs.c

    53	
    54	/*
    55	 * By writing to the 'coredump' debugfs entry, we control the behavior of the
    56	 * coredump mechanism dynamically. The default value of this entry is "disabled".
    57	 *
    58	 * The 'coredump' debugfs entry supports these commands:
    59	 *
    60	 * disabled:	By default coredump collection is disabled. Recovery will
    61	 *		proceed without collecting any dump.
    62	 *
    63	 * enabled:	When the remoteproc crashes the entire coredump will be copied
    64	 *		to a separate buffer and exposed to userspace.
    65	 *
    66	 * inline:	The coredump will not be copied to a separate buffer and the
    67	 *		recovery process will have to wait until data is read by
    68	 *		userspace. But this avoid usage of extra memory.
    69	 */
    70	static ssize_t rproc_coredump_write(struct kiocb *iocb, struct iov_iter *from)
    71	{
    72		struct rproc *rproc = iocb->ki_filp->private_data;
  > 73		size_t count = iov_iter_count(from);
    74		int ret, err = 0;
    75		char buf[20];
    76	
    77		if (count < 1 || count > sizeof(buf))
    78			return -EINVAL;
    79	
  > 80		ret = !copy_from_iter_full(buf, count, from);
    81		if (ret)
    82			return -EFAULT;
    83	
    84		/* remove end of line */
    85		if (buf[count - 1] == '\n')
    86			buf[count - 1] = '\0';
    87	
    88		if (rproc->state == RPROC_CRASHED) {
    89			dev_err(&rproc->dev, "can't change coredump configuration\n");
    90			err = -EBUSY;
    91			goto out;
    92		}
    93	
    94		if (!strncmp(buf, "disabled", count)) {
    95			rproc->dump_conf = RPROC_COREDUMP_DISABLED;
    96		} else if (!strncmp(buf, "enabled", count)) {
    97			rproc->dump_conf = RPROC_COREDUMP_ENABLED;
    98		} else if (!strncmp(buf, "inline", count)) {
    99			rproc->dump_conf = RPROC_COREDUMP_INLINE;
   100		} else {
   101			dev_err(&rproc->dev, "Invalid coredump configuration\n");
   102			err = -EINVAL;
   103		}
   104	out:
   105		return err ? err : count;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
