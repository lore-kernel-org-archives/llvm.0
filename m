Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7915AEF
	for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 15:44:30 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b162fa87d8so4965062a34.3
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686843870; x=1689435870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4StmFmRajOimzwQuxAIm4oA1Qq+pBLBdDXasM5CJ9r0=;
        b=X9ur/1kQVScMujlfFfp3RRguZGxLCtamV4Mzp2jhXW69XuqY70QQFqj0rNBmgLCsao
         YezKD56/IDNwS0TvAu+X+bUeyOKHcNbo5hcSRIIDiQQNyCaVmT0uSxyHhW15PYIizP0m
         aFyjKgl/6bkcVvtG5PUV5GOXL1+F9NzTfdDE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843870; x=1689435870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4StmFmRajOimzwQuxAIm4oA1Qq+pBLBdDXasM5CJ9r0=;
        b=SlpSpgmozkKvOiwEqvZcBKoXkDlHMbXBqrbAtg3xjar7RveLWhtqK3fnWLsUNzWBde
         uB97cV+wByCQ+13S8TjEq4LDaXNmJ0hSsnMmkrPYS+NxsRR6rfj4yMekzWKKzeYrUCMN
         dF7B9dr1tRvA7yzj5bOXzJ/9l9LiFYOb0i/aht3V6JmQ+vtyxe+d+ft63jFBoj8R0mxV
         apKO0BTrh5LbAUr4VO6J2yEEC6lRVjlaRBBxTa5T+z56AwtJYW+dBKdPi3tQRMLcgS0c
         9QCBPYv95oRYuN0gb0e6tDxtya3f1OJ2Uz6KtWF53Th8ukFMelIhX8kpmwR7qgIb8XBA
         qwiw==
X-Gm-Message-State: AC+VfDw3DoX+s5MwplDbaRYbBEj5v7hjdEy4iWwTMNMG6+RYhtpE/gz+
	BnYhBAXTdZxoPtXrtPNhnmrPtYSSnaBQV9edpx7Ylw==
X-Google-Smtp-Source: ACHHUZ4XzMRy765MiqkYZk2EQDL/FAz6ib58uJzpHUeyESFt2Ss5dqWqW1EtsOL4TZFKrIHxwhGFu6PjB0MFUoR5V30=
X-Received: by 2002:a05:6870:d450:b0:180:857:d47d with SMTP id
 j16-20020a056870d45000b001800857d47dmr13034116oag.57.1686843870070; Thu, 15
 Jun 2023 08:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615145607.3469985-1-revest@chromium.org>
In-Reply-To: <20230615145607.3469985-1-revest@chromium.org>
From: Florent Revest <revest@chromium.org>
Date: Thu, 15 Jun 2023 17:44:18 +0200
Message-ID: <CABRcYm+C+tPwXAGnaDRR_U2hzyt+09fjkKBp3tPx6iKT4wBE2Q@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf/btf: Accept function names that contain dots
To: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 4:56=E2=80=AFPM Florent Revest <revest@chromium.org=
> wrote:
>
> When building a kernel with LLVM=3D1, LLVM_IAS=3D0 and CONFIG_KASAN=3Dy, =
LLVM
> leaves DWARF tags for the "asan.module_ctor" & co symbols.

To be fair I can't tell if this is an LLVM bug. It's sort of curious
that with LLVM_IAS=3D1, these debugging symbols are not kept and they
are with LLVM_IAS=3D0 but I don't know what the expected behavior should
be and how BTF should deal with it. I'll let people with more context
comment on this! :)

An easy reproducer is:

$ touch pwet.c

$ clang -g -fsanitize=3Dkernel-address -c -o pwet.o pwet.c
$ llvm-dwarfdump pwet.o | grep module_ctor

$ clang -fno-integrated-as -g -fsanitize=3Dkernel-address -c -o pwet.o pwet=
.c
$ llvm-dwarfdump pwet.o | grep module_ctor
                DW_AT_name      ("asan.module_ctor")

> In a dramatic turn of event, this BTF verification failure can cause
> the netfilter_bpf initialization to fail, causing netfilter_core to
> free the netfilter_helper hashmap and netfilter_ftp to trigger a
> use-after-free. The risk of u-a-f in netfilter will be addressed
> separately

To be precise, I meant "netfilter conntrack".

I sent the following patch as a more targeted mitigation for the uaf
https://lore.kernel.org/netfilter-devel/20230615152918.3484699-1-revest@chr=
omium.org/T/#u
