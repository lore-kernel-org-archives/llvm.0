Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306634595C;
	Thu, 29 Feb 2024 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247851; cv=none; b=ZO8Fw1v85LUOUHuFNLKdfDGTHw5vQNsenaNBiOl4ZItrm4ch5DMMxvRgChCE9QR798R/CWMBfHgYRhHS4mE4puZt5Aq1+70AwrtNXrtI7Tj2hEVMo9ytws6plN8vyBUv+znp+N4D/cPOvpKL7PD5vuvFeLR0Yo6BVlX4VJetcGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247851; c=relaxed/simple;
	bh=sEiG2zLVQSXGzfvv0dbjmyrxlw1+zG1McQAjZM3IKkY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EoPx/EhGBVv34YcfVu/SJez+lc3ki0TpsJ3EdQ2XuC1Z0eVLSsR0TMe4ZNJGmd5mxyLKNGV0o7YCP7z90+SJohaDhSkIBV/WDradPTDuRJ4LqDaayWcMIYzMRjraIdVSOkf52p0D3HuTbehL0KdIpZyUyWYu55vpV9li+KeLz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219BAC433C7;
	Thu, 29 Feb 2024 23:04:08 +0000 (UTC)
Date: Thu, 29 Feb 2024 18:06:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu
 (Google)" <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against
 a string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240229180616.48d2c0eb@gandalf.local.home>
In-Reply-To: <202402292111.KIdExylU-lkp@intel.com>
References: <202402292111.KIdExylU-lkp@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Feb 2024 21:35:53 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
> head:   eb1533d156d307c2125943eaf1925e268094d984
> commit: 433e1d88a3be93222989e52fa99594fe9eb93622 [28/29] tracing: Add warning if string in __assign_str() does not match __string()
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402292111.KIdExylU-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from net/sunrpc/sched.c:31:
>    In file included from include/trace/events/sunrpc.h:2520:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:419:
> >> include/trace/events/sunrpc.h:703:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]  
>      663 |                         __assign_str(progname,
>          |                         ~~~~~~~~~~~~~~~~~~~~~~
>      664 |                                      task->tk_client->cl_program->name);
>          |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      665 |                         __entry->version = task->tk_client->cl_vers;
>          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      666 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
>          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      667 |                 } else {
>          |                 ~~~~~~~~
>      668 |                         __entry->task_id = -1;
>          |                         ~~~~~~~~~~~~~~~~~~~~~~
>      669 |                         __entry->client_id = -1;
>          |                         ~~~~~~~~~~~~~~~~~~~~~~~~
>      670 |                         __assign_str(progname, "unknown");
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      671 |                         __entry->version = 0;
>          |                         ~~~~~~~~~~~~~~~~~~~~~
>      672 |                         __assign_str(procedure, "unknown");
>          |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      673 |                 }


I don't build with clang, does this quiet the warning?

-- Steve

diff --git a/include/trace/stages/stage6_event_callback.h b/include/trace/stages/stage6_event_callback.h
index a0c15f67eabe..83da83a0c14f 100644
--- a/include/trace/stages/stage6_event_callback.h
+++ b/include/trace/stages/stage6_event_callback.h
@@ -35,7 +35,9 @@
 	do {								\
 		char *__str__ = __get_str(dst);				\
 		int __len__ = __get_dynamic_array_len(dst) - 1;		\
-		WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);	\
+		WARN_ON_ONCE(__builtin_constant_p(src) ?		\
+			     strcmp((src), __data_offsets.dst##_ptr_) :	\
+			     (src) != __data_offsets.dst##_ptr_);	\
 		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
 		       EVENT_NULL_STR, __len__);			\
 		__str__[__len__] = '\0';				\
-- 
2.43.0

