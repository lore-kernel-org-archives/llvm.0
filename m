Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99E20E0
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 07:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68148C341D0
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657870863;
	bh=prx18bORl5xayVstWwmiZFOyFEmOKbL1W8Z3hB00LP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lkSiiafU5C45/C8bCakTdND+kvpTBdZ1iPuhSKPqrJpuQNfaqdrPYjzWrm1RPduFw
	 MnPrbepf3yDR4tMiVdbEA0KP52NkJjp+Zv18wF70yfCpbRepWyKsXKxawkSeSeO6b7
	 bMPw+CcpRRjmf84JRrbfbwcCtLXyvSkLqlO4dlxT6z8hS5UFRwJgJezlxVtnfeGg6U
	 Sr39kbdd4e6rt8I0hhuYru5kwoJlg2+pDJbCj2Jtn2U3ukLGliQ4hWIOT91CEtYT1w
	 BrpL++VSAl3vYTctfp3n3iazLzcNhSFepoYGdE1wvENxBIYC21ZKRFCWiZrUqYiXC9
	 PIoR5KBfjetBw==
Received: by mail-yb1-f180.google.com with SMTP id r3so7182931ybr.6
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 00:41:03 -0700 (PDT)
X-Gm-Message-State: AJIora8wgzmXQir3U1XoL2y+8RjwLOEQby6XgVPb7T1SQsLZJQqxJNnb
	PFED8g/KWSNxjjFnljNBhmr/elIqBUFIY3Nmz24=
X-Google-Smtp-Source: AGRyM1vD8yRr3rCO2aad5yuzRxpfe+hXi9LJGGQdP4f74UITSslw7JOrGgrNF4WpUfUKerNzgWm0yWrbB1KQXCl+nfc=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr12045942ybr.106.1657870862212; Fri, 15
 Jul 2022 00:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220715053334.5986-1-arun.ramadoss@microchip.com>
In-Reply-To: <20220715053334.5986-1-arun.ramadoss@microchip.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jul 2022 09:40:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Egk5BA1Q155dSN=E0DvBmzGqQSqzDayYf6mZZ7oYVSg@mail.gmail.com>
Message-ID: <CAK8P3a1Egk5BA1Q155dSN=E0DvBmzGqQSqzDayYf6mZZ7oYVSg@mail.gmail.com>
Subject: Re: [Patch net-next] net: dsa: microchip: fix Clang
 -Wunused-const-variable warning on 'ksz_dt_ids'
To: Arun Ramadoss <arun.ramadoss@microchip.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	Woojung Huh <woojung.huh@microchip.com>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 7:33 AM Arun Ramadoss
<arun.ramadoss@microchip.com> wrote:
>
> This patch removes the of_match_ptr() pointer when dereferencing the
> ksz_dt_ids which produce the unused variable warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arun Ramadoss <arun.ramadoss@microchip.com>

Looks good to me, thanks!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
