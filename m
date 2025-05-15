Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BE268FDD;
	Thu, 15 May 2025 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747288422; cv=none; b=rTda/1X4n9lr393WafxGQtT9jAKifv5IJUqJRlSVWhRleiRTS8UCeO5WzrXK8LfQhgJfSXzjA9+05DmS4BCXejGfSnFFyCZSEvxj+aVmHsEBoVF+j5ks7UJScTWu00pxrlFT4j4OaeRxprZLTu7eXmEUvJdx7tiaQLJmikJaCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747288422; c=relaxed/simple;
	bh=QRe32xatwTRsoz+wj88ZVHN17zQOUDN3VJmsCT3pC6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sF9B4Q9tdtd9VDqVlO/OJBnqraclrFsrpuZ/4VdX+gW3HrboFhYJdqzvSBaRywp8MCJGNX1qeVJtpvcTWfPRFt20C4t2EPQKQDYmyboRxv55mIIeapDFH9WBcUbyE+ZvWp/Tk61uE8d15hGZzkJ3JAy6kCU1/RI3GyYCL9FN/0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ddbb0fc1e7so159272137.2;
        Wed, 14 May 2025 22:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747288418; x=1747893218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPyG0mlit4Fqvc3ieiHFbClT0DklwqbFDL/14cm9a+o=;
        b=kubT95dPb+Qlqi9JEH3QoS15Qtcu6DCWFZyci+KFEC/NINc3yZY58FrMc6wGI0XdZT
         gwiz3ZCkPF8aPSN3Znq+pwlTedqESgN/G7ljt5D6LoKLLeX5P5T14hjuzK5XYUm8ULQf
         G10GFstXTWhoBAH0RJfTkP/tV4zcr8L7na3M7IDTXYEPU0lSCEAQZExTGwIY1N6D0sBk
         i1D++t8JjUoKnX+FGMVEyl3y+4UW0TRkLRpQiPKSTR4teiuzD7pWJ6J01AVyKj46VMEB
         H3mVnUYNYIpZpGMVRpVZNnGdgA9KagC2XQ3hvIwq8fi9+LklAhzgzRMeDAlLH/jB74ak
         qQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVQKo280uAGjI+vUxYfccVq6m3M4b5QK8zCw3mgpw7G9B0Aw1d6y7pyUGC6/yKPVgVVc733@lists.linux.dev, AJvYcCXdq1k3Q6W0mHr7fVkUY6WHTU7yEwMxTZEfg/AEthr49EVuofh5NbJ5RbbeQqL30wjmfmfMGeCAa/Vi4yI5aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDADLQiSu7qATweEp7D1M0ICeiZEXQdgYkItUu01OwCeGX7CY+
	zAkqRX0sJdXARlhvs3Guk4/ExXvXlTt6h3iUUoi3qYR2SGh6/lGFa4wHFVcz
X-Gm-Gg: ASbGncuUBe+gnzBkLtMP2udtF8GAXKCPplyJHTtm4gE34jdxw9zUskTkSq9SHijKnPo
	h5aUC79MIMcp2lMB8BzFaMLnmhrl6e46swv9e+pX1BtkBGKlUVLDnwXFjTAqAogz5suz21spc6X
	f1zKgAi2MQTn1k2FHeS81h14HIz4g54t6IL49KASiqm7NEryEZPKj4+1Ho1y3eVKf8BHo4upqqd
	YParPavTQW7zFiyP+2+Ta8LzkcsxheREctHvzzY5Vmtsz7NJe80JzSpY1J8vbzGfmefzaedAxV8
	TFxv7Z2QyfnO3jGAF6+oKfsfZUlNPfB5h+GbUsjklnk5F6VSVHLy3K52TlFSrHW7IHiKShmkY4u
	OYr62phKes6jfGLXNzvs+78SVH0LE
X-Google-Smtp-Source: AGHT+IGTE9UJLKHDa96X0IXu2Iuz7ncG5+0klioSEXx36Gsl3BqGznA1xnc2NELkBwByNWyBKW4pHA==
X-Received: by 2002:a05:6102:3ca9:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4df7dda5c42mr5857372137.16.1747288418164;
        Wed, 14 May 2025 22:53:38 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f613b5d0sm9873231241.6.2025.05.14.22.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 22:53:37 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52c764e94adso185204e0c.1;
        Wed, 14 May 2025 22:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF/AW0FgILRM7r9XariZqIIWqVzQ2pkcWLMfzdLaGBqSiDpoj5gGK7xNl/p8OglwgNXdkK@lists.linux.dev, AJvYcCVybkgS0WkavMUHV0DxUVVCUuaCnjJmvRTEhbcfGKMQLo9QO57Z3rEo7KLd+GGR3qlYYoJ6l+hCcyrdJZYCzQ==@lists.linux.dev
X-Received: by 2002:a05:6102:3e0b:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4df7dcb5c78mr6484774137.9.1747288417074; Wed, 14 May 2025
 22:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <202505151255.rCHp8Bvu-lkp@intel.com>
In-Reply-To: <202505151255.rCHp8Bvu-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 May 2025 07:53:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
X-Gm-Features: AX0GCFvo3GnsTZII4bhG8cXLylyB93OgSRrkVG13kj0dt4dQMBXBbYjIu4GDk6M
Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: kernel test robot <lkp@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
> [cannot apply to daniel-lezcano/clockevents/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
> config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
>      235 | static const struct of_device_id ostm_of_table[] = {
>          |                                  ^~~~~~~~~~~~~
>    1 warning generated.
>
>
> vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
>
> 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
> 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible = "renesas,ostm", },
> 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> 3a3e9f23c2cae9 Biju Das 2021-11-12  239

The table is unused if CONFIG_OF=n due to

                .of_match_table = of_match_ptr(ostm_of_table),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
