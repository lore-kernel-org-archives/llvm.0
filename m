Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF1C2C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 16:28:04 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id d12so16273222lfv.6
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fa7Z6nglF14QRStQgbgptF1fA20fCaVRUV/pNu+eqLM=;
        b=EKRe7n8ax5DNYYW6YP/lIzY6bHmkK1CRdjLwWq9BPWIrnt06mK03oOdDdS+NkVWG5L
         BVmrmKlTGeZsn9Gy3h+aZgJkc35JrlYirDCw3yykztrp+jWD6XFXYDJn2Dco/ikfZ8/e
         dO6XwL8FtbJuNNRatSNT35fU3PGY4iQITkUTKUl1GqicrYG/5kU2nXS0HReaf+C7RRpx
         EOUF9aHCA6gCUnAXIp1ztXYDv7koXGK2/G7FV/5IQMrqvdTXmV7aIhGTBiwpm92w2YV5
         RbaqdsNwoLAZ1gNw+yUGwrimB5uisck7N1SRSPlQWztE9q9C7j5nH/SK/kS2x+MyLula
         ELcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fa7Z6nglF14QRStQgbgptF1fA20fCaVRUV/pNu+eqLM=;
        b=umXc7okT/q+QeNjZq0rR4kDIWrdcbz/aC/CmLHM6/QLyorM40EYXS6FsQI1JflbMk8
         wbNI4K9jRIt5eoGjYL1vpRRr68Tt07r4cA26PByNM1CvSyxKj1e3gYcrPxFZIQDlKzbw
         qpSRT7DnjyoUaFSwk/mRsVpFSZb5mVGVvp68740CTREVrZcavas+QGO+91rPN01FRGAV
         TwB6MxKTpTplI/WxJc4U1MXkBLx9TNP64d36AW34wnTNi2OjDMI1GcjMRU+CZJLwD1c6
         UxQY26XWp0Fb+upKGf5Dg2axleSKK5WFEUdG9yYkxweUyfa8qT985+ZMnRcnpvJLP0u5
         Cd/Q==
X-Gm-Message-State: AOAM533+SoCDihotzE8Q1J0ackRvxRCCbkfkpE2E+70a2k5zqha+4R6j
	rnrNWhd3PRxgtQfpW6+MPzzOn96mYSWU5Q==
X-Google-Smtp-Source: ABdhPJz7gvTwzAM6Evcf7owRlQfpCs/L3f/eIxh6EHcbCdoD14bk1rQyi+Kz0k127+E0BVXJXkWsAg==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr51578864lfq.192.1636129683115;
        Fri, 05 Nov 2021 09:28:03 -0700 (PDT)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id p12sm872557lfa.265.2021.11.05.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 09:28:02 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: shuah@kernel.org
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] selftests: vDSO: parse: warning: fix assignment as a condition
Date: Fri,  5 Nov 2021 17:27:56 +0100
Message-Id: <20211105162756.3314148-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building selftests/vDSO with clang the following warning shows up:

clang -std=gnu99 -Wno-pointer-sign    vdso_test_gettimeofday.c parse_vdso.c  -o /home/anders/.cache/tuxmake/builds/current/kselftest/vDSO/vdso_test_gettimeofday
parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
                if (g = h & 0xf0000000)
                    ~~^~~~~~~~~~~~~~~~

Rework to a parentheses before doing the check.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/vDSO/parse_vdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..b47b721a4ea4 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -62,7 +62,7 @@ static unsigned long elf_hash(const unsigned char *name)
 	while (*name)
 	{
 		h = (h << 4) + *name++;
-		if (g = h & 0xf0000000)
+		if ((g = (h & 0xf0000000)))
 			h ^= g >> 24;
 		h &= ~g;
 	}
-- 
2.33.0

