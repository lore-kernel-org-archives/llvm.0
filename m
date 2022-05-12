Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B93232
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 13:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8FAC385B8;
	Thu, 12 May 2022 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652362578;
	bh=vtNyACv1GDds57wk0/3xK+KFuOW2R4mH4WQUTyTX3os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNgeKpSYwdR77+nHeQ9LpSy5EY8F43n4EIp/8pLqhiJcJWrovNweOB/YK9olf8nYV
	 EoVDawe+xf+ZiCjSoQ4f94P52z51DUexp2Hj/kLGpq/0U7OYBz6FFYB7+YVkEOlhKx
	 GAwLr5HMbVm/yri4wzYFlF4OwWly9sGb9Tc13XxU=
Date: Thu, 12 May 2022 15:36:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: Warning fixes for clang + x86_64 allmodconfig on 5.10 and 5.4
Message-ID: <Yn0NUKoWB2V87R4G@kroah.com>
References: <YnqlnFWCrEz11T5Y@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnqlnFWCrEz11T5Y@dev-arch.thelio-3990X>

On Tue, May 10, 2022 at 10:49:16AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> A recent change in LLVM [1] strengthened -Wenum-conversion, which
> revealed a couple of instances in 5.10 and 5.4 (the oldest release that
> I personally build test). They are fixed with the following changes,
> please consider applying them wherever they apply cleanly (I have
> included the release they first appeared in):
> 
> 1f1e87b4dc45 ("block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit") [5.13]
> 353f7f3a9dd5 ("drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types") [5.14]
> 
> Since I am here already, please consider applying the following
> additional changes where they cleanly apply, as they resolve other
> warnings present in x86_64 allmodconfig with clang:
> 
> 7bf03e7504e4 ("drm/i915: Cast remain to unsigned long in eb_relocate_vma") [5.8]
> 8a64ef042eab ("nfp: bpf: silence bitwise vs. logical OR warning") [5.15]
> 
> If there are any problems or questions, please let me know!
> 
> [1]: https://github.com/llvm/llvm-project/commit/882915df61e33f3a2b7f58e52f572717e1c11499

All now queued up, thanks.

greg k-h
