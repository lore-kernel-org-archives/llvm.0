Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9C40DFC6
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 18:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080836; cv=none; b=MoPHA952ZImY/o+5cFHNgtV5JDkfYOrlArB76EZTtZHgkPgnoh/0D3aoLlw7uXhEwNoaRUu1u81QPG4Db3Lg22FcUQfehe/Q9Z8qF0Kx2w0iJODzjWjcDI+qemmlzT+sA+XGjmpVdBNpxq+OrTpZab02tQb/Hdj4kdnDW7PwiH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080836; c=relaxed/simple;
	bh=s7bt/YWGN9UF4BwynJHskbfVkLN9m3OOGrUY7+PeC50=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UHq9MPuxx/DlyRvZDhwB5nm5UrSLxDmGuG/SIoOWqdi3u3P9prcl40zTyaLedZN7b2bS59pQCmldRKAsAROsot3BKfWj+q4t6SsvMg937ra12rngrk+casWg+NwpsB3HfRthrlu0L2Bi5NrmycXavfQa6o+4EGyRrSecJWnzjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8LVS/3r; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8LVS/3r"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304ec73b015so558310eec.1
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780080832; x=1780685632; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=s8LVS/3rsPezGjcOkfQkLQnp/6fiHpTaE7+1jKDhJlVH/H3auZe/gDgyqVfDM5jKB3
         OPptISctaap8FflE6uC3YPo+wP61qlW3GmocmRq+pcRXBo1rPUtCb/cmgOS3JN0XlWpn
         CHP3lDRS3u53fJ02TbzaxW7Ox2kXXjM6fuDd+rRBowF63SqZK99TtQedEGVh0e0CPrpf
         fTorKwDe2QX4FmCSkNz5AabidvVxOqpGPD2hGlDnS04/A4U8nNIzaLoZl8ZMiIDr36JO
         Ub3NeqxZDk+6CUllBKbcP6HGe+8KDSr4RXZyrH+mmN5sH+4FNRTrtfgQgjJavImM5eRS
         +LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080832; x=1780685632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=QRmZr17+j7KMTiCwRRkIh17PlKXh2GVZ0e8j20o3hguRBMrJZIOi9h7BdLDU6UT6cE
         WOFqfTk/U3LlIdLERIZ7u6suRt9rmVYjsRExYUsg8ZkLq64qdxFRcuOu9yr2egR3W0gk
         HHXF3By0xainaX7WzWfqTflU8IHYbLs7UlFVRsKLo9wYvfLY1DHxxxqdbcSSJqi+BYce
         FVb1PLjVboC6i80Pc8KAlEoFuV5ERKF7CCa3ta7AxoIZaTWVB6qe3n9hjty55bMs21es
         jzkXO7SnkAE1tC91PhL/ZhzEZez64HR4A7CBdlOOJcEjHZZxDI7pm8pAO0n3qOY0UrjA
         ozVA==
X-Forwarded-Encrypted: i=1; AFNElJ9mGOEu0Uj23M1WwDWeTdST1qAcpmmy+jNI/2nSfuGQnnZ9xwOn16HTXkNrTvIP0VgCuXpN@lists.linux.dev
X-Gm-Message-State: AOJu0YxutuLygvLJ5bSTgUVM2oLu7VTa+QrWLXS8NUdBA/1WDYiplzee
	XBvhKG6KDmOQZNdIQwsHE8MDAhyo3MW7t1G+hzKZu6B0BzKejCD2sM3wXnxm9ki/8O6RgQ==
X-Received: from dycme17.prod.google.com ([2002:a05:693c:2411:b0:303:9118:b1ef])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:214c:b0:2c5:ed1b:ca9
 with SMTP id 5a478bee46e88-304fa4a9576mr574362eec.1.1780080831505; Fri, 29
 May 2026 11:53:51 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:45 -0700
In-Reply-To: <20260529185347.2418373-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529185347.2418373-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529185347.2418373-3-xur@google.com>
Subject: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
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

