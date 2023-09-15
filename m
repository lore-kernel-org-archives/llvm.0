Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6015487
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:03:38 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fbb10dea4so2114340b3a.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808218; x=1695413018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EcXc4p/OZvjhpZjniZGrlHnagHBjkD/G1KmRx4RQEY=;
        b=a6i/xyKLuhozUo/lD7SHidxro9RXGQemgejT9y8/46yWCnSSKdBwPoKLv7BxFON1qB
         pdWTRE1aRo/WPcXIsKJbZAgdsNPy903yPH0iY4HRRrQQ4/7s2Xg943HdJ/YKMContgt2
         JmQTLUlxz90qz8nNNMZ1KVX+SzW5XxJmKcRa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808218; x=1695413018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EcXc4p/OZvjhpZjniZGrlHnagHBjkD/G1KmRx4RQEY=;
        b=AQ3jl01tGxT5A1FtaFt92MXIvUBHyLAFNFBrBsC3ADQeGexLBLI60eJsqePNzwCfzm
         WyTdX2ttqZu8Qc/FCQhhp6bK2NeeAOvKzrOGV3YudTE13OCDDZo8r2VwKtX7t/DkF9Ak
         BqZH/OdoXhbhbA4Y739bu2qFJRwRClwpICtP18JLD7Q9r7D1Hfn0XxqeNriyIMg0Fiq8
         4rjBH/ER6l1v/VaKm4os0ousgCK9/paMJ7eZ2RpTmvh0RpR6VRKkMEKIiA0iqNlMT7kE
         z+lHgus0jkDXbBPfqG9xGZnSMK6Qkn6HR1bpKQj1ZZSZzQ9coGgifjOpvgk5vC4rCTFT
         2kBQ==
X-Gm-Message-State: AOJu0YzBHvvbaSYJB+oSVFIvq0XNaiKpL/n1mTDf4yjGQbUPmAUecLpq
	C49xmkBxuw1RYWEQL8Jif5g1vQ==
X-Google-Smtp-Source: AGHT+IHzIIRXAsC49F/G94cgVOd9c2WBf+CMYStzd0rWb8+BhqsZLM2DtQPyl2+9IiDNZBy2vC9pbA==
X-Received: by 2002:a05:6a00:c90:b0:68f:e0f0:85f4 with SMTP id a16-20020a056a000c9000b0068fe0f085f4mr2391932pfv.25.1694808218030;
        Fri, 15 Sep 2023 13:03:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q15-20020a62e10f000000b00682c1db7551sm3307074pfh.49.2023.09.15.13.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:03:37 -0700 (PDT)
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
Subject: [PATCH] dm raid: Annotate struct raid_set with __counted_by
Date: Fri, 15 Sep 2023 13:03:36 -0700
Message-Id: <20230915200335.never.098-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=keescook@chromium.org;
 h=from:subject:message-id; bh=3ZvYiEsZZa56aKWu6y0PnTbRMpo38Aw/L94IEjhb4Tc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLiYTyy1xh5VON0ySJo9kFErTAbQFWQI95vz1
 9vW2hZ7e5yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS4mAAKCRCJcvTf3G3A
 JplJD/9wyOg+Xy09KCd38SWSRoERMIlg+91bNOk9bfpY2aBh3lv91ulrX53nyRunUA02GCG0EfT
 KAEZKI/2vR7K3DBBGzndXE8/eZki/GOdVUVAeIotscDIQCswSFeVrPWcOV3gTKNHmwDOJNqOhae
 PXNwG5Fgv7FNEY68jEyyJq4BJdATKz4lEL2woZ62IGNRNGGyUT3Q6evSPpB9naGIxdq7i7gJLHa
 gmgONPB6bRaS7U+Q5O3fAbI/UjYhNV6MUMaAZ/6yxpkewG6Hb5yTuQ2/YXGsq+XrBOs39PS5vNe
 CQHDFiZIzLg+vEWzFlW91THnSxrlYY2q6TLb0Me7nkxnaPKsKFuFzwL9rq25nET6JP8hINETJqP
 sKfWeuhy321LLzTGS0XNBrP4VFsDkLPcCtHrp7CfWyeiXBKQrr42xZF+wKEuBTjbW0PEgo7bQjl
 bT6fQJjM95fDf2EJQOHoz5ttA5z/PHK5QF973oyfgK6eq7AzwKyj9oFFf4Y4GF9wu+Z/PNq04hS
 D2n58sWCRuH4/7eJMNIl5O5bAZATtf3lObXLRtL5OJXZq58zG/uMp1o40da7W/RtbTMPq3Hc2uT
 XGJPSvkjpqXA3X/A86g6vAHjsFuoJZce8yvX4diqSLCWDA+NivlRwzcXDgEyaPnbMxxonfsAsaT
 K5u/Ioo p9oiGWzQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct raid_set.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>
Cc: dm-devel@redhat.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/md/dm-raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 5f9991765f27..9755788e8b78 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -254,7 +254,7 @@ struct raid_set {
 		int mode;
 	} journal_dev;
 
-	struct raid_dev dev[];
+	struct raid_dev dev[] __counted_by(raid_disks);
 };
 
 static void rs_config_backup(struct raid_set *rs, struct rs_layout *l)
-- 
2.34.1

