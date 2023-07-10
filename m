Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777EFC09
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 19:08:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-668711086f4so3097837b3a.1
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689016090; x=1691608090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voVX6LNoZ/J8bMuhFyaOWgRv6Zq5UVw3bcxlCreIau0=;
        b=1tKrKVjLsZlhy8odFljy5A7wgwOCceiEXO0WXFWKcEbHGeOAOez2StDWYQKKXYaf0u
         KxvJRa87HdcA5pB0okif7Z0b35z8cc2tLASh5d+miBIE6Bs9KUTlrUUm/kzyEOS8+Tw2
         NETrfXnOhywt/LmYyBC7fKj+hbGw6hbAZA0MR/Lqbpdhr1EE77xQjHZdwp5lpyZmyN0f
         5KtlxzprTcf99MCiVS+GKMHENseXkS5L+25K1U3M8luzAxoJFRGfhUGNiWxu9e94kPSL
         MmJ14tdvNpj9MMRH58e0MXWxAcen7uRtBbWunqMeVRUHOUsBD5opsT7ROZtyvI8tD/e1
         pFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016090; x=1691608090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVX6LNoZ/J8bMuhFyaOWgRv6Zq5UVw3bcxlCreIau0=;
        b=g6ptNsylu4vF3ttJFxwGGgP5wlAnZL4O/8fcOcZv5CfDypFFj9h4GwY+sVvo6uCN7+
         McMQAlOBIqzbiBlQH2Yu8yycFyRkBRLg6ce44nYWvim1dj0fEtL8VCIHUeQpCe61rFhf
         tohbB0x5ddzTiCD+Ifq3WAmmw1R2mHCvS+NnFgAyy0KGTuUOXzax1OIM5jhZkKGeIUpc
         xmZNNOhpUcjfooFUR01VCGi90NPzQIz94eLjhIKty5HJWyhAx/2b4zSwSK8jtxU4dcSg
         HX/sBVZ3OcvJ2IZcigW0j/4WMq9wfcx0ftgoQ6eTxYpUaGTWM6u/lk6MCYe+kw4Dxwei
         DOHw==
X-Gm-Message-State: ABy/qLY/EQrgwOjDJGewuhoGOvOgOCqLyNcQv9toDwJIBjHVC6XKphIR
	xOn0I3qJRq0qpi/QHgpsASBVYA==
X-Google-Smtp-Source: APBJJlE1fEH2sHOVo9utDEMzkiIiKOHtiey9zE83fpGfTKSsuED5sR/xEAs2EL4vldSYbhB1R9O4yw==
X-Received: by 2002:a17:902:db10:b0:1b8:a936:1915 with SMTP id m16-20020a170902db1000b001b8a9361915mr20863454plx.22.1689016090010;
        Mon, 10 Jul 2023 12:08:10 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902da8d00b001ac95be5081sm219080plx.307.2023.07.10.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:08:09 -0700 (PDT)
Date: Mon, 10 Jul 2023 12:08:09 -0700 (PDT)
X-Google-Original-Date: Mon, 10 Jul 2023 12:07:23 PDT (-0700)
Subject:     Re: [PATCH v2 0/6] riscv: KCFI support
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  keescook@chromium.org, nathan@kernel.org, ndesaulniers@google.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
  linux-kernel@vger.kernel.org, samitolvanen@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samitolvanen@google.com
Message-ID: <mhng-2fe7822f-f869-4513-b8a6-7da21ce5ccd8@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 10 Jul 2023 11:35:45 PDT (-0700), samitolvanen@google.com wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.
>
> Patch 1 implements a pt_regs based syscall wrapper to address
> function pointer type mismatches in syscall handling. Patches 2 and 3
> annotate indirectly called assembly functions with CFI types. Patch 4
> implements error handling for indirect call checks. Patch 5 disables
> CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
> to be enabled for RISC-V.
>
> Note that Clang 16 has a generic architecture-agnostic KCFI
> implementation, which does work with the kernel, but doesn't produce
> a stable code sequence for indirect call checks, which means
> potential failures just trap and won't result in informative error
> messages. Clang 17 includes a RISC-V specific back-end implementation
> for KCFI, which emits a predictable code sequence for the checks and a
> .kcfi_traps section with locations of the traps, which patch 5 uses to
> produce more useful errors.
>
> The type mismatch fixes and annotations in the first three patches
> also become necessary in future if the kernel decides to support
> fine-grained CFI implemented using the hardware landing pad
> feature proposed in the in-progress Zicfisslp extension. Once the
> specification is ratified and hardware support emerges, implementing
> runtime patching support that replaces KCFI instrumentation with
> Zicfisslp landing pads might also be feasible (similarly to KCFI to
> FineIBT patching on x86_64), allowing distributions to ship a unified
> kernel binary for all devices.
>
> ---
>
> Changes in v2:
>   - Rebased on 6.5-rc1.
>   - Sorted Kconfig entries alphabetically.
>
>
> Sami Tolvanen (6):
>   riscv: Implement syscall wrappers
>   riscv: Add types to indirectly called assembly functions
>   riscv: Add ftrace_stub_graph
>   riscv: Add CFI error handling
>   riscv/purgatory: Disable CFI
>   riscv: Allow CONFIG_CFI_CLANG to be selected
>
>  arch/riscv/Kconfig                       |  3 +
>  arch/riscv/include/asm/cfi.h             | 22 ++++++
>  arch/riscv/include/asm/insn.h            | 10 +++
>  arch/riscv/include/asm/syscall.h         |  5 +-
>  arch/riscv/include/asm/syscall_wrapper.h | 87 ++++++++++++++++++++++++
>  arch/riscv/kernel/Makefile               |  2 +
>  arch/riscv/kernel/cfi.c                  | 77 +++++++++++++++++++++
>  arch/riscv/kernel/compat_syscall_table.c |  8 ++-
>  arch/riscv/kernel/mcount.S               |  9 ++-
>  arch/riscv/kernel/suspend_entry.S        |  5 +-
>  arch/riscv/kernel/sys_riscv.c            |  6 ++
>  arch/riscv/kernel/syscall_table.c        |  8 ++-
>  arch/riscv/kernel/traps.c                |  4 +-
>  arch/riscv/purgatory/Makefile            |  4 ++
>  14 files changed, 238 insertions(+), 12 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cfi.h
>  create mode 100644 arch/riscv/include/asm/syscall_wrapper.h
>  create mode 100644 arch/riscv/kernel/cfi.c
>
>
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

Thanks, this generally LGTM it was just a bit late for the last merge 
window.  I'm still poking around to make sure there's no fallout in rc1, 
this is in the queue (but there's some other stuff too).
