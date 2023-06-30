Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96852171C1
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 18:27:01 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666ed230c81so1866806b3a.0
        for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149621; x=1690741621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MGEKuy4Nf7dornYLukxVhbDcETcom+zcGjM3plM8Nc=;
        b=cVGunLYeWmUQGAQf3lovWRGWSR0TcbBHb4Y8apc2gLvK2jKN3WraWLIx+i1wC7syM1
         xNp3c2Dw0mxqK0Q9d7EstGXylZE3FY9I+IdulRH17Mk2q2T6pbCLQOIh/RNvpHiRWcbP
         164iVzp+JOTtRaP2xNJchQVZEjpiZaPGl+qRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149621; x=1690741621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MGEKuy4Nf7dornYLukxVhbDcETcom+zcGjM3plM8Nc=;
        b=LQ51Q0VUw07Sq7cTF68aZ7SNcFYB5dxHR2NcxQFqMdgTCHu5w671icBhxiW2vGjHAn
         +6AOPRtfg/HSK4XziP/rgM8o5zAxNgotAdpCmzhuR3zsMSzrnBzI55XDeIm87OnmrrLZ
         Ah7Gce8Lg52AgujUPS8HMlFaVnLxpvNkoZ/SWgx8bUkChK01q73HyXOtP0mvAJeuOPPK
         TeDHwv/9Hlhk/7PkN9xyIEEUHEXquoY2v5/3kgoD5eGELYZDhjY8GgsylQSpjL2gImR+
         QNZEcvgy9LIxIY/ezItlx0uf1p/ETKrtz6FsfQW1KbD1Qo+LhULFtnLNGPYdDf8LaODz
         ylzA==
X-Gm-Message-State: ABy/qLadD1SQegTGYIQ+Ze/QO6uR07XAHPDxTSYxDTlIUxRACEVM+U/R
	205uxR/E48ES98bGfT3cwjqa4Q==
X-Google-Smtp-Source: APBJJlEUOk6Acl3a1g9AJCQfsFvKOayNdfseye6ROPl1IEsyWrEGF0ii1Iv4vcSYKV0m9f3h3pWsgA==
X-Received: by 2002:a05:6a00:2d12:b0:682:4ef7:9b0b with SMTP id fa18-20020a056a002d1200b006824ef79b0bmr4322828pfb.0.1688149620695;
        Fri, 30 Jun 2023 11:27:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b006528d9080f6sm5450990pfm.9.2023.06.30.11.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:00 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:26:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] riscv: Add CFI error handling
Message-ID: <202306301126.D7EC815A22@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-12-samitolvanen@google.com>

On Thu, Jun 29, 2023 at 11:42:49PM +0000, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble immediately
> before each function and a check to validate the target function type
> before indirect calls:
> 
>   ; type preamble
>     .word <id>
>   function:
>     ...
>   ; indirect call check
>     lw      t1, -4(a0)
>     lui     t2, <hi20>
>     addiw   t2, t2, <lo12>
>     beq     t1, t2, .Ltmp0
>     ebreak
>   .Ltmp0:
>     jarl    a0
> 
> Implement error handling code for the ebreak traps emitted for the
> checks. This produces the following oops on a CFI failure (generated
> using lkdtm):
> 
> [   21.177245] CFI failure at lkdtm_indirect_call+0x22/0x32 [lkdtm]
> (target: lkdtm_increment_int+0x0/0x18 [lkdtm]; expected type: 0x3ad55aca)
> [   21.178483] Kernel BUG [#1]
> [   21.178671] Modules linked in: lkdtm
> [   21.179037] CPU: 1 PID: 104 Comm: sh Not tainted
> 6.3.0-rc6-00037-g37d5ec6297ab #1
> [   21.179511] Hardware name: riscv-virtio,qemu (DT)
> [   21.179818] epc : lkdtm_indirect_call+0x22/0x32 [lkdtm]
> [   21.180106]  ra : lkdtm_CFI_FORWARD_PROTO+0x48/0x7c [lkdtm]
> [   21.180426] epc : ffffffff01387092 ra : ffffffff01386f14 sp : ff20000000453cf0
> [   21.180792]  gp : ffffffff81308c38 tp : ff6000000243f080 t0 : ff20000000453b78
> [   21.181157]  t1 : 000000003ad55aca t2 : 000000007e0c52a5 s0 : ff20000000453d00
> [   21.181506]  s1 : 0000000000000001 a0 : ffffffff0138d170 a1 : ffffffff013870bc
> [   21.181819]  a2 : b5fea48dd89aa700 a3 : 0000000000000001 a4 : 0000000000000fff
> [   21.182169]  a5 : 0000000000000004 a6 : 00000000000000b7 a7 : 0000000000000000
> [   21.182591]  s2 : ff20000000453e78 s3 : ffffffffffffffea s4 : 0000000000000012
> [   21.183001]  s5 : ff600000023c7000 s6 : 0000000000000006 s7 : ffffffff013882a0
> [   21.183653]  s8 : 0000000000000008 s9 : 0000000000000002 s10: ffffffff0138d878
> [   21.184245]  s11: ffffffff0138d878 t3 : 0000000000000003 t4 : 0000000000000000
> [   21.184591]  t5 : ffffffff8133df08 t6 : ffffffff8133df07
> [   21.184858] status: 0000000000000120 badaddr: 0000000000000000
> cause: 0000000000000003
> [   21.185415] [<ffffffff01387092>] lkdtm_indirect_call+0x22/0x32 [lkdtm]
> [   21.185772] [<ffffffff01386f14>] lkdtm_CFI_FORWARD_PROTO+0x48/0x7c [lkdtm]
> [   21.186093] [<ffffffff01383552>] lkdtm_do_action+0x22/0x34 [lkdtm]
> [   21.186445] [<ffffffff0138350c>] direct_entry+0x128/0x13a [lkdtm]
> [   21.186817] [<ffffffff8033ed8c>] full_proxy_write+0x58/0xb2
> [   21.187352] [<ffffffff801d4fe8>] vfs_write+0x14c/0x33a
> [   21.187644] [<ffffffff801d5328>] ksys_write+0x64/0xd4
> [   21.187832] [<ffffffff801d53a6>] sys_write+0xe/0x1a
> [   21.188171] [<ffffffff80003996>] ret_from_syscall+0x0/0x2
> [   21.188595] Code: 0513 0f65 a303 ffc5 53b7 7e0c 839b 2a53 0363 0073 (9002) 9582
> [   21.189178] ---[ end trace 0000000000000000 ]---
> [   21.189590] Kernel panic - not syncing: Fatal exception
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Looks good -- should the noaddr failure paths include any warnings of
their own? (i.e. isn't that unexpected?)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
