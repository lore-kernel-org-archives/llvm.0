Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE21BB68C
	for <llvm@lists.linux.dev>; Tue,  2 Jul 2024 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943963; cv=none; b=p324zsCKuCk5llH4KLuuniCVaczs5bPN0Tb+8VyK3UsZKioHGd/uEIylwD2wcH8lFyXGyD+99unU+uSjEfMthnGxy/CQsJcaQTiBp4v3bMqVLXyk72puOpqU1cZC7zzDbQ+ChX2zNlFFiCOOHDKxMUCIHS5r/4WHgPjBK3TqPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943963; c=relaxed/simple;
	bh=71JMdtPJKOootxvCEMGdevKLHTSBxHr4nk048+qJMCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpWQ2M029yOUe2p9AUoYj8SP40zSnniCECxtKV+oGtW/xyX+S8Zqy0cSmRyZxLJlqDKRlbCrp68RNpW+8MdnD6uUC6TnJmLLoY3GspAdyXGQPvP65TDhpTfrd2NiX7ZN/m9i6qlDf42cCNWfA9v9CgHyGcc6UjlcifyfjLhQhCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZo/6xSe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZo/6xSe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4257c6eea33so12985e9.0
        for <llvm@lists.linux.dev>; Tue, 02 Jul 2024 11:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719943960; x=1720548760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9Qvs/xdNpeY7QBD9VeBqFWNEzSHsvYpGEEj0o/6yQY=;
        b=wZo/6xSenR5IyF8bfpwIx0HFCrYv02FFkdlTRmsz1ms6/WMrvWPWkoougbkl8f/lqs
         lHb/A5Zp5xC+4rw+PztlZtA9/ToD5Nnhjn5RnjwXmHjmnUV75P7T03ovcwEDtrfDBWiz
         ea+P3cjTuQoO3/BwpqTdd+qDlL9j1hfpKwGoqzJpj913aTckMl/rVrwEeuFZx3X+D+Kr
         ifrBPv/S2Zd5eq2se9RK4yVmhpVTSBEvl4ix2fWY94s323daFynS4Scwyl/L6t/jUNjr
         Uf7/cXz1PzEnZx0cOpaB6RsRHHAdo8wpxvIapPDMD8Ror6S+cwDc9SbxWn+7ww+ovKij
         IBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719943960; x=1720548760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9Qvs/xdNpeY7QBD9VeBqFWNEzSHsvYpGEEj0o/6yQY=;
        b=mDkuvLzlMcJ+hozzbTylr50Y3mPPkdYY7+K0Um6rN/xkLl3ms11m7blBZpQ52EGE8u
         dKm/1fWSpLOQZr9K00z70SksTl0+tUD0VfIckINNyJchVY/cM+Guew6JMR4ISUN1Ljjd
         yCCsuyXFGUX0m2hr5j5tQZ+rqeNrcw48prLZ530AGduu3xgMsZW3GApoiSJD1LItHMVP
         EmCb1mlYS+cfJJbDmVZF98Zi1JguxeOsHCaOuTMcA/YwCRf5iHNIngrBonjox4EcYC1S
         7LkIUrij/ctUxR20zAS1z6qws5FNU0P+lFAvNSPo2kWPdPT9CabwtR83wovTdOajqc3J
         7YlA==
X-Forwarded-Encrypted: i=1; AJvYcCVPI5IRGuiahLvf79Uqhw8FKme6V7VUIQS/xIZbvkA4FzVwPQz1NcPxsG6TL/1xhz5DGWyw5rjeiS5DnyeFN1luhSOaag==
X-Gm-Message-State: AOJu0YxWzOLkqeTvOTe42uaYjuyUWeU0i41tnr9w8DucELyW5DEqR2of
	6PCzBF4OMFElAZfgVQv2FGPmQGK8187adipO6CG2h8dxHR8tyw0j+zpNFlS4+xkO7Yhu9YfJkio
	555Tlgxx387nAASY09icP4zf9S3Pg8wBnIoId
X-Google-Smtp-Source: AGHT+IFcNOGrNsnxiVD/J/AoO7E2rvJBq4MplbsS8y++kB32UStlq8B4Z3ZxGjiOUInZMdjEwmZc2Fv1o3AVHpoxZ10=
X-Received: by 2002:a05:600c:1c96:b0:424:a58e:31ff with SMTP id
 5b1f17b1804b1-426376a5d8dmr187865e9.0.1719943959538; Tue, 02 Jul 2024
 11:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614233105.265009-1-jhubbard@nvidia.com> <20240614233105.265009-2-jhubbard@nvidia.com>
In-Reply-To: <20240614233105.265009-2-jhubbard@nvidia.com>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 2 Jul 2024 11:12:12 -0700
Message-ID: <CAG4es9WQOOga8Oh9BOjr_JXy5gcUzVN0iTtfjN_HVdRj7_G7iQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] selftests/vDSO: fix clang build errors and warnings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Andy Lutomirski <luto@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Carlos Llamas <cmllamas@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:31=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> When building with clang, via:
>
>     make LLVM=3D1 -C tools/testing/selftests
>
> ...there are several warnings, and an error. This fixes all of those and
> allows these tests to run and pass.
>
> 1. Fix linker error (undefined reference to memcpy) by providing a local
>    version of memcpy.
>
> 2. clang complains about using this form:
>
>     if (g =3D h & 0xf0000000)
>
> ...so factor out the assignment into a separate step.
>
> 3. The code is passing a signed const char* to elf_hash(), which expects
>    a const unsigned char *. There are several callers, so fix this at
>    the source by allowing the function to accept a signed argument, and
>    then converting to unsigned operations, once inside the function.
>
> 4. clang doesn't have __attribute__((externally_visible)) and generates
>    a warning to that effect. Fortunately, gcc 12 and gcc 13 do not seem
>    to require that attribute in order to build, run and pass tests here,
>    so remove it.
>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Reviewed-by: Edward Liaw <edliaw@google.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  tools/testing/selftests/vDSO/parse_vdso.c      | 16 +++++++++++-----
>  .../selftests/vDSO/vdso_standalone_test_x86.c  | 18 ++++++++++++++++--
>  2 files changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/se=
lftests/vDSO/parse_vdso.c
> index 413f75620a35..4ae417372e9e 100644
> --- a/tools/testing/selftests/vDSO/parse_vdso.c
> +++ b/tools/testing/selftests/vDSO/parse_vdso.c
> @@ -55,14 +55,20 @@ static struct vdso_info
>         ELF(Verdef) *verdef;
>  } vdso_info;
>
> -/* Straight from the ELF specification. */
> -static unsigned long elf_hash(const unsigned char *name)
> +/*
> + * Straight from the ELF specification...and then tweaked slightly, in o=
rder to
> + * avoid a few clang warnings.
> + */
> +static unsigned long elf_hash(const char *name)
>  {
>         unsigned long h =3D 0, g;
> -       while (*name)
> +       const unsigned char *uch_name =3D (const unsigned char *)name;
> +
> +       while (*uch_name)
>         {
> -               h =3D (h << 4) + *name++;
> -               if (g =3D h & 0xf0000000)
> +               h =3D (h << 4) + *uch_name++;
> +               g =3D h & 0xf0000000;
> +               if (g)
>                         h ^=3D g >> 24;
>                 h &=3D ~g;
>         }
> diff --git a/tools/testing/selftests/vDSO/vdso_standalone_test_x86.c b/to=
ols/testing/selftests/vDSO/vdso_standalone_test_x86.c
> index 8a44ff973ee1..27f6fdf11969 100644
> --- a/tools/testing/selftests/vDSO/vdso_standalone_test_x86.c
> +++ b/tools/testing/selftests/vDSO/vdso_standalone_test_x86.c
> @@ -18,7 +18,7 @@
>
>  #include "parse_vdso.h"
>
> -/* We need a libc functions... */
> +/* We need some libc functions... */
>  int strcmp(const char *a, const char *b)
>  {
>         /* This implementation is buggy: it never returns -1. */
> @@ -34,6 +34,20 @@ int strcmp(const char *a, const char *b)
>         return 0;
>  }
>
> +/*
> + * The clang build needs this, although gcc does not.
> + * Stolen from lib/string.c.
> + */
> +void *memcpy(void *dest, const void *src, size_t count)
> +{
> +       char *tmp =3D dest;
> +       const char *s =3D src;
> +
> +       while (count--)
> +               *tmp++ =3D *s++;
> +       return dest;
> +}
> +
>  /* ...and two syscalls.  This is x86-specific. */
>  static inline long x86_syscall3(long nr, long a0, long a1, long a2)
>  {
> @@ -70,7 +84,7 @@ void to_base10(char *lastdig, time_t n)
>         }
>  }
>
> -__attribute__((externally_visible)) void c_main(void **stack)
> +void c_main(void **stack)
>  {
>         /* Parse the stack */
>         long argc =3D (long)*stack;
> --
> 2.45.2
>

Hi John,
Could you try re-submitting this series with the RESEND prefix?

Thanks,
Edward
