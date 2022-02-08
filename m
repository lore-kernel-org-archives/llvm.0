Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55192C80
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 22:59:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id u6so771721lfm.10
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 14:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItA6TI8Ni0PvSK9MRYCU3UPCNW2YkPVfVW+7WyXcgIY=;
        b=afjxbKw+HzBUlQ3VvuygQbzk9tugRPl9+vCKl+hHOnudj3FtAdcYJm+J0obNuEvQkF
         mMdDm1UwYtIBcQYD+5S69w2LC/oAIIi/zEFuRkTuJXaT25X71WtPXS4N9QxghiI29Zw6
         K2PCvrwgk7c+ntSYrQLtBLuKdljo30Ej3qX5OIQqDw9temAZsjNWDUrOXXTu/gYTG+0B
         4IHqkeQKU0bmSqngH3QnAumzP+5C6EPz0BRZ1WQ8bNcJX8DsOqVPh+foqEjAMVhADIvv
         fJaCY0xTm3hvMswNVpOcc3EIMuqy51gbtJE7qUz4sn7uTHYRZmCOEQWmQZNFkthU435E
         H9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItA6TI8Ni0PvSK9MRYCU3UPCNW2YkPVfVW+7WyXcgIY=;
        b=ZDsQIiuwS9eZ8muotksbQJcNafgXxiX0mo062RqWc8LbogMaNnRgbSKF4qLTd/msrP
         omM1mqTFZc3sC96mGq4tO6ebkNZZ8w8A+sSgdhcnKBkneltitKDCqiJHjVQ86ztWTJhz
         4BU4ZJykZ/YBT+e3Q4ufOg0XB6qAynlJbFksB3a4w05ogsDZMOOldSw7uT+unTeHos/M
         lwHphLMbIOjmeHETgxTtG03/u09yqgaeHhtzUySQdV1tiOFbT6TLhgofjs/kMdcBF9it
         z7PYOnSitNVz1Qac2y87zDK6WcgwV4v3QkeQ+iA1opKBwGM8vGe4+iloSiVYYp6Sbr/G
         l1mA==
X-Gm-Message-State: AOAM530ViMvviQQP5/hVxNWMCNcd9/mhHbYbIYyVWNnmL5VfiH6XWPoI
	8JUIrKg7zTWFQD7uChEy778+MO1oet2DFj7foIy0sw2FB/E=
X-Google-Smtp-Source: ABdhPJzrXjvmHbg4P8xDaIMkX3/azpSsByQPI0FL0T+S/upQWiXIjKfa7421S1XvVu6Ron9ZMXcooOEZEXBDJE9GEbk=
X-Received: by 2002:ac2:43db:: with SMTP id u27mr1290745lfl.651.1644361163719;
 Tue, 08 Feb 2022 14:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208225350.1331628-1-keescook@chromium.org> <20220208225350.1331628-2-keescook@chromium.org>
In-Reply-To: <20220208225350.1331628-2-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Feb 2022 14:59:11 -0800
Message-ID: <CAKwvOdm425gzxFbjcq8UmWOiBNV_POYemFgqK9CyZtdyg=Z8Qg@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] fortify: Replace open-coded __gnu_inline attribute
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
>
> Replace open-coded gnu_inline attribute with the normal kernel
> convention for attributes: __gnu_inline

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/fortify-string.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> index 53123712bb3b..439aad24ab3b 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_FORTIFY_STRING_H_
>  #define _LINUX_FORTIFY_STRING_H_
>
> -#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline))
> +#define __FORTIFY_INLINE extern __always_inline __gnu_inline
>  #define __RENAME(x) __asm__(#x)
>
>  void fortify_panic(const char *name) __noreturn __cold;
> --
> 2.30.2
>
>


-- 
Thanks,
~Nick Desaulniers
