Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819B176FD8
	for <llvm@lists.linux.dev>; Fri,  5 Apr 2024 21:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712354116; cv=none; b=J/oVcbOnlUYoWfAtqA0ubEUrhLmzkHccB18JHtEM5gYMr4lFhTzDQc+uJglYCBIyKKNf/fJ4juhnnVoX+ZByr6FQW2yB5yqXQTGEJuBFTuU1nZm+dCzDJaoWytEhfrqxBEvXrWWF81QJTsnRQwwGJzTBZZOsSPYZx5OVMiIe08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712354116; c=relaxed/simple;
	bh=fx5yqGZ4qGVFjioJ4n68AJdEgTCdOHtWI5LNomOb0zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ2Kwci5rW3MueGasidYMxRu/DeLa61qHXoTdgHQTrg7W+t7eEDRThDA3ujAgjS67jVycZ0816wK7WbdwojAwlQKvIjHg2FgNqkydIMw2gP0v5auWyh4Fz6SahNZkaxXM6BVA2M7INSk01h2HL2whJ0dBF87sbG6NYCnF4c7SP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lvMfB6jn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvMfB6jn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e3e03b989so749502a12.0
        for <llvm@lists.linux.dev>; Fri, 05 Apr 2024 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712354113; x=1712958913; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbd0ewn5oeu56kYYL5RJDjYhgsk2f08lNhWKZaOdWFo=;
        b=lvMfB6jnvp83yl7iG/TCNwnVqXPg6cU8yQZ1vqBllykxEm7y3AmJgULWDwVwoMEqBO
         KijDhdqUMOKwZO/5VHHAuGspOYaPqhNW9N7dmeeBcnExATdKlXydTcXAHalakCLIcNxt
         ymJ1iAqQEJQCtYa44kKBREaqLYR1KnqyDPw8AO/0L5InOoa5rNRgmA67cubJFvpUHlwd
         BTFIcuPk3zoTkpnXeNIdKf1bu3RCh+8H2hoqSn9r2LxMdpFPCOcMqJSULXIvpK0Cgw4+
         bJhdf5Qw5/f1Y5wwvTJbruJrdO73QQiDaWBRioIdjWLGhySF+e8kKenTJnGxKg/htmX7
         a8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712354113; x=1712958913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbd0ewn5oeu56kYYL5RJDjYhgsk2f08lNhWKZaOdWFo=;
        b=V7ZXyg27cwkV14Qak1PurVL5bATu9YgRtTGoc+QyU/rXbl7hdA5/0fRyEjVvuVvSHO
         u+38TXdCzsEZefSfOFEK2CcNqQZ9jh8foOqZCOsaoLxkWbKM6BeFcFNi0ozxHy2vaNxb
         Oymdtb0Wms419cDE0btu3HuPqMv0Ym1ULpHML0M+OHQ34Hz86M5xWojLS3kQoF0ygAJw
         DTPAtmwR0049NNV0YlicQ1dCW3ENKMw8mvScUwPDF91LiMi+xP4GgPuRrV+YEV/jcXl+
         8HDwCsGYdjEo8UjLBSr6kl0qjsLeGlL2T3kGx5fSCCxjITHND0uWecuw65K1AxFaNHE+
         u/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8D8OVFKkBQ+qxmxRsnrXU2PeIKqttBJF14LMLlin/qGGbbnD2UEPYcVPs+OhUBzF3F28FVcShdbtrNf2XnlvyFmUhgA==
X-Gm-Message-State: AOJu0Yy0Mnj4e07HJJQ0lvuxgUMmHIAU9Lq+FpbRaqTn0R4YIUhNOR0w
	PeSKhgxYAUCymZeuPP7GBd12ukO7N/NadcVM7Blu5x06wiqNdia7ZbCCUSYSUwpTsG3864ZyTVO
	PihdfJu5o70ZNhY6VvB+Tk5HR42ShPm5Ljmgp
X-Google-Smtp-Source: AGHT+IFYRh93zA+h1crW6xNFKbgQILfzaZh8L+UUEjWi9SkFoEZL+x5P4BdTesw1CHTV+s6cc1Dnrvhi31WUF033+zA=
X-Received: by 2002:a50:8e5d:0:b0:56e:2c34:cff2 with SMTP id
 29-20020a508e5d000000b0056e2c34cff2mr2337858edx.19.1712354113455; Fri, 05 Apr
 2024 14:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405204919.1003409-1-arnd@kernel.org>
In-Reply-To: <20240405204919.1003409-1-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 5 Apr 2024 14:55:01 -0700
Message-ID: <CAFhGd8rj+czcvzKsFjcBs1L_jJiar1H9n7mHmnfWKNH0MpFueA@mail.gmail.com>
Subject: Re: [PATCH] x86: microcode: avoid -Wformat warning with clang-15
To: Arnd Bergmann <arnd@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Ashok Raj <ashok.raj@intel.com>, Nathan Fontenot <nathan.fontenot@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 1:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Older versions of clang show a warning for amd.c after a fix for a gcc
> warning:
>
> arch/x86/kernel/cpu/microcode/amd.c:478:47: error: format specifies type =
'unsigned char' but the argument has type 'u16' (aka 'unsigned short') [-We=
rror,-Wformat]
>                          "amd-ucode/microcode_amd_fam%02hhxh.bin", family=
);
>                                                      ~~~~~~        ^~~~~~
>                                                      %02hx
>
> In clang-16 and higher, this warning is disabled by default, but clang-15=
 is
> still supported, and it's trivial to avoid by adapting the types accordin=
g
> to the range of the passed data and the format string.
>
> Fixes: 2e9064faccd1 ("x86/microcode/amd: Fix snprintf() format string war=
ning in W=3D1 build")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah the family only needs a byte so this is OK.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  arch/x86/kernel/cpu/microcode/amd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/mi=
crocode/amd.c
> index 13b45b9c806d..620f0af713ca 100644
> --- a/arch/x86/kernel/cpu/microcode/amd.c
> +++ b/arch/x86/kernel/cpu/microcode/amd.c
> @@ -465,7 +465,7 @@ static bool early_apply_microcode(u32 cpuid_1_eax, u3=
2 old_rev, void *ucode, siz
>         return !__apply_microcode_amd(mc);
>  }
>
> -static bool get_builtin_microcode(struct cpio_data *cp, unsigned int fam=
ily)
> +static bool get_builtin_microcode(struct cpio_data *cp, u8 family)
>  {
>         char fw_name[36] =3D "amd-ucode/microcode_amd.bin";
>         struct firmware fw;
> --
> 2.39.2
>
