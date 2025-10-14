Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0B2D73BF
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426234; cv=none; b=uIB/PGjaGHcGdHKvEhiG79nc2s6kFGyndnOidN8+Gm8m8nThPk1N4L8jzxnQMw6Vm37vmF9w6N/xYttTV6DYm+nPpCqz0IaHShXJv7bCEU8bf6KNj1IGBSsDuew6zJ68K11U8hT2flt2qWiMwI3HC+WVMp6wdTeyQxhJIGKNxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426234; c=relaxed/simple;
	bh=qcHTUS0wo1f43VFStYszqJZcg60j4r28QkB5kGixAXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxN/44al7toxCrE/yiPDZC59TKiB8mlkvhU1betfbnEFpuilidd+xj6sfzmbYLadAeJR1SvhyjZ0EnuUQjIpsQehkLx/Mw/oW5M1lPU8XRwtrMLMjQVIUmDXz+yyYdsJSNjLSO86Oi85bavJ5L/MMI/iWcH6rQR6PWNmQPkRhPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5b62ab6687dso4989487137.0
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 00:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426230; x=1761031030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LJPJfcpv0pJD66G650kRDT3CGUnlnJtrjGpdse2lj8=;
        b=n2kNjZLO9y7jkahtnerqQ2m7AxSpDghDrxYB7u8aRshek0z/PNIlCXaP/Kbvjgo+NN
         PZQmt68XzCRlhRa86UZJlbqrOfAayhHApv8+0/iV4s9utd+G3paBc+9Apn4dNCuaEoqc
         xraC2X+PeT9OSr2plc8Et40avUzpmGuTIdEMKWEYHhnojgVxwv1hmlXArSANmY2kW8qJ
         cel5eVpvPS8MN767LJLdLBR7EMWkd0wxjs2KjpASkPcZRaR2N3E94RM6QvzssSaY762h
         yA6wEaT6AhiiduJ/I5YCyiUpxwAQkr2jYYG2pz7bgv628lXx3K8NY3vLas38t6lhQMgR
         0fTg==
X-Forwarded-Encrypted: i=1; AJvYcCVCA3p4khOseYoBOCCh8CbLQQEttw5Tmg3jgrnrLDaG+nc6ur25MTRqC/FGejQP8FtWjKpq@lists.linux.dev
X-Gm-Message-State: AOJu0YzUqAliE4ELf3opzr+5WZAEBeyqdeyxznVO1zFb1fy7DycFTgef
	X4ImLNSWxW7p9LynWSJYKKqzfGhoACJlrptpnOs881B/IKIm3AYl5A/QSgorXVIV
X-Gm-Gg: ASbGnct0rGCUG9jS+7/4nszADGaUGNeXiExNnhpTTcnWx/d++4G9iZSoDNBV6vpmgjV
	RMnilYCQZXPgYCXnqQ1t27D0EjcfHlnu8661se7YIiwTdcvTYuqpCuP1qAFfvUwR+wQ6CvxiDu2
	XC8oQeqTs0rNFCElS9fdazfhZgb5YZO5d6ZVIMOoxjpAOTzHsrElD8t7QpAxQJUe0QkSurAPA2X
	+N9gWb2ETY2FLDwaQSCOt82R7hi0SCo/jASzoPYRSfqnUbM+Wmo0qzE1TfIywIfQOnLTwB+8AyN
	qOxtKyakghIA8bJEp3Bi9DIMBvOV0NrT12Ihe7pDO3f8yBzQgUZoSzsoZyGiwkiB0osCVwyhdrh
	ij6oQNAqSb5XtlJrDhcxFf4q59xuba85uno0IlCO08fjkxhdNfhseNt+RHFMSeUqCvojLXNAsEW
	McE4tVIXB05BA7kQ==
X-Google-Smtp-Source: AGHT+IFl5PmCwLPUh3vz9Ren2IJziJrjW+OhzkV7SnEc+gqRg9bJTCF1ORcqwMSbOkd+RtzOmmyWaw==
X-Received: by 2002:a05:6102:4187:b0:5d3:fef5:8724 with SMTP id ada2fe7eead31-5d5e2352439mr9454318137.26.1760426230130;
        Tue, 14 Oct 2025 00:17:10 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8f0a48sm4099799137.12.2025.10.14.00.17.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:17:09 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-904d71faab6so3879581241.1
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 00:17:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM377Jv4wirZJmjYJOCSaa7xQ1riJXgPEAqdCBh9PtID88XDapk4EPkLT1AL9Il8PPbjtj@lists.linux.dev
X-Received: by 2002:a05:6102:3c8e:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-5d5e220420bmr8840762137.10.1760426229660; Tue, 14 Oct 2025
 00:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-rcar_pcie_probe-avoid-nocfi-objtool-warning-v1-1-552876b94f04@kernel.org>
In-Reply-To: <20251013-rcar_pcie_probe-avoid-nocfi-objtool-warning-v1-1-552876b94f04@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 09:16:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZvoTyWcgRp6TnkybnKY4ekfO9aB33iumPVaR7wvEXkw@mail.gmail.com>
X-Gm-Features: AS18NWBECJtooFXj8wIhcLw2_n3BPi6xXTVAMYxpuf1MNXW6QPz_d-TTeadxeIw
Message-ID: <CAMuHMdXZvoTyWcgRp6TnkybnKY4ekfO9aB33iumPVaR7wvEXkw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-host: Avoid objtool no-cfi warning in rcar_pcie_probe()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 13 Oct 2025 at 20:26, Nathan Chancellor <nathan@kernel.org> wrote:
> After commit 894af4a1cde6 ("objtool: Validate kCFI calls"), compile
> testing pcie-rcar-host.c with CONFIG_FINEIBT=y and CONFIG_OF=n results
> in a no-cfi objtool warning in rcar_pcie_probe():
>
>   $ cat allno.config
>   CONFIG_CFI=y
>   CONFIG_COMPILE_TEST=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_GENERIC_PHY=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_PCI_MSI=y
>   CONFIG_PCIE_RCAR_HOST=y
>   CONFIG_X86_KERNEL_IBT=y
>
>   $ make -skj"$(nproc)" ARCH=x86_64 KCONFIG_ALLCONFIG=1 LLVM=1 clean allnoconfig vmlinux
>   vmlinux.o: warning: objtool: rcar_pcie_probe+0x191: no-cfi indirect call!
>
> When CONFIG_OF is unset, of_device_get_match_data() returns NULL, so
> LLVM knows this indirect call has no valid destination and drops the
> kCFI setup before the call, triggering the objtool check that makes sure
> all indirect calls have kCFI setup.
>
> Check that host->phy_init_fn is not NULL before calling it to avoid the
> warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510092124.O2IX0Jek-lkp@intel.com/
> Reviewed-by: Kees Cook <kees@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for your patch!

> ---
> Another alternative is to make this driver depend on CONFIG_OF since it
> clearly requires it but that would restrict compile testing so I went
> with this first.
> ---
>  drivers/pci/controller/pcie-rcar-host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
> index 213028052aa5..15514c9c1927 100644
> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -981,7 +981,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
>                 goto err_clk_disable;
>
>         host->phy_init_fn = of_device_get_match_data(dev);
> -       err = host->phy_init_fn(host);
> +       err = host->phy_init_fn ? host->phy_init_fn(host) : -ENODEV;
>         if (err) {
>                 dev_err(dev, "failed to init PCIe PHY\n");
>                 goto err_clk_disable;

I am afraid you're playing a big game of whack-a-mole, since we tend
to remove these checks, as they can never happen in practice (driver
is probed from DT only, and all entries in rcar_pcie_of_match[] have
a non-NULL .data member)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
