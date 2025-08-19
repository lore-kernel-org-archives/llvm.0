Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673032255F
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601361; cv=none; b=fEsnzmJ+HUSgnTHBzuyObGYvYgUxOi+RLATlORpbinRNwEkcyPcfsrdIbDGk7ASOZcIljnR8AO73Oa3bX+5Jp0zauI27xa3wwFiP7sBcAantZbuwtTfrg4A4CNU3I1yvJRnK2Omnjn6h/s8YgyPRc0MCbdJOonKop9p0QATZ1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601361; c=relaxed/simple;
	bh=QW+3Vl1wyeWqmGM44YIRS/8U4Otw7KMVLmpzWqAAJD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5aLl64GDREExErdict5H2uscOBtZqklKb20QSmOPDe4pWZrnVIp4XpQRDbyQcMNC0cPsivbQXiO3w0JI2feWO0Zqaltktv+Po1H7DQieqU589Lbs2nAmfhpV0pZl5203l5jH3gD1HlwuV1ZX5Fwahzlm3duZXD9IPhzcD4CuG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElejmtJ7; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElejmtJ7"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47175d02dcso4300043a12.3
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755601358; x=1756206158; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sE9Ynzec1RnRGjYxwL9GtFPPQqbiY+yne+LG1e9v81Q=;
        b=ElejmtJ7JnjoX7MJylhRv7yVAg51CN1DazEYMPyEh4rN+HBTh7WUHDMW9pP5u3/+Zn
         zfqNECPNE31NWLF2KrzeVEent80RBRscHMEWsU3ZfxnOo790SJ2G2mFZik7pXHfeRTuu
         DYV7zFc6bZUFxgNu/dA3xRPJI3/lOfsJrEmdaSH5Y3DFGaM7t5J5pYhxbRIeF2NUbrRw
         EMPwaWqnjp6eLSP/iUazOSLMUdbnFLahUifajcOQjfB+RTlFXgytVcXljqAN+S9x8lkt
         VrR6fzLCfjwMkWA0MfvrH1zXG0Xaky02RCBt+Bh2LC+baLypQDv/Nu8/gK75ghLHrC/a
         uSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601358; x=1756206158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE9Ynzec1RnRGjYxwL9GtFPPQqbiY+yne+LG1e9v81Q=;
        b=tio4pIZZtXgco4znoQicqi2/UMSAEHnx9guqwzPLt/UIIpJaKh8xOKklCxs9oHt91F
         VQKMOU9Db4VzXGCd7M9T7fTz8RKuVtd1m2vKF+NAcS3flM8bFAKzCE+8g3x/9mtqF8nu
         na9QrNXXaKyPz9OYjzVhB0bTdCeV3qJKLr7726+mJMLlk5HFb11XwjUm2vrlikGFAogw
         nqHcCKSphHqX8ya1ikJjB8W8+g82wOcPUvJdhVGIRSkWxl0OBpgtD5umwFPnVTWwAb2/
         5sWg4hx6EIKe7L1x1ALMAPjUAYTuU+2uwhnmwZy96pAmTepBl+CqKGXD3/u6noH3XORS
         oW5A==
X-Forwarded-Encrypted: i=1; AJvYcCXwh/PrF2h9EIsZtlAoJJ4otCDfDNKeTJUoLQbkhnwnY2ULtFA5w1TVKl/2OuZPRkq2Rnn7@lists.linux.dev
X-Gm-Message-State: AOJu0YxWWXkN6/X/k1QoDzxa1Kx1a5WqhAc1lcN+qTXAJrMoiiJbAFls
	nw+mUuiH+GDVVRFHcvfsAshL3EbLlNt4Gbd9MEgbC15Y0LzNi/v/4QbugHi1G+P96Ll0dlMyI5x
	jgm+px2IP76Mei+avnXdUTbNMPriQB8CWXdr3goow
X-Gm-Gg: ASbGncuR0tjZB4b1Lqa1rIpVvbpl1FIlu7uXFc7PXy91BF+KdE+84++wmDy2hxJTYv6
	u75CKbXejRvQ2ikmZuzHLlZsWzmD7/dF9JG97UW00ddmGZJQ4/ereWgYgBE7pSsPsZribTfZF7f
	JC4ILKCjoou2+Q7S+TBc/rxYLa3viLYyHOY2OItyQd/muTiTjQaOMnzLL6MI7ikk/m4pkg9hF5q
	4Z1Ao6YA0GRjsPiDhCadRc9sJvWx/DsQXNDK8yVpJy1HMw2uxtM9KNl
X-Google-Smtp-Source: AGHT+IFqyq2xNkxcn0+6woeZn1zX9V2Zv/t3YgCXofec8XIVMQnKyUVI7fT9ZOb2sYUD5zGqcBKM/HrzwRrnZFiQZFI=
X-Received: by 2002:a17:902:e948:b0:240:6406:c471 with SMTP id
 d9443c01a7336-245e02aa70cmr26553885ad.10.1755601358131; Tue, 19 Aug 2025
 04:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org> <20250818-bump-min-llvm-ver-15-v1-10-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-10-c8b1d0f955e0@kernel.org>
From: Marco Elver <elver@google.com>
Date: Tue, 19 Aug 2025 13:02:01 +0200
X-Gm-Features: Ac12FXzKM7g4sH5lbxe25GgocsgKN-jxowhmEsNtouQcGNhuUxoPY2G_RdLPDgM
Message-ID: <CANpmjNNwp=RRc4Tm7vrKkSzYqdJueeDSOkPRY1sCG-2W-yPVdA@mail.gmail.com>
Subject: Re: [PATCH 10/10] KMSAN: Remove tautological checks
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Aug 2025 at 20:58, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, two KMSAN checks can be cleaned up.
>
> CONFIG_HAVE_KMSAN_COMPILER will always be true when using clang so
> remove the cc-option test and use a simple check for CONFIG_CC_IS_CLANG.
>
> CONFIG_HAVE_KMSAN_PARAM_RETVAL will always be true so it can be removed
> outright.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Marco Elver <elver@google.com>

> ---
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com
> ---
>  lib/Kconfig.kmsan | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
> index 0541d7b079cc..7251b6b59e69 100644
> --- a/lib/Kconfig.kmsan
> +++ b/lib/Kconfig.kmsan
> @@ -3,10 +3,7 @@ config HAVE_ARCH_KMSAN
>         bool
>
>  config HAVE_KMSAN_COMPILER
> -       # Clang versions <14.0.0 also support -fsanitize=kernel-memory, but not
> -       # all the features necessary to build the kernel with KMSAN.
> -       depends on CC_IS_CLANG && CLANG_VERSION >= 140000
> -       def_bool $(cc-option,-fsanitize=kernel-memory -mllvm -msan-disable-checks=1)
> +       def_bool CC_IS_CLANG
>
>  config KMSAN
>         bool "KMSAN: detector of uninitialized values use"
> @@ -28,15 +25,9 @@ config KMSAN
>
>  if KMSAN
>
> -config HAVE_KMSAN_PARAM_RETVAL
> -       # -fsanitize-memory-param-retval is supported only by Clang >= 14.
> -       depends on HAVE_KMSAN_COMPILER
> -       def_bool $(cc-option,-fsanitize=kernel-memory -fsanitize-memory-param-retval)
> -
>  config KMSAN_CHECK_PARAM_RETVAL
>         bool "Check for uninitialized values passed to and returned from functions"
>         default y
> -       depends on HAVE_KMSAN_PARAM_RETVAL
>         help
>           If the compiler supports -fsanitize-memory-param-retval, KMSAN will
>           eagerly check every function parameter passed by value and every
>
> --
> 2.50.1
>
