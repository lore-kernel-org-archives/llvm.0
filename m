Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F62C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 02:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633488181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUAUXyTr5vnf62A2xBA5BH7uNkswc0Qgd6ouuCQsbIM=;
	b=XaVa7ky6rDL01aK17hUODkT5Wc0xMspf7zFBW9P02vzk+iRyYiIv2/gOAmmhndTsQk28oq
	3O6oHrraLCUY3GyQCMMWdSDOSv4YhyteaR1tpg2gu582zVW2/iyov4k/8NMR9AS7RzsUyP
	n/MEO7W28IxX3RAJdO38ivSc0/AQ0dM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-pq8omk8oOaGbl7Fyt9DI_w-1; Tue, 05 Oct 2021 22:42:58 -0400
X-MC-Unique: pq8omk8oOaGbl7Fyt9DI_w-1
Received: by mail-qv1-f72.google.com with SMTP id ge6-20020a05621427c600b003830ee0213bso1532386qvb.10
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 19:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUAUXyTr5vnf62A2xBA5BH7uNkswc0Qgd6ouuCQsbIM=;
        b=ctTuIMvF5430IxoRn2+ZveSzlKc4SWeF1E6R95iDAths/7uEdmoN0sYWUkkJuj+LtO
         d0c2Y08H90eyv+OUq3KZnGA4aIlSoFf05nmo9ehT71ZZOCoh4pRaKBCJBSLdjmY7Azcp
         ++eIMy0sL14TwhV1XXb2SKdyoCURtfHTUuCxU1PSrbADLAwQqLuZPh/7zrBr2F1XAYGe
         CLvmFrqnI8EuIn7eLoXXg7YYTpytZX+1PMvPE0unHiNPQm8JpDcbWG9BWv9E/NgqimVJ
         VnrjVYkwOOvy2gVV1gDjYWyQBaVKYbUkbQHZ5Xf2tS2+4OXTfoqvKjz7X+b6Ccp6L3F4
         Og2Q==
X-Gm-Message-State: AOAM530eQCt+VrP6aAInymrtdV0ZQ0sjK5yYkL1uDETGSN78aSAs4HcN
	z9doCLeMJv4/Ysj2cJrcIGswmzUoqCm1q4AP7Iyeg1o/IqML5iP/oAgvxZpyb3F4L5P6NytKdbb
	9L35jZtFONHNQ/A==
X-Received: by 2002:ac8:7d12:: with SMTP id g18mr24249004qtb.82.1633488178216;
        Tue, 05 Oct 2021 19:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlNFrMpQVPhAy+nSKZsOCb/8cFE1cda7K2580Uqvaqrdc1IH5K+P2YEgxwEyd0o99Qs3g8TQ==
X-Received: by 2002:ac8:7d12:: with SMTP id g18mr24248978qtb.82.1633488177947;
        Tue, 05 Oct 2021 19:42:57 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id o23sm11997921qtl.74.2021.10.05.19.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 19:42:57 -0700 (PDT)
Date: Tue, 5 Oct 2021 19:42:54 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v4 00/15] x86: Add support for Clang CFI
Message-ID: <20211006024254.l3mrl2zrdvzpskmd@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20211005203655.cvjfxmjvgx2knkuk@treble>
 <CABCJKucbbFKHRnisu_yLiHkTfcm9Z+haP0CBNg-pLeO6iFxivg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABCJKucbbFKHRnisu_yLiHkTfcm9Z+haP0CBNg-pLeO6iFxivg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 05, 2021 at 02:52:46PM -0700, Sami Tolvanen wrote:
> On Tue, Oct 5, 2021 at 1:37 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Thu, Sep 30, 2021 at 11:05:16AM -0700, Sami Tolvanen wrote:
> > > This series adds support for Clang's Control-Flow Integrity (CFI)
> > > checking to x86_64. With CFI, the compiler injects a runtime
> > > check before each indirect function call to ensure the target is
> > > a valid function with the correct static type. This restricts
> > > possible call targets and makes it more difficult for an attacker
> > > to exploit bugs that allow the modification of stored function
> > > pointers. For more details, see:
> > >
> > >   https://clang.llvm.org/docs/ControlFlowIntegrity.html
> > >
> > > Note that v4 is based on tip/master. The first two patches contain
> > > objtool support for CFI, the remaining patches change function
> > > declarations to use opaque types, fix type mismatch issues that
> > > confuse the compiler, and disable CFI where it can't be used.
> > >
> > > You can also pull this series from
> > >
> > >   https://github.com/samitolvanen/linux.git x86-cfi-v4
> >
> > Does this work for indirect calls made from alternatives?
> 
> It works in the sense that indirect calls made from alternatives won't
> trip CFI. The compiler doesn't instrument inline assembly.
> 
> > I'm also wondering whether this works on CONFIG_RETPOLINE systems which
> > disable retpolines at runtime, combined with Peter's patch to use
> > objtool to replace retpoline thunk calls with indirect branches:
> >
> >   9bc0bb50727c ("objtool/x86: Rewrite retpoline thunk calls")
> >
> > Since presumably objtool runs after the CFI stuff is inserted.
> 
> The indirect call checking is before the retpoline thunk call, so
> replacing the call with an indirect call isn't a problem.

Ah right.  I managed to forget how this worked and was thinking this
intercepted the indirect call rather than the function pointer.

-- 
Josh

