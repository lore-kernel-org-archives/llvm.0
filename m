Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D910FA;
	Wed, 20 Mar 2024 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710897179; cv=none; b=by+Ip4ugs7Rl/D2EeCcP7tZc+XygSGJxhJnQCTplyO0g40XAjOQULM+x+up52TsqbHqSAkR1miqSOiPe5reIstOzTAtBrzpbOhokoU+f73J+Uvs6fcD3g/IWUu+GeYW8MFcR/xaqC28w9SsKec69ZTS9aPUVu6uv2sq2u3EB+98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710897179; c=relaxed/simple;
	bh=O6jp8xHZgg3PgcZpLJYGoYlDWd2V6LzJJ7lC1lpi11w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7IFaGq3U6x6ATVYNrDHuGWRVxPlArQJriNoVahernpYLMiFyWkYFDpKTiujZdbP3+dTthbMaoQgM4jqLk+FYT0ATkGtUE9JeNnmkqxLwP19AvGp1wB67tAt++6gvINbdLtx8jQ9sUJnzyWaf5EwTSLgkqohovtPfJisjAy1PHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSSCG78a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSSCG78a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710897177; x=1742433177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6jp8xHZgg3PgcZpLJYGoYlDWd2V6LzJJ7lC1lpi11w=;
  b=VSSCG78a1T7vVXXCv7vymdLNUhrMZ1XX1aTn1aHJhQ2IvvsVrIP5L4PX
   6Uue8UpMi9MQ7XNSd5piA2NdeZSuipl5qXkm498p82W2kZPDCW7N/Ioup
   hSOmRE5nqheykcDVvG5uE0ch9eAyYHVfcN1B3kJv23k49jVoo6je1UGia
   2nug9kGOv7IXrtwWApuyh1Hk4K/can+zzDv3ungxwI4Z9ZahNS6SqoLrq
   w1kh98OmGV9wQcxZja7KuL5xTvJp0NzZ/l77ENk5e5dfncYrU6C7CDGNO
   Xi2dojixpIOZhru9gpHgB/3bBJ7JdSAJ1NeXqTYRky6fldfneXKwvYqUq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16445862"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="16445862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 18:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="14416095"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2024 18:12:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmkVg-000IDL-1G;
	Wed, 20 Mar 2024 01:12:52 +0000
Date: Wed, 20 Mar 2024 09:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:ring-buffer/core 36/39] kernel/trace/trace.c:8213:37: error:
 too few arguments to function call, expected 5, have 3
Message-ID: <202403200922.BIKcOxkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   cd2b873508a4c85a2993ca58c97688029344fb56
commit: b5ec004e0e8d0b169d92e1fff21d79a3f11c17a8 [36/39] tracing: Allow user-space mapping of the ring-buffer
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240320/202403200922.BIKcOxkG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200922.BIKcOxkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200922.BIKcOxkG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:8213:37: error: too few arguments to function call, expected 5, have 3
    8211 |                         err = ring_buffer_wait(iter->array_buffer->buffer,
         |                               ~~~~~~~~~~~~~~~~
    8212 |                                                iter->cpu_file,
    8213 |                                                iter->tr->buffer_percent);
         |                                                                        ^
   include/linux/ring_buffer.h:104:5: note: 'ring_buffer_wait' declared here
     104 | int ring_buffer_wait(struct trace_buffer *buffer, int cpu, int full,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     105 |                      ring_buffer_cond_fn cond, void *data);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +8213 kernel/trace/trace.c

  8202	
  8203	static long tracing_buffers_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  8204	{
  8205		struct ftrace_buffer_info *info = file->private_data;
  8206		struct trace_iterator *iter = &info->iter;
  8207		int err;
  8208	
  8209		if (cmd == TRACE_MMAP_IOCTL_GET_READER) {
  8210			if (!(file->f_flags & O_NONBLOCK)) {
  8211				err = ring_buffer_wait(iter->array_buffer->buffer,
  8212						       iter->cpu_file,
> 8213						       iter->tr->buffer_percent);
  8214				if (err)
  8215					return err;
  8216			}
  8217	
  8218			return ring_buffer_map_get_reader(iter->array_buffer->buffer,
  8219							  iter->cpu_file);
  8220		} else if (cmd) {
  8221			return -ENOTTY;
  8222		}
  8223	
  8224		/*
  8225		 * An ioctl call with cmd 0 to the ring buffer file will wake up all
  8226		 * waiters
  8227		 */
  8228		mutex_lock(&trace_types_lock);
  8229	
  8230		/* Make sure the waiters see the new wait_index */
  8231		(void)atomic_fetch_inc_release(&iter->wait_index);
  8232	
  8233		ring_buffer_wake_waiters(iter->array_buffer->buffer, iter->cpu_file);
  8234	
  8235		mutex_unlock(&trace_types_lock);
  8236		return 0;
  8237	}
  8238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
