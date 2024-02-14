Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE013DBAA
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946174; cv=none; b=UppBtupFbCWszMN+f/KBDzpe9N5h2Z0Raq9ltDjHZGw8Bp5T5ec6jdOvjmR0vqta6RiO9TISFTjwUVwq7o3h8qsLtqPX2+UA5gVACp2hQzQ9cF+QYznh71u9g2NA4dF76QuKfwZgZyMPo+AEV5PX8t6m1SpS24g175b81+dfS/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946174; c=relaxed/simple;
	bh=1h+GU62VcVsLcL314hriaxQNUPcjpImRJ7JoY1S/BfM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GSKfbhki8eQn1kxwoOTnczFr/e1G0sbq6gzxFZlTPqF+z+HMXxScp/ZjxLHhEZxtJSkJt1N93vrhRXEmx0gcKMUw3gxO1eDBaQCVHbfjsKT00mtL1ZypCCUhNDyKdU9PbaZyurTs1tBjvWopnLt6/ukI3R+PO6X4gHdokq6K840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RzEidhSC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--maskray.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RzEidhSC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6077f931442so3536427b3.3
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 13:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707946172; x=1708550972; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFTWNPOxarceOkMiDWt4BFJs1kZ5yk38ZT59AswMTIA=;
        b=RzEidhSCTNw6eJnPWseRwE99ZAW7OMRqz88W99MRn6W9vsTK2/o+iH9xhzghUwbwLX
         Qanlrv2RB5MCiIuW2eQ49xqBf4yYOZDtISWGk6mjB8d7pu35Wx/kdFe5MsOKgP6+mWOn
         +Yu48ON795e4K/wDgdiySPI3+zFhacTF/9bzv+HO9W8KTnIxouPzmbmfYVnr/ISmMgc2
         0IgS9uwGNh3RFLEYHH8M7KD2icZO+pp8UbsYUEllWsnEEY1j8oQWGLxcD166ouynwIC0
         4CCMb7UoGYw7/WnzQDy00rNaew4Azo6v7J76LdS81Zhko1vAVuHOZsNyDuIoSKt95P+q
         VJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946172; x=1708550972;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFTWNPOxarceOkMiDWt4BFJs1kZ5yk38ZT59AswMTIA=;
        b=Rvy8qOvqjP/jJh0Y83FhVO90xYeKS7oG9/Gkn9vVV30tDZ/a5eyQw+XUPASkaxQLgP
         O5ETmw8nJbO+eSm6xL2ApcdOR7CjTr+Vmq1AWdrOX/FtKHR+h7wGAoWth3qCFU54DKmS
         pXJJ5Kwb35hUEJRMtEphD+GbQw+2UiBbdEWyHgaVHNReKiu+dJkXTKYZltDerdrIXtqT
         cJZykuDojlPxZOGKtq5ovcj87ERc9ccMqeBd7akdmj2XCWbc1QlbeprVk3tDCUk7ghtQ
         /WGXAH0Ykc/EDmITXObFBkNF2DeVbePhNHbQeYMHQx0+XZzCazCwIUIk1yb6pu3Nnu+u
         4tQA==
X-Forwarded-Encrypted: i=1; AJvYcCV1O4pV+IJ4jp7IjcrocvBzN9r5QCEI7zyH0IxXj7uHTe9ftLiw3jL02B42dUbo5XmroIy9AHjhg7MqCxxPxyS2j9fNxA==
X-Gm-Message-State: AOJu0YxArQuRWWLCXf941LU+0M6yxsmhRNm9M8+3ath0ilQ1PxVg4oQh
	9o97ptDaGu/o+DrfqOr8p6PBMHJkleiMt3XztiyGyz9fi0MrfrHmDjVieixC6CP+T4G0yZYlnMY
	5UicUew==
X-Google-Smtp-Source: AGHT+IFqu5San60pN/HO+kKe9H5ryDNbyfTlopcSoOvmM5DJ+bcwMEr6JJfznvuPvwXLyQoTSDnHHFz4G9do
X-Received: from maskray.svl.corp.google.com ([2620:15c:2d3:205:448b:aa1a:69fe:22b6])
 (user=maskray job=sendgmr) by 2002:a81:4fce:0:b0:604:9315:b547 with SMTP id
 d197-20020a814fce000000b006049315b547mr849276ywb.5.1707946172036; Wed, 14 Feb
 2024 13:29:32 -0800 (PST)
Date: Wed, 14 Feb 2024 13:29:29 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <20240214212929.3753766-1-maskray@google.com>
Subject: [PATCH] x86/build: Simplify patterns for unwanted section
From: Fangrui Song <maskray@google.com>
To: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

A s390 patch modeling its --orphan-handling= after x86 [1] sparked my
motivation to simplify patterns. Commit 5354e84598f2 ("x86/build: Add
asserts for unwanted sections") added asserts that certain input
sections must be absent or empty. The patterns can be simplified.

For dynamic relocations,

*(.rela.*) is sufficient to match all dynamic relocations synthesized by
GNU ld and LLD. .rela_* is unnecessary. --emit-relocs may create .rela_*
sections for section names prefixed with _, but they are not matched by
linker scripts.

.plt instead of .plt.* is sufficient to match synthesized PLT entries.

.igot and .igot.plt are for non-preemptible STT_GNU_IFUNC in GNU ld (LLD
just uses .got), which the kernel does not use. In addition, if .igot or
.igot.plt is ever non-empty, there will be .rela.* dynamic relocations
leading to an assert failure anyway.

[1]: https://lore.kernel.org/all/20240207-s390-lld-and-orphan-warn-v1-6-8a665b3346ab@kernel.org/

Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/x86/boot/compressed/vmlinux.lds.S | 6 +++---
 arch/x86/kernel/vmlinux.lds.S          | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 083ec6d7722a..9f288f67972a 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -104,17 +104,17 @@ SECTIONS
 	ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
 
 	.plt : {
-		*(.plt) *(.plt.*)
+		*(.plt)
 	}
 	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
 
 	.rel.dyn : {
-		*(.rel.*) *(.rel_*)
+		*(.rel.*)
 	}
 	ASSERT(SIZEOF(.rel.dyn) == 0, "Unexpected run-time relocations (.rel) detected!")
 
 	.rela.dyn : {
-		*(.rela.*) *(.rela_*)
+		*(.rela.*)
 	}
 	ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
 }
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a349dbfc6d5a..b3da7b81d2b3 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -463,22 +463,22 @@ SECTIONS
 	 * explicitly check instead of blindly discarding.
 	 */
 	.got : {
-		*(.got) *(.igot.*)
+		*(.got)
 	}
 	ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
 
 	.plt : {
-		*(.plt) *(.plt.*) *(.iplt)
+		*(.plt)
 	}
 	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
 
 	.rel.dyn : {
-		*(.rel.*) *(.rel_*)
+		*(.rel.*)
 	}
 	ASSERT(SIZEOF(.rel.dyn) == 0, "Unexpected run-time relocations (.rel) detected!")
 
 	.rela.dyn : {
-		*(.rela.*) *(.rela_*)
+		*(.rela.*)
 	}
 	ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
 }
-- 
2.43.0.687.g38aa6559b0-goog

