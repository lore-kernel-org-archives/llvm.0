Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01844B121
	for <llvm@lists.linux.dev>; Wed,  6 Dec 2023 20:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ePDSJY9Q"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c6ce4dffb5so129795a12.0
        for <llvm@lists.linux.dev>; Wed, 06 Dec 2023 12:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701894532; x=1702499332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTBTLAqDXor1l6sg34c9kbUSBjJSEI8UiBBYr9CwL2Q=;
        b=ePDSJY9QZNQ0aiQUhQsY22iZRyDBsgxdfCWLLRNa/vXVHXXT3sbksGPZmOg5vPkMkY
         HR3VFBDARTz/DeBVl6IqGophZU2M9XD+u/O+odb7yRJ/WmMnHmOsmKztE8sVMml/xbJr
         dq9nN1BInhJXd45HV55k6DtNazjB4nb0igmr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894532; x=1702499332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTBTLAqDXor1l6sg34c9kbUSBjJSEI8UiBBYr9CwL2Q=;
        b=BRZihcZHYHahoE1ju+2iOY6x1RJd+mC5Z9ATkaDwXafqqL7XZTRlEjAX015EUFn8vR
         wgpFBEayG/aeGATsHCFNRjKNe4pBHN0tdBIisILAVyGlUFDI+o9ORaVugyzOeum2uhXG
         2DfbvesYIo3Qjh+wYnjlqgLDWBQaUEFG9WFP1flhCdJuufnXk86bNhrJYaH+rJGz5qTK
         68mWWdTORM4zsBXP7Mkpo0FK8bJo0CEP9s5RDGB+4eKqLcZnlqQ+zcdACB9rPptMUXQz
         GvqroY4t3Yo5WC1hSlmRfDNHQYCgq823oa6AI/s8WOs8PgjwnF/acr/rWIzsHeN46tuU
         6A6Q==
X-Gm-Message-State: AOJu0YzbofflLQtOJP8SmOHoUrGCgvz4Yx3Nt1vmfrzWqrqKleFm+mJx
	UqNcWRU7zYnFr37lALEcBMfKNg==
X-Google-Smtp-Source: AGHT+IGCJW9aAT/9l5dWk1euSiHsIcWqvf5+MSkN2kUSEvXz1J47cG2MljPvGZxmFTZ5NhzqTZhnjg==
X-Received: by 2002:a17:90a:d796:b0:286:d42d:e7e with SMTP id z22-20020a17090ad79600b00286d42d0e7emr1213709pju.3.1701894532050;
        Wed, 06 Dec 2023 12:28:52 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fz20-20020a17090b025400b00280a2275e4bsm280195pjb.27.2023.12.06.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:28:51 -0800 (PST)
Date: Wed, 6 Dec 2023 12:28:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: samitolvanen@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
Message-ID: <202312061228.B953DE8CA@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>

On Wed, Dec 06, 2023 at 05:14:26AM -0800, Palmer Dabbelt wrote:
> On Fri, 29 Sep 2023 14:11:56 PDT (-0700), samitolvanen@google.com wrote:
> > Hi all,
> > 
> > We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> > even if the hardware supports a larger virtual address space size
> > [1]. These two patches allow mmap_rnd_bits_max to be changed during
> > init, and bumps up the maximum randomness if we end up setting up
> > 4/5-level paging at boot.
> 
> Sorry for missing this, I'm just poking through old stuff in patchwork.  As
> far as I can tell this is still relevant, the discussions are just on the
> mmap() bits (but we'd already screwed that one up and have since fixed it).
> 
> So
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> in case someone else wants to take it, but I'm OK taking that MM patch with
> Kees' review.

Yes, thanks! Please do. I already +1ed it:
https://lore.kernel.org/all/202309291454.436E19663@keescook

-Kees

-- 
Kees Cook
