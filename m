Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5174446B
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-692779f583fso1469873b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405255; x=1696010055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdTn/0muvJtiHpvCIE7e0tTaPM/Ce4Zkoiyha7khL+I=;
        b=IVXlioEStOIWMeTW/UHu1DGV8EPwbTqoB6GuiJnH973EXkpO4YamxKMNCZ5qz+8oyC
         khpHXY3plIFv6PKE+/WZJYzY/cPK7T39EtypPWk4EzwcIaNGRRtttR/v0vB4tDCDBy+M
         vXyWo6AotvxOvKh17w3cLiTqzRdndQQJPoPug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405255; x=1696010055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdTn/0muvJtiHpvCIE7e0tTaPM/Ce4Zkoiyha7khL+I=;
        b=R9zYayL6l8kADUBKXMgTvSxYXbeiMHj4837/2P1i3AtaNqeXB7dRZZx+8NtSYSLbM0
         qoeOCy72K3pDHEQH2TJOBlFd+Lkx4eCXerUMmXyKtVoh7xbDy20qldN/t1k7UXXTo8Pd
         O9Z/SrxMb3TFOarmNo1GMnl+nW/rHff3l0YELd9oyAmO84meI4CGDmEArtJ458m8KqGr
         wZ+HHxk8LQ3KRYFJAqhjKa0TXoiAXxQwcce94e3qFWcHS/q0E4xsmvJ+cfICurEbetw6
         yvKgPeomXqIY4CU744H12KqvGRO/7arKRlrTSLEaGl2zQSkdJ5MJepO+mz9RWqmc9uAZ
         f/Mw==
X-Gm-Message-State: AOJu0YyRv7UIFdHrI9b29n6QYsmWQ1pTYEYzg96fs1WgVKZ5b2PfSGT1
	ycZ/Vg9kcgnw7fzl5+GpkKLC8g==
X-Google-Smtp-Source: AGHT+IHmKpHNU9aBKp4VBNBpbcxaBgcglJ1q+b7TgjvNi2g+nYDvvPPG+ayO9ELWEcqaEMGWJzYGIg==
X-Received: by 2002:a05:6a00:a1b:b0:691:1eb:7dda with SMTP id p27-20020a056a000a1b00b0069101eb7ddamr125247pfh.7.1695405255436;
        Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k15-20020aa792cf000000b0068a3f861b24sm3462729pfa.195.2023.09.22.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Andy Gross <agross@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] soc: qcom: smem: Annotate struct qcom_smem with __counted_by
Date: Fri, 22 Sep 2023 10:54:14 -0700
Message-Id: <20230922175413.work.929-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=keescook@chromium.org;
 h=from:subject:message-id; bh=QPRDelWAkTRqn7WkklPCzYdZBpFhCd5JrP57gKSvApU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTF73/unAW40zqEdxsHteb4OckB4oasGzAI8
 NOpnPkmZimJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UxQAKCRCJcvTf3G3A
 JkzBD/4tqXg1cj8rIGdfiTLxyn+Fxw2EOGzdNwoaHT+gnQ4/WAFF+cBiQDT2pw5MErwxaFPvgTp
 nxLcMPJidI5ovUXQBW/ZmmX7O90D2J3ZEYdglHZa+igB3Y5IoFPr1ZKfMFYNBM0dcQmqFhKrWpW
 efiU/f2+Be+SS4g0eKcXI9WNlEXYuXkJ+GdH67IVoy0Pic9i/ng49XRXo25WO2jClcXKUQPK5zf
 NEg2VxWNLH92GFejJSP/yNWH6s1cPSezw17mzWthPUDQMo+N5asZtkgbOuHjVRt0nala2sjQqAo
 6TLnQLCQj7RIr818kuvGwDF3j45J2ec/0w7e8KIz/rIpLqu0MEwHLqbWvxrk3aH7vwhitPQ3E73
 UbuwnVKSaKsZ8r5p1OgT/QcV0wdx/51pXGa8ffvUGGwmrEdhH4lKxsNKxDzRy/dZcAQ2QRkcGPx
 rTiKQDfoLTwp+kXkd6vF6597phWgvNm6ePlS7/3tIPIz69azGs1Enezefya5sAYYbiTneBFOMLG
 Y6lqKInf5HKwR3R8S/3m4EzZsvN0M5jg4xhXSIfH5kRBJ9VDNWL0baQuXQqDeiYfi2DFhA32zK5
 AfrO6Wej/d4qssRVsFyEjZS0f4YAmRFbPNrwn2zeXDGHm0oKKPsBFXyazqjf6GT40wWfxuIB+Yf
 MxEssqC L+wdL2PA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct qcom_smem.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d4a89d2bb43b..4ce9cf1477ac 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -285,7 +285,7 @@ struct qcom_smem {
 	struct smem_partition partitions[SMEM_HOST_COUNT];
 
 	unsigned num_regions;
-	struct smem_region regions[];
+	struct smem_region regions[] __counted_by(num_regions);
 };
 
 static void *
-- 
2.34.1

