Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFB7E9
	for <llvm@lists.linux.dev>; Wed, 30 Nov 2022 06:28:45 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id r10-20020a4aa2ca000000b0049dd7ad4128so2473589ool.13
        for <llvm@lists.linux.dev>; Tue, 29 Nov 2022 22:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=06+BuaqCExp3OktAsqU4uEcZm4SWvo2W5juMDl91Gyw=;
        b=q4x4Lmg46LVT8Sl1uTxWib6QfCiVdMjHPanqSl1D/1dYVbivwZGjvDrUXGxxpRzaGG
         OKbpVNZKuOMdZ03JwpArmpGbwe4hBxisvJ6BYqIYHcJdTozwG4LOUzRBDM83yb0iuENy
         ZBDApB3uwnM+a14bYewdHhIL9cb4N5A9dZ1KGr0h+ckoVCr8E4DF1mVw6Kc1ITGmoSo6
         mhsXDO1CVKJ5PInBQIqqm6l+tKXBqkojOcSc4/ipEJ6gfsna0hJnN0iK/4XMLo0FoB/o
         O8QyAo1tp1pA+xA24rp8AwDOdgEYUrrv+yYwVVvoC58+Z26UcIKt58Jv0fqgfQghXxFy
         OSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06+BuaqCExp3OktAsqU4uEcZm4SWvo2W5juMDl91Gyw=;
        b=i4ZORZQWmKXhWGyCZximm1A/h/X5KVXr9E91vm8Gw2+TngoFN2006bAdQ9v19jtV2G
         SEHsO18eO2N3vAMWgvfUsuS843+Q8uRzpzwbbJRmzHl2LWQwssegSEMsRpeWr90sM5B0
         L9Hp1CE+cX7qQXDiozFpNCEKuyqBRwridvRh7/7zzj5098eGYB4Z2PJjmTW85gqX5iR8
         aRaOu3K8YPg/s9SXqPSNxrcw7l58TUA15DlCbB/7s78pvHiN5DcWwHn8F6TuXvUlKq92
         hNKB5k6mJXfUP1FnIfhCMb48tFkset0cmnQ17855Tap/QkJV0oFowkZlwi9HfDH8WECl
         MGUA==
X-Gm-Message-State: ANoB5pmdr2tzquW9Uy9IiCXw4fZFwgdb7IwH9GhndJfp1kI8akl6g555
	eJvzAvppJ78S3jQLCZUqaePLYA==
X-Google-Smtp-Source: AA0mqf5c1p3v1mSw0W1Lxou6w1c9U0b5P6hMhDR4wdAvK1CzpOphup5o33C+z/8uS5ryXcV0TzRX/Q==
X-Received: by 2002:a4a:9e99:0:b0:49f:df9f:f316 with SMTP id u25-20020a4a9e99000000b0049fdf9ff316mr20579972ook.63.1669789724127;
        Tue, 29 Nov 2022 22:28:44 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w12-20020a056830410c00b006619295af60sm513339ott.70.2022.11.29.22.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 22:28:43 -0800 (PST)
Date: Tue, 29 Nov 2022 22:28:33 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Nathan Chancellor <nathan@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Sasha Levin <sashal@kernel.org>, Hugh Dickins <hughd@google.com>, 
    llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 5.4 and earlier only] mm: Fix '.data.once' orphan section
 warning
In-Reply-To: <20221128225345.9383-1-nathan@kernel.org>
Message-ID: <103aa792-661f-396b-82d4-4507df636b9@google.com>
References: <20221128225345.9383-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Nov 2022, Nathan Chancellor wrote:

> Portions of upstream commit a4055888629b ("mm/memcg: warning on !memcg
> after readahead page charged") were backported as commit cfe575954ddd
> ("mm: add VM_WARN_ON_ONCE_PAGE() macro"). Unfortunately, the backport
> did not account for the lack of commit 33def8498fdd ("treewide: Convert
> macro and uses of __section(foo) to __section("foo")") in kernels prior
> to 5.10, resulting in the following orphan section warnings on PowerPC
> clang builds with CONFIG_DEBUG_VM=y:
> 
>   powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
>   powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
>   powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
> 
> This is a difference between how clang and gcc handle macro
> stringification, which was resolved for the kernel by not stringifying
> the argument to the __section() macro. Since that change was deemed not
> suitable for the stable kernels by commit 59f89518f510 ("once: fix
> section mismatch on clang builds"), do that same thing as that change
> and remove the quotes from the argument to __section().
> 
> Fixes: cfe575954ddd ("mm: add VM_WARN_ON_ONCE_PAGE() macro")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yes indeed: thanks Nathan, sorry about that.

Acked-by: Hugh Dickins <hughd@google.com>

> ---
> 
> As far as I can tell, this should be applied to 5.4 and earlier. It
> should apply cleanly but let me know if not.

I think it should be good for 4.19 also, but I don't know what happens
or would happen in 4.14 and 4.9 trees, since those have no other example
of .data.once or ".data.once" (and I've lost what little I ever knew of
that linker script stuff).

Since we're not hearing complaints about those (or are you?), perhaps
those trees are not clang-ready in other ways, and for gcc it all works
out by itself: I'd be inclined to just leave them as is myself, if there
are no reports of breakage; but you may know better, and prefer to remove
the ' __section(".data.once")' from the 4.14 and 4.9 versions.

> 
>  include/linux/mmdebug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index 5d0767cb424a..4ed52879ce55 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -38,7 +38,7 @@ void dump_mm(const struct mm_struct *mm);
>  		}							\
>  	} while (0)
>  #define VM_WARN_ON_ONCE_PAGE(cond, page)	({			\
> -	static bool __section(".data.once") __warned;			\
> +	static bool __section(.data.once) __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
>  	if (unlikely(__ret_warn_once && !__warned)) {			\
> 
> base-commit: 4d2a309b5c28a2edc0900542d22fec3a5a22243b
> -- 
> 2.38.1
