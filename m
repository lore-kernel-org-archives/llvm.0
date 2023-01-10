Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FDA935
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673369606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kup4HOCIEU1szEBLKhvEmi75KAA9Nb/HeMnvSYwk5j0=;
	b=WzHzKQ4dcxf590YX9zWoLDs2+9lPIzT/re/Lg+lBbSJGhuIiCf1mntkHOSCUoF+EQ95/u2
	PkiL15vbG41lZ+YJL+DmY4CHLXRW7+DkIWu21PWka2QSfV7DeddwRV+1IVrJJsBvJ6up8a
	elbXth0MlJTnSRcaGZXzsD/UP0xXFVg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-lBxZsOf_OUa9OlTHjcad7A-1; Tue, 10 Jan 2023 11:53:21 -0500
X-MC-Unique: lBxZsOf_OUa9OlTHjcad7A-1
Received: by mail-qk1-f197.google.com with SMTP id y6-20020a05620a44c600b00704d482d3a0so9195401qkp.21
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 08:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kup4HOCIEU1szEBLKhvEmi75KAA9Nb/HeMnvSYwk5j0=;
        b=WXDHulltVJiN17LsOXzVuW3Z/o9EATexoSRw7jXzTNT/6H4GGWb2WpxADUeHqoCsp1
         rrvNMCtdGYlw6uPIRdfYVgHjM0v5ZLbGvJMbDC6Mh3+vdc+K5TPgcvtbWBO6mJEixjRC
         /+b9jqX15778cAO6R2suuwuJsKnXDUK6DUJEH6yKSxoiWfBohZ6d3VmhT68Xp5XDWffF
         1tMhwAdUKX1j9mTMp3mgOD7WgFWZCl4aepzVAh/bvV6LBO0pHT2wtw8ls8NnqLJPFInf
         7ZMSVk3Od8dfNNHyBjtHrPjMKfrWCUDpe3jh2DMaTNMqfsy03+neOZvEGtlPVqfxT2JY
         PdRg==
X-Gm-Message-State: AFqh2krdAx8fNqF/yW9P0p28uQLtzfIhvu+v/IzFHmetc/EEZyKy7EtQ
	6HIqI293KIov2zz/5OXAYGw0TLSx/Wgxe/XpPC9Mza9stWtdPx7ODNhNV0tSurr6rTYXjNUGTyH
	xw1l4PJxzcEF+zw==
X-Received: by 2002:a05:622a:1f06:b0:3ae:55ba:8392 with SMTP id ca6-20020a05622a1f0600b003ae55ba8392mr8544547qtb.32.1673369600684;
        Tue, 10 Jan 2023 08:53:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1gy+R4UVBxdneGHh2kFQ1PNWrp1or09a54OsiH2i2fXOwcKnmCac0ajbB6/JUU7bf9dSNdA==
X-Received: by 2002:a05:622a:1f06:b0:3ae:55ba:8392 with SMTP id ca6-20020a05622a1f0600b003ae55ba8392mr8544521qtb.32.1673369600490;
        Tue, 10 Jan 2023 08:53:20 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a44d300b006fba44843a5sm7452833qkp.52.2023.01.10.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:53:20 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] crypto: ccp: initialize error
Date: Tue, 10 Jan 2023 11:53:16 -0500
Message-Id: <20230110165316.2870300-1-trix@redhat.com>
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

clang static analysis reports this problem
drivers/crypto/ccp/sev-dev.c:1347:3: warning: 3rd function call
  argument is an uninitialized value [core.CallAndMessage]
    dev_err(sev->dev, "SEV: failed to INIT error %#x, rc %d\n",
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

__sev_platform_init_locked() can return without setting the
error parameter, causing the dev_err() to report a garbage
value.

Fixes: 200664d5237f ("crypto: ccp: Add Secure Encrypted Virtualization (SEV) command support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2 : cleanup commit log
---
drivers/crypto/ccp/sev-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 56998bc579d6..643cccc06a0b 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_GPL(sev_issue_cmd_external_user);
 void sev_pci_init(void)
 {
 	struct sev_device *sev = psp_master->sev_data;
-	int error, rc;
+	int error = 0, rc;
 
 	if (!sev)
 		return;
-- 
2.27.0

