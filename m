Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D330D2F5
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714163288; cv=none; b=j1xXvH0i3w5Qt9dClsAU4421JEhrweoso6dQA/aIgfAC4tmM5xV3yZroIpk57jm0mwUHezuDxAWSdfRfBDClOH3OPHsOAYLcNJR/fpUdEMM+G3ZLugTcja0ddo9iqt51NeFB5yCDIMq+aW5p1iKDfFKbioF/eRx3aqSXt24qdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714163288; c=relaxed/simple;
	bh=TtoJasaeQGgnALP0rtQ0ZwOtOqDfU1tZPTxkeDPjRHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCz6RAJM2soRf2R0WaW4jS/Z0E+ALdCxDrZG5Bgn6aI73bpDS6LFEnooOPOrcC5P9TO5V9qWDa2Fh+U1NXsPxS3lsh5ObeM6g0Zzs5xARoxBKGqCw5fEI/iNTBj9bnOcXN8K2nE2GDM+msJz3VoBphy7t/36Abwu/qhndAJtW3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNmS/mUE; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNmS/mUE"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36c3c5f7d0aso80715ab.2
        for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714163285; x=1714768085; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0HjfgQeMYeniizrlmmHEmgJt7Z1IePAUwGcoRhvByo=;
        b=FNmS/mUET4opvmZoX4Izl68seJsgNoPmF2CbipOPiYrgIfa9+HZLB95oI7XzR6rMgF
         TeoL4UFQ17t8h/n5nc8Po7EVWuWSJP/uWJbEzESIl3vPHyQO0fYS1MGJ5dq3rFJu8k5s
         PBxTLxkAcX770NSGQeGDaGCvs4gHFILISTpsMYi6CKsjDGX5U8Ve6jqgynHHoQgpw4mO
         mffla2iG3U9ElQ0jRhFWu3gM1qX7dnUz81Ic3c6/Z7RBUpKdrdPiy503xDOy/DA2xiDG
         NBvNoclIuOdJDEmTxPcQASwaMWTvsIbMP+BnO1WumJcxgbTjC2fSg1m1VsF9b4Symm+x
         y7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714163285; x=1714768085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0HjfgQeMYeniizrlmmHEmgJt7Z1IePAUwGcoRhvByo=;
        b=b2GIVyBSH3PSd6ucX24kPGU35HBwJ3peVMTVukVCEvMgvjuN4W6NWF6KrixwyktHyV
         nK49UaYVDcZ4SXJ4UnWeBS3PjxCHQdKRiZ6Z+LhXgKauw8KOZy+ROeD9mYXeFXP2KLZt
         hqJ+lEmn2b5Ksvt8565ZjCqGk/zE3fOcrD3Mqo8BKFkHQnZz1cE/6iqtaK5Mi4ovBCnn
         LsyNa0SwPI8C2SZgptH6lNCaoDr8jvbJYJbSk8yX6DVvtdq5YWVUdsg1L+gBF1L+zDIt
         rnc43hVByVT+TeXr8Tl2+wXWE0hocN6d/tLn7JR4HMxEEmrBO6Lhu9Mod6ygShuHA87d
         gJ5w==
X-Forwarded-Encrypted: i=1; AJvYcCX4iWFX6cGNPQfZSIOtpIGzfhPBKQmqMXPQcTTNcBkz85WMIw2SqCd9QWNHiv/mGnuA7Jl757oGgtqJkOSG/wIaP8CH4w==
X-Gm-Message-State: AOJu0Yy0/T3lCKa9nVHwADuHBv2+D7HFREviU3GIquYPZjfLD/Nu5nLb
	YYvZCwLlPGAuu/RknODDDsQtsMTTJpq6T+/C+/sIGTZSaOyRGUDuua4EAKl6/Q==
X-Google-Smtp-Source: AGHT+IEDLzup8dAjXDwrXqvfO3khOMafAlVMyWw462IeEbbgXPBlppCqAlUnNkur3oxRSm1RxOew3A==
X-Received: by 2002:a05:6e02:13a9:b0:368:80ff:9bc4 with SMTP id h9-20020a056e0213a900b0036880ff9bc4mr1236703ilo.1.1714163285655;
        Fri, 26 Apr 2024 13:28:05 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id x17-20020a920611000000b0036c28ba3ecesm1089777ilg.85.2024.04.26.13.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 13:28:05 -0700 (PDT)
Date: Fri, 26 Apr 2024 20:28:01 +0000
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Marco Elver <elver@google.com>, Erhard Furtner <erhard_f@mailbox.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ubsan: Avoid i386 UBSAN handler crashes with Clang
Message-ID: <kxzozn56f7xknswj4xmss5agncpy7t7apke665swpcvrijt4uw@35rfqgyuyp5v>
References: <20240424224026.it.216-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424224026.it.216-kees@kernel.org>

Hi,

On Wed, Apr 24, 2024 at 03:40:29PM -0700, Kees Cook wrote:
> When generating Runtime Calls, Clang doesn't respect the -mregparm=3
> option used on i386. Hopefully this will be fixed correctly in Clang 19:
> https://github.com/llvm/llvm-project/pull/89707
> but we need to fix this for earlier Clang versions today. Force the
> calling convention to use non-register arguments.
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://github.com/KSPP/linux/issues/350
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> Cc: kasan-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
>  v2:
>    - use email address in Reported-by
>    - link to upstream llvm bug in ubsan.h comment
>    - drop needless /**/
>    - explicitly test Clang version
>  v1: https://lore.kernel.org/lkml/20240424162942.work.341-kees@kernel.org/
> ---
>  lib/ubsan.h | 41 +++++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/ubsan.h b/lib/ubsan.h
> index 50ef50811b7c..07e37d4429b4 100644
> --- a/lib/ubsan.h
> +++ b/lib/ubsan.h
> @@ -124,19 +124,32 @@ typedef s64 s_max;
>  typedef u64 u_max;
>  #endif
>  
> -void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
> -void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
> -void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
> -void __ubsan_handle_negate_overflow(void *_data, void *old_val);
> -void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
> -void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
> -void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
> -void __ubsan_handle_out_of_bounds(void *_data, void *index);
> -void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
> -void __ubsan_handle_builtin_unreachable(void *_data);
> -void __ubsan_handle_load_invalid_value(void *_data, void *val);
> -void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
> -					 unsigned long align,
> -					 unsigned long offset);
> +/*
> + * When generating Runtime Calls, Clang doesn't respect the -mregparm=3
> + * option used on i386: https://github.com/llvm/llvm-project/issues/89670
> + * Fix this for earlier Clang versions by forcing the calling convention
> + * to use non-register arguments.
> + */
> +#if defined(CONFIG_X86_32) && \
> +    defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 190000
> +# define ubsan_linkage asmlinkage

Clever.

Acked-by: Justin Stitt <justinstitt@google.com>

> +#else
> +# define ubsan_linkage
> +#endif
> +
> +void ubsan_linkage __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
> +void ubsan_linkage __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
> +void ubsan_linkage __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
> +void ubsan_linkage __ubsan_handle_negate_overflow(void *_data, void *old_val);
> +void ubsan_linkage __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
> +void ubsan_linkage __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
> +void ubsan_linkage __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
> +void ubsan_linkage __ubsan_handle_out_of_bounds(void *_data, void *index);
> +void ubsan_linkage __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
> +void ubsan_linkage __ubsan_handle_builtin_unreachable(void *_data);
> +void ubsan_linkage __ubsan_handle_load_invalid_value(void *_data, void *val);
> +void ubsan_linkage __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
> +						       unsigned long align,
> +						       unsigned long offset);
>  
>  #endif
> -- 
> 2.34.1
> 

Thanks
Justin
