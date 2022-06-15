Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B262CA7
	for <llvm@lists.linux.dev>; Wed, 15 Jun 2022 20:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB528C3411A;
	Wed, 15 Jun 2022 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655325331;
	bh=xL3iRBMb0QwwFJnaKQCkBT5757ICTMbyClIDX5a/oko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atA2+jvX/Jftx7vrJ/RGVSj0e6RnEXoaWrD3iWmWva1XdR4n6Nq1jtvXhVe5ThF9i
	 tgfsMb+pTFAkoSzRIKSZSncni477eTTbe9NHb+BIkmqh4uGPOomuX8GZLwU1Xo+G43
	 tBnJnd3QzabTZSNEJFR68DelHR6DeyPjxPOJ0ymgNfE4T+DZ9b66F4G5u8bspmYMXh
	 LrCdUfJ8AkBqp3JZTlaGU1YaJIp7jCO9AZqlj/akVXnrIC4IaD6NakQJiTrGVd/E1N
	 sr8/LKwoDkqrXIHkrkggYtsw51Pt/jEnVgs3FrvJ1/etwcDYSyPXaUVRRivdNmve1K
	 VY5Om/NP+1lSQ==
Date: Wed, 15 Jun 2022 13:35:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <YqpCkAVTwpNn+6p9@dev-arch.thelio-3990X>
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
 <202206151326.E34CDE453@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206151326.E34CDE453@keescook>

On Wed, Jun 15, 2022 at 01:28:00PM -0700, Kees Cook wrote:
> On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> > Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> > Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> > is the proper fix up. Would you mind applying it to the merge of
> > whichever tree comes second if possible? I did build and boot test it
> > but it would not be a bad idea for Sami and Frederic to verify that it
> > is correct so that Kees/Paul can mention it to Linus :)
> 
> Actually, the CFI fix (and a few others) are meant to be sent for
> -rc3, so if the ct_irq_enter() change is in -next, this can maybe get
> sorted out?

Ah, I had assumed that branch was destined for the next release. If it
is for 5.19 and they make -rc3 then it should be trivial for Paul to
either rebase the changes on -rc3 and apply that diff as part of
"context_tracking: Take IRQ eqs entrypoints over RCU" (if his tree is
mutable) or just merge -rc3 and apply that diff as part of the merge. I
don't really care how it gets resolved, just so long as it does :)

Cheers,
Nathan
