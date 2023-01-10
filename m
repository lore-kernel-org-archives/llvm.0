Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC5A921
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673367520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J7MvbGohPb9c5KuFVDOSy13hj72U3Wx/T4iJQbVeyfQ=;
	b=RO88AT8dT8qJFiyjllDMiE9JSFodtGv0UH9CAYxCfHHC3BTTcxUmFPp9CcKNep4DljCKpw
	+u/0Z7CuncAlsYVUQqVt0zs8GK4RvisOOQMXvI4EtSqFyLe0wqd2OLfFC6kvLD3uWWSpKW
	NU25UcWCoy3zqg30nUGaRtMxA2nKc9s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-o_JYm-jXPMajvispom3gog-1; Tue, 10 Jan 2023 11:18:38 -0500
X-MC-Unique: o_JYm-jXPMajvispom3gog-1
Received: by mail-qt1-f200.google.com with SMTP id s26-20020ac8759a000000b003ae43bc2445so2341486qtq.9
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 08:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7MvbGohPb9c5KuFVDOSy13hj72U3Wx/T4iJQbVeyfQ=;
        b=08TL5cxVbP+QIgHNUADYwzPzAFsSC2LV7E4MZQZ7yD/hsEDmsH8aye1ZAtqmqy+kK6
         iNoS1TPjAikGiBJTliuZJbp5Lnd078ohX1dh7Tua54ichfm2RpKTii1GOhOq/wXDNIfk
         tq7zOMzub/ymbrKvZEmOeHP4Wn6A/mCEBMsnpIxHM5+LhALnXZRXLq0u/99WZKub77ow
         wgBziJWeDfzasH7ZySVKaj8VAq8oc9+op5Xa4/AENHZjbcAE+XgRFmwBDeIb+cZfnKOC
         qnlCw47b6+ohC8ofEnZmLmyWlxF+ZYo7Nm5APDU30zyfOkBzmm+hbItgzAbdAFNkWF0R
         H6RA==
X-Gm-Message-State: AFqh2kqLBg7pcYfmcI5TLLImb4DDoMB8QLnyRzrPN8/5hV/x8lOYvjbU
	K5VZQNnxiYmGNe6mO6DqIJuobiilHQWp/vcDCvMdgXDqJ8meoR0g+v4DT3pry9Yu2/f3mBswG0b
	+x1PcOvKlO6KYIQ==
X-Received: by 2002:a05:622a:4d06:b0:3a9:9217:9e6c with SMTP id fd6-20020a05622a4d0600b003a992179e6cmr109627046qtb.55.1673367516966;
        Tue, 10 Jan 2023 08:18:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvz6UJWZ+sKLEjeZfRYxKqad/zTOI/hkz1wPhI9svfnbTHZgxVGTtTAGAgwHNF9SUsIhqUjw==
X-Received: by 2002:a05:622a:4d06:b0:3a9:9217:9e6c with SMTP id fd6-20020a05622a4d0600b003a992179e6cmr109626901qtb.55.1673367515311;
        Tue, 10 Jan 2023 08:18:35 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t34-20020a05622a182200b003a527d29a41sm6190082qtc.75.2023.01.10.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:18:34 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nathan@kernel.org,
	ndesaulniers@google.com,
	rientjes@google.com,
	marcorr@google.com,
	pgonda@google.com
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] crypto: initialize error
Date: Tue, 10 Jan 2023 11:18:31 -0500
Message-Id: <20230110161831.2625821-1-trix@redhat.com>
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
error parameter, causing the dev_err() to report a gargage
value.

Fixes: 3d725965f836 ("crypto: ccp - Add SEV_INIT_EX support")
Signed-off-by: Tom Rix <trix@redhat.com>
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

