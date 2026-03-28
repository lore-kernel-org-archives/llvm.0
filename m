Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1E327C18
	for <llvm@lists.linux.dev>; Sat, 28 Mar 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660780; cv=none; b=KB76fpXAqgRi1IZmF3zJbh2y316NrwqJ8YeGQ0zVGdeixFc7hbFzG+ZxdVJ9+5FfjPp5B2Alrr96pmyP2ezTyHd2aj0JZRHq4lm/siXrxFj5SNPqxTDfySuFAAhkstHdD/0EaWpdh0rB7vZpEONqNAvlSjOSXnVFnpt7OUpJH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660780; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c6r8xH+AllGMJHallX/CcSWZGJWGIsfjXaJLo3P+cfhtROlxti3blIlb5H3CZ9oZUl0al939Lj7ONYVRI0q4rzNzpKtQYASYdV8PevuikyPqfhC9iTtPldL3DZXmi+vpNJPNPC8HrqV6BWRNxEE/Tsnw+HtHxENeN+NdbPQo5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KTX0q5hq; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KTX0q5hq"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12721cd1a2aso3465613c88.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660774; x=1775265574; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=KTX0q5hqeNa7iQeimVa1S+Rf+MMNswVV9Tqxu7LigtFUYgKXwvxyQI2Mb6wzVBY/wN
         wRfU4G0utvlyqmgmPEIgLpQPx+qfOY9b7ueo3AxVHlqJNaHtCAN2mH8g903JZaiTivLR
         n/yxQhrx4SYedtTchYUlvCsxHpBZGR6MREe9k3eCkKsl9FNcj14YGbNboJ1iK6CA4RNP
         SVsJyr+XUprDPus/Aa05upWeJ9O/e81DQaBv49Rewp7oboqQjVbGfia6hQwpaRfUvFLW
         h/tFqBrRZ82fp7sWLMSbTksHPp9ev/v7u77aKInLkQIlaQPrjXks9patZAmRfNETt7pO
         +xOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660774; x=1775265574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=nRZW/ntDftTeG4KyjH8dSn77/x2ItGN3+QJDYx9iLgFsvJKNkbhHI0U/7ucZbbu8BF
         fNy9puhmpOCt22seyjs7vo3LvljxlQnR2YnYndGsPcaUsPp+tMRKXmp6ZagLdRNWZ9kL
         aYZoVDsDuLsSw++iJqoyu12it6htPlAfCUQrCSH7JavpmM1SOLSj/h7hP3h1sZ3OIyJs
         DZDhO5Co+uzhx5FntLyffUsE41afuMdTy7PkhqgVBLQ/NIyTxq6QkjkzkhBWyiH6n0rK
         h0wMXAe+LF5KJcj0ek5BakOIA8ovimDTGZY1bEjC+9odUQJ+EI8Jm4nyMyBwR3DY4x/T
         l4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/4XJnBC6EHTgcTX9AT8fFaNW/ikBtr7d8gXCyEfCGMlIJTlHWcyax6sUBmgCc4LBdV3ga@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4KhHroxJ+CFdX4HWSWIo6LuCFy/8dM7hhVwIZclhYS6PBcqgq
	rCH3oZ8WoiQJwrz4JXLdj2HizskcbIRACBrVEroj7JftBQZD2EeLjX20ANvCCg1fegMfwg==
X-Received: from dlec5-n2.prod.google.com ([2002:a05:701b:4285:20b0:12a:ba56:cfe4])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ec1:b0:128:d51a:5143
 with SMTP id a92af1059eb24-12ab28ef2bamr2473080c88.31.1774660773994; Fri, 27
 Mar 2026 18:19:33 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:26 +0000
In-Reply-To: <20260328011927.3569802-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-3-xur@google.com>
Subject: [PATCH v7 2/3] kbuild: change --thin back to 'T' in $(AR)
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

