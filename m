Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D53182D9
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:13:12 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b52864b701so39975035ad.3
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687291992; x=1689883992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmrSYTSQ2qUkhlzSpM0GcnhNM2r70wuMDYnO5JFeaLA=;
        b=gEGUXxiXONvsoVfzKoaFB6BPub3fU+DFlJ0bRt7Vxj0aQBADH03HLEgMl4I1rePXGX
         Oe1tjtOVf3ljedV8ZqTqcDiOKoP33OCQ1lrB5R6EMdRVB5Fs1VXb+j8OtzpNhPyO3NPw
         9OIQaKNBiKriAp1zVBnjvOXZmf35TDm97PWiOEm0njo3cEqrcElcJc7+Mxv38NMHdooS
         ofOW3UXZ+8tOpkJNnYPHiv34ir5wZYwal22B1f1yI6AUm9SXROVtf1FOpnQ4Zh3cXC5R
         TWk3LCy+jjyRHvzaoXDMXFpgFu/enVGW6jiQxCnrv1zn54hpR/MMJdZyipOEM6h0guzG
         BCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291992; x=1689883992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmrSYTSQ2qUkhlzSpM0GcnhNM2r70wuMDYnO5JFeaLA=;
        b=Cdjd8LyFFW5Ru4OryujLKGK/Yj113loTHbEhuoODfyui8Flx4htcFAG/TKfu3wTdew
         y9M5KnKPsw+hmsrP77zkkHKGb3Q78ebtKFPRsjvTALamhgt06kq3Mxzr3AxRr2pbSCIt
         rHEBHU2f6r7DYD8nDVA39zaD27iccGTWpSxq3oDeU1GGkBbCk6x091GnnOfmYMthAnU5
         XtWrqqZZW7QMIUyvVFSPLlLlclH8sNI2QxrIsg+0I2kj9yUgWmPIzOOHKLjIgTlOXtJQ
         pATxh88JT/h7Xj61COUnJDGViASRxz6tXPdLGRGyQ4qm3b9upUYfpJ5FuxpDm46ZgRSg
         N3+A==
X-Gm-Message-State: AC+VfDw0Btz2YRQQWwNJr4zy6a22SCcDQWLFcCBYmAjYd7O6AL5zQg6O
	Xxrja6Vkq4dQY+kjPZFNEHCD8g==
X-Google-Smtp-Source: ACHHUZ6R39K1FnSTyHu9gjeCYRKQ9F5Jm/s2hzxrwffi4i/maQOWNihzpUGJp129d9ztVWFXyz8Tvw==
X-Received: by 2002:a17:902:c14b:b0:1b3:c98e:a114 with SMTP id 11-20020a170902c14b00b001b3c98ea114mr12444603plj.45.1687291992114;
        Tue, 20 Jun 2023 13:13:12 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:2565:1a14:4024:2d88])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001ae5d21f760sm2007132plb.146.2023.06.20.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:13:11 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:13:06 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: palmer@rivosinc.com, conor@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, npiggin@gmail.com,
	paul.walmsley@sifive.com, paulburton@kernel.org,
	vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <ZJIIUn8Da15neIwI@google.com>
References: <20230517082936.37563-1-falcon@tinylab.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517082936.37563-1-falcon@tinylab.org>

On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
> 

Just cross referencing the report from Palmer against v2; I see orphan
section warnings from the linker related to the EFI stub when building
allmodconfig with this patch applied.

v2: thread for reference.
https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com/
