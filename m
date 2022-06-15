Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A783D99
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 21:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170CBC3411A;
	Wed, 15 Jun 2022 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655327541;
	bh=KvZbkPsYHPy1CP4cP4B8D3AbbBahxVtKDnXpikA2PzA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GZIZXxNdTDPFdNxWxd2vu5buItGBwGqu4Co/QAne2ocDNVAbSN1h5M5mXC5RQWYsm
	 G7fBjwtzdiagL7634Yj1vgBfWEWM+auammDz/Tg1GARXU6tn35+Mv9gpkaTY85dCnB
	 m+HqzAsPdVaTTjSbfnlaZTwOJnJVKEtamGNBMW36/Zh46eRQlYSQEMmvAKkS35shjV
	 ukXnRldow5JlcJwydSOgtLZfkEX2Mp8Yx2XX5dKfqs8wwRGTmNvwDjr6PPAp6UYAOO
	 RXgm0EFvuATqDP3WHHcRcRlWvP9/wNUKCp4vMR7lxDC1N1C5M6xuPxg/k0AdBbgUuo
	 Ic9RljOwmJs+Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9170D5C027A; Wed, 15 Jun 2022 14:12:20 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:12:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <20220615211220.GJ1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
 <202206151326.E34CDE453@keescook>
 <YqpCkAVTwpNn+6p9@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqpCkAVTwpNn+6p9@dev-arch.thelio-3990X>

On Wed, Jun 15, 2022 at 01:35:28PM -0700, Nathan Chancellor wrote:
> On Wed, Jun 15, 2022 at 01:28:00PM -0700, Kees Cook wrote:
> > On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> > > Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> > > Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> > > is the proper fix up. Would you mind applying it to the merge of
> > > whichever tree comes second if possible? I did build and boot test it
> > > but it would not be a bad idea for Sami and Frederic to verify that it
> > > is correct so that Kees/Paul can mention it to Linus :)
> > 
> > Actually, the CFI fix (and a few others) are meant to be sent for
> > -rc3, so if the ct_irq_enter() change is in -next, this can maybe get
> > sorted out?
> 
> Ah, I had assumed that branch was destined for the next release. If it
> is for 5.19 and they make -rc3 then it should be trivial for Paul to
> either rebase the changes on -rc3 and apply that diff as part of
> "context_tracking: Take IRQ eqs entrypoints over RCU" (if his tree is
> mutable) or just merge -rc3 and apply that diff as part of the merge. I
> don't really care how it gets resolved, just so long as it does :)

My tree will remain mutable for a few more weeks, so we should be
good.  ;-)

							Thanx, Paul
