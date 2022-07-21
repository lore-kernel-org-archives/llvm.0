Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB86AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 22:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8B2C3411E;
	Thu, 21 Jul 2022 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658441111;
	bh=LvcuNeaTxV66PvKnmvNrKgBUF+QpgGrAAwxXDjh8JUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3DUY5QpK02B5dyP6VKhqCfc4Wprfy7PsekVgbT+uZHlTLs7zs2uMX6j8SYxYODmf
	 fd6/BKLrQdUINwXFcRl5s4Zc5awICjOyBDCn8xtSE83tx8ms0DAoiZDDrdU0k2+ntX
	 wcCHAnGpX38gTRGrucevYNxUma2oOdca5cxEY986qgQoGxHVHupu+eckJr1PAHFDGT
	 6a+TU9pgq6r/ynPe4h6HRluk5hQZf5BODrkCMnmXeRdvFXq6QTk9HLti5o5sFV9ANb
	 GECQuhBZSwiVzeYGml/KmNhatDX1s8UZEfsdwZlWNrOo24NAaY4tUOVYNl8vhgKmyk
	 FkP9JmivuHAWQ==
Date: Thu, 21 Jul 2022 15:05:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: ndesaulniers@google.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	keescook@chromium.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, trix@redhat.com
Subject: Re: [PATCH v2] drivers: lkdtm: fix clang -Wformat warning
Message-ID: <YtnNlZYZCEVUiuaE@dev-arch.thelio-3990X>
References: <CAKwvOd=wn=tbX7ixs9a=4zoVSbAU1qP-6NE04hGG9dzvo0zFJw@mail.gmail.com>
 <20220721215706.4153027-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721215706.4153027-1-justinstitt@google.com>

On Thu, Jul 21, 2022 at 02:57:06PM -0700, Justin Stitt wrote:
> When building with Clang we encounter the following warning
> (ARCH=hexagon + CONFIG_FRAME_WARN=0):
> | ../drivers/misc/lkdtm/bugs.c:107:3: error: format specifies type
> | 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
> |                 REC_STACK_SIZE, recur_count);
> |                 ^~~~~~~~~~~~~~
> 
> Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`
> as well as maintain symmetry with `#define REC_STACK_SIZE
> (_AC(CONFIG_FRAME_WARN, UL) / 2)`.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>

Personally, I would drop this; my suggestion was the cast, which we are
not going with anymore. Not worth a v3 unless there are other changes
requested.

> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
> 
> changes from v1 -> v2:
> * Use implicit division conversion with `/ nUL` instead of verbose
> `(unsigned long)` ~ Thanks Nick
> 
>  drivers/misc/lkdtm/bugs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 009239ad1d8a..48821f4c2b21 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -29,7 +29,7 @@ struct lkdtm_list {
>  #if defined(CONFIG_FRAME_WARN) && (CONFIG_FRAME_WARN > 0)
>  #define REC_STACK_SIZE (_AC(CONFIG_FRAME_WARN, UL) / 2)
>  #else
> -#define REC_STACK_SIZE (THREAD_SIZE / 8)
> +#define REC_STACK_SIZE (THREAD_SIZE / 8UL)
>  #endif
>  #define REC_NUM_DEFAULT ((THREAD_SIZE / REC_STACK_SIZE) * 2)
>  
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 
> 
