Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016003939D5
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499759; cv=none; b=aXlpLkQH0s/CNvm6ENvvziBLw1/7yfWpfLqGM7vF8qMzfIpHVpibcCKtYWWtKu6IZMiA0AI0Vg6KjfdcTWmu5FIVBL0N74UU9Z71tzb7MP2EalJaY+XrBZ7+pW3QNEEIqKowah3503UojNVNY6Rjp68YRyyk9cXUDXS9L8MfSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499759; c=relaxed/simple;
	bh=AEn3z1mU2fpCck8UIIjXl5+FxsZFquBJDrd1WRW0HDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5XmsXU/oNg2Nx/5VLzNd160Ya/VjzPdPVHlml2uvSuDK1XIyKj/v+o5Fen1YMdgr5ZrW6VziUnKrZW8rCcZy6OS58CyS7EUqiyHoudEwGAS/dWhLveJI/hK9Fo1SEsIUkrOfbQ4XlKYk0QvgriSgboFW7UA0tBmMPxRNy7QRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KR6mLzBV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KR6mLzBV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so19726025e9.2
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499756; x=1776104556; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvAeDkBxqfN6WYXzL4jwsf1x31D4pD7nsRyWJL/PC4M=;
        b=KR6mLzBVIP1OLLnB3tBEE17SQ8PHh1VNgvndHsjdRgKeuuM+ThdV+Vq0WrygnxcoWT
         CqgnzZA9DScD1upjJs7sH6UX3ybVN6Exx7svPSqSXiePu+9R1/kYgClu+DsiWsLIHlwh
         hBBcHR0dMb5Cv8H24S8synW/+XlpDuVeyotxXTKKupuLzveDWe5VWTojjnRMa2eC+Vzy
         Ce26VuGkelGqmC1EL9ISgjRIpGLvEh0pAJSSZWtmdhpM1zUPJqe8aVJn3gncjRSEiSEe
         GP0EM3M4ZB5e4K+FrRg23BSBIkE+XMT0ynL3R3aIHwq/jek4a9+42rsFam+/+N7K45oD
         dHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499756; x=1776104556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvAeDkBxqfN6WYXzL4jwsf1x31D4pD7nsRyWJL/PC4M=;
        b=bGub5mOR01i2MiLNxrCc6MTtUgxAa9Xv66OEjW85bDQ05tmjGfcnpACsah5QQvTULY
         NRbPDYPgfbdfqTXTDjk4pn5dJqOV9p1oOJmhluTRx56oBgYQGG0M9symkhiGmrft012w
         CC/AK0xDhyLpFwTTgQGRDM6XSFeJoEC9CD09d5mau84ZPy8j7pH9BkA3zsNhmdcAtA5+
         sg6B345Nidx+qc20v+wl8DzyU/ZcN0jaN/VkrRdjGPY3ir5vZ3o4tnHu7JqBqYUbZFWc
         2YcXb1oZ2QWnjyWgA1BFDYK1LmKUVRURMi1jdTiIJzVu/ceKuSuUoZHqtngxnVNxgUFv
         wg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjx40X77C7oqH4lHcQvHA+jy/5s5B4NIRDjfN7uU3iWMVKqEMsCMP/tps0lLtUwQjWxB3x@lists.linux.dev
X-Gm-Message-State: AOJu0YwMmILefUfnKMXhNgVwt7B9EWQRsOD/gdDt4urxzsAyLxx/7phM
	cTWo9BnJLDKURv6yZYz92ZqJsawBlyn1eMNYkf0n9XFbnTlUnsaPk3VcS1qLQDxhtYA=
X-Gm-Gg: AeBDieuUgKOQoHZ4UVX4dJMCcpOAVvJA2q1aa6bWlbSGutUWgNc2bf37j3WTDuDRmCx
	du6oH6mVgsIOCL9Ra+C3VNObwVsZS1xsxVs7vhvtd8wHfA3NQUUUQY8eBcOqW8s+6BZ+qi6ugok
	hUYEJ+u6/ZUo/4J9ZqKnYV22pfN/01y5Yw00TaiW8GPY2GHZCQUAK5/iYOp+xdGWUkFF3zGTi3w
	3tAwHpEx/zct9Q5cp7kAHr++/sk97sMy+hSPlr+++V22PNV7s/Hj44WF0tPheI7KMdtdzq1ZNIB
	oA18HDK/U1mL7lo08sFURlmgD6GU73ZVCU8gX+XET2lpJMGb3dv6Shn+vTeXhWCDbWTNYSwbJEp
	JSKSoxBl8LU/Q13SV4M60Y6qZHjd0YYxs9Qq1Eg1I3CmjjmqFwD3KVyDop6hTnlcNjHCKV70RbS
	ugawkKB08o3iYZLvuoKSpEFec=
X-Received: by 2002:a05:600c:6305:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488997a4679mr190079425e9.21.1775499756358;
        Mon, 06 Apr 2026 11:22:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm17348275e0c.3.2026.04.06.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:17 -0300
Subject: [PATCH v4 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-5-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=2101;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=AEn3z1mU2fpCck8UIIjXl5+FxsZFquBJDrd1WRW0HDk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBGQdeW+jOhSS10zVM6eVqN9J9HSgNEoIUL7UQZAhjF5JdjlnXJ+GxuPnnJgJafk3RlAsBnZGvu
 ywAuIQ2YlbAs=
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
index 72f576a8236a..e67f9c4cb5d7 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -688,11 +688,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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

