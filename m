Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6259418A58
	for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798155; cv=none; b=RpfdoN3tKcJHL/pGWQYeP0MyAeDbgeNKZL3TFf02gBpwTj4wPM+VAI70Qn+64/31F29hSrkP56MiUIz5+ttCPEYy/N6y1S2TCL6lH4Qas0cMHC98sgrU5fAvEfjQQbR6WJeuBhYkG7AY3RQ5K2Z5NIWuLdpoGAwHOUK1lP9AxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798155; c=relaxed/simple;
	bh=mUo0Bw3C+bodsN9UVSLM51ud0jM2f1gq/odQxk5Ypmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS3eKVmXzGQE9wxXe2HZonKFFEp0ljdvWcrpHyZRn6v2Jpcu2xO8cSAwwI7p8d14QAFGo6h3HYWXkDWnxGp7ulz1FQ+H3pS/KVpRoOsczuyD4mTSC/Ed1j3f3vFxYeUP9QhSkbta/yCde2HTIxaKB0dnXlvmfiu04aNNYNleOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvR6fuk8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvR6fuk8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso408175b3a.2
        for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784798152; x=1785402952; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=UvR6fuk8gDo2QTGZNG+FnBi3jLQM0wCtyu23j56m8/g/lhx+cZ92wmctbfCaZ2IM/A
         PLmGoz3LJkSNIyZumNzd0nNOK+SExx/Lu1t7nQAeCOHwDd0RP6omLIzjZ+k9zGnmpRsE
         6lEt5WNp2t4WLsmwZqf3slgDS2uZefsvqtwhI7NmTGCOlYv0mSVCbOY7xjIDrvk3J9mj
         Qo0KTRSi3SpsaHZslBQHRYtrxJ6ENmuT31OcqNRkVTO9xK9IuwqY3vlVLgVQhappsK4z
         SKMCgQ6GKnX8oVwfrFYsZ3pvbF3iXjaCCYudKkrf1q+NVltN2XWqlX4XDWjqMu1N0pMc
         qcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798152; x=1785402952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=b7WpJSp5C4brQuhM4YrnL/bMWWYy5do2TAZx2Ii3LWiDCcdgAfhnqeyegRicA1cizU
         bdDWJfUk209kAUfw9VY2cfoTe3rt8VyLRzspYoAcPFoRutieXuvqJmXsnKtIeJvutR8j
         IxBFsrwg8AQ2Q+wfMcEv/y02FVNCt8WpULzbQYFhWDKVzhFvm7LqfYB4IHJSJeI95BHi
         z9kDlgIsi6W7HYTf65D5prp+oQvV3TGV2kFS2Hkz+arKYPpDHSInjM5odFTCMHT1SqIo
         zzyoGyOouCvKN+koFj+ivz0uyWTp79wOin0ZBVZp4HSgHwnLawnTM4NErYX9XuLbpgSP
         YwyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpjk1zG3TXszSboxuxk1+DsF2XaF7UQ+/cclswhf0kq7SEhMRkwiBgqRgfPva62dJzACvr/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Of/6gJTi6onOlbDCer2g7GKv3I9wkiokb7/Ex9wSVwH7gQfG
	gT08KL2KeLjEJ6ZFuENzqSvJio9HTF1Y3ANz1e3nC/0mRUloKIayN5Pe
X-Gm-Gg: AR+sD13RApv+MKJSv0p0TYmVR+Hk9ja9xJQFbnDDGtjd+ickga17nlqGXPIhYQKku74
	/hDPqnL6aimaYMfh9OzURbWpzm+ItjGCXzuZ8AKV1Vly1qsL0ILiYCwzEcujXvaj7h+W8emNB53
	Oy3H4RAvCsIm2QJX6Xec65D2Q7wK3F/c8+kt/ZgDnfy3anEMOim4ql86yyEuHEMKrQlVoVff4VM
	e8vC9Rt+HwuqxOMiXh7N4XaGSWr1vDCeHjTgB8R+0lzE+vtnpCuBP7Mpr3bwAcWXlAZRzmnbtI1
	XIhgZP7eie9Pnxr4fEXmf5VElLjVlBY5C02MtVW+u1V446dnTDbUJGlc385TXOS5zOiookDKeSi
	YcibKIUHIO4agUxoeMexMYWNhEDcForqeYQCH+kEMuw8FRegLeYoqjhji7LDgDv17JkU4v2NlfN
	OrhqFc/hZ9wO86gnJkawf39L/21UnMe/fgtTILq5SF+ugo
X-Received: by 2002:a05:6a00:3c94:b0:845:4126:222b with SMTP id d2e1a72fcca58-84e2b8bf81fmr2868281b3a.28.1784798151685;
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17600a72sm2738538b3a.58.2026.07.23.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:15:47 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <amHYO1c-5vzqSekt@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>

Hi Nick,

On Wed, Jul 22, 2026 at 02:03:31PM -0700, Nick Desaulniers wrote:
> On Wed, Jul 22, 2026 at 10:25 AM Akari Tsuyukusa <akkun11.open@gmail.com> wrote:
> >
> > When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
> 
> Specifically, was LLVM=1 or CC=clang or something else used?

I used ARCH=arm LLVM=1
config is here:
https://github.com/TeamYogaBlade2/linux/blob/d7633f01ec25209fc6cdde012128b19ac336ab18/arch/arm/configs/lenovo-blade_defconfig

> > secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> > expects to be entered in ARM mode in order to switch to Thumb via the
> > standard sequence at that label. Starting in Thumb mode causes the CPU
> > to execute ARM instructions as Thumb, resulting in an immediate crash.
> >
> > Clear bit 0 of the entry address so the CPU always starts in ARM mode.
> 
> Thanks for the patch. Any idea why this isn't an issue for
> GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
> need to address?
> 
> There's definitely some difference between clang and GAS here.
> https://github.com/llvm/llvm-project/issues/211376
> 
> I wonder if perhaps a better machine-agnostic assembler-agnostic
> assembler-version-agnostic patch would be something like:
> 
> ```
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index f22c50d4bd41..687ee7063a73 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
>  ENTRY(secondary_startup_arm)
>   THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
>   THUMB(        bx      r9              )       @ If this is a Thumb-2 kernel,
> +ENDPROC(secondary_startup_arm)
>   THUMB(        .thumb                  )       @ switch to Thumb now.
>   THUMB(1:                      )
>  ENTRY(secondary_startup)
> @@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
> without using a temp reg.
>                                                 @ (return control reg)
>         ret     r12
>  ENDPROC(secondary_startup)
> -ENDPROC(secondary_startup_arm)
> 
>  ENTRY(__secondary_switched)
>  #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)
> 
> ```
> 
> Can you perhaps help test/verify that Akari?

I tested your suggested patch and confirmed that it fixes the issue.

Device: Lenovo YOGA Tablet 10 (Wi-Fi) (MT8125)
Toolchain: Clang/LLVM 22.1.8-2 (cachyos-v3)

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Can you send your fix as PATCH?
I think your approach is better than mine.

Best Regards,
Akari
