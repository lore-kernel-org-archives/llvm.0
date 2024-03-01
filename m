Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEC38F9B;
	Fri,  1 Mar 2024 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709318783; cv=none; b=UVLRBbvF+igovw2b9z1u8gj7cwT7kZXMwN96k8u3jehw8tGD8tEUlAfN44JOFUSrxJA+NJWtObBUj8Y+7Sv7IsnkrxrucUWku8SbXqp8pyEgs4L27srXQ7tsLCR6EzXTknTHb2hyrWOAdFahTODSN96N93gTN8TqhdZefXERL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709318783; c=relaxed/simple;
	bh=ZrxLpa0Ycn3DPNJvqNvgq9pdtt1id5qDBOEFk9y0E8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2KXKUllCqVqG9wmaflBxD6zGEiBDKSVx2CAm5rIya5HxoWHAAYOwMdNjbnjBuDVsxXDGncZNGSYsGpDASula/T4gUisv1sNbv+GwRjNyjM32iE4pRa0Q20jIyz4FYxtyT5VPvn1EoyC4+kDoabaHDh4BTCkG97gTfc+ZMJ9rQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhtEj71c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhtEj71c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF60C433F1;
	Fri,  1 Mar 2024 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709318782;
	bh=ZrxLpa0Ycn3DPNJvqNvgq9pdtt1id5qDBOEFk9y0E8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhtEj71cqlqVi1FmTKHd+5+drYwzluF2f3zf7n4Qm5vB8D6A7g3jIEGli8JRy/9rW
	 eJjnshhoyY+sXnmUFHOoc90ifI/iSjCMtNjAaOOZppeqOSiVCKC1tzfPXq15aBl9KE
	 LPhZpUrbW4h8yqlmr+uDHY3pTKPGYjHhW3zgA/v1ZBeDaVSxvPCfB5gniF+7su8fQ8
	 5MHzi1pjcPYZ1vQjZVSyBo55AAC69dmVixOquX4xOhrFJHAC2odUHxVy4tw01Def+Q
	 9DUyBssoxVYrSjLUXbOzbdSMDAvZ5RppmdDmVDEodEdcyTsXri5nGeRGOlCWPzlykm
	 xemPYxvMg3JvA==
Date: Fri, 1 Mar 2024 11:46:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against a
 string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240301184620.GA150304@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
 <20240229180616.48d2c0eb@gandalf.local.home>
 <20240229234455.GA1020819@dev-arch.thelio-3990X>
 <20240229185558.70b6ea86@gandalf.local.home>
 <20240301041131.GB577965@dev-arch.thelio-3990X>
 <20240301104753.7ca87282@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301104753.7ca87282@gandalf.local.home>

On Fri, Mar 01, 2024 at 10:47:53AM -0500, Steven Rostedt wrote:
> On Thu, 29 Feb 2024 21:11:31 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > > #define __assign_str(dst, src)						\
> > > 	do {								\
> > > 		char *__str__ = __get_str(dst);				\
> > > 		int __len__ = __get_dynamic_array_len(dst) - 1;		\
> > > 		if (__builtin_constant_p(src))				\
> > > 			WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
> > > 		else							\
> > > 			WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);\
> > > 		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
> > > 		       EVENT_NULL_STR, __len__);			\
> > > 		__str__[__len__] = '\0';				\
> > > 	} while (0)
> > > 
> > > Then the compiler may be better in optimizing out the "bad" portion.  
> > 
> > No, that does not work either, I diffed the warnings and they are
> > identical minus line numbers. I don't think clang takes
> > __builtin_constant_p() into account in the front end but I could be
> > wrong. In fact, I think clang (and even gcc sometimes) will still warn
> > for code even if it is within an 'if (0)' block, it's been used as
> > justification before in commit 37b47298ab86 ("sched: Disable
> > -Wunused-but-set-variable").
> 
> Hmm, well, the original warning was indeed a bug, but I think that the
> __builtin_constant_p() should be the fix. So clang helped in finding the
> bug, but is being stupid about allowing the solution (unless it thinks
> "some-string" is not a constant?).

No, I just don't think that it makes any determination on whether src is
constant or not at the point in the pipeline that this warning fires.

> I'll add the patch regardless and even keep the reported by. But I'll
> replace the "closes" link with just "link" as it's not technically closed.

This diff on top of that suggestion above will hide the warning. There
will be a semantic conflict against Andrew's -mm tree in -next due to
bumping the minimum supported version of LLVM there but that is easy for
both Stephen and Linus to handle (change '11' -> '13').

diff --git a/include/trace/stages/stage6_event_callback.h b/include/trace/stages/stage6_event_callback.h
index c7789a851536..f272ab0b5cce 100644
--- a/include/trace/stages/stage6_event_callback.h
+++ b/include/trace/stages/stage6_event_callback.h
@@ -37,8 +37,13 @@
 		int __len__ = __get_dynamic_array_len(dst) - 1;		\
 		if (__builtin_constant_p(src))				\
 			WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
-		else							\
+		else {							\
+			__diag_push();					\
+			__diag_ignore(clang, 11, "-Wstring-compare",	\
+				      "Invalid for this branch");	\
 			WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);\
+			__diag_pop();					\
+		}							\
 		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
 		       EVENT_NULL_STR, __len__);			\
 		__str__[__len__] = '\0';				\

However, your suggested change appears to cause
-Wincompatible-pointer-types when building that configuration fully,
although it seems to be the inverse problem as above, so maybe the same
__diag macros can be used to shut it up as well.

  In file included from net/core/net-traces.c:37:
  In file included from include/trace/events/qdisc.h:153:
  In file included from include/trace/define_trace.h:102:
  In file included from include/trace/trace_events.h:419:
  include/trace/events/qdisc.h:116:3: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'const char *' [-Werror,-Wincompatible-pointer-types]
    102 |                 __string(       dev,            qdisc_dev(q)    )
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    103 |                 __string(       kind,           q->ops->id      )
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    104 |                 __field(        u32,            parent          )
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    105 |                 __field(        u32,            handle          )
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    106 |         ),
        |         ~~
    107 |
    108 |         TP_fast_assign(
        |         ~~~~~~~~~~~~~~~
    109 |                 __assign_str(dev, qdisc_dev(q));
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    110 |                 __assign_str(kind, q->ops->id);
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    111 |                 __entry->parent = q->parent;
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    112 |                 __entry->handle = q->handle;
        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    113 |         ),
        |         ~~
    114 |
    115 |         TP_printk("dev=%s kind=%s parent=%x:%x handle=%x:%x", __get_str(dev),
        |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    116 |                   __get_str(kind), TC_H_MAJ(__entry->parent) >> 16, TC_H_MIN(__entry->parent),
        |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    117 |                   TC_H_MAJ(__entry->handle) >> 16, TC_H_MIN(__entry->handle))
        |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  include/trace/stages/stage6_event_callback.h:39:24: note: expanded from macro '__assign_str'
     39 |                         WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
        |                                             ^
  include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
    111 |         int __ret_warn_on = !!(condition);                      \
        |                                ^
  include/trace/stages/stage6_event_callback.h:142:33: note: expanded from macro 'TP_fast_assign'
    142 | #define TP_fast_assign(args...) args
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
  include/linux/string.h:86:31: note: passing argument to parameter here
     86 | extern int strcmp(const char *,const char *);
        |                               ^

Cheers,
Nathan
