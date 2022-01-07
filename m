Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430C168
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 00:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48A0C36AE0;
	Fri,  7 Jan 2022 00:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641515397;
	bh=M3mrcT+U5cdZQDBW8NCmphpUOXO8xVPjUm5lYYznGwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux3csKe+KPRbeb7ePa8llBLIiCdHhj3h6PmMNe5t5m8AAHVHmquJAbqdBQO4GMQJc
	 mR/+4i0+T3kmT6rqaGSEUM/QZzj0QCE09+XdiGJxO+wW6FaDhzg1rqUCM+s0hKVxOy
	 LMG3gbdrrop+cA6oS+UFr6b4XAlG65O06Q5kXymuaOKyQkKJVlikbZIBCcLd0XHBs0
	 SG3IIIZPtREjqsoxlg9kqDaC2RE1rCnIm6An0tO0bsJ4Zh9Q0nfeWEgwk0sGl4okct
	 45ZCYjCKSsxuwNepPG0SfgYC8Ni8JRzi4Y7hA2F0jBrQswYG4saFHgOXsJtn8FeVRY
	 cL0F2xnbixo4w==
Date: Thu, 6 Jan 2022 17:29:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <YdeJgJFRRsIb9pah@archlinux-ax161>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdQlwnDs2N9a5Reh@gmail.com>

On Tue, Jan 04, 2022 at 11:47:30AM +0100, Ingo Molnar wrote:
> > > With the fast-headers kernel that's down to ~36,000 lines of code, 
> > > almost a factor of 3 reduction:
> > > 
> > >   # fast-headers-v1:
> > >   kepler:~/mingo.tip.git> wc -l kernel/pid.i
> > >   35941 kernel/pid.i
> > 
> > Coming from someone who often has to reduce a preprocessed kernel source 
> > file with creduce/cvise to report compiler bugs, this will be a very 
> > welcomed change, as those tools will have to do less work, and I can get 
> > my reports done faster.
> 
> That's nice, didn't think of that side effect.
> 
> Could you perhaps measure this too, to see how much of a benefit it is?

As it turns out, I got an opportunity to measure this sooner rather than
later [1]. Using cvise [2] with an identical set of toolchains and
interestingness test [3], reducing net/core/skbuff.c took significantly
less time with the version from the fast-headers tree.

v5.16-rc8:

$ wc -l skbuff.i
105135 skbuff.i

$ time cvise test.fish skbuff.i
...
________________________________________________________
Executed in  114.02 mins    fish           external
   usr time  1180.43 mins   69.29 millis  1180.43 mins
   sys time  229.80 mins  248.11 millis  229.79 mins

fast-headers:

$ wc -l skbuff.i
78765 skbuff.i

$ time cvise test.fish skbuff.i
...
________________________________________________________
Executed in   47.38 mins    fish           external
   usr time  620.17 mins   32.78 millis  620.17 mins
   sys time  123.70 mins  122.38 millis  123.70 mins

I was not expecting that much of a difference but it somewhat makes
sense, as the tool spends less time eliminated unused code and the
compiler invocations will be incrementally quicker as the input becomes
smaller.

[1]: https://github.com/ClangBuiltLinux/linux/issues/1563
[2]: https://github.com/marxin/cvise
[3]: https://github.com/nathanchance/creduce-files/tree/61056fd763ae3bfb53ff0ae4c1d95550c7c0a5b7/cbl-1563

Cheers,
Nathan
