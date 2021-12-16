Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F42CA6
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e5so11887161wrc.5
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJRqVurWv/xPXVPfg9RJJPd9MELUol7kDVQDIoB29M4=;
        b=j11Nk8Sqnke5x2cKuVDNGRjjHdUv65mw61hzMSDPnxhKxKjz9QpmvRbTOAP7PT0Qj4
         lRXxMRjip+9dtbSJwULLTlpd8uQFObXQRsWQK8/SkwknGd8VnKGckm/sWIgoysHaC/Z8
         HdC4fr9IHtl+IEBfF+F9+H/3xJPYuVVbF95I7BezfRE6DXptsOftO9AhzQ6zL24dejmq
         jSJY9DN376cNEDYkyJoBYBC9NY7VYUdMQyBdZH/81RjvIU84Yl1ebNqL7SVO3KFoofjN
         8moq9RwIwng4+LkWkIyMunWctj6e/4mQi717khuAB1ziYwlG6OJGS4YONFdZQtSx0VUB
         j5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJRqVurWv/xPXVPfg9RJJPd9MELUol7kDVQDIoB29M4=;
        b=oLaM0YvoNwsmEyIzAOxGyiec0aXYpjhqU8vAKb1kC7LMZKRqg4QipMQ6zU1pHGjqAa
         UIO6/WnAFNH0Vmn1thWdW+gf/hkH+7TadaDBuPVxiQy5VuHEmtXDbJBEILlRlFrVwqzq
         jXy+oo5s7iKjiCzaV0lGPzAlAfNsvHuTJxQzTIFNt9xz0cDstqY4WVMZfQ6zjFbIx5xu
         5+PabmZ47mFrnftWqOkcWgpvSpL8YH3+q3aKpH4B2SwfdABlXldMmdBV9JQhvvHOOlSQ
         lLCAQZKLlFY4vL5nYdxqngq30pgssydSnVXVzgyru/szckFGFDIcNX8e4fSeVnY2m/7C
         saZQ==
X-Gm-Message-State: AOAM533vYANyeA4PubL6lyAb3JIWT1G0Bj7IWT0ft67QTU3aEZfHXjdF
	wwjsXzDjbvQcBba29/RRluLTYpwOw15oUg==
X-Google-Smtp-Source: ABdhPJxzwdAAnWi1SsHBCOcf33UW6I563gS8lB7I43K9co91J+vPwBcD4O7ZqVJpBGGrEwajiLNvbw==
X-Received: by 2002:adf:f708:: with SMTP id r8mr10213612wrp.198.1639673448266;
        Thu, 16 Dec 2021 08:50:48 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:47 -0800 (PST)
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
Subject: [PATCH bpf-next v2 2/6] tools/resolve_btfids: Support cross-building the kernel with clang
Date: Thu, 16 Dec 2021 16:38:39 +0000
Message-Id: <20211216163842.829836-3-jean-philippe@linaro.org>
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

The CROSS_COMPILE variable may be present during resolve_btfids build if
the kernel is being cross-built. Since resolve_btfids is always executed
on the host, we set CC to HOSTCC in order to use the host toolchain when
cross-building with GCC. But instead of a toolchain prefix, cross-build
with clang uses a "-target" parameter, which Makefile.include deduces
from the CROSS_COMPILE variable. In order to avoid cross-building
libbpf, clear CROSS_COMPILE before building resolve_btfids.

Acked-by: Quentin Monnet <quentin@isovalent.com>
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
2.34.1

