Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F07848C
	for <llvm@lists.linux.dev>; Sun, 16 Jul 2023 15:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53800C433C7;
	Sun, 16 Jul 2023 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689519763;
	bh=551OXyr2rqcyU5MBzPSxaOa63D2qp1Y/FSwgipWiEEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZsFyY4y9NGTwGx5VWG8rmeeJaJVNsupEkOIabBVquVs/TBstbicDwcqXyX6iC7f1
	 Ep1MIPMTL805N7EHToEkpnRkWm8QErm9TQSonuMIgwwq+wdQN6+qowNvmKCCrLwpfK
	 JhPiumJPC+Ronsh4eDxX1fpkf4w2jiR8MPZN03OY=
Date: Sun, 16 Jul 2023 17:02:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Apply clang '--target=' KBUILD_CPPFLAGS shuffle to linux-6.4.y
 and linux-6.3.y
Message-ID: <2023071606-relative-facsimile-f994@gregkh>
References: <20230703150339.GA1975402@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703150339.GA1975402@dev-arch.thelio-3990X>

On Mon, Jul 03, 2023 at 08:03:39AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please consider applying the following patches to 6.4 and 6.3, they
> should apply cleanly.
> 
> 08f6554ff90e ("mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation")
> a7e5eb53bf9b ("powerpc/vdso: Include CLANG_FLAGS explicitly in ldflags-y")
> cff6e7f50bd3 ("kbuild: Add CLANG_FLAGS to as-instr")
> 43fc0a99906e ("kbuild: Add KBUILD_CPPFLAGS to as-option invocation")
> feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> 
> They resolve and help avoid build breakage with tip of tree clang, which
> has become a little stricter in the flags that it will accept for a
> particular target, which requires '--target=' to be passed along to all
> invocations of $(CC). Our continuous integration does not currently show
> any breakage with 6.1 and earlier; should these patches be needed there,
> I will send them at a later time.

6.3.y is now end-of-life, but I've queued these up for 6.4.y, thanks.

greg k-h
