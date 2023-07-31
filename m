Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765B8BF5
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 12:36:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31765792c7cso4780799f8f.0
        for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690806988; x=1691411788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLp1taY+ERuB3LasQnUEAssMbTidsnt4pqF9zZDF/gU=;
        b=chwC+wsgzGXj6wjU5jSUeRc5Vjg1jIuVhWvlqm0hd7IggW947rVleeAmnaNBE85PEd
         9HiQ6m12UnWwDe5eetX7xFu4PZ7KzGyVthZcR3faV1kgd8EVEoCoSVVofNXzH6PclDee
         cY2YBH2CiTvpzL8zctZbxWQ3knSm1Le3Gjx3N9S4rI88qL4Qvd/Ft9OJwoaGCMYvXKOI
         8Bw1eak0mWqSWRQrY0z3pHJPvg57h+dif+YRObNbh1HX+ESzcvT2+qTPBUhCzdar/0GT
         z2FCJgoZv8klH7RqK85RhlZiCU2RyYuRtHrTHE27lgGEeXFzdIHu9ocBBRY11V+JXtna
         tRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806988; x=1691411788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLp1taY+ERuB3LasQnUEAssMbTidsnt4pqF9zZDF/gU=;
        b=fxdzTH0j3rH9MeQ7jxTyKjTdfN4Yz5HYi0nUaN8PIO9kBJTAbRVBNXFYgkKsTapJN2
         dICIv8Wepy9jLTMwvUgKuGKekE32BSsiv6P2Jr//byXYvW1/9aJk2plAuhB97pwDSBMU
         Z40yNzC3d3CfRG6/XwuM9kL/8cCuz54Tut4RkHTlUGkNm/rACsmc/RDga3EzNq+PbVjf
         UZd+TANg4QajL0dYmCpD5z69hFlgxS8QYLgsU57c0It2g37aF3uu2GF9gjl0I3waRkTR
         VMwT2ehacYvNXNwiBKOgxhh0Ug158aSYG+N3J5+4rZ/Y51C85RVbt5sSZHFv2Z4UvaL+
         gsnA==
X-Gm-Message-State: ABy/qLZeNoCtYKFpL0X2+bl37Z0riTo8I/6/rC+bFvHyTCWopLSCFF7P
	z4TIE4xHmWDSvdrHx0TI0sw=
X-Google-Smtp-Source: APBJJlHvC+FHChEM48GIT9MWRuWxUmhW+e0P0HpxDVwIfuo5KkFvCgGq1hXTIHbBCKhk+j4gUbPGEw==
X-Received: by 2002:a5d:6310:0:b0:317:5fe7:6844 with SMTP id i16-20020a5d6310000000b003175fe76844mr7371635wru.39.1690806988455;
        Mon, 31 Jul 2023 05:36:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:14f0:a600:ce89:8608:2d6f:110d])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d4e8f000000b003143c532431sm12958292wru.27.2023.07.31.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:36:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: boris.brezillon@collabora.com,
	ndesaulniers@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	trix@redhat.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	naresh.kamboju@linaro.org,
	dakr@redhat.com
Subject: [PATCH 2/2] drm/exec: add test case for using a drm_exec multiple times
Date: Mon, 31 Jul 2023 14:36:25 +0200
Message-Id: <20230731123625.3766-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731123625.3766-1-christian.koenig@amd.com>
References: <20230731123625.3766-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not really a common use case, but let's make sure that we don't
accidentially break that somehow.

CC: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 727ac267682e..7b0238c5d9fa 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -138,6 +138,26 @@ static void test_prepare_array(struct kunit *test)
 	drm_exec_fini(&exec);
 }
 
+static void test_multiple_loops(struct kunit *test)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+	{
+		break;
+	}
+	drm_exec_fini(&exec);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+	{
+		break;
+	}
+	drm_exec_fini(&exec);
+	KUNIT_SUCCEED(test);
+}
+
 static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(sanitycheck),
 	KUNIT_CASE(test_lock),
@@ -145,6 +165,7 @@ static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(test_duplicates),
 	KUNIT_CASE(test_prepare),
 	KUNIT_CASE(test_prepare_array),
+	KUNIT_CASE(test_multiple_loops),
 	{}
 };
 
-- 
2.34.1

