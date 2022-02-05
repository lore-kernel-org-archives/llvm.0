Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420E2F26
	for <llvm@lists.linux.dev>; Sat,  5 Feb 2022 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644073220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=713HQL5x//o/KghlUsgMrDORBx+gP5N718ebtgS9CfI=;
	b=hAle3Hqglukr3X0g/raY0wf7FNeSa20aKiZaBCPeLavEwsb/DS4NPWGS4Y3L+/S5+YCgwQ
	ceMmu2BWBGXSWiKW2bJuCi6GctaP3sFN4gpnVcQM5SH1wWWt1poPD60pzFqCzKA7ysQXIl
	i3W6ZAAf9es9QXUT/kfI2Ar2bCXCkQw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-2YZF9D50NvmtEDpBnT0gyA-1; Sat, 05 Feb 2022 10:00:19 -0500
X-MC-Unique: 2YZF9D50NvmtEDpBnT0gyA-1
Received: by mail-qt1-f198.google.com with SMTP id d25-20020ac84e39000000b002d1cf849207so7174607qtw.19
        for <llvm@lists.linux.dev>; Sat, 05 Feb 2022 07:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=713HQL5x//o/KghlUsgMrDORBx+gP5N718ebtgS9CfI=;
        b=kXznZwjs8fbHDdQXzliw5lnufdvpGEHBCLT5y3gDkL2Ephk+1PEWgM4PI1JrpHv0UJ
         tSOl7NsRO405tI9Ub6MEwSoThoT9I3LBlwNcHHmvRnKNSWr+Vg/EHUsy37JP3Pw5aw/q
         I/EXhNR1Rt0Bfu1e7iz6Zz9Y6BnHzc6hLPzXHCjCn9AVpDswopjFrXaGiILMEIqyJGc0
         nI5xvL/YwulgDUnUtmOYfDWM0fMXehKPQQR6Cb0QNugi0m1ACywgA0IDMDZHZGIBBqsL
         Dq2QSt5/Dm/1lc9swoz5+jwuNim++3ix5vV01enFLOBvYeP0lgqFPj2XbqyIu/zrZUlc
         QW+Q==
X-Gm-Message-State: AOAM530WZV3aR40ZmgZ30V4izH2BMXQNdW/n1NnU5ayT7pdPETm0y265
	F6MP7qcdpQkLRDs3Bj8EjGqas5wvTkXtdyGlaAwBJhriLqHonCsaXKv4ie8D+Dr1/YkEFS3pY89
	inktjLFfNVl9Jfw==
X-Received: by 2002:a05:620a:371d:: with SMTP id de29mr2218857qkb.300.1644073219085;
        Sat, 05 Feb 2022 07:00:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQMqxJhjsehYnlrGdRYlEx/4uzDQf3AvY1i5RUhxDDhxx+wOwMtIaQmWd3GyZr4OF2gUxNaQ==
X-Received: by 2002:a05:620a:371d:: with SMTP id de29mr2218834qkb.300.1644073218865;
        Sat, 05 Feb 2022 07:00:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d22sm2657159qkn.112.2022.02.05.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 07:00:17 -0800 (PST)
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
	andrey.grodzovsky@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amd/pm: fix error handling
Date: Sat,  5 Feb 2022 07:00:08 -0800
Message-Id: <20220205150008.1968218-1-trix@redhat.com>
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

clang static analysis reports this error
amdgpu_smu.c:2289:9: warning: Called function pointer
  is null (null dereference)
        return smu->ppt_funcs->emit_clk_levels(
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There is a logic error in the earlier check of
emit_clk_levels.  The error value is set to
the ret variable but ret is never used.  Return
directly and remove the unneeded ret variable.

Fixes: 5d64f9bbb628 ("amdgpu/pm: Implement new API function "emit" that accepts buffer base and write offset")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index af368aa1fd0ae..5f3b3745a9b7a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2274,7 +2274,6 @@ static int smu_emit_ppclk_levels(void *handle, enum pp_clock_type type, char *bu
 {
 	struct smu_context *smu = handle;
 	enum smu_clk_type clk_type;
-	int ret = 0;
 
 	clk_type = smu_convert_to_smuclk(type);
 	if (clk_type == SMU_CLK_COUNT)
@@ -2284,7 +2283,7 @@ static int smu_emit_ppclk_levels(void *handle, enum pp_clock_type type, char *bu
 		return -EOPNOTSUPP;
 
 	if (!smu->ppt_funcs->emit_clk_levels)
-		ret = -ENOENT;
+		return -ENOENT;
 
 	return smu->ppt_funcs->emit_clk_levels(smu, clk_type, buf, offset);
 
-- 
2.26.3

