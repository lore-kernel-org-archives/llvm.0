Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454D79C5
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 19:50:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id k2so6427474pll.8
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679082609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTkWXMj0l/9cqk/U0QQ/wZMUy1oF1i/mojVUtfUyiYM=;
        b=IE3ITaccsan+R7me0dIE2PcYdM+dVje3nOwIhznF4FJf+hmIF+M8+FcZ3hksSrj8xy
         Ir31hHz9tz7PZ80scltPHUN/X+6xEhGUZzX+yDTRiZ0GdSN/CcsVwIibxohSfE4m2EFo
         t/nqkHi+beP/WkbSedbxLWL9Q9pS2qIihwCZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679082609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTkWXMj0l/9cqk/U0QQ/wZMUy1oF1i/mojVUtfUyiYM=;
        b=qQ4b8lBUG00GvQKcxY0CeaIBwbDtvMKv5x65Gw5ypq5+lWQgCQQiTXWa//CEYDa7zE
         UctTjWxI4XKRQN3ys0NNUp8UlNUpgfTcsaqvlaicjc4l5O3Xb/aLDs/xTtKWVAyIwPPe
         55ugRWoY82caIUW20JGl8l6hNrgYALPw3HfqvvQU2rWEso+baEtS7IOqOMWZjOK6FQtg
         3g7k5diszPAuk6IMdk3G3pFOdtHpirzeH2hDOFutfh2LRJKCiUYggIDbCOJXcM6YwtYt
         QTfAn+U6xi4p5pvh1P4BCZuE51g6D7qYQjny2UDEuRHv+HF9ESgGdGFwAyLSty3dgGdZ
         +OUg==
X-Gm-Message-State: AO0yUKXemL53VBLH9YfJYf7ItKkFTtjRhzW0pg86ZeR5jMkvfiRCqv7o
	rFCH9AGv/vSe4ReWOrc+6YHI1g==
X-Google-Smtp-Source: AK7set9AzIb4HFRsROSmeue9TaLtzCV7t6cukuLBwQ5LSDNFbsd/UlVIO0YGe4xkZ/Axy9kZ6+LhcA==
X-Received: by 2002:a05:6a20:728d:b0:ce:c188:68af with SMTP id o13-20020a056a20728d00b000cec18868afmr10510377pzk.17.1679082609596;
        Fri, 17 Mar 2023 12:50:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h15-20020aa786cf000000b005b34d81b010sm1964869pfo.91.2023.03.17.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:50:08 -0700 (PDT)
Message-ID: <6414c470.a70a0220.6b62f.3f02@mx.google.com>
X-Google-Original-Message-ID: <202303171242.@keescook>
Date: Fri, 17 Mar 2023 12:50:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	linux-hardening@vger.kernel.org
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com>
 <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmJkQUe6bhvQXHo0XOncdso0Kk26n8vdJZufm4Ku72tng@mail.gmail.com>

On Fri, Mar 17, 2023 at 11:59:11AM -0700, Nick Desaulniers wrote:
> +Sanitizer folks (BCC'd)
> (Top of lore thread:
> https://lore.kernel.org/linux-block/9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk/)
> 
> On Fri, Mar 17, 2023 at 11:35 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Mar 17, 2023 at 10:16 AM Jens Axboe <axboe@kernel.dk> wrote:
> > > Side note - when doing the usual allmodconfig builds with gcc-12 and
> > > clang before sending them out, for the latter I see this warning being
> > > spewed with clang-15:
> > >
> > > drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() falls through to next function m5mols_get_frame_desc()
> > >
> > > Obviously not related to my changes, but mentioning it in case it has
> > > been missed as I know you love squeaky clean builds :-). Doesn't happen
> > > with clang-14.
> >
> > Hmm. I have clang-15 too, but I do the allmodconfig builds with gcc,
> > and only my own "normal config" builds with clang.
> >
> > So I don't see this particular issue and my builds are still squeaky clean.
> >
> > That said, when I explicitly try that allmodconfig thing with clang, I
> > can see it too. And the reason seems to be something we've seen
> > before: UBSAN functions being considered non-return by clang, so clang
> > generates code like this:
> >
> >    ....
> > .LBB24_3:
> >         callq   __sanitizer_cov_trace_pc@PLT
> >         movl    $2, %esi
> >         movq    $.L__unnamed_3, %rdi
> >         callq   __ubsan_handle_out_of_bounds
> > .Lfunc_end24:
> >         .size   m5mols_set_fmt, .Lfunc_end24-m5mols_set_fmt
> >
> > ie the last thing in that m5mols_set_fmt() function is a call to
> > __ubsan_handle_out_of_bounds, and then it "falls through" to the next
> > function.
> >
> > And yes, I absolutely *detest* how clang does that. Not only does it
> > cause objtool sanity checking issues, it fundamentally means that we
> > can never treat UBSAN warnings as warnings. They are always fatal.

I've hit these cases a few times too. The __ubsan_handle_* stuff
is designed to be recoverable. I think there are some cases where
we're tripping over Clang bugs, though. Some of the past issues
have been with Clang thinking some UBSAN feature was trap-only
(e.g. -fsanitizer=local-bounds), but here it actually generated the call,
but decided it was no-return. *sigh*

> > But I suspect we need to disable UBSAN for clang, because clang gets
> > this so *horribly* wrong.

Which is to say, it normally gets it right, but there are some instances
where things go weird. If it was horribly wrong, there would be a LOT
more objtool warnings. :)

I'm not opposed to disabling UBSAN for all*config builds if we need to,
but I want to get these Clang bugs found and fixed so I'd be sad to lose
the coverage.

-- 
Kees Cook
