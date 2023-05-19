Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0F125D5
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 17:42:19 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7577ef2fa31so54506985a.0
        for <llvm@lists.linux.dev>; Fri, 19 May 2023 10:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684518138; x=1687110138;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVBXORYA5fI/Y7ZPBzQO5l0Wm2EiovEm+KKQqG7za60=;
        b=NtmU+6YUtm48wdaO56sPiYMa+M85WEEK+pf0ientQ50mUxYF1e5m9NIkxing+pdbX6
         xlz4zv3pwbhrcTjbohXNkifxblPAj0W7+n81TSPuIrnPF7c6JbyuuuTA/SzYusD3YlKo
         E9zFLM7fQr1CU/n1Tr7EsoMWHWu0d0zh5PixWVN5Y3Nmcoh7x8pDM+ZBM76yGENpWcB7
         cxUwdNhUZBoiL6somzkwwVn6+A6QfRKpXsBP3zvrFbtNy/IAb/KatHdMuaTDq/j5HJpi
         X0lMSyfgqamb7Mx4U2ZAAF3RSIQoW/ovCjPLKCaswO+E8zPi+r3/fbAyNZ4LK9zsfo/o
         Fw+Q==
X-Gm-Message-State: AC+VfDzpngSMu5FJM34nMBqMFWik/PNZIYwOoG2EKJKjz1yJpM4q9zlF
	AqsBL5SrhVm9ulOXSKn1dEw=
X-Google-Smtp-Source: ACHHUZ57aYaLkvcxZAWErCGtmjwOeb/l4TV4esRxYZQRZFbcTv3wtC3AKblwR/M8FCpNJSwkvBfpag==
X-Received: by 2002:a05:6214:240c:b0:5ef:512d:2d47 with SMTP id fv12-20020a056214240c00b005ef512d2d47mr6116917qvb.19.1684518138069;
        Fri, 19 May 2023 10:42:18 -0700 (PDT)
Received: from maniforge ([2620:10d:c091:400::5:311e])
        by smtp.gmail.com with ESMTPSA id s1-20020a05621412c100b006166d870243sm1475313qvv.43.2023.05.19.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:42:17 -0700 (PDT)
Date: Fri, 19 May 2023 12:42:15 -0500
From: David Vernet <void@manifault.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [tip: objtool/core] start_kernel: Add __no_stack_protector
 function attribute
Message-ID: <20230519174215.GA2158284@maniforge>
References: <20230412-no_stackp-v2-1-116f9fe4bbe7@google.com>
 <168440808395.404.16801982965854981978.tip-bot2@tip-bot2>
 <20230519171120.GA1939377@maniforge>
 <CAKwvOd=ywPnLS40HNUnXH1nqm3Ke3sMtomSgL+rVOoSjXvQB=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=ywPnLS40HNUnXH1nqm3Ke3sMtomSgL+rVOoSjXvQB=A@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Fri, May 19, 2023 at 10:18:40AM -0700, Nick Desaulniers wrote:
> On Fri, May 19, 2023 at 10:11 AM David Vernet <void@manifault.com> wrote:
> >
> > On Thu, May 18, 2023 at 11:08:03AM -0000, tip-bot2 for ndesaulniers@google.com wrote:
> > > The following commit has been merged into the objtool/core branch of tip:
> > >
> > > Commit-ID:     514ca14ed5444b911de59ed3381dfd195d99fe4b
> > > Gitweb:        https://git.kernel.org/tip/514ca14ed5444b911de59ed3381dfd195d99fe4b
> > > Author:        ndesaulniers@google.com <ndesaulniers@google.com>
> > > AuthorDate:    Mon, 17 Apr 2023 15:00:05 -07:00
> > > Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
> >
> > Hi Nick, Josh, Peter,
> >
> > Do you have an ETA for when this will make its way to Linus' tree?
> > clang-17 built kernels have failed to boot since [0], so it would be
> > nice to get this in sooner rather than later if possible.
> 
> David,
> Can you confirm that your version of clang-17 is updated? clang-17 is
> unreleased; ToT will become clang-17.
>
> https://reviews.llvm.org/rGfc4494dffa5422b2be5442c235554e76bed79c8a
> should have fixed any boot failures related to stack protectors.  That
> is to say that Josh's series is irrelevant to anyone using either an
> existing release of clang, or something closer to ToT than April 13.

Thanks for the quick reply, Nick. The latest clang-17 does indeed fix
the issue. Apologies for not trying that first -- I was using the only
tagged verson of clang-17 (which admittedly is not a released version),
and figured it wasn't a compiler bug given that the assembly looked
sane, compilers are allowed to do all sorts of interesting things with
__noreturn, and that [1] removes -fstack-protector from start_kernel()
altogether.

[1]: https://lore.kernel.org/lkml/20230412-no_stackp-v1-1-46a69b507a4b@google.com/

> LLVM commit fc4494dffa54 ("[StackProtector] don't check stack
> protector before calling nounwind functions")
> landed April 13, so please check that your build of clang-17 is after that date.
> 
> Either way, thanks for testing with clang, and the report. You can
> always file a bug at our issue tracker:
> https://github.com/ClangBuiltLinux/linux/issues or see our page for
> more ways to get in touch:
> https://clangbuiltlinux.github.io/
> We're very active on our mailing list, and on IRC.

Ack, thanks for letting me know for next time.

- David
