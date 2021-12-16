Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44F2CA9
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b73so3859063wmd.0
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tJ57tzLvzYQgO/9a3Xp1difD235xOW6tp16fePO+Nvw=;
        b=FssgxFJeWNvA52S2sKL8qB9q1T0ylP/fCugzW2B7O25Ifxn5IiNuY3dG8Bzo6PA9Rk
         kwV+nNqZ9QZ/SRGM0ntcjAk3PpHDXtW8jGqDo9qv26D9ZXRjsiTPE1u3kX4VdjZi3mw9
         T4yiRmy2ZNZOorhXbNxf3mtNLHNMKUPY7Q0GDycbsLZmO0Z1q38k9xLg2fOyYl5ZUcXM
         jYeDM2xivey529HnCxoeEYc+ilywrnRXW+QAzGS7iLw6UFoAcZ38r/SOBJoR6ATWvl0M
         F6zNnMzjkhW847CpHIaTyz3JMrC1f64//fNhIl1GGt/tZ2WKShrkm1VhRmkJ9PQpZc08
         0Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJ57tzLvzYQgO/9a3Xp1difD235xOW6tp16fePO+Nvw=;
        b=HDKv6WNUjDG4QUim6r6KmTOX4E7qLJRfgoFxnTBOlCy464T3Bc6KCfsvFQNEWKebzq
         busDgvwKkIj3CbotqSZS2JUtzIqs3parFpy5vnu4LzkNQQdQHXDm1AoqIz7tEPHb0pym
         LgEYfCLpqeos1MxoNrgCXRO3knNlqy6EXc4lAuFNsLyYN9qSbGNDIH5YairZbTY73jfc
         aHPA5FmKqpopfV/DtR+ueasILJlyFsacc+bU74VTRIpd0hym10G8kg46PrJhzrDXA1xY
         iK+9pXXih2qA80imxsb5pGdZTGSmM9Iip2N84LVpm0d9x/UPHRtwBH1dSGk1zYeWr/MJ
         CDNQ==
X-Gm-Message-State: AOAM5313JTAEBpAginGx77VLls92uEqtF4icSzPhbYiBy5A+a47T63IB
	f6sJw6XDIs2vBtqkZrnxlTF7tA==
X-Google-Smtp-Source: ABdhPJzkUQ91OzbhQT8Zh1Yv5cFer+EkjDQhAjtPzPWe+NBWXRNdGWaP8Jrjn9dbEUm9AuAgAFar0A==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr5863988wmf.91.1639673449319;
        Thu, 16 Dec 2021 08:50:49 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:49 -0800 (PST)
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
Subject: [PATCH bpf-next v2 3/6] tools/libbpf: Enable cross-building with clang
Date: Thu, 16 Dec 2021 16:38:40 +0000
Message-Id: <20211216163842.829836-4-jean-philippe@linaro.org>
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

Cross-building using clang requires passing the "-target" flag rather
than using the CROSS_COMPILE prefix. Makefile.include transforms
CROSS_COMPILE into CLANG_CROSS_FLAGS. Add them to the CFLAGS.

Acked-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/lib/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 5f7086fae31c..f947b61b2107 100644
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
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
 		--shared -Wl,-soname,libbpf.so.$(LIBBPF_MAJOR_VERSION) \
 		-Wl,--version-script=$(VERSION_SCRIPT) $< -lelf -lz -o $@
 	@ln -sf $(@F) $(OUTPUT)libbpf.so
-- 
2.34.1

