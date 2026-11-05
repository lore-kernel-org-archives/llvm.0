Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871623;
	b=Mf/Sbj0RGkojQ9PWaabuTsCVI2KWCuug3w9jC2WW8IaaBW95ls4hiky1SvVBdRFO6vKi
	 qiROWbvGcWbZ4F5YtikrVtyXiuDI0UIXwJcM/gQgFHzHfaniJslt7JUkrAP+LSSFc5ILy
	 pxrhKNv11UfzACEESWvivycEN1+AMw0QiTk6so/Xo1lQKP0jLDdNXpRe3ODZ6dJBHTTxT
	 mnXUBhLGzr+G4G7UwowmthLD9bYMRXJvAmWD2k6u40iEGk4BtmRJbsvifeoU+sSCuXOWD
	 j5PKKDnbkK8r3U96U317FoCQXj3zS2vae33HRX9upKIXL1UU0/HDmi1ZnwCOqIgYXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
	b=XDXQT7p2B7nqsIn92xCbQJQ/wiOWb4xEzKNXd/kUOTZBx3mdEvo0A91B6NxQdL+q3DDu
	 KiKI9gOR3AU3SQwDkfZFGbT7a/MKpk66mnK7KE/C52KaZoMkqYNibm9UAi8B7CdNudZcX
	 XBwuO1hCIIrtB3kIV1bS0lNzB0qb23hjv+0r09c7LED8jzU5Uws7zwNpNWeYDTZqfQnLS
	 zmsMsJ92wc+ot7Ufuh26wlF19cwJqgSWQ43FZU19TRtiZCyVp034/WjhD+kc14JXgjn6Y
	 SpOZWGV0eWdZrihIPQZr9a/Puyp8ICa2DpWH2zjn5vPhqovwf73ov2+zcGZASMaMxYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ayHm/tP3";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC8606A333
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayHm/tP3
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso7628915e9.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 01:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871621; x=1794476421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
        b=ayHm/tP3vhkGyTGgtpui7+1d6qa12PyV161OWrt4jMQYtd1Q09gC1nGCzOKvwLPe1A
         fS/VAHHt6W41oFNs0B6Hg48GLsE2BWna9zCTY/TZxmR/BJDupaNJbvDWpnMA2sxi+M3Z
         OShetflq2P+sZWxURRGY2o7i/bDozFR8mrlZKr+evrVvcCmOFc1G58Sy9QU9RQtUMVeu
         1I2cxW8G7sYgp4RHtiVyh4vww5NLyFwusjL/HNxR2GupOkdlUIsHYgCdTrPVAJbzsedC
         kRAnqiu2ZcLpzbKRni5GIR6Tog+e0FpPVwpeMo4UJjSW2DzS4M/qTXaDwxlGhTHlXzg7
         GBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871621; x=1794476421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYsXkKVBI3elcgfP7o+pYYG0Co8UOrNMmFiJfe3lbYM=;
        b=ZgkV0VyeHEvSD1zOcXOHeEM72NtqzA2yZ/br7c/sK4dlZL62Y/7QtFfNsnrgvqXHpK
         cWsrBVLZ3TArxdU7iQcS/cWb3hgkl5Llvu3iytmRumo11IsOXiOrWowxAOd9V2eOCiOp
         F+WG8+Zy4Y7OofrsFFS3sNE8aCrm0cOldAZLl0nZfX9qAdt3h8LBerbYdfCi0owmhNvE
         sKBFxbZ0hRalllo3llXq5Te2A+/jS6OsCFvN4p13ZrLmB3l/iL3eEdliKb6yMCV3oXdV
         /XbQ9RaSyfJCcJlTS7CNpLPCXH4zxWw5i8eZ1PDKrEnhldmFW4Xc8FQfCeU9gSXXVTga
         SEBg==
X-Forwarded-Encrypted: i=1; AKwUvBy0cV5KBb8srJVrkrO8pkq/ZJG4ACTrKxP4+E5cEUlnBrPSaATHIZysp/9K5FA/pp+mwYcD@lists.linux.dev
X-Gm-Message-State: APuU4Z/M75BqFk6Lq+T/n6zMzc5sYSO/rcC2u1WRTBGsX67u2IUMKNPI
	/xDw1g+VM+jKVzEFlRAhwpnuJBigkfOkB4kHk/uvzmUKGcAfMb+rmFeZ
X-Gm-Gg: AYBFou2PNn+YjVmwvcksE5fsdREXd0J/ekyogDF/AL49Mi/lOv4ANZiEkKdtkhtSZsf
	vuASZzIkt1DuqrUT1ri9pBeksTonGZ2xhu8H9V4n16yUHZ80WBElrJF/u40sA4EwbSzMCo+xybn
	wztZ/gXHZK/YQ6sSfKkkjdq/3MZb/qxHawT/GIuFZ0FJWkBvZfoqfwKu60oDICjXuxcQB44v/BH
	K8dq98u1Aiiyh2K/gEcbYL8lR7HSuhE/JgOuQOfe9vB2Iqq4nXIOsPMbEEmtizjLizsV7c/bThi
	Awee8bdV7w02jYVCnkrsMLWr57KBWYAs6MdPqy0lnS/L/vWcS/e+jZlEQftbJCFI5A5x5tPK3UR
	ATbgS2TaEhakHg8fQrK/aj9XCSOfUqT4/OySFBiitRJQP9S78JBvtQuW+GdmSsmyfMDslyLfj3s
	AGWO8lesEluWOINkc2DGIs+C7XYKt7dCoep2XzzQJlKoqd999GrSSEwTvxWFRU8WmY716I3F4sL
	7SMEuo8Y+9DI+ut0bpRDafxuOjYw6R5INw//LrkLuVNaOdQSOAzKfnvFff3liBc4Evmwz03pfbs
	HNLNSAvZbI6SDcszdDuiZ6s71+xEwCBe7A8yzgbyHpi9GFv89i/YdginaztOl2eS
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr431560105e9.30.1793871621024;
        Thu, 05 Nov 2026 01:40:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm58866395e9.11.2026.11.05.01.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:40:20 -0800 (PST)
Date: Thu, 5 Nov 2026 09:40:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261105094019.1ec31c30@pumpkin>
In-Reply-To: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
	<20261029104938.GC1813469@noisy.programming.kicks-ass.net>
	<auM6mSXz-BVIjYBc@gmail.com>
	<CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 08:56:12 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
> >
> > With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> > becomes a compare tree on every x86_64 build, so system call dispatch is
> > the same whether the mitigations are disabled at boot or at build time,
> > which is basically my end goal.  
> 
> You're basically saying "with that patch, both cases do equally badly
> whether disabled at boot or build time".
> 
> That's not a good end goal. You want both cases to do equally *well*.
> 
> I do wonder if we could do computed jumps. It would be lovely if we
> could basically do something like
> 
>       # syscall number in %rax
>       leaq table(%rax,%rax,4),%rax
>       jmp *%rax
> table:
>      jmp syscall0
>      jmp syscall1
>      jmp syscall2
>     ....
> 
> and avoid any indirect memory lookup or indirect branches (outside of
> the one computed one). And no extra call/ret frame.

Could it be a table of 32bit offsets (from some point) so that it is
a data cache access (or miss) rather than an instruction pipeline stall.
You might need to use a retpoline to avoid needing endbra.
(or is there another way of avoiding the need for endbra?)
You probably need to patch at least some of the code to nops when it isn't
being used.

> 
> It's possible that the branch prediction hardware hates those kinds of
> very dense jmp patterns, though. I don't know.

Some cpu have definitely not liked having a lot of branches in one cache line.

And performance will be absolutely horrid unless you are doing a benchmark
that keeps doing the same system call.

The cost of each branch miss is likely to be at least 20 clocks.
For a random system call half of the branches will be misses.
Plus all the cache line reads and other delays.
Definitely non-trivial.

David
 
> 
> We could have a single static jump that picks between this one and the
> "conditional branch tree" version, as in your patch at the beginning
> of the thread.
> 
>              Linus
> 

