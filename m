Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2913BC3B;
	Thu,  4 Apr 2024 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712272460; cv=none; b=safBrfJKQNWoerHZcIaAlHIkgVjGCUV7VHrRHcLka3W2e1EnhmrXE7Ijz/kWs7k6FERN1armURGOrtXZMPtSVj+mMJwYjLZXIRzu16KdCWHLIMVT5OeyuqmgVhuc6ehZSqyxsCVDdT8kDTP3D/8/Au82t0z/zs+kYGlS58QnUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712272460; c=relaxed/simple;
	bh=ei6M/RiTtnB8l+FFqvaVs+cTiElDqRCy3JyINlxdcB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ko7sjWEeb14KGDuYP4r5yrbBO9iDZa05nuD8Ly74n8+zWGGqe57fivzlM/HJhUwoKNyjEqGc6ZDMAXXlIxfAh2uVjobizHk87GZ+WD3TegAzJiGiwDniZbOBaf/LbxDeIxkMz2stWoaDBRVvxy9oWWqfcxGUNUlktqhZHb9kbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ztf+sZf/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ztf+sZf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712272459; x=1743808459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ei6M/RiTtnB8l+FFqvaVs+cTiElDqRCy3JyINlxdcB4=;
  b=Ztf+sZf/WsdLRgJsk6SlkIXi0WSTXKrJtKP2PIZp8lvX8OwznOExgBPO
   vrXSiqS4cBujV4xA0QtDdSsNlCnzLZPB1M86lCOZvon/wxwP0B0SFoziJ
   Ipgh5dIZogp41xE+dvR6bKI+FGfAytNb+6VFN5Y2VLgw4LO0jO6ZxEWVO
   RJNrqtt8dwx78Jo14+QSw9uvpNakBhFahsnPgQ9MDYZdN/+dWHCAc8xSz
   jWmF8boMS9lZda/WTmxg3tJXFcsZKuHXxyoPHhPzbAxNdS7BrwLkGuV/G
   fQMYE4rAns1Rced0INjmWlAU4x+dylyuF1hGoOo6jEsCfswFyuC/nU4XQ
   w==;
X-CSE-ConnectionGUID: JTplUMDxRMas3MTCOqu3MA==
X-CSE-MsgGUID: QwPn+zMiQiiowdWBXxSs+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18200182"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18200182"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 16:14:16 -0700
X-CSE-ConnectionGUID: hBBSaNwnRSGZTBncX1W7GQ==
X-CSE-MsgGUID: o809V/UFT3+m8A+CapU00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19004295"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2024 16:14:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsWHc-0001cO-1o;
	Thu, 04 Apr 2024 23:14:12 +0000
Date: Fri, 5 Apr 2024 07:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/28] net/rfkill/core.c:1232:17: error:
 implicit declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404050711.86FBnxRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 680367128b5e1961d8c56db7245b2a2d37feb910 [16/28] net: convert drivers to read/write iterators
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050711.86FBnxRP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050711.86FBnxRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050711.86FBnxRP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/rfkill/core.c:1232:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(to);
                          ^
>> net/rfkill/core.c:1262:7: error: implicit declaration of function 'copy_to_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_to_iter_full(&ev->ev, sz, to))
                ^
   net/rfkill/core.c:1275:17: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           size_t count = iov_iter_count(from);
                          ^
>> net/rfkill/core.c:1291:7: error: implicit declaration of function 'copy_from_iter_full' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!copy_from_iter_full(&ev, count, from))
                ^
   net/rfkill/core.c:1291:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
   long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
        ^
   4 errors generated.


vim +/iov_iter_count +1232 net/rfkill/core.c

  1228	
  1229	static ssize_t rfkill_fop_read(struct kiocb *iocb, struct iov_iter *to)
  1230	{
  1231		struct rfkill_data *data = iocb->ki_filp->private_data;
> 1232		size_t count = iov_iter_count(to);
  1233		struct rfkill_int_event *ev;
  1234		unsigned long sz;
  1235		int ret;
  1236	
  1237		mutex_lock(&data->mtx);
  1238	
  1239		while (list_empty(&data->events)) {
  1240			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
  1241				ret = -EAGAIN;
  1242				goto out;
  1243			}
  1244			mutex_unlock(&data->mtx);
  1245			/* since we re-check and it just compares pointers,
  1246			 * using !list_empty() without locking isn't a problem
  1247			 */
  1248			ret = wait_event_interruptible(data->read_wait,
  1249						       !list_empty(&data->events));
  1250			mutex_lock(&data->mtx);
  1251	
  1252			if (ret)
  1253				goto out;
  1254		}
  1255	
  1256		ev = list_first_entry(&data->events, struct rfkill_int_event,
  1257					list);
  1258	
  1259		sz = min_t(unsigned long, sizeof(ev->ev), count);
  1260		sz = min_t(unsigned long, sz, data->max_size);
  1261		ret = sz;
> 1262		if (!copy_to_iter_full(&ev->ev, sz, to))
  1263			ret = -EFAULT;
  1264	
  1265		list_del(&ev->list);
  1266		kfree(ev);
  1267	 out:
  1268		mutex_unlock(&data->mtx);
  1269		return ret;
  1270	}
  1271	
  1272	static ssize_t rfkill_fop_write(struct kiocb *iocb, struct iov_iter *from)
  1273	{
  1274		struct rfkill_data *data = iocb->ki_filp->private_data;
  1275		size_t count = iov_iter_count(from);
  1276		struct rfkill *rfkill;
  1277		struct rfkill_event_ext ev;
  1278		int ret;
  1279	
  1280		/* we don't need the 'hard' variable but accept it */
  1281		if (count < RFKILL_EVENT_SIZE_V1 - 1)
  1282			return -EINVAL;
  1283	
  1284		/*
  1285		 * Copy as much data as we can accept into our 'ev' buffer,
  1286		 * but tell userspace how much we've copied so it can determine
  1287		 * our API version even in a write() call, if it cares.
  1288		 */
  1289		count = min(count, sizeof(ev));
  1290		count = min_t(size_t, count, data->max_size);
> 1291		if (!copy_from_iter_full(&ev, count, from))
  1292			return -EFAULT;
  1293	
  1294		if (ev.type >= NUM_RFKILL_TYPES)
  1295			return -EINVAL;
  1296	
  1297		mutex_lock(&rfkill_global_mutex);
  1298	
  1299		switch (ev.op) {
  1300		case RFKILL_OP_CHANGE_ALL:
  1301			rfkill_update_global_state(ev.type, ev.soft);
  1302			list_for_each_entry(rfkill, &rfkill_list, node)
  1303				if (rfkill->type == ev.type ||
  1304				    ev.type == RFKILL_TYPE_ALL)
  1305					rfkill_set_block(rfkill, ev.soft);
  1306			ret = 0;
  1307			break;
  1308		case RFKILL_OP_CHANGE:
  1309			list_for_each_entry(rfkill, &rfkill_list, node)
  1310				if (rfkill->idx == ev.idx &&
  1311				    (rfkill->type == ev.type ||
  1312				     ev.type == RFKILL_TYPE_ALL))
  1313					rfkill_set_block(rfkill, ev.soft);
  1314			ret = 0;
  1315			break;
  1316		default:
  1317			ret = -EINVAL;
  1318			break;
  1319		}
  1320	
  1321		mutex_unlock(&rfkill_global_mutex);
  1322	
  1323		return ret ?: count;
  1324	}
  1325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
