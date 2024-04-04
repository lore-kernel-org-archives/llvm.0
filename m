Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F0127B7D;
	Thu,  4 Apr 2024 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253908; cv=none; b=GwwoDMwkZ6N1g1rIp4CvIKUJ9eP4W5luhrHESLjEdSu+6bkSEHHuvOl8NS2q+29vU+VSAA3VLf5EpQ02gx3P77ZRYD1hunQSTksmu/rV4WVUSZiglaCoSIFm3aOCx4amtC6hpN58DKPJaJap3mF5Y/r8MOTXzp025ctkAyHjfys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253908; c=relaxed/simple;
	bh=LDgLx1fM+SZoC9tsTP74Q4cAW59nTRTMK6JtUW219TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UuvNix1cRFjtDQQm5hNJyW77N3oKQ8w5uZebCXhdUKXPmwF2kAorEHpPVLhaobbOGlniaj7x/eDZfVXqG6zyX+LpcMcrFS0OCArPHWIpy2YtRgJ4honyWrcrtwvZ85uqs5CDmNqRg15OC4UXJNSUG2h7wCp4h9TeJ29Jt49IouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UucG4UNV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UucG4UNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712253906; x=1743789906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDgLx1fM+SZoC9tsTP74Q4cAW59nTRTMK6JtUW219TA=;
  b=UucG4UNVEjBGaDHxf3UXAxTh4NysG4/LsfHdrpzmz2rX5u5mz7GwT+qp
   hDI06XjILj4ph8t7UllBEWGkS6+OsBeLlTG8NfDLHL6kLj6sbg/zCm/4h
   Bpw0s5Vu5TgovtEzjXhooe5KOTxbWwNC1UIPPezKgW8STd++lBtYjGiyJ
   jryvxegz3oNvpiHLGNUL3KD05FHf94nQ/v3P2v6iX/FQC/QM+wNNLJOR0
   KL+bCHfFHh+PIxvkqsjn7d/2lojle/YmjysoK1cSXN5ER3v8S6CfrmXPj
   1DhLIUvqr/PlJ8hDruKNZ/0EeldlvTXrVcaXiIHMeV1hYcxcG6aC4rwbu
   A==;
X-CSE-ConnectionGUID: jcdx+HvVS2qYYn8GsQ+ssA==
X-CSE-MsgGUID: QdsRIuMvQMaJ8EiF2XJJtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="32957587"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="32957587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:05:05 -0700
X-CSE-ConnectionGUID: shXNm3y8R+uhK2FINXVCRw==
X-CSE-MsgGUID: vrsUtNMpTdmz5uTZrphQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23560209"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2024 11:05:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsRSP-0001LY-2S;
	Thu, 04 Apr 2024 18:05:01 +0000
Date: Fri, 5 Apr 2024 02:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/17] drivers/char/ipmi/bt-bmc.c:178:17: error:
 implicit declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404050229.YuJFqaU1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   a547cd15f9b41b59198fd91d7ca5711af1452a51
commit: a60eb2a07b5eb5064a5636204550c1df87d20751 [8/17] char: convert drivers to use ->read_iter() and ->write_iter()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050229.YuJFqaU1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050229.YuJFqaU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050229.YuJFqaU1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/bt-bmc.c:178:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(to);
                          ^
>> drivers/char/ipmi/bt-bmc.c:218:8: error: implicit declaration of function 'copy_to_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!copy_to_iter_full(kbuffer, nread + len_byte, to)) {
                        ^
   drivers/char/ipmi/bt-bmc.c:243:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
>> drivers/char/ipmi/bt-bmc.c:277:8: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!copy_from_iter_full(&kbuffer, nwritten, from)) {
                        ^
   drivers/char/ipmi/bt-bmc.c:277:8: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   4 errors generated.
--
   In file included from drivers/char/tpm/tpm-dev-common.c:19:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm-dev-common.c:128:16: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t size = iov_iter_count(to);
                         ^
>> drivers/char/tpm/tpm-dev-common.c:143:8: error: implicit declaration of function 'copy_to_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   rc = copy_to_iter_full(priv->data_buffer + iocb->ki_pos, ret_size, to);
                        ^
   drivers/char/tpm/tpm-dev-common.c:168:16: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t size = iov_iter_count(from);
                         ^
>> drivers/char/tpm/tpm-dev-common.c:186:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(priv->data_buffer, size, from)) {
                ^
   drivers/char/tpm/tpm-dev-common.c:186:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   1 warning and 4 errors generated.


vim +/iov_iter_count +178 drivers/char/ipmi/bt-bmc.c

   161	
   162	/*
   163	 * The BT (Block Transfer) interface means that entire messages are
   164	 * buffered by the host before a notification is sent to the BMC that
   165	 * there is data to be read. The first byte is the length and the
   166	 * message data follows. The read operation just tries to capture the
   167	 * whole before returning it to userspace.
   168	 *
   169	 * BT Message format :
   170	 *
   171	 *    Byte 1  Byte 2     Byte 3  Byte 4  Byte 5:N
   172	 *    Length  NetFn/LUN  Seq     Cmd     Data
   173	 *
   174	 */
   175	static ssize_t bt_bmc_read(struct kiocb *iocb, struct iov_iter *to)
   176	{
   177		struct bt_bmc *bt_bmc = file_bt_bmc(iocb->ki_filp);
 > 178		size_t count = iov_iter_count(to);
   179		u8 len;
   180		int len_byte = 1;
   181		u8 kbuffer[BT_BMC_BUFFER_SIZE];
   182		ssize_t ret = 0;
   183		ssize_t nread;
   184	
   185		WARN_ON(iocb->ki_pos);
   186	
   187		if (wait_event_interruptible(bt_bmc->queue,
   188					     bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN))
   189			return -ERESTARTSYS;
   190	
   191		mutex_lock(&bt_bmc->mutex);
   192	
   193		if (unlikely(!(bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN))) {
   194			ret = -EIO;
   195			goto out_unlock;
   196		}
   197	
   198		set_b_busy(bt_bmc);
   199		clr_h2b_atn(bt_bmc);
   200		clr_rd_ptr(bt_bmc);
   201	
   202		/*
   203		 * The BT frames start with the message length, which does not
   204		 * include the length byte.
   205		 */
   206		kbuffer[0] = bt_read(bt_bmc);
   207		len = kbuffer[0];
   208	
   209		/* We pass the length back to userspace as well */
   210		if (len + 1 > count)
   211			len = count - 1;
   212	
   213		while (len) {
   214			nread = min_t(ssize_t, len, sizeof(kbuffer) - len_byte);
   215	
   216			bt_readn(bt_bmc, kbuffer + len_byte, nread);
   217	
 > 218			if (!copy_to_iter_full(kbuffer, nread + len_byte, to)) {
   219				ret = -EFAULT;
   220				break;
   221			}
   222			len -= nread;
   223			ret += nread + len_byte;
   224			len_byte = 0;
   225		}
   226	
   227		clr_b_busy(bt_bmc);
   228	
   229	out_unlock:
   230		mutex_unlock(&bt_bmc->mutex);
   231		return ret;
   232	}
   233	
   234	/*
   235	 * BT Message response format :
   236	 *
   237	 *    Byte 1  Byte 2     Byte 3  Byte 4  Byte 5  Byte 6:N
   238	 *    Length  NetFn/LUN  Seq     Cmd     Code    Data
   239	 */
   240	static ssize_t bt_bmc_write(struct kiocb *iocb, struct iov_iter *from)
   241	{
   242		struct bt_bmc *bt_bmc = file_bt_bmc(iocb->ki_filp);
   243		size_t count = iov_iter_count(from);
   244		u8 kbuffer[BT_BMC_BUFFER_SIZE];
   245		ssize_t ret = 0;
   246		ssize_t nwritten;
   247	
   248		/*
   249		 * send a minimum response size
   250		 */
   251		if (count < 5)
   252			return -EINVAL;
   253	
   254		WARN_ON(iocb->ki_pos);
   255	
   256		/*
   257		 * There's no interrupt for clearing bmc busy so we have to
   258		 * poll
   259		 */
   260		if (wait_event_interruptible(bt_bmc->queue,
   261					     !(bt_inb(bt_bmc, BT_CTRL) &
   262					       (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))))
   263			return -ERESTARTSYS;
   264	
   265		mutex_lock(&bt_bmc->mutex);
   266	
   267		if (unlikely(bt_inb(bt_bmc, BT_CTRL) &
   268			     (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))) {
   269			ret = -EIO;
   270			goto out_unlock;
   271		}
   272	
   273		clr_wr_ptr(bt_bmc);
   274	
   275		while (count) {
   276			nwritten = min_t(ssize_t, count, sizeof(kbuffer));
 > 277			if (!copy_from_iter_full(&kbuffer, nwritten, from)) {
   278				ret = -EFAULT;
   279				break;
   280			}
   281	
   282			bt_writen(bt_bmc, kbuffer, nwritten);
   283	
   284			count -= nwritten;
   285			ret += nwritten;
   286		}
   287	
   288		set_b2h_atn(bt_bmc);
   289	
   290	out_unlock:
   291		mutex_unlock(&bt_bmc->mutex);
   292		return ret;
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
