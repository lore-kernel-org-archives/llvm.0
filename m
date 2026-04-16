Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695EC3B9604
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342119; cv=none; b=m0eixHDT+w+un/y04P/fD2p5R8eIIsea0IwI5lqzO15mxA3RjXZY618aXg9yJUHg/txwY+nIJubQidZUJFpgxRrUvUBk+lPXxAnRjIYW6rGWGqZ22ccxw5lWoP5X0XLSQuttAjzFqcR/UgiikTrfpCpgv5R0w6dN+DASQM7/pog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342119; c=relaxed/simple;
	bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ged6uJYZpZjVbcS1o+QHTKAPXsDo76n3TmmuN9KpIQAGjGj/SOl1ixDDny7sjI6B70ysD5XYlLOmbq2KuMFl1iDMAHPh260Eu1lG9nUlEauTsKih+IW/lFIfNT9wZLn7/rFtRVPkmVu/IzZ9riOMRppNlfk29bKUSF8/lqz/b5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=efOudavB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="efOudavB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488d2079582so74013115e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342116; x=1776946916; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=efOudavBYceq3s1pAeofP9/uIhc3AkNBqUIQeTAU+1T50UYa8tTMgT36Mo2Y0XLa/q
         wHgS1LXTjs8afsLXRUuShVSk2UtcTxO9a1HqnpnBrOhBgdYHftXxdEBC1KoFkE9y7zg2
         DT1mxdqoq0CU3OC+LnARFGJbhCjgOXcYDjL6hfWhLRLyCfu1CuwKdojfJaP9IDUoFlX3
         6/VCvt4LQHj05y04fKdrQmXs7ycH+lxD/drO1+gFZOwV2ceFA1vZCTjIje+viQqKgvVG
         EmaO/MOCIFthudnKbV5EXZa6mn4NRQmowsm6bPAltzxScyDy7D5TYy3A+6K7arcp8EEy
         wbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342116; x=1776946916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=D1702YrmFhXQR0YUh5EIOX52i8rAWKPpSlCAhOSdYRYMfk5BBx+9jWug61Pf0iLylw
         zU8FmlAdAASO7lGuGCy+zXGBiXD/MnrWKvcEZv/MJyzUp0lW2huLdeO0wsFOS+oZ3gGk
         48mD4o9TcB5UIPxLeqh0iajvRyiO07sDlxgFICQXyFTatz6KITTlPR0mRulzPeN6zAWE
         udwA7M/UAyvXIMuX1XLCmfwOv4sMPjIyuR2Nb6Ivq6bmpUEBhWkbU21huqbnG8z7R8+Y
         ZHE06H6WCBajgruCCVYUNpXN81C5Xvn4xCeZslKYGlsEY/Rp++abB1HzQgFs8zyfkJMN
         iKFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tfQWEpo4VyMJbk5zltik8HR0UJaHpkX9+AvFqqFygIY+sDLVoR8g0BjG2Pd3gBjsaof/a@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7yYqY+piH+rtdwJfAGzP9nxF42EMvEXnOee3hyrw+CzhdLD6d
	UmPJjUZM0eM3xG/doME8EAMK7O7I+fZ+ugOip0/C7Yy+BuqxBciBO1FhuGOexFnq4Ko=
X-Gm-Gg: AeBDievSBTHE+vFYoySlXKbr6TDE2LYfoni9jJUfjlZ6hmzkHx4rRM9IgrmIs7cFUmt
	nbAJtwo+Yr/XKBhEu/MnQ7GqANPDUqYNsxBMH5SWU2HsrfEZlKIbxWPe2WQdnIZrTO7YcBo57cn
	N4wxtC5GHJwQOTULcx9wI/hXzQbTAX/OAstGbB0WQ75E8ekUjKQ8GgZOUqjqcxI9BjQ+2NqaS/j
	rAzYkNSnMgZz2ho87KUOObQF7URp0MiiSMO14jDo9Jcex5qpTdvNsZO0tJhxBSPOwdiwN0PUYVk
	4GSfczauhAPCsLSh/M57VRoCDdLOpz6Yf81kaQGQZD/7tXie4J07xmS1QicZ0CkBUmRBX3EO7EL
	Pk5QTrX0oDXmrR9nwWSoGEOw02B9mBAUiwG4Ry3qYGwnctRQgstD1DuqF2FJM01lm0qBhqw0zFU
	bkiFLwYlO/K1w=
X-Received: by 2002:a05:600c:c117:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-488d67e370bmr245841095e9.9.1776342115876;
        Thu, 16 Apr 2026 05:21:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606925sm8842298eec.12.2026.04.16.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:23 -0300
Subject: [PATCH bpf-next v6 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-6-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2121;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKigpFwzlStOY1ycEC12VqPdpBtK91EhWN628NnwRCrzsbHJFzsb4ToJ8GTSTzn3m4fy2E8uX19
 iGwcjaAK0uA0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent. The
linker step will later ignore absent objects, allowing the remaining tests
to build and run.

Use plain printf and $(Q) instead of $(call msg,...) in the BTFIDS block:
the msg macro expands to @printf which is a make-recipe construct and is
invalid as a shell command inside an if-then-fi body; $(Q) restores echo
suppression at the recipe level where it is meaningful.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index b3eaa4a93707..5ad50d3ff2f8 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -708,11 +708,14 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) $(if $(PERMISSIVE),|| \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2))
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

