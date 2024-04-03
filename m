Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A02F32
	for <llvm@lists.linux.dev>; Wed,  3 Apr 2024 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712159138; cv=none; b=FRMrFqpOFL1ZiDRPtd1pif6C6YIzsaiy9IH5PsMS800z5sXfTUl3OficBYer+W0N++40EnMd5HSijhddTkHpCq+m/1gGwe7oYlptfM+kao7tdRo8lCTv4Y0KQQLj4i7pVfXQVwrGZqoFmqiabI+tr359D+SoVIkFTTL5Wp/ECas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712159138; c=relaxed/simple;
	bh=zLgexbW2g6iQ/DV/NnjSU9FIqF8+vQiRbmJEWt49Ryo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoyEGR/v3Zi1TRimfBeqF2lxkbsyoG/VLEKP2Y5yQo+lmnVS3WHWMvYa8w1bgNHpplqFe6ix8xQv72C08DOMbO5wZcEOV/8M/2ewaL7IRYvZRUZDxJaseNlmdZ4fGk1RZ7V/35Eqbg6UGps4Vc5ksPWrbcUkHIibOjvgXt5wWmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jBBx5dE2; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jBBx5dE2"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c3aeef1385so4781262b6e.3
        for <llvm@lists.linux.dev>; Wed, 03 Apr 2024 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1712159136; x=1712763936; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3Q5Z2ASolvH2m9d3d+Ytjc+Iku6KsM1X3ZuAJ30QD8=;
        b=jBBx5dE2ao1/nwV8ZSd/UNeWsC+wFzSENUxSvvxN24+H8461sD7yH0P8YCJ2CzZHOu
         PsxprTqovs84uy83Y3/l4g5yIKDpKfMlyftkxrNcyk7Zn3gOrr7iEuLcOGDbJrHT2bFh
         x2XQ+5ndsDVdxeefVTYbKAjhxJRk+WoMcMM6ufu9houbfs8p3I9zjOjamPCBG/PZCaxX
         E4FWwwHVKkkdHdUrcw2fjR6VguSJbKZaWaVuiVYpiRtnlPFdNNmGPL9aYj7mBX8jv2aT
         xZhfeH7cNjAW7SU9hcnCdS19F8li3Bel4418mYJgYltFSSRF/PG7E/gdaJ1fdiTPiy89
         2Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712159136; x=1712763936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3Q5Z2ASolvH2m9d3d+Ytjc+Iku6KsM1X3ZuAJ30QD8=;
        b=pPuYKwLp1astFS8DyH47lMcCkTx1U4Kfy9W6RsqzdUzER8VeK9//Z7q3yBy/OYUXar
         nG9/pDqHZmJrksCRh3ftqr5WEbCVqBBQNS8S/2W4p4WSzC6d2bc2viGUsDFbL689vuGj
         8uKs2GoWGhSjh3ThiV3rumd0wkNK65ZfzgfJRw2jYey+BjRPoBCaV6Y8OtyI5H44hp0d
         kZVVzSZhywAmO8ksyvRcoxyX4HWtkuUNuw+HSp1CdOa4UVJpkoJ3TLMhFdnDXDoTTjFZ
         b8o16nuC4Rcwoy08QGcMHsldvxHPF+XhGY//f0Yuk80A3pTEPtXuofeqkCn0K1D89Qhs
         j2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU5UogOrfXyQb5vS9I3FzHZ+/eCBHDKclhmuKwBgoLn62wvhg28SClcrdp4tH7PoWmuyg+qJ133iMAtf+edW8QEzXk1VA==
X-Gm-Message-State: AOJu0YwS9b2KqPYNqFECag78KbxbGqeht+gKcogNlhtPvTvM3R1IkF7B
	Tn2PgXVOF4/RQDI3nTTr07w5Mba1uxdqGT0+Je9PbxE/tFmbWsAH7PczokSTEJ0=
X-Google-Smtp-Source: AGHT+IGfksz7GJje1BMwCewZcFpXfptTSRr1WBLodHQ1lUsHhWa5mSPnxk5fU+k9Rz89zSxFTjK6bw==
X-Received: by 2002:a05:6808:152a:b0:3c5:d42c:48b7 with SMTP id u42-20020a056808152a00b003c5d42c48b7mr1387796oiw.29.1712159136219;
        Wed, 03 Apr 2024 08:45:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id o23-20020a544797000000b003c3d1b47532sm2495301oic.49.2024.04.03.08.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:45:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rs2nu-007hVG-P9;
	Wed, 03 Apr 2024 12:45:34 -0300
Date: Wed, 3 Apr 2024 12:45:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 7/9] infiniband: uverbs: avoid out-of-range warnings
Message-ID: <20240403154534.GE1363414@ziepe.ca>
References: <20240328143051.1069575-1-arnd@kernel.org>
 <20240328143051.1069575-8-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328143051.1069575-8-arnd@kernel.org>

On Thu, Mar 28, 2024 at 03:30:45PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns for comparisons that are always true, which is the case
> for these two page size checks on architectures with 64KB pages:
> 
> drivers/infiniband/core/uverbs_ioctl.c:90:39: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         WARN_ON_ONCE(method_elm->bundle_size > PAGE_SIZE);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONCE'
>         int __ret_warn_on = !!(condition);                      \
>                                ^~~~~~~~~
> drivers/infiniband/core/uverbs_ioctl.c:621:17: error: result of comparison of constant 65536 with expression of type '__u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (hdr.length > PAGE_SIZE ||
>             ~~~~~~~~~~ ^ ~~~~~~~~~
> 
> Add a cast to u32 in both cases, so it never warns about this.

But doesn't that hurt the codegen?

Jason
