Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549A3EEADE
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965252; cv=pass; b=UMUctoX4zf42kJJNHC4qsPLU9etU3EB3NjhGrakrgsTDZgq7tmRL1+3Mb8QW8UcWEy2AzKakw9U1KAytGNIhQ3vi5l5iq/q7PC7mBxwXJAYqN2YrAAoB4Eme+Yr3FSZVgi4SCVUuKTfS1dZpQWIagahI2L5TUwtttAphPmBGZgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965252; c=relaxed/simple;
	bh=CRFBAY+HVM5zLw5Wlht8AEmJgsCvF8cPSHZXyZDpiFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXHH6RuYk/q0jn3EtiWAEDcFvKjlOJfEOu95m38wKW6OO0fFsd5imhEI98tu1kC/IVr/Mo0ge3l5TOzYmw+kGbUkNpYu4/HxvHKmEZpItTpOmRDzMYnqvz5P2zHnPAFSm5dXbQxBdK3c8v1V4ea+E1z7Vl6ffCOrf3pJK2XTfrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPa4ORhe; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPa4ORhe"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d111ca99so167340966b.0
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 14:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785965249; cv=none;
        d=google.com; s=arc-20260327;
        b=UWGaU01T6kAcYhvtPHevs/K8aAINr8FPCG57P2y93tOe5ptGwQtS5kgtsEO+82PIJg
         X1hDdDkwX13Q9UufU2i3b/cpIuSBltZJOuxGAyNbzF9S0f9nU2N24AAi8dNoe65Aoxfj
         vWN7gdQDTnSnT+ggYElXP1J9Y364iaC9OjoBanrG6992HdlFs9L4xxKnQ8YyDWvN6Vc2
         nyhA/pCO3hB+n7MybgehBGdU826iC8hZpj4qwzbUd2oOaPKwT/OLeo3q6c6IRsADKT04
         s8KWk/RfFz/MUTBMu3waeuN0ed5NGnmbn2h2ElVMBlG1L8Gc3JqvRoN0yh3/E3cW39+x
         IWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        fh=AKYEMEsGD57PSpTvBZI7XMTmLlS/6osVj4zxmf3XHDg=;
        b=Ujwv+sFRliURUwpJqH6a1wx0XuN2DdopKOPAZDpLxFKbcXKhQnZQtTsJbEbbfkx3U7
         wSf8Hvx5yXFHpk8EFRakSfKCyhHGin2aD9VfeOqQL/jXWhGi8ArBkoZNJ69gm4opq1qr
         8zUY7y1RfgsVmxNB+ehKu1QOpKg/fU8JcHhsThonG5D/HkHwDS2cZhhKBpnVih/j7t72
         yQhynsqL1lTIWHSxNNjUMRtK9kW7LZuBuYWMsAED3wDqVr3EJS/MNWQrl22D7nESQGad
         4/5Q4gh7qc8oPWXWu2zGNxoCiW+SMHi9oH1nWsm8WKfaC80VQWBRUKnGeTnd4TadgF9f
         +XQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965249; x=1786570049; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=BPa4ORhe4xgHERnOrqc4qtbk2eSSw+LU1t+vWRJMyMKdmnZCXs51C3TUo6oHPLNIzj
         Zv3uawYUxLEtXOsRvDYakMI9I81kywAEwOHPNnQEN2YWf5Xq3CjVd/s8P74Ex/3MwG/f
         UbyQ6OXcxThhFFvZPWtSI8C3WUYbKds5dS3PqxGn1zaH9MAWBo5wMNNFz03FzHNwiLy/
         sL6YyeVjgH7F0jDIQKNctNhXpLOGWMgMoe0VMMvW2Z5EzS5JYuo2IlN4UxhB279gVXSX
         xXfVJRAhie+4dyEmEoSiyxA8hRhR+byLUad+BLP93tM1dTodOsXR8j4ByeBDrLPXmyZm
         XItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965249; x=1786570049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=mTt5/2EKmB0p/pB2rh05QnCxnPAUXrRdikpkG1XERCf7MsZH36vNdzGcbaxHReSWtL
         MpO5a8ERXntop1uGkXyy/0K7mAjVKh3H6646TTUA3DAesFVUcOI3N7L2YbyIKQvQhw2j
         LtakbeH1h5RJaRZu3pUEPWFMQHDGTjpy++k2S4hsLTN+0f8VkWjCjYK/lPvLsNPML2Ig
         m0eAG0qse4IktIptjFw24QPGTlrDcad4kh27KG+cdkoIvKtF8lTPQAX2UvB+HxMs2i6j
         ZQDdwo5AIUt5wLnB4h9AaEPO1YUcI1vxkoJyu5Js7z1sNf7zA5a/d8FVbag/DYLlsTeL
         f3Ag==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Fw4cjO4xt0UyldHubmh74G3mwNR9MbV/TW3eRXsrRSKdWIOwIJSic/AB8cdl7SPDljHA@lists.linux.dev
X-Gm-Message-State: AOJu0YyUvJ8gbifviYRsTqEL1fjrapuMq1pItmwFxGdE/Ui1/D0nnibi
	kpbYsoy3iiFYo6zfXqIq6VZMdCUxeZeUsHq4ZNCstf7R1SxFQA9qI2H5PcKkTHo0Q3dMg/MjRmT
	iSbPjcSVx0nt6bJnhfJF7plbCKqbCUhI=
X-Gm-Gg: AR+sD13mj+rjvpv+vuKvsvNBWxXceDxBnaUjFfJdtS9L9AoTxnG3XAIlL43NT6388on
	iHbaGp1XawABDjxOodt1uEuWVVM7TTMhyGzYZSWh8zmQHL3fRbQcXQ7jrJcyRDKmYdIK50AMNHt
	UGKWi6/yFJXMOcwpbRSTIT0+h2h+zjMX1cweXU5+1TR58z9JfImpe4nbM9V8qy7kOAISADc8vmj
	fVHJKnwUFSNWM2thoQVq+FaNkkbjufT1Pnc8yYstGfpyO0CezbE8MnqD2qolRK50anQSHFiyLC3
	7YN3fq2NdM3rjiE4VqJPZget5cfDSkaJRMcVmZW7AxQ2O9ka0A4IOtOy2H6FuPzA5JhQJKdblkO
	XetK4g0k+Y/Tr2Br2qI9IWVd22c7xEFn3OzMUkaI1sw==
X-Received: by 2002:a17:906:ee8b:b0:c16:2f5d:6153 with SMTP id
 a640c23a62f3a-c2039c4a94emr567212566b.20.1785965249055; Wed, 05 Aug 2026
 14:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260805185557.3283233-1-mattst88@gmail.com>
In-Reply-To: <20260805185557.3283233-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 5 Aug 2026 23:27:17 +0200
X-Gm-Features: AUfX_mwhW36EMELKBgfQ1098UaTRK9ltJYMKUq2mejLmJKQ4TTnz3ZPoJGmZ6UM
Message-ID: <CA+=Fv5T-+awQU1R5cKXdEwUdtCTTw4T29DomYEFBTNakBKjOAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Aug 5, 2026 at 8:56=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> That flag exists to stop gas emulating instructions the assembler thinks
> the target lacks.  It is a gas-only option, and LLVM's integrated
> assembler does not emulate instructions in the first place, so nothing
> is needed there.
>
> Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
> still passed for clang builds using GNU as (LLVM_IAS=3D0) and omitted onl=
y
> for the integrated assembler.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
> for clang") is unchanged from v1 and is not resent.
>
> Changes in v2:
> - Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
>   will be sent separately when the alpha backend is upstreamed to LLVM.
> - Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
>   so it is still passed for clang builds using GNU as (LLVM_IAS=3D0).
> - Reword the subject and commit message for the reduced scope.
> - Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5b=
a7a64@gmail.com
>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)    :=3D -mcpu=3Dev56=
 -mtune=3Dev6
>  cflags-y                               +=3D $(cpuflags-y)
>
>
> +KBUILD_CFLAGS +=3D $(cflags-y)
> +
>  # For TSUNAMI, we must have the assembler not emulate our instructions.
>  # The same is true for IRONGATE, POLARIS, PYXIS.
>  # BWX is most important, but we don't really want any emulation ever.
> -KBUILD_CFLAGS +=3D $(cflags-y) -Wa,-mev6
> +# Only gas emulates instructions the target does not implement, and only=
 gas
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)    :=3D -mcpu=3Dev56=
 -mtune=3Dev6
>  cflags-y                               +=3D $(cpuflags-y)
>
>
> +KBUILD_CFLAGS +=3D $(cflags-y)
> +
>  # For TSUNAMI, we must have the assembler not emulate our instructions.
>  # The same is true for IRONGATE, POLARIS, PYXIS.
>  # BWX is most important, but we don't really want any emulation ever.
> -KBUILD_CFLAGS +=3D $(cflags-y) -Wa,-mev6
> +# Only gas emulates instructions the target does not implement, and only=
 gas
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Thanks for the update. This looks good to me.

Reviewed-by: Magnus Lindholm linmag7@gmail.com

Thanks,
Magnus
