Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1222F28
	for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672422920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DcgUbPIWI7ACQCz0hToO0OmWlNxXVdCOLs0FtdD5bpM=;
	b=VGr4SjwPx+nz9cAUbUUGPQMlfK0S8ixhYhbU55hBtOkBjh64mFtAupf7TbtVcQOugBYf+3
	bpJwl/qDiH3R2Q2zTSuZr8aECrR79cufwIA6T/cUnnTyDCocBN96qYsPHI6AP0D9crbSiB
	Z/q+vwP4BLKWi5sy0nx0Lr2QHpjgoes=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-ejwauGjfPRiw1zKL4DV5tQ-1; Fri, 30 Dec 2022 12:55:16 -0500
X-MC-Unique: ejwauGjfPRiw1zKL4DV5tQ-1
Received: by mail-qv1-f69.google.com with SMTP id c10-20020a05621401ea00b004c72d0e92bcso11511875qvu.12
        for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 09:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcgUbPIWI7ACQCz0hToO0OmWlNxXVdCOLs0FtdD5bpM=;
        b=aWjLXHdvCyF+rnG1RnTwaeyddV50LA6c/ZAaDFnRlB2nWZvHt0rJ8NLaIaFIoPFOCX
         sBEP5aG/0VW9v78ngEy7ZUQH+9bNld6e+ZqS9Bt870NIwbwLv95IR9EJxohleSjEdDxp
         tL5j3qzF8Vm3vX5jrwV8lyTGcEO3XZs4EQ0t+K83w3sHIfbnJttxRyGkcmp647K7I+4i
         bT/b/1XxwfYbvXm5Z/bfn/kJN/s2pcu/9at/3PyAwqb4nL1H5fLdIIzC5Hr+NGrIxwzL
         pbc1tnz0x1B5SGrKyq+/QcUCVkJyoU9Rzght1+1CwqbRRhQfBGpbLi4bFzbdl7xXfkCp
         5Vfw==
X-Gm-Message-State: AFqh2kouAlkxLVlSoAiT1zdE+EDcKJt9yb10pFZLcUOVqq3sMz9KXiI2
	q0772671+ZzHIqPpfVHZFSnx0ZAIdVWwxuwTfKq0GYE06M+LlovTjRl26cxbv65mojGac5/TGdn
	DK+/NBtqnOA1DGQ==
X-Received: by 2002:a05:622a:4810:b0:3a5:4e34:fafe with SMTP id fb16-20020a05622a481000b003a54e34fafemr51046835qtb.68.1672422915590;
        Fri, 30 Dec 2022 09:55:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3L2gBHQTmFP9l37NiSRftBM+1axb4Yfr+fA30go/BvbrBtsr+vpD9VbEOgJ2o+/iv7KWmXA==
X-Received: by 2002:a05:622a:4810:b0:3a5:4e34:fafe with SMTP id fb16-20020a05622a481000b003a54e34fafemr51046815qtb.68.1672422915408;
        Fri, 30 Dec 2022 09:55:15 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id h11-20020a05620a244b00b006cebda00630sm15766857qkn.60.2022.12.30.09.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 09:55:15 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	wqu@suse.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] btrfs: handle -Wmaybe-uninitialized with clang
Date: Fri, 30 Dec 2022 12:55:07 -0500
Message-Id: <20221230175507.1630431-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

The clang build reports this error
error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
make[3]: *** [scripts/Makefile.build:252: fs/btrfs/super.o] Error 1

-Wmaybe-uninitialized is a gcc only flag.  Move to setting with cc-option.

Fixes: 1b19c4c249a1 ("btrfs: turn on -Wmaybe-uninitialized")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/btrfs/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
index eca995abccdf..460eced3f5bd 100644
--- a/fs/btrfs/Makefile
+++ b/fs/btrfs/Makefile
@@ -7,12 +7,12 @@ subdir-ccflags-y += -Wmissing-format-attribute
 subdir-ccflags-y += -Wmissing-prototypes
 subdir-ccflags-y += -Wold-style-definition
 subdir-ccflags-y += -Wmissing-include-dirs
-subdir-ccflags-y += -Wmaybe-uninitialized
 condflags := \
 	$(call cc-option, -Wunused-but-set-variable)		\
 	$(call cc-option, -Wunused-const-variable)		\
 	$(call cc-option, -Wpacked-not-aligned)			\
-	$(call cc-option, -Wstringop-truncation)
+	$(call cc-option, -Wstringop-truncation)		\
+	$(call cc-option, -Wmaybe-uninitialized)
 subdir-ccflags-y += $(condflags)
 # The following turn off the warnings enabled by -Wextra
 subdir-ccflags-y += -Wno-missing-field-initializers
-- 
2.27.0

