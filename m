Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7B566678
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:04:37 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3af5b5d7f16so2311770b6e.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696010676; x=1696615476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7loYy4I0V9WbaRkyDORfpVOvXKBDkMaDU3HmTq6aaCo=;
        b=daaqElSgSvGjiJKIGtJrAJOi7NTJ43i4zHV9SLjwAATGUbERreCW4gHCHvJ5kTpT2a
         0z9p7Q7tulB24CdmlLpgAbYKg0DuKFvuXPryl9ocEa3gE62RydcOni+dBA26fmPgN5JU
         M9KVOvKxjK6BiRE29E97BX0BjWkGlfsStjgJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010676; x=1696615476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7loYy4I0V9WbaRkyDORfpVOvXKBDkMaDU3HmTq6aaCo=;
        b=de9zhBUQwyOPOa1VcvyCL1HQhrPzjL/Zq6lGzq5OviNrrZD6VeIW8DvOsGDFFdeLND
         jRd9ISGunOSiitw3OJ22J+hPMMy7yoq3cRYFouXPIqoQLUGTyjzTOKUKty5shLg2S7ZN
         wXZzSEsFTJnu7N/3oXkwxSf4uKz2gLRTZCj9uQTCraxlbLzeNia96wcpPcx654A9BS1i
         JN/hYhVoV7zdgDRwobGu6tngsLzey+H9ngDGTtZc5Up5I1DgC4/lUEw3554l18P64G55
         iL+p16XNVW3Y4HSCe5OeFuZbEmkRGKStyXjSzbcfNZ855/tlupb2gnFc2l8BQQYtxO2p
         /8pw==
X-Gm-Message-State: AOJu0YwyvlGMkfY2MU0duGIwn515VRVmuLI37Sl/hsLoWiXtG0Rt6tiw
	KcNd1Azo/QVg3GIzA3CnM22zgA==
X-Google-Smtp-Source: AGHT+IFp3QSM5ekw8j1tI8tUgHc/WNycC/Pf0i2hoCRkySu8Sy7s2YFcq9MZ1lU4xH4xRaStQRdeLg==
X-Received: by 2002:a05:6808:18a6:b0:3af:79e3:68d7 with SMTP id bi38-20020a05680818a600b003af79e368d7mr1401295oib.59.1696010676667;
        Fri, 29 Sep 2023 11:04:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k67-20020a633d46000000b00577bc070c6bsm13985771pga.68.2023.09.29.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:04:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
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
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 7/7] IB/hfi1: Annotate struct tid_rb_node with __counted_by
Date: Fri, 29 Sep 2023 11:04:30 -0700
Message-Id: <20230929180431.3005464-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929180305.work.590-kees@kernel.org>
References: <20230929180305.work.590-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=keescook@chromium.org;
 h=from:subject; bh=5+hginCoO40gXVEhDd2TzT5efPqXVR+knLSWVnfU8ow=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxGuDgcPnSEEDSvhCdq3C2vJgb3qdw/LhpW2x
 tim/TyUa5iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcRrgAKCRCJcvTf3G3A
 Jg7CD/9IO6sfIhcdiDAPuO2CKDNVoq4p3SdHoXmM2XBp1YwBoHT7gEwQR4RT3mIzlG0I74nKm73
 H1EX/Yd0bkul503BOk+eormeqtpn+hLrIuRDPEbk8HlrZYFYWvVNa8D2yREVfyds3CgOwE6UyXc
 aSMx//AL8Z/qpDmeqBlbNL3O7OK6ht9K/mK42LORZkAY2hzmq0WV4kXhrC4PlektH2akmXS5DGj
 wlAO77pgLRGhcEKrZmaPjMsGzh7bZQ8houJ4w45ShKUjDBRQZM88fq4pbM8ImffIF2X0VUTXa8Y
 09T4SWVZEMw8sEudVJrENBXRQNVGyCNnhLA7UYvmfVX4tu7PhZOUpUpEQPy3OiRIFRedVNs1DnW
 NJ4fSKoAyJ70B8mH6FuSf70jLl4QpvpoFrsVzCYqLrYyMd6KLqEp8LdtoN/BR5NTtZVusEHHeuK
 6klHggoNRwySEq5Vx0C2HRXgbtytwRw+9wx+62nvwql58uSwlMWbkRW2pipsMK0VFMf4HrM+DZL
 plMPJQ5nI6HHBKsq9E9A4u4Q+EXFpmiMlhxgVfHlUWxmDUhKAevh2CY7xXj8qOBqh9CA+6KWM8o
 EfcCi4Zo4YfCzhn6C6lTC6EHSFNVRp42NhaUyL4yADcXaSwX2WpfvsaYkzZQGYOy7O8AMn4zzEM gPF6o2m6oJt8Efg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct tid_rb_node.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/hw/hfi1/user_exp_rcv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.h b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
index b85de9070aee..055726f7c139 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.h
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
@@ -36,7 +36,7 @@ struct tid_rb_node {
 	dma_addr_t dma_addr;
 	bool freed;
 	unsigned int npages;
-	struct page *pages[];
+	struct page *pages[] __counted_by(npages);
 };
 
 static inline int num_user_pages(unsigned long addr,
-- 
2.34.1

