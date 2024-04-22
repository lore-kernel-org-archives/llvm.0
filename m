Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1F1C6B7
	for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713822659; cv=none; b=V3qAPPNfgaGW2Fns2WH/maCDwQuM64/e642cknwLg+Q5SL4a0FIsKbmD7hunCJ6AUnD8yi0ch25KGFFA/OvdrXTRsjGWkLOSGLPol7UQ0iQKc/LtCbHog2bXtx9AA6+L7p2IxTShunsnOzUilH3FuXqaKHvMOsBo6anfsglsCrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713822659; c=relaxed/simple;
	bh=SEkUXRyTRFlZayJ+fSUJx/hdJQBCskYt4xD2flmoIJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2jj42+z0+H2MbHHjgaSszVv6SjQ1u1nI0gtzFvZgG2Uv2wAhb1BoQfsui9YJztyStLq+ZVxPqcndUiY6eeIdKlP/LnVIuxNJiBQdmpCzCIEj0q2rWBnmhubfrfPSCRuoAOIIYHHZP1W4iN03/PFxXz/dHBRl/szp2Vz7GtsEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pBugTnGC; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pBugTnGC"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-69b4043b7b3so29607646d6.1
        for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713822656; x=1714427456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8g9fqO1j7nGC7mqxM8+vhaDwkB+4GVS89I3wWxh/OYo=;
        b=pBugTnGCfYyKgrFw7I1QxlqMcRHBDpkW2EPxM3xI4e8ewvBHGmMiH1lXo5Ii1ZmLei
         bAsBQd9uXDgnZqbbVbRCegUEbGxZxgL6ewqiX4jkrAhUd8wO1XU5iIAoj3hjcfqGJq5e
         +96L9mct/V0POPOmV/RjePhWcUKrDrddWm1Ux7rBF5UNOCbp4agwiYqpuF7ihfKo6mPm
         Jj2eTPdrnN2/3rqT/Zg7+BPP1unczBodXjq+mpfIG2l2Z4rySoaxPCuI/JxeDTC1U7NS
         ar06y6NmFh6uTqA+oy+yE+wuVzD1rEPbQhLAip9vtMNg/o6xmgUDvHpaLKbp40IlEqxd
         A9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713822656; x=1714427456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g9fqO1j7nGC7mqxM8+vhaDwkB+4GVS89I3wWxh/OYo=;
        b=TtnIx64wuhnYD8LQgV/WtfuX29SY63JvyxuP/ww35Zzon5NPfSVq47eT2y9QgRe/FI
         7XhnKotFvU/YiazKB91UTfTUKcQI4c4/xhxOGDaRWNl3kQzZbZlcY8SJGwA92aX1rcmf
         qgIzwE2ISK+gjR3m2vPq0Od5dTA3TXtn/mt7sjFUgXlIe+rWcugy8hiDZ8o4D+Hyjb7K
         ZJjXbuFPsb1RaxtMVrgYlr7MP97YNjc382F8IIs36rqHFzdbcyEui4SFzBugyAlUC8St
         cOnVD0XaWLMwwPBzYSnVwndV2XeHxqEI1i53YKbegJ6LIu88DqnTW1xt2JZmMrfxNpq/
         tbGw==
X-Forwarded-Encrypted: i=1; AJvYcCWmi8MWbm20W4BzaY14xxfDVB7MxfvoInKm0NdiuLwg+bfl/2kjUixK+drHAc9gPJn+zcZdtXfJv3VhKgAOG6v0tMIx9Q==
X-Gm-Message-State: AOJu0Yx4u+r/DY9xYjMglaqjoIghY6nes/svO3Ul/yRjlVWaDC3P22kh
	vN4b2VbK9K3ccILC11t6MN0V3W/udlLEf8FxsKKhfT+2SSlKVhQ/09+6eRhhtltFnb0UxNSboAR
	qAHg0lIFqrUhrKpf453dxaZXACNzSzjSmxZqW
X-Google-Smtp-Source: AGHT+IHw1HSd540Mc4GVxFQUH9JuWeKPQLcKJNjzcu4aRJ68X1opYuFT6RF0RGXRuHTUyU3GD5/AB1uaaS9PQVg5QJM=
X-Received: by 2002:ad4:4388:0:b0:6a0:5622:f206 with SMTP id
 s8-20020ad44388000000b006a05622f206mr12465227qvr.50.1713822656429; Mon, 22
 Apr 2024 14:50:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 22 Apr 2024 14:50:18 -0700
Message-ID: <CABCJKueQp69XC73HRmZ-8pWwraz0keR-OfS9gq7SFMO7mcUT9w@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] CFI for ARM32 using LLVM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 11:28=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> This is a first patch set to support CLANG CFI (Control Flow
> Integrity) on ARM32.
>
> For information about what CFI is, see:
> https://clang.llvm.org/docs/ControlFlowIntegrity.html
>
> For the kernel KCFI flavor, see:
> https://lwn.net/Articles/898040/
>
> The base changes required to bring up KCFI on ARM32 was mostly
> related to the use of custom vtables in the kernel, combined
> with defines to call into these vtable members directly from
> sites where they are used.
>
> We annotate all assembly calls that are called directly from
> C with SYM_TYPED_FUNC_START()/SYM_FUNC_END() so it is easy
> to see while reading the assembly that these functions are
> called from C and can have CFI prototype information prefixed
> to them.
>
> As protype prefix information is just some random bytes, it is
> not possible to "fall through" into an assembly function that
> is tagged with SYM_TYPED_FUNC_START(): there will be some
> binary noise in front of the function so this design pattern
> needs to be explicitly avoided at each site where it occurred.
>
> The approach to binding the calls to C is two-fold:
>
> - Either convert the affected vtable struct to C and provide
>   per-CPU prototypes for all the calls (done for TLB, cache)
>   or:
>
> - Provide prototypes in a special files just for CFI and tag
>   all these functions addressable.
>
> The permissive mode handles the new breakpoint type (0x03) that
> LLVM CLANG is emitting.
>
> To runtime-test the patches:
> - Enable CONFIG_LKDTM
> - echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
>
> The patch set has been booted to userspace on the following
> test platforms:
>
> - Arm Versatile (QEMU)
> - Arm Versatile Express (QEMU)
> - multi_v7 booted on Versatile Express (QEMU)
> - Footbridge Netwinder (SA110 ARMv4)
> - Ux500 (ARMv7 SMP)
> - Gemini (FA526)
>
> I am not saying there will not be corner cases that we need
> to fix in addition to this, but it is enough to get started.
> Looking at what was fixed for arm64 I am a bit weary that
> e.g. BPF might need something to trampoline properly.

CFI is disabled for BPF calls by default on architectures that don't
define __bpfcall, so it should mostly work. However, it should be
possible to add CFI support to the 32-bit arm BPF JIT following the
riscv and arm64 examples.

> But hopefullt people can get to testing it and help me fix
> remaining issues before the final version, or we can fix it
> in-tree.

Overall these patches look pretty good to me now, although the first
one doesn't seem necessary anymore. I also suspect some of the
function declaration lists could be made slightly less verbose with
macros, but that makes it harder to grep for them, so the current
format works for me too. For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
