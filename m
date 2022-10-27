Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F7E801
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 23:07:27 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 20so3169737pgc.5
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3Cg4hSAtiIjg4fn0TICaEm2CR+A3G1G6cZSFVGjRNw=;
        b=Av8g1yEyrqRtyNEXn86lA8dQA/VPx5chCpzAaJr8YHh5QrQmllXTNXOUXPEOHaLTfh
         wah/v1AynDgRuQETrGf+yixPVV98WHKq97+NxSSOno8kO3DQ3jhB4U2rusKJLC4eHY1q
         wvTdtdNBgSP3+lqbOhcYy2xMoK6+NjU02/JEB32NB6KAp+5XW8ZorvJH6xFksCrpjFha
         PfR5PKVMXdkD1G2H0+2DVzam1yHTpIYi9xyvFNrvsp6EVyibEf/ArLZyc15zp3dkx/yc
         2a9nAPFMspoi8DdfPyLHMnROPkG2cRexh19jNGrSi055Js0iQvWZVKZ3RIJqFKROLbFn
         QSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3Cg4hSAtiIjg4fn0TICaEm2CR+A3G1G6cZSFVGjRNw=;
        b=egAHNK7iWsz7VtUsu28RQKfbagMf8tFfC8MpI4j7Sod8Z4R0piCMpOVRx3kmH079ii
         jEMaou97m+gP5D87L4u6reocrK8ktM6jdmJeXGLGt0Ns9PtNz50OeAK9IrXjW/+MGhCJ
         hTOKeyQ7DOCH/VnyZa/QTEnN0h2oAC2vk+WnbksUK9TyZSRDFr1QcgQsIMEfAunYIsKC
         gRzyvIfWo20N03qie9i2qIzAnfU6HjDPvPBxjEzPmvGjV0qlSH20Cs+HzS6ZQDj/F73r
         bhhW2sO2vxniqUXN/pgKu5Njd5uwiY/lgPjBKJV2AI1+SldwcslLv705lxFNFYrq3uA/
         5GFg==
X-Gm-Message-State: ACrzQf0qLwzrvWAjI1j4ArIhGz41EHEzLrBbr6VAQWNEPVJ6KxcpGcot
	v7GWDCPUzfmqKwDKO3Z4AqwWsQ==
X-Google-Smtp-Source: AMsMyM7kN3GSvCxNiwfw+NyImUjG5pItb0YNfkTmIf3lG0wAIQ4nx3SiQhJ3M8nvIi0JCl+uWSHK+g==
X-Received: by 2002:a63:8241:0:b0:46e:ffaf:cc4a with SMTP id w62-20020a638241000000b0046effafcc4amr20467261pgd.546.1666912046644;
        Thu, 27 Oct 2022 16:07:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001867fdec154sm1688526plf.224.2022.10.27.16.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:26 -0700 (PDT)
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org>
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support detection
Message-Id: <166691074050.22328.4455408116267853696.b4-ty@rivosinc.com>
Date: Thu, 27 Oct 2022 15:45:40 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-36ce3
Cc: Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
  llvm@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>,
  Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>, Conor Dooley <conor@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>

On Thu, 6 Oct 2022 18:35:19 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> This came up due to a report from Kevin @ kernel-ci, who had been
> running a mixed configuration of GNU binutils and clang. Their compiler
> was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
> 
> [...]

Applied, thanks!

[1/2] riscv: fix detection of toolchain Zicbom support
      https://git.kernel.org/palmer/c/b8c86872d1dc
[2/2] riscv: fix detection of toolchain Zihintpause support
      https://git.kernel.org/palmer/c/aae538cd03bc

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>
