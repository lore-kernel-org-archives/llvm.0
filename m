Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE63D95
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 13:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648473149;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=P4ec5zFj3ALGsTbbZVKM3kY6LLLTSnINme02bmLCl/c=;
	b=dQHc2QL6xP+/JCQYHRWO2T8S+L45YMbNTtec8wwJ+EtcOlWSGtRtwXXqv/qdgvPRCqO0Hx
	uhDN0HWSCL3HszOV9g7CROlHd7q4moB1aTPw/tnr4M/tz+zuZW+aZJTjLLGzQSm3Utm0CH
	QuDGQ0hFOJLbeiwv585Vx6ckq2pEhlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-eZAiO-zZMzWLX6p6FCHO4g-1; Mon, 28 Mar 2022 09:12:24 -0400
X-MC-Unique: eZAiO-zZMzWLX6p6FCHO4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A60B85A5BE;
	Mon, 28 Mar 2022 13:12:23 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.39.192.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A664432470;
	Mon, 28 Mar 2022 13:12:22 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
	by tucnak.zalov.cz (8.16.1/8.16.1) with ESMTPS id 22SDCIUs3605583
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Mar 2022 15:12:18 +0200
Received: (from jakub@localhost)
	by tucnak.zalov.cz (8.16.1/8.16.1/Submit) id 22SDCF9K3605582;
	Mon, 28 Mar 2022 15:12:15 +0200
Date: Mon, 28 Mar 2022 15:12:14 +0200
From: Jakub Jelinek <jakub@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>, Nathan Chancellor <nathan@kernel.org>,
        x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@redhat.com>,
        linux-toolchains@vger.kernel.org
Subject: Re: clang memcpy calls
Message-ID: <YkG0LqWoBRqQ9Jxu@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <YjxTt3pFIcV3lt8I@zn.tnic>
 <CAKwvOdkw0Bbm+=ZyViXQhBE1L6uSbvkstHJuHpQ21tzJRftgAw@mail.gmail.com>
 <Yj2yYFloadFobRPx@lakrids>
 <Yj3OEI+WHV/A5uf8@hirez.programming.kicks-ass.net>
 <20220325151238.GB614@gate.crashing.org>
 <YkGFdtn0yDIPqXRl@FVFF77S0Q05N>
 <YkGL929QoFiTfMK7@tucnak>
 <YkGwSsXLBjReBhMf@lakrids>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkGwSsXLBjReBhMf@lakrids>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

On Mon, Mar 28, 2022 at 01:55:38PM +0100, Mark Rutland wrote:
> > If coexistence of instrumented and non-instrumented memcpy etc. was the goal
> > (it clearly wasn't), then the sanitizer libraries wouldn't be overriding
> > memcpy calls, but instead the compiler would redirect calls to memcpy in
> > instrumented functions to say __asan_memcpy which then would be
> > instrumented.
> 
> FWIW, I think that approach would be fine for kernel usage.
> 
> > > Given the standard doesn't say *anything* about instrumentation, what does GCC
> > > *require* instrumentation-wise of the memcpy implementation? What happens *in
> > > practice* today?
> > > 
> > > For example, is the userspace implementation of memcpy() instrumented for
> > > AddressSanitizer, or not?
> > 
> > It is, for all functions, whether compiled with -fsanitize=address or not,
> > if user app is linked with -fsanitize=address, libasan is linked in and
> > overrides the libc memcpy with its instrumented version.
> 
> Thanks for confirming! Just to check, how does libasan prevent recursing
> within itself on implicitly generated calls to memcpy and friends? Is
> anything special done to build the libasan code, is that all asm, or
> something else?

Generally, most of the libasan wrappers look like
  do something
  call the original libc function (address from dlsym/dlvsym)
  do something
and the "do something" code isn't that complicated.  The compiler doesn't
add calls to memcpy/memset etc. just to screw up users, they are added
for a reason, such as copying or clearing very large aggregates (including
for passing them by value), without -Os it will rarely use calls for smaller
sizes and will instead expand them inline.
For malloc and the like wrappers I think it uses some TLS
recursion counters so that say malloc called from dlsym doesn't cause
problems.

Now, one way for the kernel to make kasan work (more) reliably even with
existing compilers without special tweaks for this might be if those
calls to no_sanitize_address code aren't mixed with sanitized code all the
time might be set some per-thread flag when starting a "no sanitized" code
execution and clear it at the end of the region (or vice versa) and test
those flags in the kernel's memcpy/memset etc. implementation to decide if
they should be sanitized or not.
As KASAN is (hopefully) just a kernel debugging aid and not something meant
for production (in the userspace at least GCC strongly recommends against
using the sanitizers in production), perhaps allocating one per-thread bool
or int and changing it in a few spots and testing in the library functions
might be acceptable.

	Jakub

