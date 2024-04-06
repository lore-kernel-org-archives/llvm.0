Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06ABA38;
	Sat,  6 Apr 2024 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712365875; cv=none; b=Mg5OUFRbJ4r/8K4Y5EU2c9XfKKMllGWlcCVZ32CsWk2yooJnDNVlap9foeYLA8bGIZiA3MEhODqX0t2oQ5mkmUtrJ7AhA0sTIsrl7khDBVni4XxQa/Ouac1d2e94bWjyMJAEMz9f+yFOFmaHlZUXhf5X3wCq+iOPfXf/O94C5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712365875; c=relaxed/simple;
	bh=KRgnLwqUcVuRJJhN3uymRZ8oVrQ47Bo/yDN0Pj4d8Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJNWKfOpR/oYd0Gdh3+Y12CN4sxQTVoiJJiX+Q4zhFKV9OfZf2req/Bpl7+lfRQcaExxFzegy3KBLcYUHtTpv+9OZPdd8fQq+vLWRW5i62o/WmaZgxRDgmraBV1Tf3xiPf8f0/0f2bfrId2SfGy1fJ18pprWXInu4kVUy9/eKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kA0CuSJq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA0CuSJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712365874; x=1743901874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRgnLwqUcVuRJJhN3uymRZ8oVrQ47Bo/yDN0Pj4d8Mk=;
  b=kA0CuSJqj15uvmXiCR1kKQPLzfxtjNJF0nSEn1yIcY4z9i/3/RoC0nL0
   mGSzU5cUPgLEtieeurU6JOGXnvbdMuE3pra3kQfF0qsD4h0zuL2+iKZQn
   +a5xwPxhJ1H38BLqh7xKFAX3XeRFpqrXxciB7rohnfVfdPuKo4xzE+7ba
   qH4922I8ELYqt8kLIBT23SnHgibVv4xrMcVHNgAaORnfUND5kDO16YY+R
   mCEiH80vhNVodJlcWE9Src2U3tiZHnM+XhcCAfsG6Chk1+AHyQEo8AVQI
   MD3eb24p8g3d4Pcg1xUpN3yGLN24hFOfdNeFJDP+xKCSjg6Y122fsPahw
   w==;
X-CSE-ConnectionGUID: rgAanp/bR+aeQqrYiqjPog==
X-CSE-MsgGUID: 0UHUneR8SgabTmwnwj/aIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7840333"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7840333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 18:11:13 -0700
X-CSE-ConnectionGUID: yltzEmToQVG0di4dG4jBPA==
X-CSE-MsgGUID: N2Jp6AQuRrOn/y47Mqs8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19443578"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2024 18:11:12 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsuaL-0002xA-2T;
	Sat, 06 Apr 2024 01:11:09 +0000
Date: Sat, 6 Apr 2024 09:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 43/93]
 drivers/input/touchscreen/edt-ft5x06.c:744:17: error: implicit declaration
 of function 'iov_iter_count' is invalid in C99
Message-ID: <202404060904.ph8rsdX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: cad8ac2aa017e28b2f42619ff98e0dfdfe1763f7 [43/93] drivers/input: convert to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060904.ph8rsdX4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060904.ph8rsdX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060904.ph8rsdX4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/edt-ft5x06.c:744:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(to);
                          ^
>> drivers/input/touchscreen/edt-ft5x06.c:802:7: error: implicit declaration of function 'copy_to_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_to_iter_full(tsdata->raw_buffer + iocb->ki_pos, read, to)) {
                ^
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
