Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE813EBF37
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405438; cv=none; b=VhZJtE/YzblkugpwUhteGDxA3U/IL0fyron6sPZPE8noSZsdm2n23RrDC9DXobRUt3soK4V3+VDeAcUI1eBryqNKa+lIm02BZjqw5GPX0dpWd8SFrgIQe7ifpP/glrFYvgGTu1L8U6cpf2Q+6CchlG0ipBv91oylX7+wfBiwVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405438; c=relaxed/simple;
	bh=mKZfX+j1RnWBS8BtAxVShF9J7noeivYXX8VjI5ABuJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNQmX30dFwWvIyOOIyZcN2xOM0uMjkrDRREB81DfUUxCCKFH3BdyrxN7HvBIbMc0vIxGjOHppc6f2n7lHI98y92QrLJZ+icCHKxyBduZebArqlvcdLWAbJA88/c9gYj54MGbehZOoMcpf90837qXOls1pbwJsTPVpyiD/H0iEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NGUhU37a; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NGUhU37a"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd9a71b565aso2325237766b.0
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405436; x=1781010236; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOH7mEsh3HBCYOuvtZq+OMq1SM5+4hZbsWOCsOVaeQU=;
        b=NGUhU37a6xPEehAAgpHa/e0/fExwSQg1Uh1XJNGFVLLRfxNNlz8SIQz+hRxPdiFeU6
         jNU/nMKU+rjmKNG+PTTmeXouHBofTDHwlnJdRhn7pFBrPTBAQYTn/rxfYW2whhP8qtN4
         wCq9qB02/j1Jp6Qls00ROFjxHWLhnjHEod+NVWCvEV7HVn1AYlAED6hELqlh0Kp8nGRs
         QjATNVwOp3qzWLQTlrIqmZTeRdxUcetyt5+wQhW6utLZAiYMDuASzlNCP+JC0yk8WE/a
         eiQQdKGG82Zusbjvi++gn73B+SUpCRR+Qik+bW1133RBzeEHEPQzkvywr0O2skCPg0PN
         ThSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405436; x=1781010236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOH7mEsh3HBCYOuvtZq+OMq1SM5+4hZbsWOCsOVaeQU=;
        b=M5EeEfEUVbe/eQfoEmgN7EINxgACqmmiBTafqMvhQlYKuR+Owiwni2nLBHVkGkeljh
         g7mA2TMtEmdvWhFuJalXqPKSJ3CsdsrldpJV5ZUHn548PvQOwdgxP2kQxd89g3BrxGuD
         zhgAWPNblfxSg1MKvINrKIsUiSWTIN3LpoyKiSzCLq923ctNWCiY5vt5GGR3e0hS+Y2l
         sVOjnx41BhlX3IWcY9jwHn6o1+qfxTbmZfrs+fXfKPfdjdMxqmGX4J674ZjGnyEGyRxR
         MaSnpIomsDT8GPSDxlSfyHWumk/QdeXpVlKY6fv6KdPxdrKsneRbjCdwGLdPJw6MCyw2
         8Niw==
X-Forwarded-Encrypted: i=1; AFNElJ/XARwQKPlXsOWNjmfVzir0TdqzCdpdXiuoKh9PB7Xu3XbokZ3YCXI5GRwciFCTiW0PHYry@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2L4rtuFL6TVLbBEtfUUOjpyD8Fw0Vci/kqlxEJQzZU2kKSUz+
	simiU/siVBb29FkcFDeF5DxyN/qsDUUBAtLauxr1JxClExdVBo9vXQ+zOUsTtQ0ClNw=
X-Gm-Gg: Acq92OHwG+467cOCjGE05rg5tpcfCF18TbJzxWfeBXUH3h2oE5rN53ONZyZxT6h2eUV
	4rcML0DxmrPKvviC5SamJYfzP0SYZzZK2XiULjgjPHW4Es8kYHjCT3hqxnX7C9uKaG/m04Z1y5K
	Xcj42ffCLkGzomVyk80jqXDfFwB5FjPQuHKSnqn9M31S5XHapf8gn6ZNApPOXkcKb90+1BBFEzm
	Dc3rZWQrWtlSStRAetp79dDLlSgd4TGgO/vpOZpbUz67yFsn/smEjpguRvTFHd3376dfauG3FPN
	LKIVZaCxYuVpFPmYushWRZSDXi+BZpJ2l0qFxiZNTIK8hMPZ88ldyja1NR8CuUG6bhrh7n/qjni
	IxqtpIayLhvonYNd6fa1pFFG+A/maWpEjKrtfLYNTYB6cZo4qkc8HzdJjbEv1E8gyzPnuqwAU2l
	snrngS78ySD7WBwVaIm42xUA==
X-Received: by 2002:a17:907:970a:b0:beb:c3a7:9cd with SMTP id a640c23a62f3a-bebc3a70a4fmr770255666b.8.1780405435805;
        Tue, 02 Jun 2026 06:03:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm264314866b.29.2026.06.02.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:55 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:03:00 -0300
Subject: [PATCH bpf-next RESEND v12 11/11] selftests/bpf: Tolerate missing
 files during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-11-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=mKZfX+j1RnWBS8BtAxVShF9J7noeivYXX8VjI5ABuJY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKXuExXIll6hlcO2yxcYh0XbMjwS1dF6WLug0UL1JK/caPPPoTV6qpSwC6lK+5A0Amw2buD2QyI
 1PSwau3c0eAs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 4eebc15670e3..42d9cf848b25 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -1029,12 +1029,23 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef
 

-- 
2.54.0

