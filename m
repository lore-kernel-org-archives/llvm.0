Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158322EFC
	for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 21:43:45 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34bbc5eb310so922985ab.2
        for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694641424; x=1695246224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uTbHoVjqIh4YniElhtNqUimTSs8A7qRExDkzz0sEF0=;
        b=utTYbnohAhuqUgkYBXTJpnObsJz7emy71QKrflZnlffaqsJm8odOLOZIwgffvIS7w5
         3aaZWhaEmheIy/x1Spn0AVmxxVfRKRIqu7MbuUx//RhOLB28evwCQulyt43g8fmErxOX
         +9PcONHfOTTqrKDLxSBsq/Ax/V2q+wyJfIkeMDQyk1/MOZUv2reCvbtvjIRTcA0sc4Ac
         fdEkUI4z5L6BGsou1h2zqW93H/3oSLhnPjliW+9WEBgXcJBQgi9ATqTJ+uRwYIdu9eOk
         oeA+1FGu7AX3DOcr3a5l1aLbO8wMzT/CxUChJhi75m+RoJezWS5oi+c+eW5oNbRlzSQD
         DW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694641424; x=1695246224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uTbHoVjqIh4YniElhtNqUimTSs8A7qRExDkzz0sEF0=;
        b=SroEK+NDR9ZwQ4XeQcYDWA4tbrAi2KxV+y3MbSj8ZRRsFdrHjFJtaMG5QG+711tUIx
         +PtpcfPkNTzYecDLb7DaT05ylEzo6Cfnp9uRnmnMmhPp91mf0NVqP70UaPWG13zZO/Pt
         T4V7TCpxFb1tdCrBcxpZrHCDsTEBIeNa0mYntUkRO47psLwsLgxST00r67mbtDHHarTs
         Ii1/rIcE9luKxeiRvD4iKu5TJkRTflEe9M5nl27wVLOBPg10uuDWHCgD5/UmI3hRD0Sg
         y4upJp7CuMMnM3hjiWF3P1iB1vqVbtBahyyxMfrcdlSX/nO0NU0ec+rovsAjdPqmmHal
         25ZQ==
X-Gm-Message-State: AOJu0YxXjFcWi864Cr5AfZ7qqwERuewnZn7qHygIAvVV5i1PRSaw2Sea
	6Rkrek85hsotsDWOGlhnTOVfQg==
X-Google-Smtp-Source: AGHT+IFO/zPVL+GskkRXe3VhmvyBnlW+kHMrQL8DvF+HjBFPQoUGhuvzyAvTppC+0h0D/069z/uhyQ==
X-Received: by 2002:a05:6e02:1a87:b0:34c:cc37:3064 with SMTP id k7-20020a056e021a8700b0034ccc373064mr4518209ilv.15.1694641424661;
        Wed, 13 Sep 2023 14:43:44 -0700 (PDT)
Received: from google.com (26.103.132.34.bc.googleusercontent.com. [34.132.103.26])
        by smtp.gmail.com with ESMTPSA id e17-20020a056638021100b00431824abeccsm26753jaq.42.2023.09.13.14.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:43:44 -0700 (PDT)
Date: Wed, 13 Sep 2023 21:43:41 +0000
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kent.overstreet@linux.dev, bfoster@redhat.com,
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 2/7] bcachefs: Fix -Wformat in
 bch2_btree_key_cache_to_text()
Message-ID: <20230913214341.7qucftdltsljrzpf@google.com>
References: <20230912-bcachefs-warning-fixes-v1-0-a1cc83a38836@kernel.org>
 <20230912-bcachefs-warning-fixes-v1-2-a1cc83a38836@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912-bcachefs-warning-fixes-v1-2-a1cc83a38836@kernel.org>

On Tue, Sep 12, 2023 at 12:15:39PM -0700, Nathan Chancellor wrote:
> When building bcachefs for 32-bit ARM, there is a compiler warning in
> bch2_btree_key_cache_to_text() due to use of an incorrect format
> specifier:
>
>   fs/bcachefs/btree_key_cache.c:1060:36: error: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'long' [-Werror,-Wformat]
>    1060 |         prt_printf(out, "nr_freed:\t%zu",       atomic_long_read(&c->nr_freed));
>         |                                     ~~~         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |                                     %ld
>   fs/bcachefs/util.h:223:54: note: expanded from macro 'prt_printf'
>     223 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
>         |                                                               ^~~~~~~~~~~
>   1 error generated.
>
> On 64-bit architectures, size_t is 'unsigned long', so there is no
> warning when using %zu but on 32-bit architectures, size_t is
> 'unsigned int'. Use '%lu' to match the other format specifiers used in
> this function for printing values returned from atomic_long_read().
>
> Fixes: 6d799930ce0f ("bcachefs: btree key cache pcpu freedlist")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  fs/bcachefs/btree_key_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/bcachefs/btree_key_cache.c b/fs/bcachefs/btree_key_cache.c
> index 505e7c365ab7..a74ee6d8a7cf 100644
> --- a/fs/bcachefs/btree_key_cache.c
> +++ b/fs/bcachefs/btree_key_cache.c
> @@ -1053,7 +1053,7 @@ int bch2_fs_btree_key_cache_init(struct btree_key_cache *bc)
>
>  void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *c)
>  {
> -	prt_printf(out, "nr_freed:\t%zu",	atomic_long_read(&c->nr_freed));
> +	prt_printf(out, "nr_freed:\t%lu",	atomic_long_read(&c->nr_freed));
>  	prt_newline(out);
>  	prt_printf(out, "nr_keys:\t%lu",	atomic_long_read(&c->nr_keys));
>  	prt_newline(out);
>
> --
> 2.42.0
>
