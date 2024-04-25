Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDC14E2CD
	for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714065361; cv=none; b=ceo9vLuUuUvoUy+6BinLq+XlUKm8UIa2hIEUhbZNcJfImtnMu2WUuSJOQDiKsqUSlx6Ylz9ro07+KhXxulgPoWcisIiYiTaT3oZYFl1wg+OwHE1+9OJVTBq1Yyoe1lOC8HeRpda72rL42WHhHTonPCHxB1kiuhIYx/wnlYVkRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714065361; c=relaxed/simple;
	bh=loutFTRPxrxYr3/PG7rK+RIYvqgawCw+3TUN0V/RE+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skr3xRzKRnr/J8oyYptMpE1zuh6CMrRs2UTs6Nv6V4R966pTjhQ5ZD7TX9a6a5aB75BWZq2b4Aei9S5SlRqmusOrL19oC63Gt+A398M8GwAu28rt2l4I076xRutiTkZwqewcewk5WGC+F/Mymj92CMGh8xuWOknx1cvlExiyq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xk8m164E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xk8m164E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e8fce77bb2so9674905ad.0
        for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 10:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714065359; x=1714670159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVoFOxCV1JHDP2aoF03ZloAG5l88Zzw+9lsvPKG2m90=;
        b=Xk8m164Ej3WvdRl0rtf2kR1QfU/kOACT0/Y8zlHmx+zri+MkTiMvocHrP0TAE4zqpE
         vfLwwMJGLFcSvKC47EUyoyy3h14Uz5ZLEptFXOAwb1iu6yI3Daxends2IIBjnP2GZHkS
         n7Rh3itdQ2SwL4y1zKSPiS/xOn5dhybdY50/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714065359; x=1714670159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVoFOxCV1JHDP2aoF03ZloAG5l88Zzw+9lsvPKG2m90=;
        b=GFs0g1CQtp668lmFsxUFGiwnePt2EWxsaEmm61vOmMMtYPjUlaEzK11hq0v5MwhgSn
         cgDqO8neEwMsPhRJo0qTF9boSkXgPWO/AZ5Y+dJ6NvEH3TROW2tbH+oi/vNJQVnjTCA6
         csZ88flmJZBHQFXVU5yi5CqUrFeOU1uN1PsE17Kxm133loeAaNPj3DRYAqhzO41U5Lra
         WoJR9/IWihe54RaLrcfpzpW0WfkrbI4OsyCo72ZBjCnyDQ6+q3nNn6ioA0tMt2ZRl3bb
         3/InkYvWr4BQcAWmWNbTzuG1Iq0/GeHGD8qO/b80KH8x4egg25/nXEj7cWNbUzuA4pTe
         b58g==
X-Forwarded-Encrypted: i=1; AJvYcCWyPnDC9bveKTEylm61i9HlZ60OojpFidL0Oe8OTSoZ7XyXBIsrZH/EjX4wCdMDa4Qmml0Z64/Fp3Gqz7XVaqPHtNVm1w==
X-Gm-Message-State: AOJu0YzDWZVgqxqjES0N79wbRPThN7j+a8Z9j8tJ84zlv+5udE4tEdNo
	nIExxM2wKFGDEJw5iGj3ePb2UFW9m7w4RdE5CXptDl3zJDJzlz7+Sjn3oNiLCg==
X-Google-Smtp-Source: AGHT+IFTVJMb3BdwwAwsZ2j36LZ7tJkEJr9FFByumTo4ENFk4yglK2iF8e7h1wGaAyCSClq9Nhgm1A==
X-Received: by 2002:a17:903:25cf:b0:1e9:668d:a446 with SMTP id jc15-20020a17090325cf00b001e9668da446mr172628plb.20.1714065359234;
        Thu, 25 Apr 2024 10:15:59 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b001e511acfd0esm13979187plg.140.2024.04.25.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 10:15:58 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:15:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, patches@lists.linux.dev,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: bcm: rpi: Assign ->num before accessing ->hws
Message-ID: <202404251015.46D8BE1F1@keescook>
References: <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-0-e2db3b82d5ef@kernel.org>
 <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-2-e2db3b82d5ef@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-cbl-bcm-assign-counted-by-val-before-access-v1-2-e2db3b82d5ef@kernel.org>

On Thu, Apr 25, 2024 at 09:55:52AM -0700, Nathan Chancellor wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer about the number
> of elements in hws, so that it can warn when hws is accessed out of
> bounds. As noted in that change, the __counted_by member must be
> initialized with the number of elements before the first array access
> happens, otherwise there will be a warning from each access prior to the
> initialization because the number of elements is zero. This occurs in
> raspberrypi_discover_clocks() due to ->num being assigned after ->hws
> has been accessed:
> 
>   UBSAN: array-index-out-of-bounds in drivers/clk/bcm/clk-raspberrypi.c:374:4
>   index 3 is out of range for type 'struct clk_hw *[] __counted_by(num)' (aka 'struct clk_hw *[]')
> 
> Move the ->num initialization to before the first access of ->hws, which
> clears up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Looks good; thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
