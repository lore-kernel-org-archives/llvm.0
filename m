Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902856728D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 21:54:08 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-564b6276941so10636952a12.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696024448; x=1696629248; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHH0ku3cnEfuovvq4TN+nU7rjq4fes2yQy9ZicPmfy0=;
        b=Xa06eZzQMTUhWcMHaBF4MEUi/tbQfYTM6dQfG5HYAWtAbCxtxXFfdEPTpn8TAQV9wq
         mQIQpugQGsvupNWy2BzFVVV2WpSqbUECqksXotMX1LkHMgLXCfvbUe/HD1rrcB3FwmN9
         7HHjqybgUbTak16kZ/b16n//LyPnei+emGgTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024448; x=1696629248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHH0ku3cnEfuovvq4TN+nU7rjq4fes2yQy9ZicPmfy0=;
        b=atPl/ZM++iebHBN+dgaGGFVDjlzW5h10Bga4htWMy32VbuK9b17kvVS8sLosIFZgoZ
         rotQONFL8jllnMHkBUUQiMNCsfhX8+VQdCJGjWqaclDAQ7L0aoqIxgUeENTK+oGreC9i
         L2/LRUBWE4IY2vm7XutG+6s8wTO3iMMGRDvSEGaD00FlMDmYevmQb5qz9cZlL8ttmvAZ
         pyj2/kWhCo/eGqL7kYBNtWGLVcUX12OGTlZO1V8XQVY/MhzSS9bJkTk6hnuelTl7cwey
         xhLECvTVHEN6BHpqMZMs5RmbPJO/Hxam/XwRCGZTkUopqY3UtSJ3Rj7NVUjQvwDpbQx9
         PO5w==
X-Gm-Message-State: AOJu0YyxdodCTX50QpWnVWbDxxRuGlp1GVdbk5YMo00BqfptpW5nGLsu
	RLzZKzIGpO2HAkPYm0/LjOOR9A==
X-Google-Smtp-Source: AGHT+IHoF/OLpRNDzLcj85xtbvZ3DJsBh49hVBXu73MEqXR3MZRoTXPQbKi7O4iIRyczmIbUISS/lw==
X-Received: by 2002:a17:90b:8c6:b0:26d:2bac:a0bb with SMTP id ds6-20020a17090b08c600b0026d2baca0bbmr5064809pjb.6.1696024447861;
        Fri, 29 Sep 2023 14:54:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b00273fc850342sm2114438pjb.20.2023.09.29.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:54:07 -0700 (PDT)
Date: Fri, 29 Sep 2023 14:54:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Message-ID: <202309291452.66ED9B4D83@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929211155.3910949-6-samitolvanen@google.com>

On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> potential bits of mmap randomness on the table if we end up enabling
> 4/5-level paging. Update mmap_rnd_bits_max to take the final address
> space size into account. This increases mmap_rnd_bits_max from 24 to
> 33 with Sv48/57.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I like this. Is RISCV the only arch where the paging level can be chosen
at boot time?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
