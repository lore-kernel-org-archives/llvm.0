Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C032C86
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so105008wme.0
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3LTkpgb4YE18mw3OKBtH3udDe7QlkxzG+PzZ1tUbsA=;
        b=dgftq9xHELzP4x8nZQnYg2fvVYgxq+O8uUGW9nXLbnBHDHJBPWypWfKOjXWLq4S9iF
         eg0v3LD9aaT7ORh8gV+EtUWTpfagf2hc9sXGyLdaFcgzkXQHHe14f6KoVxgUtxbP0DN4
         2CbY7CrMHWfO1OkaCcHf25L/1eAI0zw6UJwSQS5HuBAXEkUzKB6b6mdy//mpWCnVhO6d
         OLeprSGhW9MRJ3I7521ctm/H97FkG7iAyHF7HfywbJkOaYgI/KkgQapINuAE7rox6M8Q
         Re4xGtoJxVCWZfz8zpWdj76EylB+J2eKiZIUqQX2EGRtf2D9uUss43mMul2XGxG68jec
         X1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3LTkpgb4YE18mw3OKBtH3udDe7QlkxzG+PzZ1tUbsA=;
        b=dAwTNXbgthczDrnchLbpx6UzpKIcE2k3cn/RnJlemw6B5cHEMLl7hUm251FJZzvR3+
         KNE+dWrwKdiswmvYClOdspQaVRfNC+lLaEnFsaWIO7z5G8KZRtPLYJYtXaOUjZSye/oi
         JYr6M4IEoOKRwSlgcelOOirhdrqagK5wL/AFJlre3CEKuIKVjVqzlK0E54OxWafYpTF1
         dnCEUgCCrweerKvo9H50j/2DtOw6j1QbNxjm5s05GQ1/J2YLZqxlRuQ+hvbl/hhA2YHl
         7iBSj6i6SOOEs0x4DqK0tPVhqjO4D+9QZEyslgLe1QxpLx3X87AVFWFOosz0H/Nwl8Mh
         HlQg==
X-Gm-Message-State: AOAM533clX2wRWEo5ywufKfcyYBHbbwKqhgYWIcKGsyHSJaB08rnUjvG
	AaK4uCVOCihNgcvlCh77DD/EOg==
X-Google-Smtp-Source: ABdhPJzbS8DyPHc1CvkMU//eUj0YedlEnTZRKz7L0NzB22USJIXqjQbsaV2Sx+5qVvccDCi8q7lOvw==
X-Received: by 2002:a05:600c:3658:: with SMTP id y24mr33315488wmq.161.1637609028936;
        Mon, 22 Nov 2021 11:23:48 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:48 -0800 (PST)
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
Subject: [PATCH bpf-next 3/6] tools/libbpf: Enable cross-building with clang
Date: Mon, 22 Nov 2021 19:20:17 +0000
Message-Id: <20211122192019.1277299-4-jean-philippe@linaro.org>
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
CROSS_COMPILE into CLANG_CROSS_FLAGS. Add them to the CFLAGS.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/lib/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 5f7086fae31c..fe9201862aed 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -90,6 +90,7 @@ override CFLAGS += -Werror -Wall
 override CFLAGS += $(INCLUDES)
 override CFLAGS += -fvisibility=hidden
 override CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+override CFLAGS += $(CLANG_CROSS_FLAGS)
 
 # flags specific for shared library
 SHLIB_FLAGS := -DSHARED -fPIC
@@ -162,7 +163,7 @@ $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
 $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
 
 $(OUTPUT)libbpf.so.$(LIBBPF_VERSION): $(BPF_IN_SHARED) $(VERSION_SCRIPT)
-	$(QUIET_LINK)$(CC) $(LDFLAGS) \
+	$(QUIET_LINK)$(CC) $(CLANG_CROSS_FLAGS) $(LDFLAGS) \
 		--shared -Wl,-soname,libbpf.so.$(LIBBPF_MAJOR_VERSION) \
 		-Wl,--version-script=$(VERSION_SCRIPT) $< -lelf -lz -o $@
 	@ln -sf $(@F) $(OUTPUT)libbpf.so
-- 
2.33.1

