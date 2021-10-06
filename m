Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BB2C83
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633553020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KF1LW5cDfM/ueFGMcYEy3hhTDIYMy6oUHH//f81E6c=;
	b=Tjxe5zsG2Do4oxNXCQ6NlspjMNz7ShjOvTRyRrPBfvnP0yna03H57a3uiSQU86+s34MGg9
	3Rskpt4szuNtRhz8/GXUbgQdKHTXGXSvKRv+0Vq6hU39zTIT1JH/fN+YCV6ObY0a18RIKj
	9/W/NWiceu4DoR42OAmbKTFdGAGvRvY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-hJ0i1tCEMT2kB90Fcrgd1A-1; Wed, 06 Oct 2021 16:43:39 -0400
X-MC-Unique: hJ0i1tCEMT2kB90Fcrgd1A-1
Received: by mail-qt1-f198.google.com with SMTP id w10-20020ac87e8a000000b002a68361412bso3209725qtj.7
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 13:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1KF1LW5cDfM/ueFGMcYEy3hhTDIYMy6oUHH//f81E6c=;
        b=h3e8Z1S8qtfztHjie9HyQUpDYFlkIQmQ8kNkBdTaqMrbrMcqgmHcSqoC77dFuZxCbD
         VqcFqHjuZgpX4vkqnu54ANvaMd71uao0FZBMRw60/vUvCo9Z40j9hB+7VDDoFzX/bk5t
         aFtpH77tkyMbTz+Nic9MCYTfHUFFHsNQ9ge0hZUQT/yRVzoT3ksfPvCJZmnefNbCk7B5
         96maNLl2JgyeZW1WBjxvDeHkjGpxi2EBS7K5T5c4RcutW1SFQ0rSeS3qewc5nIHHW5iJ
         DYVkSkWzgFsH8hQzf5czHiOZkZMUzLaYymQP3SThVw1ZX+aC8unu7rnsWmOak7NureTL
         Ravw==
X-Gm-Message-State: AOAM530gfbqY+brCck6TnZw933akWo+k70RUNFsf1Qj96/LZ6+YOWcBs
	/6h88McMlxOD/mdLNEhh/SOKK8rrFmXjYj3j1IIt/Dl9eqix7hEjsdWM5vEuiUsa/we+QZ7CYmW
	U87cUwtkgqWw2eA==
X-Received: by 2002:a37:5f02:: with SMTP id t2mr244856qkb.264.1633553019257;
        Wed, 06 Oct 2021 13:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdGPlYUsWoR+CzZXbwhCp1TXr5QdHbHnuo20r9V6zPZV/k5CSYKHLQylIKXUmk2hZiajgHMQ==
X-Received: by 2002:a37:5f02:: with SMTP id t2mr244838qkb.264.1633553018965;
        Wed, 06 Oct 2021 13:43:38 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::49])
        by smtp.gmail.com with ESMTPSA id 130sm12405680qkh.99.2021.10.06.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:43:38 -0700 (PDT)
Date: Wed, 6 Oct 2021 13:43:35 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, X86 ML <x86@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
Message-ID: <20211006204335.xtymxt6wk4akx6fc@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-7-samitolvanen@google.com>
 <20211006032945.axlqh3vehgar6adr@treble>
 <20211006090249.248c65b0@gandalf.local.home>
 <CABCJKueL4Ebaan=JBUyO3oewq7RTHHXWUQpixgf2AfC_r5T3uA@mail.gmail.com>
 <20211006125809.5389b2a3@gandalf.local.home>
 <CABCJKudTuheEd5jyhXmfJHup7iYzOz3_OcO92hFnpRK1MapJSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABCJKudTuheEd5jyhXmfJHup7iYzOz3_OcO92hFnpRK1MapJSg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 06, 2021 at 10:45:41AM -0700, Sami Tolvanen wrote:
> On Wed, Oct 6, 2021 at 9:58 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Wed, 6 Oct 2021 09:31:04 -0700
> > Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > > > > On Thu, Sep 30, 2021 at 11:05:22AM -0700, Sami Tolvanen wrote:
> > > > > > With CONFIG_CFI_CLANG, the compiler changes function references to point
> > > > > > to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
> > > > > > are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.
> > > >
> > > > "not called from C" is a bit confusing.
> > >
> > > Any thoughts on how to make this less confusing?
> >
> >  "Not called by C code, but injected by the compiler."
> >
> > ?
> 
> Sure, sounds good to me. I'll update this in v5.

"injected by the compiler" sounds even more confusing.  It almost sounds
like those functions are generated by GCC, which they are most
definitely not.

-- 
Josh

