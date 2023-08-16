Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6686D2F1
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 22:44:01 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6491907dbc3so4745076d6.2
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225840; x=1692830640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpXUVMogWRocilVaW/S4SCVa83XVVrH7ZUS0RaQaZsw=;
        b=bITiTOHHUbrE3AfEqZC3NlsbjtrTDYN/ox+QNsR20wrJtxXdjPvZaxu6LlussS7O2Y
         ub2pZ5mu8vXNS2VfuGlvUzm0TcJsZcM3NY29ZwyW+PLIe+yIpryDjrUYWVd9Ic6RVi8n
         F8tbR2KcKBprzVc240jNqvFjL2m0cDlKZqYjHqDkx6dL3FYASHHJV/3lZqCmAUpwR5Iw
         PK5IhoQEW7O2rTklcHgu4zJAAgMkw9k3RLL0uMBonxd/iLEcRHp09kfuWyINXHJjqLHz
         kA1+CRh6P9Vn5mLRb6zR+Qug60FQVc7t60VJqronab4Vk8+o0/kWU7GbpzYGP1sex8NR
         LBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225840; x=1692830640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpXUVMogWRocilVaW/S4SCVa83XVVrH7ZUS0RaQaZsw=;
        b=OExqXvwoLrnXBnYQO0x51yNqqMo07bYMYEr0A4pQT4d+gLYMOga2aajnmT1D+Eamwm
         YvB0krOpvEc47OvivsQRnr496E7RLnjLdcJ3N1c8AuEJ4DApRYGu/VEfYXeHgvoMkbjF
         U8jZhrH+Wk0FMX1wrs9rNE1akPHdtKmD06QZ+og7hRI2BChXzkqPPSXiIdyd+7ZQ0Qat
         LIB/7PUl1bGQA2DWBXwFqfxFxM+9e58cTEnvw8PElpwE2t3ajFN0SXI6yKIYD8CaJ9Ny
         WbqHrMJ69+ItdpXpn7NajPfsv+OqB9Ulq6vxapjTslrUs+Q4uFtYAiyX+JK4lqVwXzdh
         htTA==
X-Gm-Message-State: AOJu0Yw/a7jBHZsOBE3xrBX/unFgUFOlcyGwFtyIL5MS/OznCtmIBuV8
	pLxLjUIS8ocZ+2CZ3cBC1nRCOLacEglZ6Z0C926ilg==
X-Google-Smtp-Source: AGHT+IHHjvWLPWLuDT0dUPubBgu4Lkyk2WaI8TiIj6jXKhfYFzJh/0ALHGThw/osOop0kHb6wyBy4Bt0BgaH9TvWYlY=
X-Received: by 2002:a0c:c981:0:b0:635:e81d:e57d with SMTP id
 b1-20020a0cc981000000b00635e81de57dmr3655334qvk.55.1692225840509; Wed, 16 Aug
 2023 15:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
 <20230816220457.kqzlbiibeomvki4y@google.com> <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
 <CAFP8O3LzmUQNHMPKwW6cz05hdC576WbbUsrBSkWMTSMc=P1vaQ@mail.gmail.com>
In-Reply-To: <CAFP8O3LzmUQNHMPKwW6cz05hdC576WbbUsrBSkWMTSMc=P1vaQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Aug 2023 15:43:49 -0700
Message-ID: <CAKwvOdnB8YdmxxnDF=L2Bs=BLU2goXuFkksj1Vy5hLOs_gE5hw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, conor@kernel.org, 
	trix@redhat.com, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:41=E2=80=AFPM Fangrui Song <maskray@google.com> w=
rote:
>
> On Wed, Aug 16, 2023 at 3:35=E2=80=AFPM Nick Desaulniers
> > Fangrui, any thoughts on feasibility for `-mrelax` and `-gsplit-dwarf`
> > composability for llvm?
>
> Yes, this should be feasible and is on my radar
> (https://github.com/llvm/llvm-project/issues/56642#issuecomment-154842102=
6).
>
> It's the next thing I'll do in my spare time after DWARF v5 & linker
> relaxation interop: https://reviews.llvm.org/D157657

Cool, I've removed Saleem from the assignee field there and penciled
you in; both because I think Saleem has new concerns and so that you
don't lose track of it.  Thank you.
--=20
Thanks,
~Nick Desaulniers
