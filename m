Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10514375
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 01:57:11 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 129so14156576pgc.5
        for <llvm@lists.linux.dev>; Tue, 04 Oct 2022 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nnwFItTZ5v5c/yn0akkkDOhkXWTPLIC0iJTGVgBYgQ=;
        b=64zbq9qZ7oHAyAN3Ch+JOyehs2MDZe+h3ZRV5N9hYybE9KjXb/+ciw3LkJ4oyQMjFy
         S8PKE0hMH8L54Hui716aLwyqJvdHOJHEBkb4ZBkz9yRqUU42DzBSKJprrzfT1B5U8J5J
         Kxm51ooJHMUe8WZjr/wrR5kzYc6kLUjjP6U5NtKcmo0wgycStSLqYb/ROYb8GfoyxcdY
         ddGeIef6cXAxHyp2bIBt7o7lsUJfHWtwZSnE/OmpnDCoe/rzpvV45jQK93hpeYblrBOp
         trV9sAVGaPeiBfP05+dubSPAHZtWWP5K0j1CuFCmrQlqJMIQ4lJzLpwMWO+hF+1LyYnD
         BHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nnwFItTZ5v5c/yn0akkkDOhkXWTPLIC0iJTGVgBYgQ=;
        b=8E6mLdCqwQvzIObvoNnJkxEBN9wBWs/4KsguMjwHdY509l3D0bSmoo4K/PPabfCN87
         yOrmM3nq9bhLtvhT2FM5J2vV83FtRpA5lZGqILU7gjG9474QF7sdMk5bdBxeJ4MuuaEY
         dg5h3Fh64JxY0Z/XTxhsBYPfJritC0UC81uAu5Mc/q3YySCoQ+kvO1LNGyODqq6K1FhF
         tZh3GDJtgMwya0Z+L2n2jB4vZ1rUoXXUgJIh0LIgvEHD5v+2RP5xJRHhxP/UPmCb4RS9
         GEpT0tZ/sE4hncP7nMgJ/clA9hjtGIbtOKQ3U6ARruNSmApbe4N+t4PDuNck/Nvhf5yN
         Wl0Q==
X-Gm-Message-State: ACrzQf1frAIZzUM2jjVc5yrtxjS3wTUpFib5JMjk0+nnXeTi1p9gWw8E
	qwDCq0yqtbjpQUcG8wzqnj1kYw==
X-Google-Smtp-Source: AMsMyM7TXkA5swm7Nb7pPd71EgAK7p47nc60Ju91fK6VqWMHyqzsh1KkwYTJb5tci0xHRyGl6WAwLg==
X-Received: by 2002:a63:4721:0:b0:440:2960:407 with SMTP id u33-20020a634721000000b0044029600407mr25597666pga.621.1664935031373;
        Tue, 04 Oct 2022 18:57:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902b19200b0016dc26c7d30sm9561479plr.164.2022.10.04.18.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 18:57:10 -0700 (PDT)
Date: Tue, 04 Oct 2022 18:57:10 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Oct 2022 18:48:11 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
In-Reply-To: <20220512205545.992288-1-twd2.me@gmail.com>
CC: linux-riscv@lists.infradead.org, nathan@kernel.org, ndesaulniers@google.com,
  llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: twd2.me@gmail.com
Message-ID: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> issue [1] in prior LLD versions that prevents LLD to generate proper
> machine code for RISC-V when writing `nop`s.
> 
> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> can boot to shell using an archriscv rootfs on QEMU.
> 
> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> separate patch further.
> 
> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> 
> Tested-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>

Sorry for missing this, the v2 never made it to my inbox.  Not sure 
exactly what happened, but an off-list ping made it through.  I've put 
this on for-next, I don't have any way to test it because I don't have 
clang setup yet.
