Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224A53A0
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 21:31:56 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id ko13so813293plb.13
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvJN8dmrmNJu4tTYhdlBrzcRSinLAy+Jhaplp/kCRiA=;
        b=wh807lSO9v29Yu6tO13IzDLOgiVo3Y9CLLlEMCaN5Bfph5SWKk/ief3r4cZyouTDq3
         ekQ8BZiAaegZvDAKUQ41D41hsAmetgk6oRbzZgr5tZ8Ebv6rouEL0se6NNr8O8vuHMuA
         Y9E1KcrrOfgbPedMh8QVliNBmDLSSk306iIqsN5Z3WjNY4Kf8EbTZS61IOkrrZWWRWux
         SIrlqYQU9Ed7MRpv4GK6gK/n40iENTbOVq0sI7jnPIv4ay32p0xTWuzO+r4e3KUxS3Aw
         mV9fpIWYF+zc1nWP6gzHkwKwUixXjTuaac3chNZcBChKKjLuR16rINK9a4ShFPJKhkRy
         dJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJN8dmrmNJu4tTYhdlBrzcRSinLAy+Jhaplp/kCRiA=;
        b=D1j4x8rUrGY+QZ5Sl3rKPcrsQ1f+JaZjLDI+LbTmg9wh5+W97tst8+bgACZltGibek
         7+wJXeMzYOfY3gdIfock27TY4IHoyfw4sc9wR5wRotlOeCnYyW8YYA/YDzosSgjyZ7Qk
         dsUDFMwPIEUtgtjhDbtBeJfE4UQFDUSsgFOZKiZtM4kJ+fUbHFL4bEt9b8UxFqgFHLrY
         S9dMdm0je1yKM9ZpgC52WBF6fhuSOsFJM6UTC7tqgcSnjqaIa163BCgqHaBn0fZQ2FNz
         ZBB92TK697XZssquWpqeCrICKiUFjOiw2FXs+6u4gV3JFj6HeJaNPPaTi4qpQAWHzoDz
         NTEA==
X-Gm-Message-State: AO0yUKWFjXWv3I4l9hirUeWsqwaDceEyrcL3/7xC+jBQx3vOCOImYd2f
	egPxR/CuygROIPsEb3oevqHWyw==
X-Google-Smtp-Source: AK7set+inR9Bfe356VnjZRrkMmucPTHHx4QOqBABEwJbFOr2cvrtN9y1cnMB0g/q9qfmCnSJDZEm5g==
X-Received: by 2002:a17:902:d506:b0:199:4d25:6a4d with SMTP id b6-20020a170902d50600b001994d256a4dmr997355plg.10.1677274316335;
        Fri, 24 Feb 2023 13:31:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170903278900b0019a7d58e595sm6071070plb.143.2023.02.24.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 13:31:55 -0800 (PST)
Date: Fri, 24 Feb 2023 13:31:55 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 13:31:09 PST (-0800)
Subject:     Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <20230224133609.2877396-1-conor.dooley@microchip.com>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 24 Feb 2023 05:36:08 PST (-0800), Conor Dooley wrote:
> This is a somewhat blind (and maybe foolish) attempt at enabling Rust
> for RISC-V. I've tested this on Icicle, and the modules seem to work.
> I'd like to play around with Rust on RISC-V, but I'm not interested in
> using downstream kernels, so figured I should try and see what's
> missing...
> I've tagged this as RFC in case I've missed some "WAaaaa you can't do
> this" somewhere :)

I'm fine with it, but IIRC the Rust support for most targets was pulled 
out as they weren't deemed ready to go yet.  If the Rust folks are OK 
turning on RISC-V support then it's fine with me, but I think it's 
really more up to them at this point.

So

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case folks want to take it via some Rust-related tree, but I'm also 
fine taking it via the RISC-V tree if that's easier.

>
> Thanks,
> Conor.
>
> CC: Miguel Ojeda <ojeda@kernel.org>
> CC: Alex Gaynor <alex.gaynor@gmail.com>
> CC: Wedson Almeida Filho <wedsonaf@gmail.com>
> CC: Boqun Feng <boqun.feng@gmail.com>
> CC: Gary Guo <gary@garyguo.net>
> CC: Björn Roy Baron <bjorn3_gh@protonmail.com>
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Nathan Chancellor <nathan@kernel.org>
> CC: Nick Desaulniers <ndesaulniers@google.com>
> CC: Tom Rix <trix@redhat.com>
> CC: rust-for-linux@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: llvm@lists.linux.dev
>
> Miguel Ojeda (2):
>   scripts: generate_rust_target: enable building on RISC-V
>   RISC-V: enable building the 64-bit kernels with rust support
>
>  Documentation/rust/arch-support.rst |  2 ++
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/Makefile                 |  3 ++-
>  scripts/generate_rust_target.rs     | 19 +++++++++++++++++++
>  4 files changed, 24 insertions(+), 1 deletion(-)
