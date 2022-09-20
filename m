Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7C1C03
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 12:22:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v185-20020a1cacc2000000b003b42e4f278cso6738898wme.5
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4SwIaD3vwte9/wOVUhii8jjHUDs7etXJMigmdSdQFz4=;
        b=SLFoLkpR340kKkW0YrWlEfAhG5dD3fKjX3yfiQcJ1RBvRf3qDsOJQmWuFi8It2zGOO
         4xWD+xaLSG2zcyyiiRX1wHCG/QPvLR6pyaxkUQuhrKBIwqqWleODmA3zmBCy2s7jSOpd
         vvFkpw0tqn83ArzebL3ogqtG6JaH24hPhvgb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4SwIaD3vwte9/wOVUhii8jjHUDs7etXJMigmdSdQFz4=;
        b=napNZprjFp27KfiuJUahuq6p/jaaUKPL3IF0ePIOwMDpNY2Pv/YtyAbJ3EL5mQVoag
         KwAQNSC+S6IoOoERzRySvBglVUbHeXw9UJAsOhNTgjr5z2SA+xAPUNoZzs3tCP0UCigs
         WQnXRsZKNlSURPk2S4PBlKiiZGV+iRTMGhJEjoS2/sQW5HuAecetXgkpQ8SMs9G79AGK
         ksKdFLZS8AMGvZKxtE7YhK/XvjULImX4ZE2mkeQChE8tGqMku4wIe1pNTMLenD/rX1u1
         ODhIlhpuMFgU3RwgrX5TpUOd5kPAB9A2WUCmhu/wuLBwzZe5OAw6gJxNVMQy7ILDjBPj
         VQOw==
X-Gm-Message-State: ACrzQf3w/Ltnbsh49iFbfLg7EWYK5jH1G1awPdQa9PeeVATz89tWhLQS
	/9w5mJ8U8qZSA6Cywc7PT38YBA==
X-Google-Smtp-Source: AMsMyM7KTVO8qT5Kn3gc4wVc7Gf+axGxMqi1Oeo15wjCpSJNRvW5WWXc7u2JmKl2DoEucPmryDsVKg==
X-Received: by 2002:a05:600c:1c19:b0:3b4:c1cb:d46d with SMTP id j25-20020a05600c1c1900b003b4c1cbd46dmr2203248wms.172.1663676541365;
        Tue, 20 Sep 2022 05:22:21 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-56-12.cust.vodafonedsl.it. [188.217.56.12])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c354700b003b4cba4ef71sm13124268wmq.41.2022.09.20.05.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:22:20 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: tommaso.merciai@amarulasolutions.com
Cc: linuxfancy@googlegroups.com,
	linux-amarula@amarulasolutions.com,
	sudipm.mukherjee@gmail.com,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amdgpu: initialize r variable into amdgpu_cs_submit function
Date: Tue, 20 Sep 2022 14:22:14 +0200
Message-Id: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The builds of arm64 allmodconfig with clang failed to build
next-20220920 with the following result:

1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
note: initialize the variable 'r' to silence this warning

This fix compilation error

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 58088c663125..efa3dc9b69fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1168,7 +1168,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_job *job;
 	uint64_t seq;
-	int r;
+	int r = 0;
 
 	job = p->job;
 	p->job = NULL;
-- 
2.25.1

