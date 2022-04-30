Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C37B
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 00:49:58 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7c424c66cso101519697b3.1
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v9Y7U0wTKqKyrzCZ5VtAbMiTlejqirW8gTMxmJkTfiA=;
        b=o904YtYKww9l65iOnpFttd2oN+roVVJk4YvsnVIJZjXPGnvk61QhExALxCRC4rOedS
         GZ+fEIz4xNSI4vgwWDhEYwf63lfKesGr31yZNfmw+UXEX9XN/y2wAhsIjWCitplmO4ps
         8JTE/bKIyu2Jm+PEDZiXmNfTMKnVsLhQOq62VLJ4/GgKGeiH6TciRzAU6SsdTfIYcJER
         3BHGtLCXph4PQRO9JLg1+n+i6SRl5zEq6LVsT2vXCl1IbFZA5JBiHGbCTkleXv53Ljbs
         eh5U/POqRL31KOiefyvGXo2puzoXdUfX+v/WX7nlyz/6NPUWqBhPoK3P/gCH2Cg0mxKY
         c5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v9Y7U0wTKqKyrzCZ5VtAbMiTlejqirW8gTMxmJkTfiA=;
        b=ZNvs1OW6V3SYStc9IH64MNO1eIqB1KfYAEc5o4+xYr0dvZyK4H5L2uM+v7sYvJ17/6
         7qMwbGUo0/ErMJhTk6AJkm4kD1VhDDr7AAXgRW1TuMWbNnufldSq0mlxR5Ic4HSdVHdV
         3BJ0/9zsFRGoJxdjdnKgUU5HJuzILExMlC6uNMamwBHbLC0ri0F24CGiW5DNjXDqrP9b
         J16xh7sm6cJvztrQZsevT4Dtn2JqldlW75huY7PyciFlHINt8RA053VMwzyVib28glUg
         nzQKMP02Nc0Kckk/N1JloJePoQRsiJ/oPhfdp412YFE/hWyyVg9KJvW5e+bxEXxPWbhc
         Vq7w==
X-Gm-Message-State: AOAM532Ip8l/LpeAXltjocQUdgG9CI65gvYwOOIj+u7/5iznaw6nHa23
	m5dp4owmksagAk7lg3OPJoPtGKLGRdoAu7ULsMNJeA==
X-Google-Smtp-Source: ABdhPJwgM0DU8R1vt+rPUv9v3MVwX19+YnYIl4ZgilTxVCVrF9omxoBF3LL/7AkmrlziboUU9RSRxP5sBIMxP78CMas=
X-Received: by 2002:a81:a93:0:b0:2f4:d65a:d44e with SMTP id
 141-20020a810a93000000b002f4d65ad44emr1937122ywk.243.1651279796955; Fri, 29
 Apr 2022 17:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <20220429203644.2868448-15-samitolvanen@google.com> <Ymxy/CU+tZhQ9UtN@hirez.programming.kicks-ass.net>
In-Reply-To: <Ymxy/CU+tZhQ9UtN@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 29 Apr 2022 17:49:21 -0700
Message-ID: <CABCJKud8vC6RwQLs2YXnZMZaXGNYBEq+sNmOsgGjjAw4MfuZuw@mail.gmail.com>
Subject: Re: [RFC PATCH 14/21] treewide: static_call: Pass call arguments to
 the macro
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 4:21 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Can you explain why this is needed? I don't think there are any indirect
> calls to get confused about. That is, if you have STATIC_CALL_INLINE
> then the compiler should be emitting direct calls to the trampoline.

Clang emits an indirect call for ({ &f; })(), which is optimized into
a direct call when possible. Come to think of it, the recent
InstCombine change to the compiler patch should solve this issue. Let
me double check, I'd be more than happy to drop these two patches.

Sami
