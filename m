Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20763B4
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 10:21:51 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4RRxpJ6GBQzMq6Lp;
	Fri, 18 Aug 2023 09:46:16 +0000 (UTC)
Received: from unknown by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4RRxpH1Xz5zMpnPk;
	Fri, 18 Aug 2023 11:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1692351976;
	bh=VX0u3iEdidR+CiLRoGDyOiMFbwAq0F/xGLYbnfjrIes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLQpvPkA9tTwXJWH9zWADo/gTYLHQ6/Cb1aCxfxYLw7I+U9flEtIBz2pxwsfSj28C
	 QtIflE5IN6exXf4PE86EaQs8vjD7O6g2T1/Hpl7g/3lZrUGVXOvM6mnput/hedK7O4
	 KmQArjOVk4dr66kc5ucqj+cmTrqFsa1th2Yxsaec=
Date: Fri, 18 Aug 2023 11:46:10 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Kees Cook <keescook@chromium.org>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] landlock: Annotate struct landlock_rule with __counted_by
Message-ID: <20230818.Iuwi4Okaey0A@digikod.net>
References: <20230817210257.never.920-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230817210257.never.920-kees@kernel.org>
X-Infomaniak-Routing: alpha

Thanks! Applied to my next tree. Feel free to carry it yourself if you
prefer.

On Thu, Aug 17, 2023 at 02:03:01PM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct landlock_rule.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: "Mickaël Salaün" <mic@digikod.net>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  security/landlock/ruleset.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
> index d43231b783e4..55b1df8f66a8 100644
> --- a/security/landlock/ruleset.h
> +++ b/security/landlock/ruleset.h
> @@ -67,7 +67,7 @@ struct landlock_rule {
>  	 * @layers: Stack of layers, from the latest to the newest, implemented
>  	 * as a flexible array member (FAM).
>  	 */
> -	struct landlock_layer layers[];
> +	struct landlock_layer layers[] __counted_by(num_layers);
>  };
>  
>  /**
> -- 
> 2.34.1
> 
