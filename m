Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E792C86
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id ay10-20020a05600c1e0a00b0033aa12cdd33so481173wmb.1
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20odS1sGlZOVOTVJ+h0ATXc3IjCp4ghIzYe7OtypAl4=;
        b=Tn1lU0bD88IO+9yCRA6my8Iwn8DdSi2yjmwKm6kCVat9P4MZbf8fk8q1VWneE0TQMr
         xnQSOZ+OGzgQUnaQRhJrBVw8vuNdWTbTKFLwx/nlO5xCaGq/zFUzcaPK9h51bWJxQ3ik
         Per+P/IB5wRUmmxGrykwQfiRNOBPXSvqCf2mp0Pg+peiE5PtpEZCvU3IzL9SXBgoDSJT
         9MjphdkIt/a4BQLYOUr3f4akQA/F2Zlwj5jXh+48xjNpBUj3LphtLWGQY7+K7piMHFmt
         nk95BeGVt1G9J6C34OPzChTKQfutYPiyse4sOcDVW+7TmgMR8d6h5nhk55JdaisCqkwi
         pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20odS1sGlZOVOTVJ+h0ATXc3IjCp4ghIzYe7OtypAl4=;
        b=6fKkSKIeHApqilC+c9a8ZS1IuGE2AHSFb6PZ/LTRJhegwmp2Lknu02RlPe569CNd61
         KYIyKt2ucJxKBQlrya9cxoK0tRI7th4lv7pDUU9JtTYfZxzERFCk4EVyBjIXB+Wr83XU
         KleQ11WTf4ZjACj/pC/gCR9vUCJ5x5FygfZKJKwaJ3OdhUmNNsv3D4YPwGssvYRQP5zd
         F+QqqqO4SPzU1X/HCyJUkjw8hkVf54Vya3cVT52fK1HLSx2zN9+81qJ3RQngc7Gh5PMB
         IzCUM+cqSH7p1h+gpLu+63EQ+/ZD9NGR9Zx1c2w+/Lcto6nX7j2CHlSmPStQL1I4FZj0
         TrRw==
X-Gm-Message-State: AOAM532lcFzY0Llyupi6yxwzsZWSXgRYKwmVTz9zwyh0CQTnV4EXDXSV
	p3raif3vUH3Omg4bqMuqfvOYmQ==
X-Google-Smtp-Source: ABdhPJwO+fR7TuysSgJw95qlWY88C/MS5DSdhnBIyjOi33oxzKHfxJ2yjFeNCmhCvb1o8azdpWmQhw==
X-Received: by 2002:a05:600c:1e1c:: with SMTP id ay28mr33464993wmb.131.1637609030871;
        Mon, 22 Nov 2021 11:23:50 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:50 -0800 (PST)
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
Subject: [PATCH bpf-next 5/6] tools/runqslower: Enable cross-building with clang
Date: Mon, 22 Nov 2021 19:20:19 +0000
Message-Id: <20211122192019.1277299-6-jean-philippe@linaro.org>
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
CROSS_COMPILE into CLANG_CROSS_FLAGS. Add them to CFLAGS, and erase
CROSS_COMPILE for the bpftool build, since it needs to be executed on
the host.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/bpf/runqslower/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/runqslower/Makefile b/tools/bpf/runqslower/Makefile
index 8791d0e2762b..da6de16a3dfb 100644
--- a/tools/bpf/runqslower/Makefile
+++ b/tools/bpf/runqslower/Makefile
@@ -12,7 +12,7 @@ BPFOBJ := $(BPFOBJ_OUTPUT)libbpf.a
 BPF_DESTDIR := $(BPFOBJ_OUTPUT)
 BPF_INCLUDE := $(BPF_DESTDIR)/include
 INCLUDES := -I$(OUTPUT) -I$(BPF_INCLUDE) -I$(abspath ../../include/uapi)
-CFLAGS := -g -Wall
+CFLAGS := -g -Wall $(CLANG_CROSS_FLAGS)
 
 # Try to detect best kernel BTF source
 KERNEL_REL := $(shell uname -r)
@@ -88,4 +88,4 @@ $(BPFOBJ): $(wildcard $(LIBBPF_SRC)/*.[ch] $(LIBBPF_SRC)/Makefile) | $(BPFOBJ_OU
 
 $(DEFAULT_BPFTOOL): $(BPFOBJ) | $(BPFTOOL_OUTPUT)
 	$(Q)$(MAKE) $(submake_extras) -C ../bpftool OUTPUT=$(BPFTOOL_OUTPUT)   \
-		    CC=$(HOSTCC) LD=$(HOSTLD)
+		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD)
-- 
2.33.1

