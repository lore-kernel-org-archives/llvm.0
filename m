Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657A24F47
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 19:08:13 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 128so17076982pga.1
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MP4BRb8G//EPCRvu2R9JlpbDgZN8CsDsH/DZd17igRc=;
        b=dHoOR0YlYQtvqMoSMwAA7OBKvtTSbcXODHS/Tc0Vwebvsj7WgnjwO2vkTQMnOUerVl
         Sez8FzszOPreD3wyT3vR75Ik/paR44SwUNoobbY4CvGd1x83IeWfcpIid0cOTD4cGxY+
         RAmG96gPfVD1McsBaKMas2XcZK5sNRuZplaak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP4BRb8G//EPCRvu2R9JlpbDgZN8CsDsH/DZd17igRc=;
        b=Lk9ZF5CBauKeqnmPs8aQxu2Zz7ReVsd2YaZM4JFWxHa76TpyBFh35KnRcGKG//eGp0
         vRt+Wzl5Ae++3aPFToglQWE7n4MyLM9hm285AZaGhyHeqCToTLX1ObFBpGhharqboAsn
         g8BuI6BQgpZQkZ3qPvhZn7tW1f7uZKRjeUERAIMkmIWDxH++VvtOQF6+EpKTGhZvxgy0
         oSe5nleClXUzk85njtdOxyqENS9bIhEaw4nKLG3hjNXwvb41fh28/7wxdBc2h0KjuxI4
         bgq4jKO+Wd7k3UgUyjEbSiit9RWHwcYdC/x0QvUTSYvH73QL0zS0vlMmkqQ4aIUMFhJP
         kn5g==
X-Gm-Message-State: ACrzQf0zg+Y9ox2oLB5aQXGvv1kixusFBRrfw2dvCNk47yyOc3hS9eWo
	OoqZNzXV7EqPUkBxR9phgHCgLyX8McDYtw==
X-Google-Smtp-Source: AMsMyM4IPUBovsejFQ8GfXnwAMEHsuPP2poW/HAI5FGF+wlubnRaKN5w5zkxEia8sMYYO6FsV2usMA==
X-Received: by 2002:aa7:9624:0:b0:56c:8c13:27bf with SMTP id r4-20020aa79624000000b0056c8c1327bfmr26851190pfg.20.1667416093082;
        Wed, 02 Nov 2022 12:08:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s4-20020a17090a2f0400b001fd76f7a0d1sm1779954pjd.54.2022.11.02.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:08:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] net: ethernet: ti: Fix return type of
 netcp_ndo_start_xmit()
Message-ID: <202211021208.F66688DFF1@keescook>
References: <20221102160933.1601260-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160933.1601260-1-nathan@kernel.org>

On Wed, Nov 02, 2022 at 09:09:33AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/net/ethernet/ti/netcp_core.c:1944:21: error: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .ndo_start_xmit         = netcp_ndo_start_xmit,
>                                     ^~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
> 'netdev_tx_t', not 'int'. Adjust the return type of
> netcp_ndo_start_xmit() to match the prototype's to resolve the warning
> and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
