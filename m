Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91717FF0
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 20:09:17 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a88ef9444bso171684b6e.1
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692907757; x=1693512557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMOVw9zI4qUYS4/6mGHk8c1zHfKQdWpaVAIEoa2cllQ=;
        b=1XdooHZArcSFuXTmOh9sPZwYlp4kCWdYOT7vO6LoqbY2xXDlTCUlu8qGoOksq147rC
         OJboyJqgCpMCDVuq1YDhZMDdoIAZI4cXwm9JRcqLdNOjsn2WFfgtBBsqGlk1ahVdSoMZ
         HNp7FaHppKxZU/4HTfXlRQgXtMTlHslUvujpvDY7qGyAhi/ZsW959L1eNGGijch8COA3
         seuj98d4zcUhMc+Prz+bm0MvnYtf+Mzmmn9xYj6wMyIMzskM585qT9SAKoqkrpQGOn6Q
         ztTATodcjPkppXE+CmcraIJFsuWXUq2klhRwnCbRBYecjnbwfqGW8FB+EWsOp7H+k7k1
         Q5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692907757; x=1693512557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMOVw9zI4qUYS4/6mGHk8c1zHfKQdWpaVAIEoa2cllQ=;
        b=eZNZVSiNqMlvbijzGdSSWJCvi+lbzneZ1LLVCJdYplw5cTSmbJUfok+YPvgej12fWc
         DoxGx+/Qsh6NbJz7hUYYs3+3jtM+LCY3I4URLw4tXwEIa3p+joP2CFlEvkdhJ08y2qKm
         7jJtFzNWKVrsVXayINjb2SUgGmJOAwZm/uqt7WoMw0cS6q5magMOz+STsUepxGnzZow9
         q/LAW50H4kpbGDrjUK4oFeEF5CZJK4/369QDqishrt2z8f1a++Qf90xbRwM5Us7EXKHa
         08KbwwNYI2AKlyyjYByWEeQ+NIGsiXEhgno0h78EmBsuaNdhYdz8FIxkXF+4W14kYjTX
         grvQ==
X-Gm-Message-State: AOJu0YyY9FwrAVItX+/to9ecqeLxKevxkkqTgJ/KloKSuOImJsUU+eEd
	FHvf9hh97YFr2AO+NiYyZzawzw==
X-Google-Smtp-Source: AGHT+IEXyd6Sd46IHd8WavbuIIHBZ5eX52cYSJmHLAQktkD6fWkrurbC+JmD+MlbPobmbuWKGaPQrg==
X-Received: by 2002:a05:6808:1a92:b0:3a3:6cb2:d5bf with SMTP id bm18-20020a0568081a9200b003a36cb2d5bfmr746696oib.4.1692907756760;
        Thu, 24 Aug 2023 13:09:16 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s9-20020a639e09000000b005657495b03bsm11637pgd.38.2023.08.24.13.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:09:16 -0700 (PDT)
In-Reply-To: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
References: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
Subject: Re: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
Message-Id: <169290773187.26503.887642526521895016.b4-ty@rivosinc.com>
Date: Thu, 24 Aug 2023 13:08:51 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc: Bin Meng <bmeng@tinylab.org>, Guo Ren <guoren@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
  Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Mingzheng Xing <xingmingzheng@iscas.ac.cn>


On Fri, 25 Aug 2023 03:08:52 +0800, Mingzheng Xing wrote:
> When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
> the following error occurs:
> 
>   Assembler messages:
>   Error: cannot find default versions of the ISA extension `zicsr'
>   Error: cannot find default versions of the ISA extension `zifencei'
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix build errors using binutils2.37 toolchains
      https://git.kernel.org/palmer/c/ef21fa7c198e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

