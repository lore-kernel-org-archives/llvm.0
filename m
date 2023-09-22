Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A242C11
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 18:23:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf6ea270b2so21946645ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695407011; x=1696011811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yr61q+Y7qYRmoBTJuHgU+TYxnPKaIi9OdQT3qJe9OKQ=;
        b=ZwHnLfEMyBGM37pgxSEpDVJ6oye1Mn1e34AfD6uV1PoYh7IYfrUlAD/8dgrFFT/mGq
         cSWNNk5lL6REt3sSrMNxy8opzSdpMkr8dlLq1MhUllH9hoBwqo5P6Lf4Thq4svAJtWxq
         vch+TQj3Ozbbr4GjCUq7NzNrRjIEHgGss0zPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407011; x=1696011811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr61q+Y7qYRmoBTJuHgU+TYxnPKaIi9OdQT3qJe9OKQ=;
        b=IIsO5KZXe1dC7KuhGgz4GYR7rDCTTpR067+aHOcsnRC3OM7AaA1RccBkiPxWqXSRMo
         m/Gx+Yjt8AIAX+2LjWZdCqA925caneB1hitZHDPWHKpUCdq2jSzEvX9vQKP4TKYYEDBP
         L06YqJg9HaS3pFzlwabxeuGrl81BRBQ8QVRhgwd1OcNh27nqpwBMT2v4nofUprbjeynf
         863TSnmZb6KLI2ur6sid6UAcLHmJfs7QnKtv0DU5PBAhdp+CiQ41yo01eikZlZjOURiy
         l68leRqFUxwOoNoA28seYC9UDPfMJoDqTaRs+lQR22f17Uts5WiNtGRGLlxUz/CJQmtO
         ZL0Q==
X-Gm-Message-State: AOJu0YzyaDaxJWpyzKszNjqVMyzglFOKo0sIoPtUSBLntYGNOlpEzU0x
	ul0w6tVTRmEUXp9aNZGIn9pZrw==
X-Google-Smtp-Source: AGHT+IEPfMe5MVG2BsIHv/EtqHgJb805J/3mFScd6v8b4SEGGTa1wBOOaNI8zST/3Yhw8KfpVcqPdA==
X-Received: by 2002:a17:902:b7c9:b0:1c5:cbfb:c16f with SMTP id v9-20020a170902b7c900b001c5cbfbc16fmr265044plz.25.1695407010837;
        Fri, 22 Sep 2023 11:23:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090274c800b001bdc9daadc9sm3775058plt.89.2023.09.22.11.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:23:30 -0700 (PDT)
Date: Fri, 22 Sep 2023 11:23:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Sharma <sharmaajay@microsoft.com>,
	Alex Elder <elder@kernel.org>, Pravin B Shelar <pshelar@ovn.org>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, dev@openvswitch.org,
	linux-parisc@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 14/14] net: sched: Annotate struct tc_pedit with
 __counted_by
Message-ID: <202309221122.74FA902A@keescook>
References: <20230922172449.work.906-kees@kernel.org>
 <20230922172858.3822653-14-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922172858.3822653-14-keescook@chromium.org>

On Fri, Sep 22, 2023 at 10:28:56AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct tc_pedit.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  net/sched/act_pedit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/sched/act_pedit.c b/net/sched/act_pedit.c
> index 1ef8fcfa9997..77c407eff3b0 100644
> --- a/net/sched/act_pedit.c
> +++ b/net/sched/act_pedit.c
> @@ -515,11 +515,11 @@ static int tcf_pedit_dump(struct sk_buff *skb, struct tc_action *a,
>  		spin_unlock_bh(&p->tcf_lock);
>  		return -ENOBUFS;
>  	}
> +	opt->nkeys = parms->tcfp_nkeys;
>  
>  	memcpy(opt->keys, parms->tcfp_keys,
>  	       flex_array_size(opt, keys, parms->tcfp_nkeys));
>  	opt->index = p->tcf_index;
> -	opt->nkeys = parms->tcfp_nkeys;
>  	opt->flags = parms->tcfp_flags;
>  	opt->action = p->tcf_action;
>  	opt->refcnt = refcount_read(&p->tcf_refcnt) - ref;
> -- 
> 2.34.1
> 

Coccinelle was not happy about the #define ...

struct tc_pedit_sel {
	tc_gen;
	unsigned char           nkeys;
	unsigned char           flags;
	struct tc_pedit_key     keys[0];
};

#define tc_pedit tc_pedit_sel

Also, it's not been converted to a proper flexible array...

-- 
Kees Cook
