Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61371362
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657180259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6vKb5qtW2WQk3PF9/RN812iqCXsUylPTfCM4P31gZ0=;
	b=W8F5QWNa0nBSyhlfKt81XL2p2cU9RrdlWoTZldZHDFF5L9L6p9nM2lNbWepA5q34Zd7+rO
	OjlNF99EJ8IYDyhVGy+Z4nGP6duCIttt6S4EML3XdK+5x6+fMFcMQ6S7suc8hOIqvuyELc
	3R6biD4mHgakvHsQStSesI+H1p5/Kgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-XzDAm2DeOaShg64PpEZQ1Q-1; Thu, 07 Jul 2022 03:50:56 -0400
X-MC-Unique: XzDAm2DeOaShg64PpEZQ1Q-1
Received: by mail-wm1-f69.google.com with SMTP id o28-20020a05600c511c00b003a04f97f27aso9187528wms.9
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 00:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+6vKb5qtW2WQk3PF9/RN812iqCXsUylPTfCM4P31gZ0=;
        b=KNzPtg4fYj8p57Ea4Pc96I94uRA46f/pGPYRrtsxndksE4kUDNiWoqgYM/bBwUm1ZM
         uABZRNUwU34P5jaeLznlple3/6Fq5shN0XE9FtKKLo0tt+Hm0GOP1ncAP1lXAyDN/UR3
         MvIzVA1XlSjgWmmElyFoaS9psHdBYZsBfppaNLY3btZsKFceYAJkobRH0v+3hHqa7guq
         HwmH9GLouNZieHNTQvRx78qisWwP7G1Gg65eBdr6WGSeIBK0Aa+M0W90eqWUH6XsClba
         COWez5d8QsOe+l8aALkv5+Hk0NtFgHrnojWbV1AxG0kPV1Hopa1/Pg409DpkzMN7RTAi
         XwaQ==
X-Gm-Message-State: AJIora9+TvCHmJcNYLh7gg/69es3qmXeXvIABoDwL9Vu8Ie1z76BqbGl
	5P4WlqOZO+/k1Zi9f2Tr1nIqhq0duFC5AINF+D48xeiQgRpN4lJ8Ru+4PfLcCz7XOnqWEbQZ3Tz
	tcdOhiv8m6OkxeQ==
X-Received: by 2002:adf:fa04:0:b0:21d:1864:3172 with SMTP id m4-20020adffa04000000b0021d18643172mr44359079wrr.292.1657180254794;
        Thu, 07 Jul 2022 00:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+oP8nKMiKtM5JWiNW2EmP7v5KZWVhT1rv4ikXnOMyupFZ/UG6Ka+8OsYj9pCbnG7pzppYQQ==
X-Received: by 2002:adf:fa04:0:b0:21d:1864:3172 with SMTP id m4-20020adffa04000000b0021d18643172mr44359057wrr.292.1657180254605;
        Thu, 07 Jul 2022 00:50:54 -0700 (PDT)
Received: from debian.home (2a01cb058d1194004161f17a6a9ad508.ipv6.abo.wanadoo.fr. [2a01:cb05:8d11:9400:4161:f17a:6a9a:d508])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d5146000000b0020fcc655e4asm38297650wrt.5.2022.07.07.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:50:54 -0700 (PDT)
Date: Thu, 7 Jul 2022 09:50:52 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Justin Stitt <justinstitt@google.com>
Cc: James Chapman <jchapman@katalix.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] net: l2tp: fix clang -Wformat warning
Message-ID: <20220707075052.GA3912@debian.home>
References: <20220706230833.535238-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220706230833.535238-1-justinstitt@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gnault@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2022 at 04:08:33PM -0700, Justin Stitt wrote:
> When building with clang we encounter this warning:
> | net/l2tp/l2tp_ppp.c:1557:6: error: format specifies type 'unsigned
> | short' but the argument has type 'u32' (aka 'unsigned int')
> | [-Werror,-Wformat] session->nr, session->ns,
> 
> Both session->nr and session->ns are of type u32. The format specifier
> previously used is `%hu` which would truncate our unsigned integer from
> 32 to 16 bits. This doesn't seem like intended behavior, if it is then
> perhaps we need to consider suppressing the warning with pragma clauses.

pppol2tp_seq_session_show() is only called for L2TPv2 sessions, where
ns and nr are 2 bytes long (L2TPv3 uses 3 bytes, hence the u32 type in
the generic l2tp_session structure). So %hu shouldn't truncate anything
here.

However %u doesn't harm and is cleaner than silencing the warning with
pragma.

Acked-by: Guillaume Nault <gnault@redhat.com>


> This patch should get us closer to the goal of enabling the -Wformat
> flag for Clang builds.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  net/l2tp/l2tp_ppp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
> index 8be1fdc68a0b..db2e584c625e 100644
> --- a/net/l2tp/l2tp_ppp.c
> +++ b/net/l2tp/l2tp_ppp.c
> @@ -1553,7 +1553,7 @@ static void pppol2tp_seq_session_show(struct seq_file *m, void *v)
>  		   session->lns_mode ? "LNS" : "LAC",
>  		   0,
>  		   jiffies_to_msecs(session->reorder_timeout));
> -	seq_printf(m, "   %hu/%hu %ld/%ld/%ld %ld/%ld/%ld\n",
> +	seq_printf(m, "   %u/%u %ld/%ld/%ld %ld/%ld/%ld\n",
>  		   session->nr, session->ns,
>  		   atomic_long_read(&session->stats.tx_packets),
>  		   atomic_long_read(&session->stats.tx_bytes),
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
> 

