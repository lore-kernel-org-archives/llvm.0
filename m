Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36432570
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649354248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O+vrRrqMFJ6b+4wLQ7xCWgEu9n79uQKRvZqKAsaERm8=;
	b=NoyyvCV0Gji1Lb2SYBotb3uV8n0WMSn5nMiiVjBu7z2P2PUNF/bX3P7j0MBQVRIBUAMXuC
	KlIOkaRHVfIxf++eVwdicKxji4lYy7hn5BriFcNLtBe82Z3jYzRK7iVgRCVOa2CgOS7KvT
	EllnfsMDlSxvXqr2TEdVTGRVmkr6hvw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-iB7knhcQMLS3gEl8WfDvwA-1; Thu, 07 Apr 2022 13:57:28 -0400
X-MC-Unique: iB7knhcQMLS3gEl8WfDvwA-1
Received: by mail-pg1-f197.google.com with SMTP id t6-20020a6549c6000000b00398a43dbdf8so3446324pgs.10
        for <llvm@lists.linux.dev>; Thu, 07 Apr 2022 10:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+vrRrqMFJ6b+4wLQ7xCWgEu9n79uQKRvZqKAsaERm8=;
        b=NOqBlybB7b+tmqJl1XjH8jja4Vt66EkGZe6LPGKYaySoabwgg65EYHGhlfKJdkgOLU
         oeBOo7Zy6IGQHogIVAeLN38kO9mB6endKv0XGaCMVfx5Paoia19DMSPRowOXOCZY7JUs
         JXRvycef9wQm1EniCGerRilDIYqMOb4BmM+GdOVYQIfJZkTbnAwzUaJhMYcAWmz+hGQ3
         Hmfb8uM0A4oupgTUkFgbdT6ZVRhzNNwvct6omtMYAE+hFoxCjMkNJWkQn9P9feASNjiT
         M6Jfam0v96LrwBgqN1RSacA3FNhvZqBVNHNfZ8a9ieOA9qiqhTyTI6SJuKbMbX/7bJ2V
         BGYw==
X-Gm-Message-State: AOAM5310BQAKm+KnU1tp0Vbk31RRzGMPG4kyyBkwxSJPCX4dhUdncuXM
	gBK0rJ1rpzGqNOOfoiqtiz2DABWfr0/sQFqZGEH4XXVfp/Wsm0rnpFiMu9Opyk+BAtOEUrB506T
	NrwbC1yBbuqs1EQ==
X-Received: by 2002:a17:902:b696:b0:156:b63:6bed with SMTP id c22-20020a170902b69600b001560b636bedmr15170876pls.24.1649354246891;
        Thu, 07 Apr 2022 10:57:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNzTcYdHFGPl0COruEjo6CBToCwrgo4PXx1tooB7gWfGh27A2vqET7wjpjd/MxtAvdfg/cYw==
X-Received: by 2002:a17:902:b696:b0:156:b63:6bed with SMTP id c22-20020a170902b69600b001560b636bedmr15170865pls.24.1649354246675;
        Thu, 07 Apr 2022 10:57:26 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id gb5-20020a17090b060500b001c6d46f7e75sm10013363pjb.30.2022.04.07.10.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:57:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] MAINTAINERS: add self as clang reviewer
Date: Thu,  7 Apr 2022 13:57:15 -0400
Message-Id: <20220407175715.3378998-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

I have been helping with build breaks and
other clang things and would like to help
with the reviews.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ebfc93d8f0d..8da670067a34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4797,6 +4797,7 @@ F:	.clang-format
 CLANG/LLVM BUILD SUPPORT
 M:	Nathan Chancellor <nathan@kernel.org>
 M:	Nick Desaulniers <ndesaulniers@google.com>
+R:	Tom Rix <trix@redhat.com>
 L:	llvm@lists.linux.dev
 S:	Supported
 W:	https://clangbuiltlinux.github.io/
-- 
2.27.0

