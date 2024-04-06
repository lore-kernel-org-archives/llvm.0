Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBE18C1F;
	Sat,  6 Apr 2024 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712441457; cv=none; b=dD3I0t00vSpg0GF3n03MqKYKrjbBRbILleLvgWFDTufxJUmNMMWBoSHkSulnkmQ34ROAaIJXGOYnbUnI16g9SnQahoXyifnzq5DmYTza9shNAnUa0UmLRghPjwSNd9HSTDtSfDiyTVtXznMjgGyj1jmfg3M3w75Rr2c3QZw+K1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712441457; c=relaxed/simple;
	bh=uKcMeizvLw4H0gyPCzX7r7W2LD1YWXnC64ly4wAntzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJRpLWRShHAhA6LKgeFGx4fx6Y7o3n5W9ul2COI2rTDTfTdpla8wlW3EFNcnvzDN2PBAGS9cuOUBJubfBzHvetD24O9ZW3X9NL9JIeieBOkhz59MD1wiJAmFYOAGA935BUdz05R1Yx1GGUjQDdZHu+sWkhM4KTxfVOihO2zX/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1vWnyrQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1vWnyrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712441455; x=1743977455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKcMeizvLw4H0gyPCzX7r7W2LD1YWXnC64ly4wAntzo=;
  b=k1vWnyrQRDtcyiZXcIFd4py4pDSRKpvYkyMbvHiMc1aCGNaNem+ICOj5
   h4CafuT5fyRseJV8RVOJcPab6AU1S3E70qYiWfkIpaVLz3kCgqxLFj7Lz
   dZS0LBvSVsqbX639OOnNGkKzbdLd5wbDpz2G1wz6VmyZuUORb/VGd5nMa
   q3msLLOEseOtQj36Nax389ZN7GKKBhO+XphdPC14fvNusJXBAhm1VcED8
   ebESIIDhh4Q7j/n+4j8IASsRrmujEubmqLobQzuR2jVIL1CS49pA14oNd
   t/M+oeP2kV9QHP/Td3WBGbEJMJ+wIHJ0RUZISKg2bFTVI766obWTuh37t
   A==;
X-CSE-ConnectionGUID: dUXMWFSiTsuILNuFoVU5HQ==
X-CSE-MsgGUID: gggo1dfXTLeR5yOB1xBkPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7586063"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7586063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:10:52 -0700
X-CSE-ConnectionGUID: vD5ypcZwQ+qULTTy2ApRDA==
X-CSE-MsgGUID: Lr4ewZ8GS46XFxSKfH/qEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19353736"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 15:10:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEFM-0003tY-1y;
	Sat, 06 Apr 2024 22:10:48 +0000
Date: Sun, 7 Apr 2024 06:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 84/126] drivers/misc/ibmasm/ibmasmfs.c:262:17:
 error: call to undeclared function 'iov_iter_count'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202404070622.SapnCbAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   dfd9382e4a4aed32db7f783cdb7651dc1ac095bd
commit: 581bf1087e1da579548512b7d80e188fbc1f3741 [84/126] misc: ibmasm: convert to read/write iterators
config: i386-buildonly-randconfig-002-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070622.SapnCbAi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070622.SapnCbAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070622.SapnCbAi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/ibmasm/ibmasmfs.c:262:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         size_t count = iov_iter_count(to);
         |                        ^
>> drivers/misc/ibmasm/ibmasmfs.c:288:7: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         if (!copy_to_iter_full(cmd->buffer, len, to)) {
         |              ^
   drivers/misc/ibmasm/ibmasmfs.c:300:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     300 |         size_t count = iov_iter_count(from);
         |                        ^
>> drivers/misc/ibmasm/ibmasmfs.c:319:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |         if (!copy_from_iter_full(cmd->buffer, count, from)) {
         |              ^
   drivers/misc/ibmasm/ibmasmfs.c:375:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     375 |         size_t count = iov_iter_count(to);
         |                        ^
   drivers/misc/ibmasm/ibmasmfs.c:403:14: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     403 |         if (!copy_to_iter_full(reader->data, reader->data_size, to)) {
         |              ^
   drivers/misc/ibmasm/ibmasmfs.c:417:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         size_t count = iov_iter_count(from);
         |                        ^
   drivers/misc/ibmasm/ibmasmfs.c:459:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     459 |         size_t count = iov_iter_count(to);
         |                        ^
   drivers/misc/ibmasm/ibmasmfs.c:488:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     488 |         size_t count = iov_iter_count(from);
         |                        ^
   drivers/misc/ibmasm/ibmasmfs.c:524:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     524 |         size_t count = iov_iter_count(from);
         |                        ^
   drivers/misc/ibmasm/ibmasmfs.c:539:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     539 |         if (!copy_from_iter_full(buff, count, from)) {
         |              ^
   11 errors generated.


vim +/iov_iter_count +262 drivers/misc/ibmasm/ibmasmfs.c

   258	
   259	static ssize_t command_file_read(struct kiocb *iocb, struct iov_iter *to)
   260	{
   261		struct ibmasmfs_command_data *command_data = iocb->ki_filp->private_data;
 > 262		size_t count = iov_iter_count(to);
   263		struct command *cmd;
   264		int len;
   265		unsigned long flags;
   266	
   267		if (iocb->ki_pos < 0)
   268			return -EINVAL;
   269		if (count == 0 || count > IBMASM_CMD_MAX_BUFFER_SIZE)
   270			return 0;
   271		if (iocb->ki_pos != 0)
   272			return 0;
   273	
   274		spin_lock_irqsave(&command_data->sp->lock, flags);
   275		cmd = command_data->command;
   276		if (cmd == NULL) {
   277			spin_unlock_irqrestore(&command_data->sp->lock, flags);
   278			return 0;
   279		}
   280		command_data->command = NULL;
   281		spin_unlock_irqrestore(&command_data->sp->lock, flags);
   282	
   283		if (cmd->status != IBMASM_CMD_COMPLETE) {
   284			command_put(cmd);
   285			return -EIO;
   286		}
   287		len = min(count, cmd->buffer_size);
 > 288		if (!copy_to_iter_full(cmd->buffer, len, to)) {
   289			command_put(cmd);
   290			return -EFAULT;
   291		}
   292		command_put(cmd);
   293	
   294		return len;
   295	}
   296	
   297	static ssize_t command_file_write(struct kiocb *iocb, struct iov_iter *from)
   298	{
   299		struct ibmasmfs_command_data *command_data = iocb->ki_filp->private_data;
   300		size_t count = iov_iter_count(from);
   301		struct command *cmd;
   302		unsigned long flags;
   303	
   304		if (iocb->ki_pos < 0)
   305			return -EINVAL;
   306		if (count == 0 || count > IBMASM_CMD_MAX_BUFFER_SIZE)
   307			return 0;
   308		if (iocb->ki_pos != 0)
   309			return 0;
   310	
   311		/* commands are executed sequentially, only one command at a time */
   312		if (command_data->command)
   313			return -EAGAIN;
   314	
   315		cmd = ibmasm_new_command(command_data->sp, count);
   316		if (!cmd)
   317			return -ENOMEM;
   318	
 > 319		if (!copy_from_iter_full(cmd->buffer, count, from)) {
   320			command_put(cmd);
   321			return -EFAULT;
   322		}
   323	
   324		spin_lock_irqsave(&command_data->sp->lock, flags);
   325		if (command_data->command) {
   326			spin_unlock_irqrestore(&command_data->sp->lock, flags);
   327			command_put(cmd);
   328			return -EAGAIN;
   329		}
   330		command_data->command = cmd;
   331		spin_unlock_irqrestore(&command_data->sp->lock, flags);
   332	
   333		ibmasm_exec_command(command_data->sp, cmd);
   334		ibmasm_wait_for_response(cmd, get_dot_command_timeout(cmd->buffer));
   335	
   336		return count;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
