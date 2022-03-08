Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E492F35
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 22:38:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id q5so585214ljb.11
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 14:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=smV9KKIwtal78N+VJZFIhUWRO8IPPNUi5IDr0t+R4Ws=;
        b=d7vkIVIst9qON4US7u/M+bn/C/BeUE6U9qwyhC9PV8E7Xetpk/M923PcFvBg18HAhu
         BQwikQ1caXfO1kWZhaKKYcfUB0Wk1kTF9YHyw1o8SAGG+3zLJMYzKqUVzRgL31ahnaS5
         +a3NaaZsU5xX2oqtPCO1AqgKdE4cJ0laGtRkRYiA3Faq1qNGgWjpO/49bTPNAifihSvH
         3OmP9hmDuJwJEyH8yv3pnVGGMhDssfJ/DfHDMFK+0CiNXC2IXtXQRV6i4qKDCF1V8DZC
         kadkd/hhJnPG++pAqbLcJq7k7+lRVNlLQN1QqQTFILJ6tqWb9rmzbxdy0Ke8+Wx7/yHa
         5d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=smV9KKIwtal78N+VJZFIhUWRO8IPPNUi5IDr0t+R4Ws=;
        b=dzaiAARNOViNZ7RGj2OdId+MHgzMUqWGogR14bUAGoMNA4jNet3QyNS/Sho6q6SVN4
         dPfQqEJPA3nFM5LZRVoImRM+MJHzPOTcxiErbfvFqIRYIS2zQLibc0heex2CLRI/Q2zv
         bH+Pw0D9YQZ1TA6qK1rXPa11kLOA8oZDGPb240vE8ZbjOHAkfXBZFyX6Q93nXHf2Tmnb
         ZWIKivzo5ckQX6OvZsLjl8p/EUTBzo29zGe/IYR8bmtZ5BM6w9jnPNH0JgyDSpn7+Xjh
         TzsQlfKABdCBr9x9zZ1SKOlmPPsZt+13lQVotVTbhfxeIqdePcJ82YMoV+5LGUyjcH8D
         u6Ww==
X-Gm-Message-State: AOAM533dKZPIbhQHsn5WaQypoB43PRIwIZ5jhZATAKZNk/inBMFIBYZL
	L5lw0F//KfywSGHza//3feeubT5xQ/ezzbZOutPmGg==
X-Google-Smtp-Source: ABdhPJxN6GAvKr/FHemE3wibga1rWVqYX3/0uF9F+WUQsl0hJRH54Hys/fVjglz6Axqr0JadcVAj4Oi2AwcLXYREc5M=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr11875831ljb.468.1646779132243; Tue, 08
 Mar 2022 14:38:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Mar 2022 14:38:40 -0800
Message-ID: <CAKwvOd=iOS3HEUH1w-R4vYSNMwAzE7kr30FcXNZg0e1WBvpenQ@mail.gmail.com>
Subject: arm64 memcpy+memove 5.10 patch
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Manoj Gupta <manojgupta@google.com>, 
	Denis Nikitin <denik@google.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Dear stable kernel maintainers,
Please consider cherry-picking

commit 6c23d54f4cb8 ("arm64: Import latest memcpy()/memmove() implementation")

to v5.10.y.  It first landed in v5.14-rc1.

It fixes a linkage failure observed when building kernels for ChromeOS
under AutoFDO:

ld.lld: error: arch/arm64/lib/lib.a(memmove.o):(function __memmove:
.text+0x8): relocation R_AARCH64_CONDBR19 out of range: -6331272 is
not in [-1048576, 1048575]; references __memcpy
>>> defined in arch/arm64/lib/lib.a(memcpy.o)

(The prior version of memmove used assembler conditional branches to
memcpy; under AutoFDO the linker will decide where best to place
memmove; it may be > 1MB away from memcpy. After this patch, memcpy
and memmove are the same function).
-- 
Thanks,
~Nick Desaulniers
