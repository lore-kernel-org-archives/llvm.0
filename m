Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99522F0E
	for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 22:06:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-69002ef0104so224354b3a.1
        for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694642811; x=1695247611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=urxSjSL8TtkNIjZ7m8FLIkazvrzMdKz3VUacjiaJ2lk=;
        b=RI5etOWfatoneCKt7/IdaD8aRRFofbEclndyWXJzuelnD380PNdSGf8SfV4C22HkzG
         D0r/s6YZz4/uCnTK4SKRYefQRB2ME1hJos8zWlbUmdp6tKoxPM6DThXNkKtKT2apZRXr
         uhclPPtGvX40XJ7rQLbgaGYKy5uu7BHWUE3zRSo0+C5Wld2vN5UaxQrks7FHDkbAfQWu
         UcanfeH96cKgkuG84t8yeHEYP3u/3pJwwEvQfpjisbnYPI6ortNW9/yo3CIRvK1mq7Yk
         qgQDo3N27AU0sTWy2HcWUO333O4pm1pYpzKo0Ftk/A/wgAi206oXGfov3I4wJCaHgXJe
         YDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694642811; x=1695247611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urxSjSL8TtkNIjZ7m8FLIkazvrzMdKz3VUacjiaJ2lk=;
        b=W1PrFAdxu7vEX4ObyrTJB9KGeU6dffbGXLkOrOWgdeM3UaGtvSfpv1/lAcav31n8YI
         ZW/+w9X4ZC0Akcx1gY0+8+7L7zznN7ibfyDFjipVslIOCNoK46a7a675q3TtNJURBSez
         rrdre2MuyBV1PZvreE+omkr/xVthy98nlXYVPCEBggCZ1S4yJHy9pGeRAbOPA+JbbWwF
         rhXWLIgHVaAhPn55ARV3CJin8jNumEF/hfp8fbMwxzY9eVhVvIg/BqRlSjkMmio312DW
         q9B2Wmdj4yzM734vsrXTMX8dh1l3GsMYoHpzY683p8UzS6hIb6l40LCUQ2+Q5WnjRvWB
         m1Jw==
X-Gm-Message-State: AOJu0Yz2AHEL5tTiznuuYYSOOuu8pSI+A9r6K/9rdfApgXII2omg23IH
	SQkxd2dHvNh/f1xPzQU84/C8oF+vI/xqg6yPlYkePA==
X-Google-Smtp-Source: AGHT+IG5lMN9N/NzZheFxGkrAa3zZ64Hdpr+KgHYX6YrzH90dnpy4eCfT7a9AYM2XtlTfn9FY4Ldpg==
X-Received: by 2002:a6b:6d15:0:b0:795:196c:a074 with SMTP id a21-20020a6b6d15000000b00795196ca074mr4625700iod.3.1694642790891;
        Wed, 13 Sep 2023 15:06:30 -0700 (PDT)
Received: from google.com (26.103.132.34.bc.googleusercontent.com. [34.132.103.26])
        by smtp.gmail.com with ESMTPSA id i9-20020a02cc49000000b0042b0de0b976sm31899jaq.154.2023.09.13.15.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 15:06:30 -0700 (PDT)
Date: Wed, 13 Sep 2023 22:06:27 +0000
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kent.overstreet@linux.dev, bfoster@redhat.com,
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 7/7] bcachefs: Fix -Wcompare-distinct-pointer-types in
 bch2_copygc_get_buckets()
Message-ID: <20230913220627.stso6sxqyraizqod@google.com>
References: <20230912-bcachefs-warning-fixes-v1-0-a1cc83a38836@kernel.org>
 <20230912-bcachefs-warning-fixes-v1-7-a1cc83a38836@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912-bcachefs-warning-fixes-v1-7-a1cc83a38836@kernel.org>

On Tue, Sep 12, 2023 at 12:15:44PM -0700, Nathan Chancellor wrote:
> When building bcachefs for 32-bit ARM, there is a warning when using
> max() to compare an expression involving 'size_t' with an 'unsigned
> long' literal:
>
>   fs/bcachefs/movinggc.c:159:21: error: comparison of distinct pointer types ('typeof (16UL) *' (aka 'unsigned long *') and 'typeof (buckets_in_flight->nr / 4) *' (aka 'unsigned int *')) [-Werror,-Wcompare-distinct-pointer-types]
>     159 |         size_t nr_to_get = max(16UL, buckets_in_flight->nr / 4);
>         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/minmax.h:76:19: note: expanded from macro 'max'
>      76 | #define max(x, y)       __careful_cmp(x, y, >)
>         |                         ^~~~~~~~~~~~~~~~~~~~~~
>   include/linux/minmax.h:38:24: note: expanded from macro '__careful_cmp'
>      38 |         __builtin_choose_expr(__safe_cmp(x, y), \
>         |                               ^~~~~~~~~~~~~~~~
>   include/linux/minmax.h:28:4: note: expanded from macro '__safe_cmp'
>      28 |                 (__typecheck(x, y) && __no_side_effects(x, y))
>         |                  ^~~~~~~~~~~~~~~~~
>   include/linux/minmax.h:22:28: note: expanded from macro '__typecheck'
>      22 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>   1 error generated.
>
> On 64-bit architectures, size_t is 'unsigned long', so there is no
> warning when comparing these two expressions. Use max_t(size_t, ...) for
> this situation, eliminating the warning.
>
> Fixes: dd49018737d4 ("bcachefs: Rhashtable based buckets_in_flight for copygc")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  fs/bcachefs/movinggc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/bcachefs/movinggc.c b/fs/bcachefs/movinggc.c
> index 256431a6dc0c..1cb441d90b34 100644
> --- a/fs/bcachefs/movinggc.c
> +++ b/fs/bcachefs/movinggc.c
> @@ -156,7 +156,7 @@ static int bch2_copygc_get_buckets(struct btree_trans *trans,
>  	struct bch_fs *c = trans->c;
>  	struct btree_iter iter;
>  	struct bkey_s_c k;
> -	size_t nr_to_get = max(16UL, buckets_in_flight->nr / 4);
> +	size_t nr_to_get = max_t(size_t, 16U, buckets_in_flight->nr / 4);
>  	size_t saw = 0, in_flight = 0, not_movable = 0, sectors = 0;
>  	int ret;
>
>
> --
> 2.42.0
>
