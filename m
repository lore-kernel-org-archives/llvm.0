Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D48C13D
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 18:34:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-40fd6da0325so27808701cf.3
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692038063; x=1692642863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUKj6iJDOdjNfGMp7lI4dnhHOH9acY50rwYfnudnhpo=;
        b=yyjNoPJ1bnr/pBFpYTs5oFqSuBiHDB5f/ma5PolZ/uGCezx5LAuR+w19dM5m4N+GdQ
         MqbPPCesXRxORPHYN8P1KDATPaR0A5dbWM3jkQZUqDV0i4ml5pXpODhkhni8l4qJPtAH
         Y7ZjvK6Y4NtFr+VuMgSOu26ashz9BubBGD3LNz4YnAwmuSm5TflJFzsZgNEq4D/5LK8W
         lJSFYrRHStk4KitCsv6J8i/WPUQYs1ANsECz5Oe4OP83kKd2tTD6vQCKx3tkykFYCE+M
         IPCmM+49BbMbOmPR49ABA83qYFmLcozZivBAzSJBcvZ0Z0h/jvpP7O8dXTpgFyBCsTMQ
         kpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692038063; x=1692642863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUKj6iJDOdjNfGMp7lI4dnhHOH9acY50rwYfnudnhpo=;
        b=YlkDE+2vNTZblrqyvB9qWz8GVGk+bXp/I65tsT5BcvspHL1/pBDSmp3v4jPz0LPcjM
         84Gec2B5dUDhUWAjIBZ162gYVlZPAYsx8mWDZzQABoTUOpppswaedLsDCTINo/P8kA4d
         yxwkUtcGY8FeWCp3YewPBAEFFDRx9sz6iYMEjz7oLp56qBaeru+/taOF7qwhNwh6Zvk0
         lIrb/t4Ruaw4cGg+CzHLy3rbB/FgR9JDsQdLwUQWfaK6/JOzCxzV/Q6mLZmn+/5hB/Ie
         URUlRlu7MutulTnnfWzMWVt9XXDsvzKDlG7lDHN+ig3Zc4uuCR2JLzxbL+BX1redOnw8
         58wg==
X-Gm-Message-State: AOJu0YyZIb12Mk+UPWMSdziudUO1V0svGMlChag+AZGZq0DcZEMYieFk
	3zQ2wjUjQPFXtoFtExdlKFDeb2w6Uo3aEFQLKjVCEA==
X-Google-Smtp-Source: AGHT+IFw+hkrZDq2INobHooqEpULo1uNlgRQPVpk9bftXm+RLNziuU6oVDs4NxvKCPomXxDpD4YOCSK/e0K7tdHOzXM=
X-Received: by 2002:a0c:ed22:0:b0:641:8d8c:addd with SMTP id
 u2-20020a0ced22000000b006418d8cadddmr8457092qvq.48.1692038063416; Mon, 14 Aug
 2023 11:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com> <20230814175928.GA1028706@dev-arch.thelio-3990X>
In-Reply-To: <20230814175928.GA1028706@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 11:33:46 -0700
Message-ID: <CABCJKufjgT9r_cuRxyth3y_rLPW43OBqtmPB_hQVkSftXUfp=w@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 10:59=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> I took this series for a spin on top of 6.5-rc6 with both LLVM 18 (built
> within the past couple of days) and LLVM 17.0.0-rc2 but it seems that
> the CFI_BACKWARDS LKDTM test does not pass with
> CONFIG_SHADOW_CALL_STACK=3Dy.
>
>   [   73.324652] lkdtm: Performing direct entry CFI_BACKWARD
>   [   73.324900] lkdtm: Attempting unchecked stack return address redirec=
tion ...
>   [   73.325178] lkdtm: Eek: return address mismatch! 0000000000000002 !=
=3D ffffffff80614982
>   [   73.325478] lkdtm: FAIL: stack return address manipulation failed!
>
> Does the test need to be adjusted or is there some other issue?

The test doesn't work on RISC-V. set_return_addr_unchecked thinks 0x2
is the return address, so I assume the __builtin_frame_address logic
isn't quite right here. Kees, any thoughts?

Sami
