Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E12F30
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qk8gZa9N3AskrJn2j9FvrWIxAqKPjieXt9y5DlvxdVg=; b=lrKkBtItZ2p0f2KTpxQ+dZGQZC
	2Bahna8JsffcfVNGoy7ANQZRPXBf952KhT1nd/gh9B+Pke6cQShXh1wJ5atv7Xyp1Slw/FjFodVm6
	V8Qf6JP8samqQGZPFZ/EZHZFEMe0qiuyurSuDwEePDS1RHVPLRo8RRzDwhcdT3qYsKgIUTzstvjbi
	aDCLF3aRRua6uYS0S6ZW/T/mhP9uzzqGBb8WvGwz8jkz6JU03cvSJSHpaD7d62L7yR2ASIAhbMxC1
	VshtmVQ7dvksoCnIuJQ26SyYM1Ji5bEegEYhs7VU9RiERk0SV5p4wfQtE/orOS9lXkqbD1DFMhdDr
	eDKnFi2w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRcor-00GLFR-Uu; Tue, 08 Mar 2022 16:36:18 +0000
Date: Tue, 8 Mar 2022 16:36:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2] kbuild: Make $(LLVM) more flexible
Message-ID: <YieGARVP2dhn8tbQ@casper.infradead.org>
References: <20220304170813.1689186-1-nathan@kernel.org>
 <CAKwvOd=Q-7vPaRPj1wQagFsY3txcAKzrqU_D2UAX3h4ym91uUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=Q-7vPaRPj1wQagFsY3txcAKzrqU_D2UAX3h4ym91uUA@mail.gmail.com>

On Mon, Mar 07, 2022 at 11:08:29AM -0800, Nick Desaulniers wrote:
> > +``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
> > +``LLVM=1``.
> 
> Hmm... I can see someone's build wrappers setting LLVM=1, then them
> being surprised that appending LLVM=0 doesn't disable LLVM=1 as they
> might expect.  But Masahiro says let's fix this later which is fine.

What happens if you say LLVM= instead of LLVM=0 ?  Would that "undo"
a prior LLVM=1 and use GCC instead?
