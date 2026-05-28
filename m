Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6D33D4E2
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000751; cv=none; b=AhuPOiZb6B0irlBixXK8msj4EWUI1WOPzVBv1EB6QFXbjjp48PWJfgWpsI3QW0Ub5zskD+p2MxvHWDi70MlR79BPizhV9AIp1NmMIWku4CkqoeLguNDVZbiXTzqqI8NSbvBN2FdxBLPxARYNP2gos/PaXFl6/C5TyFoUE6JpXTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000751; c=relaxed/simple;
	bh=s7bt/YWGN9UF4BwynJHskbfVkLN9m3OOGrUY7+PeC50=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RSQQcPhqeqEOpeFuIz3xTTrDDic6NnTcB+TWVuSbGuIxRiaIL3a2kKTQcEjRaomDWrqOcSTxTsHkC4mhzsoSEhwtIU0t1E/P4BL49oi0RSwgGPCidyM/Ly/hT+ngzM50QGxB/XO2o1qHJdK66DBkxrZSFmeq5GBHfku7tB5+lHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wMI8VUWJ; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wMI8VUWJ"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304e7fc90b1so305684eec.1
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780000749; x=1780605549; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=wMI8VUWJiZrfzXyQgcvMHqhnXT+PaJpWCnyeZ2FjRJcNY6wJRz8Tgjm/TNKuHRbd6M
         p2Br1YBbOPZ9tnU+2uZxs3OkbSG/JOee4JVsoP1XXztAxXDEmdO3nQRTNdx2sorwR3Fl
         aIiDP9lQLDmvys9uHyZDOclF5T1jvYYIQGF44tfNOIn+gYi6QrjyQtN87Hmd5AGbWPZc
         RHsShxiIho+n6MogQvFnGmaJCozU0+xlZOiPN9ZO9JNArrIyyGxGbeggCafwdhI9Q5/j
         GjPJb6AFyR8lUcoFJnooe/jt61EoV91JgoatFnYHpgaSVuJD3vBsntU2J10tWnhtv60i
         MxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000750; x=1780605550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=ZA0elLviymJ1AYfKVxjYxo7cNKAF5hzMcfDWjZYtV4/UmAJNxgYHIDgHjJfIdEyahv
         Yv5bYa7FpP+cLTjX6yRbhGivNzgbsxEEE0WAH23j8DbkaEwgPBMIdpJIylT96tusI5G5
         Dty5Uzl4+FZ5Hn8/rvFPtINPonrhyQEC3zaJOhdace13xLADlmz/157o6HPoN0tY1JuI
         Mjp+XvPLvlTyQOd4ExAzyX20Tx0xU+Htal7uDjQlvyYPykiDG5iVroSgkKwaMkcXmkpF
         iBmJrjE3MITUDyHN2N8ghcREm3NT6foHgXuAO+E6G0+8TqZFhKKf2U7MGBkQkKRtHepo
         UToQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SWK+51PRI4XzhbmFQEf/OdxDgc96+hEy1QVCnQZ7G997VlqMYyd6p7JDc6Lp3TPdJAeLt@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5VqVlHqUpYdPn+seP21CmIRlUEAuHsGq8v6SSq6gQRKjxigQg
	I2wRtqZD3pdE4bWi5yvJ9BD/aJj1KoxVb1kk5QxFuixRN3DY7cdr/2A5RqGTxQT/LeZTwA==
X-Received: from dyrp25.prod.google.com ([2002:a05:693c:69d9:b0:304:ba41:e879])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7316:b0:2ce:25be:c8e8
 with SMTP id 5a478bee46e88-304eb17ed9emr25179eec.17.1780000749000; Thu, 28
 May 2026 13:39:09 -0700 (PDT)
Date: Thu, 28 May 2026 13:39:04 -0700
In-Reply-To: <20260528203905.687687-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260528203905.687687-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528203905.687687-3-xur@google.com>
Subject: [PATCH v11 2/3] kbuild: change --thin back to 'T' in $(AR)
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
2.54.0.823.g6e5bcc1fc9-goog

