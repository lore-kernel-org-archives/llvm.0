Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73328E15
	for <llvm@lists.linux.dev>; Wed,  6 Dec 2023 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="dYXJpN3Y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d075392ff6so6773915ad.1
        for <llvm@lists.linux.dev>; Wed, 06 Dec 2023 05:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701868467; x=1702473267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m8NNJ96xoL22f3J2mj0pcMGx/C1e265J+kyF1R2z8o=;
        b=dYXJpN3YPxNhw6LqhMcJgdfNk6pTx6yHYUlX0iIDH+ZlXdWLydVOV0B5GSW52xJs5l
         0WPA4AebTdS1RNRkRvFwySAqW1RTmyWHGWmNGQ3vVuXWnQTms9Vogxxg1b0Yb6zcFnuq
         /Q9kt/aKsmdlPin39C0L6gBFPoNx0xhXuZ1ZqzCmwyK/ndMP4FudOXK/IMnXIj9g8xDe
         gCiZPsBMwsGgri5zApchUgWoqd8Zwb8JxE3UxWDhknOuhixqgmcDLgeDr3F9pHm/Ytv9
         1B2SbnCoswing6Fv2yGh8DTbJ4Djm286/o2THHn+mPnfbKeMFXdZ49+VhhwXoYdEDI7e
         DDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868467; x=1702473267;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m8NNJ96xoL22f3J2mj0pcMGx/C1e265J+kyF1R2z8o=;
        b=YBJtNlK3vD0h27uLYMEsmgnO9nYwtx3c9Ai9KwA+FdNyFjGCSgXnCVIX+WvkdjQhOJ
         7M9wutUD7bsh9Sbi1Bahxk1pXrSODHQ6VpZAQbheCjCyJIcywj2exiiBfWaoprbyDjeB
         RG9STjn5p4YDZwhPBYToRWAuv8CkjtVKxT5hgBT0N5wZNqaFfAK8SNcus3Ixge4tlSR3
         f9SpVOa4ke37uW3R/P2JaCU8LWteZLMaZe0JbnXlWKLjgcVxEkh+I0Y0AeUXx18g7rbC
         dd0UINpRKLELsH2JpeBX2POgOuDwfkLugoRj5b14Xl+CQH2D3KhsXuyfOpMr2GupNBEp
         da1g==
X-Gm-Message-State: AOJu0YxJ5KSA1ZGECvb0tediiCtIqoVkkzgG5ctvre8G7IK/JDgg2A/c
	DozeEjm1k2rANUUes6ZXEOo+lw==
X-Google-Smtp-Source: AGHT+IGta2bhw+7qIoVXmqExA48kB41RdGIfu5QAI9yipmpTWRjYPKmvmMdYnIurBqPfmflvyEFyTQ==
X-Received: by 2002:a17:902:dac4:b0:1cf:59df:23e with SMTP id q4-20020a170902dac400b001cf59df023emr1270027plx.12.1701868467222;
        Wed, 06 Dec 2023 05:14:27 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id p24-20020a170902b09800b001b86dd825e7sm12082582plr.108.2023.12.06.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:14:26 -0800 (PST)
Date: Wed, 06 Dec 2023 05:14:26 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 05:14:24 PST (-0800)
Subject:     Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  akpm@linux-foundation.org, keescook@chromium.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  llvm@lists.linux.dev, linux-kernel@vger.kernel.org, samitolvanen@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samitolvanen@google.com
Message-ID: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 29 Sep 2023 14:11:56 PDT (-0700), samitolvanen@google.com wrote:
> Hi all,
>
> We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> even if the hardware supports a larger virtual address space size
> [1]. These two patches allow mmap_rnd_bits_max to be changed during
> init, and bumps up the maximum randomness if we end up setting up
> 4/5-level paging at boot.

Sorry for missing this, I'm just poking through old stuff in patchwork.  
As far as I can tell this is still relevant, the discussions are just on 
the mmap() bits (but we'd already screwed that one up and have since 
fixed it).

So

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone else wants to take it, but I'm OK taking that MM patch 
with Kees' review.

>
> Sami
>
>  [1] https://github.com/google/android-riscv64/issues/1
>
>
> Sami Tolvanen (2):
>   mm: Change mmap_rnd_bits_max to __ro_after_init
>   riscv: mm: Update mmap_rnd_bits_max
>
>  arch/riscv/mm/init.c | 6 ++++++
>  include/linux/mm.h   | 2 +-
>  mm/mmap.c            | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
>
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
