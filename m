Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF394168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 18:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA899C36AE3;
	Thu,  6 Jan 2022 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641492372;
	bh=Q1VfLicFP8zpOZc0x3UyDr93GZKO9l78W7b0XMKymJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZozYHmcGrQwTAWDnq0B8CQhCLFYgdazLC/CH0WbdXO80wl4M0o7VJh6L6wEElIp5q
	 TwxwKP3/Z488gLIDjeKuGkM8G4NvKG9RHmNCh6rndiiK9sxc/Sn3g6yQQnHHha/T+i
	 sEOCq6cG+iKBg4UALcsv8ejAzcWHNLrpQ6IhvsXEB8PYtcfrjykfr3R52RLmKQKlTD
	 Tb38SxzciLGVulZWChbfgfbAlHm6WEXp+LH7okRUd1RAKoNA/tIWqvjhT6/9zwtRCF
	 t0lqe5Cw8z1zQQouycwaSv5C/qFNVCQ5tf52xizgndGMuYiKEXRx+Nb4leGMOka6GR
	 rXHpYr4tMdX4g==
Date: Thu, 6 Jan 2022 11:06:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev, arnd@linaro.org
Subject: Re: [TCWG CI] Regression caused by linux: mm: simplify try_to_unuse
Message-ID: <YdcvkPTWAklekKJd@archlinux-ax161>
References: <16541504.9774.1641492012616@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16541504.9774.1641492012616@jenkins.jenkins>

On Thu, Jan 06, 2022 at 06:00:11PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by linux: mm: simplify try_to_unuse:
> commit a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b
> Author: Christoph Hellwig <hch@lst.de>
> 
>     mm: simplify try_to_unuse
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 553
> # First few build errors in logs:
> # 00:00:44 mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'
> # 00:00:44 make[1]: *** [mm/shmem.o] Error 1
> # 00:00:44 make: *** [mm] Error 2

Not a clang specific regression.

This was reported by Naresh Kamboju:

https://lore.kernel.org/r/CA+G9fYvXfD3wS8eJV6A6GygqhJb3AUF9OROQAkBRRTN+thVo-g@mail.gmail.com/

Matthew Wilcox suggested a fix up:

https://lore.kernel.org/r/YdXYHP5gPMRzmv0B@casper.infradead.org/

Andrew just needs to apply it.

Cheers,
Nathan
