Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7092CA7
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c4so45300095wrd.9
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ose2WJEou4zoTrngtFvFAaRJtRUsXBV7SYBsD7VOC3Q=;
        b=PrYuPW3/nxu/boJFGaWpIEi1ilibRe/YYZ7+rh62rX2+dZCbPf8sdfU+Bu4M5rY0aB
         uDP1fxuOoooPb1Fa0D+K6DbeOmbGcdTW79/pKn/pzzEIzNfQnCZqaMIYL9bIbYr+d8vH
         vJwcROrTVSEuEKQYb4Vn4aZciE8uB1m31vo+Qu1wK1dtVkZfva99IJFc/+J1KpTzbqSt
         QqVicK8o9t5DQt8qp6E0ivpq4IQxPEeNQb0WyUDmk2qJutJestY7li9c6lz9S6/36wsS
         aXuR9mw7RMOhqPzLQ0OSE/koefC42e0CjY7fjHiutc1kwfVYj2RAhx1qf8GrrO7pPvUf
         pDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ose2WJEou4zoTrngtFvFAaRJtRUsXBV7SYBsD7VOC3Q=;
        b=Rm4G6qK3wDNbL4XiKarRLhVYxZPZwUBpdn0xl1LwQfocBdQpoqyTToYza1aylTqRiF
         0sSJKIzXKHSK7KwGerHKlMjNLT/aNvzqG/FsEgox8KmlND4B5KIP0RsZyUMPetdnS8G3
         jLticzshSgbbgzAWHF25Vlgnb8u3Xn9lGk9JPSB6TV70/9d+risCZ3hD8b22AB2D05ut
         eS27IK9tIlzBPwdnayZzVjoEh9MpKTNrSDfpWlE9NvJY4nDF1oBbloEF0INpft8CtE7U
         wWVLHjHs/V8V/iZq0CLuyEmNFtllIltGjweXw6X41nZ+x+/l5o7aJUTYO/6Q93Wfjzvo
         +skA==
X-Gm-Message-State: AOAM532YFxWIOOQKcFANsU5esuiSOCkNXPnC8FttO4lGRi6ES1b13SoC
	eako5h50mQJK3jmzFVO+f2AnbA==
X-Google-Smtp-Source: ABdhPJyannlEeJJtlT2DKs7SaWIfuTLxMylJjw2g926P8ul5QDUX/huYSyoDKKPvn0fHrzlInVhSvQ==
X-Received: by 2002:a05:6000:2cd:: with SMTP id o13mr4733226wry.718.1639673451211;
        Thu, 16 Dec 2021 08:50:51 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:50 -0800 (PST)
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
Subject: [PATCH bpf-next v2 5/6] tools/runqslower: Enable cross-building with clang
Date: Thu, 16 Dec 2021 16:38:42 +0000
Message-Id: <20211216163842.829836-6-jean-philippe@linaro.org>
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
CROSS_COMPILE into CLANG_CROSS_FLAGS. Add them to CFLAGS, and erase
CROSS_COMPILE for the bpftool build, since it needs to be executed on
the host.

Acked-by: Quentin Monnet <quentin@isovalent.com>
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
2.34.1

