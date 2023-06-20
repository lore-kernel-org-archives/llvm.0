Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56B2AB3A
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 17:47:14 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-341c72be673so25045545ab.1
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 10:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687283234; x=1689875234;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15DPaA2yeu/H18i78SGzieR0HTDMni/2Vd4N6ujG6o0=;
        b=aTtRZPZqtgwc5I721QSaypapvp1fmtoxp46lXEwwqeV8Cx3/xu0P4O6+j4nDRwEc9/
         BD5x8UZcbcG4mrc78TEeFneGMaEbVM4XNy0+xR9fMHl7GUBysx2Z1kr35fKxtZmBc7Pk
         x6KPn89pvcNeIOVWS4UiPeetwhGwFkCuObOFPTTxBAC/G5kihLlR1X4t/ZAJRiy+JziZ
         ywBITnZhBjVbyLgCFy5eaqyFXpW/A2wLLhEAGeEHaLCi7uoLpEdDdxTrxbVUKkjK7M+1
         lu7sMrI34wK99BFtGJUUGMyfUdPjVWLkygpREtEs0pPkUamt4Y8N/CH1wMtK1oiOzCGZ
         aDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687283234; x=1689875234;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15DPaA2yeu/H18i78SGzieR0HTDMni/2Vd4N6ujG6o0=;
        b=LA+cSGSB271q3g3GtQ50SEEMuRumjjQ8OhCWwlTGa5ATaTHVpVgoMEPoQwETbMNC+h
         P9dXIIvQ3tR29mIfgs0guLkmP19pwAC44nI5JHyZmc0Maq1NM2n3kjzURCKoeKNeopb3
         SsM3L5vga/hV645p67xYUQadkExPi39cu1uWNXsMmNvoAS7mNAb4hBatR+tpB26O3NOE
         7k5mkWXjCza8debkwca/+psIOoZesfBgr4XxsKMMIdx8Jd4adgkY18MdVHqvZfHJJ21/
         6KXXMOYGsMIeronqj7DDsG+ua0xzTiidSW9qN65NkrotPQ43q2b+Jgw0QDdMwxBKbk3E
         9gXQ==
X-Gm-Message-State: AC+VfDzhlmeB4S0wWg40MJuHNJhrlfssLJCz0Trr4br2xxsZqAG3+cRC
	bOFfZ7hHO8M6mkhChfQ+qgxzAQ==
X-Google-Smtp-Source: ACHHUZ6rjQwegQvtImo7ns7efOyigl4kEmCwH7fakP/gcU5ynvAfw/nPMtbbEjaQoTtSL3YR71n+bw==
X-Received: by 2002:a92:4b02:0:b0:33a:adaa:d6d1 with SMTP id m2-20020a924b02000000b0033aadaad6d1mr11837316ilg.15.1687283233896;
        Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l18-20020a656812000000b00514256c05c2sm1561789pgt.7.2023.06.20.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
Date: Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 10:46:34 PDT (-0700)
Subject:     Re: [PATCH 6.3] riscv: Link with '-z norelro'
In-Reply-To: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>
CC: Greg KH <gregkh@linuxfoundation.org>, sashal@kernel.org,
  Conor Dooley <conor@kernel.org>, ndesaulniers@google.com, nathan@kernel.org, linux-riscv@lists.infradead.org,
  stable@vger.kernel.org, llvm@lists.linux.dev, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-70da67b5-db97-4e69-9e0a-041b0b7fe80f@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 20 Jun 2023 10:44:50 PDT (-0700), nathan@kernel.org wrote:
> This patch fixes a stable only patch, so it has no direct upstream
> equivalent.
>
> After a stable only patch to explicitly handle the '.got' section to
> handle an orphan section warning from the linker, certain configurations
> error when linking with ld.lld, which enables relro by default:
>
>   ld.lld: error: section: .got is not contiguous with other relro sections
>
> This has come up with other architectures before, such as arm and arm64
> in commit 0cda9bc15dfc ("ARM: 9038/1: Link with '-z norelro'") and
> commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> CONFIG_RELOCATABLE"). Additionally, '-z norelro' is used unconditionally
> for RISC-V upstream after commit 26e7aacb83df ("riscv: Allow to
> downgrade paging mode from the command line"), which alluded to this
> issue for the same reason. Bring 6.3 in line with mainline and link with
> '-z norelro', which resolves the above link failure.
>
> Fixes: e6d1562dd4e9 ("riscv: vmlinux.lds.S: Explicitly handle '.got' section")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index b05e833a022d..d46b6722710f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -7,7 +7,7 @@
>  #
>
>  OBJCOPYFLAGS    := -O binary
> -LDFLAGS_vmlinux :=
> +LDFLAGS_vmlinux := -z norelro
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>  	LDFLAGS_vmlinux := --no-relax
>  	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>
> ---
> base-commit: f2427f9a3730e9a1a11b69f6b767f7f2fad87523
> change-id: 20230620-6-3-fix-got-relro-error-lld-397f3112860b
>
> Best regards,

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!
