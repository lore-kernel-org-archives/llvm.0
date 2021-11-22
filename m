Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39C2C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so680952wmb.5
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vbsyyCPgwGcNnodUMG2F0UwivpAF3DhXaUta4p1GbE=;
        b=gqsg4lwy4awKuATbyfW9UconAkvdcpubQ0Fg6ZJmn1jWl1+DAI158OphbI9/m3JF0T
         lcaSMgr+c3E2AytYUiEnOLK0yv93QO2SiTJ9P5kK9fegBhN3bg732CU2eXs1xmF/tHPN
         FzKi5NOVMEpyIo6ysMJ+KjaYqO+rGMxrUIBcd7lKTKx1U87FH9DFBbWkbrClKmfvQEIC
         V+94I9tGizHddINl2+HparAL9qFvPJWt42xx2pBJrvdZYLv15kToIWv9qObJhuzVpvn+
         Y/KRj/iDwxNqBP3jLj7U1L1irc4Zw0blvFqZ2/NhMrARULQAidKfnkP1fegzim7pB2eP
         DL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vbsyyCPgwGcNnodUMG2F0UwivpAF3DhXaUta4p1GbE=;
        b=5C76uV9UDzI3xbFQcsG/hAFv2zFE8C0hQATjeWuF4ryBNZmEbImNXvtWoUW8NIW4CI
         UqfCxrZm/PKTalBU3l/xySqA15tBmo9F+Lr8DNC7S/fubx8OVoybGxGm5XWQ+qXrokQ9
         ZGAS3fqu4vekCxB0Yee414FhH+Yq1gdjifp30bGihxY73aqy4B26Fk+td6KtU14h98hg
         qipPWkG/3pI36D8vnEZFkKJRz6qP4qRDg50QCb+U9UIEYs+Dwl7NW0FMJAfff2VtGkzf
         gfycxRvTNipKxrl2HTVoOSB5Vg/QGJZ+LEf8OI+nQ1A8JWiF/SYHeOjT7QKFysEb+qEp
         Z86Q==
X-Gm-Message-State: AOAM530lBeKbB3R9Ya0cajAuTVaGbtX+OaNxXTn+29zSde0O9VTtNZ/x
	ACp3kq3ctdL9FbvzbhSpb/UNiw==
X-Google-Smtp-Source: ABdhPJxhuBJuggVtgn8I/kW6Rm67LaXSe55bWuoQlgX9aTnz7EjNQo6U6VHbXsjwca6yIZWln3j7rg==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr32238695wmm.154.1637609029830;
        Mon, 22 Nov 2021 11:23:49 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:49 -0800 (PST)
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
Subject: [PATCH bpf-next 4/6] bpftool: Enable cross-building with clang
Date: Mon, 22 Nov 2021 19:20:18 +0000
Message-Id: <20211122192019.1277299-5-jean-philippe@linaro.org>
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

Cross-building using clang requires passing the "-target" flag rather
than using the CROSS_COMPILE prefix. Makefile.include transforms
CROSS_COMPILE into CLANG_CROSS_FLAGS, and adds that to CFLAGS. Filter
out the cross flags for the bootstrap bpftool, and erase the
CROSS_COMPILE flag for the bootstrap libbpf.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/bpf/bpftool/Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index 42eb8eee3d89..b0f3e17d981a 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -57,7 +57,7 @@ $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_
 $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
 	$(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=$(LIBBPF_BOOTSTRAP_OUTPUT) \
 		DESTDIR=$(LIBBPF_BOOTSTRAP_DESTDIR) prefix= \
-		ARCH= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
+		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
 
 $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
 	$(call QUIET_INSTALL, $@)
@@ -152,6 +152,9 @@ CFLAGS += -DHAVE_LIBBFD_SUPPORT
 SRCS += $(BFD_SRCS)
 endif
 
+HOST_CFLAGS = $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),\
+		$(filter-out $(CLANG_CROSS_FLAGS),$(CFLAGS)))
+
 BPFTOOL_BOOTSTRAP := $(BOOTSTRAP_OUTPUT)bpftool
 
 BOOTSTRAP_OBJS = $(addprefix $(BOOTSTRAP_OUTPUT),main.o common.o json_writer.o gen.o btf.o xlated_dumper.o btf_dumper.o disasm.o)
@@ -202,7 +205,7 @@ endif
 CFLAGS += $(if $(BUILD_BPF_SKELS),,-DBPFTOOL_WITHOUT_SKELETONS)
 
 $(BOOTSTRAP_OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
-	$(QUIET_CC)$(HOSTCC) $(CFLAGS) -c -MMD $< -o $@
+	$(QUIET_CC)$(HOSTCC) $(HOST_CFLAGS) -c -MMD $< -o $@
 
 $(OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
 	$(QUIET_CC)$(CC) $(CFLAGS) -c -MMD $< -o $@
@@ -213,15 +216,13 @@ ifneq ($(feature-zlib), 1)
 endif
 
 $(BPFTOOL_BOOTSTRAP): $(BOOTSTRAP_OBJS) $(LIBBPF_BOOTSTRAP)
-	$(QUIET_LINK)$(HOSTCC) $(CFLAGS) $(LDFLAGS) $(BOOTSTRAP_OBJS) $(LIBS_BOOTSTRAP) -o $@
+	$(QUIET_LINK)$(HOSTCC) $(HOST_CFLAGS) $(LDFLAGS) $(BOOTSTRAP_OBJS) $(LIBS_BOOTSTRAP) -o $@
 
 $(OUTPUT)bpftool: $(OBJS) $(LIBBPF)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@
 
 $(BOOTSTRAP_OUTPUT)%.o: %.c $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS) | $(BOOTSTRAP_OUTPUT)
-	$(QUIET_CC)$(HOSTCC) \
-		$(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),$(CFLAGS)) \
-		-c -MMD $< -o $@
+	$(QUIET_CC)$(HOSTCC) $(HOST_CFLAGS) -c -MMD $< -o $@
 
 $(OUTPUT)%.o: %.c
 	$(QUIET_CC)$(CC) $(CFLAGS) -c -MMD $< -o $@
-- 
2.33.1

