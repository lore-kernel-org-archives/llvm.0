Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FAB668
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 20:57:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c5cd27b1acso137730645ad.2
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696107434; x=1696712234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8ShV6E/8QsJOCzMhx8IRO8TVLv4FnaEtvtGItg5wE4=;
        b=IIdnCECaFanneAcDCsBjlmfwPaY1wUBUiEveioywgCKf5WQUAPV4pI/0F1HgpsaZPN
         INCzi3LWyu1GqqtE+0sFqDZAdokZG9y1aAIdsCZ8Pr4eLhrw/4BSQT4w1Lu5N2rtepNB
         YR68f4BABtFPSLaF5q7gx+SxuezCOVZgqwfF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696107434; x=1696712234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8ShV6E/8QsJOCzMhx8IRO8TVLv4FnaEtvtGItg5wE4=;
        b=vSNTw4UqdPBw4+Cuu5LUmz44za8D3loJd3ng//tAu9JXoeyP/biZToxw5aklzcmPjd
         j69SGR0URFvEX41FR4shVjna6Kz9GQzSnsL1l6C8oMabOY4bDDfWj2VnEu0woEQGHv92
         duDJ9PUNY1nu2gnrCBPVv+HNS+pQ8jZe/tTnN9AZInrBnw0Qi1f88P6cmxYi8yAAuQS4
         suQVI4g9r1XkybfpuXwWa3xV4+Yma+MgslyE7qcJgIgnoxvLTPW8/bQBnxnHoPRYTTWj
         vnsaZQhZFYeLxdyO5fGTmMMmn66vwssumgsd3sZ1ljSu5M7PypaeAksokF0bBXNdFXyG
         OU3w==
X-Gm-Message-State: AOJu0YwVAE+8IltqgYtHAEZdB/50VNFIS8UNOb5oDfDLOuEeeKqlXUZr
	0I2+m3Q/xdQkJeR+qaSvxUFKTg==
X-Google-Smtp-Source: AGHT+IF0qsPtMg/V1LWALu0KMhdTxitqAJp89szdV7WijDpDZ83pa5U+dzDtHVCD8w4avxADg/CUcw==
X-Received: by 2002:a17:903:1247:b0:1bf:8779:e045 with SMTP id u7-20020a170903124700b001bf8779e045mr9024419plh.50.1696107434169;
        Sat, 30 Sep 2023 13:57:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b12-20020a170903228c00b001bbb7af4963sm19102341plh.68.2023.09.30.13.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:57:13 -0700 (PDT)
Date: Sat, 30 Sep 2023 13:57:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Message-ID: <202309301342.5B5BED40A1@keescook>
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>

On Sat, Sep 30, 2023 at 11:14:47AM +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].

Nice!

struct comedi_lrange {
        int length;
        struct comedi_krange range[];
};
...
static const struct comedi_lrange range_rti800_ai_10_bipolar = {
        4, {
                BIP_RANGE(10),
                BIP_RANGE(1),
                BIP_RANGE(0.1),
                BIP_RANGE(0.02)
        }
};

I'm struggling to come up with a way for Coccinelle to find this kind of
thing in other places...

> In this case, it is been spotted because of comedi_alloc_spriv().
> All other usages of struct comedi_lrange seem to be static definition of
> the structure that explicitly set the .length field.

Ah-ha, I found it in drivers/comedi/drivers/das16.c das16_ai_range():

                lrange = comedi_alloc_spriv(s,
                                            struct_size(lrange, range, 1));

I was also able to find this:

union jr3_pci_single_range {
        struct comedi_lrange l;
        char _reserved[offsetof(struct comedi_lrange, range[1])];
};

Which looks a lot like DEFINE_FLEX:
https://lore.kernel.org/linux-hardening/20230912115937.1645707-2-przemyslaw.kitszel@intel.com/
But that above for stack varaibles rather than globals. But I'm way off
topic now. ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>  include/linux/comedi/comedidev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
> index 0a1150900ef3..c08416a7364b 100644
> --- a/include/linux/comedi/comedidev.h
> +++ b/include/linux/comedi/comedidev.h
> @@ -633,7 +633,7 @@ extern const struct comedi_lrange range_unknown;
>   */
>  struct comedi_lrange {
>  	int length;
> -	struct comedi_krange range[];
> +	struct comedi_krange range[] __counted_by(length);
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
Kees Cook
