Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648B443D;
	Wed, 16 Aug 2023 08:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721E8C433CA;
	Wed, 16 Aug 2023 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692174425;
	bh=/NwmrTbylnu4L2dUN7IAYjB8B65NFoALZ+lzOZthkSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyTC1D3lQqUOQZ4XiWP7Iu8HKl3vz95meL5fMuPHOTSoNY/YPfNDIeMGy31vEaqel
	 4KEdtD3lMCYhAanBb1VVr1qQQiMDFFyCAOVLBZ5/nITRCBoTqGTcagWWm8Y0xamzGT
	 aUhS65LUy1G2ipnvqukPMv3KAK0G8kxOsgSzsKBRE5Q8fUEKbTbZCvnn+yIq9bQFm9
	 jfWV1dB/6A3PVUxYSrhuBNH+En9YR79z/t/JDqdPCUnWSeO1XtvuSDTXv0GcjNGrsZ
	 PYR/uZEf+Z+D4AriwPoaa2v/TTcnOEXJUP8kt+XJDa/DqMH7dQIakPSbkwHbbQ3G/r
	 D/70SEbglZxlw==
Date: Wed, 16 Aug 2023 10:27:01 +0200
From: Simon Horman <horms@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] net: nixge: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <ZNyIVQABsgj96DiK@vergenet.net>
References: <20230815-void-drivers-net-ethernet-ni-nixge-v1-1-f096a6e43038@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815-void-drivers-net-ethernet-ni-nixge-v1-1-f096a6e43038@google.com>

On Tue, Aug 15, 2023 at 08:50:13PM +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/net/ethernet/ni/nixge.c:1273:12: warning: cast to smaller integer
> |               type 'enum nixge_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |        1273 |         version = (enum nixge_version)of_id->data;
> 
> This is due to the fact that `of_id->data` is a void* while `enum nixge_version`
> has the size of an int. This leads to truncation and possible data loss.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: There is likely no data loss occurring here since `enum nixge_version`
> has only a few fields which aren't nearly large enough to cause data
> loss. However, this patch still works towards the goal of enabling this
> warning for more builds by reducing noise.

This information might be better placed in the patch description,
above the scissors (---) and tags ("Link:", ...)

And, although I did make an error in this area myself as recently as
yesterday, this patch should probably be tagged as being for net-next.
It's probably not necessary to repost for this.

	Subject: [PATCH net-next] ...

The above notwithstanding,

Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Simon Horman <horms@kernel.org> # build-tested
