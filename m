Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98F361667
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473276; cv=none; b=pbWBTwcw6AXTc89ZD/UtM2GFDRFgEM24GiVzsFFKM2zSItKRfnc/Bi8gqCJuF57LI56Tz8wQGISdswZnc75ThDQP0QwgMejXXc7sDJmj6FWtha8ieZ4E6VtRJe9r12kBkioC4MFcqmjRchBDCZwkVc4wb5WON0Qtrz7jVqYNtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473276; c=relaxed/simple;
	bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV/uLbvGU8ea70TPUIDXFegobpj89C3rSkgA2e27RXkvQXe9nhXjN7SoQaTQBaEUx6r05CLKhb/QoZXZfQjJFX65RUccIiE65nZco08zPOa2/kcE8G5b9ck6Dy6mouN6uFRZFXDRswe3UZy0x26JtTKb7IW536oJTe+EOwlXjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cJsLXlN7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cJsLXlN7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b150559bso99221295e9.1
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473273; x=1778078073; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=cJsLXlN7CfVrCL+SshOV4ggEhu9omqk/pnUfk8VlgAtf8eyUuf6A9YfD02fMiHdIVR
         fphC0mb0szjxaVtqkJSfPw2Gk+Qp0BFWbLT6tW/55AGcXZVLfHUcCSu9jncEQCWcGcO+
         3J/9lsMJytklHSc9OZ0mphuqv0W/S4MjtylXAszaPP/d0NJxmBbOI8H8Xj0zTFk3ehBa
         dFv7D03vWTgnyt7qe0Ppc/Y9VQOV9V0JSbvUNpU39NLmfhfjf7Cu1U1btMxFqRxFtQ+U
         WxfyH5IwKbNnlRuM1brsSm7oy5sb+8dH9c2/aU5aJLlHb5/fPyStJ6GTOJc9zLJ2nqUY
         KYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473273; x=1778078073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=gym5gVA/tuukEYxlZvtHm3GJgK9mLu7hacYzhTJFmNugkfoMSmCQ4TgfnTg9VZU0qr
         OigMI7x+Si+ApRa6knxI6toCzMT3FQomB4oALKYmBFgrO9mHIZqyRZ5SF5w5Jv4+OlYB
         HUVfcMN9RHa+lJedyv3Yz3hUGcWjsEpAVFeh8PTnkdKjuSxZS9cvJ+gTJ+L3DhW6ADVZ
         pH52qQwNVE7tHRn22oYq2qFzJKiqCBv+B/Gwt8ZGCJMGGU5+aAaF837ZdbrilStOrDk0
         o3ojmKvXmA1RFCOQc0FA+YvCMboFADQhA0E9lATfqfH2dULKjHhleZ1B690lOpVDmScR
         4SSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cAzqQEqDmtXWDyiJic7i5DxeYgf/OVJCTnp8sH+OR9yhU8s8MGIRXK9lJj1w/5v+KTZuI@lists.linux.dev
X-Gm-Message-State: AOJu0YzIqqwgcMUlBeNyke+/PkFG764f0ws9lk+lokxQvDBiljtOY23D
	jfBlQeP6LTaXKvpVJwwaA4o8I+M17rPLwz1Cl4jFA31P0wNNb11V2axz2r5IwmlrlI0=
X-Gm-Gg: AeBDiesChUhsdsTEY1MkeBwTC3Q/U5A+luBflFPk8t81kjP+724hMIpiRc/wBCSyBrM
	ar3aafsm8oXuufbye3WZNWJwsjkd7G+K0AtDK2B0BZFWSjCmQbVtM6ysnWhgt8OoAb5z5v4PQn5
	VChs9hZdyoyo7Jou9UBXZXbzyctb/vJQRM8sYIZZaxU26nnNgibvTyDpeOpV/XtaHPKq6Sn1NFd
	GlFOSBARsC56UehYHX2vFL4Hd6zUOzTGizLW26ZH0i0217+AvI1IlCBtnbloaTMRJ9SNgV6sm2a
	6YTihwvnsA2v41Agk6V9S3Y0/aG9Up2o7t40OCm5/6aSHmFVlCsh2YfoyiCZMKaklJYW6Vb7jw/
	gKGZVBPL9EM69/kwtQ7HOBCRGRwjqn7InxAGqAJChI/xNruG19fVxMVU+4GayeOvSbcZp2+zCei
	idpwS8NG3jepr40zd4FWXtGEx7
X-Received: by 2002:a05:600c:3b0f:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48a77b0a507mr122496495e9.15.1777473273043;
        Wed, 29 Apr 2026 07:34:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d87e40sm1209329e0c.12.2026.04.29.07.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:50 -0300
Subject: [PATCH bpf-next v9 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-8-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIzdYHk5cwif+RQ3mArgKXEe1OmNUYvqf/YJSAHl/MfszMfMQiXYeQnyGabY4+HfuNyh6OOx+ma
 C3x0RZ2Z08wM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

In permissive mode, declare the test objects that already exist on disk
(via parse-time $(wildcard ...)) as normal prerequisites of the binary so
that modifications to a test source still trigger a relink, and keep the
full TRUNNER_TEST_OBJS list as order-only prerequisites so that initial
fresh builds still produce them and missing objects do not abort the link.
The recipe filter is split per mode: in permissive mode it combines a
recipe-time $(wildcard ...) (which catches objects freshly produced via
the order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but
drops the parse-time wildcard duplicates). This avoids passing the same
.test.o twice to the linker while still presenting test objects before
libbpf.a so that GNU ld, which scans static archives left-to-right, pulls
in archive members referenced exclusively by test objects (e.g.
ring_buffer__new from ringbuf.c). In default (strict) mode the recipe
remains the simple $(filter %.a %.o,$^) since TRUNNER_TEST_OBJS is part
of $^ exactly once.

Gate the partial-link behavior on $(if $(filter test_progs%,$1),...) so
it only applies to test_progs and its flavors. test_maps and similar
runners using strong cross-object references would link-fail with a
partial set and intentionally retain strict link semantics.

Note: adding a brand-new test_*.c file in permissive mode requires
removing the binary (or a clean rebuild) before the new test is linked
in, because the parse-time $(wildcard ...) is evaluated when the Makefile
is read and will not yet see the new .test.o. This is acceptable since
permissive mode targets tolerant CI builds rather than incremental
development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9becc077eb23..a64e822dc540 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -773,14 +773,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS)))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

