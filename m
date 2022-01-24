Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F04168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643055500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LK256wQogjCX5wa9UmsP7s8Vi1buTBnWqTcBCjO4e1M=;
	b=L/XLgTOZ0Kvqjw+/FggItrh1/yqVyFyY9IXNh5vV4NQJTPN+g/tHTT1EFnjtAyEJpbvhtd
	9rX6TXm4j6JcLztDa8QAIHS9+PWbfycxEewcYMoR2h3tL8AOEc2brxKMWuxA1mOOr8sxCs
	mkcY9NIwD2imFRNDOUEUeZytHDi5q34=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-mi0PjpS-OvuoABu5WTkYRg-1; Mon, 24 Jan 2022 15:18:19 -0500
X-MC-Unique: mi0PjpS-OvuoABu5WTkYRg-1
Received: by mail-oi1-f197.google.com with SMTP id bj34-20020a05680819a200b002cd0daa8c77so2719783oib.13
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LK256wQogjCX5wa9UmsP7s8Vi1buTBnWqTcBCjO4e1M=;
        b=O+ZMimbAxAXcIcBxM/nrb1KSc6roY1obqFyHNmL6g/cPY7gSLUfFp6av6eE/zdB4e4
         HEaN2VqboSXLflB6YJLnqibKLXo78k8LRRF9GuC5sHhTAnR9d7d+HyJszWKC+c6kfEji
         6zLgs95YHphHlmHA1Ca77R00wQY2ryOlLX0CJ5WDF8dup45gXojBCuUXNNUHUzGf5mbo
         KnbLhVGyAjy5v3vUte+oulKxiK03JLlFp5KzrcZR0cRHnMapWK7ADdEgE08GNxi0c3l/
         j+cbFCSyWi2Cp1VcbuDqR4E4ZUjJsaxMGQDjds+HxDy9dakh84nEoJaEo1q0SLD99VfB
         LHoQ==
X-Gm-Message-State: AOAM531LFFA3KKpFbKH+jk5CgEsddCxVmUR7nrh1Uqg2AL4UbU1Zqiil
	eeQIcr3aHKSziP1W8I0qfQaoWA6b2GfVx13eeAGPovVZ4qySA1Eb40aC0KnsIfZ7orRbakuiBs+
	KczMMaYvJjO8DSw==
X-Received: by 2002:a9d:d08:: with SMTP id 8mr13197876oti.334.1643055498334;
        Mon, 24 Jan 2022 12:18:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTEn4ya3/5eCInZIkS/C/4U2Q9wOWBRRyxGnlMA9linsmQiFFzkE//YKVVW2gVtrkOgoqmKw==
X-Received: by 2002:a9d:d08:: with SMTP id 8mr13197856oti.334.1643055498138;
        Mon, 24 Jan 2022 12:18:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bk23sm6235774oib.23.2022.01.24.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 12:18:17 -0800 (PST)
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
Subject: [PATCH v2] drm/amd/pm: return -ENOTSUPP if there is no get_dpm_ultimate_freq function
Date: Mon, 24 Jan 2022 12:18:12 -0800
Message-Id: <20220124201812.1078824-1-trix@redhat.com>
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
output min,max parameters.  So return an -ENOTSUPP error.

Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: return error instead of initializing min/max

drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 5ace30434e603..264eb09ccfd51 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -116,7 +116,7 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
 			   uint32_t *min,
 			   uint32_t *max)
 {
-	int ret = 0;
+	int ret = -ENOTSUPP;
 
 	if (!min && !max)
 		return -EINVAL;
-- 
2.26.3

