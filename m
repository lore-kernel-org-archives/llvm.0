Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F644496
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:35 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c44a25bd0bso28844955ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405275; x=1696010075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yau4BT1EoLV5IJxhaSNLPuA1eve9TNZXYVy+N/HUh40=;
        b=Wu0672dmB+juYDFfcnhqi9ZZcGLOvZRjgeeyzj/siv0FuJHgDqOqIe7w1sNQd4+fxJ
         QK9nEOICpeBvqE4E0n/SXzXdbTavINterNjotdghTsvEiqlV6qXI2dGEc0elLDWZ7jHn
         9Qk46p2EM0yrR4VYngWlE49wE7L9MkvMe4FU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405275; x=1696010075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yau4BT1EoLV5IJxhaSNLPuA1eve9TNZXYVy+N/HUh40=;
        b=UnXxmmtCZ4UCS6a4/2I4wijKks4/H+HCB1g9X0Wwt4/GHZHGmb6fweP05gkAWx8Rxb
         xZYiW9rZ0FjDEOSlm33ttzsEccRIQV35FwvMxMwlXzFeIPa+GDSYibW90MqPwVPRjR/e
         NPeX5RMHtQnlK9SD5M/jJDl+ytK46et5jFgROevVqorpbwM8ApE0g/hK63uDnM+G7ED8
         mxC2qbC9733FXUfThZhuIstpDcvtay8GcL2y71QF9K5c67631McaeiXwpfq29hZ3yuoF
         jyWH+cz3+j3VaPLNcZaVG1Wm9WsTnXdzcyS96FWKLIbR95KvDxIKSVfhU9XIGA5OMY1Y
         cNHw==
X-Gm-Message-State: AOJu0YwM/bS6B4a7kN9Ate39JOPSlHSZPwwo6JA3nrqwhckiKz5hbfhM
	72pgCe+waIljZ3dF2xKMcC+IXw==
X-Google-Smtp-Source: AGHT+IH0nPqBG/eAcoGO+3MN6u7Nmf8xgA0JckteDfVErs328BgyzY5lHU7ZCU+XDwo2uiaN1b90Dg==
X-Received: by 2002:a17:902:c793:b0:1bf:8916:8d21 with SMTP id w19-20020a170902c79300b001bf89168d21mr3721398pla.13.1695405274889;
        Fri, 22 Sep 2023 10:54:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001bb99ea5d02sm3785718pli.4.2023.09.22.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Kees Cook <keescook@chromium.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] crypto: qat: Annotate struct adf_fw_counters with __counted_by
Date: Fri, 22 Sep 2023 10:54:33 -0700
Message-Id: <20230922175432.work.709-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=keescook@chromium.org;
 h=from:subject:message-id; bh=mO0bdOi2nI6QO7rAk/Bt7GstmFLQozYHxthbt8jGiys=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTY1zT9E503RR5pv60ffrhtLU8cjnNXS8B8W
 ChPy1l7puyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3U2AAKCRCJcvTf3G3A
 Jr9PEACUNiXvl8pQbdDtreunyBaXA9OzAXifbarZvcgVP0x6lvUxJiXAf3Do8llYxy0p7tyD6NE
 zYYvVfe9nOKX7RYiMUKB3sXFpA4YQAWnPC0Gkx3RZxhbMLeEPbMIwwL8N/uZnecnx9Twc+v9zt+
 HvvTKe1aSlYnRTIVE+4WB3AeOQTo5t1FSy76B5mMV+auhuVd+StmU2nCELW4ykubkUlptjVJATx
 9ndKYhQ6UAEHZuV3r9Sbg5Iad7FiYyQGqRzDDyKTNJkMfqu2Yth7uTTr62H0NcMkVoPH0T8KuRn
 hvk/cZbfPt60gO/Hls9+kyFYJK0Hk819tcgmKxhigK9c+5zyUfx1zO7BSuJilF3BkZ9ve/DJ4Q5
 a+j2XmWigAb/wputzOlYx38i2Rlck9pwKfZ+e/mpG2INPuaByxjaV6JXVpHL8FkOmsEbKoj44sS
 6wFyyX4ifgN3JFS4RFnz6hygM9kCCk98Y82aUHyTbQ/uoTYQf4Fdg114CCPtRFsNXBR5RAOpEdp
 dQUVncIQ+DlVDuBweW975ffkDa2eAuZRXDOkRcG+uwdCDZ3eQTuZs1jiIuXWsHc2E8r0fCCy1V9
 kJZEMQod7a3N+J5510CfP14zcTB46GDAVSuK0tInO7jCXGVO+N6VsSdmYNXWikKxOvnslgGDLaE
 cOYw7LO p/I/SNxQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct adf_fw_counters.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: Adam Guerin <adam.guerin@intel.com>
Cc: Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: qat-linux@intel.com
Cc: linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/crypto/intel/qat/qat_common/adf_fw_counters.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/intel/qat/qat_common/adf_fw_counters.c b/drivers/crypto/intel/qat/qat_common/adf_fw_counters.c
index cb6e09ef5c9f..6abe4736eab8 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_fw_counters.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_fw_counters.c
@@ -34,7 +34,7 @@ struct adf_ae_counters {
 
 struct adf_fw_counters {
 	u16 ae_count;
-	struct adf_ae_counters ae_counters[];
+	struct adf_ae_counters ae_counters[] __counted_by(ae_count);
 };
 
 static void adf_fw_counters_parse_ae_values(struct adf_ae_counters *ae_counters, u32 ae,
-- 
2.34.1

