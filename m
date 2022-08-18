Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91C3C1D
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 11:17:46 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id w19so2613292ejc.7
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=E1NipNzUWLZ2palbEix1QtbCTNgOpAKdVPPFyst0N7o=;
        b=YCwY2+ZOwZePVXHIed870W0AMBgz2YE11uL8soFdD2/JiKrKB7+vx5++xVceVEdfv4
         f+3HWdO1z9ehFa6qO4t68/0/LzqpthaY/C6NCXUI1zp4UheqE64y4qTyK2KQzD2tnFiO
         jIAkKAGKTeTAnV0OdfZwZoG5dGzccmnChgDjGByCmSXCxjOJFDalhFBdk4jGtDTd4TKT
         VOiT1pJizr8p3mr9rGhr8Cc9eWbUZVB+oclTSvJGwHNQ+rXa16IgiG7190sjPR99Xski
         vSwf/zjuFbcqVkEyDGyc7mHpL89dRdJkK4PhO4CY3g0nCTgARc+BXL5F18pAu+RVAyMu
         1+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=E1NipNzUWLZ2palbEix1QtbCTNgOpAKdVPPFyst0N7o=;
        b=6HzVNovkC308rF/tFQhVUGHx77S+1Ik6nFp83FhJjc226mPRMSoVQFbXVHp8IF/Z/B
         IqetvMxvVF027VYmPvI0WU9n3V3dIarMShl83I9TPTK2ZWTAjvT/RWiDZ1KnH7Z8sqku
         UDVKoGSVxAbNLwOo0vEg78d2xtkilFnQCng3WCnx0X02r0N08wBrL/SaeLqCCwzkLMyA
         yWOxw6x5Y9fgorDloUAqES8VubStSVZq95JSqx3FGbDwtNqcwim6kwwCcvJD3RbAJLE6
         Fdz6q6wQw/TIhoT5KX7vnxow9CdmHuFba+lh88dFCWh12F0YzmcaFB7cpdgNStVAa/Ka
         ZNDQ==
X-Gm-Message-State: ACgBeo0Gj8DYawyLtOd2sDXQw+FnIspkY3iBAzSrk+FFVMnK/IjbdbMK
	MLQOSST7xmelfIGokTkwtFu3Bisc11SVwx5Fh7fLBA==
X-Google-Smtp-Source: AA6agR5b8bP+fivEf8sWhn4cjq7X6RpjZuI0sL1iRR2iThKSe11tnOp6MF2tDz+lsllpLbtZOzvSG3NbTnoaTALTQtY=
X-Received: by 2002:a17:907:6d98:b0:731:2bb3:8e17 with SMTP id
 sb24-20020a1709076d9800b007312bb38e17mr1597869ejc.203.1660821465138; Thu, 18
 Aug 2022 04:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208180333.1pfLpmaj-lkp@intel.com>
In-Reply-To: <202208180333.1pfLpmaj-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Aug 2022 13:17:34 +0200
Message-ID: <CACRpkdYkRL0Yavgrg378Kte3mpeCTXoPu-Wnr0T7deNDyt2zoA@mail.gmail.com>
Subject: Re: [broonie-regmap:for-next 4/4] include/asm-generic/io.h:187:18:
 error: redefinition of 'readb'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 9:53 PM kernel test robot <lkp@intel.com> wrote:

>    In file included from arch/hexagon/include/asm/io.h:311:
> >> include/asm-generic/io.h:187:18: error: redefinition of 'readb'
>    static inline u8 readb(const volatile void __iomem *addr)
>                     ^

Aha. I'll hunt down a hexagon cross compiler and provide a fix on top
of the regmap tree for-next.

Yours,
Linus Walleij
