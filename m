Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02157E572;
	Thu, 29 Feb 2024 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213849; cv=none; b=oXgKdWIoH3fyP+bXBlJRyY7jEeuB5SppQ+H+YO/8Hq9aPc7zxwchcoz1c+4OIjK84DNPiwOCoMb+21thEXmW7Dgf5S9tnwCn2VxJGbytt2GpJqPwHFJgy16Epgdjs16Ty0RCZ8or1LUoYOBW4IOiBfOr4vGnXr8hno3ELbOLB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213849; c=relaxed/simple;
	bh=lACLD9mUqK5OqIJBVTvlQf/BuNnX/i5Zrp/k8gbHjp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqD0jjCgxeMvCy9fXA8h0Ui3cp8IWuZJBjIP3gn9bQubjjnb/bh8T2/B1WINCx+X/kqhaBS92l/dDDQmbJGsk4oEeB6HManf+oExLndVUaCTMgjLRmI8T47BZpqydYUo9RLC2HfkUllFetpioq9jg8ujkWFvn1WnfMvn4OUWE8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdJbJclA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdJbJclA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709213846; x=1740749846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lACLD9mUqK5OqIJBVTvlQf/BuNnX/i5Zrp/k8gbHjp8=;
  b=GdJbJclAW3wBq5+CTKUvUQiuK/49Ck4PPNyUQlroCB9e27Xo1mOh3vc8
   M+nPFSVEUvmRmBSCC/uUETPfZKSNiLN1wOJNbxOGTCvVnxGja1vTomYnc
   FyOUiVuuzLxBK0KHs6K1iUzwwOKnmOnY+jM6oGC5gjET1k2V1nM1doOxT
   twPKb3WU7EXGzUPIRLySQZlmgSArcjsAqzy6kTxWeCuWmR4kmd2d0sDPZ
   YnBi/4q17rs58JAPGQEWOuJ19Q8p7f7ethEOgnW9ZUgcU5kuCgDEKSexY
   cpTyHuJqVpcd4E7goo4MUUQOPKcvq+PsDNds/ApjKYqfZm/UcgjH36Wl7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6630428"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6630428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="45345776"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Feb 2024 05:37:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfgax-000Cxo-16;
	Thu, 29 Feb 2024 13:37:11 +0000
Date: Thu, 29 Feb 2024 21:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:trace/for-next 28/29] include/trace/events/sunrpc.h:703:4:
 warning: result of comparison against a string literal is unspecified (use
 an explicit string comparison function instead)
Message-ID: <202402292111.KIdExylU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   eb1533d156d307c2125943eaf1925e268094d984
commit: 433e1d88a3be93222989e52fa99594fe9eb93622 [28/29] tracing: Add warning if string in __assign_str() does not match __string()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292111.KIdExylU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292111.KIdExylU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2520:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> include/trace/events/sunrpc.h:703:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
     663 |                         __assign_str(progname,
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     664 |                                      task->tk_client->cl_program->name);
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     665 |                         __entry->version = task->tk_client->cl_vers;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     666 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     667 |                 } else {
         |                 ~~~~~~~~
     668 |                         __entry->task_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     669 |                         __entry->client_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     670 |                         __assign_str(progname, "unknown");
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     671 |                         __entry->version = 0;
         |                         ~~~~~~~~~~~~~~~~~~~~~
     672 |                         __assign_str(procedure, "unknown");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     673 |                 }
         |                 ~
     674 |                 __entry->requested = requested;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     675 |                 __entry->end = xdr->end;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     676 |                 __entry->p = xdr->p;
         |                 ~~~~~~~~~~~~~~~~~~~~
     677 |                 __entry->head_base = xdr->buf->head[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     678 |                 __entry->head_len = xdr->buf->head[0].iov_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2520:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/sunrpc.h:705:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
     663 |                         __entry->version = task->tk_client->cl_vers;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     664 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     665 |                 } else {
         |                 ~~~~~~~~
     666 |                         __entry->task_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     667 |                         __entry->client_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     668 |                         __assign_str(progname, "unknown");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     669 |                         __entry->version = 0;
         |                         ~~~~~~~~~~~~~~~~~~~~~
     670 |                         __assign_str(procedure, "unknown");
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     671 |                 }
         |                 ~
     672 |                 __entry->requested = requested;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     673 |                 __entry->end = xdr->end;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     674 |                 __entry->p = xdr->p;
         |                 ~~~~~~~~~~~~~~~~~~~~
     675 |                 __entry->head_base = xdr->buf->head[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     676 |                 __entry->head_len = xdr->buf->head[0].iov_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     677 |                 __entry->page_len = xdr->buf->page_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     678 |                 __entry->tail_base = xdr->buf->tail[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2520:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/sunrpc.h:703:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
     663 |                         __assign_str(progname,
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     664 |                                      task->tk_client->cl_program->name);
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     665 |                         __entry->version = task->tk_client->cl_vers;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     666 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     667 |                 } else {
         |                 ~~~~~~~~
     668 |                         __entry->task_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     669 |                         __entry->client_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     670 |                         __assign_str(progname, "unknown");
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     671 |                         __entry->version = 0;
         |                         ~~~~~~~~~~~~~~~~~~~~~
     672 |                         __assign_str(procedure, "unknown");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     673 |                 }
         |                 ~
     674 |                 __entry->requested = requested;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     675 |                 __entry->end = xdr->end;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     676 |                 __entry->p = xdr->p;
         |                 ~~~~~~~~~~~~~~~~~~~~
     677 |                 __entry->head_base = xdr->buf->head[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     678 |                 __entry->head_len = xdr->buf->head[0].iov_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^
   include/trace/stages/stage6_event_callback.h:134:33: note: expanded from macro 'TP_fast_assign'
     134 | #define TP_fast_assign(args...) args
         |                                 ^
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~~~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2520:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/sunrpc.h:705:4: warning: result of comparison against a string literal is unspecified (use an explicit string comparison function instead) [-Wstring-compare]
     663 |                         __entry->version = task->tk_client->cl_vers;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     664 |                         __assign_str(procedure, task->tk_msg.rpc_proc->p_name);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     665 |                 } else {
         |                 ~~~~~~~~
     666 |                         __entry->task_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
     667 |                         __entry->client_id = -1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     668 |                         __assign_str(progname, "unknown");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     669 |                         __entry->version = 0;
         |                         ~~~~~~~~~~~~~~~~~~~~~
     670 |                         __assign_str(procedure, "unknown");
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     671 |                 }
         |                 ~
     672 |                 __entry->requested = requested;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     673 |                 __entry->end = xdr->end;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
     674 |                 __entry->p = xdr->p;
         |                 ~~~~~~~~~~~~~~~~~~~~
     675 |                 __entry->head_base = xdr->buf->head[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     676 |                 __entry->head_len = xdr->buf->head[0].iov_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     677 |                 __entry->page_len = xdr->buf->page_len,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     678 |                 __entry->tail_base = xdr->buf->tail[0].iov_base,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/stages/stage6_event_callback.h:38:22: note: expanded from macro '__assign_str'
      38 |                 WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);       \
         |                                    ^


vim +703 include/trace/events/sunrpc.h

82b0a4c3c171b1 Trond Myklebust 2012-01-20  662  
5582863f450ca4 Chuck Lever     2019-02-11  663  TRACE_EVENT(rpc_xdr_overflow,
5582863f450ca4 Chuck Lever     2019-02-11  664  	TP_PROTO(
5582863f450ca4 Chuck Lever     2019-02-11  665  		const struct xdr_stream *xdr,
5582863f450ca4 Chuck Lever     2019-02-11  666  		size_t requested
5582863f450ca4 Chuck Lever     2019-02-11  667  	),
5582863f450ca4 Chuck Lever     2019-02-11  668  
5582863f450ca4 Chuck Lever     2019-02-11  669  	TP_ARGS(xdr, requested),
5582863f450ca4 Chuck Lever     2019-02-11  670  
5582863f450ca4 Chuck Lever     2019-02-11  671  	TP_STRUCT__entry(
5582863f450ca4 Chuck Lever     2019-02-11  672  		__field(unsigned int, task_id)
5582863f450ca4 Chuck Lever     2019-02-11  673  		__field(unsigned int, client_id)
5582863f450ca4 Chuck Lever     2019-02-11  674  		__field(int, version)
5582863f450ca4 Chuck Lever     2019-02-11  675  		__field(size_t, requested)
5582863f450ca4 Chuck Lever     2019-02-11  676  		__field(const void *, end)
5582863f450ca4 Chuck Lever     2019-02-11  677  		__field(const void *, p)
5582863f450ca4 Chuck Lever     2019-02-11  678  		__field(const void *, head_base)
5582863f450ca4 Chuck Lever     2019-02-11  679  		__field(size_t, head_len)
5582863f450ca4 Chuck Lever     2019-02-11  680  		__field(const void *, tail_base)
5582863f450ca4 Chuck Lever     2019-02-11  681  		__field(size_t, tail_len)
5582863f450ca4 Chuck Lever     2019-02-11  682  		__field(unsigned int, page_len)
5582863f450ca4 Chuck Lever     2019-02-11  683  		__field(unsigned int, len)
d321ff589c16d8 Chuck Lever     2020-10-23  684  		__string(progname, xdr->rqst ?
d321ff589c16d8 Chuck Lever     2020-10-23  685  			 xdr->rqst->rq_task->tk_client->cl_program->name : "unknown")
d321ff589c16d8 Chuck Lever     2020-10-23  686  		__string(procedure, xdr->rqst ?
d321ff589c16d8 Chuck Lever     2020-10-23  687  			 xdr->rqst->rq_task->tk_msg.rpc_proc->p_name : "unknown")
5582863f450ca4 Chuck Lever     2019-02-11  688  	),
5582863f450ca4 Chuck Lever     2019-02-11  689  
5582863f450ca4 Chuck Lever     2019-02-11  690  	TP_fast_assign(
5582863f450ca4 Chuck Lever     2019-02-11  691  		if (xdr->rqst) {
5582863f450ca4 Chuck Lever     2019-02-11  692  			const struct rpc_task *task = xdr->rqst->rq_task;
5582863f450ca4 Chuck Lever     2019-02-11  693  
5582863f450ca4 Chuck Lever     2019-02-11  694  			__entry->task_id = task->tk_pid;
5582863f450ca4 Chuck Lever     2019-02-11  695  			__entry->client_id = task->tk_client->cl_clid;
5582863f450ca4 Chuck Lever     2019-02-11  696  			__assign_str(progname,
78c14b385c195d Joe Perches     2021-06-12  697  				     task->tk_client->cl_program->name);
5582863f450ca4 Chuck Lever     2019-02-11  698  			__entry->version = task->tk_client->cl_vers;
78c14b385c195d Joe Perches     2021-06-12  699  			__assign_str(procedure, task->tk_msg.rpc_proc->p_name);
5582863f450ca4 Chuck Lever     2019-02-11  700  		} else {
b4776a341ec05e Chuck Lever     2021-10-16  701  			__entry->task_id = -1;
b4776a341ec05e Chuck Lever     2021-10-16  702  			__entry->client_id = -1;
78c14b385c195d Joe Perches     2021-06-12 @703  			__assign_str(progname, "unknown");
5582863f450ca4 Chuck Lever     2019-02-11  704  			__entry->version = 0;
78c14b385c195d Joe Perches     2021-06-12  705  			__assign_str(procedure, "unknown");
5582863f450ca4 Chuck Lever     2019-02-11  706  		}
5582863f450ca4 Chuck Lever     2019-02-11  707  		__entry->requested = requested;
5582863f450ca4 Chuck Lever     2019-02-11  708  		__entry->end = xdr->end;
5582863f450ca4 Chuck Lever     2019-02-11  709  		__entry->p = xdr->p;
5582863f450ca4 Chuck Lever     2019-02-11  710  		__entry->head_base = xdr->buf->head[0].iov_base,
5582863f450ca4 Chuck Lever     2019-02-11  711  		__entry->head_len = xdr->buf->head[0].iov_len,
5582863f450ca4 Chuck Lever     2019-02-11  712  		__entry->page_len = xdr->buf->page_len,
5582863f450ca4 Chuck Lever     2019-02-11  713  		__entry->tail_base = xdr->buf->tail[0].iov_base,
5582863f450ca4 Chuck Lever     2019-02-11  714  		__entry->tail_len = xdr->buf->tail[0].iov_len,
5582863f450ca4 Chuck Lever     2019-02-11  715  		__entry->len = xdr->buf->len;
5582863f450ca4 Chuck Lever     2019-02-11  716  	),
5582863f450ca4 Chuck Lever     2019-02-11  717  
b4776a341ec05e Chuck Lever     2021-10-16  718  	TP_printk(SUNRPC_TRACE_TASK_SPECIFIER
b4776a341ec05e Chuck Lever     2021-10-16  719  		  " %sv%d %s requested=%zu p=%p end=%p xdr=[%p,%zu]/%u/[%p,%zu]/%u\n",
5582863f450ca4 Chuck Lever     2019-02-11  720  		__entry->task_id, __entry->client_id,
5582863f450ca4 Chuck Lever     2019-02-11  721  		__get_str(progname), __entry->version, __get_str(procedure),
5582863f450ca4 Chuck Lever     2019-02-11  722  		__entry->requested, __entry->p, __entry->end,
5582863f450ca4 Chuck Lever     2019-02-11  723  		__entry->head_base, __entry->head_len,
5582863f450ca4 Chuck Lever     2019-02-11  724  		__entry->page_len,
5582863f450ca4 Chuck Lever     2019-02-11  725  		__entry->tail_base, __entry->tail_len,
5582863f450ca4 Chuck Lever     2019-02-11  726  		__entry->len
5582863f450ca4 Chuck Lever     2019-02-11  727  	)
5582863f450ca4 Chuck Lever     2019-02-11  728  );
5582863f450ca4 Chuck Lever     2019-02-11  729  

:::::: The code at line 703 was first introduced by commit
:::::: 78c14b385c195d4f25ab7c19186b8897a5b9ae3f treewide: Add missing semicolons to __assign_str uses

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
