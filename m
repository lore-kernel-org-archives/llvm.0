Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF897A
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 18:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB0AC385B8;
	Tue, 17 May 2022 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652813769;
	bh=Yi+0lsXSicacS3iENqe5F7Pl404qkkEQg0wUofyHHMU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=cwNSvWN9KQKFfXk3lgU0aYkKZUEHYZrWEDt9Zh8+A0cxQGK/NesvBnJ9w8U/5y8H6
	 lKq253Pegv+JIjCxu6vHWi07MveL/qbGpCYMvY4gDIaVjllZdJVZTxjX/mOMyfhjv9
	 iHz3Kpx34+RmOFKIdNqM9GFfjv26PpqWFFhtaXsZkuythkhoU1NPBmIBBZ6LoPYSg5
	 p8QKWqoOYsoa+93OUh+Dkc9lM6mSghqo4Jy+FXuXC5p5WqLgEqECtTIlIITfqpFvhr
	 cTvb0aZ2QTWJUu23XCdPqg8JQXIYFKMP8NmNYS9weryEFC6JK6FF8VLqJkmeJfMMJd
	 qp4nrA1VQEWLQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 498075C033E; Tue, 17 May 2022 11:56:09 -0700 (PDT)
Date: Tue, 17 May 2022 11:56:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	linux-toolchains <linux-toolchains@vger.kernel.org>,
	Kees Cook <keescook@google.com>, Bill Wendling <morbo@google.com>
Subject: Re: 2022 Clang-Built Linux Meetup: Call For Papers
Message-ID: <20220517185609.GB1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAGG=3QX8M0p2JQOs6tq0ZSqHKLhzVh77eCxYkh22SDL6Qaa36g@mail.gmail.com>
 <CAKwvOdmRBZ7F7H2ySrh6P8bg+QP0F1WOdxH_oz9nJFE+HAMQyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmRBZ7F7H2ySrh6P8bg+QP0F1WOdxH_oz9nJFE+HAMQyg@mail.gmail.com>

Hello, Yonghong,

On the perhaps unlikely off-chance that this is new news.

							Thanx, Paul

On Fri, May 13, 2022 at 12:57:28PM -0700, Nick Desaulniers wrote:
> On Fri, Apr 29, 2022 at 1:25 PM Bill Wendling <morbo@google.com> wrote:
> >
> > The 2022 Clang-Built Linux Meetup is planned for 10-11 September, 2022
> > in Dublin, Ireland.
> >
> > This is a time for everyone interested in Clang and Linux to get
> > together to share ideas, present current works, and generally have
> > fun. Best of all, we're meeting in person this year!
> >
> >   https://clangbuiltlinux.github.io/cbl-meetup/
> >
> > Call For Papers
> >
> > If you have ideas for a presentation, create an "issue" on the GitHub site:
> >
> >   https://github.com/ClangBuiltLinux/cbl-meetup/issues
> >
> > More information will be forthcoming as the date approaches and
> > logistics are solidified.
> >
> > Share and enjoy!
> > -bw
> 
> We'll be holding the event at
> 
> Google Building GRCQ1
> 1 Grand Canal Quay,
> Dublin, D02 FF61, Ireland
> 
> IE-DUB-GRCQ1-2-Birr Castle
> 
> (Linked on the above site as well)
> 
> https://goo.gl/maps/32yVACGEiFS1goeR9
> 
> Also, Plumbers just announced their location:
> 
> https://twitter.com/srostedt/status/1525163880284053506
> https://lpc.events/
> ^ specifically mentions "We anticipate announcing a room block when we
> open registration.
> We hope to open registration for both types of registration in June."
> -- 
> Thanks,
> ~Nick Desaulniers
