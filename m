Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920671C14
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 16:38:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c724577e1fso51248245ad.0
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696091895; x=1696696695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ll5RgjPd4WERjGYzQzNFee7tOPsdSELqkfPGuXCqmQY=;
        b=ChyJa3MLfn/2lzECCSdW7KBZwvcXK0E3yQN74x3PSlXbOKek7MLjg+aJXFsxPIDZaB
         XS5EtLO20m7ATX16fg1LZm+knDLTwpKkeQfgsaumFcB1y8Nc2J71/wyrwVvU4C4FVdEo
         GIoLlBiUmE6Qq/Qg+QB84JqbE1Y/SVHvns4KxdcC9J8QjNDUBlUqlaG6LFcbMEpk6b9P
         TkxwEkK4ah4OW1DGj7zZlYJ7zCH1onGRVb7rEbUwoYRFhUTbt8TMoLwQQPUoLKuL9LRj
         EXchi+lEGDM7UQm8thDIXu7N7NMiYv2vOJCDDI1atgeQnpNZLvV2OfeDYnwivrc0BOkx
         Ad8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696091895; x=1696696695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll5RgjPd4WERjGYzQzNFee7tOPsdSELqkfPGuXCqmQY=;
        b=khNsNo0EqYAdka417iRAVhnBPmLcB+yQcf0lJ7wbGPN37rc4LMyiV7UHMw3NWaQ+ly
         ohDaLr/chjeOonIxUuj45JykUO3b9TFpwiG3PObfpM4SH4KUs2XeWlzA8zM7Q9ZOBiY+
         UyhYSl2c7PcdTSfxaUxIDUM6sFd0TmVZOhZrKIqYgWVSI6XiB4phf+/Aj7HG9NDYgbb8
         IgSVY/rQshKni7wLQdyl+Oe0qB28yvvF3zlODCPHMpZCHHzySpjuYPKWP0Urr6uciUTq
         dcWPYaFBG+FE6FulqCNQ7SsRA6+xbgxdUy33GTuWKxJS7bmL3/uvmwYa947NiVH4kNzc
         uuoA==
X-Gm-Message-State: AOJu0YzkRfj5UVbVxF4oQSMQFc/mN8u7HosQ+qbeeG/5P9V5x9QWXpjf
	L/T3QBfedxthBvqapTJNnn0=
X-Google-Smtp-Source: AGHT+IEokMxdLDwnG72GNo8md4NLX8fZro4ky2KeOokEesCSFdQ1+vI/RtlGtfvbM1IityteBfIaUw==
X-Received: by 2002:a17:902:d34b:b0:1bb:9b29:20d9 with SMTP id l11-20020a170902d34b00b001bb9b2920d9mr8060404plk.20.1696091894718;
        Sat, 30 Sep 2023 09:38:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a90f:2dad:30c1:d923])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c3c100b001bc18e579aesm12841649plj.101.2023.09.30.09.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 09:38:14 -0700 (PDT)
Date: Sat, 30 Sep 2023 09:38:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] input: mt: Annotate struct input_mt with __counted_by
Message-ID: <ZRhO828Ml4qpoS60@google.com>
References: <20230922175036.work.762-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175036.work.762-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:50:37AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct input_mt.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thank you.

-- 
Dmitry
