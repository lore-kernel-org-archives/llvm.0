Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCB53384
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712855756; cv=none; b=aQ5qVHuYmthHPZ+5UxMlTzQhef6A6aZrOaeifQHW3dVT1mb4Uo+EgFf/7NfWwW+jMf7klU/vHDXr6M9bIoyLXJF2YmNkk/WvU/lrzz7jFJTlX9XuvFHiM84VfmNpc7CS6AOrdqLU0jNZj20agUufh5ryb+YHBQ3LyGf5uLij1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712855756; c=relaxed/simple;
	bh=hz5iiCnU83ah651kQ7jAolMEnarIi+rVezSEnYBEX+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9u4sJ1t6/P043CXQpeFOFIzLLtyPv/YkmCwvrd0wFZK9gtlxbh59uSNue6CAW0hoKbwaA/hSC4+1VNYjtieGec1/9X7/oUCDtclEDpTeewUrHnzD2KP16ZHZSm1IVEvEwW0BPLfejafNrZlmpjNUouK6DKfl8v093gp+JQrspg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xtYoeSxS; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xtYoeSxS"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4db123c762aso30469e0c.1
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712855754; x=1713460554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To4z9UmMI9cuRfj5YaEO7iuspgkYCOJTB+CRNWJcwHA=;
        b=xtYoeSxSJoW3nF8Ip7iuSvdEwu7gusEtAR3EzDse8rJe5VrepwBEcHxMfjmk7k1+EL
         gTZlQCHFw7fOe0WBy/Iss5h1YOw9G61ClKMufY3QA4rlflCcEzpX7herDO7cQ7CVZXAm
         zfwhT6b7x+5szY/tYjCyNMuehyhETKk8/PDuwSWm8TEtOjwmEc1ZddSkJbSBy6ZNPTWb
         3tadSoOWz3/SFK53he8yfkBLelMbVc0MKvNCjJqK+LIGrFvFovEVi07jjlB1720rNogf
         Pgjg/VXQSTjWxmv19wuPrvvZdWAkDUwvFxwXEAPoSzDVyLqk70jUav9DmoWxKqAxgtVk
         WXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712855754; x=1713460554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To4z9UmMI9cuRfj5YaEO7iuspgkYCOJTB+CRNWJcwHA=;
        b=hfxasUGQRb24eBpaWU+w6MLS/b/afeURdG4zXZDGQSZ4/8U9AOxGwoDOhMScAV4cwO
         mPTjqrodpl1pM8uBTu1c1tTbDJe6SEVE+Br1E4wRea/O8eTDIIR17xV6TY+plvHjL4Hh
         OiFAaLbLo3kNiUifh9a297ZeoDyIzj6vKiJIji0eLSAH9wAaee09mdiZBLl+2GZN1m4h
         Tz5uo36eL2EYXX3HroNLjCOluSGmM2l9GSjk38So8cQ1emsIsMMTWesIE21nA41XNruZ
         ZvzJCU0BYvRteRkX5H90U2XHDvezcJH6yUpV7xbj7r8TNW1CnQC0WuAyifmQEyTUp/j9
         zcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpAM8WAevTfQNaFA5F0zcI7CIrrYPf3/ymnWLaENIfOv93dmhcUqTDtBy/HiYspjbQhl8fJ1++GHF64lctraWDxHa9xQ==
X-Gm-Message-State: AOJu0Yzs42UsdK7YeVXPB68vvTTa12N6ssRZRljB28fnH0PKGFawP6ke
	JBtAjDgvKGz0x7jJZwCXxQKyj5OxMABq894z5norxwKldjwyOOmBp7D7MWa4bVpKTGVDHWip3dc
	XglCR7opMxNDcT130Eavtrs7wLtQOKoatnqO/
X-Google-Smtp-Source: AGHT+IG8Mab463ffes2ANkePLtsCLN4JtRtaHVbTkLMIpOIAKgLXt4OnkFal81PiCyeO8tfml6LLHVcoAQLc8PxSbOQ=
X-Received: by 2002:a1f:6682:0:b0:4ce:96b7:c2f6 with SMTP id
 a124-20020a1f6682000000b004ce96b7c2f6mr2537665vkc.5.1712855753645; Thu, 11
 Apr 2024 10:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-3-debug@rivosinc.com>
In-Reply-To: <20240409061043.3269676-3-debug@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:15:17 +0000
Message-ID: <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com, 
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com, 
	cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
	conor.dooley@microchip.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, shikemeng@huaweicloud.com, 
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com, 
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com, 
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
	wangkefeng.wang@huawei.com, falcon@tinylab.org, viro@zeniv.linux.org.uk, 
	bhe@redhat.com, chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de, 
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com, 
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:12=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> wr=
ote:
>
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/li=
nkage.h
> index 9e88ba23cd2b..bb43ae7dadeb 100644
> --- a/arch/riscv/include/asm/linkage.h
> +++ b/arch/riscv/include/asm/linkage.h
> @@ -6,7 +6,49 @@
>  #ifndef _ASM_RISCV_LINKAGE_H
>  #define _ASM_RISCV_LINKAGE_H
>
> +#ifdef __ASSEMBLY__
> +#include <asm/assembler.h>
> +#endif
> +
>  #define __ALIGN                .balign 4
>  #define __ALIGN_STR    ".balign 4"
>
> +#ifdef __riscv_zicfilp
> +/*
> + * A landing pad instruction is needed at start of asm routines
> + * re-define macros for asm routines to have a landing pad at
> + * the beginning of function. Currently use label value of 0x1.
> + * Eventually, label should be calculated as a hash over function
> + * signature.
> + */

I haven't seen the compiler implementation for fine-grained Zicfilp
yet, but in the kernel at least, this would ideally reuse as much of
the KCFI plumbing as possible. For example, since only C code has type
information, we left the type hash computation for the compiler, which
allows assembly functions to just reference the appropriate
__kcfi_typeid_* symbol.

Sami
