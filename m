Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8AD49D595
	for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403985; cv=none; b=r/3dbzO9LTNszIqIn9YEw5AM0Mf1lTj5i/dKHuteCNK1P3If43yvTyc/yFaVPFuk2btxQqUyUSDmL6Zaf/A6ipDgIgmtFDK8fb97CBEljl8EjfDuyXkA9Gihd37dIcbAWJQQBUqBe9WA2YqTF53C0ArmJ6kM+6wET7voGouKpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403985; c=relaxed/simple;
	bh=6bNcxzUVlmQvjet7ksUI2Ld7TTjqmjQ//XfC+z0s0z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0eGP2glFD7UBw8nvVJzyDV/k8p4Rii2nvI7fEodQCnOUa2GvsBRTC05q0j0FAFzdShQNyzaER+xp9+5yPJuThOKjGrzF10jDAXhJbo7avaraV5A1f57HMDafXg1ATRnv7eSPU6VAfynDSH8klxNWWoq9s4HnoaKsAty1NZpZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH8ieUg2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH8ieUg2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so3883565ad.0
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403984; x=1793008784; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGOLZT0g0vS6HQl4RNLoJTQMf+l+IbI+5Jp/8hOXDLs=;
        b=oH8ieUg27nN/MDW6HQT47Q/N4fke0Z8BtAr/Xoqpdpsh+kq4zhqg4Navoa8j1I9TI2
         XqTz+uNll3nVwqmhOgDBTX9Kdd0ZpY2awafcdrGDk+g0zbOtNe79nMu/3anPYqJAQBK2
         gue3l1xMUujI1XGGuBXQEjHpCmcw3GOL8rYoZxt66UocP26SMq7gRWG7Eoqw15K6zJU6
         jQdKzakQiROOz9Z3RB8epUkHVmfrTLZBDrMYYmgUCRqcl4uKIwL/uQplgVxrm0eGISkB
         C5yAri7nTfAmdX9h3q3Ot4aXCQJfVVvBxB54ENMyor71s9sSa+DKRR7YzEQmDPAcyBzq
         Xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403984; x=1793008784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGOLZT0g0vS6HQl4RNLoJTQMf+l+IbI+5Jp/8hOXDLs=;
        b=DYP8EZEDdOYl2VsfcMmGQaUJcM0u4GYyym4CxFOGkR41mJedEHIUgdDWbg9O1omuPE
         YFIBadKgGhJqf07v0Y+aiq1nTd1Z4ChoBbkHg1RX7Gk1JhDLyoIVqgA3miMX6OztWDSa
         ULgPQ7QYk5SbNrv0wtcvYeti7MiVOjlwZYo4Uijxnylb9PMNMXBpjkDVfyZ/QYP5ayOr
         axmiQNhXQ+eOWX/bD8PJMRKdn8eGf/mklAd2fUlQl6+sjgmwX6G1yyvS/zElPVd5TGfp
         /Uda0leF0XdnzU30gOFs6Dph3g+ZqM/d5wPAKmadTe77P0IsRWHH1hUiuJOpBw7vJoC1
         x0Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwTKTqeCjzXVuT+JG+U3nb8Me4KmyEBgBwENAVnFY9VG6BHeUThS13+iWloGNnLLRstJDyI@lists.linux.dev
X-Gm-Message-State: AFq9FYL2dbuhtlFN6luwz9rbwUCKfhSTdb8ZpJEt3j7AVzt9vhh8FbcY
	/pixoz0j03T2CKVdtl5Y3M0VQC4SXEqc6lqIdLGySx55ANOEkRpd9FyQ
X-Gm-Gg: AYBFou3LpVzJsGvCGHE/PVSuhyVM7mLPn3pYtjVxhuxGYicH8FVD5bEn7Gm1/T44ms2
	j5D1evy/hgFMiJl82k5smiDsUMlV9ielkvkUxIJtDhwmu5YoVoO5V5rAAPbIt0+IEiaZSOULxbL
	CNkk3ZW0fPUPNHX32S3WOjFngJUAuJzkg5VzwIgGF00zyoii0Of++5Uc3W6Y83/dMoWE45DfZvS
	kPro4mB2/x8IROs3NAhBXpkj+ByawPJh/2+y8fPTQcbzPP60u6PktKOe6LyKwhGRIEnfLS9f//q
	mB3BZFpJ+ROppjXDUh6P45l5J1YRUTZybFWxaJ/aLr9H9Zqb8dMSDN13shywjwsqqNYqV1Aw0rq
	IqENRd5BDCVIQngathSiIio3kDZUkxLTYppNIzVtv5qvQM979CRZjcKMA/tKFLnVDFw2XtuYzTk
	v+CIVRGwItYEuQq4hK0W9gd/jPpVaOdH3nJm+iUVkXAeXDgpvjGZj9JJPftbZnvj/112loxPLKa
	172Kt+cqlQcNGvPrNfhW/Z/8qukDfSuY6+3tb6R7oNV+7Rt+lpbKA5UnWm1+BaSZErO7AyUq7a4
	hbL0+/c=
X-Received: by 2002:a17:902:f603:b0:2e5:70cd:b606 with SMTP id d9443c01a7336-2e9a705c7c9mr54901255ad.56.1792403983748;
        Mon, 19 Oct 2026 02:59:43 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834029sm36631725ad.31.2026.10.19.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:59:43 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev
Subject: [PATCH] iio: osf: avoid a large stack frame in osf_core_init
Date: Mon, 19 Oct 2026 18:58:49 +0900
Message-ID: <fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202610191514.fRYyu0HX-lkp@intel.com>
References: <202610191514.fRYyu0HX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clang reports a 1344-byte stack frame in osf_core_init() for
hexagon-allmodconfig, exceeding CONFIG_FRAME_WARN=1280.

The aggregate assignment materializes a temporary struct osf_device on
the stack and copies it to the destination. With the mutex and caches
added by the IIO support, this structure is 1328 bytes in the reported
configuration.

Clear the destination directly, then set dev and initialize latest_lock
as before. This preserves zero initialization of all other fields,
including when the core is reinitialized for a new session, without the
large temporary object.

With the reported Clang 24.0.0git compiler and Hexagon configuration, the
frame decreases from 1344 to 8 bytes and the warning disappears.

Fixes: 7329986669f2 ("iio: osf: add IIO devices from capability reports")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/sensorhubs/osf/osf_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/sensorhubs/osf/osf_core.c b/drivers/iio/sensorhubs/osf/osf_core.c
index 4f73ff5e9572..62b086f67e6f 100644
--- a/drivers/iio/sensorhubs/osf/osf_core.c
+++ b/drivers/iio/sensorhubs/osf/osf_core.c
@@ -16,9 +16,8 @@
 
 void osf_core_init(struct osf_device *osf, struct device *dev)
 {
-	*osf = (struct osf_device) {
-		.dev = dev,
-	};
+	memset(osf, 0, sizeof(*osf));
+	osf->dev = dev;
 	mutex_init(&osf->latest_lock);
 }
 

base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
-- 
2.43.0

