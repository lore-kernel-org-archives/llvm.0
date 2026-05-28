Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265F3016E1
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000750; cv=none; b=GrULSwR0NrHi2P2OxAsAoCylU/592eSvnWafgIg6XPnqj1Q4BK1pWI+PADTrxDxPYQaDfzHQVlNPd5uzv2KHF39K/FLjLzcNxKJIMVofq63j7KEn8Yswq5OVH6AChgv2NAsUxGi9e/n3O3+oiIwM3h9VDddsRTb1xA0bJ3YiZd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000750; c=relaxed/simple;
	bh=VPtm4KyGA2rNPcyT372mZgGPQ6VKzDlSiQWaFrEG3/8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uaHVAd2h+8kVqKETzBDKU6S/Z8E2eCD+16FyQUET2nxPVp0l48pffgiWpwcjAJuJh7bVtUZDwwAYs5T+BCgDrkgYoAxCPKVYYZ6sW9cUDyP8wZSUCa/Q3q2StHbDa1f3ZHX0Vj10b2UVz8aLt9YWtnXkfJiPUHEixzVGpQn+Wig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkcvijcA; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkcvijcA"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1365060ac82so5511189c88.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000747; x=1780605547; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oimbIklD2oW7RQ9Kb+qSzXj17yQYOv/MDfmOJ3+h/TE=;
        b=UkcvijcAs6zsp/X0Z+US+lo5/U/Dwmx/FmT7hqviK7uHGcsulmXjeYEfbcCWWR+RS7
         EHV+SKW96ilsqD94DNgb0zCV/9kNtFVa4cbNRdVNulWRTfBhwqtd2vpLCyQBOlt6U9lD
         A0liFLx3pvN/YSKh53DOIFvHmgB9zBH+HBzwsmzFDkJuHtw6AGSjwC8TnHO7TmLdqicJ
         +UUNmvYsTs1XTG+VEBDIZQu2BqtiCQdDfRdrfYmbvkGYSsDaEUSYvn9OmW3+D4edKj0J
         GLIHMUpp9IJYWX+5m34vqNplYX6beF4p8rOdLLM4Jbfvj+TeRQKtzgptbmO3SxeDHKpF
         RkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000747; x=1780605547;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oimbIklD2oW7RQ9Kb+qSzXj17yQYOv/MDfmOJ3+h/TE=;
        b=P1cNN0wLVMUvxz0CzytoPI2z5ZafQB6oWJYT2u7CNzCjQH5ABy4OO6PerKawyhMjdj
         9z7DYvok1NHu//Rn8j7mOOzae/4fI98vwrFPKUxDfkDEL1dxMVHAzk72P+oksbQgya/z
         VciNrgxkSZuOmZsOrkhvVzzJbIfFfWhwULM7keTyTFyFmq2dX1Gb/Ri93b9Ws3EC9vgp
         8184pmy3L5lxDxF05aT1RWhQo53WLlfB+yadqFnVFt7hyxPWq/qAph+SkzvhMMecD7Vb
         DKRAi8lBpX2+1BzQL0DwmIiIVFkRsBcrCYxVATOar1/m7p6vSk9qFL08fKqFozTJZ8sw
         dJbw==
X-Forwarded-Encrypted: i=1; AFNElJ8hpxjBDfkcRSKwpRU+02UO8reeVC9Q/5VYN92jDprQFFlrqShz6o7giD5G/Y8r/Acc02No@lists.linux.dev
X-Gm-Message-State: AOJu0YyRhZX8NGxRBFjGWGuu+26lNq1t6EWTrRagJsKxZxrTnhqp0YVo
	4cKaKCQAaIm1VGED0rhUf1OkDSOiK2/g+uCjGRrRX1QjrJxE/EwGLUIqPPMKQoQ6T20hBg==
X-Received: from dlbvs1.prod.google.com ([2002:a05:7022:3f01:b0:135:1edf:c813])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:250e:b0:12d:31cb:b806
 with SMTP id a92af1059eb24-137ac20c3abmr88958c88.26.1780000747087; Thu, 28
 May 2026 13:39:07 -0700 (PDT)
Date: Thu, 28 May 2026 13:39:02 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528203905.687687-1-xur@google.com>
Subject: [PATCH v11 0/3] kbuild: distributed build support for Clang ThinLTO
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

V11: Integrated feedback from Sashiko (Nathan Chancellor):
     (1) Included modkern_cflags within the saved _c_flags.
     (2) Replaced the shell command with $(saved_c_flags_$(<)).
     (3) Refined the file matching for ar_vmlinux.a.
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
 scripts/Makefile.lib       |  8 ++++
 scripts/Makefile.thinlto   | 41 +++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 181 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.823.g6e5bcc1fc9-goog

