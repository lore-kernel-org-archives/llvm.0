Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A2AFE6
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 18:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB90C4339B;
	Tue, 18 Apr 2023 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681843497;
	bh=VTJaQ+xSNEjvC73iIJnvJAGbN1KdAIOE9HBhu+8VB7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwinOfDo013AYR1eTqfKRbf8QgIMvXjWV1uDAsJK/6//hApF3lFOjUP0j95Ovb+k+
	 KIYph9qZmZLqfiV4GQgCD9C1MWQz7KVPVpt8bxaXsPkMZXFnAQI/a6tKpZCEvjlKKd
	 t5V0J/ED7u16H24IxG7q7+Nd0tOlG1+4kbLipuquPawMQqDAVmB1T3Ty7WYRwHARkG
	 7Gn39ingpfNH3D5FvVevL23BxGJKeJcOhJxGEoKz9cFwYHcdtLKFyHQL0gQ1Rk8W9P
	 CjJEqODbuj2wUXGPUhkmqkU724mW8kkrL7vBPDFDc7PzNe7yNRlR/MAI76ljvJDr2I
	 Di1fvwMgo9NnA==
Date: Tue, 18 Apr 2023 11:44:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] soc: ti: pruss: Avoid cast to incompatible function type
Message-ID: <20230418184455.GC2635379@dev-arch.thelio-3990X>
References: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418-pruss-clk-cb-v1-1-549a7e7febe4@kernel.org>

On Tue, Apr 18, 2023 at 01:41:48PM +0200, Simon Horman wrote:
> Rather than casting clk_unregister_mux to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
> 
> Reported by clang-16 with W=1:
> 
>  drivers/soc/ti/pruss.c:158:38: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action_or_reset(dev, (void(*)(void *))clk_unregister_mux,
> 
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/soc/ti/pruss.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
> index 6882c86b3ce5..e68441bd7b30 100644
> --- a/drivers/soc/ti/pruss.c
> +++ b/drivers/soc/ti/pruss.c
> @@ -38,6 +38,11 @@ static void pruss_of_free_clk_provider(void *data)
>  	of_node_put(clk_mux_np);
>  }
>  
> +static void pruss_clk_unregister_mux(void *data)
> +{
> +	clk_unregister_mux(data);
> +}
> +
>  static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
>  			       char *mux_name, struct device_node *clks_np)
>  {
> @@ -93,8 +98,7 @@ static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
>  		goto put_clk_mux_np;
>  	}
>  
> -	ret = devm_add_action_or_reset(dev, (void(*)(void *))clk_unregister_mux,
> -				       clk_mux);
> +	ret = devm_add_action_or_reset(dev, pruss_clk_unregister_mux, clk_mux);
>  	if (ret) {
>  		dev_err(dev, "failed to add clkmux unregister action %d", ret);
>  		goto put_clk_mux_np;
> 
