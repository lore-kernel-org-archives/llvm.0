Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B28835
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680280847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S5srYW34Gq6Rc0mPy9hqCIRWz9WH4Jy0yDiTUMwyFoY=;
	b=Gzaxn19ooxe7v4sNPZU0ntX/os8svxhi7B6DccezM66EZ61cG1s6+1c59xBHVG4pe16MTC
	ut+FnT0oiSKa1cFX92cmj203yIxW0VP/f18RMJ82hUzETWdaTKru+OTcOH3yx1SjKDAEPC
	D0ojHTj6zKzAx8aIk8L1z3k9Ni9blPk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-TAwVoe6hPWiXapRWvaP8mg-1; Fri, 31 Mar 2023 12:40:46 -0400
X-MC-Unique: TAwVoe6hPWiXapRWvaP8mg-1
Received: by mail-qk1-f199.google.com with SMTP id 66-20020a370345000000b00746886b1593so10688884qkd.14
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 09:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5srYW34Gq6Rc0mPy9hqCIRWz9WH4Jy0yDiTUMwyFoY=;
        b=QMfnkyYMvBKsy9C1cET3odT1KeT7hyX0/R4vtY8z+oF4jph2dLU+5Vv4VQqEvCLU3a
         moptU4PDEA8nSVQp9hohGLh8LqYYa0PEPh34PRPxkFShjb+o1ew0Ft5xU667lH4mUoo9
         WxSxPQJhAojgLHQgiIiO8b3hrWctwCI9fcNN7ezpu/URTJdHjF38jEI74+Uo0OW1NDXN
         53wQyd+Is+lQC7zE4cyBpeTAOKx5T+QURIZZCVMVTQKnO89uWpJqU7iOEGA8yp3pP+i4
         OqOfqvH/QxgCTwmlpofI+x7vGxLGQD06uk1Jmok8Lp+nN1Df6DVM8V9DjlD3jRYeLBMP
         +vpA==
X-Gm-Message-State: AAQBX9doGG+XVt9fd/mOPuyLC6mU2wXWHgsUddKraDrv02D1e9Jj+QCm
	QzdfdOzAkW+7SQhq4b6omS4Naey5EHF1rGba2R+C3qp7NRjFrDmoQxydgqVQtWprVMoyo4P7TFt
	egVJxuxgq6CjGLQ==
X-Received: by 2002:a05:622a:1a20:b0:3e3:9041:3f6e with SMTP id f32-20020a05622a1a2000b003e390413f6emr46722900qtb.7.1680280845099;
        Fri, 31 Mar 2023 09:40:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9AlG21wz/QX/2UqrS1W/pPfMtig2JbymMss4of37EbHIk5FJiRqMt3PBrL7AF9Ryxd9BM1Yg==
X-Received: by 2002:a05:622a:1a20:b0:3e3:9041:3f6e with SMTP id f32-20020a05622a1a2000b003e390413f6emr46722869qtb.7.1680280844887;
        Fri, 31 Mar 2023 09:40:44 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c70-20020a379a49000000b00746ae84ea6csm797194qke.3.2023.03.31.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:40:44 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: evan.quan@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Hawking.Zhang@amd.com,
	kenneth.feng@amd.com,
	lijo.lazar@amd.com,
	KevinYang.Wang@amd.com,
	tim.huang@amd.com,
	andrealmeid@igalia.com,
	Kun.Liu2@amd.com,
	mario.limonciello@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/pm: remove unused num_of_active_display variable
Date: Fri, 31 Mar 2023 12:40:41 -0400
Message-Id: <20230331164041.1859088-1-trix@redhat.com>
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

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1700:6: error: variable
  'num_of_active_display' set but not used [-Werror,-Wunused-but-set-variable]
        int num_of_active_display = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index b5d64749990e..f93f7a9ed631 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1696,8 +1696,6 @@ static int smu_display_configuration_change(void *handle,
 					    const struct amd_pp_display_configuration *display_config)
 {
 	struct smu_context *smu = handle;
-	int index = 0;
-	int num_of_active_display = 0;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
 		return -EOPNOTSUPP;
@@ -1708,11 +1706,6 @@ static int smu_display_configuration_change(void *handle,
 	smu_set_min_dcef_deep_sleep(smu,
 				    display_config->min_dcef_deep_sleep_set_clk / 100);
 
-	for (index = 0; index < display_config->num_path_including_non_display; index++) {
-		if (display_config->displays[index].controller_id != 0)
-			num_of_active_display++;
-	}
-
 	return 0;
 }
 
-- 
2.27.0

