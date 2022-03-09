Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034A17C0
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 09:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3F5C340EC;
	Wed,  9 Mar 2022 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646819212;
	bh=geLRBWENKCwJOCIWvAmJoYArFJeDkSTw01PcBkGt78A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCsOT45PImRoFDvI7+Dso/Dn9H+15bU3hJBCg7O5903v+/zUlMIJjemMf+ogpArqZ
	 vuDXmI9qEzTnjwQC/xpY326mzpNusS/abbc3GweBvhaPgvqn1ln0zXmpW+homSThWK
	 TSwgU7gwfhL02gfEoZdueVY9wOMMxtT6hfyBDuZw=
Date: Wed, 9 Mar 2022 10:46:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Sasha Levin <sashal@kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
	Manoj Gupta <manojgupta@google.com>,
	Denis Nikitin <denik@google.com>, Will Deacon <will@kernel.org>,
	llvm@lists.linux.dev,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: arm64 memcpy+memove 5.10 patch
Message-ID: <Yih3hvLi+JUytgps@kroah.com>
References: <CAKwvOd=iOS3HEUH1w-R4vYSNMwAzE7kr30FcXNZg0e1WBvpenQ@mail.gmail.com>
 <7341895d-0c69-5a84-6dfe-f228a05df03b@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7341895d-0c69-5a84-6dfe-f228a05df03b@arm.com>

On Tue, Mar 08, 2022 at 11:11:38PM +0000, Robin Murphy wrote:
> On 2022-03-08 22:38, Nick Desaulniers wrote:
> > Dear stable kernel maintainers,
> > Please consider cherry-picking
> > 
> > commit 6c23d54f4cb8 ("arm64: Import latest memcpy()/memmove() implementation")
> > 
> > to v5.10.y.  It first landed in v5.14-rc1.
> > 
> > It fixes a linkage failure observed when building kernels for ChromeOS
> > under AutoFDO:
> > 
> > ld.lld: error: arch/arm64/lib/lib.a(memmove.o):(function __memmove:
> > .text+0x8): relocation R_AARCH64_CONDBR19 out of range: -6331272 is
> > not in [-1048576, 1048575]; references __memcpy
> > > > > defined in arch/arm64/lib/lib.a(memcpy.o)
> > 
> > (The prior version of memmove used assembler conditional branches to
> > memcpy; under AutoFDO the linker will decide where best to place
> > memmove; it may be > 1MB away from memcpy. After this patch, memcpy
> > and memmove are the same function).
> 
> Just beware that the new implementation turned out to be really good at
> finding places where __iomem pointers are erroneously being passed to
> memcpy(), by more readily triggering alignment faults, so there is a
> non-zero possibility of functional regressions if any of those places are
> still present in 5.10.y (particularly any which had "naturally" disappeared
> before 5.14). At least one of them still isn't fixed in mainline, but that
> one's so obscure I wouldn't consider it a major concern by itself.

Yeah, because of this, I'm a bit nervous to add this change to the
stable tree.  ChromeOS can keep it in their tree as they "know" they
have properly audited all of their drivers to get this right and they
can own the fallout if they didn't :)

thanks,

greg k-h
