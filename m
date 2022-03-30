Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B27B
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 00:21:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o3-20020a17090a3d4300b001c6bc749227so4583597pjf.1
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 17:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=7iLxch5y6RIgvR/T0zWqMEJ+cpUfEurleqixAHzR59g=;
        b=d6l2S7X6ubR/3qtqSf1gEAmewrLprB360r1t8kyD8au6PP6Uw3qtG3LFOeEsaJuH0a
         Uosk+2PV7kD+ZX41oUKqASL7vtobWwWbrZJvt2qsw6/kKgMSkxy7Lq84FNozbqUYHRO2
         YT7MYq8O8bUwbqTIN42fVMirVmIwOvEoQttWZbrfSjMBhzCfXvgLFxOX3i4/k5Nw+6KK
         rKsSsKvqZokfFUXKFzNJtCqZW7J1WLvA9xJaPpccQmHui9c8uOmKXzNTQKgFMa987eml
         aZ6D+6PIJZayCZT3qTHhE0yfQFYCmZ2Z+gfvHJDE1AtWZQKN3bGIedg0RDDF8j4CozAR
         cRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=7iLxch5y6RIgvR/T0zWqMEJ+cpUfEurleqixAHzR59g=;
        b=WNMKbihx2cY73xfkJkRphiAGAlIBJoIUUxk4fjjhy86n+rTXZ+ueopLrlU9M7R7zND
         G6J86J6swk/bvQVbE5lIymH6kM4qhTDXAm8J6yeJTPCgNxxBaC8RtZBF8SAQL8e0ugDD
         BS1NL4j73yuHsXf/D9DFUHwL/2wzTDCkh6pkCW+pc5t9RffLNasMbrQuHgqPigIRfuue
         qDNLh8r7aZG3+LKNAjS0qHA3/9v0JLVYWRK2b+WUciHYzaoSlW2U15v8D5A86a0ZdaCs
         UzQJacvcT5xXUGmn2DXuVGoHlQXXpvzyBDGmPjm1E+9X0oo83WjK5mczah3AfyBtye1u
         C4YQ==
X-Gm-Message-State: AOAM532Q+l19N/VW1F2Xq22hEEe4Wzh3cwqco/JrOw3N6FQ41iqG8RjB
	mZQ2s7JWLSXh2WI+yorvzlqz1Q==
X-Google-Smtp-Source: ABdhPJxEvni5Sq3KIcfnKaN2LY52DfkeM+nZCKa8T5kJ161E/ZTfTMkikxIcAWzUNAuNKmyxa8oPgw==
X-Received: by 2002:a17:902:7205:b0:156:1a0a:2c39 with SMTP id ba5-20020a170902720500b001561a0a2c39mr9686710plb.88.1648599693682;
        Tue, 29 Mar 2022 17:21:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id p15-20020a056a000a0f00b004f7c63cba5asm21702403pfh.21.2022.03.29.17.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 17:21:32 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:21:32 -0700 (PDT)
X-Google-Original-Date: Tue, 29 Mar 2022 14:36:59 PDT (-0700)
Subject:     Re: [PATCH v2] riscv module: remove (NOLOAD)
In-Reply-To: <20220322012617.3517297-1-maskray@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  nathan@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, maskray@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com
Message-ID: <mhng-891192a6-d537-444f-b092-5ae92620b233@palmer-mbp2014>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 21 Mar 2022 18:26:17 PDT (-0700), maskray@google.com wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
>
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error (later changed to a warning). Just remove (NOLOAD) to
> fix the warning.
>
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1597
> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>  arch/riscv/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
> index 4254ff2ff049..1075beae1ac6 100644
> --- a/arch/riscv/include/asm/module.lds.h
> +++ b/arch/riscv/include/asm/module.lds.h
> @@ -2,8 +2,8 @@
>  /* Copyright (C) 2017 Andes Technology Corporation */
>  #ifdef CONFIG_MODULE_SECTIONS
>  SECTIONS {
> -	.plt (NOLOAD) : { BYTE(0) }
> -	.got (NOLOAD) : { BYTE(0) }
> -	.got.plt (NOLOAD) : { BYTE(0) }
> +	.plt : { BYTE(0) }
> +	.got : { BYTE(0) }
> +	.got.plt : { BYTE(0) }
>  }
>  #endif

Thanks, this is on for-next (it'd be OK for fixes as well, but it's the 
merge window so I'm just on one branch).
