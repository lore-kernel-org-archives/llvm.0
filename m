Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7E409121
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816574; cv=none; b=D89JXtMeEIZpojTo8ohWgoR+ndpZegMCzga+PS5MKMWHFA0Puu+HrWZf+jgZ4DtQRz68l2JaOHEQEUPyWJpc1rEvisbNzGnK6sqgIiXBUFmxnUI/sYEdqggxPpQYVYA4zgkIFxVdZsl4x91a70cNDkeEkF/l7OKTXZ7PM9Z6l8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816574; c=relaxed/simple;
	bh=IrM04IvPDo1sb9vHOovgPk1Y41bQl7xbfqKK2Qsjgi4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GXDy05tpKQsXZ/RN6XE7XnfYhAslxx0xaKCwBbop9jPi8XIOAyVmwhJbxuoveWn9YKCD0U/Af5vxHtDlGYt3ZiqRrDz7TWZIMlkxduCZ65xOSZb09JZc1DW2HqdcT0BLYZIgScHGt7FY9AZ3SaeJMNDwMgYBVpc7gE1FsXp2Kgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G8jVPI9D; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G8jVPI9D"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1353bfdbf99so8967814c88.0
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816572; x=1780421372; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSth3bH8wQN7DeJyLy/4rKJnmvPjIvLAam/FmnUx4yQ=;
        b=G8jVPI9DqAQ0860dtISA2ZiCGp0vf7fSvU/CNnEnI3PmGNsmjg9edJ1fW62dlY+ipp
         vg9gdfL7AuDSruoThEbJErrL0wlnNI7CgmYk+qEb416iOQDTPAiOZV8apHBNUNi+TXIq
         7OgNr7arVvlt9v5uFr98g2VR0ylF1hH1YWvJDI3HYITuF1WFIaK/nDE1aREhpfw8ZX10
         YHhqCVxyrVjnSA99XMIM8mce/Ttcxu1BsFaDBSP2kK7iJf+Jx1mY5F0y3i0riw2EKR0x
         6WWRxKtgApbPbei/WJF4BAn9UjTzOb0QKysVIHpJWNWkg8V3CI6LWyHKDdYVYMdEkGHa
         WPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816572; x=1780421372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSth3bH8wQN7DeJyLy/4rKJnmvPjIvLAam/FmnUx4yQ=;
        b=KQ5gstW0P+euL7GjMfD/AMU/NGQcLOfCwVeG4eY4G2/BVsYETl6D84ki01U5kgpQuC
         5tL1peIwuR/CSwJzzjF/jybjqm/dl2pB2CrUNXpTAt1/TM1cP4dhvZVfSEjHLzsvaWkk
         OIEzjmOY/cPsl9RPmnU7Nwbwz8lT2YXvmf6qFE5bmmHVU0sYpoI7EL26fzzUHvEQFITq
         Sl3bxquG+XH0VYz4LucjfoUgTnYLdfgNJ3ixOyqq9xy++GVFYEEftcWwIGitb6URa98H
         PUXkYDE3yZ85sYd3XwLPyq5B32lhUbvcsVHcbA9cVBthDFOUDB1snKKMW5gLm8ZrcLSV
         QiMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BAFmvAHMdwUhJ48PeODxx6eaA7mCaKz+qzdjqaC9HJMQ57qYEfUdkS10WDkV6LlnDNq5m@lists.linux.dev
X-Gm-Message-State: AOJu0YzzL48cQiNiQssqjT9oo7CtCIaqykdvTT1s6ew2fMekpedmJAS8
	1FAxnZ8XG2bH1ROaIXOG/RX8ufLxKXk++uPouAMU7tLwQQRS+G9ADZh3EiCEH4ztz33iJQ==
X-Received: from dlbef14.prod.google.com ([2002:a05:7022:f4e:b0:135:cc8b:4336])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:511:b0:12d:ceaf:ffcc
 with SMTP id a92af1059eb24-1365f812d65mr6760491c88.5.1779816572178; Tue, 26
 May 2026 10:29:32 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:25 -0700
In-Reply-To: <20260526172926.2717929-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-3-xur@google.com>
Subject: [PATCH v10 2/3] kbuild: change --thin back to 'T' in $(AR)
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

The '-T' flag in $(AR) is no longer problematic since the minimum
requirement for LLVM has been updated to version 15. As of LLVM 14
and onward, the '-T' flag functions identically to the '--thin' flag.

Fixed the issue seen on IBM Power11 System:
  ar: unrecognized option '--thin'

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.vmlinux_a | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2..650d44330d1f 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
-	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.54.0.746.g67dd491aae-goog

