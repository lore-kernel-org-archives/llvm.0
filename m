Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58D14273
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 18:58:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-262fa79e9b3so614608a91.0
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 11:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688065125; x=1690657125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtoO7wxtO66WKs7HcsIYHnyEK9qS2ptNje4197iQ+WQ=;
        b=FqDckJGHOAILns8g8SssjEEqPgFGcqCyYEpxv0IIM+kBYWw18HQ3wDZvDveym6Iexv
         MuHvgZIebcIjQg0yrloXjPPrh9JqXGUM7vT/pkXe7VZ3HOOu4XClZnKHCXl4HzTZj6XZ
         brONgjMBygrSxQDYjk6T4XM5k4ImQ0xpweSjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688065125; x=1690657125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtoO7wxtO66WKs7HcsIYHnyEK9qS2ptNje4197iQ+WQ=;
        b=dbTdCyTIYSi2I63Zq06Yy2aInxLY14ACDFYGW4GuANnEuouZLhBXWn7fMbPIrQSWbG
         +7ieN4opdYL320FS/aWhbJPIRCzOQF/c4ErVsetUzWdURVMij77gVgR0EVNrEjph/Kjl
         4lNvU4FWxZlW44ZYJemK2m76MfjGahOnmCT9jvs5VBIh0/RT3wYbcw2sa9ep1NWZovQ8
         fob1FCzuiFko/7REzs7DgeLckFUWkKM/qKu+78HYO8+xeHC96xd6Pq1RfxUx9GqEV8/K
         hpv5DWzzyoGfasvdaWNJeAPHOOBxi7HSpF15xFzKnOw+FD+wiVhKVUVO9LqSoTwWcc2I
         3W4A==
X-Gm-Message-State: ABy/qLbd5OjQilb3UEWLvBvzZO0X5iE3bNsqRWcQpdzjhOeq6HJ+dJiw
	cY2iD3V/jn5h9Z2awsx9hadx8A==
X-Google-Smtp-Source: APBJJlE2bSL3RaiK4vRaauIvsS0try4vm6SYiy+L//V/kX9bwLc2aK/E9ffrCixlwmqbMMkIt+XsuQ==
X-Received: by 2002:a17:902:f544:b0:1b5:2b12:6f50 with SMTP id h4-20020a170902f54400b001b52b126f50mr121980plf.12.1688065125035;
        Thu, 29 Jun 2023 11:58:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x3-20020a1709027c0300b001ae5d21f760sm9382247pll.146.2023.06.29.11.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 11:58:44 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:58:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, linux-usb@vger.kernel.org
Subject: Re: UBSAN spat in valid xhci code in Linus's current tree (6.4+)
Message-ID: <202306291147.4CE126CE5@keescook>
References: <2023062945-fencing-pebble-0411@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023062945-fencing-pebble-0411@gregkh>

On Thu, Jun 29, 2023 at 05:36:51PM +0200, Greg KH wrote:
> Boris just reported to me a UBSAN splat in the USB xhci driver in
> Linus's tree that wasn't present in 6.4-final, and given that no USB
> changes are merged yet there, I was confused.
> 
> Turns out, I think you all missed a "variable length" structure in the
> xhci driver, which UBSAN is calling out a being an overrun, when really
> it isn't (it's just written that way...)
> 
> The splat is:
> 
> UBSAN: array-index-out-of-bounds in drivers/usb/host/xhci-hub.c:231:31
> index 1 is out of range for type '__le32 [1]'
> CPU: 0 PID: 1556 Comm: kworker/0:2 Not tainted 6.4.0+ #7

This is fixed here, a couple weeks ago, but maybe it missed your tree:
https://lore.kernel.org/lkml/20230614181307.gonna.256-kees@kernel.org/

Would you prefer I carry it?

> So perhaps 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC") should be
> reverted for now?  Or this field fixed up to properly be marked as a
> variable length array of at least one entry?

We've been turning these things on further and further so we can catch
stuff like this (and we did while it lived in -next). FWIW, it shouldn't
cause any problems beyond the splat (i.e. everything should continue
working normally).

-Kees

-- 
Kees Cook
