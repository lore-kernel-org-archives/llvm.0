Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2E6F307;
	Tue, 10 Sep 2024 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930667; cv=none; b=sRHw4XXXzNCwiT3nBX+rGWXO+T3ok5GLTXZdZnJ0mXc7tN2l6zqCNFV2/MIXNgmHU4IKKGkgKKOFxKfa0qAXQBRpzVzSmN5SmeWF85BQ0k5E4i3E9g6+K5fa3vcnMYUlJ+oSEX6M+jzB8cOIjN990YsKj8vQZou+DHNPPOLsrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930667; c=relaxed/simple;
	bh=kAHqqv5AP9zR92QBsSLMPGjalJDBQXRg2hYxYvMc7lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YE60f3TmpLwDaE3yAZI6JwlVLz/qXM1Wv5KrU3yZNMd5B7ch1n7/khc6EytcdSu/H0cwsbdlFoYQX5qLgyPcydUle/OJ+iwMNLGdFfh/tN7wloHW1Rg6e9Fs4zR6yxV/lb+nT/Lj9kRYCriog4kfAVFXPfmDtub3qduDWt83g7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4uRiIfq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4uRiIfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725930666; x=1757466666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kAHqqv5AP9zR92QBsSLMPGjalJDBQXRg2hYxYvMc7lM=;
  b=Z4uRiIfq0PC5NvB5HX658AZK84suQhGcMgajtsOLIE9BovEbZmO+P5gw
   E4mNMUJZjBeTWq/P1oPgmtaKubuUKrOeyIm9atPDIF3M/pBjPYGLdSBOV
   njjIo2jf9UJfvoFojmzd86NIJx7WfQHAV7BvzazP1mGTJN3uKRqztWdT3
   j6IipOd/X5/MKlahlknp28qIN4MGsOWFlbHupLD894hc9fcKIqscYHFgC
   3GnwP19uOtTmw1fx9yfcZ97fU57ENY9+M2z6fAW13Obhf6E9YC4sdeQ+2
   Uek7gALQsiJdh8Cg20wHOqS+PpM0gN/NRDOE2NO7yDgmAS227WxuY8QFl
   Q==;
X-CSE-ConnectionGUID: bXjshB1QR2eBRbBjVvK6ww==
X-CSE-MsgGUID: CTVBspWNSx2YLdFnmgGBCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24800070"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24800070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:11:05 -0700
X-CSE-ConnectionGUID: FSxXmzPqQ7mv9t0j85Obug==
X-CSE-MsgGUID: HtkOPPTFR+Kxt7V58aVe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71823828"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Sep 2024 18:11:03 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snpPI-000FRG-2w;
	Tue, 10 Sep 2024 01:11:00 +0000
Date: Tue, 10 Sep 2024 09:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 209/258]
 fs/bcachefs/thread_with_file.c:257:2: error: implicit declaration of
 function 'stdio_buf_init' is invalid in C99
Message-ID: <202409100953.bIYHF0Ab-lkp@intel.com>
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
config: powerpc64-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100953.bIYHF0Ab-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100953.bIYHF0Ab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100953.bIYHF0Ab-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/thread_with_file.c:139:22: error: incompatible pointer types passing 'struct kiocb *' to parameter of type 'struct pipe_inode_info *' [-Werror,-Wincompatible-pointer-types]
           return do_pipe_read(kiocb, iter, thr->in);
                               ^~~~~
   include/linux/pipe_fs_i.h:273:46: note: passing argument to parameter 'pipe' here
   ssize_t do_pipe_read(struct pipe_inode_info *pipe,
                                                ^
   fs/bcachefs/thread_with_file.c:146:44: error: too few arguments to function call, expected 4, have 3
           return do_pipe_write(kiocb, iter, thr->out);
                  ~~~~~~~~~~~~~                      ^
   include/linux/pipe_fs_i.h:276:9: note: 'do_pipe_write' declared here
   ssize_t do_pipe_write(struct pipe_inode_info *pipe,
           ^
>> fs/bcachefs/thread_with_file.c:257:2: error: implicit declaration of function 'stdio_buf_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           stdio_buf_init(&thr->stdio.input);
           ^
   fs/bcachefs/thread_with_file.c:257:23: error: no member named 'stdio' in 'struct thread_with_stdio'
           stdio_buf_init(&thr->stdio.input);
                           ~~~  ^
   fs/bcachefs/thread_with_file.c:258:23: error: no member named 'stdio' in 'struct thread_with_stdio'
           stdio_buf_init(&thr->stdio.output);
                           ~~~  ^
   fs/bcachefs/thread_with_file.c:267:22: error: too few arguments to function call, expected 3, have 0
           return do_pipe_read();
                  ~~~~~~~~~~~~ ^
   include/linux/pipe_fs_i.h:273:9: note: 'do_pipe_read' declared here
   ssize_t do_pipe_read(struct pipe_inode_info *pipe,
           ^
>> fs/bcachefs/thread_with_file.c:275:33: error: implicit declaration of function 'stdio_redirect_has_input' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   wait_event_timeout(buf->wait, stdio_redirect_has_input(stdio),
                                                 ^
>> fs/bcachefs/thread_with_file.c:275:33: error: implicit declaration of function 'stdio_redirect_has_input' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   fs/bcachefs/thread_with_file.c:277:12: error: implicit declaration of function 'stdio_redirect_has_input' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           } while (!stdio_redirect_has_input(stdio));
                     ^
>> fs/bcachefs/thread_with_file.c:309:32: error: implicit declaration of function 'stdio_redirect_has_more_input' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
                                         ^
>> fs/bcachefs/thread_with_file.c:309:32: error: implicit declaration of function 'stdio_redirect_has_more_input' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>> fs/bcachefs/thread_with_file.c:399:5: error: implicit declaration of function 'stdio_redirect_has_output_space' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   stdio_redirect_has_output_space(stdio));
                                   ^
   12 errors generated.


vim +/stdio_buf_init +257 fs/bcachefs/thread_with_file.c

02bed83d59e37d Kent Overstreet 2024-04-16  253  
fcb1620edd4d59 Darrick J. Wong 2024-02-07  254  int bch2_run_thread_with_stdout(struct thread_with_stdio *thr,
ab6752e24ef1eb Darrick J. Wong 2024-02-10  255  				const struct thread_with_stdio_ops *ops)
fcb1620edd4d59 Darrick J. Wong 2024-02-07  256  {
fcb1620edd4d59 Darrick J. Wong 2024-02-07 @257  	stdio_buf_init(&thr->stdio.input);
fcb1620edd4d59 Darrick J. Wong 2024-02-07  258  	stdio_buf_init(&thr->stdio.output);
ab6752e24ef1eb Darrick J. Wong 2024-02-10  259  	thr->ops = ops;
fcb1620edd4d59 Darrick J. Wong 2024-02-07  260  
fcb1620edd4d59 Darrick J. Wong 2024-02-07  261  	return bch2_run_thread_with_file(&thr->thr, &thread_with_stdout_fops, thread_with_stdio_fn);
fcb1620edd4d59 Darrick J. Wong 2024-02-07  262  }
fcb1620edd4d59 Darrick J. Wong 2024-02-07  263  EXPORT_SYMBOL_GPL(bch2_run_thread_with_stdout);
fcb1620edd4d59 Darrick J. Wong 2024-02-07  264  
60e1baa872a155 Kent Overstreet 2024-02-04  265  int bch2_stdio_redirect_read(struct stdio_redirect *stdio, char *ubuf, size_t len)
96f37eabe7a5cb Kent Overstreet 2023-12-31  266  {
79e9f469b262e2 Kent Overstreet 2024-06-05  267  	return do_pipe_read();
60e1baa872a155 Kent Overstreet 2024-02-04  268  	struct stdio_buf *buf = &stdio->input;
96f37eabe7a5cb Kent Overstreet 2023-12-31  269  
a5a650d6472f23 Kent Overstreet 2024-02-08  270  	/*
a5a650d6472f23 Kent Overstreet 2024-02-08  271  	 * we're waiting on user input (or for the file descriptor to be
a5a650d6472f23 Kent Overstreet 2024-02-08  272  	 * closed), don't want a hung task warning:
a5a650d6472f23 Kent Overstreet 2024-02-08  273  	 */
a5a650d6472f23 Kent Overstreet 2024-02-08  274  	do {
a5a650d6472f23 Kent Overstreet 2024-02-08 @275  		wait_event_timeout(buf->wait, stdio_redirect_has_input(stdio),
a5a650d6472f23 Kent Overstreet 2024-02-08  276  				   sysctl_hung_task_timeout_secs * HZ / 2);
a5a650d6472f23 Kent Overstreet 2024-02-08  277  	} while (!stdio_redirect_has_input(stdio));
a5a650d6472f23 Kent Overstreet 2024-02-08  278  
96f37eabe7a5cb Kent Overstreet 2023-12-31  279  	if (stdio->done)
96f37eabe7a5cb Kent Overstreet 2023-12-31  280  		return -1;
96f37eabe7a5cb Kent Overstreet 2023-12-31  281  
60e1baa872a155 Kent Overstreet 2024-02-04  282  	spin_lock(&buf->lock);
60e1baa872a155 Kent Overstreet 2024-02-04  283  	int ret = min(len, buf->buf.nr);
60e1baa872a155 Kent Overstreet 2024-02-04  284  	buf->buf.nr -= ret;
60e1baa872a155 Kent Overstreet 2024-02-04  285  	memcpy(ubuf, buf->buf.data, ret);
60e1baa872a155 Kent Overstreet 2024-02-04  286  	memmove(buf->buf.data,
60e1baa872a155 Kent Overstreet 2024-02-04  287  		buf->buf.data + ret,
60e1baa872a155 Kent Overstreet 2024-02-04  288  		buf->buf.nr);
60e1baa872a155 Kent Overstreet 2024-02-04  289  	spin_unlock(&buf->lock);
96f37eabe7a5cb Kent Overstreet 2023-12-31  290  
60e1baa872a155 Kent Overstreet 2024-02-04  291  	wake_up(&buf->wait);
96f37eabe7a5cb Kent Overstreet 2023-12-31  292  	return ret;
96f37eabe7a5cb Kent Overstreet 2023-12-31  293  }
96f37eabe7a5cb Kent Overstreet 2023-12-31  294  
d37dd9b6048735 Kent Overstreet 2024-05-29  295  int bch2_stdio_redirect_readline_timeout(struct stdio_redirect *stdio,
d37dd9b6048735 Kent Overstreet 2024-05-29  296  					 darray_char *line,
d37dd9b6048735 Kent Overstreet 2024-05-29  297  					 unsigned long timeout)
96f37eabe7a5cb Kent Overstreet 2023-12-31  298  {
d37dd9b6048735 Kent Overstreet 2024-05-29  299  	unsigned long until = jiffies + timeout, t;
60e1baa872a155 Kent Overstreet 2024-02-04  300  	struct stdio_buf *buf = &stdio->input;
0c97c437e362fb Kent Overstreet 2024-05-29  301  	size_t seen = 0;
f704f108af79c1 Kent Overstreet 2024-02-04  302  again:
d37dd9b6048735 Kent Overstreet 2024-05-29  303  	t = timeout != MAX_SCHEDULE_TIMEOUT
d37dd9b6048735 Kent Overstreet 2024-05-29  304  		? max_t(long, until - jiffies, 0)
d37dd9b6048735 Kent Overstreet 2024-05-29  305  		: timeout;
d37dd9b6048735 Kent Overstreet 2024-05-29  306  
d37dd9b6048735 Kent Overstreet 2024-05-29  307  	t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
d37dd9b6048735 Kent Overstreet 2024-05-29  308  
d37dd9b6048735 Kent Overstreet 2024-05-29 @309  	wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
a5a650d6472f23 Kent Overstreet 2024-02-08  310  
0c97c437e362fb Kent Overstreet 2024-05-29  311  	if (stdio->done)
0c97c437e362fb Kent Overstreet 2024-05-29  312  		return -1;
96f37eabe7a5cb Kent Overstreet 2023-12-31  313  
60e1baa872a155 Kent Overstreet 2024-02-04  314  	spin_lock(&buf->lock);
0c97c437e362fb Kent Overstreet 2024-05-29  315  	seen = buf->buf.nr;
0c97c437e362fb Kent Overstreet 2024-05-29  316  	char *n = memchr(buf->buf.data, '\n', seen);
d37dd9b6048735 Kent Overstreet 2024-05-29  317  
290ebc9d126c2d Chen Yufan      2024-08-22  318  	if (!n && timeout != MAX_SCHEDULE_TIMEOUT && time_after_eq(jiffies, until)) {
d37dd9b6048735 Kent Overstreet 2024-05-29  319  		spin_unlock(&buf->lock);
d37dd9b6048735 Kent Overstreet 2024-05-29  320  		return -ETIME;
d37dd9b6048735 Kent Overstreet 2024-05-29  321  	}
d37dd9b6048735 Kent Overstreet 2024-05-29  322  
0c97c437e362fb Kent Overstreet 2024-05-29  323  	if (!n) {
0c97c437e362fb Kent Overstreet 2024-05-29  324  		buf->waiting_for_line = true;
0c97c437e362fb Kent Overstreet 2024-05-29  325  		spin_unlock(&buf->lock);
0c97c437e362fb Kent Overstreet 2024-05-29  326  		goto again;
0c97c437e362fb Kent Overstreet 2024-05-29  327  	}
0c97c437e362fb Kent Overstreet 2024-05-29  328  
0c97c437e362fb Kent Overstreet 2024-05-29  329  	size_t b = n + 1 - buf->buf.data;
0c97c437e362fb Kent Overstreet 2024-05-29  330  	if (b > line->size) {
0c97c437e362fb Kent Overstreet 2024-05-29  331  		spin_unlock(&buf->lock);
0c97c437e362fb Kent Overstreet 2024-05-29  332  		int ret = darray_resize(line, b);
0c97c437e362fb Kent Overstreet 2024-05-29  333  		if (ret)
0c97c437e362fb Kent Overstreet 2024-05-29  334  			return ret;
0c97c437e362fb Kent Overstreet 2024-05-29  335  		seen = 0;
0c97c437e362fb Kent Overstreet 2024-05-29  336  		goto again;
0c97c437e362fb Kent Overstreet 2024-05-29  337  	}
0c97c437e362fb Kent Overstreet 2024-05-29  338  
f704f108af79c1 Kent Overstreet 2024-02-04  339  	buf->buf.nr -= b;
0c97c437e362fb Kent Overstreet 2024-05-29  340  	memcpy(line->data, buf->buf.data, b);
60e1baa872a155 Kent Overstreet 2024-02-04  341  	memmove(buf->buf.data,
f704f108af79c1 Kent Overstreet 2024-02-04  342  		buf->buf.data + b,
60e1baa872a155 Kent Overstreet 2024-02-04  343  		buf->buf.nr);
0c97c437e362fb Kent Overstreet 2024-05-29  344  	line->nr = b;
0c97c437e362fb Kent Overstreet 2024-05-29  345  
0c97c437e362fb Kent Overstreet 2024-05-29  346  	buf->waiting_for_line = false;
60e1baa872a155 Kent Overstreet 2024-02-04  347  	spin_unlock(&buf->lock);
60e1baa872a155 Kent Overstreet 2024-02-04  348  
60e1baa872a155 Kent Overstreet 2024-02-04  349  	wake_up(&buf->wait);
0c97c437e362fb Kent Overstreet 2024-05-29  350  	return 0;
96f37eabe7a5cb Kent Overstreet 2023-12-31  351  }
d641d4cae72a17 Kent Overstreet 2024-01-03  352  
d37dd9b6048735 Kent Overstreet 2024-05-29  353  int bch2_stdio_redirect_readline(struct stdio_redirect *stdio, darray_char *line)
d37dd9b6048735 Kent Overstreet 2024-05-29  354  {
d37dd9b6048735 Kent Overstreet 2024-05-29  355  	return bch2_stdio_redirect_readline_timeout(stdio, line, MAX_SCHEDULE_TIMEOUT);
d37dd9b6048735 Kent Overstreet 2024-05-29  356  }
d37dd9b6048735 Kent Overstreet 2024-05-29  357  
60e1baa872a155 Kent Overstreet 2024-02-04  358  __printf(3, 0)
1cbae651e5c875 Darrick J. Wong 2024-02-07  359  static ssize_t bch2_darray_vprintf(darray_char *out, gfp_t gfp, const char *fmt, va_list args)
60e1baa872a155 Kent Overstreet 2024-02-04  360  {
1cbae651e5c875 Darrick J. Wong 2024-02-07  361  	ssize_t ret;
60e1baa872a155 Kent Overstreet 2024-02-04  362  
60e1baa872a155 Kent Overstreet 2024-02-04  363  	do {
60e1baa872a155 Kent Overstreet 2024-02-04  364  		va_list args2;
1cbae651e5c875 Darrick J. Wong 2024-02-07  365  		size_t len;
60e1baa872a155 Kent Overstreet 2024-02-04  366  
1cbae651e5c875 Darrick J. Wong 2024-02-07  367  		va_copy(args2, args);
60e1baa872a155 Kent Overstreet 2024-02-04  368  		len = vsnprintf(out->data + out->nr, darray_room(*out), fmt, args2);
6b33312925a77c Kent Overstreet 2024-02-13  369  		va_end(args2);
6b33312925a77c Kent Overstreet 2024-02-13  370  
1cbae651e5c875 Darrick J. Wong 2024-02-07  371  		if (len + 1 <= darray_room(*out)) {
1cbae651e5c875 Darrick J. Wong 2024-02-07  372  			out->nr += len;
1cbae651e5c875 Darrick J. Wong 2024-02-07  373  			return len;
1cbae651e5c875 Darrick J. Wong 2024-02-07  374  		}
1cbae651e5c875 Darrick J. Wong 2024-02-07  375  
1cbae651e5c875 Darrick J. Wong 2024-02-07  376  		ret = darray_make_room_gfp(out, len + 1, gfp);
1cbae651e5c875 Darrick J. Wong 2024-02-07  377  	} while (ret == 0);
60e1baa872a155 Kent Overstreet 2024-02-04  378  
1cbae651e5c875 Darrick J. Wong 2024-02-07  379  	return ret;
60e1baa872a155 Kent Overstreet 2024-02-04  380  }
60e1baa872a155 Kent Overstreet 2024-02-04  381  
1cbae651e5c875 Darrick J. Wong 2024-02-07  382  ssize_t bch2_stdio_redirect_vprintf(struct stdio_redirect *stdio, bool nonblocking,
60e1baa872a155 Kent Overstreet 2024-02-04  383  				    const char *fmt, va_list args)
60e1baa872a155 Kent Overstreet 2024-02-04  384  {
60e1baa872a155 Kent Overstreet 2024-02-04  385  	struct stdio_buf *buf = &stdio->output;
60e1baa872a155 Kent Overstreet 2024-02-04  386  	unsigned long flags;
1cbae651e5c875 Darrick J. Wong 2024-02-07  387  	ssize_t ret;
60e1baa872a155 Kent Overstreet 2024-02-04  388  
1cbae651e5c875 Darrick J. Wong 2024-02-07  389  again:
60e1baa872a155 Kent Overstreet 2024-02-04  390  	spin_lock_irqsave(&buf->lock, flags);
1cbae651e5c875 Darrick J. Wong 2024-02-07  391  	ret = bch2_darray_vprintf(&buf->buf, GFP_NOWAIT, fmt, args);
60e1baa872a155 Kent Overstreet 2024-02-04  392  	spin_unlock_irqrestore(&buf->lock, flags);
60e1baa872a155 Kent Overstreet 2024-02-04  393  
1cbae651e5c875 Darrick J. Wong 2024-02-07  394  	if (ret < 0) {
1cbae651e5c875 Darrick J. Wong 2024-02-07  395  		if (nonblocking)
1cbae651e5c875 Darrick J. Wong 2024-02-07  396  			return -EAGAIN;
1cbae651e5c875 Darrick J. Wong 2024-02-07  397  
1cbae651e5c875 Darrick J. Wong 2024-02-07  398  		ret = wait_event_interruptible(buf->wait,
1cbae651e5c875 Darrick J. Wong 2024-02-07 @399  				stdio_redirect_has_output_space(stdio));
1cbae651e5c875 Darrick J. Wong 2024-02-07  400  		if (ret)
1cbae651e5c875 Darrick J. Wong 2024-02-07  401  			return ret;
1cbae651e5c875 Darrick J. Wong 2024-02-07  402  		goto again;
1cbae651e5c875 Darrick J. Wong 2024-02-07  403  	}
1cbae651e5c875 Darrick J. Wong 2024-02-07  404  
60e1baa872a155 Kent Overstreet 2024-02-04  405  	wake_up(&buf->wait);
1cbae651e5c875 Darrick J. Wong 2024-02-07  406  	return ret;
60e1baa872a155 Kent Overstreet 2024-02-04  407  }
60e1baa872a155 Kent Overstreet 2024-02-04  408  

:::::: The code at line 257 was first introduced by commit
:::::: fcb1620edd4d59eff4b3466be1d61263cea958a8 bcachefs: thread_with_file: allow creation of readonly files

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
