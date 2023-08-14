Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC115D528
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 21:09:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdf7086ae5so2346705ad.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692047370; x=1692652170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PuvQpJrJqrNy7astmt5IVebXoF5w/a9tG+pRmbryqo=;
        b=kxnjP4K14WJSvLPejXWZrEY2njof9Zmsz4pFZ+tWjEdwYQPwfyIy1Mbf1S1FDVBq9l
         9MWRs8VsKnOSdrE1QbDjEkJezJ9LJ2HWu8lANe7NqKHvNsNkhjfFXFiphBgOObgoJjGR
         Gfg8K0Q8n07N+ZzpKj9/KJ0ZLGM2DIevYNjic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692047370; x=1692652170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PuvQpJrJqrNy7astmt5IVebXoF5w/a9tG+pRmbryqo=;
        b=VV4+6QGRWbRMonWduntJ6dZf1LtsdbO1TpwKlbpv91qsULuONxXCLKhSUjg8DlNEST
         J8YEh4KDHvs/4TKycNFW+T2cocmcuIj/igwvCKukdA2bLecqV6j4MGp6Lk7k3R4KVkWi
         7/BetpKIeaW7NfQkvfTQM1xhrdvxx6EWdWa+S6Sx8c6GfH/zUYK4al4yI2UqwfwhtSBy
         d0v4oAj9c3Y0NwHRih9rUUZu5odfjZ4iA/i1AUTiJ8eUG/yLPmVbaKDqRsTqLY84FhJI
         /zNi57f7kLhGMjnSGflpQVQePGh+VluuByMlZvDxYHU1rlFab4GyjJMuPwR+qN5pNVTN
         nC0Q==
X-Gm-Message-State: AOJu0YyxsfntQvKTM3SLmfaWOCAyBGSvoKKweUOAfZl4AcdbOAhRb0+F
	dM3vULn5ItQ9np0g08R7Rc/q5Q==
X-Google-Smtp-Source: AGHT+IFYeDWP5PYNKsk0YR+BiKLZK4N4Rwa0P0VjZkZ6hsNlrW8rO0WgiTO5nntV4saLBRmYH2B/dg==
X-Received: by 2002:a17:902:ee44:b0:1b0:6038:2982 with SMTP id 4-20020a170902ee4400b001b060382982mr10965327plo.41.1692047370203;
        Mon, 14 Aug 2023 14:09:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001b857352285sm9941444plb.247.2023.08.14.14.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:09:29 -0700 (PDT)
Date: Mon, 14 Aug 2023 14:09:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: SCS support
Message-ID: <202308141409.76B8A274BF@keescook>
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X>
 <202308141131.6B90A4205@keescook>
 <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
 <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>

On Mon, Aug 14, 2023 at 01:18:30PM -0700, Sami Tolvanen wrote:
> On Mon, Aug 14, 2023 at 11:57 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > Looks like __builtin_frame_address behaves differently on RISC-V.
> > After staring at the disassembly a bit, using
> > __builtin_frame_address(0) - 1 instead of + 1 seems to yield correct
> > results.
> 
> Elliott was kind enough to point out to me off-list that this behavior
> has been documented here:
> 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention
> 
> I'll include a patch to fix the test on RISC-V in the next version.

Perfect! Thanks for figuring out the offset. :)

-- 
Kees Cook
