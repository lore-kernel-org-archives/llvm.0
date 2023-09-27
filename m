Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6AF9E7
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 11:14:55 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d81f35511e6so15259350276.0
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695813295; x=1696418095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPJwzNvZylvTQiOIT8nQFH9SZPRi6/HairHaCmuEtNs=;
        b=ihKC5yuGSv4V2ZBB3r+ZfSXAMqT57O3FBMjhiq6AhdlF4FfwavQ4LS7e/B9W6c9PHf
         6+6S9AqPuvGzmR6QXH5KepWqndOU1jRqlhA4YD1mkZAM8JX8HAEQ7DPCC5CTY7G7G8/u
         ALwQl6V9hMA0uyH5SJVCCfEZzyM114AOyzpx3CEu1ukSEkK7KTUxSWk6RUZrDUBnOeUx
         /wxoiIBDTJcnqW33ZkoAyhoVtshgp/d0inCk0wYwjAYJSzhmRyObA8R/ajnnoB7psvkU
         TFsGCbkmf7E4VghdgBV3DnZokvWdPM9UYVwtd7TCW6jlGPCXUB442k2qOBNd7CZ6tGx/
         SD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813295; x=1696418095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPJwzNvZylvTQiOIT8nQFH9SZPRi6/HairHaCmuEtNs=;
        b=AAgOeYYzrj31We32MCDSQao8jcjJMd13Q9IXVVTTlsB+Z5IYxkwB74fyaInrWSaiS2
         EGtzXKRl0+pixoHA+QUrQddQJQ+Bgfblu+2VwtZoqDCKoS1Vmx4HshybNXIAcbVc9xxH
         XMz1RPdfDfXx23BJtNgOTa4iMnlt3J7No+2D5ZDnLg4SlXePKawcNyDJO+4/j1MmAT2K
         1tsg2mpPimgwrQR7t/1Fb/R4qF172rZ8dSsDvxUer9+qh8PrrqCovE6xORx34jgrDtaO
         nQUfN7hQvKSsuphcGu/K5mP60I56WkW2mGYd9MFIIdHpvePgq0JRhcQuE8YGlGOAhNI5
         tQiA==
X-Gm-Message-State: AOJu0Yw0KdHxMaF8RnrnxpY/HBrLLNAKN5vfGKtsJoberAal04mBGm+G
	gOu+/Z3UpzaFOalUQ+jnac54wiKq4F7I6Vtg/hmpVg==
X-Google-Smtp-Source: AGHT+IEn2A7RS/m3JUkpvx+tmDV6V0R2eCw+Of0nQLfgxCdKPWwgPYxVdAeR/zX+HB0XruKv1fpwYUQ6tD6Zm5e1DDc=
X-Received: by 2002:a25:f810:0:b0:d7b:aaae:2037 with SMTP id
 u16-20020a25f810000000b00d7baaae2037mr4192438ybd.22.1695813294798; Wed, 27
 Sep 2023 04:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230814-void-drivers-soc-renesas-rmobile-sysc-v1-1-6648dfd854de@google.com>
 <CAMuHMdWiC4v9fctp18bRrEH-m_-0VjMg9+XpON8vdRYwniTU3g@mail.gmail.com>
 <CAMuHMdWk_jcZ1V7J68bw11YZ+EjEqAWOKHzanVyxo2zktbMteg@mail.gmail.com>
 <CAPDyKFqgsHYz1hfOQ=KniNJj+u7ZSMoxS03Rixj1n2AOUdSVaQ@mail.gmail.com> <CAMuHMdW+ovx_Vbp1FQbvHESYrv3kHx5FvkjSb0V8dq857x5e9w@mail.gmail.com>
In-Reply-To: <CAMuHMdW+ovx_Vbp1FQbvHESYrv3kHx5FvkjSb0V8dq857x5e9w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Sep 2023 13:14:19 +0200
Message-ID: <CAPDyKFp_PfP4mVWucbMHwrRBvOAkktJDjqaYrMtEKat7raQ68A@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: fix -Wvoid-pointer-to-enum-cast
 warning
To: Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Sept 2023 at 11:28, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Ulf,
>
> On Tue, Sep 26, 2023 at 1:22=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> > On Mon, 18 Sept 2023 at 11:21, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > > On Wed, Aug 30, 2023 at 10:24=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Tue, Aug 15, 2023 at 12:11=E2=80=AFAM Justin Stitt <justinstitt@=
google.com> wrote:
> > > > > When building with clang 18 I see the following warning:
> > > > > |      drivers/soc/renesas/rmobile-sysc.c:193:22: warning: cast t=
o smaller integer
> > > > > |               type 'enum pd_types' from 'const void *' [-Wvoid-=
pointer-to-enum-cast]
> > > > > |        193 |                 add_special_pd(np, (enum pd_types)=
id->data);
> > > > >
> > > > > This is due to the fact that `id->data` is a void* and `enum pd_t=
ypes`
> > > > > has the size of an integer. This cast from pointer-width to int-w=
idth
> > > > > causes truncation and possible data loss. Instead, cast to `uintp=
tr_t`
> > > > > which has the same width as void*.
> > > > >
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > > > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > >
> > > > scripts/checkpatch.pl:
> > > >
> > > >     WARNING: Reported-by: should be immediately followed by Closes:
> > > > with a URL to the report
> > > >
> > > > Hence changing the Link: tag to a Closes: tag.
> > > >
> > > > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > > > ---
> > > > > Note: It should be noted that there is likely no data loss occurr=
ing in
> > > > > this case since the enum only has a few fields. The narrowing cas=
t from
> > > > > pointer to int will not lose any data.
> > > >
> > > > Indeed, the theoretical narrowing could only happen on a 64-bit
> > > > platform, while this driver is only used on arm32.
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > i.e. will queue in renesas-devel for v6.7.
> > >
> > > As the Generic PM Domain providers were moved to drivers/pmdomain/
> > > in v6.6-rc2, and now have their own maintainer, I have moved this
> > > commit from renesas-drivers-for-v6.7 to renesas-pmdomain-for-v6.7[1],
> > > with s/soc/pmdomain/ in the oneline-summary.
> > >
> > > Ulf: if you prefer, you can still take this patch directly.
> > > Else I will send a PR after rc3 and/or rc5, like I do with my other
> > > renesas-<foo>-for-<version> branches.
> > > Thanks!
> >
> > Apologize for the delay, been traveling lately. Anyway, I can
> > certainly pick up the patch and carry it for v6.7. Just let me know,
> > if/when you have dropped the patch from your tree.
>
> Thanks, dropped.

Applied for next, thanks!

[...]

Kind regards
Uffe
