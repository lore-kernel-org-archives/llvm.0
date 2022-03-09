Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB55387
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0BAC340E8;
	Wed,  9 Mar 2022 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646865812;
	bh=90MADAHWD4RdnAC9CmQ8CKy9LrXPfYhbKOYB3qZZO9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEFbwnzcusfiFaP4eVIp4WnzvLzsLES9dXM/AnTTe65HVgfb5/Uj+vLJFjRAP/6At
	 dR4HeSS/fogFBvrvPgafZ2Ak8YYROtkabQ5o8ELHPUG93fGd3Y4IiVVrx8Se6aOI77
	 lLMQ3YXtN0VUyi6yqbqKzkZoMm6u24YQmznYnOBKO1kZeLX6qS4p5JusSsQ/ofkzxW
	 x9IGHNfXeIaaBCswwIa1OF7BTidgf2+boJvcvONmnzNpCXOTZGerosRmfdVxtZdICw
	 LOD7RTYIXwCVM5dO4bgkljlwm862PaTrq+zTR0eCxf5cYDeGi3fBX/d57TePO2y6yW
	 8/ixFPHft7FXA==
Date: Wed, 9 Mar 2022 15:43:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Patch "ARM: Do not use NOCROSSREFS directive with ld.lld" has
 been added to the 4.19-stable tree
Message-ID: <YiktjbXe/2XmjHrb@dev-arch.thelio-3990X>
References: <1646865178129106@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646865178129106@kroah.com>

Hi Greg,

On Wed, Mar 09, 2022 at 11:32:58PM +0100, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     ARM: Do not use NOCROSSREFS directive with ld.lld
> 
> to the 4.19-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

<snip>

> +/*
> + * ld.lld does not support NOCROSSREFS:
> + * https://github.com/ClangBuiltLinux/linux/issues/1609
> + */
> +#ifdef CONFIG_LD_IS_LLD

Please cherry-pick commit b744b43f79cc ("kbuild: add CONFIG_LD_IS_LLD")
to 4.19 so that this patch works as intended.

We do not link with ld.lld on 4.9 or 4.14 so the NOCROSSREFS patch is
not technically needed there but it does no harm if it is.

Cheers,
Nathan
