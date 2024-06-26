Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958019048C
	for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719435567; cv=none; b=MX7n/jVZCLKLbmiNyg4b7uIk4YgBBkDZaNOyxwTaUJaxtvdfui55HwODusgkPKLWITvljqREaHY0EIXrwHv1/G6wlP7E60s8NF+EFN13q7M51AmTooflNhLohnUcHJTdq59gazmIq/9A5fKfRh7zAXI3giyn1f/rKGEUrdph9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719435567; c=relaxed/simple;
	bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlEWeeGkgH5Nf63BCjlYrqZrSTp0QsyBqaEgdt1iCNcnYpAF6pM0vvZ716AAaMXOcSWb912aVh29jhr0W7ixuReeuwhHpDdG/fB7Ev8kXGh9kp1YUmtnglSTUNCx0ixOtAucFCPFOVPjrRZ1bcRhsO8vshcDeAI1USk21TDuSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxJhgpgb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxJhgpgb"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5295eb47b48so8620239e87.1
        for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 13:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719435564; x=1720040364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
        b=cxJhgpgbmp+zcsXIVTZ1zxPGuc7rt341sGBfVdyDVUrMCEnTJU7UEdZN2yGuBr6fup
         1wWOtgVuG7GORieYRw8vBtHljqPyl7vKejrLfqandRvlDvXSuYuDpwH4GZKh7fCI/72U
         DRsuTd+VuO8h4xR9cM6ISc110dzHsGc3aOT4MvDLpfxLWL4N+X47z7EHdB66Z2+9d7IS
         5p3Z24or2Nek98R6//demaprFdGJws95dhwHB+OABZUAFx/2lVTVZ0vzqEcwS1EuCnbD
         DYsoIpQrve3lbAq7k5qlsx5pCpM7DlVXYqRPA6ofPAzBqPnM+3Tfi+ZjGq0tTBJT7Xj1
         +VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719435564; x=1720040364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
        b=uGsNJzLbeYSS/yFWQR0tRLMEVyr3Mf8KLZujqz26ZdhUvswjnzBQpa/j2WiVe3EQih
         0tzUY2+p2O4R1o+hqQxpaTqYr/FjxB4MvF9NQnKaZdB5F+2kZbiZnEY5JiYciSVQ0bI2
         N3OoA5u4XZ4AzoQcYLVn75YNJTmSR+2zQcaziiciygQEp+vbXsHhH4EYJUhXexCe7sNZ
         5YD+arWkgLcTppn6Vq6poD9xkwm5kfRRW2ZUeOKM7hDV2QftDJIT3crAE2e4tQ4Lgt5S
         TxKnMod/023VHg7uT+HvZjSOx6pmmgSOPM1unKFh8DTLD50cU5jJZc045//gf26SfjAz
         P9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfh+bkDwlj07U2f4+x4vmiASPVGkK5sknIfvnNB4VNxagdiyj9/KkuAK3WQZgf9lLqiIZW0RJ1tDS8RJDEM/jIeiv6Q==
X-Gm-Message-State: AOJu0YwKdx/v/9wRsWr7ZlMcRdNXZIi+lqDKCMtzgJx7otyDJKtq4UuS
	iNgHfB3UMjSUEjxqxTnNMD8Ab8hmwVFVJpeTfpUBIMtLqJKkkEAPCDvkGXvkdKys4rZpu2J5AmG
	kYpju94WZMtgSx2hB2j0bEXpZTzbRC/kMA46P/g==
X-Google-Smtp-Source: AGHT+IGrTd4cIzRSRIXqqDuLILkPD1S/dVkHkeQdYhChs0LMTJ+8Aq5s53BLlJ7clCzY9u+1vmR2P5wcJjkV73+JlcI=
X-Received: by 2002:a05:6512:205:b0:52c:cc38:5e1f with SMTP id
 2adb3069b0e04-52ce0641433mr8913241e87.47.1719435563137; Wed, 26 Jun 2024
 13:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406260432.6WGV2jCk-lkp@intel.com> <20240626172154.GA50752@fedora-macbook-air-m2>
In-Reply-To: <20240626172154.GA50752@fedora-macbook-air-m2>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 22:59:11 +0200
Message-ID: <CACRpkdaXd1sosdWzWOpbtin1h2NFS88Dc3ZfXhyix+t1uC1L8A@mail.gmail.com>
Subject: Re: arch/arm/mm/proc.c:82:6: error: conflicting types for 'cpu_arm920_reset'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:21=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> Hmmm, it seems like the prototypes of the reset functions in
> arch/arm/mm/proc.c are incorrect? This builds for me with the original
> configuration and allmodconfig + CONFIG_CFI_CLANG=3Dy.

Incidentally I fixed it earlier today!
https://lore.kernel.org/linux-arm-kernel/20240626-arm-proto-regression-v1-1=
-089c23ea13dd@linaro.org/

I added you on Reported-by for now.

> +void cpu_arm7tdmi_reset(unsigned long addr, bool hvc) __attribute__((nor=
eturn));

The attribute is not needed on the prototype AFAICT?

Yours,
Linus Walleij
