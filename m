Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB75687
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 20:19:08 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-447abf05ea4so1343976137.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692044347; x=1692649147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7NBKIaudZg5pCYQXSbPQz6qkuoJtThIS+SlVr6T2ss=;
        b=2ggILfUkx+J0GaDwD/w6xQ7NdbZaQign7zCVMSAYwBlsbMHdYcvWTyE+wiwuDmmePV
         6bj/epA9FIr5PNwc4chwEbunFmcsFgL9YTpMtJJKoglfZO5XQgPzZBjplAQdcaU27ghN
         OSAcUZLdRhvL7lJ18RDzVd58oCk45dvfuTbLQveUpvxOILVM7V44UfBsEDgDYG+poAyL
         aeJ1qOaC7QqVnk/zuFb0t7R8gUJ63o5wt7qvNRHkhgOFVgikTyu7QLysHU6fGHqdoXHU
         pnIZsvEx/ZJwdwuFKUgaFHcBeeTPEOhb2n2qfj69XijWr/RDxo/LGgy3bElIpmevDSUC
         Ruiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044347; x=1692649147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7NBKIaudZg5pCYQXSbPQz6qkuoJtThIS+SlVr6T2ss=;
        b=Lt7cZ7doNU1aymfYt562HDbDrlJLqfRCt2zZO4+Ju+/Vj7iBqnq7LIMID+ntOb69RT
         gKGpUriX85xiVwp+ItzCwtI+KaxD0qMOxjBYGEck28geKLM6AxFMMKspRr9KCmWdQRaB
         cg9kV6cVjBvs+a+dBJfcZIu78PNxESlTdiGVLCQaQyd9qIhN4747eQ6PaEzY38QhZB3x
         8sWopA+0RKjJW0Gv8k0hh8WbJ2fuXC4pmt1ohfo3unWjkmU6cK9qqC/zltYNDDA5jeXf
         crDAncUfJMJ/CKrdc7c1NLPHM6/zExbV84SB+FasGDw4NNYXJMgj1TsqmverJxLua3pf
         Lf5A==
X-Gm-Message-State: AOJu0Yzu75FkwNIyZ3hh+dXCWxcgJXaXgQ0U3PC9rai5jNPqRWlrUIyF
	dghx/IIr1OqoOQaAvd0bs5hdaq6h11XuR37VNbLqew==
X-Google-Smtp-Source: AGHT+IHF0E09EnWMkn/qFpKOn1LBeu/xmPCIZS3ihtJBPqiw208Hlg8gySJGMAbdcb4rzGK3mlcno6Gp80oreT0TkNA=
X-Received: by 2002:a05:6102:1344:b0:443:5927:d415 with SMTP id
 j4-20020a056102134400b004435927d415mr7180453vsl.10.1692044346673; Mon, 14 Aug
 2023 13:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X> <202308141131.6B90A4205@keescook>
 <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
In-Reply-To: <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 13:18:30 -0700
Message-ID: <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 11:57=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> Looks like __builtin_frame_address behaves differently on RISC-V.
> After staring at the disassembly a bit, using
> __builtin_frame_address(0) - 1 instead of + 1 seems to yield correct
> results.

Elliott was kind enough to point out to me off-list that this behavior
has been documented here:

https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.a=
doc#frame-pointer-convention

I'll include a patch to fix the test on RISC-V in the next version.

Sami
