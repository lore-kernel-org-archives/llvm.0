Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E882C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:53 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p18so16482931wmq.5
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MueQ2379h1Uuijf7NqAb6HWoHYhn8omMshbqb9U40ok=;
        b=vKmce3kDMZmUHh9EtAaylm0uTDuOHxU5YdLDjx/josn1ViJ21s1pxYrA/dggbwyKro
         NP8IfrbaB62GmB+r6YEe21cIMdos9quzJtls8cHjPai79kA2n0cyer1/sjjAfFRRh18O
         +ybc+sXph9F8kLdrR8JegSUYcjnz81dUALTw52G6rpjEzGk/sfhqy5jvnZZpICrS1OFA
         IjFr7msRc1Z88s4Ks6ELKpOB+GwZaXSw+7PU2l6O3KxUXGjJz48633YvyzJ1TagyUwde
         fLgwzDjziuhcFEeDf6N761QOw214lO+zBQ4OQhfEh/df0BW//34eDJGIwWaR8KVsgTVa
         0k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MueQ2379h1Uuijf7NqAb6HWoHYhn8omMshbqb9U40ok=;
        b=BZHW//iu//X08Eso8DyyAlRsIDrv8oau3YhIx3ZZkCnKiPyEsrM4hdQfZPoVteZlHK
         B9YICd7rMKb3MHWkxol1eLdhqNzhTa05d20Y+w3O+r1hTnueJzY+7dXrFstCY1fd77pb
         iWyNCsxQBnVyLL15OhZGkf3WFB9Hb3jVzYWvmTX8ODPCyCEwYqKMYu88/ahTC9Acy8jH
         K6BlA41ZRRKACpc6j1NACjY8eV3J3ZgkmenbYgaukEXKrP/1jkhCnx9F5Z2z2Gh4vfpg
         HKpr3kQGozkpFEUYLm2b36skHzura1rRDijlerASCIsdP+mjKRrK+3lpJoHlgSAWHjI/
         mCAg==
X-Gm-Message-State: AOAM533LTeuv4ly75VDePSAdBD8hr2viGPH4Y+v0mef3SWnL9xVu8E/r
	ggouKE3A5Nn66/6GQmFA6WxaPg==
X-Google-Smtp-Source: ABdhPJzXyUHo0yJWSCehK43dYuv912k1yCNST/t8EupwNz6wdrdT1eg1p3ZuLuOleoZjMgl73ipD3Q==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr31898456wmj.190.1637609031784;
        Mon, 22 Nov 2021 11:23:51 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:51 -0800 (PST)
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
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next 6/6] selftests/bpf: Enable cross-building with clang
Date: Mon, 22 Nov 2021 19:20:20 +0000
Message-Id: <20211122192019.1277299-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211122192019.1277299-1-jean-philippe@linaro.org>
References: <20211122192019.1277299-1-jean-philippe@linaro.org>
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

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 52383fe8ba42..6c678509e949 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -170,7 +170,7 @@ $(OUTPUT)/%:%.c
 
 $(OUTPUT)/urandom_read: urandom_read.c
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(LDFLAGS) $< $(LDLIBS) -Wl,--build-id=sha1 -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $< $(LDLIBS) -Wl,--build-id=sha1 -o $@
 
 $(OUTPUT)/bpf_testmod.ko: $(VMLINUX_BTF) $(wildcard bpf_testmod/Makefile bpf_testmod/*.[ch])
 	$(call msg,MOD,,$@)
@@ -213,7 +213,7 @@ BPFTOOL ?= $(DEFAULT_BPFTOOL)
 $(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)    \
 		    $(HOST_BPFOBJ) | $(HOST_BUILD_DIR)/bpftool
 	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)			       \
-		    CC=$(HOSTCC) LD=$(HOSTLD)				       \
+		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) 	       \
 		    EXTRA_CFLAGS='-g -O0'				       \
 		    OUTPUT=$(HOST_BUILD_DIR)/bpftool/			       \
 		    LIBBPF_OUTPUT=$(HOST_BUILD_DIR)/libbpf/		       \
@@ -244,7 +244,7 @@ $(HOST_BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)		       \
 		$(APIDIR)/linux/bpf.h					       \
 		| $(HOST_BUILD_DIR)/libbpf
 	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR)                             \
-		    EXTRA_CFLAGS='-g -O0'				       \
+		    EXTRA_CFLAGS='-g -O0' ARCH= CROSS_COMPILE=		       \
 		    OUTPUT=$(HOST_BUILD_DIR)/libbpf/ CC=$(HOSTCC) LD=$(HOSTLD) \
 		    DESTDIR=$(HOST_SCRATCH_DIR)/ prefix= all install_headers
 endif
@@ -542,7 +542,7 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/bench_ringbufs.o \
 		 $(OUTPUT)/bench_bloom_filter_map.o
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
 
 EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)	\
 	prog_tests/tests.h map_tests/tests.h verifier/tests.h		\
-- 
2.33.1

