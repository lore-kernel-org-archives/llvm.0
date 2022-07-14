Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDED6002
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 17:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C3BC3411C;
	Thu, 14 Jul 2022 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657818166;
	bh=zwnKcS5Bq9DV989JOOlTT4TuFkyn45R2RqKIpAUa7ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bifir3sEhO7RgffNDxbwCmN/uXYdoM43g6XtEt+4qa1ncqRG2GFmhUiFyxJI9r82n
	 g51zwv92K+UgEPTI8Xhg99Z54cikSmsBGXNRCMjMQGwBgWWoLGjLhcCltb5drGFCTp
	 WS1FmFLFRPENOe5qihO/TdHU88ua71j/RS/HU7Mxm9w3vFowjbCviAkSA0sqS0z++i
	 8J5D2G7q9/wxkBQFYImXpkk/BWqxqzs2k0Ygf2rRYel4Wnvwfc+jgIeQho6DfscK8n
	 FvVvGCM6dYPS8eXoEAfvqqeddiYkdl3GDyvmEH9p+Q7+LjTIOOr9PIA2HaT5Buw+cS
	 HCU5rq9Dqe2wg==
Date: Thu, 14 Jul 2022 10:02:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: llvm@lists.linux.dev
Subject: Re: help with clang build for mips
Message-ID: <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>

Hi Sudip,

On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
> Hi All,
> 
> I am trying to build the kernel for mips architecture with clang. I
> see some of the configuration builds properly, but some of the configs
> fails with the error (fuloong2e_defconfig):
> 
> error: unknown target CPU 'loongson2e'
> note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
> mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
> mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
> 
> Another one fails with (jazz_defconfig):
> error: unknown target CPU 'r4600'
> 
> is there any way to build these configs which fails with "unknown
> target CPU". or they should be skipped for a clang build?

I suppose it comes down to how critical the '-march' value is to getting
a working kernel. In other words, can we ditch the current '-march'
values for something that is supported by both GCC and LLVM without
regressing GCC? I am not sure, that probably requires input from the
MIPS maintainers. This isn't the only road block though, there are
certain compiler options that are needed for the kernels to run due to
errata, which are not implemented in LLVM:

https://github.com/ClangBuiltLinux/linux/issues/1544

Unfortunately, I doubt there is much interest in that work, given MIPS
as an architecture isn't being developed anymore. Might be an
interesting hobbyist project though. It is probably best to just test
configurations that work and make sure that those do not regress. Others
are more than welcome to weigh in though!

Cheers,
Nathan
