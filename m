Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBB1E51F
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36606C433C8;
	Thu, 10 Aug 2023 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691662984;
	bh=0AUFiGR+5OFS3aCcZhGl1NOGXtJMosrbpUypmoX+TZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7WmiOzDPWLoCIx4m3FmL5Ymn5awlI0D51e3FZF6asXAmGual9jdBONbaHBvTBisY
	 iPf8Fg6crF4zewXaTnO2i+E07dY2SNchOnPtn5UppN9N1y/SMB7FYSM+KUdAh1WcZl
	 tztV9ipOzNxOjWHqVA6cnMN6ffCWpFOQwdCTc1OZdH63f7sqA4js8mXqrIAjyTb9zv
	 RRbhmcKsOmJxHgcTuqNEKBFv2LGX402oS/+24RUFBOdiTO2RuCxh0pxIAW7/IJ7phZ
	 FIU5BSYQaal3TMYkcb0D1slplvatJvEsT8ZdJInFMtkSZh/jEDBpv2WKg5hIT2XALu
	 y/0OD5QDrX0ag==
Date: Thu, 10 Aug 2023 03:23:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org, Dave Airlie <airlied@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>
Subject: Re: drivers/gpu/drm/nouveau/nouveau_exec.c:114:4: error: cannot jump
 from this indirect goto statement to one of its possible targets
Message-ID: <20230810102302.GA1795773@dev-arch.thelio-3990X>
References: <CA+G9fYtQGmwYHYf5suRMyCzQmKmQ1kx31gxGJ-7CT-NTLrxYoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtQGmwYHYf5suRMyCzQmKmQ1kx31gxGJ-7CT-NTLrxYoA@mail.gmail.com>

Hi Naresh,

On Thu, Aug 10, 2023 at 02:11:41PM +0530, Naresh Kamboju wrote:
> drivers/gpu/drm/nouveau/nouveau_exec.c:114:4: error: cannot jump from
> this indirect goto statement to one of its possible targets
>   114 |                         drm_exec_retry_on_contention(exec);
>       |                         ^
> include/drm/drm_exec.h:96:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
>    96 |                         goto *__drm_exec_retry_ptr;             \
>       |                         ^
> drivers/gpu/drm/nouveau/nouveau_exec.c:106:2: note: possible target of
> indirect goto statement
>   106 |         drm_exec_until_all_locked(exec) {
>       |         ^
> include/drm/drm_exec.h:79:33: note: expanded from macro
> 'drm_exec_until_all_locked'
>    79 |                 __label__ __drm_exec_retry;                     \
>       |                                                                 ^
> drivers/gpu/drm/nouveau/nouveau_exec.c:106:2: note: jump enters a
> statement expression
> include/drm/drm_exec.h:78:35: note: expanded from macro
> 'drm_exec_until_all_locked'
>    78 |         for (void *__drm_exec_retry_ptr; ({                     \
>       |                                          ^
> 1 error generated.

Thanks for the report. This is now fixed in drm-misc-next, so it should
be resolved in the next -next:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=616bceae250d0bab7ab2cbcb0791d820434ffb71

Cheers,
Nathan
