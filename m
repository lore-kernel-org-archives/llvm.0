Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED33B9DBF
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342127; cv=none; b=Akxorx444ISaZjNbrbYMUEFCicom9EMz28UjGGv+iS0Q+ebngddcheBYDHBQB2EDuRWIEoEz2ivFgIf3UP3+nR1dPZASTj/cpcc6RS+KIFGfWLRvwqDPRIG5kveHo5x+ttXD6Nms/in2ImTd/OT4J+bCRsvsl+e0RT/BcNYTHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342127; c=relaxed/simple;
	bh=+YBja3AAyMuyPOK7hY8a4GWFTYXYPSBMUIrp92cTH/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/C4xl7086dQ8F2FE7DMIy98OdDnOsI+FP8SyJsm7/K7VifY8EUEG53KGiUNLfh8pR4WLmS1xTCwUnyL7QcB4S7xvC5i7P78ctQSOXLOteCxNmw8022CTr+rB+e7U1brV3npCEcfzR0ZB4EdpMaUJ5oeYpEecNMCAlIVzt9FpYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nd4RlNbU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nd4RlNbU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d43e09de5so4761693f8f.1
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342124; x=1776946924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvrCOjn7+Dc7pEGNMqsF8NC6gFHe3KAEuMAKz+F5t7U=;
        b=Nd4RlNbUFztOtOQF9kU3XZrzTFNEyJKZQKQlXC2gP8tSCuoDyQy4SqhR8mit0xBGv1
         VR/fAyTnl8WoYL+w5LBHTsKXEvcZPHWaatY5EsyG+zeJNzVW1cQxQA+pqEWx/Yovj1um
         ailUhC9vGP4IVAqpEkwfVikayoWQYeiMr/Jet3mL5aHzLLfyhFhVMpRW9MbgrKcI2ipR
         9p+7Hq8DCtkpHaaZlUr20oYy8HKqriSOAuLkGZiG1YxGopAqm54AxZzZexhvBiZxpPG4
         yedBIpdQR+PcJPbKUg44z5Tj9jsM2CLlyihDc0VtASHPYEi5OxQQZqRtSuXZ0CEyC3gP
         95mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342124; x=1776946924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvrCOjn7+Dc7pEGNMqsF8NC6gFHe3KAEuMAKz+F5t7U=;
        b=LsQzNl6tm7ohx6w0W4EvU/BYR/S4bVD8HQS/BU4qmaVdwzWfVj8Hqr1/fdNMilwaaQ
         YDMjEgX/TZnzKuugpKWPHln7EY9jAD8G4vpvoCJIIn0XwxnAeU2mJw+E1ajtnTxsYLyD
         UCD4HsecsWHOHGDh92s3QA4qMgZET238zU30IHeWf5I1kmlyR27R5oyfJpuThS/WUCSu
         cQ9VqvuiVlp1ZuHpgmbHzPsRnPGtnWpRnXAG6U++WuTu7cF6lXjDzgyyRzYnFvql2gQW
         2pXgQItZzJ3gk5i7qq7eMvInbd78ZF5vlEw4xdwVlEK3z80g2gqd1xD+NfgxG5u7TMEf
         bqAA==
X-Forwarded-Encrypted: i=1; AFNElJ9RYLVjz7FGrnppn/xmz4u8uc+RvLNWGQiIIdS2f2RcqhtpxqGxDnuZsZ1BOSY7MaxDabou@lists.linux.dev
X-Gm-Message-State: AOJu0YwYS9knLnGh8lMwFW1HcaLFK/nMkayU5TcrmKODTopHZb8rEfnN
	sOQC2k4w3JBulE5TxZhK606q6sZQnidhzgJ6/EtlcmtdqX2DRVxRmFrQOjaSleY3fUM=
X-Gm-Gg: AeBDiespl5CWHoyLltmMAs0Rh8kDwDxNd0gyrpMMKZD9vmspEPevfqO8WHvZV0dCJpV
	jLidTKEIbw6EZDKI+6MJgDmSQS8kvGb3kkXJUP6juFfyJQSxye11jpDsKbCSd5boKW43/v0cd0r
	SgxPIPbYsrxXRJ0bTVqVLXe4A8AHfe6dr8yooyh8/DELW2PxRpQtEZCx3WG8n2QBgeOJ+7Siur3
	LF1IKEwYXfPApf3X3ln20kEfvQYIgDTuT2LAOIdWsSi//eG9XbvKLrZ08TJOrJe3qt09byiJPOb
	ItWnpPL/lChUcExW4PLS7ahe6tC/GZpbW+1oPFB4lpAqSWWclx3p+DIPewAuXbz7uRpNIuB9W4h
	py5CeE/BjcqSAIbxDzAxCZda3z0LFk2mzn/3+C846SF/YNk18FBYS/RK/7ylphDEpAKluMvINxi
	YOhgJUzQSQAaY=
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr295279095e9.24.1776342124135;
        Thu, 16 Apr 2026 05:22:04 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm7164252eec.19.2026.04.16.05.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:22:03 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:25 -0300
Subject: [PATCH bpf-next v6 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-8-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2177;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=+YBja3AAyMuyPOK7hY8a4GWFTYXYPSBMUIrp92cTH/A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCjJr7qrZTvsZeXw66sAmgEJNp6GdcrYlWF3NbAxILcL6xQzFchcMR6yXSO6q6ybEvNTrrLSd05
 jOLUJE3UtxA8=
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
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 5ad50d3ff2f8..79991dc98ddd 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -758,14 +758,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),,$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

