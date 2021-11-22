Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E972C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so51246wmj.5
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=024Wka0E713xsJf700xrx/syeZGUxbWTXnwwd3qHzwY=;
        b=nQUEWX1Sjqxu5MllGICcoGR0Z6fsCaYYLBePnULWxt2XTFRlB5RdSegT2tkjGR5gxd
         p9zdsp9aHfrie0LLPrWODNEy9WaP+UkdP5sd9j6rSOV+AOEJz/uZbCBtL1rL1MhmwCCS
         P1xxwWaL4ED+HSD8YDuogIUO8ldjdG6l6/5g9vAm7gTkkvw+RFLneIZQF0PbT8wDn8VF
         PzfS6xF1XfJJecmu8IBHFGQBW8ZiDw3FXz22zkhEw93JRLZFi2Obf371Y/OFXFbARtHU
         34g/c/WGyV8eENQ/67IRH2zlsQzj6EN0TmihOu1oiXQA79+eM+u5zpdSoDeaFn7XCadi
         cSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=024Wka0E713xsJf700xrx/syeZGUxbWTXnwwd3qHzwY=;
        b=PiINkH9p58nmasLXlOm1AwvtEnEVa6LpkuRMDBl9+Bp+faZ4LGVx4x4rxyYzKzdUZa
         N+uklHNQfbSzo/hfUrVTxEPOE0E4jLldPuGTNFQ33336q+iv0K9mH/41E06RkgeMrbEN
         JvxVMyiiXk0U9rBrqokVH/6FCwd/M5bas8RZRD5GxvSNfViB05GpCc+oj+50syyRDXp4
         fBymnlHWVHl/n+CIhrxhisKDa7J6Z1zAr3PpIt47Ol5jYuZNyHXSTHld4iz+NRumPk2J
         f4VqTUXBkGA1fFlQegRxkJ+c/ZESXTZD5JnWfgzYH4OnP8Ekx0nMwlcD19jENpXBlFT6
         DzgQ==
X-Gm-Message-State: AOAM533uO2q8rVy05wUfPQBCcK8C3BLWA0yeLjAakqdQHc21fZ0rBJ4o
	6CnIJKmZdhuAwZ8OyKRtheQIIw==
X-Google-Smtp-Source: ABdhPJyQqsAKe+AQBZWsilg7Alcxe1XKYGhBxOi0lA49zI3GSFqu82YPs7xMUFuwO7z2yE9dkODKkg==
X-Received: by 2002:a7b:c10a:: with SMTP id w10mr27444927wmi.183.1637609027959;
        Mon, 22 Nov 2021 11:23:47 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:47 -0800 (PST)
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
Subject: [PATCH bpf-next 2/6] tools/resolve_btfids: Support cross-building the kernel with clang
Date: Mon, 22 Nov 2021 19:20:16 +0000
Message-Id: <20211122192019.1277299-3-jean-philippe@linaro.org>
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

The CROSS_COMPILE variable may be present during resolve_btfids build if
the kernel is being cross-built. Since resolve_btfids is always executed
on the host, we set CC to HOSTCC in order to use the host toolchain when
cross-building with GCC. But instead of a toolchain prefix, cross-build
with clang uses a "-target" parameter, which Makefile.include deduces
from the CROSS_COMPILE variable. In order to avoid cross-building
libbpf, clear CROSS_COMPILE before building resolve_btfids.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/bpf/resolve_btfids/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index 751643f860b2..9ddeca947635 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -19,6 +19,7 @@ CC       = $(HOSTCC)
 LD       = $(HOSTLD)
 ARCH     = $(HOSTARCH)
 RM      ?= rm
+CROSS_COMPILE =
 
 OUTPUT ?= $(srctree)/tools/bpf/resolve_btfids/
 
-- 
2.33.1

