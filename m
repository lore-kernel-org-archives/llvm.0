Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6F38D6B1
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286798; cv=none; b=W5g5r2yZjO5IsaXjg/K8Y7aTiD9FrqqNHNLvU1I5jRVD3XHME36+rMguEAf8/5tlOmPrjbdn+2WDauQlg5gQ37g3q8qXUDLQbfzExUmvhhU+11kpsO/z98QZ+b/Um/fsOwWyA2NC5uhKHJgqAZSZ2Lmve3Ei5HrAVNH8EKCGo6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286798; c=relaxed/simple;
	bh=sd6o23TXTQBmDe9CNsrT1vAQRg7+CRHUQ5cNo1CDVZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzWAmA5UqUnnMnXZ4nW8UPYsnwB9gzc00oELbIgoxEv9TlBgvyqtaw8/gqYYqh0H/xYJlKCNArfDiXPeeQy/0dM8cFVWKxP68SOlMFyQ027YxyC16wQoKaBR/1W1hahY+UcKyltXL39fWuwAFEQ0UtRNwZGniOWxWH2gUSJ6fGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LsdY+9I5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LsdY+9I5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so50514495e9.1
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 13:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286796; x=1776891596; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+LZLrUSOhq9xIydX+pHIEZAmNfKMNGZSAqdkfa11Ks=;
        b=LsdY+9I5R3Upa5VpmKDZZZvtOggxIQ3siSj0cLxleOa/MrxUWge2daq/n8G66Svy9A
         y0vM9cB0PLFR5oQ28vYjxjojgkkD+vGIiqscucjGa+tQGWoj6FFAQTjfkEQJaXWUyKka
         76U+IU1iQuNb4GPfu5ZdL7WfHzVD14cMUr+miT/Myg2Hai7FeiauhIpvY3UOrQZPyx6+
         Bx3ERYTtfwkStd3neSNOKHCGUmmjU4V10Vn8/8boO5owBj1O6X0HVDPMxUS6wdXdJIi/
         ZUS2EzPTZbjdH+lS4tWD3VSva+XYclTj6XQj/FLeOm7e+8VNBs5Vaxf2ngZkwQAwcbU3
         YzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286796; x=1776891596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+LZLrUSOhq9xIydX+pHIEZAmNfKMNGZSAqdkfa11Ks=;
        b=kGMGuJ5L1DYJhqKUILEUwktR3lRM8NAgSM6oPTUEt4xtKeCcMmwsYMpCUcKMzeMYLN
         PlhvGIznpWK4+3i/Wpp6lf61JNJZV0/3xcn40yzB3of+ZoQuEG0kxeYOJK4bu1Skqdci
         ktDOteD3l5G64NHmX56azw/zWl0/EslHjKEjFsKn/qd6HRVLOyBFT2ykfjLn7RssXrZK
         2IC2nFaFoY/3ArhexF3a/g+d9fWY9r2jgJtqExiWlAG04TytUrbDT2A6eQD4NjJadE3H
         SCdimg9wzS6q0D2utKKuCpv7QFrShZ8YQWVhkDofcUwLp5/SQ38A4HraX6Lw125Yc/MN
         Eh7g==
X-Forwarded-Encrypted: i=1; AFNElJ/Q90XWzAi95jg/sa2XqwnbCo2va+PPJ44IEJ5+Y+o3H6d9YR0eJOTw7+cJiYI5NjQDmVSf@lists.linux.dev
X-Gm-Message-State: AOJu0YyyWi3SDosEJKGh/iz6nQZHER4KyiiPKA1BkdR5LDMbakq20UTv
	YUGHQjkBjGmNtPKuG26N4gU1dRXDoa7eFW+Eb7BK76uQ4kYgYQbFCR5Z02RVx2PsObE=
X-Gm-Gg: AeBDiet01vvBO6ZxqAfwa5w/BlusQZmVIFLW5pjCfzzXsBLDMbLC8RHBGdHioWjI4HU
	6HbkI0RKEVn89nCekCPpIbRXml5bbjY8bFdMQfw9T4stQ7DO3L/xyPpPhBiGpsjYNvDxbFDhGXV
	46pD8oFuGlK1baz1trlx29tfHiWzBskmmqnogw+A4GqmcBvYkYgzHCMgt8nyjNhXHrr4eGx0qeu
	km7+rljOSMCJwRhvlQKRKV9pARqK6Kd1RsR593JnoXAfJWkrmcNwQFVOq3AftNOk4u2mcrRkBM+
	vgjOBa8LKuDE/G5amFq/GCL8eVuWoxngx6eoiu5JyF9sTvvSrTqNZGDvk81vMow4VZaWSEfsRkf
	Oj2BziA8d53u/iZUrOtllid1qPT1lO9tUNZos4788OhR/mqfaObJygjFDUySY1+23Fz02n48c2x
	NI0ByYUOzcb/mJwucSOVmUXw==
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr298755645e9.21.1776286795661;
        Wed, 15 Apr 2026 13:59:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f65f9bcsm5108876eec.22.2026.04.15.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:25 -0300
Subject: [PATCH bpf-next v5 07/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-7-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2150;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=sd6o23TXTQBmDe9CNsrT1vAQRg7+CRHUQ5cNo1CDVZ8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKF6hcje9wxrjG1OyZ3oiDzcAPEvRA/9gmflkFbNKl71F/Dnahqeq7yL0Mv6YwaWV6nV/2kL6t7
 4cQZwZlwgbQM=
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

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index ee7bbfcd661b..128ea61fd986 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -754,14 +754,14 @@ endif
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
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

