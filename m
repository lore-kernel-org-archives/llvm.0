Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9314A3D
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 19:06:28 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id n8-20020a17090a73c800b001fd832b54f6so238381pjk.0
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=4vabnxTMH9N4kijguDzewyk8E7kS2vGaLqNfOIBWjZk=;
        b=knfiwPAL6lej4jecmDDu4C6Ido4YLWRq7K/4z5xP8Y95HipfVhgz9D5nJlBVxO+T7m
         rZ65frZHQeugkrkuUSyfMYi8rlLaNBqTao7nj1rIF6hA90aTFqAP4QZljRPK9W9aDkog
         G7mP4IN5JYMqCNEm6yaf7ctHY/x9O3FT+5Z8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=4vabnxTMH9N4kijguDzewyk8E7kS2vGaLqNfOIBWjZk=;
        b=zRN3xZTfmm9WDTi7C5sQ0zHRSidPL6wkJmiyv1FqqnmjU5VD6iWrcgADRSv4a6/yzm
         URzBj9YkMs9mqbvm/37KT430i3p4lj45HA/RZ04gumS+GbyN0z7Iu6VSFJ+GOj8uQmDp
         s8Sk9FqKiabd0s59tgY7EZQUKv2A0rIRaIyTSM2M4QwKIFcScn/hNNyZ5nedBqdDn+mw
         nH7jVdqhoYY+RtIU9s1zH+hpVmq3GGax7GEPBz6ILvze2RikRzpWOzLu5Wsf8IqRASEn
         3x9NvT5QwC8Gk0J1HdZfojJayL8WDRUv+lLNwa7V63gpfS338oGMk5KdszPjVtOOUxne
         lbMg==
X-Gm-Message-State: ACgBeo1qwA213/SCX7YhIlEaspR+/uDTlLz47Lux6S4ct3EonNX5teBC
	GEHdHX9+dU/XWORApAppkkBp8w==
X-Google-Smtp-Source: AA6agR6dob1FlpsurmMAaUDc1n7xLlFq+7hVuLAeZ0jGTHEY+FVp5+hXY6mm84n2BdL67uQtwFFGqA==
X-Received: by 2002:a17:903:d5:b0:173:3307:bcf with SMTP id x21-20020a17090300d500b0017333070bcfmr27256352plc.87.1661972788232;
        Wed, 31 Aug 2022 12:06:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mh16-20020a17090b4ad000b001f8aee0d826sm1633159pjb.53.2022.08.31.12.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 12:06:27 -0700 (PDT)
Date: Wed, 31 Aug 2022 12:06:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/3] fortify: cosmetic cleanups to __compiletime_strlen
Message-ID: <202208311138.2CA3E54B0D@keescook>
References: <20220830205309.312864-1-ndesaulniers@google.com>
 <20220830205309.312864-3-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830205309.312864-3-ndesaulniers@google.com>

On Tue, Aug 30, 2022 at 01:53:08PM -0700, Nick Desaulniers wrote:
> Two things I noticed in __compiletime_strlen:

Four? :)

> 1. A temporary, __p, is created+used to avoid repeated side effects from
>    multiple evaluation of the macro parameter, but the macro parameter
>    was being used accidentally in __builtin_object_size.

__builtin_object_size(), like sizeof() but unlike __builtin_strlen(),
will not evaluate side-effects: https://godbolt.org/z/Yaa1z7YvK
And using bos on __p will sometimes mask the actual object, so p needs to
stay the argument.

> 2. The temporary has a curious signedness and const-less qualification.
>    Just use __auto_type.

__auto_type is pretty rare in the kernel, but does provide the removal
of "const". Even though the kernel builds with -Wno-pointer-sign, the
explicit case does fix a potential warnings about signedness differences,
not just const differences, for __builtin_strlen() which requires "const
char *", but many arguments are "unsigned char *", "u8 *", etc.

Is __auto_type more readable than the explicit cast? It does seem to
work fine.

> 3. (size_t)-1 is perhaps more readable as -1UL.

That's true, though I kind of prefer (size_t)-1, though yes, it appears
to be the extreme minority in the kernel.

> 4. __p_size == -1UL when __builtin_object_size can't evaluate the
>    object size at compile time. We could just reuse __ret and use one
>    less variable here.

This seems to get entire optimized away by the compiler? I think it's
more readable to keep the explicit variable.

-Kees

> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  include/linux/fortify-string.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> index c5adad596a3f..aaf73575050f 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -22,11 +22,10 @@ void __write_overflow_field(size_t avail, size_t wanted) __compiletime_warning("
>  
>  #define __compiletime_strlen(p)					\
>  ({								\
> -	unsigned char *__p = (unsigned char *)(p);		\
> -	size_t __ret = (size_t)-1;				\
> -	size_t __p_size = __object_size(p, 1);			\
> -	if (__p_size != (size_t)-1) {				\
> -		size_t __p_len = __p_size - 1;			\
> +	__auto_type __p = (p);					\
> +	size_t __ret = __object_size(__p, 1);			\
> +	if (__ret != -1UL) {					\
> +		size_t __p_len = __ret - 1;			\
>  		if (__builtin_constant_p(__p[__p_len]) &&	\
>  		    __p[__p_len] == '\0')			\
>  			__ret = __builtin_strlen(__p);		\
> -- 
> 2.37.2.672.g94769d06f0-goog
> 

-- 
Kees Cook
