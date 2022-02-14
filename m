Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D7A2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644862958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6KphgiHwgRe3NkAsq1kWFGjvzJI/mlc7nnNKh2wAjkA=;
	b=bVzLOMIU6oygwozyry2Kh/wcMdytHPLKf5dI8dQe5C2fh+tuztEciTBZgfcXAtBXtrose/
	690w53JhUL3Kbv1f9/oX99UyU025L9RVe6Rt4f/qYm5qbvhjAJiVw0ceoQMQYQLHrUL/n3
	GTvGfVi074/11g4oClsWelvF0egTGH4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-nH0OnwzUPB6JXKyEhFzvkw-1; Mon, 14 Feb 2022 13:22:37 -0500
X-MC-Unique: nH0OnwzUPB6JXKyEhFzvkw-1
Received: by mail-oi1-f198.google.com with SMTP id a9-20020a056808128900b002cf97f0658dso3935901oiw.13
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 10:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6KphgiHwgRe3NkAsq1kWFGjvzJI/mlc7nnNKh2wAjkA=;
        b=MM82PiXK0x2N9ePb2/e4Z1XGbYnxXB22Dk6H0otaiXMCWsZ38w4BK+jDkTK4CmGaCy
         fPGHSUvJBWdXR/JqtboJHpUFJyalUUGkQOVhK7wcKPsrmJ1KgTie1cJHVbyhrjjHe95o
         QeRkEFbZz6TTKT/TiIm4THZsL8cGKC5W1+0afG920t+w4neF9r3pu8mhPyfise679/bJ
         FGSkkejialQ9cjydIeyuFYjr3YAvP9SADdb0aZMTS7j4swYj4YW0VJo6B5G0QL19/8ca
         PnyUyrukoYncqYhhECzlIQqbRfpL/2NPchWv13IsFcPlf4VouljZwEcklqKbNwQFF3k0
         EP2w==
X-Gm-Message-State: AOAM533LOunY+tqmz0+sj6Qz+al6qOtN6uOmrslZeVYqmlSDCruxpdA7
	687VFY92tTUSjxZEVUCV0IsjgZEEv+hNFhZ2wUUz6lkuoSSeGfXITMZHjPQYYelRGQdEXWNK4YA
	MpCVAGCWUPPHgFg==
X-Received: by 2002:a05:6808:2227:: with SMTP id bd39mr64712oib.142.1644862956382;
        Mon, 14 Feb 2022 10:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVpfes2LLHqPuaIsi0+RkM/zs2xkzYjID6G+ExdR/vMlhePhV1G0FpY7aHAfq8EanEFOo3Eg==
X-Received: by 2002:a05:6808:2227:: with SMTP id bd39mr64640oib.142.1644862954708;
        Mon, 14 Feb 2022 10:22:34 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id j6sm12673419otq.76.2022.02.14.10.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 10:22:34 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	luben.tuikov@amd.com,
	david.nieto@amd.com,
	nirmoy.das@amd.com,
	Ken.Xue@amd.com,
	Roy.Sun@amd.com,
	evan.quan@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdgpu: check return status before using stable_pstate
Date: Mon, 14 Feb 2022 10:22:24 -0800
Message-Id: <20220214182224.2906060-1-trix@redhat.com>
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
amdgpu_ctx.c:616:26: warning: Assigned value is garbage
  or undefined
  args->out.pstate.flags = stable_pstate;
                         ^ ~~~~~~~~~~~~~
amdgpu_ctx_stable_pstate can fail without setting
stable_pstate.  So check.

Fixes: 8cda7a4f96e4 ("drm/amdgpu/UAPI: add new CTX OP to get/set stable pstates")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 1c72f6095f08..f522b52725e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -613,7 +613,8 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		if (args->in.flags)
 			return -EINVAL;
 		r = amdgpu_ctx_stable_pstate(adev, fpriv, id, false, &stable_pstate);
-		args->out.pstate.flags = stable_pstate;
+		if (!r)
+			args->out.pstate.flags = stable_pstate;
 		break;
 	case AMDGPU_CTX_OP_SET_STABLE_PSTATE:
 		if (args->in.flags & ~AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK)
-- 
2.26.3

