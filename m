Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F944479
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c44c0f9138so20988895ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405216; x=1696010016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ESOLZsY8LzKb8U8Ne5A0p04ejS/jT09yNraZRlcFPA=;
        b=MYTLZZ+54sHU+7+BDxcYkO5Zd9H8tOEpnREvYp3tyRmU3i4GvvYRqXov8bPsZDG9wq
         xmhLI3V4k8VS1WVIUBEqm0zmtMMt1oi0/Bc81ihiIZ/1pRtBCCXayzfvlsXM+nQaHvF6
         29refvWPq44ainv6yuzhE3DUPrbtRGgcymOHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405216; x=1696010016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ESOLZsY8LzKb8U8Ne5A0p04ejS/jT09yNraZRlcFPA=;
        b=eNrIU05E5CYvQfrk080JQYHuxpIARqmos9EmzTojE13PeheVdRIksg2o1+OlYEzCE1
         T25hTDvFSQ1U/7wFfo1tuFEfMYZFXHzeX2CypNB1nbX49hkfSVnvL5dhpX7dZjAO2p+Z
         lkpUiZErOXJe1G+pjqLzoRFPyZ3kzsQCSa1zaIyXs6+ZKfTpQ4aP0H8rjjqgN/NGcWOd
         XPIp1gw7Q5AvEwZzqLRrcXyTVHrWLsGb1YFOC043LPluMJzAP7iofiBJYsI/ww0hqZnK
         TyQYmolifvARceqLtuhI8q+EMcIIGAdE2jFrbIwIm4cQojOm8JcgRxm8cR223Al0xe/l
         ERGA==
X-Gm-Message-State: AOJu0YykDaSpn4PJHAIzWpzXAoJF9x8QDuQRBZRiEMRQmUSubS8RouRC
	745iDS+FCGsk1C+csJPPAhvODw==
X-Google-Smtp-Source: AGHT+IGA6b1K40k8NOZBF7/MYO6Cl8Ivzqv96Q9v0Q5p74UYCloHq1IDltxXKSseH3rgQcC3dxPQiQ==
X-Received: by 2002:a17:902:d502:b0:1c3:1c74:5d0a with SMTP id b2-20020a170902d50200b001c31c745d0amr257725plg.34.1695405216432;
        Fri, 22 Sep 2023 10:53:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001bfd92ec592sm3753380plm.292.2023.09.22.10.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Kees Cook <keescook@chromium.org>,
	linux1394-devel@lists.sourceforge.net,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] firewire: Annotate struct fw_node with __counted_by
Date: Fri, 22 Sep 2023 10:53:35 -0700
Message-Id: <20230922175334.work.335-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=keescook@chromium.org;
 h=from:subject:message-id; bh=9IvQGv8Ld8cTigYPfagXmK/WvkbkZXS8rrCLNOUMCoE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSehVrabBM4sbb8Z4pDeRCLv7o6lEF00+KVr
 vcvgJtKuoiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UngAKCRCJcvTf3G3A
 JuXlEACFIcVdQ5RlHQbHTtQ9ay043utxenzIISiQP52aJ1w0fcS9QwkUjl+2VobSgaeZFhUOom6
 lna7qmCRDRlUXlUYueUdesqU/mTityiOfmh98rYxQ9tMcwjxBv7IE8OC774oB5lrddTA+gRAxFe
 C+SfcSmcI7TfXTifFKKrxJ+k55lPP8foiB7pEDF7PMdLYFwkNOHdFbQbkjcwnMDCDumGrChUN/y
 +4arvqJVdo5mIiSAZsmTrTVbg1cK29YkvuftCM/ixlCqo3zUKR60DfJETE+hcTM7ltzTz+UOsmR
 XuQnfP58J+tusioqlbfH0OZ4Kgfi5f27RQaH15DIxflDKR/n0OYMY3D3I1mWt0qIiV5TUT+EjWd
 CO/Ek0FD2yBgyk64xjKr5zQjdPq8lxRGpfT70KVDXAVUk6/qhb56XBZbnPFvviBS6kiaJut3Ojk
 yV2JvVclR+1hRNc9Czfd1Lx192tyn0TdkNSz7If/qhmuPoiPy0lo/lmrEk6icN5lYm2dSkM7ZBZ
 OIry3h7lFA3Uj/Xvh0RwrKay5IOCfhcPsvCxCvtib0Yy7qg/R71NGva4LDmd8fTpOCsXpJbpYjU
 ki4IL/FwzdYkGZvMWs7NZfbIwdP2uokgxuLxmpyDH/UJLF5BamS2Lc8JTKxs1r1vR8XOskV11qg
 9r/Fji7 4PHB7dRQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct fw_node.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/firewire/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 2a05f411328f..95c10f3d2282 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -191,7 +191,7 @@ struct fw_node {
 	/* Upper layer specific data. */
 	void *data;
 
-	struct fw_node *ports[];
+	struct fw_node *ports[] __counted_by(port_count);
 };
 
 static inline struct fw_node *fw_node_get(struct fw_node *node)
-- 
2.34.1

