Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB306388E52
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491917; cv=none; b=C1kb4DjoChGBGRBmKOoTB/uTsE2pEEY1h08sQHcs7ND8NGAl9evRsZTnggwJA6+6gKN5JESRSZ/dSemoDJsH4I0V4iGs27bz7Pru38G7c9Bm/I5pEwt76SgPq+63b7YvKKPXc82UsAFwg6fDO9CywyWjHpzz2m1XHoHxZXFlS/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491917; c=relaxed/simple;
	bh=/h+s7+bE5ZJXA3QpL/3ITmBG4H2GDTMc7y6eKrVeE/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNMl5C/WGuOvXGtPP/skmhWvcm+4lg9I03alV3QBwUl3CB7brqPTWuNU9Hc6iSKRZpYjarZmlY9vpMpyRS9XXQO8Y6IRpOeoMS75b6i82dMpKW1OwsbmvmxaZEkHPHErbCJGtgPbZ3iMRIg/sJOURaTfupEOsFkrdcq1WVZqzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZThNNcNf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZThNNcNf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso11406895e9.3
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491912; x=1776096712; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckauTTLJIyO099lw+jHxSzjQ/8v0Ic+OtpUGoPBjYBQ=;
        b=ZThNNcNf2AxzlTOklDyMyMj9E193LQS23D8v1/++iJghna2PnKPGxbktvn2TUPpMqb
         hVRL19j2Do9klMhZWN3affMGS8wl5s0kMjVxJ4NMzS5u76aCjNstmUZ449Tvurbm1AYI
         aoVubVuPS2VyeyfOcTudVIITMx1VZSve4n39Trha0EPfLIF+0y9IYC8b0AGa9GlZoCdT
         KMhjNSB/frum0NzdbHyeuzCjiKII63XvJQS2AvjcOeMxet/aKfzyqkzm8qnVnlOj+RBd
         uumxFiLE81Vu8X+eWUWqGqw1H+cMVuOBZ9Gi98GvMX9jijn9qYvpECGUFGa8R6in4QpX
         7Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491912; x=1776096712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ckauTTLJIyO099lw+jHxSzjQ/8v0Ic+OtpUGoPBjYBQ=;
        b=cBiso/B6VB5hFl+ea3kfGv/nnlerdCQDBCn0X3YpvV6S/Aw5jdnpW3QOIozeFhBChK
         7J6+0y+0g6YRyXkiF4lOeAgeexwTP4UeuvwCdy5CZ4WINV4XLd8EPIHAV3lZsY5HwPnU
         Wpjtrn5nmqs7aBYrAvQsOcqz3tEzOgtlFyxjA7j0EI9oE/3pSXmvnP5SfFAvBqihyvGf
         yV5FkxlEKwZmF+/Kr69PxDJpnYUom8CZP5NmDBvQqiDF9sETbXHoay1ocTp6Os1ckaQv
         RLJNONrgFVDv/2/lBR2vrG9Dn6+Wcj4O2dxajEEMp2Eg+qTcJaRIU4kQzvrJ4N9NqnNw
         22aw==
X-Forwarded-Encrypted: i=1; AJvYcCXYHrZgA1JKiV6kzeKHsq5v1GSycCyf15PW0IrwcA0dVe+XIY15s67sO40r+0BVYZnYW4Fb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+c616lstuI29gzfBP/mNt59wlCv6VbhyPejIj3qv3pQ9Qgup8
	YyOf3uUKIVH67/D7KdLq3My0qapkeFSykNAOZLggb4gwWz0kOZzVhDjITE2Ps565EHM=
X-Gm-Gg: AeBDiesmoAf7UTexbwQaRlDONUUpJh8XIQk6T8TI7EBzlhtIXUxu7tesSItlfxv5KE6
	x5AGEKvrKStcn31bS1rzd5caK6BZhbeYQ3dWlLVhDg7Ir3LCzxCxh/nTdbYEb8RhwI82Js3Q4lC
	CMdIKippD97HpheXGG9nI2ppzDdjDEuRZQNkB38/68FN6DVmVc8tHVh9gvql8U/U4Os7wGeor6f
	twOr2+57mAd7/MMW3jmvF3DpoNQOW44+oAsR42lzPNS7vgx1F1hVpLTFffpSY0yTEN9eZmGnj30
	53rjU3tUxU4SU0NFj5x0eUQHScp1KfBzdhPRAs/9WfzIPcf/pBnEl5FgeqQfSndyBvQe6Nyf8is
	meC42zSpKFPZ+w/5E8GNijdVhmLgYMfR+PA++SUYO8W/rI4L+c3fQA0HH9so0pChu+VA7zigk/z
	aF3i9oWLQ8VWRcMS0/AJ++4+c=
X-Received: by 2002:a05:600c:4652:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-4889ed3266bmr92859425e9.10.1775491912203;
        Mon, 06 Apr 2026 09:11:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbb1a0d7sm13429067241.13.2026.04.06.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:28 -0300
Subject: [PATCH v3 06/11] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-6-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2101;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/h+s7+bE5ZJXA3QpL/3ITmBG4H2GDTMc7y6eKrVeE/s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCuPGOX/lbVrPTXQKqld5XrQJRD0QeJbC/Qyn3vUJZ2POvIip14fjL0yU+C37pESD8YRqXKpTu5
 Aa02yreGY1QY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent.
The linker step will later ignore absent objects, allowing the remaining
tests to build and run.

Use plain printf and $(Q) instead of $(call msg,...) in the BTFIDS block:
the msg macro expands to @printf which is a make-recipe construct and is
invalid as a shell command inside an if-then-fi body; $(Q) restores
echo suppression at the recipe level where it is meaningful.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f4d6c5ed7b3a..e8e92ba9d5b4 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -684,11 +684,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) || \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
-		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
+		$(Q)if [ -f $$@ ]; then						\
+		printf '  %-8s%s %s\n' "BTFIDS" " [$(TRUNNER_BINARY)]" "$$(notdir $$@)"; \
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.53.0

