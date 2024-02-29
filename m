Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF697C094;
	Thu, 29 Feb 2024 23:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709250297; cv=none; b=gubwble3aqzcxqa9TVCZ3F0bJsou5xIgeuAhhkWI1XQeeTMpMoOc5Hfj3NpvqTyNbpIAvaANhlNLFUbo1S+cY1WBqemrfDed0cme7/om60ve9oge3E2/WHkFiDETVlGOFji90xn+nPnSij1TU/HBv5XbAt5KSr2qMJ7T2IEizJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709250297; c=relaxed/simple;
	bh=qa9Uq860kOdvHNmNrVFdx4l6XPMgXK03pRLQ8A95MvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4s8M+S4f0RGBVYCXs0xdLiWYg3jgJw68p2I+kZxbwlm3qnH/GUdrz76gj0/c51Vh5tMPzSrj+CGUqqr/xGWGBSypGJ4uSkVRbkkil9Wjd+zeiqmkPsyUac85dftxDbTKlIbKGqYiR6l1KanRxEHyC7oKRIT+ZKmMQyeau6+PgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guWdubPe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guWdubPe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB605C433F1;
	Thu, 29 Feb 2024 23:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709250297;
	bh=qa9Uq860kOdvHNmNrVFdx4l6XPMgXK03pRLQ8A95MvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guWdubPec5EPeLNkk8zjOlD7e635gnxJTUiO53QcUEGBfqPvJ4NFKwrBg6jozCy+d
	 ufSh8k65a4w3Rzm6IhUOLO5l8/jonpjozXoo6GCfEj9qPSNaY0NavYmaetObrJTtUo
	 aY7ABYHyZVMj1VAOc4aglffMe6fcd/I1mToo81gi+1e4tDCFmaJnkQrVWZs5YZm4xv
	 PLKnDGQW5lp9LQcXGvT2LJFWcuu9iwPkM2ICh5hEzK8m1raU5MmQVkR2ajSWPt0wAs
	 TMh+67UEGjB5fnm0u5emIm+fZKJiDtZk5Hb28zdBiyyehDOa4TtiA8TDXvzAp9BAaV
	 za8NIdmdACjyQ==
Date: Thu, 29 Feb 2024 16:44:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against a
 string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240229234455.GA1020819@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
 <20240229180616.48d2c0eb@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229180616.48d2c0eb@gandalf.local.home>

Hi Steve,

On Thu, Feb 29, 2024 at 06:06:16PM -0500, Steven Rostedt wrote:
> On Thu, 29 Feb 2024 21:35:53 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
> > head:   eb1533d156d307c2125943eaf1925e268094d984
> > commit: 433e1d88a3be93222989e52fa99594fe9eb93622 [28/29] tracing: Add warning if string in __assign_str() does not match __string()
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202402292111.KIdExylU-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from net/sunrpc/sched.c:31:
> >    In file included from include/trace/events/sunrpc.h:2520:
> >    In file included from include/trace/define_trace.h:102:
> >    In file included from include/trace/trace_events.h:419:
> > >> include/trace/events/sunrpc.h:703:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]  
> >      663 |                         __assign_str(progname,
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~
> >      664 |                                      task->tk_client->cl_program->name);
> >          |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      665 |                         __entry->version = task->tk_client->cl_vers;
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      666 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      667 |                 } else {
> >          |                 ~~~~~~~~
> >      668 |                         __entry->task_id = -1;
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~
> >      669 |                         __entry->client_id = -1;
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~~~
> >      670 |                         __assign_str(progname, "unknown");
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      671 |                         __entry->version = 0;
> >          |                         ~~~~~~~~~~~~~~~~~~~~~
> >      672 |                         __assign_str(procedure, "unknown");
> >          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      673 |                 }
> 
> 
> I don't build with clang, does this quiet the warning?

Unfortunately, it does not. I tested with LLVM 17.0.6 from kernel.org:

https://mirrors.edge.kernel.org/pub/tools/llvm/

If there is no other way to silence it, we could potentially use the
diag infrastructure to silence it, I could look at that tomorrow.

Cheers,
Nathan

> diff --git a/include/trace/stages/stage6_event_callback.h b/include/trace/stages/stage6_event_callback.h
> index a0c15f67eabe..83da83a0c14f 100644
> --- a/include/trace/stages/stage6_event_callback.h
> +++ b/include/trace/stages/stage6_event_callback.h
> @@ -35,7 +35,9 @@
>  	do {								\
>  		char *__str__ = __get_str(dst);				\
>  		int __len__ = __get_dynamic_array_len(dst) - 1;		\
> -		WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);	\
> +		WARN_ON_ONCE(__builtin_constant_p(src) ?		\
> +			     strcmp((src), __data_offsets.dst##_ptr_) :	\
> +			     (src) != __data_offsets.dst##_ptr_);	\
>  		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
>  		       EVENT_NULL_STR, __len__);			\
>  		__str__[__len__] = '\0';				\
> -- 
> 2.43.0
> 
> 
