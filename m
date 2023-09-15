Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D51B269
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:04:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68fb2e9ebcdso2112186b3a.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808249; x=1695413049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsjobygTJTSQG68McAspsAEHf2Z4NWVTVTdDWk+Khno=;
        b=Nj0QpWuCd6Vjyek4++6hbvXO2q5KbXZT298/nvLLuUBL7qUUJbNf8sQ0dyRy8gcBUa
         87PUlDgsFpzXwZeVxx98pfHyoR5opdVCe8tP7V3T5lKK6Ge92iW0kSg6NVOFzfujLZf1
         pouJUD9zPGoRJEwrDu2B9oATQvBovOUslJksQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808249; x=1695413049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsjobygTJTSQG68McAspsAEHf2Z4NWVTVTdDWk+Khno=;
        b=aMODUq8/wrDUQbdcBpME59hGkaI1tUnBCVQ3hGFi5PPyWSdw6OEdy7I3Jcildw47bD
         0aVx8+jsjjoafZLV1xTb+qQpHK4DW1wJUxup7RAIxs1z8mZur5Y8OEsOAwgDco2jhaqv
         8QdsrLuNWt0G+s8fAwvpDWndcPrKBY01tkGKuAgC0nipVr42uwQxq/RbY6MRcWEzolvc
         8THotDgefMTJiAIPDbxdEGQmFD1a1WA/i5YT+wwUbYt5g2RfiMTQEtuGmkHEBze+RAAT
         XCr/djaET07o13QAzdsb+JJwLfyZO/o4QKtJmBGymnzDPYWH6NKmXdSM1+tLaV2rGdTk
         7trQ==
X-Gm-Message-State: AOJu0YzrgNcv69eM/fG4Ln+rP10J6IAscE1SYw8yvtVUKZ/6E0Fb2h8Z
	W4EKipos9AlpydIoh0ryivIe/g==
X-Google-Smtp-Source: AGHT+IH4sLF8pnQUwMmvWkR2rN5ygHn9iSUnz/1ZVPT8sYwTtd14gWeZ3e+qyvEyDiGNHRPzG6Rx1Q==
X-Received: by 2002:a05:6a00:1882:b0:68b:f3a4:ff6b with SMTP id x2-20020a056a00188200b0068bf3a4ff6bmr3034695pfh.9.1694808249669;
        Fri, 15 Sep 2023 13:04:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78705000000b0067b643b814csm3342707pfo.6.2023.09.15.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:04:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dm: Annotate struct dm_bio_prison with __counted_by
Date: Fri, 15 Sep 2023 13:04:08 -0700
Message-Id: <20230915200407.never.611-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=keescook@chromium.org;
 h=from:subject:message-id; bh=VvKOCdO6PY/NRn1of9dfjjBTN1ZCPOIIRKyzCXPi3Xs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLi3mSrPQ2k1ngorCbl4cZDSbvlJ0xPRobTs8
 GueuwSV7kWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4twAKCRCJcvTf3G3A
 JtYGEACyVAHf3GVlw2Xkm6VuFB0xT82MYq4INcuJ+itoZaCrenWb3tCwhY+fkcq72HKGx/1b+Pv
 OErce1wHcbokBfk0DlDKQjpwTDQ30Gf5+HVA0pmgtzw+RCZpIaLZJlOwEEQCpEPlny0qSUK0yaI
 a1yOASH1d+H1/d9KHywGNJM163u97BQe/p66EQPbo3zI5lr9hfB3USLebN3whqkMloLEf/C/YKx
 mQhVgPhBYsk4XQDWg2qaUl/tPWEreLsObc5Ph5PPVD6lGYBAthn5H4yEqa5aL1Oi1Dcd+k0lmPm
 /otgAB97W1ZqTCSLxt53qsC/0r7xDwRZjAvSAkr9syY7RXz/3ALTkIhufMhLlhyrhWO/GyqE1QT
 lb1UTLNeBeXKoaEkiUartdD4xgOObsF3xCEyX5gIvcSVORT+kGYdd7JcsReF/6zy6db+bj22DwY
 2BEEgGV673w8FiKlgNdKvDLTeSO7JXALYRZAXEA9acesISfNFIXsG0nVje0xKQddBijW1EvXBdG
 H3BJrXpWLA6sppNr8YNdgcYczeF1AsmcHZbr1bjN/p4XGobHkFcsET0KbH1xxp2g2FQfJB0Bfvp
 xT8heKvTGaxyjqe3dVxh3q0znd6p8eHowg2vMIMMimkErAmjMwbC/7t3mSopit/jjHuI7TiZG1g
 iseMwLp rJU4WzBg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct dm_bio_prison.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>
Cc: dm-devel@redhat.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/dm-bio-prison-v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-bio-prison-v1.c b/drivers/md/dm-bio-prison-v1.c
index 92afdca760ae..9ab32abe5ed4 100644
--- a/drivers/md/dm-bio-prison-v1.c
+++ b/drivers/md/dm-bio-prison-v1.c
@@ -26,7 +26,7 @@ struct prison_region {
 struct dm_bio_prison {
 	mempool_t cell_pool;
 	unsigned int num_locks;
-	struct prison_region regions[];
+	struct prison_region regions[] __counted_by(num_locks);
 };
 
 static struct kmem_cache *_cell_cache;
-- 
2.34.1

