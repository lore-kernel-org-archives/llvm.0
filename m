Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12D6728D
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 21:55:02 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c5c91bec75so111901635ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696024502; x=1696629302; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kFisjx+D089Bl0n+c9sa0dcFrh55Nv3CjkrAPKvHaQ=;
        b=BJPJ6FTtJdaTTBqicDAn6jA+BH+k/3Aw1eNEFojOrDu3Y/HCY7HA2Tdvzi0nQx6Q/l
         Ssj3EF4VH/Ti7IYNL++E04fjt4lD1qPtT0WdO3JONN6sf0Gbg7VmvOQaoGZMkgApk6qt
         lmzrihIIau5g3/SFUZtkw2bI0FQjYcV8lTiik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024502; x=1696629302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kFisjx+D089Bl0n+c9sa0dcFrh55Nv3CjkrAPKvHaQ=;
        b=j8sQKJnMQrGk5Xv83HAuc5NY/gQuoiivMBl65U7v3Wc5SyravoGGWc2Ev1qz+FXvFh
         Gjob0Mozg/5/J9bMMWu+dHFQgrcqrYqRHgxQWE5T7Yt30UyQuQQD7WE9lrNvcdfb4mDS
         Acif9lrhe5/DyPtwFXKSD1PlW9FZTX68pu/epC6Vu84a32O50qxot0RdeHL+n33RoPn/
         WhrikSKLO+8Sth9PekQU6g9gnOrCZq6ApQ/imlepQWAvPSjhRN2dt8N3k0Qed/V0wGX7
         mRwRKpoTbD1BVLBG+PQB/JDlyquM2U5oVMXFQgAoD0E2OF3B5Qz05Hs71jdJWbgp0Udz
         LCHQ==
X-Gm-Message-State: AOJu0Ywh3YfbHhFowgKnbRbVti+aADcR4K10HUcuOikAyZDPuvMQie9u
	Knudu689YAsl0H2RKUrNIY+WMA==
X-Google-Smtp-Source: AGHT+IGnbAGwryCCvO6jabCBmevCmJ/0eVxJN4Y82GDsZjB3QfXDLV1KZNYrwCXcUGHGoTsq/uDbWQ==
X-Received: by 2002:a17:902:ecd0:b0:1c0:c86a:5425 with SMTP id a16-20020a170902ecd000b001c0c86a5425mr6564288plh.19.1696024501806;
        Fri, 29 Sep 2023 14:55:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902f68d00b001b54d064a4bsm17338377plg.259.2023.09.29.14.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:55:01 -0700 (PDT)
Date: Fri, 29 Sep 2023 14:55:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: Change mmap_rnd_bits_max to __ro_after_init
Message-ID: <202309291454.436E19663@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-5-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929211155.3910949-5-samitolvanen@google.com>

On Fri, Sep 29, 2023 at 09:11:57PM +0000, Sami Tolvanen wrote:
> Allow mmap_rnd_bits_max to be updated on architectures that
> determine virtual address space size at runtime instead of relying
> on Kconfig options by changing it from const to __ro_after_init.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Just the kind of thing __ro_after_init was made for. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
