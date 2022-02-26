Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B423B5C
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645891143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Grhy4tvGVEY5R3BS2D+G2b4sVPmyn1TwoVnElYjF3HA=;
	b=QPWXxsgIVcFlXPeDJwWVe+bwwcrjhxVqC4Dbm3fiH5BeJdF4xmi3MJgOnQjkAVQB+US4gc
	WS7i7LGrBXzeXUe+R7n7KZaPFQIzo5u6+um3jqOvUF8GPkuUklUoyh6oTIRR0VK82O9r+q
	/gbtbgHuAG8/9uxHmMqrHWQTlHVMR94=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-o32sktBaP7iBqfk0frShdg-1; Sat, 26 Feb 2022 10:59:01 -0500
X-MC-Unique: o32sktBaP7iBqfk0frShdg-1
Received: by mail-qv1-f70.google.com with SMTP id d16-20020a0cf0d0000000b004328ac68689so8087504qvl.3
        for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 07:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Grhy4tvGVEY5R3BS2D+G2b4sVPmyn1TwoVnElYjF3HA=;
        b=Pq2CMwol+4jn1ANEU1T5VseDrvcxSw1+jgJQ1pVc3AgGb+88KO0M5E71M/tcuvCw01
         mqrMzhWy958I6X2V1zG9J7NIqOVr3v0JCv6mX3KQ+EkD+yDMlnNp+1OPA1CNSaxmaBXO
         tWlrNmNu04KeqHDm7x/r+vLM/9VjsO5Dv3buW16121IVI1GUlr42izmWP6mQ0yizPI/K
         HDuiJb3b60n2qPPO2YIZk7F3KcgT1h8aNhkDc+cBbYOr3JbxVP5ZYwvw6XAiUVaZk68p
         0DAXz2OsPJIXyh8I8+lFwnpo6ZGzGHbIpOTPMKBHY3cTI06E2cFgk4N+I/li9XXoKO3W
         81+Q==
X-Gm-Message-State: AOAM533hXZuyZLhGV0Krk1K6YI2+GnDy8xcVJBBOIXfsDbZSZA9Mg6TE
	ArBBpq+OJwt/tv1fPROTxafEC37V+OhOITbha04S3y9Q5eTyLOSlaEyMqWGu4Rf3Uq2xp2ucfDP
	rhzIxbXzNb6MhsA==
X-Received: by 2002:a05:620a:122c:b0:47e:1445:15e8 with SMTP id v12-20020a05620a122c00b0047e144515e8mr7667244qkj.200.1645891141072;
        Sat, 26 Feb 2022 07:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyep784W30LsjYckoKZZTZAqrxmyuQo5OmviyaAolfcaSK5XfS1laivNCE0UKTxjerrO/TlHg==
X-Received: by 2002:a05:620a:122c:b0:47e:1445:15e8 with SMTP id v12-20020a05620a122c00b0047e144515e8mr7667237qkj.200.1645891140834;
        Sat, 26 Feb 2022 07:59:00 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a148900b005f188f755adsm2640064qkj.32.2022.02.26.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:59:00 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nirmoy.das@amd.com,
	lijo.lazar@amd.com,
	tom.stdenis@amd.com,
	evan.quan@amd.com,
	kevin1.wang@amd.com,
	Amaranath.Somalapuram@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdgpu: Fix realloc of ptr
Date: Sat, 26 Feb 2022 07:58:51 -0800
Message-Id: <20220226155851.4176109-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this error
amdgpu_debugfs.c:1690:9: warning: 1st function call
  argument is an uninitialized value
  tmp = krealloc_array(tmp, i + 1,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~

realloc will free tmp, so tmp can not be garbage.
And the return needs to be checked.

Fixes: 5ce5a584cb82 ("drm/amdgpu: add debugfs for reset registers list")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 9eb9b440bd438..159b97c0b4ebc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1676,7 +1676,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
 	char reg_offset[11];
-	uint32_t *tmp;
+	uint32_t *tmp = NULL;
 	int ret, i = 0, len = 0;
 
 	do {
@@ -1688,6 +1688,10 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 		}
 
 		tmp = krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
+		if (!tmp) {
+			ret = -ENOMEM;
+			goto error_free;
+		}
 		if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) != 1) {
 			ret = -EINVAL;
 			goto error_free;
-- 
2.26.3

