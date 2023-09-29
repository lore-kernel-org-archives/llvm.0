Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32597347C1
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 22:52:59 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-45289a987ddso5908309137.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 15:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696027979; x=1696632779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVD0NwiVgmmQvibC1xInA0otG2T0uniQ4SKhb3BsNQI=;
        b=mhc8I1K9D871PP3cChgmeNaecgsJm9Bayr+le6lg7vUaSSmPZjLLOb1J9lRklGzvfb
         jBu4Z0gOaWZMoupH2qpnk1WVsx5AJreArCSAWQNM4/9IlclX0diXat7jFS0NjTVIdsYv
         xkI59IX9yPxVaw/GBSQN8KUnETIfnHo0kNG1XvhYngK65W3SX1vUqlQKb3gCSY/bchHF
         mMjWJ/9pVd0K0Vs4LXIG1CEiYI10BneAD9cP+iCV5T1oJyjudthDsT3zPfh/2Rxel9Jf
         gID5tBS6qjsGhANR9QqoJtaHVV8zETyXCInKyOzRv8elfGTeCklGFnroy0iGXWxjm5jI
         O94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696027979; x=1696632779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVD0NwiVgmmQvibC1xInA0otG2T0uniQ4SKhb3BsNQI=;
        b=bGz8qA49fRaIkyoYwf9zp5aj+I9iJW+BRu5vUQBLxrswQqVn415V261PxIa2drLeIm
         n2fBA7HU7j5RGCSliObAT8SeYBRxv/wrmdFdcI3K4hY2yxCIATmPwMDHVQSmnv/Qx31S
         O52bqvr5bioYXeKtZnYXddlrsj/xcXH7KSymww5bqR3ajobghicxB61+0UjhQd1NY5lr
         V+BfTSpNvev6asZBL2zGkKDhw5RmasNSh0o6UxC8yuvKOBxVccc5Ez+lvwPBzeGkZUDW
         E1ooSgH7uXbpvmhSHsq0UfJo/rbe1Hzg8kAYCp9wi9XKOAy0SRW3FGj3gKq+rUtJXtT4
         jtqA==
X-Gm-Message-State: AOJu0YzdVxsdtZU2GsJT5rQS4Mtg2HycoY5vHgVNh22qaauvBCNy1Vd8
	6rO7Xn7g3EIhSxmmuuZCPED9td0CQYwhtp+FlMnGrA==
X-Google-Smtp-Source: AGHT+IFIzioa8M+FkbhUdK48/e055YeWZrhKv/naxGAzU7YglwP+Nfq9WJ8bCC7WBhwhOz65LtF9FwPuJudNt5dBpwY=
X-Received: by 2002:a05:6102:134b:b0:452:77f1:f1e8 with SMTP id
 j11-20020a056102134b00b0045277f1f1e8mr4849186vsl.33.1696027978754; Fri, 29
 Sep 2023 15:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com> <202309291452.66ED9B4D83@keescook>
In-Reply-To: <202309291452.66ED9B4D83@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 29 Sep 2023 15:52:22 -0700
Message-ID: <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Kees Cook <keescook@chromium.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 2:54=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> > ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> > potential bits of mmap randomness on the table if we end up enabling
> > 4/5-level paging. Update mmap_rnd_bits_max to take the final address
> > space size into account. This increases mmap_rnd_bits_max from 24 to
> > 33 with Sv48/57.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> I like this. Is RISCV the only arch where the paging level can be chosen
> at boot time?

I haven't seen this elsewhere, but I also haven't looked at all the
other architectures that closely. arm64 does something interesting
with ARM64_VA_BITS_52, but I think we can still handle that in
Kconfig.

Sami
