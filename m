Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5D47A76
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276515; cv=none; b=rwAxJxat4KqeE6pBVthnPlBtckFCyJe10ZI6NH+OKQDibSUrv8f6Ai37kUluetNfvgph4wJu7WPWJWcwiAi7lBqQntTzCchvDGLcsJEWTKVslUnmD2MZoEXxj2HGJQC3Idmu7WtPUMi7n4zPI5jb3B6OghPpLBXBJUZ1y6uWnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276515; c=relaxed/simple;
	bh=7J0jWEjwrexzo9oPbBgZ33ZQC1xyFpo8+XmzUWJ/VHg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uuNeQIWb6yKo9TfjmCviIvrhm50FZhkUv/IwXOX85RxVB/oValhTBY3Wqk7u+191ap5QhNskZcfTOvO+RgJvmN+VJloWZM0WVhda15r2gN6q30p6fOHCG1n/pdwCkhO1WUOuaHUvxsWv1GShM+ZNcr+4LgvD1iVhG+6J5AmfznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8DiPesj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8DiPesj"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42cb33e6299so45729765e9.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276512; x=1727881312; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvHrMBM7osvq1YNoyXkrrTpmrTIb8bNW96uzrIXNQu8=;
        b=V8DiPesjrAP5h8H6zLEJf2ZqF9Ir/VAbIHjh3s9HlRs/a+9BV7iY0OoTYRcH1edqsm
         Qz0skuAjemqBcP2qu4Csfq5CK4BasGLFa17eKAy2TxgSYhJ27g5J4zI+KgmM/GRRW2BC
         YUX7ki2cGZtEFGxrSGZhJrWCmq1B67BkCGIRfsP69Lum6+ReitHqhhIpEdCuy5L+aYU7
         G0+a1YjbqVG+90LSHsTzoy/wgvnNttyzi7dWSZfamnszD2CRcKz9Wq+PZKrHX6eC5IOS
         5yhYYSZ2xLodCejoEO9+lJUD7znUa6MKxEjlfb83rLH1lG/21phLx+vqWNY7TKteNXSQ
         dDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276512; x=1727881312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvHrMBM7osvq1YNoyXkrrTpmrTIb8bNW96uzrIXNQu8=;
        b=gJVLLjrN9tHwSt0xKg650mABqpSneTEDEOCzvQZHqzqKQOX21dYt554VKEodfgeqrP
         UFjhjJtilIf490YgDnkO96pDMQTGBEfmplG2W27vNi/B0TTQx6EsA0+ITj0LPJmaYNCH
         riO6jeRsfzT9l3QUICm7rrtw/yxRK9N/G4pCuHmWlCF+Qy5RGhVGxSTd78Zkh0MUHw35
         y55kQaRv4W0GOeGCSTeP6V3U7q80UwGSD+gsvAWJM2H2ybrGQzEDaksmBGeXuWK5CtpV
         wr29ilAx+m3UjxTqnkia0hAC0rrdmGiQpQIJW/sxU/yuKHOGgYJz9pc8Uvq3mVvjzkAB
         jvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXmATlZLyVOoLfWPudmWDehMp5PJBhxy2McH74dNcL3/P5yc20RKjeAx7+yKe9Qhd3pNt+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7WFVFHAjwm7U+0RME+S5aCJ7m4P3+zFwy6QLGCqYbnB0J2OgF
	jbc1Bcf35yOvOiI6EUonsSITWwn5jfCY8Hu2A/F1P1WY3TPzGyFf7YNfYK7G2z7NGTWpNA==
X-Google-Smtp-Source: AGHT+IGNEZwim//wtoUQ0IgEwXQAmuWMXuvjVNrkXztiUbXuSVle0sf2azOpfGly/wGUuNh4kSi9g764
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:4b23:b0:42c:b635:9ba7 with SMTP id
 5b1f17b1804b1-42e961449f9mr294105e9.3.1727276511763; Wed, 25 Sep 2024
 08:01:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:01 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=ardb@kernel.org;
 h=from:subject; bh=kkus52hb+9U3rGqLGvcTtWiqi7ULiH1wdI2hpFI7/9I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6loPG1eTz6/TRZ+ExF55v9yoPVaMz0DJP05TXvNix
 3yvWS87SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwER0vzAyLNdk+Hf0DcN93e0c
 kou2iV0ReKfEPrsn3ORh04fsoM3R+gz/0yZt5ne4cnJFldTMQpGfLor75ZYczDujFLCs+4iee6Q pMwA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-31-ardb+git@google.com>
Subject: [RFC PATCH 01/28] x86/pvh: Call C code via the kernel virtual mapping
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Calling C code via a different mapping than it was linked at is
problematic, because the compiler assumes that RIP-relative and absolute
symbol references are interchangeable. GCC in particular may use
RIP-relative per-CPU variable references even when not using -fpic.

So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
that those RIP-relative references produce the correct values. This
matches the pre-existing behavior for i386, which also invokes
xen_prepare_pvh() via the kernel virtual mapping before invoking
startup_32 with paging disabled again.

Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..a308b79a887c 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -101,7 +101,11 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	xor %edx, %edx
 	wrmsr
 
-	call xen_prepare_pvh
+	/* Call xen_prepare_pvh() via the kernel virtual mapping */
+	leaq xen_prepare_pvh(%rip), %rax
+	addq $__START_KERNEL_map, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	call *%rax
 
 	/* startup_64 expects boot_params in %rsi. */
 	mov $_pa(pvh_bootparams), %rsi
-- 
2.46.0.792.g87dc391469-goog

