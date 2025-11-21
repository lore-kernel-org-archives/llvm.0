Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4703026ED4E
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754404; cv=none; b=bowjDVozQ7/Xk3IDP6sS7+EZG42hd6o62CwX+io5C+R/qp8gTWjJkINkowy3lqMdnMuNI4kd4c5DZGex0WNkSf+78KXsYK+yx2GjLRbYev9N+eYTc0FUVN2v6bHZUAZMZ9rmGlKart2ltjVsEU/1Db+YSSyjg8ndJHUex4ww5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754404; c=relaxed/simple;
	bh=yUuMHZhtam+fWQpdtjevcS7n36pGZwwGi8DKaiYIIvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao9/5cXSXh9RvxvJL7qhijEmekGiwcVam3uHDJBN2qns8uXkwldl+CXa7R4sYfLOmbyxENoSpKCcoOyLhyn4tIsNDMR02SlGmEHyXnEm9cQW1fGMsrxic/mPs9ypu/EIWZhKTKknQdJMTkE4zINm1xzvi+P7wl6n70tszkn5clk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DxrMrBnY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DxrMrBnY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so350278066b.3
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763754400; x=1764359200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n1zfzwkLtLkmv960SYF4qIg8dCLJqHxMdIvlW/MVpE=;
        b=DxrMrBnYLCq0QmS7k61Q4L6d8oN4NC9h6ypMtSKM3Igr76U3cMzs0sHag9IcnjS4uV
         an3Bd56LZbZbuZ0sFQ+TfCoc6Pm5FUKMluqfm7cjByDLWgmHQhoKGGyJariyE9CWWDYo
         OLbafCysZ4drq5xvo2bsGamc17XCgXMgQ+x5U11sXJU6/xR2g1QWv4Upo3lqg1StYc3X
         Kuz+zuxGHW1K27z193urjvF/hEjt+34hvzLWpHtXFctROXJ6JJLBK88jdo38PxO87zzV
         Rn7++i+OxvdaBGr+DubuxmUIyzA5By0mnQvtbFlVVxgIDzUpQLEbDoNtH/FbqWcVRSbU
         VX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763754400; x=1764359200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3n1zfzwkLtLkmv960SYF4qIg8dCLJqHxMdIvlW/MVpE=;
        b=eAXYEjLPTQZbtDCqwCRGt2/PgXmxT/0LgnmVDrUFSgKyn1Sqilfjslsk6951NiQP5l
         k7mz2nZ/SUNasaobLF8sKt/uoWd5/eMO793io3PM6QVl/UZAMvUDMYKOJ0av6HUd94Dt
         SCDATfxte1Y5TQ8A6Rxiuaq/Ht/GF+sBiqLpMfJw5Jzr7iCRj6D9dt1eV6uNIFK5X81T
         hjpC+kEPeV2/sY4SfkrwVMwAq+Nyw783o4Py2yppXLBcSnTxdx2kKOrVd4hJpTQiNS7l
         /L7WuI6Q651tRCl6pEK5r61M/O1+XXDc/5UZZbM5V7N0UXFYqpo1RbiHwz+ziG9r9u7e
         6Vfw==
X-Forwarded-Encrypted: i=1; AJvYcCWVEm7sbsl7vN8jmQ6zw/1RStLtedQIeGEUvhpaWL+idg1wH8V2lK/lQgzz8pYVlCQ59Khv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9WqsLd0MUpgNF9a9PouhwupJYxxwiLKyygaIsfOnANo76Eely
	4RpkVqylTZrMzZSJ4qeAiD1yNY6/nwuBo9UJ1IApoWKBPNGW/ij7dE6SiAvaXEgK3zwtdOqPgDF
	LLl0DapikA+tr2/TymCAmQbPfv5BjcuTG7zNhi8E=
X-Gm-Gg: ASbGncuuUKqPqH7225Dm5zPgyQxtKH6/2yQ+Z9K6Ev+JrgeY1oy9NkvIXtu2xScc6lg
	xL3wf+p5PLNQu8UH/RIGWPGS3xY7GLuyO/pBf36bdMa0m71CwxPXmMI3QRo/2OF6jAQC2HNT5/V
	zKDHiClh9+zZhjTRlWo2VN6SV17BtDWOVZ0SEpG9Vbf3i0/k8UqMAIZtEEPjKjlDyy8PWLfoO6r
	iKh5rZ0H+cgCp9WF6f4lBBfC9atznQ0FfCsEBgApJLdx/HjJnNng+LV7CvGklDGPEamcpYjk/pB
	ryc=
X-Google-Smtp-Source: AGHT+IHyGNwFxSOsJVHNF9rBcAbH6iyf9ovr7WPCBabxzYOfhXb/7KvRkBvNpN6IUsxw4XRIqODC6kJJnpdcIfMRBbI=
X-Received: by 2002:a17:907:9449:b0:b73:8e7d:4fa3 with SMTP id
 a640c23a62f3a-b76717076dbmr362946666b.32.1763754400259; Fri, 21 Nov 2025
 11:46:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <20251121193957.1655580-2-morbo@google.com>
In-Reply-To: <20251121193957.1655580-2-morbo@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 21 Nov 2025 11:46:23 -0800
X-Gm-Features: AWmQ_bmeMC8hpTDqlITfeIZJQkkK-IBh1b3rq_uwnqwXHiE_zh-zaWgX9rzYzq4
Message-ID: <CAGG=3QXOTNaYJMNVB_6p4OF58=u5GFgZ05FAwOLRWGfuqLo_2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Jan Hendrik Farr <kernel@jfarr.cc>, Qing Zhao <qing.zhao@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 11:40=E2=80=AFAM Bill Wendling <morbo@google.com> w=
rote:
>
> Clang and GCC are expanding the '__counted_by' attribute to support
> pointers in structs. Clang has support for it since version 21. This
> requires defining a separate macro, '__counted_by_ptr', because, while
> the attribute has the same name for both a pointer and a flexible array
> member, minimal compiler versions need to catch up.
>
> The effect of this feature is the same as for __counted_by on flexible
> array members. It provides hardening the ability to perform run-time
> bounds checking on otherwise unknown-size pointers.
>
> Cc: Kees Cook <kees@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
> Cc: Uros Bizjak <ubizjak@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Jeff Xu <jeffxu@chromium.org>
> Cc: "Michal Koutn=C3=BD" <mkoutny@suse.com>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
> Cc: John Stultz <jstultz@google.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  include/linux/compiler_types.h | 11 +++++++++++
>  init/Kconfig                   |  5 +++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_type=
s.h
> index 0a1b9598940d..2b0251bb951c 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -351,6 +351,17 @@ struct ftrace_likely_data {
>  # define __assume(expr)
>  #endif
>
> +/*
> + * Optional: only supported since clang >=3D 21
> + *
> + * clang: https://github.com/llvm/llvm-project/pull/137250
> + */
> +#ifdef CONFIG_CC_HAS_COUNTED_BY_FOR_POINTER
> +#define __counted_by_ptr(member)       __attribute__((__counted_by__(mem=
ber)))
> +#else
> +#define __counted_by_ptr(member)
> +#endif
> +
>  /*
>   * Optional: only supported since gcc >=3D 15
>   * Optional: only supported since clang >=3D 18
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49..298c94c4c1b1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -139,6 +139,11 @@ config CC_HAS_COUNTED_BY
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
>         default y if CC_IS_GCC && GCC_VERSION >=3D 150100
>
> +config CC_HAS_COUNTED_BY_ON_POINTERS
> +       bool
> +       # Needs clang 21.1.0 or higher.
> +       default y if CC_IS_CLANG && CLANG_VERSION >=3D 210100
> +
I mistakenly left out GCC from here. I'll roll that in with v2.

-bw

>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring=
__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> --
> 2.52.0.rc2.455.g230fcf2819-goog
>
