Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A02C3252
	for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224927; cv=none; b=EU9UafxKSk6IO/+fWHRDZdwpwXE9BznuThnfWZLV0kSb1/JY/T7pWZEQkMa5qKoM32fmphlGuE2YRMaX92SAcKthbjy5lw6CnBk6yCff/v+WSDTzqeFHfMJkZF7cWrjQRcCV2dcFVibNvpCQ/RTbnCTwAjYEDtmytNpoV4XoO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224927; c=relaxed/simple;
	bh=bxFgAEY81SjNvUJ+kxxs2m1wYC/4BSvGlgWSuaRMhJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kEDEoACPtW4snbvB0Wt2F9k/DF2cnwjI3WtfzXlkpZB+Eyom+2iqApRzmlRwYMVZONe4QTt1BY5m8anbwPD11sLuqhridqmfmdqWrFVaQyGmHkT+jrizymaGKeim+FvvH2n9eg62EgltXUcO1tWJ3SBop6594cSMvlVpQEYLYag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEtjk/e1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEtjk/e1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso10418865e9.0
        for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766224924; x=1766829724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
        b=VEtjk/e1BwYmLBMMEOm1wWY63VSh7xfFaWSvdSsR62yTeppyLytpb0+HW9LCRGVEX0
         ghMBoiMKuXCfvad9oWNFVd+mH9kGCi0DtlhF6qr0pUJvn+I4yLQoiGtPXYSV+Y9olDsZ
         lDsd1z6MEX1Ap6x1mjagxrRT714QrV7fUinAREuc7m3cR+lJ4EHFGmAJVKhTpNB7WFCy
         fI+Z0AjQffSEP4mDQdiI3XAP7SeGjohEk6bBYlNhEkNDiZmp93uuQj5ZG+mSqeGOZYzc
         LSlzHnxExp7q1oIrOLVa4Nl/3DYwfz4TmjZ0BPAZpr6I8MWpSdbZ0tjJ6AX1BcDSdzGV
         3TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224924; x=1766829724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
        b=Fxmd0P7avPZjKJKu9NcrSbLzDwkLc+R5zfCb/p9fVOwNzw9vauLvdOUSmeRj2P9/LJ
         lVev+OkcfeG97U6S03cTeWyU0naxuZOcAIAp3QR1lNBXZ3S3fPZdCFg6LllSTby9eyi0
         8znpEotZbzZuVKoCpRaAVmIqyJo3Zkg8IyM2/bsCdXp1g2SdpCUSe1ThMkelTivoUdkH
         1cwKmS/OVLui8E5UuAypG+7qHS3lDkvZ7UZNgYIz43WBUgqumuOkb4K/CWJx/4VYQw9J
         +Z3MQSghV0BcW08Qhx0CEABBYveS12juIbmm4VM5ML1ETwxU5SQZfep4be+PxrFLPnXj
         gcqA==
X-Forwarded-Encrypted: i=1; AJvYcCW/UOAa50PA1/oMmXzJc0hkq/mZZ/FAhXtKiWTqjkHrUR1ZpdP4HRk5Xmua0A6EsfJYGomg@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp1mZjI6WCZq00MYsJDSUa8IvmldBgX0dgbLtopSUfCBxqqCw2
	moaTULzjOSQQrqGaBcFu8eNTqMxKIv+d9pVxCubmSBo4ei0HVhG7uTZ0
X-Gm-Gg: AY/fxX5265klW6Ho1sT89o41WY+m0vXmmCCmulIV17kaQF8eUJaPLX6kgRRvLMt7tOi
	/LNhEIvIq061iJZjsD4KLHxbQF8e3wwFCa5s+nOzN/WAVedjELKA5U9jS9RJoapXMHDUlc5ID0m
	FMzAJ54gTgqlESEeg9t7siSbiXrlr9qYvC8GTWE/8sjoP6FdoTSuAqvtpRGArUGIPHIfhO164EX
	Ldk91u20ww4zlVw/rZf48fxgrMjXzkFuDbnq6tG1HCqbtumccQKkXRzUE/ZtwzOVnK3eYlzbCoz
	L/WLhJzx073JDnkue1wnnC/7tUVfgkROB5j1+aBDA87R3Ksr0piUDtb8VZ9NCWDBwYe7sEz4qVp
	5TNtu7vrY4l1HVbQVDtUdTAuX/97QK8RaE+BkhKn+DSxgP7S/i+h3dEyiGW2YaOww+a5308O7c1
	B4XKDi43C/YtnNYH9WCb11yK7mQ9ztuDf95/wBQA1Xl/Ffyxhd4hbh
X-Google-Smtp-Source: AGHT+IHQOJ0Ua+zWZlb0QPcZUUI/HtzVKK9z+yFIQMbNJiEgWc0RnGqXX7qQpeO5IWGkqcyJJpZw3A==
X-Received: by 2002:a05:600c:1d1d:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47d1958f9c5mr48722805e9.26.1766224923818;
        Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm9840402f8f.38.2025.12.20.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Date: Sat, 20 Dec 2025 10:02:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Mason
 <clm@fb.com>, David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
Message-ID: <20251220100201.26d9b0db@pumpkin>
In-Reply-To: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
References: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
	<20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 23:39:48 +0100
Vincent Mailhol <mailhol@kernel.org> wrote:

> The function like macro __is_nonneg() casts its argument to (long long)
> in an attempt to silence -Wtype-limits warnings on unsigned values.

nak.

The cast is needed for pointer types, not for -Wtype-limits.
which is why the '#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__'
test is there.

	David

> 
> But this workaround is incomplete as proven here:
> 
>   $ cat foo.c
>   #include <linux/minmax.h>
> 
>   int foo(unsigned int a)
>   {
>   	return __is_nonneg(a);
>   }
>   $ make CFLAGS_KERNEL="-Wtype-limits" foo.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      foo.o
>   foo.c: In function 'foo':
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:50: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                  ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:57: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                         ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
> 
> And because -Wtype-limits is now globally disabled, such a workaround
> now becomes useless. Remove the __is_nonneg()'s cast and its related
> comment.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changelog:
> 
>   v1 -> v2: new patch
> ---
>  include/linux/minmax.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index a0158db54a04..3e2e3e539ba1 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -52,9 +52,6 @@
>  /*
>   * Check whether a signed value is always non-negative.
>   *
> - * A cast is needed to avoid any warnings from values that aren't signed
> - * integer types (in which case the result doesn't matter).
> - *
>   * On 64-bit any integer or pointer type can safely be cast to 'long long'.
>   * But on 32-bit we need to avoid warnings about casting pointers to integers
>   * of different sizes without truncating 64-bit values so 'long' or 'long long'
> @@ -65,7 +62,7 @@
>   * but they are handled by the !is_signed_type() case).
>   */
>  #if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
> -#define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
> +#define __is_nonneg(ux) statically_true((ux) >= 0)
>  #else
>  #define __is_nonneg(ux) statically_true( \
>  	(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
> 

