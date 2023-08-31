Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928211CB6
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 17:20:05 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso8045885ad.3
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693502405; x=1694107205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNkpWxc8EG1HJhPkvrSCUMEk5PqcVCiqbl8jL5JExIk=;
        b=GQ/MOfMQ8urcE1NKw2vUGibh1ixzr7Qazb+YrcHnB/0nEK/hHA057Mr6/O181K8hJu
         /mA9HT4VMPpfo6uI4MvNKxcB4svrD4DyKT95Onc5jlQeZSLxvKMDiTG+ZPbrO0ejZfCA
         ArVUNtcRQghRyCbabrJeYPuOrXA7XIKMSf4wHgRkpwAaCm8DfJOnzXXwq9m4cKs/K5Pk
         BWZ1lGYYN6ehWF724dX/qspQHwdc6Xqk9xC5OJNHE6iGR7SEWWLZm/wpW7xoQMvHnA6r
         69lZTz6GSFIl1Ag/rX4O8vYTTT2m7/Sjdbrz9IQlkK35+wAkVxRYSYrZKMMd3qrhgtOO
         FyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693502405; x=1694107205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNkpWxc8EG1HJhPkvrSCUMEk5PqcVCiqbl8jL5JExIk=;
        b=YAs2m/n3PY5OuHXV8eYpI0FlV/zp/9bgEUFDJCFVjnJ4MFjRh1T+lMYn98FXdwH+n6
         qQ+VTrwJOf9c+8qtuvUAJXLKOWgO+1qoKGrpCo7Wy3WwPnkk3YFE/+SD1yJ6f81zCFxx
         eJIFm9Q0p8vTVUpTPi7LUT7XSracisr/A6n3FUsRv2A7WhBETsYU3M6GgVa37KwPd9o6
         zMf92ORhA3bkdOcegTriQ2kuhVgKnygBkIuv6nmV2azLHyYwHQBD3ZEJczxZpaqHOB2K
         M2e5/Zezsa0A0+Pf/wXaw8KR/BjjhH76L10kOh58MTKRyIxj3K2K/WmxlJLSMoP3ODHz
         O17w==
X-Gm-Message-State: AOJu0YxZtxzymJF+qmhtQS8c2OSPLDF1UwYQQqVJDJf4QuBqlmWXiO5+
	UtJbtwNDD6C/UprTJDsxhXI+Aw==
X-Google-Smtp-Source: AGHT+IFxC4z8Yg9XUp5M977JX43ADpIP8JLembbFQ9Xu6KLcNa91b4AcO7UeN5Ap6FxAaGH9gGiy0A==
X-Received: by 2002:a17:902:7c98:b0:1c1:fe97:bf28 with SMTP id y24-20020a1709027c9800b001c1fe97bf28mr262957pll.31.1693502404898;
        Thu, 31 Aug 2023 10:20:04 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:892a:3b04:5286:6211])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902eec400b001b246dcffb7sm1491949plb.300.2023.08.31.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 10:20:04 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:19:59 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
Message-ID: <ZPDLv3el++xUqGkI@google.com>
References: <20230830203754.24940-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830203754.24940-1-palmer@rivosinc.com>

On Wed, Aug 30, 2023 at 01:37:54PM -0700, Palmer Dabbelt wrote:
> Looks like this just got lost somewhere in the respins.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/
> Fixes: dbe46b094026 ("RISC-V: Add ptrace support for vectors")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/

> ---
>  arch/riscv/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9a87e5d490b5..2afe460de16a 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -120,7 +120,7 @@ static int riscv_vr_set(struct task_struct *target,
>  			unsigned int pos, unsigned int count,
>  			const void *kbuf, const void __user *ubuf)
>  {
> -	int ret, size;
> +	int ret;
>  	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
>  	struct __riscv_v_regset_state ptrace_vstate;
>  
> -- 
> 2.41.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
