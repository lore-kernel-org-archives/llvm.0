Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC77B
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 15:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73396C385A4;
	Mon, 11 Apr 2022 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649690385;
	bh=hi9eum3OD1hBLstUFbV7sMEQ92y+ycNsvwEEwzUsSdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2BMESHQZoA0ERaHImdN72fU9rJPvWh1VRmM8PGLMYfv8p6hBuGQZCubUHTbQc6bI
	 FvIR66c97dkwQ+CbEZd1s5i3L4rlXYsX5n6kdtcdo/C2SQsDzCh6qni/fe8ru5ba4Y
	 7rJ+wpYRUGwe0hklkPC3E//B10MAMyNAghzN3a50=
Date: Mon, 11 Apr 2022 17:19:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Backport of 4013e26670c5 and 60210a3d86dc for 4.9 to 5.10
Message-ID: <YlRHDw1uW4vR9s8y@kroah.com>
References: <Ykytcg+xI/MRSLue@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykytcg+xI/MRSLue@dev-arch.thelio-3990X>

On Tue, Apr 05, 2022 at 01:58:26PM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please find attached backports for commits 4013e26670c5 ("arm64: module:
> remove (NOLOAD) from linker script") and 60210a3d86dc ("riscv module:
> remove (NOLOAD)") to 4.9 through 5.10, where applicable. They resolve a
> spew of warnings when linking modules with ld.lld. 4013e26670c5 is
> currently queued from 5.15 to 5.17 and 60210a3d86dc is queued for 5.10
> through 5.17, as that is where they applied cleanly.

If only everyone sent in patches in this style, it would make our lives
so much easier!

thanks for these, all now queued up.

greg k-h
