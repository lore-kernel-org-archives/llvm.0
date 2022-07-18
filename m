Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57C4683
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gB0Dyj6KD1xR0J9edWlW2XlEQizibh7QqbUWvK+mgdc=; b=eObLTaTy/3Us0YDbQ5gnsRcwcZ
	DuDFu+DbE2G2jh6j/NlBzj89vGk9Ot9DsAGhGZXwZxAfFuM3xbPLMzHXqe0n3NiJXDAh+zpSyesu0
	/yIaXYGLlRJLO48Nr+n3Vnlmc79kCqNiUDMJ6/kq4RR2yDSpknB2nX1fT9NxNE9ekd2lgagl20bVH
	vkOsh1WPu1uZkxgRXHmhJvTsImpDTfQ4JOzW9BxDlhdY3CASpc+BG1b0r1rdMS7KNI8Towfzug/bx
	d2SFavJYeWYJIZcPdOxkUhWJ/ovM6TuBKEo2rV1Yu1uzV7fjxk6NsX9Nh0koq5YwNtI5MIjCH5lvL
	nkIsd8tg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYZN-00D3tf-Aq; Mon, 18 Jul 2022 21:46:25 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id AC3489802A7; Mon, 18 Jul 2022 23:46:24 +0200 (CEST)
Date: Mon, 18 Jul 2022 23:46:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v3 00/20] KCFI support
Message-ID: <YtXUsIjT9IDGKUCv@worktop.programming.kicks-ass.net>
References: <20220610233513.1798771-1-samitolvanen@google.com>
 <202206131001.6BA9933C@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206131001.6BA9933C@keescook>

On Mon, Jun 13, 2022 at 10:04:12AM -0700, Kees Cook wrote:
> On Fri, Jun 10, 2022 at 04:34:53PM -0700, Sami Tolvanen wrote:
> > KCFI is a proposed forward-edge control-flow integrity scheme for
> > Clang, which is more suitable for kernel use than the existing CFI
> > scheme used by CONFIG_CFI_CLANG. KCFI doesn't require LTO, doesn't
> > alter function references to point to a jump table, and won't break
> > function address equality. The latest LLVM patch is here:
> > 
> >   https://reviews.llvm.org/D119296
> > 
> > This RFC series replaces the current arm64 CFI implementation with
> > KCFI and adds support for x86_64.
> 
> I think the "RFC" prefix for this series can be dropped. :)
> 
> It looks to me like all of Peter's concerns have been addressed. I'd say
> let's get the Clang side landed, and once that's done, land this via x86
> -tip?
> 
> Peter and Will does this sound right to you? It touches arm64, so if
> -tip isn't okay, I could take it in one of my trees?

Sorry, I was a bit pre-occupied with this retbleed crud, I'll try and
have a look at things shortly.
