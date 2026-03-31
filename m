Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A64219ED
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972119; cv=none; b=dXJZS+dqFeY3glbbpW9P45YGuH2H/YYUubRQjcPerXFdcutSKUW+Bh5W2vJY5B1urBiFtv+8d+6k7Vj2CXMVaKiZWsLr4XWnwrWBGjrhT9LKs1Nvf3PeqzcGCT12GxZyLTyZ6ACXXOmyVQ6NHK5WMXiDaLVyN5BdF7R9oWWqWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972119; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KG5aoIOIU9laJleVst8DQZvk2RBky3qVublFZ5l7HTZTn6F8T6ZhBg5ESw+B9Ys/XAP5GwbDS6XILfM2nJV9ljRWeWEhbWSOLGlog45oParZ7IyjEbD28inCefzDcRpZ095hpod4pojyR2yb90d4kUzgXjre7ZaDwlT1boCd+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+/SBsd/; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+/SBsd/"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1275c6fc58aso7829196c88.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774972114; x=1775576914; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=A+/SBsd//phOAuP5zVmeL77HBYvi6ZGFj6pjw58UYr54Fyvh4LCqRWqMjNAtaZYkqg
         PUzWyxd43NkGUDC49M1/pHFU9DC0an7huATTO21pN9b7BRmqWCl+Td4QVnjHAHHP/K7F
         Km5qy22RTCMBlYjxjte5D4eEVUURAr9KZJ60GPOs1nYz3yG7CCtinlppwCmO0V5ADvoE
         9ZCngL2ktOEi0QG09yinEc0o0HKZLeQ4BYQq0ugaOTzxxus1ges+AkUyyrSkbmd+6+/W
         FHFI0Z2im6EFLifuugUDBe1+ARupVR8khhPgLmUQWRdYnHG8+J0yGR+RsrYZCgY+MJaI
         wqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972114; x=1775576914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=iMhqCDtDtzYr/CcMpXmYU3BnK/ISTYfECJuKxBYp2bVUtvHnVwMi8DMPKDLD5jGWLp
         BeHssyKsFIPHbXuZKkHAGAFm0ZHkS9L0bB+v4hNBebbco8YtF+AqO58Hf888Ic8eOy0/
         ksHCzTyNJa49GunTQ40V1TfkR0nddcfcvI8qGdICb61BcljVVSz2ru0UwuDUa0r2V8fH
         cCII3Cl4htFNH2JQ7OZMTkqoj01lqGyxir/jpPnbBNSG2s0N9QvGc55h9pl8i+KQUQi9
         emvVhpdN878sl1g7BUHXMJ2sv3RuUvK8g5/UXx9j+oymIIM1nI2/nBC6hFs/Yx4he5tH
         VZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE7uXSjH3xBNlvr8RSFYWlCIoY7lwofCnT3x/GD59m0bFpGpVxX27F1hhCU3UDVhn6maT6@lists.linux.dev
X-Gm-Message-State: AOJu0YzHVGBlhe/QsfoQ5wX6WQzn/z9Hxqn/N4gZnNMUNq8spElYXhVy
	yvg0oNgIgG65UXmYRUnrm3J3GbblqwVcMuCCVrwJxVByROWAXy2vmw9y66V49bGHBJGGsw==
X-Received: from dlbdz8.prod.google.com ([2002:a05:7022:ec8:b0:128:bbbe:13df])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e01:b0:12a:6a64:81f1
 with SMTP id a92af1059eb24-12be63db71cmr11894c88.5.1774972114169; Tue, 31 Mar
 2026 08:48:34 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:48:26 +0000
In-Reply-To: <20260331154827.2793269-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331154827.2793269-3-xur@google.com>
Subject: [PATCH v9 2/3] kbuild: change --thin back to 'T' in $(AR)
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
2.53.0.1018.g2bb0e51243-goog

