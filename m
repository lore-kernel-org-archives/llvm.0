Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9103D412C
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367887; cv=none; b=fee9qhhxVYegwCGe8dRVQwBFH5YdNyNCcc0yC6u/sVrnpnM7XwszwdXC2B1naGJPXyz2WwtpyLci4CPFhVlsO5FEW7hXqK8DeKsXVNNDlQLqgKvExM4A+ut9SyfRlgYhY1EORGH+rnmPDo5zxo/rqxyhF3S4WRc/XiTAqithd4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367887; c=relaxed/simple;
	bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKDHCuwqDLh7d6sk2a2KG4oWwKXiJctoY9y2BywN3GOdAhYH11HdeCbdp8R+p0+gJmHF5DxD8Vf4fyk7jkC4Oe3gUGjeLksBxZNZudLL9zQpkJ9wMlj2mHTgA5dKJXOPTK4paOJPTquI6/LraX+7p6pnapx9yBHQrBALYYO55VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JKcJk6gR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JKcJk6gR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso81684985e9.1
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367881; x=1776972681; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=JKcJk6gRJRHA1UagflnI9Br+VFXslWka/UACxq+ZpxCHkcG0CjXew1YJgztlGn4QQa
         UPnMCNcZZ3402z3/ns71J6qLxAELX/AWOvg7hEYuNjpU8q6ZrZ4HQjM92ITlyASHkvbc
         /S+H2/ax13RmaWST0PgFcGUBLFYoAobXALZzmnrHQK4qw64G2ciETyWwHOIcLO4Pawth
         oKKal9qWdcBPxyf2yrtDbK6kb4oHnVrTk9FX/yWRHkZHOPp/QCC3KYW8zhki7LZT7zy6
         hP05VBp+TPEDVeky7vG/RYk1WpgWm/Du4ezPV+BvyiifmyspqgriTc7BtUzMRg46d4Cm
         q8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367881; x=1776972681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTWGN6AOI1k/C39wxoz1HQGoi2yZHDMyrh0AH1c9Jig=;
        b=sSl6H3+lzsd7HBsUQz+rzw81mjHV4h5KQyShR5jc9mkk42+W+SCRxFSIkoicAgyVOv
         m40JUKYzBOuAl94c46k/NuJclWdSl3iWw1avhnxGO1GcORXsxItKW8x0E+O+OjzxkGLn
         eupjBzw7UENTi/2Ff8gZIpGdVCfYOw5+zGs+Le+lL1hoXTd838EUpF/s85itlRZH/haN
         3dgx2seKf7nL/YvuHJSHThAMjXPJlDPihpg+of0ql6LL5kU6jpgXTsREuZ1c+hU9cEtZ
         XA94WP5DLfBzSIQWWb8iGs8mshYjtBx7qPDTAroQCyDTR/xKqBhCvUNIc8c9Xj4vwp0X
         VGKA==
X-Forwarded-Encrypted: i=1; AFNElJ/bTftNtfzPeCAccIHcl8fygsASxzjjVf9hUPDurobOAJRxAciib6xrbBCPZDxgegdzIW9V@lists.linux.dev
X-Gm-Message-State: AOJu0YxTanUIgbYS37n2y4n/4xk53vKbNosEu4s3rq/k3g0T7+z4voy2
	owlQ27Osh6PDxuN3SrntUPbxhVMHK+X+te4qob8EiVxBC67FjTL6zEUSfhpAZ2jU8tQ=
X-Gm-Gg: AeBDiev/tS/5Yhdxx2H4GmNvDwZQU6qh2+4vspDVtIaFRUHa7Jq9qN+OpStUmfqw/UE
	88Qn+vIwtEcWUwQXzfdjvu3hzS+9MECZLfPdNiQs9GfTt55cKxhDVjOc0FfzH5g8GHLoYl5elf3
	J5S/00dXdxuFdTH2ga+p4nE19abgilUnjxrj5BUQHAXh13Mu0lNOFDfvDGpvH0VSRr0G/tod47P
	ua8oyeeUC0OxaVVtcNOQ1PligwvEIRPEnX1op1aVxdG/iNfafaohDb8/oy/YlmDbtQRuPAv+J6t
	7MX2MfP8lvAWblKWaQSHxVFnlC0Awi9N5IQ72x7EQNcfhZmlZ/pG3elgsW6noG5bYpNPOXxxjdR
	uqXyGhBKnTFO9TT2EAUxkIN2i3WgO1bHy21Tw7XRHXDtS+ihMlngwReUo+4pyUl4qY/B9FE/EQv
	X2BuqW3RsRtikod9jiCT4XKYreipaf+OgZcg==
X-Received: by 2002:a05:600c:8b32:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488fb27fef4mr2800715e9.17.1776367880994;
        Thu, 16 Apr 2026 12:31:20 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8496sm7077970c88.10.2026.04.16.12.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:20 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:55 -0300
Subject: [PATCH bpf-next v7 06/11] selftests/bpf: Tolerate test file
 compilation failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-6-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2121;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=DXqH+tS5C79NJ+J0fc2RdGELwdh06ZOzO/YLsYIRLlg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIgMmMhaE8XS+X1UjOJf+TVsz24Bt0Sp7ClqyH5dO97kGSaeKzEEzZ3QFJbjD08OSD4LVRrGaJG
 0SzAB0kICWgc=
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

