Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245AC811
	for <llvm@lists.linux.dev>; Tue, 29 Nov 2022 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669722743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Gux2/Som03hICgU5yOVV/Q1V+JmfiX5qRK+2wvl878=;
	b=BoG2tfnsaz852xAeCFsf0qCpVU8hJKuqn/ghJwnxWp6k4EVBxWJCLD1tkqOozVtlqOnYxt
	e4sfINsg91Taqup2xUW6iqLRvUZMWdgL9DIWHzeodmflUi3OivNktMVxjYn5UfKIAnYv5C
	RSwQXtXXERCLuS356H4aIopmnb55JiY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-cTv3tZtsN3q3g21C-8DPOw-1; Tue, 29 Nov 2022 06:52:22 -0500
X-MC-Unique: cTv3tZtsN3q3g21C-8DPOw-1
Received: by mail-wm1-f70.google.com with SMTP id l42-20020a05600c1d2a00b003cf8e70c1ecso10101359wms.4
        for <llvm@lists.linux.dev>; Tue, 29 Nov 2022 03:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Gux2/Som03hICgU5yOVV/Q1V+JmfiX5qRK+2wvl878=;
        b=bhyUPQQ9cqTSeOjGa4Kx2t9TuTmmEzQaweY4Km1qdxujwBJ2Mohprf4SWqyquUJnhK
         zdsv6e/MtOnIzh0L+LNu4m4pl+xY5q3mq9GUSIdja5s9AIQOwa72XKU91t8drfz4K3Tx
         ibmjpph4UD9stFkPxNzn0R4sE/58pF4tTB4RKZGwdcdIKNyvSAj14+VsKQF/z/kqS7gO
         v60/Nfb5qHVeyrI1M8c8A6Ne/SB5rmGPmnRNdG/QY0Z/hNPmVdjiUuIw+HnM/wLlw2Gp
         Q82SdsremxdF0peMyyKjk6XrY/RQoVDORb39dYQEgpRfGRUAs9iLir1HTuOU3pFmhnn9
         Ww6Q==
X-Gm-Message-State: ANoB5pkMR5pO7zf+OHtVxJOYKO53yPqoMz4BPSxA3YnrRhlBWCj4IyyW
	NYS5FpvmoaipPC5w/iYhiO3GnX27k8aQtmvjaOsaP6HD6FS1UBSTkQokC5VQEL4QoClHUzvZhed
	MstQ4tsrOglMr
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id y18-20020a1c4b12000000b003cf90de7724mr44534254wma.18.1669722741538;
        Tue, 29 Nov 2022 03:52:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7jWVYrfMlBCQFeHwziy5QCyzfD2FjXU0pt9cHOO8RRJpocET7EWtBePXu5o9xbIk8wvf++pw==
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id y18-20020a1c4b12000000b003cf90de7724mr44534239wma.18.1669722741311;
        Tue, 29 Nov 2022 03:52:21 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-144.cust.vodafonedsl.it. [2.34.28.144])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002365b759b65sm13232124wrt.86.2022.11.29.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 03:52:20 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] habanalabs: fix double assignment in MMU V1
Date: Tue, 29 Nov 2022 12:52:17 +0100
Message-Id: <20221129115217.129290-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Removing double assignment of the hop2_pte_addr
variable in dram_default_mapping_fini().

Dead store reported by clang-analyzer.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/misc/habanalabs/common/mmu/mmu_v1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/habanalabs/common/mmu/mmu_v1.c b/drivers/misc/habanalabs/common/mmu/mmu_v1.c
index 8a40de4a4761..d925dc4dd097 100644
--- a/drivers/misc/habanalabs/common/mmu/mmu_v1.c
+++ b/drivers/misc/habanalabs/common/mmu/mmu_v1.c
@@ -344,7 +344,6 @@ static void dram_default_mapping_fini(struct hl_ctx *ctx)
 		}
 	}
 
-	hop2_pte_addr = hop2_addr;
 	hop2_pte_addr = hop2_addr;
 	for (i = 0 ; i < num_of_hop3 ; i++) {
 		clear_pte(ctx, hop2_pte_addr);
-- 
2.38.1

