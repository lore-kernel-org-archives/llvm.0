Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D67E66663
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:04:33 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-692eed30152so7980638b3a.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010673; x=1696615473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/QLRqHS2L1NZ+5Mittg0t9KUpHsT5gMIELAAOGClyI=;
        b=oTw+7kBstV1X5qtZnrNYtr179RZAMXzQal+9GypKJD24/zvKNEz9xvE6DciPAj9I/7
         WFeEkRQItuibp18W3lR/kv1PbFeQhBUMp8RJe8AT8F2Ryu7rBwk9ogh6QU+sxE2BSg7k
         x+BIivwMvlZus0dismIDYAUZ8UE+c3aj9zoO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010673; x=1696615473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/QLRqHS2L1NZ+5Mittg0t9KUpHsT5gMIELAAOGClyI=;
        b=mKMsHNPKFBYnhTsDgcjabFrfG9oaJFR+prR/3aHOyJ+t5pNynD4hUWYzeDOnEET+Dp
         76JqTBprJBIZPrlnKDkTT4V9h/Pg3Q/7K3IW5qw8ByIwEy9hk9TGFUF3EHDGltH0fF3/
         LMe4fFqkuVEUnfQWciE4nbgo9YZv7ukI2eEUT7pWIy5CNq4tj5+y/bV8XP1m/5k3IM7O
         nAU7eaDy9uQ/ZmZpgODMLzD+KU2+0nT60kAug1sSHALS1JRMx1qS7h560VKtITb/w6m9
         wBOCO6Gd9IdhzwmnBLVfzIiOCeLiJh7nPnU+37aCs3M+jmhK49X0XuRxpk3xLbVycvd+
         AAEg==
X-Gm-Message-State: AOJu0YzUOLEifML4EpuhQtnhFSPbCk4ppG7ZFCVcph5d4HWKwek7CstR
	BZ5gJggqGK90zEsCGkNcaHIONA==
X-Google-Smtp-Source: AGHT+IGac3Y+OxZ1Rfapit3zv2uDFcPVgfD1mFi/owGzR0eAKACpnMWPiW7mh4tp2DCOwfeg6BIUyQ==
X-Received: by 2002:a05:6a20:7d92:b0:15c:fa48:2c09 with SMTP id v18-20020a056a207d9200b0015cfa482c09mr6069263pzj.15.1696010672901;
        Fri, 29 Sep 2023 11:04:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gp15-20020a17090adf0f00b002790ded9c6dsm1743374pjb.31.2023.09.29.11.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:04:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Leon Romanovsky <leon@kernel.org>,
	=?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
	Avihai Horon <avihaih@nvidia.com>,
	Anand Khoje <anand.a.khoje@oracle.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Christian Benvenuti <benve@cisco.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Patrisious Haddad <phaddad@nvidia.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	wangjianli <wangjianli@cdjrlc.com>,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/7] RDMA: Annotate structs with __counted_by
Date: Fri, 29 Sep 2023 11:04:23 -0700
Message-Id: <20230929180305.work.590-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=keescook@chromium.org;
 h=from:subject:message-id; bh=/4LMpXENw48q7fWMpYL2O5Uv9CCph1q6zJBZxS3OiTQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxGtfNnwAB6/IhVqdJxC7ZgaTcIkDx4p62U8K
 94/n2sAm5mJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcRrQAKCRCJcvTf3G3A
 JrPDD/9G/FXBBVcXylRtWq4GKt0j7nGB3Sb1K6AcSlCVxVFBRy+nxwfYQQZr4xtXxsWvyMHA3GO
 an6tniLg3oW6KAqeWlyoWTPCgAB03CJi+G+hDiHHCov15sOhpiT+456fNXINz4dWnuT1qjDocWu
 qVgb/JbcWJ1yknRDBwLxZj8BxmPFaaI0fAk3CBQ1uQGoIuXnpCcwPc3K4LnXUr291JEhvyG1GYm
 3AoB/bQL+pdZ+iiLJ8Yy/zYhFRiaJJjemNfx4dgeoeVtFYw/5lBL12b3cig48nQ5OYmhzuKV6DH
 J+ivtBBRlahSdgzv3pA7WYfvof4aT9lQPMFU8DAhQwTPxyBIQBQGJcmO6kpVvOYl/RV3fMyaG4O
 AHoNT3KByS2bpG0ExZn6Uudg9PdpU4oZDnBycx9eyVau5Fo5w3iNBmOaONQqpSV8sm21McFz7bc
 PlWSe1ghKr/6+gz6B7c6xuGI5XUCPAgmfeoZK0ImUfSKKq4dMNZQgXsbUKst/+9wQuU6Xes3YQo
 Th5dJxMb43142TKmxCpqx3Rjz4V3QoMFZuIzOmqjdgLuZ4/h/zPhD/7BIsty0C49KtvuHqctwCa
 6mxhmeKDdB6fYNPos0YZ/L7sWYNIQGJxNq4XbGnQijtT1dR331wWDNTg+3OFKZr5O6Et2PaYOjJ
 nEyQXsh KrnMXw1g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This annotates several structures with the coming __counted_by attribute
for bounds checking of flexible arrays at run-time. For more details, see
commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").

Thanks!

-Kees

Kees Cook (7):
  RDMA: Annotate struct rdma_hw_stats with __counted_by
  RDMA/core: Annotate struct ib_pkey_cache with __counted_by
  RDMA/usnic: Annotate struct usnic_uiom_chunk with __counted_by
  RDMA/siw: Annotate struct siw_pbl with __counted_by
  IB/srp: Annotate struct srp_fr_pool with __counted_by
  IB/mthca: Annotate struct mthca_icm_table with __counted_by
  IB/hfi1: Annotate struct tid_rb_node with __counted_by

 drivers/infiniband/core/cache.c             | 2 +-
 drivers/infiniband/hw/hfi1/user_exp_rcv.h   | 2 +-
 drivers/infiniband/hw/mthca/mthca_memfree.h | 2 +-
 drivers/infiniband/hw/usnic/usnic_uiom.h    | 2 +-
 drivers/infiniband/sw/siw/siw.h             | 2 +-
 drivers/infiniband/ulp/srp/ib_srp.h         | 2 +-
 include/rdma/ib_verbs.h                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1

