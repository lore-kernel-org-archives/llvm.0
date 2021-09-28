Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D82F80
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 21:44:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g7so628791edv.1
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 14:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/OvWBlXIC3vAiOn884UWZV20fUxwEJyO2lDA28+sf/E=;
        b=hVZm+Iba9fHNkhnmfNB1AbH1LpNEe7jMDaK4jiHnsjnThMdsYOmFjWOfwdHpdznSz9
         WV/equMm28tsPhg8snenVYB2KQg6gi7ZPfV/jNGbD2cQr9hZFtFfFxdUClVCPDgno5DN
         +2FcYUj2ijocVOFQSFOHa+BBegr9dTBOayzGGvAxKo2ZV1cLqX/P/Go7JPTYn0pqDBpZ
         YrX/1Zs72RSN5J5H1vYjw3/yUY05b3/FD0VR7OUVEz//KizuGcdcg2e5p5m8QfW60IKH
         +3YvN2yhht53qOXlnE2ydKzznLYhMJdSXGakGHu+rtGMb5k3gYPGeyCQ7wRee+AC+CIz
         04QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/OvWBlXIC3vAiOn884UWZV20fUxwEJyO2lDA28+sf/E=;
        b=gF+9DhXwRDo8o0np/nIsGlKOR60j6F1farWxEYvximV3yHYKFW/5eNJALth8xVMDqq
         XhpF/LCRYPV8iB4JoQKOXHGKsEJxGr6Ix0g8hO5vlb7EUGiUlXLSBIWS4pRmze8HjES5
         XOrAdk5fOJxY5l9YMtEiy1FtpnGcXRv/18/YInCcBiPSHD8f159xiGYlReaoAuA4VMVB
         PKi0OmkzUfixojfLUjobP2tDDoIVQ3aHNUAoyewRzHIumXxZX3zDJS8YUQLY8i289CH/
         c38IFWZ+fGzVeZ0ObnkKg7pQwi+gY7scv4xWM8bo5qMn/Zu/4I3qwpcGjOui4hbo67Z/
         7xvA==
X-Gm-Message-State: AOAM5313IJuoa5w43BFRTVBf4U95T1bCd4RVdW6x3wmHq4yA2vJqAl09
	AwKH28p2k20jPstVqmXOzZ6V8QEnz8oL7odPa+nlwA==
X-Google-Smtp-Source: ABdhPJzMysAzvEEoqbdkqUNii2z3Bkjw4Co1mDyvel80h8sKftwI/zcnhzdgGdWA1oucJ2HRG9U7hQ/xqa2+puwgLgs=
X-Received: by 2002:a17:906:8618:: with SMTP id o24mr6798492ejx.189.1632865461191;
 Tue, 28 Sep 2021 14:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-13-arnd@kernel.org>
In-Reply-To: <20210928154143.2106903-13-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 23:44:10 +0200
Message-ID: <CACRpkdZ+v4BPSJhmztd5Visyo3tMmJXDBXOt5B_c7BdtvBQuQQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] ARM: add CONFIG_PHYS_OFFSET default values
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Nicolas Pitre <nico@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 5:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> For platforms that are not yet converted to ARCH_MULTIPLATFORM,
> we can disable CONFIG_ARM_PATCH_PHYS_VIRT, which in turn requires
> setting a correct address here.
>
> As we actualy know what all the values are supposed to be based
> on the old mach/memory.h header file contents (from git history),
> we can just add them here.
>
> This also solves a problem in Kconfig where 'make randconfig'
> fails to continue if no number is selected for a 'hex' option.
> Users can still override the number at configuration time, e.g.
> when the memory visible to the kernel starts at a nonstandard
> address on some machine, but it should no longer be required
> now.
>
> I originally posted this back in 2016, but the problem still
> persists. The patch has gotten much simpler though, as almost
> all platforms rely on ARM_PATCH_PHYS_VIRT now.
>
> Acked-by: Nicolas Pitre <nico@linaro.org>
> Link: https://lore.kernel.org/linux-arm-kernel/1455804123-2526139-5-git-send-email-arnd@arndb.de/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BTW thanks for this very nice cleanup patch set!

Yours,
Linus Walleij
