Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137B79DD
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 22:18:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id er13so1232309edb.9
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679955500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qpaub3I/CyGwEFR/k/WmlBCDNumW/+SJIaNcuoNk9k=;
        b=sLjlJgjeoT0WV0qFn9qz1kIcxyac6pMVMv4H0/t9YS7zXIrH7YfP7jRP4vvtxYuMhv
         ZkjmSM2TjJ2zegpBf5QGdb0Mg2dEBQNtRk9nXqhWfdzK8Cn2PNTlxJjlOr4L+7Qk675Y
         nXesSbqZ55WgkfqcvQkclW2y9t9tEOxFKzyyUPFbBZcRrU7ShBkSWppcY0urgbLMqJbf
         tLMwthWt0GlBeegianqR6puXwKX0gRuaDR6yup4MiyrXZu76w9isj8TE+VUN+DdOSY4A
         IQCaYyBU7XaWxUoZ4cGVm4P8s5+myV0YBVlJc6RiTvo7dF/Tw2pzx5QhD46MOXhuxEcU
         F3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679955500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qpaub3I/CyGwEFR/k/WmlBCDNumW/+SJIaNcuoNk9k=;
        b=yIipvs3H+AatOF0g/GvJWKJ73I2yB+AQeSNIU5kxS78zYgi3RVewp/3BMErDgIFlxh
         OuDjfQd5A6+EiBbfMcuGKRLUVFakXwXOYX4jTTPNqsViePuPYFmi2gpmDTHMEUu6D05W
         G5ds6BFVKMGQJZmXmZWFP65TclxEU82FVPJo4mbnmiSWDETFsowZzOAveURyUzfkTLD0
         f7sY6YIGjHqvaA3A/1468w5uEKVxTne4IN1Gi4pQY2wAwB2feTHerBTMNcS3yas7/Xki
         ZuNUsLX1NW1pgqFU1HYcA7iMKjvEkAn7hw3M8KoDB403B6ieZ73PBGHk6ZKlMaMW11/8
         FW1w==
X-Gm-Message-State: AAQBX9dbSH58sgum6Bn69CEF+Ki0mwrVILofB+m89r4/wTcYBpXpG9sZ
	CVQxBuxsAc8EL9RFGMqh5Vka79Qbdkek7PHa7TaT4w==
X-Google-Smtp-Source: AKy350ZxmCEdEpv7zB21M0WMADbalXlh1cyjmKEj/2FvVMMOcTkxQAp+v5N9qKKGwJDSfSrEt6L5EOsdS/vzof9S9Yw=
X-Received: by 2002:a17:907:cb86:b0:930:42bd:ef1d with SMTP id
 un6-20020a170907cb8600b0093042bdef1dmr6723296ejc.11.1679955499628; Mon, 27
 Mar 2023 15:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <20230325085416.95191-1-ashimida.1990@gmail.com> <20230327093016.GB4253@hirez.programming.kicks-ass.net>
In-Reply-To: <20230327093016.GB4253@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 27 Mar 2023 15:17:43 -0700
Message-ID: <CABCJKueH6ohH27xCPz9a_ndRR26Na_mo=MGF3eqjwV2=gJy+wQ@mail.gmail.com>
Subject: Re: [RFC/RFT,V2] CFI: Add support for gcc CFI in aarch64
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dan Li <ashimida.1990@gmail.com>, Aaron Tomlin <atomlin@redhat.com>, 
	Alexander Potapenko <glider@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>, Brian Gerst <brgerst@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Changbin Du <changbin.du@intel.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Frederic Weisbecker <frederic@kernel.org>, gcc-patches@gcc.gnu.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Kees Cook <keescook@chromium.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Marco Elver <elver@google.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Michal Marek <michal.lkml@markovi.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Richard Sandiford <richard.sandiford@arm.com>, Song Liu <song@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, Yuntao Wang <ytcoode@gmail.com>, 
	Yu Zhao <yuzhao@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 2:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Sat, Mar 25, 2023 at 01:54:16AM -0700, Dan Li wrote:
>
> > In the compiler part[4], most of the content is the same as Sami's
> > implementation[3], except for some minor differences, mainly including:
> >
> > 1. The function typeid is calculated differently and it is difficult
> > to be consistent.
>
> This means there is an effective ABI break between the compilers, which
> is sad :-( Is there really nothing to be done about this?

I agree, this would be unfortunate, and would also be a compatibility
issue with rustc where there's ongoing work to support
clang-compatible CFI type hashes:

https://github.com/rust-lang/rust/pull/105452

Sami
