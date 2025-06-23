Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D813C9D4
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682137; cv=none; b=SvQT4f0/W5KbzXlEGjbNvHBxA8gQGt2s+0OHUZZ3nCbMWvDyA7siE6DqFvdXj9A1mNuX0NxqSDgQOh3+EvhTQN63DtS77NfBdOixvUuJsDOEzLG9kVUAaroqZ9VLblAfwkamQj/CwyqFGFkGrkVSNa4xosRcOLM2MN2/WRIJ/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682137; c=relaxed/simple;
	bh=Fw8H1bJz3s55X12OstVPkl/Ss/KPoSsjGMv4XIofF3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBF2+a+PTkBhRyA9swwvXIdyNihTCvgu9K4dr2+yy3Kc/fXxOr7e6q0iB6DeRRUJhpj/NWWhBfUvGb8EH4Pc0Kp4ci6DC5RlDoAzSFa+FVHqXsMyNi1QLccRnLLhnZt41AxURTxYW75xcxTKzvU2n5rD4Ntw1ASqU6wsC0fx9Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRezzaXO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRezzaXO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so3205344a91.0
        for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682135; x=1751286935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7qhLKSaZBJUrIQxrexkwHh16gMLen9lREkpVcdbEtQ=;
        b=LRezzaXOiedsTJrTA1CTjWjJaIHOhcUiEGK3uXv4H2YI1IwDuwLw+0gJT7Tw4bqmdo
         +lvtGpGN7cKYRRY/dzpRSJXDc231ruf29Lh5N5f/c9ZXn9Vulspy+OPUpK9aTK3Fko52
         lg5YUU0Bk8uxQO4JfdNfGxAutESBLI3GI90EBdY5SAFGAgjJNvnSdNNs37K0XowqvRKH
         F+RQyW1i8Yx6NU5H6/pN/N28t1Qpg61D+uj8gRWPdAfmk7IFPtisLucuDtiPEWIN3FLe
         4fotIj1O5O6jTKiiJRhZ9Vlijz2xXh9TAXUWttvv6pZ62gsBVfrVVob80gbEM4asR6VL
         KIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682135; x=1751286935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7qhLKSaZBJUrIQxrexkwHh16gMLen9lREkpVcdbEtQ=;
        b=jkqUGs/CJTFyR9O5RmsrAlVOihZyNTM7K8YhV0+tTTwj6kmk1jQsNay2lRdtEuYgAe
         TamqhKmeBG+NznrTyTBd6WrkeNds67dj8lNHp/mfS0t828IrYpDjjPcVXrQTpLS6TkCA
         VSrHdtAGbFt2Bom9xShvOQgg5Aosqut64BnsGsbMXd4h8ovb3cD407XqTPZIG6CRTxJ9
         TOOi9TlUeL2QH0hMDQ/T9QsEyXxNGzwIuu6sGZFpMaKkCxmFYOEQUSuDzlD9jUQZbWTX
         98zDdsSOkwF7byDHX+UEPfpuLMuV6bGld1nznXk/3bXgY2pRnm9seCV4PcoI5R9BU0R2
         G6ng==
X-Forwarded-Encrypted: i=1; AJvYcCU/mPd0CBTb5FHncXJbFs8QWh/dJUl2SD6Ywr7VQGBm6ftIykebXJWfhXIJrIY12vT61PFZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxXgxBdKi3/LUz1almOxpEHJX2y8FmTnM1sDR3TqCqm2yJK8nAH
	G71WPbM88/Kmr3Mnru/ZFcRJjrHSLDUtJVtpvJrRLhow5WapKbghXtGn/shfT1Sgg8hvNFSFOsi
	nfEKilBU0vMUGMBe8N/BawVVLpClXNuE=
X-Gm-Gg: ASbGncteDelcKA4q3uZTq22Q9Qt9nZXpqkZnKpg2/EcJzM572Fw5yrKVEGRED4Th4mb
	yEDyZeuI7AqMEL62K0B1i95JPuPhtFsMNkbiBWFDNS6zXaEg+QkJYh28/dPZh7UMeVjeKqQFZPx
	FqGiSQs0D1J+z6BZP73gFsyU8YGD8+3dDBLgIx+/GKZQsTOVneXfvpiA==
X-Google-Smtp-Source: AGHT+IFgLQuZoeX9b3aKKJtmdXKrWNO2mg86tL81LoOCWkqAY8Cl6nMZugpAgQtX1P3C6+d9ero2JdkR6FprooZDhVc=
X-Received: by 2002:a17:90b:4c50:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-3159f50379bmr16763807a91.12.1750682135242; Mon, 23 Jun 2025
 05:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com>
In-Reply-To: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 23 Jun 2025 08:35:23 -0400
X-Gm-Features: AX0GCFuLnTJxzf2okVc0glfm3bX5AeBW2XJ6g5gUFYldkEA9RJmWnCx-TMi6png
Message-ID: <CAEjxPJ4bru=J=XZGSFXoxkQJZHQX_iJaxdCwpY8PAcaNv0F2fA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Possible TTY privilege escalation in TIOCSTI ioctl
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
> This patch series was initially sent to security@k.o; resending it in
> public. I might follow-up with a tests series which addresses similar
> issues with TIOCLINUX.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The TIOCSTI ioctl uses capable(CAP_SYS_ADMIN) for access control, which
> checks the current process's credentials. However, it doesn't validate
> against the file opener's credentials stored in file->f_cred.
>
> This creates a potential security issue where an unprivileged process
> can open a TTY fd and pass it to a privileged process via SCM_RIGHTS.
> The privileged process may then inadvertently grant access based on its
> elevated privileges rather than the original opener's credentials.
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> As noted in previous discussion, while CONFIG_LEGACY_TIOCSTI can restrict
> TIOCSTI usage, it is enabled by default in most distributions. Even when
> CONFIG_LEGACY_TIOCSTI=3Dn, processes with CAP_SYS_ADMIN can still use TIO=
CSTI
> according to the Kconfig documentation.
>
> Additionally, CONFIG_LEGACY_TIOCSTI controls the default value for the
> dev.tty.legacy_tiocsti sysctl, which remains runtime-configurable. This
> means the described attack vector could work on systems even with
> CONFIG_LEGACY_TIOCSTI=3Dn, particularly on Ubuntu 24.04 where it's "restr=
icted"
> but still functional.
>
> Solution Approach
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This series addresses the issue through SELinux LSM integration rather
> than modifying core TTY credential checking to avoid potential compatibil=
ity
> issues with existing userspace.

So I'm unconvinced that fixing bugs in core kernel permission checks
by adding new checks to SELinux is the right way to go.
Also, SELinux already provides a way to control ioctl, although it too
uses the current cred, but the granularity of the
process labels and the ability to distinguish individual ioctl cmds
may mitigate this issue in practice.

>
> The enhancement adds proper current task and file credential capability
> validation in SELinux's selinux_file_ioctl() hook specifically for
> TIOCSTI operations.
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> All patches have been validated using:
> - scripts/checkpatch.pl --strict (0 errors, 0 warnings)
> - Functional testing on kernel v6.16-rc2
> - File descriptor passing security test scenarios
> - SELinux policy enforcement testing
>
> The fd_passing_security test demonstrates the security concern.
> To verify, disable legacy TIOCSTI and run the test:
>
> $ echo "0" | sudo tee /proc/sys/dev/tty/legacy_tiocsti
> $ sudo ./tools/testing/selftests/tty/tty_tiocsti_test -t fd_passing_secur=
ity
>
> Patch Overview
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> PATCH 1/2: selftests/tty: add TIOCSTI test suite
> Comprehensive test suite demonstrating the issue and fix validation
>
> PATCH 2/2: selinux: add capability checks for TIOCSTI ioctl
> Core security enhancement via SELinux LSM hook
>
> References
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> - tty_ioctl(4) - documents TIOCSTI ioctl and capability requirements
> - commit 83efeeeb3d04 ("tty: Allow TIOCSTI to be disabled")
> - Documentation/security/credentials.rst
> - https://github.com/KSPP/linux/issues/156
> - https://lore.kernel.org/linux-hardening/Y0m9l52AKmw6Yxi1@hostpad/
> - drivers/tty/Kconfig
>
> Configuration References:
> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/tty/Kconfig#n149
> [2] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/tty/Kconfig#n162
> [3] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/tty/Kconfig#n188
>
> To: Shuah Khan <shuah@kernel.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> To: Paul Moore <paul@paul-moore.com>
> To: Stephen Smalley <stephen.smalley.work@gmail.com>
> To: Ondrej Mosnacek <omosnace@redhat.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Cc: selinux@vger.kernel.org
>
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
> Abhinav Saxena (2):
>       selftests/tty: add TIOCSTI test suite
>       selinux: add capability checks for TIOCSTI ioctl
>
>  security/selinux/hooks.c                       |   6 +
>  tools/testing/selftests/tty/Makefile           |   6 +-
>  tools/testing/selftests/tty/config             |   1 +
>  tools/testing/selftests/tty/tty_tiocsti_test.c | 421 +++++++++++++++++++=
++++++
>  4 files changed, 433 insertions(+), 1 deletion(-)
> ---
> base-commit: 5adb635077d1b4bd65b183022775a59a378a9c00
> change-id: 20250618-toicsti-bug-7822b8e94a32
>
> Best regards,
> --
> Abhinav Saxena <xandfury@gmail.com>
>
>
