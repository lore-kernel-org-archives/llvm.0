Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B3A936
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673370542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dsol8v/Y6ZKSi13JaYlImDhTwgtM/ldtPi7rslMNW7w=;
	b=H2DjaoTv8eZ/6oL9DDpzw/E+6xeeXXyjMJ8luESeTNHHEmDfLSZt7zuD57s4szxo+QSUHV
	ZZ8kHtK0GklX3d/Hwzttz5sr5P6twswQuyVe3tC7cHOucu60ZdLX+p+SnpSz8ltVLdVz5r
	mgHkuqsOpnaBbi5i14KoD+ujmqjv9mw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-wPSJf_-dMHS1FYrSOaUrKA-1; Tue, 10 Jan 2023 12:09:00 -0500
X-MC-Unique: wPSJf_-dMHS1FYrSOaUrKA-1
Received: by mail-pg1-f199.google.com with SMTP id o6-20020a63f146000000b004b33f7f9a96so2885011pgk.5
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 09:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsol8v/Y6ZKSi13JaYlImDhTwgtM/ldtPi7rslMNW7w=;
        b=GetflZo//B+5OMM8GB72g5HMkwJEQajIsGnqV0xMbEdepCy5WGf0YeQf+jspCu087B
         l3eQgVLa/xUcIWXRMhOGzeMnLhb6Nq0MrdOA1FdLbSvSt9vcRrBIHQEbi18FWcCaRp1A
         opZT9uvMZMA3LJrkjNMlK8e1AiiG7UKHcEzsxQRey6zyKTdeniNA3aUKHBcBUNUfvhs1
         BAZ/nu9i9WTN1Gjd8CLW635ngKiShbbXM8r9FpQ+OWr2aN43wzPYLLjw34lGeCGd8yxV
         LOck1pUxb6UoASgAVKYhiq/9MnmF+VyJXAC0lVN64Dm0dWgCCc/RLXQey4OWPjvcz+AH
         DIew==
X-Gm-Message-State: AFqh2krmferFljkSQKjZXOJT6vAM3pUK3eHsoXMAaikvoD8oYR22Io8T
	BMLCyuZQJ/D24k4KjcaSoLMgCAcabE/sAG+zX0nC5SDeWzHpASelV1SUenJvSMUuR3wogNFfeuP
	B7RU0EsOCkkwD2g==
X-Received: by 2002:a17:902:7fc2:b0:192:e2bb:c98e with SMTP id t2-20020a1709027fc200b00192e2bbc98emr21816361plb.6.1673370539503;
        Tue, 10 Jan 2023 09:08:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvef1/S8komThhaW5j6OMI0KSuDQUbOtSsCLVXNnWaNixCfpkyN2Bup+O3Pe2DgRCluN/6Xyw==
X-Received: by 2002:a17:902:7fc2:b0:192:e2bb:c98e with SMTP id t2-20020a1709027fc200b00192e2bbc98emr21816345plb.6.1673370539248;
        Tue, 10 Jan 2023 09:08:59 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e5ce00b00189371b5971sm8386798plf.220.2023.01.10.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:08:58 -0800 (PST)
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
Subject: [PATCH v3] crypto: ccp: initialize 'error' variable to zero
Date: Tue, 10 Jan 2023 12:08:48 -0500
Message-Id: <20230110170848.3022682-1-trix@redhat.com>
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

Clang static analysis reports this problem
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
v2 cleanup commit log
v3 cleanup commit log
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

