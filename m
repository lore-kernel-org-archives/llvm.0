Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4173FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 21:21:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id n8so1419744lfq.4
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 13:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=iu1Z1ei9wRQa6/0dHZjrPJnVq/0giChK/qaOWFoOCc0=;
        b=NbnEIbLAiTrYh2qdThXh04gaSkuHq1D7lHFvujhpP+EaMspGjhuYe9GD6k0ygNnYoY
         x0Ra/EQcuoxYCTX0wx/JbBNICU80A6g/NUn4KTtFx0GJlTLgOrODxoVnyp9KrVummdha
         1Edr66reuKk1tiMNE7Wix2HEckxeABXIHcZsYCDIF0n2rCDqgXiT0ZVuN2RB1UKDfXPi
         91QVEOS7QjRsrOey42OBb1+X91vxmTGW4zCbrfB7w1MsGmMMpcS+6u3ptFlckFCdls2X
         feuycx8SyzRGkow72jkGCFfTY00c0FPBzJWq+bZySCOsaBbKhLsTXzxOyhZj5epgFf/m
         1DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iu1Z1ei9wRQa6/0dHZjrPJnVq/0giChK/qaOWFoOCc0=;
        b=pYyCRODM1KFXnF6tIX9Iv7V4//UgXPqT4AC2wnOqyArpL6aoUwTi59S9T8Pa52Aa2/
         ITlFj9aALtQniMLvYhUavTnxUN7TFq46TwV7u7iGeHHf0GzMgNGIxwib1VpeaJ4WdI/5
         Rh09fIst034C0/n0JnfOfR8Qg2H17UZvvcCGMa8dQUMwrpaRoAEN9nbr74FuYnqEI4/W
         jgqwdI/d4IVCFGKhCYEMRNGnMG19f/huKB8V9dpVYfwQPjfrS82nfg9ckYbZbXB8b2O5
         OoRVXGLV9Ztytuxu9kcc9/HTYu8krkZfWqqsJP8VnqebXTv1x0HuuhYQaBTBssbQoqFx
         afIg==
X-Gm-Message-State: AOAM532+vrDXkW0UJztLD1PLd6XZBwTt1Wl8gFnQBh+RG/5VH07Pmcb4
	lzjTo4xgr3qOTnkwDDGFJFTYq8vbTIw6a3YMgrxX9hUrwaCr0Q==
X-Google-Smtp-Source: ABdhPJzwyLPBIa9k8JTTBWISyiFGtbTHCtD4aKTHINhucfQb7F/1BzqzdKIY/AMYIprIqgV+Ti4LwDFfk61ovS5sPYk=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr651759lfr.444.1643232107559;
 Wed, 26 Jan 2022 13:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 26 Jan 2022 13:21:35 -0800
Message-ID: <CAKwvOdkeNsR_tErLVT8xTEZe+2ONRY0n=BJzxeWShB0VfN4HFA@mail.gmail.com>
Subject: Jan 26, 2022 meeting minutes
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

## Jan 26, 2022
- (Ard) [fixups](https://lore.kernel.org/linux-arm-kernel/20220125153656.1802079-1-ardb@kernel.org/)
for ARCH=arm ftrace
- (Nick) focused on [objtool
warnings](https://github.com/ClangBuiltLinux/linux/issues/1566)
regarding `asm volatile`
  - Probably going to add -Wasm-volatile to warn when `volatile` does
nothing (ie. `asm goto` or no outputs)
- Met with Intel to discuss kernel IBT, PeterZ has
[patches](https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/wip.ibt)
- (Sami) working on
["kcfi"](https://github.com/samitolvanen/llvm-project/commits/kcfi)
- CFI [issue reported](https://github.com/ClangBuiltLinux/linux/issues/1567)
with blake2s
- issue with [false positive warnings on
globals](https://github.com/ClangBuiltLinux/linux/issues/92) coming up
again.
- sysroot
- arnd header cleanup randconfigs for ARCH=arm ARCH=arm64 1.7x speedup
with clang
- [clang noundef analysis](https://github.com/ClangBuiltLinux/linux/issues/1480)
- CrOS analysing [most used
headers](https://commondatastorage.googleapis.com/chromium-browser-clang/llvm_includes-index.html)
in LLVM
- Kees' [LCA talk](https://www.youtube.com/watch?v=17Nqwl30Ch0)
- [`-Wshorten-64-to-32`](https://twitter.com/kees_cook/status/1485757844322340864)

-- 
Thanks,
~Nick Desaulniers
