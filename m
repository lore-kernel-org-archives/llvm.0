Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E7A44
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 02:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FDEC43391
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693277521;
	bh=2000Dx0x8NNTq7L+dJqIL03ECHKc97oVrelzhqq6/Pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QZ5ffKhPD1X96SZPyeV4VN9gIYpwU5fZDAizE2VHatDN/MFfEDNsIut0RysqlB3L6
	 Y4yyfrJWfxsHrgXlFID71IotFy+HQJKBq7/0JFKJYAb0NbJJRVeXAPJiBXqox2M+Gs
	 ykLmQx9yQGV504o220EqgYA/av407zE3LwgfMlp0KqdMslAuJfEhTBvyeZyGvebegJ
	 Z1z9YUr63hLI6MUkRqfOQdpsukzELJWZ8/RS7IKY/F6rx94/SHyEFqcfZuJG/4MEPD
	 O9Y8BmfuquQFOzraBVTHNztp6X5/urrO5m0ykVtYdPsQPdrJDRuF+rE1UVywnambeX
	 W6H+HazCg6Iog==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5733710eecaso2367678eaf.1
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 19:52:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YyK4PgW7uiI8kV6goyNsPxcl5rOWY+U8B06ymnHkcVI7DW+qQH9
	0mYyryKMHl5IyiUuYSQt2mvab0V/x783//kWaZo=
X-Google-Smtp-Source: AGHT+IHh9n2KRQMtYFZZOKN9WQyZD4/Tr4GBxeaC+6K3pNzt9Sh/NcnxYsBVMXQR/MYKkSdKycJPP2Sl6nskxhoY/vQ=
X-Received: by 2002:a4a:6211:0:b0:56e:a1d3:747e with SMTP id
 x17-20020a4a6211000000b0056ea1d3747emr12840728ooc.6.1693277520114; Mon, 28
 Aug 2023 19:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828-docs_fixup-v1-1-cc78af124667@google.com>
In-Reply-To: <20230828-docs_fixup-v1-1-cc78af124667@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Aug 2023 11:51:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT08zhGgrDWdjKv17S30KPJ++JsBmaCwudTkMAdJR_M=Q@mail.gmail.com>
Message-ID: <CAK7LNAT08zhGgrDWdjKv17S30KPJ++JsBmaCwudTkMAdJR_M=Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: fix typo in link
To: ndesaulniers@google.com
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 8:20=E2=80=AFAM <ndesaulniers@google.com> wrote:
>
> Fixes the following observed build failure from `make htmldocs`:
>   Documentation/kbuild/llvm.rst:127: ERROR: Unknown target name:
>   "reprocible_builds".
>
> Fixes: bda09c0e14a4 ("Documentation/llvm: refresh docs")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20230828145737.6ff53bc9@canb.a=
uug.org.au/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

I will squash this into your original commit.

Thanks.



--=20
Best Regards
Masahiro Yamada
