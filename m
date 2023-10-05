Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047CC30F93
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JKvhewLw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c6219307b2so8278305ad.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696522455; x=1697127255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xBF/uFJVvJ7YTUEt6WwDwwpmUQaEEUWvnNqj8YdJfwI=;
        b=JKvhewLwaB3+qQsOuHKD6GFY4M9BpoKv48c20onNntVyDJXokbogSzS9CsOa/lQjUV
         NuSJBxmmxuNOdkwI3IcJCCdztHBtgU3EiqQeS9//+ArFXT/EaM2oX3UikzoKLw7jc8w5
         1MtsiT7GHZoLno2ePJLWl7yv4cjKPEyyBcS+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522455; x=1697127255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBF/uFJVvJ7YTUEt6WwDwwpmUQaEEUWvnNqj8YdJfwI=;
        b=H4XJj+I+IkOEsqANQkV5+gTY6alLEiIV0QeSbS7ZgPTK8UxBcTc0J/xCGDtbTemDTP
         ialTQI27sdgVoy2ZBdd9qIkYRTtfFkT7pdtqBGVi8U5JA96chLyaBW7dmZSj6lp5onMK
         glsKguMfO1J3GufsxO/eo9mNy5Mx5b/SOs15ZhNvi+iRVnOnK3dfx2FE85UKSwbiiYox
         59GTfT3X8o5sqlcbwBpIFCkwm2WNcUZpS5nw4f5o0BaJDNwFFwQ5ZHL9HQC1aE1EUALX
         NGthH1xd9WMInNH79SEsk0n1Vbz1cGbTOrFbvwtP7ooAONPxZedgJLuZV/Bl68KGg3FU
         YFFA==
X-Gm-Message-State: AOJu0Yxo90RwegdeoT3xyN667QtD3wNrVbyN/ETMIIZz1PI2BsDKkfwy
	rRjM0w7aD5PYu88uv/dQt8HgDg==
X-Google-Smtp-Source: AGHT+IGEiAWvdJBH7vw0BMgCGCiF3Mgfn0JsxTp7iLsTYooxV9aBdAbTG33uN0QT0rwuirwD86o/pA==
X-Received: by 2002:a17:903:110d:b0:1bb:d59d:8c57 with SMTP id n13-20020a170903110d00b001bbd59d8c57mr6223640plh.18.1696522455224;
        Thu, 05 Oct 2023 09:14:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw11-20020a170903044b00b001ab2b4105ddsm1908267plb.60.2023.10.05.09.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:14:14 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: James Smart <james.smart@broadcom.com>
Cc: Kees Cook <keescook@chromium.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] nvmet-fc: Annotate struct nvmet_fc_tgt_queue with __counted_by
Date: Thu,  5 Oct 2023 09:14:12 -0700
Message-Id: <20231005161408.it.584-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=keescook@chromium.org;
 h=from:subject:message-id; bh=/lvW3aKbNdffAyIzlZf6gptKlwtHFiNZjl+aiSSruKE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHuDUOvSUL7xliWcJbrUDOxdv4EUfSnKX5nVYU
 HaIdxE+uD+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZR7g1AAKCRCJcvTf3G3A
 JiKOD/96Q3m/bw8VJQ0KeM2IuPUQ633i3udn5aE3jXFjW+0sbngxXC3XfZhjBPWqskqZeuFQt/7
 C79xRJkXdJad1LJ7YM24WaCnCt+fl97aXOTe9PxxPcb1AcG4vXEGxDvTbNYMLjs8FHj2xqM1YbW
 Dn8wFtBa0znQB2zkit7kGuGEK08HMpZWo9wau5NjzVRERVhH69QRP1XFBi/cyj9ipeOXNK2wsue
 3xBl9/iAexBwfkye17sBM7Tbb/63Vc2tK3VPlS823E7C7v/ZMLL5fRI71scSzDrEJPWlixjK6Uv
 Hwh8dFGSftd5OxMzHhdhZ7QgnCUhvY+q/+6fFjSVDfdYRQ2l3cvFoxxmPh/pKjzj2/CUXCmMCf4
 t01h2bm1zOWaYPqcNG1QcbkujeaIzZ5urnIPANLs7x4rtJ3atmjqBmsdVrtMIPR8jT+MSoWnYlh
 1vHZJeMPKspJrVFDFTUnI0N9CW5yE3ItLGWxYdWQ5g4gnMg1ZadPqj/m4zL3lGZ+mDeUD8cZaC7
 bLE1/1rvg/yhBuLIf/9b9fP2P0eobnoGNccZYVMn7Ca8IGMViNPrd0lV72V9U4mV4blRV2JXAjH
 Q2vFfDlimFZqEizGr9sC+SD368iX6rnr4xv8yXJOKnlr8wcYt20VBySEQfjg4aKu43PgU81/X9v
 guQwQ4r EcbVCq3g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct
nvmet_fc_tgt_queue. Additionally, since the element count member must
be set before accessing the annotated flexible array member, move its
initialization earlier.

Cc: James Smart <james.smart@broadcom.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v1 https://lore.kernel.org/all/20231003232511.work.459-kees@kernel.org/
v2
 - move comment to line above (hch)
 - add reviewed-bys
---
 drivers/nvme/target/fc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1ab6601fdd5c..bd59990b5250 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -146,7 +146,8 @@ struct nvmet_fc_tgt_queue {
 	struct workqueue_struct		*work_q;
 	struct kref			ref;
 	struct rcu_head			rcu;
-	struct nvmet_fc_fcp_iod		fod[];		/* array of fcp_iods */
+	/* array of fcp_iods */
+	struct nvmet_fc_fcp_iod		fod[] __counted_by(sqsize);
 } __aligned(sizeof(unsigned long long));
 
 struct nvmet_fc_hostport {
-- 
2.34.1

