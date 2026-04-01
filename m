Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A220477984
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060161; cv=none; b=tXQECaO6SwmeWf1bd5r4S4yKECJlA4MmNWKl1aP2202FV1kjkP9TkE/wVkFcFRhUs68pPYt1/xwwBJOzdfTw4soU+cSLEs6F7gva5C5EA0D0wj9TN/kILDr6RbB6EdebIopt0FaBOksJJ0hlEMfQTxTDTxRPQ6t0PHQdSZeivG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060161; c=relaxed/simple;
	bh=nKWUAS1x9dQP6xP+ZsIvQUaxyr6H2YAkABQODu7Fen0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKVYLdz3KrIM4CxXIx9llRNbdGtUAUQSzNsRfXL2rawGx+Ct0URbWzmIdWPSQeiE1i6LJ6Ns1rbdGUZQITUDXluTiHLU3dZZd+EJgpcaz47BBgUqFiWXJGmM+avcWOeDgLglBpBpr+INoy/9oDlrTIC+QZB6u/p28af9sCThoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KR9O0f/r; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KR9O0f/r"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff201041so70250445e9.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060157; x=1775664957; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86AThs0RBETCI/C2kzJRThc82KiZw7KQ/KbK0v91i7s=;
        b=KR9O0f/rZFGq36D5TcGDZ53fs3VtjhPDG8aPipNcBo3OaxY0Lg9Dlk38PWb0LvFlrA
         BEGzQogV5UfWRXoRm3FplQFLCYoaT43gFGy0snH5W9u11toApKTSROGEfrejXrksl5BB
         WsvBWLnphYmG/sxkLIwdaOVLmgy/GCcn519QsGi29ixT1NRFe67vv1vIgcNRhKuLhXeV
         CpJKjx5aJS6l1YZXnMTmB8zNH71YdeTnZF2JQbzix3Mdx9zLrBSmysK/N0aKWCC94ISS
         6ZNPlBsZArKmQL6sEboJBjKt74o1H6yNd9gBwZrwJOMFCetQKm4kEGH7SLYWzep+5rVy
         QHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060157; x=1775664957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86AThs0RBETCI/C2kzJRThc82KiZw7KQ/KbK0v91i7s=;
        b=DzIaS0qfg+mIOoYJj3597lLqHBHeNunWm9T2VuuKPWG5kfE8cJiAcYX71czFQS02/R
         lWt0aOO6tQoMSVHV+QXHaJmGnXYFBlrTQZ79atrJEg5l/W98KjCySU2I5hNx8UvmURwk
         7NBq0yKtJ5CuGEw2uja2rRcgMXm7Uomw1jmO6QzDMS9CQpvgRTmttlRRkTP1G0PNaY9B
         OqqHsAFqjIpfMCoee/62AG9NoycWuQJtx6zZ7M2cOOBsZ9PCL7+rXZSSn88RnJfFHrkU
         pvlRTFBgPTrFLeRSXgrnmhX3JQ7MRnXAzbhk/dEZFb5J370xOVLEmMRenqxQpNHXXCVZ
         eVig==
X-Forwarded-Encrypted: i=1; AJvYcCWl4vwkK9LMFZrCpvbDP/sxvDWDbXRs/pw+knoxzjsCcyE5+gCxFoLG1HYhEfH9VSJ3P6mk@lists.linux.dev
X-Gm-Message-State: AOJu0YwLzqhJG8klKF+XdbtF//75KxQIftHZQwtjd2S/f+Y25zjqxx2z
	IVlKWzl4WvNeXi9Z04xmtDz33IZHK0JyHep5tb8adr2EubkTqGpYg6YX0nOJMEpyt78=
X-Gm-Gg: ATEYQzzwyar9ZZ2ewbzAsKWbpQbTJr630JOq6KmRv4KjvUVaHnb1JYypDtvRg5bEsMd
	myPdjyvS1TJkrdR5I/GtqmTWrqa9JKg5iwRlqUCa40j4DkuQQX7GvZ6RDXtcR+Wxh1+fOOsipmX
	SY1JfrQQpummpsELlLSL4nWuOWCwikTR9+UxO11kft9cug0l+02hTea8mDeosM8SJzFkEf2dSL4
	ZHCTGeXJ4y3kxi5iBTxHptVLgK5/KAQ7CFdK3D4dv3R6IM5UTfPuTr41ctQAia11MGvkTtk30Vm
	ljPa3Ddw3ZMOLR23E+ap6jIAb6KU1D+WHH1YURDQwYr1l8KMdo47o6K9C/JynhPH3HALTHRQnit
	uxaJ3LHV8W6SvAvlpGV5kmLBPKt7BkXHI+Lu+NQ99fqgITU4P7SbskLopGpbMw8vvIh8PjzGEdF
	Mddu4W5MzwnshhfEoS+t4=
X-Received: by 2002:a05:600c:818f:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-48883596fa0mr72497305e9.31.1775060156827;
        Wed, 01 Apr 2026 09:15:56 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac4aa9sm438728241.12.2026.04.01.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:55 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:13 -0300
Subject: [PATCH 06/10] selftests/bpf: Allow test_progs to link with a
 partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-6-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1805;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=nKWUAS1x9dQP6xP+ZsIvQUaxyr6H2YAkABQODu7Fen0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMkvYrI+uScD1xtnMfLEIEvmAO3zcn5+JIYxMY1NIomVVLoJVfBoKb5D9aMTaWPOF9WOiycQi1l
 blzKKjFjITgc=
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
index 37a454e4cc3e..7f4825dfa5ce 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -736,14 +736,14 @@ endif
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

