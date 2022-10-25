Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3ED7479
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 16:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06F1C433D6;
	Tue, 25 Oct 2022 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666716835;
	bh=VMRAOztB24Mp/+ZteCvqV2G4L17pOi8KALgB0BmelUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuCE5wCDONjcVqEtXPLmRMssXqn04+bgDo0EeF7KKoMmrMyJOko8RdMMDHfjrwdGX
	 SYirL3P7EwPBURLoI5KChGAfBRbf0gAldMAUtjpGHRdpUJ9+r5eer4zCH3zF23bSq7
	 bGeiURaq9CIMy2VUbcxPAsov5RS3Qc4Pi6vtuMYw0dt79f97M+2Z7CXM12/ErMv/FK
	 Ly3Y5KgoAD35AxH4a14ZAnXYIvkC6cWgFev8258STZQb22hd9xpDtcnrqao8314VFi
	 +vZjgKH9Ago+5yXntgYyhPIpnz/7A92lwKVBF+L+pMnmQ0+EZWMMarKQ85eiScnw2R
	 k1isVMiBjXq5Q==
Date: Tue, 25 Oct 2022 09:53:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"# 3.4.x" <stable@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Alexey Alexandrov <aalexand@google.com>,
	Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Subject: Re: backports of 32ef9e5054ec ("Makefile.debug: re-enable debug info
 for .S files")
Message-ID: <Y1gUoS73T4nycQwr@dev-arch.thelio-3990X>
References: <CAKwvOdneUW4e9==CABAk68uePCGNt7Sq6P-84tR41HRB23zFTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdneUW4e9==CABAk68uePCGNt7Sq6P-84tR41HRB23zFTA@mail.gmail.com>

On Mon, Oct 24, 2022 at 02:06:52PM -0700, Nick Desaulniers wrote:
> Dear stable kernel maintainers,
> Our production kernel team and ChromeOS kernel teams are reporting
> that they are unable to symbolize addresses of symbols defined in
> assembly sources due to a regression I caused with
>     commit a66049e2cf0e ("Kbuild: make DWARF version a choice")

I think you mean commit b8a9092330da ("Kbuild: do not emit debug info
for assembly with LLVM_IAS=1"), which is what you blamed in
32ef9e5054ec? a66049e2cf0e does not appear to have any affect on this
problem?

> I fixed this upstream with
>     commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files")
> but I think this is infeasible to backport through to 4.19.y.
> 
> Do the attached branch-specific variants look acceptable?

I think the stable specific versions should be okay. We should be able
to deal with any fallout that happens if there is any.

Acked-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
