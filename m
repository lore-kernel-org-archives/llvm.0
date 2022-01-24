Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017C82C82
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643032416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=10jjCwVWraQntNdBxVG806Q7wvKbwg1gvSBpyTQbEiA=;
	b=bWwcQEWzyo8mRI1CeRBHfSSyFDZvcWTNg5VZ/PZN6Q1+2alvTV+8PtSJiG+tzsqS6eJpNo
	emJL5aqSET2F5RbTBgAmkywKh6U8+4lJKtQ8lfOYuPj+V+4zfs6vMcHRD1EN81VMBU1NGs
	HtvhCqM0hAYMEFd2cK0hIrNcRGwgtk4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-cu51ZdyCNimOX32s4nFHvQ-1; Mon, 24 Jan 2022 08:53:34 -0500
X-MC-Unique: cu51ZdyCNimOX32s4nFHvQ-1
Received: by mail-oi1-f200.google.com with SMTP id s131-20020acac289000000b002c6a61fd43fso9101140oif.23
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 05:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=10jjCwVWraQntNdBxVG806Q7wvKbwg1gvSBpyTQbEiA=;
        b=o9hNOn3g6GIbvz+BB0zu1vZwIjdVdxz7DhSNQ82gW6SkhlCubXO5q99KtIycVWchBt
         sU96Y0G/I2lYC4YEoIuPxs+AqDHuw7wHuYe2R587G0vIbDAGuzE30IYFv0xbKVsZAYU8
         qPwR8Z2/O4oi7bdnXb5S65mr+vCYCgwubK5kZhK8WKYxNWI5oMO47MUAWAe81mEUVGJQ
         BFBZF5ouQPzdFz9zXwGpABgk2XEUV0an+MAflbvUwIJfhCfDI+Ufd0GaF7Ejew+Nk03I
         bWdEoeXJBwadzn/xiDMN1TDq05hUGoEc0gau5qmp+PvOMmafWv2m1MGlPasvKFPYK8XW
         PjPA==
X-Gm-Message-State: AOAM5324MDRx/riOlzEGnRzk6SZeYj61OFXO2VIEs79A9OumnBmL+54b
	xtn9uEgSxIACXUaBP5oldLADKgQbUQgaSyDj4Bs+ABLcvQw0OSNhJ3LDWt+QNCOgVzQG5Yk7+ay
	BHry/1QPIelnLqw==
X-Received: by 2002:a4a:d095:: with SMTP id i21mr3016410oor.66.1643032414028;
        Mon, 24 Jan 2022 05:53:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXcXYp8AXPTplh6to4AiTnWP2fz7OgXjj9IzEQpUNCJmvn968uNUEQkbgSQYBOEJwbNzIXMA==
X-Received: by 2002:a4a:d095:: with SMTP id i21mr3016389oor.66.1643032413803;
        Mon, 24 Jan 2022 05:53:33 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id v26sm1881619ooq.20.2022.01.24.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:53:33 -0800 (PST)
From: trix@redhat.com
To: evan.quan@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	lijo.lazar@amd.com,
	darren.powell@amd.com,
	guchun.chen@amd.com,
	Arunpravin.PaneerSelvam@amd.com,
	andrey.grodzovsky@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/pm: set min,max to 0 if there is no get_dpm_ultimate_freq function
Date: Mon, 24 Jan 2022 05:52:59 -0800
Message-Id: <20220124135259.1057828-1-trix@redhat.com>
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

clang static analysis reports this represenative problem
amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
        return clk_freq * 100;
               ~~~~~~~~ ^

If there is no get_dpm_ultimate_freq function,
smu_get_dpm_freq_range returns success without setting the
output min,max parameters.  Because this is an extern function,
set the min,max to 0 when there is no get_dpm_ultimate_freq.

Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 5ace30434e603..35fbe51f52eaa 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -121,11 +121,17 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
 	if (!min && !max)
 		return -EINVAL;
 
-	if (smu->ppt_funcs->get_dpm_ultimate_freq)
+	if (smu->ppt_funcs->get_dpm_ultimate_freq) {
 		ret = smu->ppt_funcs->get_dpm_ultimate_freq(smu,
 							    clk_type,
 							    min,
 							    max);
+	} else {
+		if (min)
+			*min = 0;
+		if (max)
+			*max = 0;
+	}
 
 	return ret;
 }
-- 
2.26.3

