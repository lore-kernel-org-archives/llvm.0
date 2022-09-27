Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3D29A8
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 18:41:04 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d24so9870288pls.4
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=e7R+mDLju2JroAcNFMiEg35mWzGVebbcux9nnUdL0+s=;
        b=XP3ei/YY35BS6LARIxHchz6xoHvIGGmZNaPaqubd/9AtflMvF6FPymZ23lgOvUUlX9
         fq2g0GoJgzf55NsbkZ1ITvHY3yZW0lBZgRmpmhyDYqu0+Ww8kXYgc0kcf8ND0KfCFdu8
         q6xmnfVySqteH9LyV2p4GPqh3RYh2csuyU7HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=e7R+mDLju2JroAcNFMiEg35mWzGVebbcux9nnUdL0+s=;
        b=QYlX1qQAWJotQwFf6qIPKPT2K7vGLC/ax84Umhw1j8hpnAZPMdQdWU3Vt7nRtLttBv
         L4urCchKVCxGB/TiT0PSgw2wRQ4McPSPkgCUMcd4bHyHzYfmOgh0Z8UzcVNhhNniHva2
         K+dy73N9Ts5j+RVcteji0IMAND1MeJV0/UNP4GFhespTvOtRZywo1XnlCIjjdwWNTAZW
         WJMVyHVFYhjgngLNjtlo5t1OWCNsZCZrG2cJo3v/VqysFt71kInC7U522cdYijcf83aP
         Y23fPPQv/LWMRB+lqhGbUdeEZMBAVaulOVvbcwfJPnsdmO91alYANHcTE+ZgOyvVkA5U
         DDUA==
X-Gm-Message-State: ACrzQf1y7g+bKNhdciqMF3vY1J+sSYYDGZdHXQkOO6Tc/YQzmGNCU6ci
	fR0+oq5nn+C3ETyTlPf1d2Awzw==
X-Google-Smtp-Source: AMsMyM6mgGHLlGWhcrVcjuLvxN36jGAc0ixW3+4jzpS7y1F8Pj0NInwGA78MT8xniWkhPWHkmePT2w==
X-Received: by 2002:a17:90b:380d:b0:202:56b2:4ef8 with SMTP id mq13-20020a17090b380d00b0020256b24ef8mr6134704pjb.2.1664304064224;
        Tue, 27 Sep 2022 11:41:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902f70f00b00173411a4385sm1912789plo.43.2022.09.27.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 11:41:03 -0700 (PDT)
Date: Tue, 27 Sep 2022 11:41:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86, mem: move memmove to out of line assembler
Message-ID: <202209271126.605B4FF@keescook>
References: <CAKwvOd=a+0VNP-d=mHnbM4ujdtPrujru4dxHtfDo+EEM+b6deg@mail.gmail.com>
 <20220927172839.3708280-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927172839.3708280-1-ndesaulniers@google.com>

On Tue, Sep 27, 2022 at 10:28:39AM -0700, Nick Desaulniers wrote:
> When building ARCH=i386 with CONFIG_LTO_CLANG_FULL=y, it's possible
> (depending on additional configs which I have not been able to isolate)
> to observe a failure during register allocation:
>
>   error: inline assembly requires more registers than available
>
> when memmove is inlined into tcp_v4_fill_cb() or tcp_v6_fill_cb().
>
> memmove is quite large and probably shouldn't be inlined due to size
> alone. A noinline function attribute would be the simplest fix, but
> there's a few things that stand out with the current definition:
>
> In addition to having complex constraints that can't always be resolved,
> the clobber list seems to be missing %bx and %dx, and possibly %cl. By
> using numbered operands rather than symbolic operands, the constraints
> are quite obnoxious to refactor.
>
> Having a large function be 99% inline asm is a code smell that this
> function should simply be written in stand-alone out-of-line assembler.
> That gives the opportunity for other cleanups like fixing the
> inconsistent use of tabs vs spaces and instruction suffixes, and the
> label 3 appearing twice.  Symbolic operands and local labels would
> provide this code with a fresh coat of paint.
>
> Moving this to out of line assembler guarantees that the compiler cannot
> inline calls to memmove.
>
> This has been done previously for 64b:
> commit 9599ec0471de ("x86-64, mem: Convert memmove() to assembly file
> and fix return value bug")
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Unfortunately, it seems something has gone wrong with this
implementation. Before the patch:

$ ./tools/testing/kunit/kunit.py run --arch=i386 memcpy
...
[11:26:24] [PASSED] memmove_test
...

After the patch:

$ ./tools/testing/kunit/kunit.py run --arch=i386 memcpy
...
[11:25:59] # memmove_test: ok: memmove() static initializers
[11:25:59] # memmove_test: ok: memmove() direct assignment
[11:25:59] # memmove_test: ok: memmove() complete overwrite
[11:25:59] # memmove_test: ok: memmove() middle overwrite
[11:25:59] # memmove_test: EXPECTATION FAILED at lib/memcpy_kunit.c:176
[11:25:59] Expected dest.data[i] == five.data[i], but
[11:25:59] dest.data[i] == 136
[11:25:59] five.data[i] == 0
[11:25:59] line 176: dest.data[10] (0x88) != five.data[10] (0x00)
[11:25:59] # memmove_test: ok: memmove() argument side-effects
[11:25:59] # memmove_test: ok: memmove() overlapping wr\xf0te
[11:25:59] not ok 3 - memmove_test
[11:25:59] [FAILED] memmove_test
...

data[10] starts set as 0x99, and in theory gets 0x0 written to it, but
the self-test sees 0x88 there. (?!) It seems the macro side-effect test
caught something else entirely?

-Kees

--
Kees Cook
