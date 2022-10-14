Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350523D2
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 14:40:11 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id h203so4045369iof.1
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gqNU3jyIKdP2LeNPDch6KlM75RQE0z3FFP6RVfvlhuM=;
        b=bOZwXqjmw7sX8px0+Lq1iBo8giDDyRK0xiJO9OwdoKqeV1HX0S+EZc16NmoDZ3CreO
         E3MsKXQNl8pOLt9wKYBMoUbK8LMoUsAhlVXPRyC3f/gN4Jhi9BrrjbNAspvqnLGhRNRi
         67pzpwb+iThnF6UR0j3G/qaIxYxN0kn8C80RC3s1jnu899Zj4TgbKzaQgAB9ReHmRjcP
         XrdIZgeVELwuXJEq7d9BEfq7PGtbOhbzc2+ObHITZOjbGju5C7nmlA5elNU1ObdBPamj
         StKKbp+pt2rm7wAgOIJKzscSzTIZgFDpxUDFoXX7coX+Hq/+qzDa8Ki3cZiAi5jKCYZk
         R5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqNU3jyIKdP2LeNPDch6KlM75RQE0z3FFP6RVfvlhuM=;
        b=rXZoVt/zMfQhb6ZewIewiNbPubFG0rkmMPpCbrulpe7sYs+5TPB+cfwVxyi9nfZd31
         +DR+ZFFJgU1V7bzPSYnycJpD+OeYxePt067/TjJXsHZk2XFx01gc7vNZKrU9jFwZINvi
         VT2xUR9YqHEtByt3KluOxJjzP0nYzGZWnLUNtx6fMfhe1AslN8TYNnUraOvtv23Vvzrp
         VoQfuUboVEd+Gm3FQT80Oq4vsfcQBfjvAiSrG4qCims8mQX6nKO2LKuleVx/zlSwCQaq
         /8an1eEIpVFiLxLXH9OHFoYCTERR0+xp8Tkenh4Q16y7O0X57KioZKDwN2ydDAmPUIKA
         krVA==
X-Gm-Message-State: ACrzQf2LgxY160BHNga8RQNq3LyUPtNKwx8JNBhKSNDfsVrNwH+aojr4
	XXQ4jVUqh9vZm0I3vyL8D+eB+Kpzg2JtGyoQWcw=
X-Google-Smtp-Source: AMsMyM7FQagympQoF02w3NjUUBCYlwsxqfgUO0qOaLc+FgBJvwDwQYVryxvfwBHP7BeFHYosXU5c9eiwuRqFCvXiKUI=
X-Received: by 2002:a05:6602:1509:b0:69b:35ba:4720 with SMTP id
 g9-20020a056602150900b0069b35ba4720mr2422187iow.155.1665758411053; Fri, 14
 Oct 2022 07:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011171427.58891-1-masahiroy@kernel.org>
In-Reply-To: <20221011171427.58891-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Oct 2022 16:39:59 +0200
Message-ID: <CANiq72kvaPGr=2S6J7q7gfEg_CauHUfhuLmABpktfUPfK+_Hvg@mail.gmail.com>
Subject: Re: [PATCH v2] Remove Intel compiler support
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Terrell <terrelln@fb.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ia64@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Tom Rix <trix@redhat.com>, 
	devel@acpica.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 7:16 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 898b3458b24a..9221302f6ae8 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -64,16 +64,10 @@
>   * compiler should see some alignment anyway, when the return value is
>   * massaged by 'flags = ptr & 3; ptr &= ~3;').
>   *
> - * Optional: not supported by icc
> - *
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-assume_005faligned-function-attribute
>   * clang: https://clang.llvm.org/docs/AttributeReference.html#assume-aligned
>   */
> -#if __has_attribute(__assume_aligned__)
> -# define __assume_aligned(a, ...)       __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
> -#else
> -# define __assume_aligned(a, ...)
> -#endif
> +#define __assume_aligned(a, ...)        __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))

Thanks for cleaning the conditional inclusion here. I double-checked
it is indeed available for both GCC and Clang current minimum versions
just in case: https://godbolt.org/z/PxaqeEdcE.

> diff --git a/lib/zstd/common/compiler.h b/lib/zstd/common/compiler.h
> index f5a9c70a228a..c281a6430cd4 100644
> --- a/lib/zstd/common/compiler.h
> +++ b/lib/zstd/common/compiler.h
> @@ -116,7 +116,7 @@
>
>  /* vectorization
>   * older GCC (pre gcc-4.3 picked as the cutoff) uses a different syntax */
> -#if !defined(__INTEL_COMPILER) && !defined(__clang__) && defined(__GNUC__)
> +#if !defined(__clang__) && defined(__GNUC__)
>  #  if (__GNUC__ == 4 && __GNUC_MINOR__ > 3) || (__GNUC__ >= 5)
>  #    define DONT_VECTORIZE __attribute__((optimize("no-tree-vectorize")))
>  #  else

These files come from upstream Zstandard -- should we keep those lines
to minimize divergence?
https://github.com/facebook/zstd/blob/v1.4.10/lib/common/compiler.h#L154.

Commit e0c1b49f5b67 ("lib: zstd: Upgrade to latest upstream zstd
version 1.4.10") is the latest upgrade, and says:

    This patch is 100% generated from upstream zstd commit 20821a46f412 [0].

    This patch is very large because it is transitioning from the custom
    kernel zstd to using upstream directly. The new zstd follows upstreams
    file structure which is different. Future update patches will be much
    smaller because they will only contain the changes from one upstream
    zstd release.

So I think Nick would prefer to keep the changes as minimal as
possible with respect to upstream.

Further reading seems to suggest this is the case, e.g. see this
commit upstream that introduces a space to match the kernel:
https://github.com/facebook/zstd/commit/b53da1f6f499f0d44c5f40795b080d967b24e5fa.

> diff --git a/lib/zstd/compress/zstd_fast.c b/lib/zstd/compress/zstd_fast.c
> index 96b7d48e2868..800f3865119f 100644
> --- a/lib/zstd/compress/zstd_fast.c
> +++ b/lib/zstd/compress/zstd_fast.c
> @@ -80,13 +80,6 @@ ZSTD_compressBlock_fast_generic(
>      }
>
>      /* Main Search Loop */
> -#ifdef __INTEL_COMPILER
> -    /* From intel 'The vector pragma indicates that the loop should be
> -     * vectorized if it is legal to do so'. Can be used together with
> -     * #pragma ivdep (but have opted to exclude that because intel
> -     * warns against using it).*/
> -    #pragma vector always
> -#endif
>      while (ip1 < ilimit) {   /* < instead of <=, because check at ip0+2 */
>          size_t mLength;
>          BYTE const* ip2 = ip0 + 2;

Ditto: https://github.com/facebook/zstd/blob/v1.4.10/lib/compress/zstd_fast.c#L83.

Apart from the zstd divergence which I am not sure about, everything
looks good to me!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
