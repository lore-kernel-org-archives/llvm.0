Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096020C94
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 15:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD68C433C8;
	Thu, 10 Aug 2023 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691682513;
	bh=RdEDvfu2DiPqEjcOg91dWMNIZorUuPahJrnUeCkzJNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oibX/N3es3HiIhAY/3QOJ7lhN7NzL62K36UDl5h5UjBjDMQFlDHwAc0+8PNXgPSPv
	 lIJzGrMvrq5zyCYs4ruV1U2nTe+5RFAscwEIf192NfAhwVsCUywfYiaRqMg9fgygR3
	 K331u72wGqwHvNS/X+kMELAuJHVVzHh0UO/1qH9KEWcayoOSA7KLuICFA9j81D7ZS7
	 mvb1I8+Hwd/sDusKnqCgMhsUrt7gHZ3033HYNNO9/t/zZbHK3U+zY0QXhRa9s5oeiA
	 6eeQnrAac3EGHbkFknbYc1Jw4AOVNswVrvQbcN+b793pz60r8gbvIbOjChUYdf3vpM
	 ae/f70gGZTtpg==
Date: Thu, 10 Aug 2023 08:48:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810154831.GA38495@dev-arch.thelio-3990X>
References: <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
 <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
 <20230810101649.GA1795474@dev-arch.thelio-3990X>
 <20230810125122.GIZNTdSuFvA3Cjfexq@fat_crate.local>
 <20230810132706.GA3805855@dev-arch.thelio-3990X>
 <20230810133216.GKZNTm4KpohRR4gVsT@fat_crate.local>
 <20230810134056.GA130730@dev-arch.thelio-3990X>
 <20230810144344.GLZNT3oM6MLVdzGlyd@fat_crate.local>
 <20230810150706.GA42856@dev-arch.thelio-3990X>
 <20230810151410.GNZNT+wn/cLBWiU6dO@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810151410.GNZNT+wn/cLBWiU6dO@fat_crate.local>

On Thu, Aug 10, 2023 at 05:14:10PM +0200, Borislav Petkov wrote:
> On Thu, Aug 10, 2023 at 08:07:06AM -0700, Nathan Chancellor wrote:
> >   [    2.408527] microcode: microcode updated early to new patch_level=0x0830107a
> 
> Hm, a wild guess: can you boot the *host* with "dis_ucode_ldr" on the
> kernel cmdline and see if it still reproduces?

It does.

> Also, can you bisect rc5..master to see which exact patch is causing
> this?

Sure thing. I at least isolated it to the SRSO merge, so I will just
bisect that to see the exact commit that causes this.

Cheers,
Nathan
