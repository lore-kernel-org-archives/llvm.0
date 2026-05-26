Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3297407CE0
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816573; cv=none; b=Ttk/hf4NLSxZgJcYupifHC609YCm5DcVUGW0GNR0ub0vvW+eEM0C8f4xv3/5cQW+tmDdm+lp8f6GE2OFerlx5oD9AbPtuwb+NymILW8lW+DOLqsangzQcLI8tvRhMZTqEgXz3EUlkguj1NDbqx0z/RtW60fgcSzgbco90orr9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816573; c=relaxed/simple;
	bh=NM1hox/nmIStFDjJctyTRdY4mjSysbTeC8x06nBRPwY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pOGf2EGH+psf+A9Zm33R4ieWpnjxEqc8Knt07IFoMKVCZnokYBh87NGr0oCgHV6kw+K2Utf0gpW+AFPUjRQcFV1C865UMtIbEVabtXTLBPljrW4umK1NWuGQZnFbFHGAYKxHprbZEhbwEpi8PXU1d36gZyOWF30LujavRdKY7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J3DkoTsQ; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J3DkoTsQ"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-13709ab38a8so1973979c88.0
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816571; x=1780421371; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qz4h094dWujd+s1IC1j9THDXhh+xEyMYGMcHMzAmczM=;
        b=J3DkoTsQYqYmJMOeMJMHBxDVabuKi3HMW4tAyLdUensjOCeyUwNLTyoS91UmVRwxhY
         uaD0RlBVLfl6mgpEwAg/H178cPGlS1V2ISgH5R8jXwKX+jDd/FsqrqqA52b14L++p83q
         MwJbERtHdsnAIoqez9GxLk5T0/A6KDxN0F188vEQF8MzOq1nCgsPF0Gj/JIvitHdqN70
         YHS0IQ4S3P+/BinFPJo2jMN4V0UlOos2Hx6DKnrfIrdZFyj4CYwGAh4Ay3kaQkLuPPqR
         PtwS23syIm1bwtg/3tj224gRdl1uo9XZZPGrA3h4Qn3A19Ovyn7/DtgBPdv6nyUXMPD6
         iLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816571; x=1780421371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qz4h094dWujd+s1IC1j9THDXhh+xEyMYGMcHMzAmczM=;
        b=GF7cP5keoUIV2FefQ8vvte5oJ2WFb5DbDz6qxu3ZtELrWnqNfpIuuBKEd/CjUPHzBO
         a3/tNgvsczNtuoBi6LOP6TccQJSVgjSUDEm7AMH/3DZIfkaTQ/HvCtsoMO1iaXJLtyvp
         BAbS0cbEmkRWBY48ByfizS+rQuy5ohE3qEfdFLzREalnDDSqTSXaHYUKn9pXxh70+HU8
         s/cnUC2MgC2rsw/CJ2DJCIJZ0YcSLY+AM119/yX2t8E/97Z6aHwhXuS8cAbu0wC7IPUD
         LQmBSqjlGTsUfX4B1w5XyUYLVng1JyBJfeylWDSVaN0Z/EM4fBObQUTsjgu22aYHiRsG
         eoOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+otUX9Xz+DU9N2dacOfQHHlYoQKlteRPo0ItLJb9nA91BT+UF6WdRldANnH+bIG2K2cZhf@lists.linux.dev
X-Gm-Message-State: AOJu0Yw96uWbs6NefdQ3BVinZ1vKmzwJsqcq8TMPjy/9oIxIu5MVQ7yQ
	XvJvgX1LjoQn/xSjHiH7xxK/Ct8Dge+mvReh3WnZH5SgVFjvvjCcGVTkF43oFqZcEPneIQ==
X-Received: from dlbpv3.prod.google.com ([2002:a05:7023:903:b0:132:8d92:4d6e])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:69a7:b0:136:e639:9c05
 with SMTP id a92af1059eb24-136e6399e34mr3410554c88.31.1779816570333; Tue, 26
 May 2026 10:29:30 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:23 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-1-xur@google.com>
Subject: [PATCH v10 0/3] kbuild: distributed build support for Clang ThinLTO
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

V10:  Fixed a minor build error in v9 and added comments.
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
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 179 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.746.g67dd491aae-goog
