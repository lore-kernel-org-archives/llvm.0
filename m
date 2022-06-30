Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C847B
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 11:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55D8C3411E;
	Thu, 30 Jun 2022 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656588395;
	bh=4LR3kERKhBJjCuTNAMyf6YQeWDoIch6xgumEFksPYH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7o4G9sdMZ6wAp6oh8xbjht/LrVMqik+CNAHNM4uIxPxS+dw7KHnWpplt0UqDWnjz
	 o/uRMAMFfAGfY2VqwN3lZBeXB5NNibvKSGqDgIAyGZdtxp/Q9tZaokN4UDhCbMI53Z
	 1HHgS5X+EcXZ2bUgYgOnaeZ9X+txal+4BgJ7JIZc=
Date: Thu, 30 Jun 2022 13:26:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Apply 1e70212e031528918066a631c9fdccda93a1ffaa to 5.18
Message-ID: <Yr2IaHyNrpwnkTgo@kroah.com>
References: <Yrnvm6mwtaiKu6Rj@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yrnvm6mwtaiKu6Rj@dev-arch.thelio-3990X>

On Mon, Jun 27, 2022 at 10:57:47AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please apply commit 1e70212e0315 ("hinic: Replace memcpy() with direct
> assignment") to 5.18. It fixes a warning visible when building arm64 and
> x86_64 allmodconfig with clang 14 and newer (and possibly other
> architectures but I didn't check). This will allow CONFIG_WERROR to
> remain enabled when building arm64 and x86_64 kernels with clang on 5.15
> and 5.18 (other architectures and newer versions are getting there).
> 
> This change shouldn't be problematic in older kernels but the warning it
> fixes won't be visible without the new FORTIFY_SOURCE changes that
> landed in 5.18, so I wouldn't worry about backporting it further.

Now queued up, thanks.

greg k-h
