Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B914535A
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708118363; cv=none; b=QoRtRkTmJFxgyIfLAtD+Z981HD+jM9drlhvlMro2WZdpGg/fMtozXXB5i1Fy9OQewSNB/tkh5kCXCV7jfnUR3XTvmmbpLD8FCLXHbowr8HPOf5+K7+m+XZwaBhfFTDq8IYOut4BXBilWbhj9htXEl9xda2w0k41Zt6A/7lHcQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708118363; c=relaxed/simple;
	bh=pjViwhXqVkFuRcb9TtMCBqAXy9IB1rtSAVc+/tWHUoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRsOXr3HTxulqNFnVihQhOjVFcoE94A18Idfh7r4EdqZ2wnYBW/Y11AsXMYfsB4qJklZuVuqn0Whd7FS3OdUX0YhUDJhsOeldURa34bdxDsUFSLohRmesNhybOx41sl5/13bjt8q3sTQMQ2Cl5EJhizrBdIXoXZ0XO4y+S48IzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c/fLlohj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c/fLlohj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so2046448a12.0
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708118361; x=1708723161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Slargkifk+xN9eeRz4eeZrRCV6UdKDbpUow5tWWQ8Nw=;
        b=c/fLlohjkjiciV1yybn2HLTNmY3NsT2C3heUBTo06D+C2DR5HzEYFRGN12mw3dY+Sc
         bkWXcV7yJ/6iFXz2XWIoJbPH95qLGbjHOA80IRsMZtVFecO5ah7mUA3AeVzUbOTNJp5X
         QHYtsZ8ayZRM7/Wg3nNlwm9wlk9Qr+23pALn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708118361; x=1708723161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Slargkifk+xN9eeRz4eeZrRCV6UdKDbpUow5tWWQ8Nw=;
        b=o3TwR7f+u/h4TCAA9SPXv08qAH+ddi+ZV8p+BLH+kanm+4DVrxPZgMKp7Yz6Xktika
         QS5HoIo0alKYoC8mrsxmYQxg/S0MDNUf22NjTpubVdTH+l3rgL/82ciiwWHpKohc0qNo
         kMhaPp7a3VEUGE84Z45z67Kvu0PDJzFg8xkfmPcTSalkpDfass/Bx4dT3Ng+UyLVcB/Y
         CkKK5Ox8bENRQ4X834JJfu+b1c8hxjIbhTcWCoiJr1Vq8turaUHZBcUdujKL4OMumBKs
         DlNlkRSwKprOn+eNz5rYBYoeKQCynT+lVP5EycIYMld+n9dHNgHXnwpjp6NbBa/k8HIW
         y7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIbGYwZh1A9j28NVT3xveCNR72ddnk0a9S8+3iBKGhzRSeOPxVvdL2pF7DAMyPFOnRCrGX+dFrUu3EYqsFzxPVee4fZA==
X-Gm-Message-State: AOJu0Yx72/NojOs0CSYqaIKdc9sjAVG8caNuOCMF/aBLXBeXBIPhZkUP
	PddcLODwmxMoXznONYXKsa1PFH3qkY1uareq8y6F2eaYf1u5SK2BRaxXEYmSBg==
X-Google-Smtp-Source: AGHT+IHmIetBf12lZgnCIBsuyMKApScxQdHnKJTRQax45DnTFQUW8k5/OMVTOg+jgfmD8hQL5KfA0Q==
X-Received: by 2002:a05:6a21:670b:b0:19c:9b7b:66a with SMTP id wh11-20020a056a21670b00b0019c9b7b066amr6805585pzb.49.1708118361358;
        Fri, 16 Feb 2024 13:19:21 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id kq15-20020a056a004b0f00b006db05eb1301sm395754pfb.21.2024.02.16.13.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 13:19:20 -0800 (PST)
Date: Fri, 16 Feb 2024 13:19:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Leon Romanovsky <leon@kernel.org>, Lin Ma <linma@zju.edu.cn>,
	Simon Horman <horms@kernel.org>, Breno Leitao <leitao@debian.org>,
	Tobias Brunner <tobias@strongswan.org>,
	Raed Salem <raeds@nvidia.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [RFC] xfrm: work around a clang-19 fortifiy-string
 false-positive
Message-ID: <202402161301.BBFA14EE@keescook>
References: <20240216202657.2493685-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216202657.2493685-1-arnd@kernel.org>

On Fri, Feb 16, 2024 at 09:26:40PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-19 recently got branched from clang-18 and is not yet released.
> The current version introduces exactly one new warning that I came
> across in randconfig testing, in the copy_to_user_tmpl() function:
> 
> include/linux/fortify-string.h:420:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>   420 |                         __write_overflow_field(p_size_field, size);
> 
> I have not yet produced a minimized test case for it, but I have a
> local workaround, which avoids the memset() here by replacing it with
> an initializer.
> 
> The memset is required to avoid leaking stack data to user space
> and was added in commit 1f86840f8977 ("xfrm_user: fix info leak in
> copy_to_user_tmpl()"). Simply changing the initializer to set all fields
> still risks leaking data in the padding between them, which the compiler
> is free to do here. To work around that problem, explicit padding fields
> have to get added as well.

Per C11, padding bits are zero initialized if there is an initializer,
so "= { }" here should be sufficient -- no need to add the struct
members.

> Since this is a false positive, a better fix would likely be to
> fix the compiler.

As Nathan has found, this appears to be a loop unrolling bug in Clang.
https://github.com/ClangBuiltLinux/linux/issues/1985

The shorter fix (in the issue) is to explicitly range-check before
the loop:

       if (xp->xfrm_nr > XFRM_MAX_DEPTH)
               return -ENOBUFS;

-- 
Kees Cook
