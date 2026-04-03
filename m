Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE593C7DF6
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228372; cv=none; b=prXwZ5/H0yTp/B1d1cbIH4s5NDC9PMINe0/DGKdkuyN0yhe42NOAyky/NocgQA2XjIry0KZE1xvUaRTAyXEL4lhyxiZdmFamH/c44AOBRo6Ir1FUh7EeVfkQwLI6LGw3L59CaDMPGz5EKh/x4GZvGip1TLZj0daTn9rnuyg2InM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228372; c=relaxed/simple;
	bh=E+XHZs2fGVQU4RACjdHGDrGQXdRXwI+e4g/Lo1v6q2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMpwhp+GLEmI352Hei6Z7a0swufOzCruJXTsG1dWz5bK62nlLSjpoCNhe0kMGCLOnJ32Z9Nt1c5A+yBDXO6rpDPaFuDkZ83xKyJ8weYzdQOZdEcltGjmKqit28oLO/vYHaq9IwfFfO0hGb0H0yN7AMGVWZ9VXmiw1nqnc2fKcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MQ4vEqU8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MQ4vEqU8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso21747445e9.3
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228370; x=1775833170; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsFRXjs2Dc1/g84L0Y+9YTTSj518lfxy7T1haEQdAvc=;
        b=MQ4vEqU8mTEx+rpz2s6GsKtqqzOcgnDQ0Uf8LxopegYQBvOCRan15EIbsAYYmHymnI
         HlAc/3jPg4UbVp1Z41EEO2bhVsdPlrFK2zLs9iTCpLMFQvaGcqejV1X6zIXCdrsSDY2S
         M72fkfCldfUwHNFkcmHnkMwC0QfsUaX/DWSNIh5V5T3Co0EIli2LybBqvNjmktlzZ9Js
         tMMFqTIJe5/OHmhafDuXWE+TxO2ORMwxIbTn65m9SWZNMF9n30WUQFVlWWA23huSJiyB
         UKCAppHKO8M8RELQD3HrHE966uOhFD5rFRDINIVLrEwcAytiP4xaKYBebjzH+Gt5uhHI
         z/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228370; x=1775833170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XsFRXjs2Dc1/g84L0Y+9YTTSj518lfxy7T1haEQdAvc=;
        b=C4d6QnkE3X14FwUNnv6kbwBG4CvKUpKLl7FVILMi9dWJJBiBgO2y30gxM2jju40XtZ
         uY7xYPO4Sf2uA7tyLx48jvQNO0lfVqVq/FJBtATguEcSYw4pnJJYe5cL0TqklgBL0JHe
         PE1EWlRa+63ofv0kn15MIztnZaFRtj71HSi0CiaYx/oVtfFxQ/5NYonNe0kGTJWpuIUF
         WDSg/aAbupnySPkq5AcnnF1WZhdNw0Oj5NtcKFt2MoOPJhxsGWUr/wVfCi4vTgkFyqOu
         9F4MMs6x2J4V+rltO1DY1z9ELcuYJWtmN2Br7Gpnnk71WynJmJGFJ5PspHQe9Xbpojs1
         axjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDhsAxUWLFRJilsGDb0ffMlmvN+Imhq4Ns4TslVZ8Rc4pQEGywLFj20aQYtYDNkIIopeLw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Y92W4MXG4L1L7wCSrn/JpQrGhf5MfoSwkWvZizfW7vaTbjU1
	alwbel4uKcEwITMRzYTH9UnMLAbN3/tvpaGALfCksYNWIKTX3rswbV+7N47Faf8AKdA=
X-Gm-Gg: ATEYQzxIghd8C6CO8K0aZwk6MaHfqFcjfsYQ/cyXSZS6ayVh5nGO/DjecbCNN9iYIYU
	tlPnK9hs2GkgvNfCS79DkhJirrtz1tQX26CR22pEudR4YYD369Ow1NUfD4I8a0G8yJq+Z3lSKQo
	Y3BBSu+ip0F+AbhFCa/o6SAQF2es0Izl5NP3OetEsxyAEG7Vot2CEGuJNCfCQVuF6aeAYpDC8/Y
	96dfLPJ57eE9rOpF6LQz+y9s2MSTgNMiqCryBGhPs1PR2FjMPTs9OP8yfXxyP+yAuHVEXL2gebJ
	6/aoRMiGqfJZ5r9W2Eh2heY9hd619gBiMEKUyGVpWAoiQERC+Rn9epBsJdPOIknM85EgJRME+CP
	ivrVATIPDK2Loan1JwDxxEKxY5vVj+N6CGfate0pyuaYg6iMGylRUR0jNpakUr8vkPHSjmnhLOL
	INPntR8DlF
X-Received: by 2002:a05:600c:8b75:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-4889978c516mr54726925e9.17.1775228369627;
        Fri, 03 Apr 2026 07:59:29 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb4fb62esm6284487241.0.2026.04.03.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:59 -0300
Subject: [PATCH v2 06/10] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-6-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1805;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=E+XHZs2fGVQU4RACjdHGDrGQXdRXwI+e4g/Lo1v6q2Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHlmfpqZa0e3FSsPSm/6s/yAsCmO92EAOj8x/YPOS9q2RTA523Bsm29p5YT3AhTzjKuDZLPYFlE
 MubEyNTxP7gU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6a3835a58f87..ca64a7678dfe 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -738,14 +738,14 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
-			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
+$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(TRUNNER_TEST_OBJS)
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^ $$(wildcard $(TRUNNER_TEST_OBJS))) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

