Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214E6F2EA;
	Tue, 10 Sep 2024 01:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725931291; cv=none; b=nNhVYiXM/tjRqwFtYorNPlov+6aWAfNJb1Kx/gs30ffHeaTfOsFJkrmJpYR72PuHKCXH1zEoJn7x0jYVz9kiNrDPKtcm4CRU86th/6m+PESYZsVHTpM2iw27pOaEsanDy9MO13kIk4U1+MCNP5O5wec+BJgm5aS6139T/qqm240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725931291; c=relaxed/simple;
	bh=47BuXYbruCR0gw5tGLOtmVdd2LPD98sn1OpkYaPVnq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOzROpS9ZXDf/BANuzGDfjVbdDLEdMs1xLfywy5uKm6yBWH1Y6b4vCbqJwRxkJ+UCC8se+4jWD0HDSQT7ufrxv4tb30Ei5AOIv5gIYlL+7AVRB7wDlcThw1StY/G5Pr59BjVZ7mgaRGIEFLOXhy0AqdfdUqsUJxZTzbcnT4bNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/7nHf1p; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/7nHf1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725931289; x=1757467289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=47BuXYbruCR0gw5tGLOtmVdd2LPD98sn1OpkYaPVnq4=;
  b=i/7nHf1pPC28R7deqYplKvrZ3y1nxuP66fe5+DcgBQ5DeKVT+WYa4QoX
   URmGqg9wnVRgge+/AGc0RFCgIgm/EiHHgoR3st1T0sTLCiF4nKU1gemel
   Hyrdxr/ENTRe8hmcPEi3K6QB6EM5xCp/uuQvsrwP4rFtDu6hxEttLkTky
   T29aJv/dEev2v1Grlm2Jnj6oCJ4awUfNlTHP2JoXOqU/mfsq59RitAuCJ
   E8lLrwtnF0LvsFQP8CFLc0oPsrg1Prt9dyGg6fmSrAyCo4TrOCtVZxA0p
   GHMg9d9Fu7nz37Fhexwiy0EsHKeaSwKpGEum4NWnmKRrjja3CUS5XqD8L
   w==;
X-CSE-ConnectionGUID: RyRIrPmjR+uhhsQNNegtyg==
X-CSE-MsgGUID: jcUkiWHSRKyNPl1mcBrYaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36003527"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36003527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:21:26 -0700
X-CSE-ConnectionGUID: 0XfhrLygRgeHL8Kar55Z9g==
X-CSE-MsgGUID: 5dEWjsIASUCPXNJcGJjkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67394951"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 18:21:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snpZK-000FSA-25;
	Tue, 10 Sep 2024 01:21:22 +0000
Date: Tue, 10 Sep 2024 09:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 209/258]
 fs/bcachefs/thread_with_file.c:139:22: error: incompatible pointer types
 passing 'struct kiocb *' to parameter of type 'struct pipe_inode_info *'
Message-ID: <202409100927.ibrz6qEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 79e9f469b262e253396d71d7af0945da30a61cd0 [209/258] bcachefs: convert thread_with_stdio to pipes WIP
config: i386-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100927.ibrz6qEv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100927.ibrz6qEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100927.ibrz6qEv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
>> fs/bcachefs/thread_with_file.c:139:22: error: incompatible pointer types passing 'struct kiocb *' to parameter of type 'struct pipe_inode_info *' [-Werror,-Wincompatible-pointer-types]
     139 |         return do_pipe_read(kiocb, iter, thr->in);
         |                             ^~~~~
   include/linux/pipe_fs_i.h:273:46: note: passing argument to parameter 'pipe' here
     273 | ssize_t do_pipe_read(struct pipe_inode_info *pipe,
         |                                              ^
>> fs/bcachefs/thread_with_file.c:146:44: error: too few arguments to function call, expected 4, have 3
     146 |         return do_pipe_write(kiocb, iter, thr->out);
         |                ~~~~~~~~~~~~~                      ^
   include/linux/pipe_fs_i.h:276:9: note: 'do_pipe_write' declared here
     276 | ssize_t do_pipe_write(struct pipe_inode_info *pipe,
         |         ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     277 |                       struct iov_iter *to,
         |                       ~~~~~~~~~~~~~~~~~~~~
     278 |                       bool nonblock,
         |                       ~~~~~~~~~~~~~~
     279 |                       bool is_packetized);
         |                       ~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/thread_with_file.c:257:2: error: call to undeclared function 'stdio_buf_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |         stdio_buf_init(&thr->stdio.input);
         |         ^
>> fs/bcachefs/thread_with_file.c:257:23: error: no member named 'stdio' in 'struct thread_with_stdio'
     257 |         stdio_buf_init(&thr->stdio.input);
         |                         ~~~  ^
   fs/bcachefs/thread_with_file.c:258:23: error: no member named 'stdio' in 'struct thread_with_stdio'
     258 |         stdio_buf_init(&thr->stdio.output);
         |                         ~~~  ^
   fs/bcachefs/thread_with_file.c:267:22: error: too few arguments to function call, expected 3, have 0
     267 |         return do_pipe_read();
         |                ~~~~~~~~~~~~ ^
   include/linux/pipe_fs_i.h:273:9: note: 'do_pipe_read' declared here
     273 | ssize_t do_pipe_read(struct pipe_inode_info *pipe,
         |         ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     274 |                      struct iov_iter *to,
         |                      ~~~~~~~~~~~~~~~~~~~~
     275 |                      bool nonblock);
         |                      ~~~~~~~~~~~~~
>> fs/bcachefs/thread_with_file.c:275:33: error: call to undeclared function 'stdio_redirect_has_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |                 wait_event_timeout(buf->wait, stdio_redirect_has_input(stdio),
         |                                               ^
>> fs/bcachefs/thread_with_file.c:275:33: error: call to undeclared function 'stdio_redirect_has_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   fs/bcachefs/thread_with_file.c:277:12: error: call to undeclared function 'stdio_redirect_has_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         } while (!stdio_redirect_has_input(stdio));
         |                   ^
>> fs/bcachefs/thread_with_file.c:309:32: error: call to undeclared function 'stdio_redirect_has_more_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     309 |         wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
         |                                       ^
>> fs/bcachefs/thread_with_file.c:309:32: error: call to undeclared function 'stdio_redirect_has_more_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> fs/bcachefs/thread_with_file.c:399:5: error: call to undeclared function 'stdio_redirect_has_output_space'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |                                 stdio_redirect_has_output_space(stdio));
         |                                 ^
   14 errors generated.
--
   In file included from fs/bcachefs/chardev.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
   In file included from fs/bcachefs/chardev.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:421:2: note: 'KMALLOC_DMA' declared here
     421 |         KMALLOC_DMA,
         |         ^
>> fs/bcachefs/chardev.c:156:38: error: no member named 'stdio' in 'struct thread_with_stdio'
     156 |                 bch2_stdio_redirect_printf(&stdio->stdio, false, "%s: errors fixed\n", c->name);
         |                                             ~~~~~  ^
   fs/bcachefs/chardev.c:160:38: error: no member named 'stdio' in 'struct thread_with_stdio'
     160 |                 bch2_stdio_redirect_printf(&stdio->stdio, false, "%s: still has errors\n", c->name);
         |                                             ~~~~~  ^
   fs/bcachefs/chardev.c:226:58: error: no member named 'stdio' in 'struct thread_with_stdio'
     226 |         opt_set(thr->opts, stdio, (u64)(unsigned long)&thr->thr.stdio);
         |                                                        ~~~~~~~~ ^
   fs/bcachefs/opts.h:548:18: note: expanded from macro 'opt_set'
     548 |         (_opts)._name = _v;                                             \
         |                         ^~
   fs/bcachefs/chardev.c:783:23: error: no member named 'stdio' in 'struct thread_with_stdio'
     783 |         c->stdio = &thr->thr.stdio;
         |                     ~~~~~~~~ ^
   6 errors generated.


vim +139 fs/bcachefs/thread_with_file.c

   134	
   135	static ssize_t thread_with_stdio_read(struct kiocb *kiocb, struct iov_iter *iter)
   136	{
   137		struct thread_with_stdio *thr =
   138			container_of(kiocb->ki_filp->private_data, struct thread_with_stdio, thr);
 > 139		return do_pipe_read(kiocb, iter, thr->in);
   140	}
   141	
   142	static ssize_t thread_with_stdio_write(struct kiocb *kiocb, struct iov_iter *iter)
   143	{
   144		struct thread_with_stdio *thr =
   145			container_of(kiocb->ki_filp->private_data, struct thread_with_stdio, thr);
 > 146		return do_pipe_write(kiocb, iter, thr->out);
   147	}
   148	
   149	static __poll_t thread_with_stdio_poll(struct file *file, struct poll_table_struct *wait)
   150	{
   151		struct thread_with_stdio *thr =
   152			container_of(file->private_data, struct thread_with_stdio, thr);
   153	
   154		if (file->f_mode & FMODE_READ)
   155			poll_wait(file, &thr->in->rd_wait, wait);
   156		if (file->f_mode & FMODE_WRITE)
   157			poll_wait(file, &thr->out->wr_wait, wait);
   158	
   159		__poll_t mask = 0;
   160	#if 0
   161		if (stdio_redirect_has_output(&thr->stdio))
   162			mask |= EPOLLIN;
   163		if (stdio_redirect_has_input_space(&thr->stdio))
   164			mask |= EPOLLOUT;
   165		if (thr->thr.done)
   166			mask |= EPOLLHUP|EPOLLERR;
   167	#endif
   168		return mask;
   169	}
   170	
   171	static int thread_with_stdio_flush(struct file *file, fl_owner_t id)
   172	{
   173		struct thread_with_stdio *thr =
   174			container_of(file->private_data, struct thread_with_stdio, thr);
   175	
   176		return thr->thr.ret;
   177	}
   178	
   179	static long thread_with_stdio_ioctl(struct file *file, unsigned int cmd, unsigned long p)
   180	{
   181		struct thread_with_stdio *thr =
   182			container_of(file->private_data, struct thread_with_stdio, thr);
   183	
   184		if (thr->ops->unlocked_ioctl)
   185			return thr->ops->unlocked_ioctl(thr, cmd, p);
   186		return -ENOTTY;
   187	}
   188	
   189	static const struct file_operations thread_with_stdio_fops = {
   190		.llseek		= no_llseek,
   191		.read_iter	= thread_with_stdio_read,
   192		.write_iter	= thread_with_stdio_write,
   193		.poll		= thread_with_stdio_poll,
   194		.flush		= thread_with_stdio_flush,
   195		.release	= thread_with_stdio_release,
   196		.unlocked_ioctl	= thread_with_stdio_ioctl,
   197	};
   198	
   199	static const struct file_operations thread_with_stdout_fops = {
   200		.llseek		= no_llseek,
   201		.read_iter	= thread_with_stdio_read,
   202		.poll		= thread_with_stdio_poll,
   203		.flush		= thread_with_stdio_flush,
   204		.release	= thread_with_stdio_release,
   205		.unlocked_ioctl	= thread_with_stdio_ioctl,
   206	};
   207	
   208	static void thread_with_stdio_fn(void *arg)
   209	{
   210		struct thread_with_stdio *thr = arg;
   211	
   212		thr->thr.ret = thr->ops->fn(thr);
   213		thread_with_stdio_done(thr);
   214	}
   215	
   216	void bch2_thread_with_stdio_exit(struct thread_with_stdio *thr)
   217	{
   218		bch2_thread_with_file_exit(&thr->thr);
   219		if (thr->in)
   220			free_pipe_info(thr->in);
   221		if (thr->out)
   222			free_pipe_info(thr->out);
   223		thr->in = thr->out = NULL;
   224	}
   225	
   226	int bch2_thread_with_stdio_init(struct thread_with_stdio *thr,
   227					const struct thread_with_stdio_ops *ops)
   228	{
   229		thr->ops = ops;
   230		thr->in = alloc_pipe_info();
   231		thr->out = alloc_pipe_info();
   232		if (!thr->in || !thr->out) {
   233			bch2_thread_with_stdio_exit(thr);
   234			return -ENOMEM;
   235		}
   236	
   237		thr->in->writers++;
   238		thr->in->readers++;
   239		return 0;
   240	}
   241	
   242	int __bch2_run_thread_with_stdio(struct thread_with_stdio *thr)
   243	{
   244		return bch2_run_thread_with_file(&thr->thr, &thread_with_stdio_fops, thread_with_stdio_fn);
   245	}
   246	
   247	int bch2_run_thread_with_stdio(struct thread_with_stdio *thr,
   248				       const struct thread_with_stdio_ops *ops)
   249	{
   250		return bch2_thread_with_stdio_init(thr, ops) ?:
   251			__bch2_run_thread_with_stdio(thr);
   252	}
   253	
   254	int bch2_run_thread_with_stdout(struct thread_with_stdio *thr,
   255					const struct thread_with_stdio_ops *ops)
   256	{
 > 257		stdio_buf_init(&thr->stdio.input);
   258		stdio_buf_init(&thr->stdio.output);
   259		thr->ops = ops;
   260	
   261		return bch2_run_thread_with_file(&thr->thr, &thread_with_stdout_fops, thread_with_stdio_fn);
   262	}
   263	EXPORT_SYMBOL_GPL(bch2_run_thread_with_stdout);
   264	
   265	int bch2_stdio_redirect_read(struct stdio_redirect *stdio, char *ubuf, size_t len)
   266	{
   267		return do_pipe_read();
   268		struct stdio_buf *buf = &stdio->input;
   269	
   270		/*
   271		 * we're waiting on user input (or for the file descriptor to be
   272		 * closed), don't want a hung task warning:
   273		 */
   274		do {
 > 275			wait_event_timeout(buf->wait, stdio_redirect_has_input(stdio),
   276					   sysctl_hung_task_timeout_secs * HZ / 2);
   277		} while (!stdio_redirect_has_input(stdio));
   278	
   279		if (stdio->done)
   280			return -1;
   281	
   282		spin_lock(&buf->lock);
   283		int ret = min(len, buf->buf.nr);
   284		buf->buf.nr -= ret;
   285		memcpy(ubuf, buf->buf.data, ret);
   286		memmove(buf->buf.data,
   287			buf->buf.data + ret,
   288			buf->buf.nr);
   289		spin_unlock(&buf->lock);
   290	
   291		wake_up(&buf->wait);
   292		return ret;
   293	}
   294	
   295	int bch2_stdio_redirect_readline_timeout(struct stdio_redirect *stdio,
   296						 darray_char *line,
   297						 unsigned long timeout)
   298	{
   299		unsigned long until = jiffies + timeout, t;
   300		struct stdio_buf *buf = &stdio->input;
   301		size_t seen = 0;
   302	again:
   303		t = timeout != MAX_SCHEDULE_TIMEOUT
   304			? max_t(long, until - jiffies, 0)
   305			: timeout;
   306	
   307		t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
   308	
 > 309		wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
   310	
   311		if (stdio->done)
   312			return -1;
   313	
   314		spin_lock(&buf->lock);
   315		seen = buf->buf.nr;
   316		char *n = memchr(buf->buf.data, '\n', seen);
   317	
   318		if (!n && timeout != MAX_SCHEDULE_TIMEOUT && time_after_eq(jiffies, until)) {
   319			spin_unlock(&buf->lock);
   320			return -ETIME;
   321		}
   322	
   323		if (!n) {
   324			buf->waiting_for_line = true;
   325			spin_unlock(&buf->lock);
   326			goto again;
   327		}
   328	
   329		size_t b = n + 1 - buf->buf.data;
   330		if (b > line->size) {
   331			spin_unlock(&buf->lock);
   332			int ret = darray_resize(line, b);
   333			if (ret)
   334				return ret;
   335			seen = 0;
   336			goto again;
   337		}
   338	
   339		buf->buf.nr -= b;
   340		memcpy(line->data, buf->buf.data, b);
   341		memmove(buf->buf.data,
   342			buf->buf.data + b,
   343			buf->buf.nr);
   344		line->nr = b;
   345	
   346		buf->waiting_for_line = false;
   347		spin_unlock(&buf->lock);
   348	
   349		wake_up(&buf->wait);
   350		return 0;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
