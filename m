Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD753FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:48:00 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b7so128807pfo.11
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u4/hZa5X5iiSrh9aM4nYzcLFV48vDhJpzjaofNxmELM=;
        b=kSvmUyBn95LRNcM6llDwG3+F1VjOFofJWmaLRoyYvU7KNVN9l1Iz9OnfHYkKJD0Hi3
         CeJMoI5ctnU4Eba9OSWo+Phxe4/M/L+6RCYSi+YbNYGMEQBESgR1WFZMdoQ0QtrjvL8s
         DAbA37Pk5B9BaRHzasmS4ixeYYG7w5I4N3bs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u4/hZa5X5iiSrh9aM4nYzcLFV48vDhJpzjaofNxmELM=;
        b=21WTZpUHW/Z7GQN1bI+fvC61kVh/3MBeTyNdVHKOLULMJGKOqjP9vJiq+ymNQi4THF
         sG4LqtnpHBHD4ViAxG4EAuUNC6ucfTiTLNqmfT2gaoR1xMYjmkNnWgT1vdKl0k10NPhd
         7MIorJlEBkDc/AVBcQFNQxsHTmUfCAjMkCYYQuRtT3FvUXs3JC85e09jSxf5UWoNgIWN
         28So6tlOpUgcgIo18ZPI4jcxnKXzDQIAbn9KHuRA0vX1ZX0h9Jnq+1hO78mU2mBkmiej
         PxEeTUSlHDcJp/5pIqLUsC3ejDx1Wn0fC6nc6TN4DeIZCW43cHtiSWF31OgQhLv4fN78
         6nGQ==
X-Gm-Message-State: AOAM531tsfMBuJ4bG40fuhVpSwHGkXcasAFt2cOVC2ra1QN81zE07GwF
	ogfjO/G59n6Ctv49dCfPUCWT/w==
X-Google-Smtp-Source: ABdhPJxqbjG40g/47sryBDttm98oA7oQ4YOMO2XbIxC6H1EYNMN/YQ+DyO1bMFlOyEBbn2QKfqFtfQ==
X-Received: by 2002:a05:6a00:170d:b0:3f3:bcdb:4883 with SMTP id h13-20020a056a00170d00b003f3bcdb4883mr6284406pfc.68.1631645280482;
        Tue, 14 Sep 2021 11:48:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k190sm11477706pfd.211.2021.09.14.11.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 11:47:59 -0700 (PDT)
Date: Tue, 14 Sep 2021 11:47:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev,
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
Message-ID: <202109141144.1AE2DDB@keescook>
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk>
 <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>

On Tue, Sep 14, 2021 at 11:30:03AM -0700, Linus Torvalds wrote:
>  	case NBD_SET_SIZE_BLOCKS:
> -		if (check_mul_overflow((loff_t)arg, config->blksize, &bytesize))
> +		bytesize = arg << config->blksize_bits;
> +		if (bytesize >> config->blksize_bits != arg)
>  			return -EINVAL;

FWIW, it's probably better to avoid open-coding the check. There are
helpers for shift-left too. :)

+		if (check_shl_overflow(arg, config->blksize_bits, &bytesize))

-- 
Kees Cook
