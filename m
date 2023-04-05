Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646729A9
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 14:58:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l12so36492551wrm.10
        for <llvm@lists.linux.dev>; Wed, 05 Apr 2023 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680706737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22RndxDAcYTUmY2kPiSUATZV+V86fIqA8CXijZRxME0=;
        b=ZqGBQ9vNPVA+48EQUhzwUp+/WM53IeOgdUq3ewaCaqBbb8KK+ZrgBqGqifDz5crZgH
         /CleaEnxpWFOwffvcRE4PaNDqGEkHcmG0OnVDXABv3fNoyuPYsmlu61jRwXJVRT+0413
         mj3JxSMHJ4zfndN1qkJQtOlXmiTBVil5f75tStkVD9R/uslQhGH8H1MqAJOwCBRPjH+m
         pPbqDNNVAlFvGYVNAj6it/vbzhHsRPjyqEeiisOWJDq8uQmtwvTmIABAQmyolRpXrQlx
         u4jHzID07wGJh+JOI1MOMTs/Slm2YMjD7pi+6pusqv7u8uoeOcLu5iBDA0Y978a8Lfpj
         Bm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680706737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22RndxDAcYTUmY2kPiSUATZV+V86fIqA8CXijZRxME0=;
        b=LuA9r+6TgYTe8fyCBGEl9uMIfelhYoXsrM2f8GXz2F7BontHA3X8+XNPW6PMdpV+iY
         rO+R8r7mivtrrGgCUi1WNRQ6D8bSqHgJlPEFFgQmakrKnnFuYMCMgZsemNoD0GwKoD0y
         pSsClQHDgUKSz6kR4wiVIlS0BYQOTVvcWSUN9hAbIHeWOnAW+7jJJ452k/HOKxBPRWtw
         WopUW16xJ29NpUBDlUbWwKA3hlzXmN3j9YIMrcQi6ghq0NRwdAgbqxGgrIsF1h87gTGH
         tQ+fbsNyaP6YmkqRm3YTlWzuBSUil+U+7eUMlBpo3oNQ/a3F+IUP5oybOFa0Ui/aOU+q
         l7xw==
X-Gm-Message-State: AAQBX9c9MSxbdbAnN5wyr683DTBfwz9Eo8H3dKWJlg5OaZ9CfCE5/sJ6
	VWjTgtuGWS+m654vbq9dl05lWw==
X-Google-Smtp-Source: AKy350bfWb7Q1dmeYeMrl784mM8dxuKi/bAHVMH6KYjH4SSAhIOa0dR3y/3E8flmAsd88iA8B0uhtw==
X-Received: by 2002:a5d:4283:0:b0:2e5:8874:d883 with SMTP id k3-20020a5d4283000000b002e58874d883mr2297075wrq.8.1680706737309;
        Wed, 05 Apr 2023 07:58:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d474f000000b002d7a75a2c20sm15255777wrs.80.2023.04.05.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:58:56 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:58:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 11/23] RISC-V: smpboot: Add ACPI support in smp_setup()
Message-ID: <yqged6rmz4qb6sxhjfmypnjx3tmmoramynt45rszr2dk5awlmr@ovhlptchhv7t>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-12-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404182037.863533-12-sunilvl@ventanamicro.com>

On Tue, Apr 04, 2023 at 11:50:25PM +0530, Sunil V L wrote:
> Enable SMP boot on ACPI based platforms by using the RINTC
> structures in the MADT table.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/acpi.h |  2 +
>  arch/riscv/kernel/smpboot.c   | 72 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 73 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
