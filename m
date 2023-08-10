Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C21E1D2
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 16:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA4AC433C7;
	Thu, 10 Aug 2023 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691684056;
	bh=6Go2WKLDy7qs3VXcLqunmrgEAcs368VHPXxDDUvIZdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNmJh8ejT0OJ1yT4jlibcttZCrelUwschOkdscxlbLOyujWYBDTGLucM7AZdeuLK8
	 mrT59CBhO8sI+7Ka/BbH8m3MOVh520b83y6U0j1kMzV2SN7DczFYKcwVGtx3a078dZ
	 5/C/x/DqgSPE8XajXC+JHDAQsr/kQl+/hL62Yf/Ueoea6LAyMzNJaJKMoQE3B51Vrk
	 HUlmZzrrdGxnKidb4sJ6Txxy7prj9ypD7cGZwMW1G0fYiMvFhI3XxskGTJqHsvC57W
	 dMCnu2YXyt7qxkpmPRFwmO/d11Dd5+f0mWDcUKVvq9MBd2G7l/2Y+oZ4+trcH8PXtu
	 23B/pkMoOQGlQ==
Date: Thu, 10 Aug 2023 09:14:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810161414.GA4000@dev-arch.thelio-3990X>
References: <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
 <20230810101649.GA1795474@dev-arch.thelio-3990X>
 <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>
 <20230810132706.GA3805855@dev-arch.thelio-3990X>
 <20230810133216.GKZNTm4KpohRR4gVsT@fat_crate.local>
 <20230810134056.GA130730@dev-arch.thelio-3990X>
 <20230810144344.GLZNT3oM6MLVdzGlyd@fat_crate.local>
 <20230810150706.GA42856@dev-arch.thelio-3990X>
 <20230810151410.GNZNT+wn/cLBWiU6dO@fat_crate.local>
 <20230810154831.GA38495@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810154831.GA38495@dev-arch.thelio-3990X>

On Thu, Aug 10, 2023 at 08:48:31AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 10, 2023 at 05:14:10PM +0200, Borislav Petkov wrote:
> > Also, can you bisect rc5..master to see which exact patch is causing
> > this?
> 
> Sure thing. I at least isolated it to the SRSO merge, so I will just
> bisect that to see the exact commit that causes this.

Heh, figured this would be the case:

# bad: [138bcddb86d8a4f842e4ed6f0585abc9b1a764ff] Merge tag 'x86_bugs_srso' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
# good: [14f9643dc90adea074a0ffb7a17d337eafc6a5cc] Merge tag 'wq-for-6.5-rc5-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq
git bisect start '138bcddb86d8a4f842e4ed6f0585abc9b1a764ff' '14f9643dc90adea074a0ffb7a17d337eafc6a5cc'
# bad: [233d6f68b98d480a7c42ebe78c38f79d44741ca9] x86/srso: Add IBPB
git bisect bad 233d6f68b98d480a7c42ebe78c38f79d44741ca9
# bad: [fb3bd914b3ec28f5fb697ac55c4846ac2d542855] x86/srso: Add a Speculative RAS Overflow mitigation
git bisect bad fb3bd914b3ec28f5fb697ac55c4846ac2d542855
# good: [0e52740ffd10c6c316837c6c128f460f1aaba1ea] x86/bugs: Increase the x86 bugs vector size to two u32s
git bisect good 0e52740ffd10c6c316837c6c128f460f1aaba1ea
# first bad commit: [fb3bd914b3ec28f5fb697ac55c4846ac2d542855] x86/srso: Add a Speculative RAS Overflow mitigation

Not sure how helpful that will be...

Cheers,
Nathan
