Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D66F4FB;
	Sat,  6 Apr 2024 04:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712379082; cv=none; b=apJKVZ2g24fYwYvZt9k1gJUPw4LVTrOyjSiQDsdcruEdYxo2XZEu/T2RnpUlkCtPqwalBfiFcAHRs7MjNGBlzDBYfasCNPEPa7ZLMy3IcY8m3E6cpDA5Yk6sAclrrMOB8UCQ54fuT6FUv0y0L2yEY0BVEBCcCV3UpGVn3A7DMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712379082; c=relaxed/simple;
	bh=RHF/Lkizyy0zWT8S8i93yfNpHr6cWQIE/pv+5nfRk8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4mbHXPpSC4pTp49ApUe9+nr9N3F5Q2YQdfWmDmGLN6gaTI/ehl4mFBu2FD+fSGAbHlQaLHREAlXNHRrRVF38bjaJbKrnjDCfBcPIq/zt8Cb6JTYR9sGjlbeN8cp18KJENuUT/nS3K2TWlGXYYhHmozPCdSkUYurBcgEFZEWfik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWQkIDEz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWQkIDEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712379081; x=1743915081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHF/Lkizyy0zWT8S8i93yfNpHr6cWQIE/pv+5nfRk8Y=;
  b=PWQkIDEzi8DdMHTkwB0IPFHh/fyJau0oRZdg4OMKUhivji6ox1BaaAM8
   LoBs8tHLNyLPTegLL273KRn2DIzf8CbKQj6KOg6M6dSbXP4FR0XIi9uUa
   zJNVs6+kneXBo0gjNkZAoE3KNoTypHsZ7eAymRWi8o41SWNEQqGentmmB
   I9HXuhBVEKVYeJQ0Zdzo4u3/FoePlCa1fIbvGd3kXcZuRNVBtBDSiowIM
   UO0ClNRY22s/EUCSIVop8qkUSzVugMTNBJHxVdQwyZ8zKH9NhGzzKii2f
   cdOcqBY4hHNIWzcJf+QRZFso40fqnSGXCkG/s+imt0gAdoUaatPGtEQQj
   Q==;
X-CSE-ConnectionGUID: XMlrXHq6Q7SvKgtpfiTKAw==
X-CSE-MsgGUID: o/S9UJHXRZirdDl8Tm7Ssg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7561482"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7561482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 21:51:20 -0700
X-CSE-ConnectionGUID: TKIK+/g+SJiRRvrYJlokBA==
X-CSE-MsgGUID: fOm+j6kuQWaCXu0IBtVjXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19380396"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Apr 2024 21:51:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsy1M-00037y-1w;
	Sat, 06 Apr 2024 04:51:16 +0000
Date: Sat, 6 Apr 2024 12:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 43/100]
 drivers/input/touchscreen/edt-ft5x06.c:744:17: error: call to undeclared
 function 'iov_iter_count'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202404061251.lZz8vXgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   96f24e13a506765e099dc3c9c4f00f986cb0a229
commit: 0b307b873afea9af972f21c38b0d8a4cb5f11451 [43/100] drivers/input: convert to read/write iterators
config: i386-buildonly-randconfig-004-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061251.lZz8vXgj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061251.lZz8vXgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061251.lZz8vXgj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/edt-ft5x06.c:744:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     744 |         size_t count = iov_iter_count(to);
         |                        ^
>> drivers/input/touchscreen/edt-ft5x06.c:802:7: error: call to undeclared function 'copy_to_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     802 |         if (!copy_to_iter_full(tsdata->raw_buffer + iocb->ki_pos, read, to)) {
         |              ^
   2 errors generated.


vim +/iov_iter_count +744 drivers/input/touchscreen/edt-ft5x06.c

   734	
   735	DEFINE_SIMPLE_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
   736				edt_ft5x06_debugfs_mode_set, "%llu\n");
   737	
   738	static ssize_t edt_ft5x06_debugfs_raw_data_read(struct kiocb *iocb,
   739							struct iov_iter *to)
   740	{
   741		struct edt_ft5x06_ts_data *tsdata = iocb->ki_filp->private_data;
   742		struct i2c_client *client = tsdata->client;
   743		int retries  = EDT_RAW_DATA_RETRIES;
 > 744		size_t count = iov_iter_count(to);
   745		unsigned int val;
   746		int i, error;
   747		size_t read = 0;
   748		int colbytes;
   749		u8 *rdbuf;
   750	
   751		if (iocb->ki_pos < 0 || iocb->ki_pos >= tsdata->raw_bufsize)
   752			return 0;
   753	
   754		mutex_lock(&tsdata->mutex);
   755	
   756		if (!tsdata->factory_mode || !tsdata->raw_buffer) {
   757			error = -EIO;
   758			goto out;
   759		}
   760	
   761		error = regmap_write(tsdata->regmap, 0x08, 0x01);
   762		if (error) {
   763			dev_err(&client->dev,
   764				"failed to write 0x08 register, error %d\n", error);
   765			goto out;
   766		}
   767	
   768		do {
   769			usleep_range(EDT_RAW_DATA_DELAY, EDT_RAW_DATA_DELAY + 100);
   770			error = regmap_read(tsdata->regmap, 0x08, &val);
   771			if (error) {
   772				dev_err(&client->dev,
   773					"failed to read 0x08 register, error %d\n",
   774					error);
   775				goto out;
   776			}
   777	
   778			if (val == 1)
   779				break;
   780		} while (--retries > 0);
   781	
   782		if (retries == 0) {
   783			dev_err(&client->dev,
   784				"timed out waiting for register to settle\n");
   785			error = -ETIMEDOUT;
   786			goto out;
   787		}
   788	
   789		rdbuf = tsdata->raw_buffer;
   790		colbytes = tsdata->num_y * sizeof(u16);
   791	
   792		for (i = 0; i < tsdata->num_x; i++) {
   793			rdbuf[0] = i;  /* column index */
   794			error = regmap_bulk_read(tsdata->regmap, 0xf5, rdbuf, colbytes);
   795			if (error)
   796				goto out;
   797	
   798			rdbuf += colbytes;
   799		}
   800	
   801		read = min_t(size_t, count, tsdata->raw_bufsize - iocb->ki_pos);
 > 802		if (!copy_to_iter_full(tsdata->raw_buffer + iocb->ki_pos, read, to)) {
   803			error = -EFAULT;
   804			goto out;
   805		}
   806	
   807		iocb->ki_pos += read;
   808	out:
   809		mutex_unlock(&tsdata->mutex);
   810		return error ?: read;
   811	};
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
