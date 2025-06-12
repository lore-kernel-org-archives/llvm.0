Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F412D660B
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759424; cv=none; b=Ve371S9LyDATBZH6J/q7Jmowco4ezZWnP8lMN8P4J3qTx4H/W2f/sY2tj+uHW9EkBMR/+lK0DVvSnHMZRPVeYzbGT7o7Hj0mE6KbbSJ1zr+zwuMo0r2psyWXEzUVBiDE1gisZalU7u4yr18QMOnV9Yg9pYdhH5LdnvLi0jo/oUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759424; c=relaxed/simple;
	bh=kFN31beBRSTIYaA6iDR+OzH/fcShrj2UaW4fegx5fes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoiDwSRsPQlo7OiUShRsjgd6BbDIm61vm4Su1XDeeUtiJm31S6Y1zC1NSKjs0HdGH+Fys8HFixFh7t33sljYGoQeV0mEOqTof5hWcC4dDREgyzz8dOBmIEMm1+b9RzbFwNGFHijTNKYNQN+9AbGGctRtoon2I923Gwv6O2er6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWDzqP/3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWDzqP/3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2348ac8e0b4so12195ad.1
        for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749759421; x=1750364221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzEGZoiP4K4QOUbppiftlDAe5J+ee4W3KdfcExHtN30=;
        b=JWDzqP/3YBG+bxLFWFtIJbIg/Ma97kEKzvwPv1Jk3h8qJccLpGozSjb5+TpbDupRvI
         8+eXoll4uIKn3GBsbKdc4MGW9B7Q2lGE7SlJefoUHYlFE2mZ2PJXNygzAB/eMplcw/SN
         sUv6TNW93LttcnoOCFSXbpQD7M6qwcK4pyiLcFqMDenUZih4iws3t9GjaxSLp+AG/hqv
         +Wr0FAcSvfp6hq0lTbsvQ/5VyGG21KdTziqMwj79V/2uQTwwqSfsjchyFRmoU2fHqZU/
         42M7GTQ8x1n3aO7A2/4RWdpHaJn9WkllhjyGFVz3s0z2BvrGdCRIWlgy5+ym3OtbCLlE
         /Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759421; x=1750364221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzEGZoiP4K4QOUbppiftlDAe5J+ee4W3KdfcExHtN30=;
        b=umy/Q1yMatgJV9VwXovYWF5QCLUaCTpy5pzI9mrK5FIRS72aJXfRqCZn3zyLX8wyWd
         3+dYT+FgfN/SKLl50MvAoNxmvxL9qRzX2MkT9emQCvAZhqq66T92TU1ohaKSMYRcrOSC
         0chUfGcwf8GT0mdPLyr6GgRUhOMizh3KOEqnzTvXcwrj+dGAFLCqlsLg/IS39taRacw6
         f3DV0dqo8iLRbOBVGd/kvyWAWwgKFwgglMuVTHtndb/LOqNTOZg6mw9Fw5Q5leBlKB7l
         6xQBR++KXaC7SszW+tQjFFomRiPlI+GX6+SivndeSn2AAtxWgvlvhYaMBvozIxKD2+rA
         hcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVvp4mwRJVhUIp5T67LZHIik+JeF/ErHel5f4IIboeIuWlN+b/uQMlte1Mr9nmJk3uTFdyQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwkXju3K2qM6QZi2nMizUy3ILbW+TB//vwUv2F+7dRA6iq31hgO
	cCWJ/rtXxiynfb4Anvqca3roe8XRRIsgVFzapHGmu/e8nqDX5Cjv7SWroTtDFoLDVm2YEyYMS2g
	N69aC37HdOnaaYJU451dbiVSnS6qHMhNfQWNDYuZM
X-Gm-Gg: ASbGnctAcm6VRUxF/BYEQKkucTLIVjJskmZEsPHIfnOHQSiKu0qj4RHU8IGNwA/TD9u
	QV60poq8QuA3JWbXbsxLEQWQ85d4iZkuY3VP2gyoy/2mz10UnH1IhDn1ZLQYxw/9tfOFknvsIWO
	4i3kmKmpHXkBWgg7gRNACxVGrObOs05xv/9zpJguC6
X-Google-Smtp-Source: AGHT+IHFrAXcJTnxqKVck9VUMcfEAPekbj5iqtQKGqGzarrcDrNUw7XtTgYP0mxzcfkiDTg8Uo8HWgSeNcMW9sqlrc4=
X-Received: by 2002:a17:903:f90:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-2365ec46e31mr233195ad.3.1749759420695; Thu, 12 Jun 2025
 13:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612-riscv-require-clang-17-for-kcfi-v1-1-216f7cd7d87f@kernel.org>
In-Reply-To: <20250612-riscv-require-clang-17-for-kcfi-v1-1-216f7cd7d87f@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Jun 2025 13:16:23 -0700
X-Gm-Features: AX0GCFuTAMmgTyQd3wuTrHKylYFTPTbhhknJpwyhNHmJXUMP1DlwFarGGXztZ_c
Message-ID: <CABCJKudMSzrYj3Np4cxoe6WQ-8Wu1jbG84LMmtGdqA-v3FmAPg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Require clang-17 or newer for kCFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Thu, Jun 12, 2025 at 12:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> After the combination of commit c217157bcd1d ("riscv: Implement
> HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS"), which starts using
> '-fpatchable-function-entry=3DM,N', and commit d0262e907e29 ("riscv:
> ftrace: support PREEMPT"), which allows CONFIG_DYNAMIC_FTRACE to be
> enabled by allmodconfig, allmodconfig builds with clang-16 begin
> crashing in the generic LLVM kCFI pass (see [1] for the stack trace).
>
> clang-17 avoids this crash by moving to target-specific lowering of the
> kCFI operand bundles [2]. Require clang-17 to select CONFIG_CFI_CLANG to
> avoid this crash.
>
> Fixes: c217157bcd1d ("riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS"=
)
> Link: https://godbolt.org/z/xG39Pn16o [1]
> Link: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e=
0efda994f8bdc27e2 [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36061f4732b7..d71ea0f4466f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -63,7 +63,8 @@ config RISCV
>         select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>         select ARCH_STACKWALK
>         select ARCH_SUPPORTS_ATOMIC_RMW
> -       select ARCH_SUPPORTS_CFI_CLANG
> +       # clang >=3D 17: https://github.com/llvm/llvm-project/commit/62fa=
708ceb027713b386c7e0efda994f8bdc27e2
> +       select ARCH_SUPPORTS_CFI_CLANG if CLANG_VERSION >=3D 170000
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>         select ARCH_SUPPORTS_HUGETLBFS if MMU

LGTM. Thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
