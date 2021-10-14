Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3A72
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:47:03 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id m26so6251597pff.3
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=flE15Vag1x2qH6k6oFaTp0PZRJ1ZGZb8THhO62QsLjE=;
        b=BeR9rE+h6oOZjaOHDA370v0suUCXLikBJQsw9Cy8vwaf1/MG0Ui7pXfraYG/Nyb0qd
         iqaQ02SSXwqqNyFydlvvqyk1qE2NADJLiuipogiDTsBcouXv5GaZVVwijXEiHrpht0kN
         02AqT5qkbHDgVntpqt7nKyIht9C8bmQJYVhdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=flE15Vag1x2qH6k6oFaTp0PZRJ1ZGZb8THhO62QsLjE=;
        b=J+TBOpvaXH7Cf1YBa3DMLI/asPYY5Gaslw2oiXOByRE/gjw4KOQTbz9jVX4kCJIxhe
         Xe+0Bbr9+l5FpervNFIlAfXbLQLPWCinWLDvf5Oy+bf7qs6WYHsghxsrd95yAEPFCpQC
         0APz5W0rJny9k4cxQ0pVtIAj4v8Fu2WaZlcNcriB2TAHXnBYy/Qw51+SC5bWiUa7qSga
         8dZOX1h3m0hbpp/3t+abR6bnqbIREogqYugB7HbSgk+bNYWtEE30dQu/7uo9i3pObns2
         /qpzPUXEMg8DIoAUUXzjbRBOn5MKYBAHPI0uibTmSNDK3OzjsMNM8pCxQ3iMnGj9V+7a
         XAIQ==
X-Gm-Message-State: AOAM530lNoYqXoqvan/umJvy0mOoZOJpYkvlDlLrbLGyljn2dkl7nndp
	x7NisFCTchpAY5Oy90QfSla3lA==
X-Google-Smtp-Source: ABdhPJzYq661wv4AErhvhHm19916LjgZM0cmC1UFXDThhI7WtsP5/hjhJSDpBPLelZ054c+1Ggo7wA==
X-Received: by 2002:a62:7dd0:0:b0:44c:b0b8:6eaa with SMTP id y199-20020a627dd0000000b0044cb0b86eaamr7036185pfc.73.1634237222778;
        Thu, 14 Oct 2021 11:47:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o12sm2954984pgn.33.2021.10.14.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 11:47:02 -0700 (PDT)
Date: Thu, 14 Oct 2021 11:47:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Sami Tolvanen <samitolvanen@google.com>, x86@kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
Message-ID: <202110141141.870A67E@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-10-samitolvanen@google.com>
 <YWgSwmzPFrRbMC1P@zn.tnic>
 <202110140904.41B5183E@keescook>
 <YWhpbu/Y6V2p/zlY@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWhpbu/Y6V2p/zlY@zn.tnic>

On Thu, Oct 14, 2021 at 07:31:26PM +0200, Borislav Petkov wrote:
> On Thu, Oct 14, 2021 at 09:07:57AM -0700, Kees Cook wrote:
> Looking at the changelog, DECLARE_ASM_FUNC_SYMBOL, makes a lot more
> sense to me even if it doesn't specify the aspect that it is not called
> by C but who cares - it is generic enough.

Around we go. :) Josh[1] and Steven[2] explicitly disagreed with
that name, leading to the current name[3]. Do you want it to be
DECLARE_ASM_FUNC_SYMBOL() over those objections?

I'd really like to finish this shed -- I need to take the bikes in from
the rain. :P

-Kees

[1] https://lore.kernel.org/lkml/20211006032945.axlqh3vehgar6adr@treble/
[2] https://lore.kernel.org/lkml/20211006101654.6a5be402@gandalf.local.home/
[3] https://lore.kernel.org/lkml/CABCJKufCaOXOUF43a-PQshO8aEsMNhZ2EiyGMSOp9ZGn57G=pg@mail.gmail.com/

-- 
Kees Cook
