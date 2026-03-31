Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7D54219EA
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972117; cv=none; b=NnB+kLIXpfmtgodyS44IMi4KB3lp1OfsW60+3g+FLoMFzC3uWrGABu/TWVtiGltkTpU+3cwVN7Nr3hZI6S2pJ/2jzwQdNunOAZ53tLaqdEKBLBI286fgDVwIRCaaNNnXGAwMBw+EP9nu/0MBZVFbXnu2a8jGm5KU6oLxbrgGzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972117; c=relaxed/simple;
	bh=UpKPz3IcNnfUkaxE5x6u5xnlGmGCoHd3YYjcBNDqq2g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mxLiBrH673WjvrmzDQ1tEJknrzuDOqpHwa6jET6c9I1GMcMntd+d7VFBReDu/8WPztHyNowoZJ8NeQJnPIMH45Oc7Gh6vFQ0odDR2bEgzfhPfbwTv/Be+tX/X2TSb0d4+rU0kEgbnp9wH0R0ZLrLksjVHcN77FZNHugiB/Ia1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jMxOzojh; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jMxOzojh"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12721cd1a2aso6922410c88.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774972111; x=1775576911; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zrYcoA4JUlYO01gPXAFDA8Ve6v7akx2/ICM68YRF2tQ=;
        b=jMxOzojhzY+f1p1eO9yVMh+DL1Gtz/TTpO1u30FgHPS7jgUFLMvw8B7112ASfWMxao
         HL6uSbzaJiEWo8o4P6M2OFbtPRyaUgUSZAhSE8lPOeH/SzDZ6KSKCK+KR0P6xbUMLp2M
         nMfEAJHo6G/Qe4IVEJ7LZkJPn5YVUROD932M3MqvyvOaNkUj1yB87B6ib3yBeifB3Egi
         GdWFL2TyLh5bPd/cDV/3cYg85IEb4+bDUY3wFgmmGfzB3bA6HQq2Logz9xobiX3wS66x
         UCwLc5Zy12hfgkxFb9JPPYGFUqWfdBzOJzD2e923pzAF8NOQ/PU+V5r/SnGWs2cvaa5c
         Mhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972111; x=1775576911;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrYcoA4JUlYO01gPXAFDA8Ve6v7akx2/ICM68YRF2tQ=;
        b=e6jt4XubRQXCBoelW1M4OnKedMFvV5tfY7EMJGp2IlLYlZfx352nJX3GT6/CFlf6a4
         Co4J2yRaUnB/j31LBh9adh3cGDG8k6kNXacSWeCpoZslSzQQIqo3WNfwuOzVaG8xuH37
         wqJlSb72TUNAfyKu6ltRbU2755XTrLUZeTV8EuOE2qv313bggQoXIJT+5Ff6mPRHFlli
         owO+WcPv6AmJegAZCn7HpZW/k+dM5RJylraoyMDQW6IiJMtVqOqQ5xDoiIAvg/8gPKPI
         ovk3QtWjnIhOxfuqH2LeV1T6FtWCBbA/KFIfssoiKiRzSLBmEj7VCNxGPD7aPL9Vxf2i
         aqag==
X-Forwarded-Encrypted: i=1; AJvYcCVmsrk0o2sgleZyywEB2hZOEJEPBT7KICegE60+cShyXPBIm7fvMq1CFZuMWsI6/r4yPty+@lists.linux.dev
X-Gm-Message-State: AOJu0YzHVsa2VW9/7HxSCPOgDz8YukHXp0hT3hqWJYzTpkoZJGQGJ0aB
	POnVAYa2nD4mMpVSoPCnxxdNbTdJcFj3ikUReXzhCcz39iziiUoBJBZKXOYo4vph+IgTeg==
X-Received: from dlbqj17.prod.google.com ([2002:a05:7022:ec11:b0:12a:7349:f4f6])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2608:b0:12a:796b:7cf1
 with SMTP id a92af1059eb24-12ab28d8cb9mr11052469c88.23.1774972110850; Tue, 31
 Mar 2026 08:48:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:48:24 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331154827.2793269-1-xur@google.com>
Subject: [PATCH v9 0/3] kbuild: distributed build support for Clang ThinLTO
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

V9:  Fix minor build error.
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
 Makefile                   | 27 ++++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 176 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
-- 
2.53.0.1018.g2bb0e51243-goog

