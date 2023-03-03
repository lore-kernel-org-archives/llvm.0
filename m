Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8D8F42
	for <llvm@lists.linux.dev>; Fri,  3 Mar 2023 20:29:25 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id a2so3981344plm.4
        for <llvm@lists.linux.dev>; Fri, 03 Mar 2023 12:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677875364;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ug2Z8EfRGa5wXZv9R1S7FFDl+MMXhp2ajp3G/Mo9nU4=;
        b=NtmQWi9toAZw3wKPMJ7L+bVX7AsKeXEUVZzNc61Sv1eAtGplSPyGYSdSz/thuFy3Ro
         l0ljb+r0Ij9ZZciynPhNjmrA+EYfaAbbaA1b8Cv7CMo4felDMzLv/e23Dpja0c+f6x9r
         vxtGhYy7Vif1k7Be1sRbTvqcEiOxW4Z/ZMvX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677875364;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug2Z8EfRGa5wXZv9R1S7FFDl+MMXhp2ajp3G/Mo9nU4=;
        b=sUfjg1ICtq+KV6PVwTeW5om6uCMHL9srOk4RmluUOhUoBND6Soj54Wuy/dN3bJOUuz
         r/mMxzcyugmfbilI+gnxwsU/3ANkH4mUHc8MKANBESiroc/hVB1eGJJpON37E9fHMBNd
         5VXUppdUPI3Eg8yJdTyrU6s4U9Aa8UsrvpRTcQJVvyky0L1IpeY7TdPOdOl93up3Qwj8
         xa2Mz0LJTL3Bdv/9cXGJVupBzEuL+AUWHKJViY+KnQZKR+pMo3OQ70rf1lnpLFMxIUa7
         epMVEcC0TKTRSZhSdORcaZ3Y4KsoNiVkcVUkg8EidTFe175QqRag0v021EHFfbnvyaaV
         1aeA==
X-Gm-Message-State: AO0yUKWhZKLooT8/TMe9Sxt5jai8BMcnqdQF8DBC5AeSvjY1/y+vdpPB
	/Lj9IjAn+EJaRvM0Vx/bd+LRMA==
X-Google-Smtp-Source: AK7set8Hbguq1EyX4kofN/jOOCOGo1tFROI/fI6a3VBD2O6AZtNvSLeX3ZNdPVBgKunGYTMNZUCjTA==
X-Received: by 2002:a17:90b:4b41:b0:234:a9df:db83 with SMTP id mi1-20020a17090b4b4100b00234a9dfdb83mr2996268pjb.10.1677875364637;
        Fri, 03 Mar 2023 12:29:24 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r3-20020a17090aa08300b00230befd3b2csm3907348pjp.6.2023.03.03.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 12:29:24 -0800 (PST)
Message-ID: <640258a4.170a0220.a298f.8ed5@mx.google.com>
X-Google-Original-Message-ID: <202303031226.@keescook>
Date: Fri, 3 Mar 2023 12:29:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ubsan: Tighten UBSAN_BOUNDS on GCC
References: <20230302225444.never.053-kees@kernel.org>
 <20230303154433.GA3775@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303154433.GA3775@dev-arch.thelio-3990X>

On Fri, Mar 03, 2023 at 08:44:33AM -0700, Nathan Chancellor wrote:
> On Thu, Mar 02, 2023 at 02:54:45PM -0800, Kees Cook wrote:
> > [...]
> >  config CC_HAS_UBSAN_ARRAY_BOUNDS
> >  	def_bool $(cc-option,-fsanitize=array-bounds)
> > +	help
> > +	  The -fsanitize=array-bounds option is only available on Clang,
> > +	  and is actually composed of two more specific options,
> > +	  -fsanitize=array-bounds and -fsanitize=local-bounds. However,
> > +	  -fsanitize=local-bounds can only be used when trap mode is
> > +	  enabled. (See also the help for CONFIG_LOCAL_BOUNDS.)
> 
> The first sentence does not read right to me, you have array-bounds
> twice. I think the first one wants to be just bounds?

Oops, yes. I rewrote that a few times and seem to have gotten lost. I
think it is better written as:

	  Under Clang, the -fsanitize=bounds option is actually composed
	  of two more specific options, -fsanitize=array-bounds and
	  -fsanitize=local-bounds. However, -fsanitize=local-bounds can
	  only be used when trap mode is enabled. (See also the help for
	  CONFIG_LOCAL_BOUNDS.) Explicitly check for -fsanitize=array-bounds
	  so that we can build up the options needed for UBSAN_BOUNDS
	  with or without UBSAN_TRAP.


-- 
Kees Cook
