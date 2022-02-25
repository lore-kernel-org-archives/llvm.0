Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AF62916
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 22:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D0C340E7;
	Fri, 25 Feb 2022 22:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645826892;
	bh=8p7WkXuGAypZbBNf4T87PSxeCyirSi+UTVXXW12vVOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gv0D6s3pQeR8kgih9xJOwkPz/IXt3SA4RHJWwfcBzul6s3CvcQxQcT21MHTzIBgsE
	 rid2yMfryrFqLMVwoxt2jBd6fXXpghzy8IVpfsuEtxXAIlb6b3RKKbVsGsXDBCyCS3
	 wsKuXAcIS0QQplx5/rADmquYj70UJHk+cgc2VTt7wihnJhDPUBa1bqXMdSjohcNb99
	 WbLduf8p2G58Dwf81dcAf83zyN+J66hr/9wqug08G2m8fGnlnrF/7EUibbsdhtO4q4
	 gZL0QjDYeY1UhEaB4xbueXioxDH6msnhMpHRvRx9+B6laJJ9KtVcUjZeduc1DDceN2
	 Jjl62N03qt/0A==
Date: Fri, 25 Feb 2022 15:08:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	ndesaulniers@google.com, samitolvanen@google.com,
	mark.rutland@arm.com, alyssa.milburn@intel.com, mbenes@suse.cz,
	rostedt@goodmis.org, mhiramat@kernel.org,
	alexei.starovoitov@gmail.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
Message-ID: <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org>
 <202202241627.EEF3D5D2@keescook>
 <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>

On Thu, Feb 24, 2022 at 05:46:59PM -0700, Nathan Chancellor wrote:
> On Thu, Feb 24, 2022 at 04:35:51PM -0800, Kees Cook wrote:
> > On Thu, Feb 24, 2022 at 03:51:43PM +0100, Peter Zijlstra wrote:
> > > Add Kconfig, Makefile and basic instruction support for x86 IBT.
> > > 
> > > XXX clang is not playing ball, probably lld being 'funny', I'm having
> > > problems with .plt entries appearing all over after linking.
> > 
> > I'll try to look into this; I know you've been chatting with Nathan
> > about it. Is there an open bug for it? (And any kind of reproducer
> > smaller than a 39 patch series we can show the linker folks?) :)
> 
> I should be able to create a reproducer with cvise and file a bug on
> GitHub around this tomorrow, I should have done it after Peter's
> comments on IRC.

https://github.com/ClangBuiltLinux/linux/issues/1606

Cheers,
Nathan
