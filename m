Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F72E40E
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148544; cv=none; b=WymVdmbh2scL0e4/zVKK12DAPTW+aOfaBOfyb9p4GrY5ffH0mrWuKStBW/0lVssIi3O2y0XkuGfYvsgclcq7VfbwJdYsjibukBsAR/AFmMfijAd9qaNTMmUDdy2w2x/B0pbFfcSrfeIXQnznAhfZ0p3LftcKW4QPmE3CU4I+By0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148544; c=relaxed/simple;
	bh=B+aGIK4EO+em7NEUtAwdtMpK5psbwOUF945QRnLBpac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G7wQO1q51rDNewH2J4bDI3wDluKuCl/UErcTHeIOOeVvpHwYYjMQKALHoCGykTD7msjGKPuPHQaKtpIpL41wvHEQWjgnP6w2KA582Q9T27ZyCAwPMYetWNWTW1WNTdxX0oyTvZYI68/whnrdah2ffjXI8rS6zb3PunpLMjELmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMTZS2/F; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMTZS2/F"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a450615d1c4so700216066b.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148541; x=1710753341; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbNdf3cWroV5dO6V7Sle8ThanLSbwGGwoWZKSypPYNY=;
        b=VMTZS2/Fv9am5QoSlyFYw5pBoysXF81fS/Q3Su9xx3lVMJik3Drl5Ehk55vIU9M3WU
         S8zanUr4sRTcLmeYYMc3aXbAY93pYd6a/nZ4FAVYyvO4jaBxo2KOYqKxuxIJwoH0AU1d
         1V3umY+eH/ZP7Pq4q5E4YMyCT8GYyW56ob4EPm8OXwX26bKFqu8DTfOB/LFc2lwwkt9H
         X39As1lyJOFW4pa8VsEGS13Q0Dolm+mBTf72ZgYIfhmxTAKRcaTDOz27P2cHsfoTbMMs
         9FLMnvcqulv3ADnoBjamdi8EKrf7bAVZbMVvfv3KirqahUIYLKa23nl4mmtxrfFhXuaF
         iTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148541; x=1710753341;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbNdf3cWroV5dO6V7Sle8ThanLSbwGGwoWZKSypPYNY=;
        b=dWSIsYJahd/M1S/7djB0WiSwSShoOdLSFMRQA+uMmyOe6ZijQVbwD4sf8xi9BKhlb5
         pn4zLXOoIKtsvAn9T3wJOdYRxd4w1AsiYs8rBrFrp9Zfvy7BCzKgvXUdlIyaiJvTtbfc
         hk6TgoYEOMQVFbt4+pr6AeH6F6lEvaAqbDsj2UgiX1zEVHPFlvGH2sv26wcuEwUSyES6
         hU7N+UdHKU444StlfpTLeSrxhuVEb4hxdoZIf+OJac0ZBc3X6ix7p9494qoNCfE9UV4R
         uiFiYAUK6nJi1s5aS7T7loxaKllcrGixT0jl2+RXc9feSgkMCsLKr0Yr9inHBQj/1tC5
         bx9g==
X-Forwarded-Encrypted: i=1; AJvYcCX3pQjVe1AMic8BWKigbakYSkfP1ew77KXaBAal9af4WtZmx6KTvN4dj6wIXoMLVLqt+p8Au7r+VnbgcUpHuLEx4Xs+wg==
X-Gm-Message-State: AOJu0YzRy1nQ7P80iKrK8+rIyOgz7UKjc9ZYAuogOirGH6z2SeMduxsR
	QqP/h3Y1PPsgndwL9vEo2zwZfbkVsLrN/FJHdd984nRoxfCKDAD8/k37pZBENLI=
X-Google-Smtp-Source: AGHT+IEBJQ7BgKcOCBvzwQqQpmFmMXEWcBCRiScYlAQFN6ifQ/5W98Y1ZtgEjJ6LNTP6hyoAHcv2Yw==
X-Received: by 2002:a17:906:3ad3:b0:a45:a2cc:eb93 with SMTP id z19-20020a1709063ad300b00a45a2cceb93mr4627139ejd.4.1710148540779;
        Mon, 11 Mar 2024 02:15:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/9] CFI for ARM32 using LLVM
Date: Mon, 11 Mar 2024 10:15:37 +0100
Message-Id: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnL7mUC/1WMQQ7CIBBFr9KwFjMMlKor72FcUArtJFoMGKJpe
 ndpXViX78+8N7HkIrnETtXEosuUKIwF5K5idjBj7zh1hRkCKhCi5ibeJXLrieu60+CxrHBg5f8
 RnafX2rpcCw+UniG+13QWy/qtIG4rWXDg+qikBO1B1+35RqOJYR9iz5ZMxp8qodmqWFRrG+VMu
 ehW/qnzPH8AufZv7N4AAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This is a first patch set to support CLANG CFI (Control Flow
Integrity) on ARM32.

For information about what CFI is, see:
https://clang.llvm.org/docs/ControlFlowIntegrity.html

For the kernel KCFI flavor, see:
https://lwn.net/Articles/898040/

The base changes required to bring up KCFI on ARM32 was mostly
related to the use of custom vtables in the kernel, combined
with defines to call into these vtable members directly from
sites where they are used.

The approach to all of these vtable+define issues has been
the same: instead of a define, wrap the call in a static inline
function that explicitly calls the vtable member.

The permissive mode handles the new breakpoint type (0x03) that
LLVM CLANG is emitting.

To runtime-test the patches:
- Enable CONFIG_LKDTM
- echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT

The patch set has been booted to userspace on the following
test platforms:

- Arm Versatile (QEMU)
- Arm Versatile Express (QEMU)
- multi_v7 booted on Versatile Express (QEMU)
- Footbridge Netwinder (SA110 ARMv4)
- Ux500 (ARMv7 SMP)

I am not saying there will not be corner cases that we need
to fix in addition to this, but it is enough to get started.
Looking at what was fixed for arm64 I am a bit weary that
e.g. BPF might need something to trampoline properly.

But hopefullt people can get to testing it and help me fix
remaining issues before the final version, or we can fix it
in-tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Use report_cfi_failure() like everyone else in the breakpoint
  handler.
- I think we cannot implement target and type for the report callback
  without operand bundling compiler extensions, so just leaving these as zero.
- Link to v2: https://lore.kernel.org/r/20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org

Changes in v2:
- Add the missing ftrace graph tracer stub.
- Enable permissive mode using a breakpoint handler.
- Link to v1: https://lore.kernel.org/r/20240225-arm32-cfi-v1-0-6943306f065b@linaro.org

---
Linus Walleij (9):
      ARM: Support CLANG CFI
      ARM: tlbflush: Make TLB flushes into static inlines
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: proc: Use inlines instead of defines
      ARM: delay: Turn delay functions into static inlines
      ARM: turn CPU cache flush functions into static inlines
      ARM: page: Turn highpage accesses into static inlines
      ARM: ftrace: Define ftrace_stub_graph
      ARM: KCFI: Allow permissive CFI mode

 arch/arm/Kconfig                     |  1 +
 arch/arm/common/mcpm_entry.c         | 10 ++-----
 arch/arm/include/asm/cacheflush.h    | 45 ++++++++++++++++++++++------
 arch/arm/include/asm/delay.h         | 16 ++++++++--
 arch/arm/include/asm/hw_breakpoint.h |  1 +
 arch/arm/include/asm/page.h          | 36 ++++++++++++++++++-----
 arch/arm/include/asm/proc-fns.h      | 57 +++++++++++++++++++++++++++++-------
 arch/arm/include/asm/tlbflush.h      | 18 ++++++++----
 arch/arm/kernel/bugs.c               |  2 +-
 arch/arm/kernel/entry-ftrace.S       |  4 +++
 arch/arm/kernel/hw_breakpoint.c      | 30 +++++++++++++++++++
 arch/arm/mach-sunxi/mc_smp.c         |  7 +----
 arch/arm/mm/dma.h                    | 28 ++++++++++++++----
 arch/arm/mm/proc-syms.c              |  7 +----
 arch/arm/mm/proc-v7-bugs.c           |  4 +--
 15 files changed, 202 insertions(+), 64 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

