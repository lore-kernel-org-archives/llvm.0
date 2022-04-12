Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DC1FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:17:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id o16so19038489ljp.3
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5xKeCB3U7apfcgfSY+vdVOqKVo2uGRt41JWYEZNVaok=;
        b=ICm9HArNM3EaOT0Oy+Hp4+JHSlkM9BUfiQxOw29OrKcAogUAZos5svailFbnu+zweO
         Axva43yl+erT/kWI85bljmW2MMzuGQSSWPRguz8PneqTZjybaO/2CPuSoS/DXiusBR0i
         D3LawH5Q0au8ap25HEm1iYZA6/eUJ+ToouDaB0EPJgid8aYyyW5JdVUJCCsLhv55iNcd
         jRxnG4gFNYuW7ut0wGdI761mxoZ3Q6CuX2YKF5hRjqvjdYDR13DQZw6ME5AYd/SBB34E
         D21t/iOgPI+CF9dfTfz9nONQUosEpZG7dUVnoAtfppHO5JmqgDMXM1g0az2R98J93JvY
         ddYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xKeCB3U7apfcgfSY+vdVOqKVo2uGRt41JWYEZNVaok=;
        b=lH3Q20GydzYir7HoWdu1VQ2RGZZtRT+m75A+cWOoGPtv5TI8vj+wPl82/77l5M8w/y
         pTkJQa/xD7B5fLkPemilsmavcP93wEKOri3xVe0SURDdt7UCU3ZBICz9yxtTALzsY9Ec
         SMjPc7krTNTWiCPoqwlzsIfBYH25tfW8YhkiUTYZJqFX4sXXJPE4s5xnA5NyPa0on3nl
         5+3Agub1rX8n07xfywNxbdzdYwb/W4SVhfhpcHYHcc19XRWndU0S7qe9H4/JLmUmv7Pv
         UlbDS0hEqjYB4UtkM9us1+yGzYop3jfinhN/+yB5aiDydm6ti9/IgsWRF4Pq2rVQBvpD
         T6cg==
X-Gm-Message-State: AOAM530cGo7bsJOiYA+lptSrqLxOyUh/HFyCbabtBA4UUE7zH+6oW+xI
	Vj7Ef4eMaCJ3WuvOJNjgKR4=
X-Google-Smtp-Source: ABdhPJwzGv0nlFwbb55xRO4/KxhQwo/cOSvqirc1RdTO64DIM0LyoWHyRNiW9KEdEBRXKJBoH+d4eg==
X-Received: by 2002:a2e:8912:0:b0:24b:57e7:284c with SMTP id d18-20020a2e8912000000b0024b57e7284cmr11258357lji.147.1649783840258;
        Tue, 12 Apr 2022 10:17:20 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0046ba665cd6dsm723928lfq.141.2022.04.12.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:17:19 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: "Richard Russon (FlatCap)" <ldm@flatcap.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-ntfs-dev@lists.sourceforge.net,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 5/5] block/partitions/ldm: Remove redundant assignments
Date: Tue, 12 Apr 2022 19:16:51 +0200
Message-Id: <20220412171651.19812-5-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412171651.19812-1-michalorzel.eng@gmail.com>
References: <20220412171651.19812-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of the following redundant assignments:
- to a variable r_cols from function ldm_parse_cmp3
- to variables r_id1 and r_id2 from functions ldm_parse_dgr3 and ldm_parse_dgr4
- to a variable r_index from function ldm_parse_prt3
that end up in values not being read until the end of function.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
Changes since v1:
-move the change into a separate patch
-add analysis
---
 block/partitions/ldm.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index 27f6c7d9c776..38e58960ae03 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -736,7 +736,6 @@ static bool ldm_parse_cmp3 (const u8 *buffer, int buflen, struct vblk *vb)
 		len = r_cols;
 	} else {
 		r_stripe = 0;
-		r_cols   = 0;
 		len = r_parent;
 	}
 	if (len < 0)
@@ -783,11 +782,8 @@ static int ldm_parse_dgr3 (const u8 *buffer, int buflen, struct vblk *vb)
 		r_id1 = ldm_relative (buffer, buflen, 0x24, r_diskid);
 		r_id2 = ldm_relative (buffer, buflen, 0x24, r_id1);
 		len = r_id2;
-	} else {
-		r_id1 = 0;
-		r_id2 = 0;
+	} else
 		len = r_diskid;
-	}
 	if (len < 0)
 		return false;
 
@@ -826,11 +822,8 @@ static bool ldm_parse_dgr4 (const u8 *buffer, int buflen, struct vblk *vb)
 		r_id1 = ldm_relative (buffer, buflen, 0x44, r_name);
 		r_id2 = ldm_relative (buffer, buflen, 0x44, r_id1);
 		len = r_id2;
-	} else {
-		r_id1 = 0;
-		r_id2 = 0;
+	} else
 		len = r_name;
-	}
 	if (len < 0)
 		return false;
 
@@ -963,10 +956,8 @@ static bool ldm_parse_prt3(const u8 *buffer, int buflen, struct vblk *vb)
 			return false;
 		}
 		len = r_index;
-	} else {
-		r_index = 0;
+	} else
 		len = r_diskid;
-	}
 	if (len < 0) {
 		ldm_error("len %d < 0", len);
 		return false;
-- 
2.25.1

