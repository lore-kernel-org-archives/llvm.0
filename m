Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39115B5
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 13:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5928C433EF;
	Mon,  8 May 2023 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683553537;
	bh=Qu9Rl94bP0g+nhL6tXXSt0OxbS7NzYjh13hkmP95BH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQBCyttRFuLCiwy/rIAkzhHqSCqIsv/5tdR8PgqEDLUffIbFMAafyCFsfAAJwW4wI
	 0j6ABrQKivthcpQQqN9YA52XZZp0lGZJe8xp7wf1otHPkpqj0XYFa2eLO3LrDAMPxc
	 644fbgz6xoNmi9geJROfFORL9+v7Y8wlqN81E/Ovp/ud3z4D20xWv55XHJfDzpQSxT
	 /PA7ImPXgtyueHtO8IqFumjXrwzNLKtJ6gD6xqqlIg9igrsRVcnKS2jkhCFWxTyRn6
	 u5iHdu2h43+GCkkdhA3frL73Xzq3w7mtuPSPgEVkTSo4s0BxxepDfycyv6ohuTF4lX
	 vRkxiqD7rmLTg==
Date: Mon, 8 May 2023 15:45:33 +0200
From: Simon Horman <horms@kernel.org>
To: Md Danish Anwar <a0501179@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] soc: ti: pruss: Avoid cast to incompatible function type
Message-ID: <ZFj8/TW1bMuqY1WP@kernel.org>
References: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
 <f6c92e55-93f5-e5c6-e5ca-4c24fd59f245@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c92e55-93f5-e5c6-e5ca-4c24fd59f245@ti.com>

On Thu, Apr 20, 2023 at 11:19:59AM +0530, Md Danish Anwar wrote:
> On 18/04/23 17:11, Simon Horman wrote:

...

> > Rather than casting clk_unregister_mux to an incompatible function
> > type provide a trivial wrapper with the correct signature for the
> > use-case.
> > 
> > Reported by clang-16 with W=1:
> > 
> >  drivers/soc/ti/pruss.c:158:38: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> >          ret = devm_add_action_or_reset(dev, (void(*)(void *))clk_unregister_mux,
> > 
> > No functional change intended.
> > Compile tested only.
> > 
> > Signed-off-by: Simon Horman <horms@kernel.org>
> 
> Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

Hi,

I'm wondering what the path of this patch to Linus's tree might be.
Perhaps naively, I expected it to show up in v6.4-rc1.
