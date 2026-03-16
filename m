Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2545364047
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696581; cv=none; b=NtOd5oe8upZAQGQ2eB9FNAh6HFdwB27jlkvFmUbJ6nXHpWWA/zOZrs71/8yR4Y5tRClT+Xopb89j8PO3YGKxTitf26WbLwxuFJKFmD3/AmRKg0sxrBWHqlclp00p22YKpmVB3mPZ1mhYAfBseUjKcWlanhl/I3goreajVen15p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696581; c=relaxed/simple;
	bh=dxsfmb/YEupislZPlbSsLwHXV0CS/9g8rvxxHXQbzB8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pb4cet/xgfAT8sMVyCV8TpSNXdZc2Uocv28t9R2nTn1+kIDIhdlnOA+IbgHVvGo3/Zx8+HijL3o+vEO3zub8p/GyjLp4c0etgCnAiwB/BHFcGoCcPDxxN/r/xZE+HNsasp4W8fk4f6LvGcz+0AcRllz5e2GLY3Kyu8rZNbl4TJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQMYK7Cg; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQMYK7Cg"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-127337c8e52so96097069c88.1
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696579; x=1774301379; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vCM8J7LTT/uLe/8rwcEE54UGB7wLbVI5pGYabTGypJg=;
        b=AQMYK7Cgm4udQJL5AGJcnYJo9V1VEn2pKicjwskRwUtV5J/mIXyjfG+wI59FZVAoC1
         qk8nithP39FZZxNnT5lLeuxLuZvISKAU04bIzy2EbgJZqv8w+NuyCcKv6HPXAq+2vX1P
         alRePCvckAZJwRv2gZ4ukbfjHBwMeSOqDkRYKaM7qWAvei2TPmkBXMd0Dnw9boPDef1a
         8d8yrUWJb75bTMGXNnCH6shujxHbaJC7zcuapxd0m/dcJ4oLT7rIMugKY5wNS3e7RwUg
         T+U60ExghUZYia48B9WcwEQJeAU5aOAcp2b2Ue01/W6Hc2tNKOe6Bsv337nY2GozFHLn
         Vpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696579; x=1774301379;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCM8J7LTT/uLe/8rwcEE54UGB7wLbVI5pGYabTGypJg=;
        b=acym1w4T9eYwXqJWAT9ywLWhGUCZUkM/lPF158gN1+V4NRkZijkJmv2rqH1EUtQse5
         l3+i62ikBm5FPNyZIkfIH3smdDbss4fu2t3963TT6jPd/EV2/9xUhhtdX9eamBryx5uc
         oDHzLjELV0n/Ass5xLAT+QIlIK1W3b4UGqfb37jQEZqKKsR3k4ZivQCPXq5GyfUzZMhq
         UmyfkhQ93Owt5xPX30jFABIIE5YGlIlmRSQmUQUTlYNQS0c9GY1DnEO25NrJPjTUbwfd
         ToaR66aHoVaQdFTkw1u4rAAjRjcJLC4+VXNGEth9fe7i+hauRu3HVVxjjqZrJqGnqnNe
         3f0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4pOd9evfIZ4Uc4tKfHn69dOab2mHgTwSkc2oOE8jC6KgOdCp3fDvigLNa2RrjKlnyQ45h@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy5cnZk0BAyMajFZIkB+G95jU4KPBxVFW2dhNo9o5KZUxCD/5o
	tUIaT1awZx99raD6cd2kfN0g3dDoT1CxWhUbI4x3Eyt0s1VXUZiMicSFwdETLHRP4LzEtA==
X-Received: from dled18-n2.prod.google.com ([2002:a05:701b:42d2:20b0:128:d42d:544e])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618f:b0:11b:f056:a1b3
 with SMTP id a92af1059eb24-128f3d3f175mr8012281c88.11.1773696578552; Mon, 16
 Mar 2026 14:29:38 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:29:28 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316212930.120438-1-xur@google.com>
Subject: [PATCH v6 0/2] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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

V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
    reported the build error from old ar.
V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.

V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (2):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 25 +++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
-- 
2.53.0.851.ga537e3e6e9-goog

