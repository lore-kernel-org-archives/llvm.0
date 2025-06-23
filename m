Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F921C9F5
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682346; cv=none; b=PmHBKhO3dFlXz51UbaU5mYlAUnivZYmPrsXQNvdIn9elfnognHT3LGZM7kGCQQBzPyupAOyYOoLIOSsI0o8AER+KCazratHwazkF8OmLxUhuEXtDKcj2G2dR6Fpxb1kpias2C3alrwNUSINYzJB7menudldO7FZ0q9eMEoqbwd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682346; c=relaxed/simple;
	bh=VYo3p1+S5WO9Tb6kOiFHRrBY9irGuOM6GBG3nuNIfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGbpModZir+N0ldCkyz3y2oticsiiqzb9L3+PErRjBKqDAYNuiFzmnFso+N+axZ1VTVnszWLdFjbGNvI0pOB8METAhTXvCtX9/2DNodCOnFrffPjTGcPG+KmocTyTHEgP1MVXXbowUNFgH7n038ldh9y5IygOOCkZtVHcDb89v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqHGWSd0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqHGWSd0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2360ff7ac1bso27552505ad.3
        for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682344; x=1751287144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWrGAMcPpZRG8lbQJxeM8jdjCzJyD9CWefbLAZMxLgI=;
        b=eqHGWSd0Mx+q/mVLqfLhwrNvEM5NyS+B/MwejDHK4iJ0oudwHu8T9gFHchWu24H1QB
         UOK6UpP8GafC9YvPIAr8s/HonMgOlWjhiqSlV/YhXNNEnXkeB4vuv3ksl+ZxuEvvJWKZ
         Ck75TXA7Z+o0IxcBJZbNEIP9ewwHwMrhbN/6N/tXnSLh4N/DeMgpGsRrEY+DrCRfudux
         pCBINci+ElwyOutjSPfEN/YfsYU6BqdOKRNfEoAidEIf7EBGb+WDEboKL8T3LXlMNjWW
         lMILIlXNenCIug7VuSHEw0r7McR5n3BKi4/X6CYHwJn3YF7dZQ7TVKMY1ga393Wnj415
         U37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682344; x=1751287144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWrGAMcPpZRG8lbQJxeM8jdjCzJyD9CWefbLAZMxLgI=;
        b=s+EYoL767Fi3v8YwIKmvf13VGiwHqBckdrGLktqYEoFsLQYZsvf2NLGn+1o+1JKq/M
         sk2EPFMw6eY/SQjGZgqLpYolReSqe3QMddvekPpzMZFT+qvv36Q9ilIngzGDKnCs7lnj
         Uh0Vnbh+a0LdjWcuset+bJ+c0gcfmgGGF/zIqUAa+XSg+5uVJ3O1uniSSiBTQJfeqB8Q
         xG8sZFDPJgk7Pe0ZhxrnRdHMT/XpBj7YgGtGY7k02BqHaFJGvR7A3c2XBnV6yDoWcte9
         RlW0v2cIRZyX6L3KF6Np2uHpsMcL4fMjYYfk5qWxbesabSNQNsWXZMia7deoudFV/GpR
         wrYA==
X-Forwarded-Encrypted: i=1; AJvYcCXSKt5SA6O15i+j6HoVpFF6ZlvTFH56u6EvzaxEA0+kHjxoN76Tu3RHb1qI7OrR1LgTuuXL@lists.linux.dev
X-Gm-Message-State: AOJu0YyDTXQaupkbbtPHJgU1IiKbm+5iavd6H2ffRr+ukmQEEMijz8aX
	jDU1Xtq7G+2mAs2h04Iz54Bl/KZUAWbuVPIFLBqVDOjDh2q/C5PvsM/jHNWrUqcMEwAKxJ6JlZ1
	fRQHLY9Dska+YS7DHKjOrVzaZ2YT0DJg=
X-Gm-Gg: ASbGncs3d+qBtaQltuMNGZBrbADfCl5PYU0C6W9Lp5zUgS2OmZbertOE5gQ53t/nr5/
	dAQpuSCJkwOMqF4n9XocuZysV796hPyKgjzzknfWrU7CtJW6O5DiATYEXGUIYFtHoFaSPgmIUqc
	VbXdf605b59fw8X4/BALN1mdpS2wZCQdQpA1mAB6c2TI4kugMjr+4QlA==
X-Google-Smtp-Source: AGHT+IHSzNNomm2sZ7DqFw/h9VK1brbUJVtiqQwHa1/h6hA4CGRTGEPksBVJIe6zn58E0Oipluv4lu24aaz6hy2XCTo=
X-Received: by 2002:a17:903:1a24:b0:234:aa5b:e7b1 with SMTP id
 d9443c01a7336-237d986e579mr155778265ad.18.1750682344055; Mon, 23 Jun 2025
 05:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com> <20250622-toicsti-bug-v1-2-f374373b04b2@gmail.com>
In-Reply-To: <20250622-toicsti-bug-v1-2-f374373b04b2@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 23 Jun 2025 08:38:52 -0400
X-Gm-Features: AX0GCFveve2Y7pvAArc2q1uVqo_M9l_e71tEKBIitiCegsNZwagPgJSEqL5WlVU
Message-ID: <CAEjxPJ6v12nLFx-x4-=esuPMp7L8UBvTzoj1kkTPcD2mDKKW8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: add capability checks for TIOCSTI ioctl
To: xandfury@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	selinux@vger.kernel.org, kees@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 9:41=E2=80=AFPM Abhinav Saxena via B4 Relay
<devnull+xandfury.gmail.com@kernel.org> wrote:
>
> From: Abhinav Saxena <xandfury@gmail.com>
>
> The TIOCSTI ioctl currently only checks the current process's
> credentials, creating a TOCTOU vulnerability where an unprivileged
> process can open a TTY fd and pass it to a privileged process via
> SCM_RIGHTS.
>
> Fix by requiring BOTH the file opener (file->f_cred) AND the current
> process to have CAP_SYS_ADMIN. This prevents privilege escalation
> while ensuring legitimate use cases continue to work.
>
> Link: https://github.com/KSPP/linux/issues/156
>
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  security/selinux/hooks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 595ceb314aeb..a628551873ab 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3847,6 +3847,12 @@ static int selinux_file_ioctl(struct file *file, u=
nsigned int cmd,
>                                             CAP_OPT_NONE, true);
>                 break;
>
> +       case TIOCSTI:
> +               if (!file_ns_capable(file, &init_user_ns, CAP_SYS_ADMIN) =
||
> +                   !capable(CAP_SYS_ADMIN))
> +                       error =3D -EPERM;
> +               break;
> +

So, aside from what I said previously, this also will break any
existing policies currently controlling TIOCSTI
via the selinux ioctl checking in the default case, so at the very
least, this would need to be gated by a new
SELinux policy capability for compatibility purposes. But I'm still
unconvinced that this is the right approach.

>         case FIOCLEX:
>         case FIONCLEX:
>                 if (!selinux_policycap_ioctl_skip_cloexec())
>
> --
> 2.43.0
>
>
