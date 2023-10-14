Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EC367
	for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sdzr7uxg"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68bed2c786eso2101988b3a.0
        for <llvm@lists.linux.dev>; Fri, 13 Oct 2023 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697252684; x=1697857484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkmT5RX8v7VrB7rbJu0hYTNQC/OFJh9NeX4vrDd9wBY=;
        b=Sdzr7uxgTU7GFO4P4ZO16obxP+Pk+ZphZvGDRPKYqIfSn27Wy4QAdyGUuB/9P5Mm+C
         VUy1n+YlRyi28oL9aShddsHRopBeaW64AWpkbhyE6oBd9vnn5gObEeGKzPHUXNRfMaLM
         gmIcUFl0CzYBDvlRhPd5kUTq6BVklS44LGo1qY83xxZtI5w1rIwq0/CPGFNhHCOYbRZX
         bzpyGLpVmLsYMAf2g8VNUtGVdvlFziTVqlcoaeT+Lxw6sqCgsznd18EcIKE3qqa3zMfP
         1n/PaUfFsrtLxRPQJGDophE4eIcj8F7YPAjQfBgEeBQSEjRhXQWd+Vb37mGVmiYJXLuC
         NHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697252684; x=1697857484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkmT5RX8v7VrB7rbJu0hYTNQC/OFJh9NeX4vrDd9wBY=;
        b=GLJ+Bxmd+1ntT7SDmvyk6Ki6kxTuZ64CqsK/CljyA/VyK19Yeb1hqW0YodeBarCpR0
         HZMPnX9+SkCqQ46nmyiE3v5sepiaRxyQFDUgOn2BFi2Rs/K67AqTYQpzrsWoUSLMe/ty
         0BPRyBRQ/UKc0mnQeoPzw8vbt4zDmipTzhD+bZrO6o9iU2JDVkOSSUuylFRw54hySbsw
         JBDBTAf0prZM5Ca/IKNUL8fhrOlCITQ6NWBxu2tjAhL0RcOpmKQjGEWAgCpfqguJ9grB
         uSmbsbbdM+tqE/fgnMTN3E4TNqF6l79zuBmFqZ2TLy+EZ7/mzAgglm6tRKJ3Bi+WNrou
         5FGw==
X-Gm-Message-State: AOJu0YwwX1RUGSgd14mZNfiDra+hkuJFxVw11eY1t+xCysVKrXYRQk9J
	KG1Evbo0gJP6cLRgpLo4Wes=
X-Google-Smtp-Source: AGHT+IG0luxGMVCiiu/e7olkjVkBiHhOENnweMoA1ppTeqdfrgjznDhE5JBrMvoJo3mzbfy8uWRZIQ==
X-Received: by 2002:a05:6a00:1592:b0:68f:cf6f:e212 with SMTP id u18-20020a056a00159200b0068fcf6fe212mr28693521pfk.20.1697252683916;
        Fri, 13 Oct 2023 20:04:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:469c:3411:2771:1b7f])
        by smtp.gmail.com with ESMTPSA id z10-20020aa79f8a000000b00690d4c16296sm1945364pfr.154.2023.10.13.20.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 20:04:43 -0700 (PDT)
Date: Fri, 13 Oct 2023 20:04:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Input: Annotate struct ff_device with __counted_by
Message-ID: <ZSoFSF9xYeyei4JL@google.com>
References: <20231006201739.work.350-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006201739.work.350-kees@kernel.org>

On Fri, Oct 06, 2023 at 01:17:39PM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ff_device.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-input@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thank you.

-- 
Dmitry
