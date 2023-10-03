Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88F23C9
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:25:17 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso1114519b3a.2
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375516; x=1696980316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WklzNBegPgB5uEE+/qy7qfvk7e8XBByJu1huJ3exKM8=;
        b=a4gQzhGf+IHNgyJ9Qz/foERA1rVQULLTI9/pPvTBA5v8PTZSBFZqitYQodBCoSTOWO
         KAL6gTBKjRe/k5VE0qJ3ArklW/2eiAyGJ2ZCgp0fRnl5pVRm7ZXOg+YqRuJEoBWqFDLr
         AqcU5ifyHx0Gj0l4dv/0nhGB6GwGs3NopGR/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375516; x=1696980316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WklzNBegPgB5uEE+/qy7qfvk7e8XBByJu1huJ3exKM8=;
        b=MPs7tPi8sMvHhMfNQX1pFqRWo1ptu/1KoYhN63h9+Zx1lrBzj6IfdaA6yC/eXuXW+2
         hrlRN3PMfvwGTD+F6IPwbUyPJ0feLj9smAdDTdfcn+aa3/MLzQP/kvok8ZCqj+2/vADU
         9srmcPJXPBgVOg4pf7NgACzGpOrni5FkUlUAUmRtWLFQ9xbWHXSb3l6OjzSDhrmWlKHi
         FLnzkN6MdN/KGUje7VxmAj8iuJ73/cBLWtSM5TY+U4e9IDV+7a+pSRSHp39IFRGks0Ge
         wtUWjCdGYbcLubiO40BDfW8pISKyBVNMVKk5n9mb9UHNy/RfqxZHV2sFHk2/mv7tAqqy
         WMow==
X-Gm-Message-State: AOJu0YzJCj8IoVCbNHMf8HIpHifFUB8SVwmd6j/j6C1eUgIFX9zRJIMt
	7sAr7+7N9epysTSGE9q5+bCsUQ==
X-Google-Smtp-Source: AGHT+IFl++NjbnmUViIRhL35xEk4qT1W55vhw9500eQEtSz35fzgRPo8LMRfK60rOfBTWrFsvpIK1Q==
X-Received: by 2002:a05:6a00:1592:b0:68f:cf6f:e212 with SMTP id u18-20020a056a00159200b0068fcf6fe212mr945019pfk.20.1696375516672;
        Tue, 03 Oct 2023 16:25:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d8-20020aa78688000000b0068fece22469sm1911902pfo.4.2023.10.03.16.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:25:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: James Smart <james.smart@broadcom.com>
Cc: Kees Cook <keescook@chromium.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] nvmet-fc: Annotate struct nvmet_fc_tgt_queue with __counted_by
Date: Tue,  3 Oct 2023 16:25:11 -0700
Message-Id: <20231003232511.work.459-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=keescook@chromium.org;
 h=from:subject:message-id; bh=ByABuAYNlIfLs+7c20JDBpw/8yvTeM5CPvmgxbAXfYw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKLXpRHdUq+lFLSfO9gJWqiFNgTu8fSB9J2BJ
 zZ8tvEohwaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyi1wAKCRCJcvTf3G3A
 JgoeEACsVLmbCD8bMb+riXBw2TqwsW891pJ49jgwyOXsxUB/C3ZZ7ENjEQN6LGSkaLdqYzfmWwi
 YDaW6EbTBn5KcSU1Hw4F1S2hC/yfbryopBQFy7UUPJ1h97vHG1WklXODb15HTcpXnqdzPEExmFI
 2XHy7Ynrdw038ZEWiX437eAzH5XQ6D+7IiuBD6qIBDzeXsD6/bfd+vuujGpp7IhVhhhDuEKxeW8
 xte4TTr+fKEK5gpyPsViXn0Om67AzEfyUzWP9jm56AzQ44uFSs/BaIvbDhk4pCkaExfdjsLn1hr
 TnQLubChT6GFHgF1ibh3aQbAWU8JvDFhf0hfOjFO3HaLF0QpoAzjTyfC0LJjZq90mWYCsbujmT2
 fB2KG03D9y3Zx8RiEvhC51j18hMf+2VF7qoFhtccckeg48gvmFTFgwUtuXwiM1xQB1YfThnFj+o
 DH71gvobUcMNBsnE3QIGtog5q6ctnfm3DnLqskdz/HRisn521b6p8EHKrt2f7Ue1x5XfYDQc5dG
 bog1lOJ/LORrJEZs/cd6yndXzT6vd7boBB5i51/cwGXbSlSA/qTBo4c1Qlhv0U8pJPplNY5ZSx2
 jyZXfX8030a4B+JGxqoaiUJjYqySNBjwHDUPVdQA0BmeUkDgeQ3HHlTErvAlLJMwAf9s3Sk+VXC
 d4vCaB3 AqjDvhAw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct nvmet_fc_tgt_queue.

Cc: James Smart <james.smart@broadcom.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/nvme/target/fc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1ab6601fdd5c..0fa2d658cdeb 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -146,7 +146,7 @@ struct nvmet_fc_tgt_queue {
 	struct workqueue_struct		*work_q;
 	struct kref			ref;
 	struct rcu_head			rcu;
-	struct nvmet_fc_fcp_iod		fod[];		/* array of fcp_iods */
+	struct nvmet_fc_fcp_iod		fod[] __counted_by(sqsize); /* array of fcp_iods */
 } __aligned(sizeof(unsigned long long));
 
 struct nvmet_fc_hostport {
-- 
2.34.1

