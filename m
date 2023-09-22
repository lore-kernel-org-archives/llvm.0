Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2543ABB
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:13 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c451541f23so21539775ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405133; x=1696009933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4lFdFSF/WMtJZ1n0IFqHz6mtLvevkit742tpw5OZis=;
        b=ObOhVKvzTyIHeSyTle/swvjGKUWIt7ObTHVFFlDMtSQ+x4/LT9f7r1kAf2KwFTBs5L
         DMLKWzK7/EgOPxcRNRU7YXgd1G2HAy0iaN2/CMBUaJFM8Sl5oon0OFGbZ459QkXdo0yr
         sH21eLwbfPZGHTQdo5+dvdZOWCmseRGmXnnv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405133; x=1696009933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4lFdFSF/WMtJZ1n0IFqHz6mtLvevkit742tpw5OZis=;
        b=U2odpFAjeEEvp7TqBZMpP5EUy+4P7D7vNuU3haOiSDPAbkIwDP5iNn5Cj8IvBkknNi
         8X3Von7wIwAUGVLdnm8YlKZz+h7gIaH/Q6WJhReSg7gvkiv7WoEnhqR2QrS4S2PKULUA
         N+wOHQIeEFQODPQWRw85WyrNjrZZCV66hfSwrHCKGkLNx69oPboVsUnpciVIYMwKdq7n
         myXzARwg/7A1DMKSi66mweTXJpuRjpxIpZqO36BAVMoQnrSFrHC+mIpf8Dg2+W3Qlrn3
         dkavu2aQwmdryag/m7f7kmTCXnkF/NU4GeI+P1Dpr1UW472rHTn/e97WWtZGLqOc2OEQ
         MtWA==
X-Gm-Message-State: AOJu0YzxW4N8uce+sBhYwjpmMZbvp1tBiCsypQgsiAtKJmWhs3a8kkAB
	1ePNHwrxUvEZVvRpCBEltloyiw==
X-Google-Smtp-Source: AGHT+IFNUyiAriBD2um7pITTD+eP5MvtFjnaKTM4jvzlaWc7m2Pz8Xlfs5hzadPTiz+e5UX0XZawsg==
X-Received: by 2002:a17:902:a407:b0:1c0:aa07:1792 with SMTP id p7-20020a170902a40700b001c0aa071792mr169699plq.36.1695405132793;
        Fri, 22 Sep 2023 10:52:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902e88c00b001c5b8087fe5sm3784878plg.94.2023.09.22.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] libata: Annotate struct ata_cpr_log with __counted_by
Date: Fri, 22 Sep 2023 10:52:11 -0700
Message-Id: <20230922175210.work.239-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=keescook@chromium.org;
 h=from:subject:message-id; bh=ei96zfUMfrVFB3I3JdJNLz4izHCeTaYCT55cR6z67TQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdRLFoAwT1mCQLgtm1SMCJS/1dZx+seXgkUyx
 yYvrZTRLmuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3USwAKCRCJcvTf3G3A
 Jm/NEACCMtnhoEgknOC6Ec69yaNMsjXyzdjGfPY/uDjWB8+n6l4ZY/abY54yTq6xlFNSbERWzy8
 tTgTWRYZDHWLWFGja0Ov7FyVjLOC4LQcdhbsOu31k8bck/BANRCs2UHtkK5AVLxBnVqZ1zDWQNa
 W2CdnFimXRaOo8wIg4eyi2gKj4pA95HuBP8w4WIzCkuucorP7rfyu5lPvE1/SmwfIf6j89Q2W82
 suLkFQycstU6zebJDhPSs+V0gswuVmna0ifYiKJ+CnBVqQE4Vct/HJKGFxycica7769JXfk3DCX
 /c/MwvwlYinM8lTmzRUjbZVCfPx/mMO4MmSmmIUpl5+BELtQqZ+2TaP8tbJ8gmbLoy4uqx44huH
 +ks/vzrsMA2RdTm4+mZ+qekAIBc7wlp8EG+heSZ7BqKhgulEnhWg0wuKGID2fo5MlQw8+Ax4Vu7
 uxlfbml1ExdKOuuFoD5Iwi8jbQEJYM8fpdArxCmQPCa8MMJ3J9HuCmmX6dtQqQQMS4J9kvDaiTx
 VQVH4SdBkWJTgt96MILMcCvQNVZLXqimqbWvXGQQ1C7QX+CtwPZiOSI/wteKNiWnSUwc2iMLKFB
 p45aN0buN27a4uTP2QaKsutqZT1vM/vbj7jSDTlcmLITJjEBl1uMh8SVnPLEYHnfOJvkWs4kjiZ
 0d4Giey 7//WndUQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ata_cpr_log.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/libata.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index 3c17a5053f00..f91e8e7f1c00 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -656,7 +656,7 @@ struct ata_cpr {
 
 struct ata_cpr_log {
 	u8			nr_cpr;
-	struct ata_cpr		cpr[];
+	struct ata_cpr		cpr[] __counted_by(nr_cpr);
 };
 
 struct ata_device {
-- 
2.34.1

