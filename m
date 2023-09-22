Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85774446B
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:02 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso2045785b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405182; x=1696009982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9ccZOV4wJXlK1yFnxfHkMmpmm5GjHprdns1OiYQeHs=;
        b=HcAARaqrNzck4nFyYG3VCYNmwNv2lHtDo6A7LR6IiWWk/gYZEk4pAN30MfrNgS1y/S
         wUg4JItp1z+7aDQOa6l4oYHChvU4cAiUDMELL/tci1A9L9XVMx06mnZxHtuO7zi2i8cU
         TF9muYzsJsDDP2LDmi7U3P/6YOxxH6xqm+V9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405182; x=1696009982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9ccZOV4wJXlK1yFnxfHkMmpmm5GjHprdns1OiYQeHs=;
        b=sV9NMcw2TdDo2y8/ZDGI/BUB5uu6kPz1dKaOLpEnH+W2gDzQXuAcjqgnTA2gaJKoBo
         C+6My2903T/52UCS2xw1GJG6G2and2gyQVJuEvlHBmfBuGIS/pIOyPnEEP2jYJZ1We9l
         nlj11Dcj+CWPAph6P8Wjid17TKPH7E8rHVJDkqia/EuFXWAy8Jqeho1jGKUgsG14nuz3
         9MqSM19vFpCJY2auDbqhGC58ftMeemthxceUC7Dpddm6wL6rQu81mF4tibfdWLKgz3Tc
         iJVWbI3MZU4PUS+yhMgsJLqXEIQJB4XgcMdyaKTvyxHyqHoBtW9Aj5DgJPAy7/vae4av
         v7Jg==
X-Gm-Message-State: AOJu0YxrA12FiIq+8i20KMqeAk/s0uepsBWWFBOvz426v7owTcyEgogA
	PDJm57JHK/ErO3le3/tkn96/jw==
X-Google-Smtp-Source: AGHT+IGx6FFwhNIDtiz3Eh6ZVJ6C90R5aTRutPSfCddx1UXArpxi6YrkkUJNEQ35olAJkHw3WYli7A==
X-Received: by 2002:a17:90b:4b41:b0:274:24e2:ae6d with SMTP id mi1-20020a17090b4b4100b0027424e2ae6dmr488925pjb.0.1695405182538;
        Fri, 22 Sep 2023 10:53:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090ade9400b0026d214a2b33sm5282306pjv.7.2023.09.22.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Bodo Stroesser <bostroesser@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] scsi: target: tcmu: Annotate struct tcmu_tmr with __counted_by
Date: Fri, 22 Sep 2023 10:53:01 -0700
Message-Id: <20230922175300.work.148-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=keescook@chromium.org;
 h=from:subject:message-id; bh=FcaqXSByARe51bzBFiEiVh2BnnpT/BBlX8W8UQ0HgHI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdR8Qv/J3bqK5P7cmRhrII3B2LZASbyQAyA/V
 nNid9mBmhqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UfAAKCRCJcvTf3G3A
 Jro0D/9SbPtkx/9xM7Efr9UP/3joE2Y0lZEmWygmLAqD2wmplBii27xBBzcka9Uvlq1eDy6NPZz
 15amMxCkOxtoyTUxf2LYIBBwp8oQciqljhl1QavRXe6Kh7TQ5k3iicvPs6855GbkvKedFiZwwSj
 8yVK+Kr6dThjxAuB13jJJiG4GSLwNNY+aR/xd8mO8IRggrA6HKthh87050we6/xUIirr4NrP/as
 mj0sWZWn23E+oyDlEqYo9LfcWXK5wF1fufUtJI7gM3HGbno23z3KZj40UinLjjpWr7/+X3cuKqi
 tl4tAkLR4l8pJkbeae3XBKfldgCSlup5ikSsrs64Q9vizG2VDolJqvqsEId2nRDMq/jOPOEDj5n
 wC5TsygAg+uTkNInLbH/YrYCiQxS8GfDi1meIX/9fP+QYrUJZK9VY1NyIYNf6NKbOIn9J8pH1Ck
 nK4NzEzQ2JQxslkNUbKHZh+yxC9Hh3zGUXQufo+VPvTcj12siRravIlT+3aBOptBWk1Q4EKButa
 t2HY95XpdBSlIKQlWz5RfDhuBaJ/xSvIp8f0PFiHikB1k/wnh44KD50Fg3P7KznK8wt2u4CUJ25
 RU94tM9ytkUe0+jHbWeoNyE7yQF+VEqUGzugtV1DbEKOQj5A+P7rta6k/V+eddKflkPR4geULkM
 JLgPdRk HsTcVXeg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct tcmu_tmr.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Bodo Stroesser <bostroesser@gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/target/target_core_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
index 22cc6cac0ba2..7eb94894bd68 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -201,7 +201,7 @@ struct tcmu_tmr {
 
 	uint8_t tmr_type;
 	uint32_t tmr_cmd_cnt;
-	int16_t tmr_cmd_ids[];
+	int16_t tmr_cmd_ids[] __counted_by(tmr_cmd_cnt);
 };
 
 /*
-- 
2.34.1

