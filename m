Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62072C80
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644512666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yfg+rvc8vcVuTj7+GQ4UV9mGgjoAYvtiDa4kYWoYjJ8=;
	b=G3fqw+Qjwq5bAv7gnCTPpQFACnMI4woKwNIof5qBGgaDnKVdm26ZF0UDiohTBY1hBAD1rg
	4MTMtwNWc/KRQ2rTE85CEk/VoJrQsxZgqbX/qq3KNiayXADaXS0365PBOAzUoi+4hT5ACz
	LKefstpEc/xmct1CjACuc0w01N+YvWM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-0Us5U5FLOIGEaJ0Ziw1B5g-1; Thu, 10 Feb 2022 12:04:25 -0500
X-MC-Unique: 0Us5U5FLOIGEaJ0Ziw1B5g-1
Received: by mail-qt1-f197.google.com with SMTP id h5-20020ac87765000000b002cff8751c63so4861361qtu.3
        for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 09:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfg+rvc8vcVuTj7+GQ4UV9mGgjoAYvtiDa4kYWoYjJ8=;
        b=PR7q0x71nZls7IGnlxEFdnKlASONbt629QhnIpywSx/ch5gJ2+N0WmHY+K37tTwipk
         GRqTUl7TxmO+K4OrCINRtXhreGR2cqwoiys6/5TRrt1qdTD5JOprgkeCG/z3sfsERzrD
         WJP0ZR5Ilwv2AiyH06G3ut1jYC77ULgrFS7gDaT1v8jnIKMSIEEaP7i7dVZD9PiRjOnz
         A1FqZPVF1EW6C4xOOhE2Bcp188YK95sec0AfD7HLvxfzXUbMnvP8G0QrfiG3+MVka9zZ
         eTrHgk/dzUP2KkgJoMeoeC492foIkk7QhdsK8lYDFeas6PPScblF8fEd7X/MGVgXLX4J
         aq6w==
X-Gm-Message-State: AOAM530moL65l60SWqMAKW+ZphUJxbPeL/uFQK+UNyLerFjXlWNutBoF
	K7o2X4C5XU7PuNVTpq9PsU6ydZ4kI7xMb+pcQ4g4+mSJ001qMrEcw3Cw1P2FFLjEUIy3BANy+GM
	m1N9v9rFF+n/zXA==
X-Received: by 2002:a05:622a:488:: with SMTP id p8mr5619791qtx.97.1644512664767;
        Thu, 10 Feb 2022 09:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6fO5DYKXU/juk8kup+dK1EWIDMNgxbwD2+eVcMOxOQtX4NtPMxUE/mv2fPNsQDd1zWg2wfQ==
X-Received: by 2002:a05:622a:488:: with SMTP id p8mr5619768qtx.97.1644512664592;
        Thu, 10 Feb 2022 09:04:24 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id j11sm11156880qtj.74.2022.02.10.09.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 09:04:24 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	rajneesh.bhardwaj@amd.com,
	david.yatsin@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: fix loop error handling
Date: Thu, 10 Feb 2022 09:04:18 -0800
Message-Id: <20220210170418.2404807-1-trix@redhat.com>
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

Clang static analysis reports this problem
kfd_chardev.c:2594:16: warning: The expression is an uninitialized value.
  The computed value will also be garbage
        while (ret && i--) {
                      ^~~

i is a loop variable and this block unwinds a problem in the loop.
When the error happens before the loop, this value is garbage.
Move the initialization of i to its decalaration.

Fixes: be072b06c739 ("drm/amdkfd: CRIU export BOs as prime dmabuf objects")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 636391c61cafb..4310ca07af130 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2374,7 +2374,7 @@ static int criu_restore_bos(struct kfd_process *p,
 	const bool criu_resume = true;
 	bool flush_tlbs = false;
 	int ret = 0, j = 0;
-	uint32_t i;
+	uint32_t i = 0;
 
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
 		return -EINVAL;
@@ -2410,7 +2410,7 @@ static int criu_restore_bos(struct kfd_process *p,
 	*priv_offset += args->num_bos * sizeof(*bo_privs);
 
 	/* Create and map new BOs */
-	for (i = 0; i < args->num_bos; i++) {
+	for (; i < args->num_bos; i++) {
 		struct kfd_criu_bo_bucket *bo_bucket;
 		struct kfd_criu_bo_priv_data *bo_priv;
 		struct kfd_dev *dev;
-- 
2.26.3

