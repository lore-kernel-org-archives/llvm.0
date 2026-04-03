Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE383CAE66
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228369; cv=none; b=e/srBvZywwgSJQgbF2YKkpYW0sO43l1KpL5gPJaokfK2Dt0dFuFoiXaNYfc7gmcwjBAbBZyY/df9AaBG6ZHJIPaicsq1Rgmly7nbiCvBmPZmbHj8LAUS+vCTxMugDHCusvvgeWJ/XgX43VuEVNpvabtsIUEI2FS6YTYpYp/9j2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228369; c=relaxed/simple;
	bh=r0hAi+8/1aDh2iFsHnAbZTWuQDE4t7kIxRdOWHyRr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBHBoaQ2/0OSW2v0Xhd23u5sP1s1KCppZA52FOjTKhWgyp/BpW63i/1d7rt2xTUqYV24hpNawHgSZRiDKATAVU34H2BJOeA3ml+Q6a2XLyimaInztLaiWzswXQ1vbBLJUmIBU+wKImUH4VMSQ9nc7NL4yazlwNkArJRuhfvBPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y5Mq1SBP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y5Mq1SBP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso19571695e9.1
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228366; x=1775833166; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYgqj1zgQSxXbMWVjaEA9XAG2XEf6AIEbv/nbSFPah4=;
        b=Y5Mq1SBPMMxHZPcwP0i3zcAWUwo+LfNX5xwZCydXf0PYZjV3Sld+hkiOUJ+8P4TmVJ
         Ual/TVSP0qiAkQv6eVDWP8K8TTl6VbfwlS+qY7GJJocs3jFZy9pQgvGTAl+/PbJbAq3h
         LCTrSOYIPUt40OrOKt02bG0/pQBwCcehKHws6YFXSrnY6rNItzOBB7Dq5qItf8xxp9ih
         4t6PSYVAtN5o/hCsI+77CQL7g4wkcRO/3cLTlHUgV/otZckECgFhpGrWb7GPoorr+Y2s
         u/T0e8HuGSGtanl2zG4BmTfYoTHQs9azh8yhxbcn29zILMcahluzZJZry1QFLqkKXOnK
         ZhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228366; x=1775833166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYgqj1zgQSxXbMWVjaEA9XAG2XEf6AIEbv/nbSFPah4=;
        b=Qfgirdlz6BHnXRauwA9AygP60dThrbZED7Y29aG0jVHBgh7J24ycpJuJrJ8pwnD+fT
         hLjs4GOyb0HVYNvl6NmAUULCM1t5anW53jrQtfLduwGTwCbafAl1+BN20oQYQ5/OoDOO
         frRK4jIPLoNYu69nU27L3Y9WARSHqEOFAc+hBoGSTsyVTz8O8ZPrckMf84CR6L6WkKTk
         jBEOJBnp7UJBzvseuF6QyFtteaNFMy/mZCvAsdxP8V1bUQoQHGyrF6PppjTl2+RhEQHk
         VaWx1nkDAMrCZYt/Pc24P3AQksQ8Vfff5zZ0hYmfwLMQv9ZSi9qGL9JX8Eey4G1QRDFL
         vCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQXlQsexLFuI/FF5ML1sCmCLywWvq/giIDCXKP0EWC8iEYuyMI7/wn7uulfHDRq5N1kYbr@lists.linux.dev
X-Gm-Message-State: AOJu0YzOPAoYqNpo7UUQGiknINdmcsA9eli535XZ5leWc4OggKynXhXx
	bILv7t+o9ldc+kHZfjLc+WhmRu90ASIUVBGgvD/l+pcfwA73bFc8N17KOOK/ki49UFA=
X-Gm-Gg: ATEYQzzVUMHzgZv69zvKcrn7suiziecDRGAuhrga8cdVDSsOCA4CoBWT8FcdwYdDKcN
	vWMQryQejvindT5Cx1N5ltrdXY6BwYxMW2M5tn7nvIuKCF5TloBBZnpht00pjTQVhYD4Jxe9wpN
	2TIgJmpbGeIJJiPsLn6C0AmpMB8bvGPPUA1HovWAQu8fHuc2WhkfrFAgg5s3BBVdLiAhmevGcQU
	SFHej+lqZF0TUMzVEgcIBM/8FlRdqqLyEViKGQAgOhc/evOmoxdDVvQIr/J+Q2QEK9bhKgUpDst
	6DvAluntY/kF6Pr66oW7xQZEkCd7ZtO8unjb6LIaHDX3x5r6VCR6/Xbf8ex+4Pvphj+GnQGctN+
	KTTViJ2ScqB/O/WZRt8jf69AgxGCNsQ1gBhTM18El+h06ESqGai5aboqjKq/dtINF22dgM86Euz
	tT8ss5PZXj
X-Received: by 2002:a05:600c:63d7:b0:483:6fe3:bb49 with SMTP id 5b1f17b1804b1-4888df61f12mr83736555e9.0.1775228366187;
        Fri, 03 Apr 2026 07:59:26 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm7452360137.2.2026.04.03.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:58 -0300
Subject: [PATCH v2 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-5-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1733;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r0hAi+8/1aDh2iFsHnAbZTWuQDE4t7kIxRdOWHyRr+Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHSmdYX2XXWlMXfc0aJJn6g9w1iqwLslrc2d73uxWf06LSA98AtmDYLZCdLQf748TjJDLfJfvWk
 GRJtZN4CeawI=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. Guard the BTFIDS
post-processing step so it is skipped when the object file is absent.
The linker step will later ignore absent objects, allowing the remaining
tests to build and run.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 72f576a8236a..6a3835a58f87 100644
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
+		if [ -f $$@ ]; then						\
 		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\
-		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@)
+		$(RESOLVE_BTFIDS) --patch_btfids $$@.BTF_ids $$@;		\
+		fi)
 
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\

-- 
2.53.0

