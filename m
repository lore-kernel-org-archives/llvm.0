Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0F340413
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080835; cv=none; b=K3j30GdiUNxkeuXJME9ZKJ+uKG+7fuFCNcXzaFXBO1pfqrlxufTBvQpthrDNli1tTc/4k5wE7sfF+3wmGriQCEe3FmWKzz//prUtehmP10cqedDVjaFzvMXXJHtD5od/znYnQIPxIe+MgZaa7QrG4ydOYPO03bmi3fnKConK+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080835; c=relaxed/simple;
	bh=/lNacLdW9sEOoTS/HBDmtkyIRf4qRh3MXKPb+7r4ATI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AoJ7VTBYNe+J5d+sBd7K8iQG3IOvrio7YbkP58FIKl8Vo0pMZ+5bETkg4uQEvWulZeJjWJRz7OrynSOcNCVL2ETovmwTmFbKAygcbJ65Li0U0+v9lMk/t69vJNl2ipfMAiTjYO5x/NCAEioVRvAAM5gbpgQsndWJpM5lNSbj53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tmA3hMbg; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tmA3hMbg"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12dece274b1so18840523c88.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780080830; x=1780685630; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=81SwLsYV+fPUwbYdTwTcJ7io6v2ZR/O+UY0W6GoVbVk=;
        b=tmA3hMbgGHJPYYskoKCz+Fbz5nuhptzPFnvNGgzgw3Fm/uTwVSGFGdJbxpsB3sxNwP
         Joi03YcBrXqCaRydSS85E428jBwoyJQQf517j3NusrMo3zILP+CltznNA10lh6/bfg0D
         7ZmFHJA7Cy0K9LYzW5t4SyJMJP6w0qB+Jg4bpEB6aDacjo/RAr3MG56ESazVdq0aApYW
         YlhReS7P2TMMzTbTXFWHIsUKIWy65ksdhEbM34QOtPwGeqrUF3dDpqbrNobDQyq1yC6R
         XAEKJDC52MeRdTuBlPbfbfQoAh40GeEm0BHRbsea7hC8/+CwJTbQtYmiyCuSajq3+yE3
         V/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080830; x=1780685630;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81SwLsYV+fPUwbYdTwTcJ7io6v2ZR/O+UY0W6GoVbVk=;
        b=EhsxZypUAkACRrmjqwDM5UIlZmGlnc/oSZXgK7f5AzUKvbGMvdokZeZYeO7+BQdS7h
         Pc+sknIvSs85LnR+Du95+XrIRrETKwP6SRsWbcy68GHZjDU5m7UiM30LKvxFGZ/PB3FJ
         9cZ8ieubV/IHJaNsu0bJTNNSgqL/Ddyh0AEH8VKXxBgTh/O2GumZ7V4cSplBAIxQyptk
         Xxu8IjrXH53sskpDf4jcAE5fkdQ8kSzXBqT2qW6i/aFwXVaunCTWKpWB10O7Ci+SLUrF
         AkxdkV40QDMQsvwORW+Ta3l6Z9WafGNovs8Dmg1TlSFON/r+lZLtKl1502B4fwhQibZL
         enbw==
X-Forwarded-Encrypted: i=1; AFNElJ/PZj6yvazARL+EPax3PvTVtXLWTRwnfAcAHEwNc8+/LSswfv5cBMBzTqUJmefc7pQWTh0M@lists.linux.dev
X-Gm-Message-State: AOJu0YwKmFOSSp1BwjeQ6X/KPNBEmpEyCODYMcpZyaz2bRtJUyPIoJ+I
	BMGjveGaxP/w1YUmEW9lRqeXq/ghJ6dKkk3vf5VwziPW3XtQPtKN6zfU+l6iAQUYWSxyOg==
X-Received: from dlbcf5.prod.google.com ([2002:a05:7022:4585:b0:136:8b77:210a])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f96:b0:136:5c88:d928
 with SMTP id a92af1059eb24-137d426d0e5mr388314c88.19.1780080829713; Fri, 29
 May 2026 11:53:49 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:43 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529185347.2418373-1-xur@google.com>
Subject: [PATCH v12 0/3] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

ChangeLog:

V12: Fixed an build error reported by Nathan Chancellor:
     Reverted to v10 shell script based approach to get saved_c_flags.
V11: Integrated feedback from Sashiko (Nathan Chancellor):
     (1) Included modkern_cflags within the saved _c_flags.
     (2) Replaced the shell command with $(saved_c_flags_$(<)).
     (3) Refined the file matching for ar_vmlinux.a.
V10: Fixed a minor build error in v9 and added comments.
V9:  Fixed a minor build error.
V8:  Disabled -always-rename-promoted-locals=false for the distrubute
     mode, based on Yonghong and Nathan's comments.
V7: (1) Resolved a conflict by rebasing to kbuild/kbuild-next-unstable.
    (2) Separated the '--thin' to 'T' change into its own patch to
        preserve Masahiro's original version.
V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
    reported the build error from old ar.
V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.
V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (3):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: change --thin back to 'T' in $(AR)
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 30 +++++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  8 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 180 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.823.g6e5bcc1fc9-goog

