Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C498F2CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y83-20020a1c7d56000000b003456dfe7c5cso1263957wmc.1
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sT7c6xsY79+p4VjCJ0GuWfCfN2sZ5xBnIoxrf7S6ddA=;
        b=zXJ8r9ZL0HMuqNYJiTcdyKwaAcd2Hm/hnU26Go6jzk3Hiqo6X0i9NLN9p6AspDCY0V
         DnjMCTaUmWGj8gTU4jp+mH45CQeZtiarFsCe+yc/f0nDOdAnPxjQC70VaJKYtLnLRShG
         PfSJ2EX7Nbd5fP3chAm3iaKeLZkRETpU0Ch5pbTy9u16mVSub4HJUIj7TwAybF5baBVB
         aXLVkPwjApwqDmEmqo9gMgPyBsB+4+3BjQeNQZ7QmKQ6kHmoEpzrgXUATJf+2OTny8zg
         HYP2jb9qpyT3+5zqx7mRL6VNvRtyMVnbb4ZHIkWgaGVJckVXv43kTDFrMfYDkPpU0rUj
         fK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sT7c6xsY79+p4VjCJ0GuWfCfN2sZ5xBnIoxrf7S6ddA=;
        b=0U2AXVtjelUvNLSsPKMrraUXPkFde9jC5vbmJFZMicD54bahON1Kd7i1PeGMJsqCAZ
         L1ACCwvDMn2+x2+eDVGrTyTAXVaeEk+gfZPSkkIxyqut/ImIcHamolStW/YFNrAPpWjv
         K0K2lwV9Uu/0dsudfEZwDVGkRir7EdGj/rsbiOiI1zB/0nIQdachxT031eVu+8JrWEQ/
         S7KKyOyBOPQUXK7peTFO8xrf2j/tMWc06w9Tc1Y6GvUuNgG2VSjuVMxP2tEhXHIHFnmU
         rpT/HSBzRiqu/4xCuOWAWx9BVZTYaB159ZG+K6b4EZJ7OHTFaQV6m81spqwcs9P7qHDy
         yuxA==
X-Gm-Message-State: AOAM53374zfIcnpf7x3GORm+bCwKvr6d3gIgxsFyVjh28qgBsvmOlQvN
	itCKkhRltJdOpO1Y2uaogvmkyw==
X-Google-Smtp-Source: ABdhPJyYw/JR5XWgtcqwAnuLqgpwIaezx+JHl1pGQ/V7SoktSGt0KL2b9TPIMm6Wy/etnCFJyiPINw==
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr5873052wmn.98.1639673452137;
        Thu, 16 Dec 2021 08:50:52 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:51 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: kafai@fb.com,
	songliubraving@fb.com,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	quentin@isovalent.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next v2 6/6] selftests/bpf: Enable cross-building with clang
Date: Thu, 16 Dec 2021 16:38:43 +0000
Message-Id: <20211216163842.829836-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216163842.829836-1-jean-philippe@linaro.org>
References: <20211216163842.829836-1-jean-philippe@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cross building using clang requires passing the "-target" flag rather
than using the CROSS_COMPILE prefix. Makefile.include transforms
CROSS_COMPILE into CLANG_CROSS_FLAGS. Clear CROSS_COMPILE for bpftool
and the host libbpf, and use the clang flags for urandom_read and bench.

Acked-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 43f6f3159431..42ffc24e9e71 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -170,7 +170,7 @@ $(OUTPUT)/%:%.c
 
 $(OUTPUT)/urandom_read: urandom_read.c
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(LDFLAGS) $< $(LDLIBS) -Wl,--build-id=sha1 -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $< $(LDLIBS) -Wl,--build-id=sha1 -o $@
 
 $(OUTPUT)/bpf_testmod.ko: $(VMLINUX_BTF) $(wildcard bpf_testmod/Makefile bpf_testmod/*.[ch])
 	$(call msg,MOD,,$@)
@@ -217,7 +217,7 @@ BPFTOOL ?= $(DEFAULT_BPFTOOL)
 $(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)    \
 		    $(HOST_BPFOBJ) | $(HOST_BUILD_DIR)/bpftool
 	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)			       \
-		    CC=$(HOSTCC) LD=$(HOSTLD)				       \
+		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) 	       \
 		    EXTRA_CFLAGS='-g -O0'				       \
 		    OUTPUT=$(HOST_BUILD_DIR)/bpftool/			       \
 		    LIBBPF_OUTPUT=$(HOST_BUILD_DIR)/libbpf/		       \
@@ -248,7 +248,7 @@ $(HOST_BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)		       \
 		$(APIDIR)/linux/bpf.h					       \
 		| $(HOST_BUILD_DIR)/libbpf
 	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR)                             \
-		    EXTRA_CFLAGS='-g -O0'				       \
+		    EXTRA_CFLAGS='-g -O0' ARCH= CROSS_COMPILE=		       \
 		    OUTPUT=$(HOST_BUILD_DIR)/libbpf/ CC=$(HOSTCC) LD=$(HOSTLD) \
 		    DESTDIR=$(HOST_SCRATCH_DIR)/ prefix= all install_headers
 endif
@@ -551,7 +551,7 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/bench_bpf_loop.o \
 		 $(OUTPUT)/bench_strncmp.o
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
 
 EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)	\
 	prog_tests/tests.h map_tests/tests.h verifier/tests.h		\
-- 
2.34.1

