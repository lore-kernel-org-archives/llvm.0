Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058F2253FC
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615469; cv=none; b=DiWnZWsH1dVBPDOJiy3VkL3aAmyUA01v2ygRsbEQpMwYEHc85pS1FM6tUj6q3skkMM5SzIFJtq3qk0S+Pa/naXNaVAB8hJCEICWK69tOl9lZcMU9qVmhTAV4ssgHYENfIbD3vskwZqYzKF9k1EVAKGGuBDIQpUfo4C959OISWZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615469; c=relaxed/simple;
	bh=mUQmF2HpuZgKFr0NvJu8cI8+nN69AAUtuxAGgMJkyog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0Nissw+5AA1/tJXDH8i8OJFq84vyYnMrQynPrp3G9NZ1SjdYzFPk4Faor/8UhQadnViUrgS/GlLHrO8qkbJ5Skhl4C5ig0LhYvUBM4pMRA5JR+aR9WAXxBfzgqMajWv5VRnxkKAGKeDMS33Sts+uHewddxauqTaD06EpyhuErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xlQ4HaAZ; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xlQ4HaAZ"
Date: Tue, 19 Aug 2025 10:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755615465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A8XZjOSj3Gm+y/dit7zSgbOod42EPkCv3AgOQjbvngs=;
	b=xlQ4HaAZMzxNcNpNNfmY9WBWCmhRapUhXT5qUkH493ONqEownMcj7drd3zI1NpPeRBM+tj
	keRSBUuJIgN+Hobo54HHH4ISjYj1fxA3pxOwA4IXtXy5hUyScaH0GpCB7RLmg6EtjQCwDD
	khu2pkIDikTnUJ2xlaU1lccUeS8l5fA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [koverstreet-bcachefs:bcachefs-testing 315/315] ld.lld: error:
 duplicate symbol: __tracepoint_io_read
Message-ID: <ujqytz6ysengalwiukpf5j24urkdyijq255ys7zgzevkzkyu2o@7ye2os3lu3a5>
References: <202508192038.S6x4nOyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508192038.S6x4nOyC-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT

__traceiter_tracepointname - is this something easily fixable, or do I
just have to rename?

On Tue, Aug 19, 2025 at 08:21:49PM +0800, kernel test robot wrote:
> tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
> head:   18104c9e108e1d96c66acb5f4f26f891c3f643cd
> commit: 18104c9e108e1d96c66acb5f4f26f891c3f643cd [315/315] bcachefs: trace_io_read()
> config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250819/202508192038.S6x4nOyC-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192038.S6x4nOyC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508192038.S6x4nOyC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: duplicate symbol: __traceiter_io_read
>    >>> defined at trace.c
>    >>>            fs/bcachefs/trace.o:(__traceiter_io_read) in archive vmlinux.a
>    >>> defined at debug.c
>    >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x120) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: __tracepoint_io_read
>    >>> defined at trace.c
>    >>>            fs/bcachefs/trace.o:(__tracepoint_io_read) in archive vmlinux.a
>    >>> defined at debug.c
>    >>>            drivers/net/wireless/silabs/wfx/debug.o:(__tracepoints+0x60) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: __probestub_io_read
>    >>> defined at trace.c
>    >>>            fs/bcachefs/trace.o:(__probestub_io_read) in archive vmlinux.a
>    >>> defined at debug.c
>    >>>            drivers/net/wireless/silabs/wfx/debug.o:(.text+0x170) in archive vmlinux.a
> --
> >> ld.lld: error: duplicate symbol: __SCK__tp_func_io_read
>    >>> defined at trace.c
>    >>>            fs/bcachefs/trace.o:(__SCK__tp_func_io_read) in archive vmlinux.a
>    >>> defined at debug.c
>    >>>            drivers/net/wireless/silabs/wfx/debug.o:(.data+0xc) in archive vmlinux.a
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
