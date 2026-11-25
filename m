Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645505;
	b=pgBIfNuB0mCqq0xftO6ilE1+CxDat9ub41gC4+NqqTvCTqWx8EQPiWbFCMzQCxUHOnRp
	 a5dF2HkU8O/8LNnqaNec0L/uv6ZwnwTP7klsVd3mearBG7TW0d0ogwh3XZqWr36L+/GiG
	 dnO3T3b4ockHMUZoZLG6HVRHDPQaPDMz7hi1llAaklu5eye1Hm27L5I1xZg0F92lYtxVJ
	 QSO9fFN5u6GeCD9a8ptXt1Ilhxj+RDw/RkiWTUOCBUyhGk0iU1BPgWVvt2RNOeFiI/FjJ
	 fff2vyWHbFpDvMvkUWbn7xPf16ykF+eTmL2+MlCpKAgmQlP+xmMY32wq1Qa+pKvGR6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
	b=yfsbBK3Q4vVhcWVlcdw+1g+JWvIoPtFHyBbm9eGiE9Hq9za4eV2tWoj5Ao3eG2wLXur3
	 2ecVG2bSYYomPwxliFICvaZxwVoTXj+MN5q8Ekt9yrggslWW9CEhcI5C28awhTaS2jL1Y
	 11cfOgOHodEzyWS7fsphAcfpVUQVIke3apv2IjvzKJqzJvV2YhFrWSPA2VBnJeuDA/YLz
	 oDf//5jGcpKIQyXz+c1Ld4ds9kdk55l6CN23KO2HgH9zxSQYjdbMgxGgRSSvh3SF9XdmM
	 fhpvPpJC+w/jTdJ9/+w09WQ9rXMBxJIQUdFRRfmEEHT2o60/0itUyHUHAF5xWnTbLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2+U5ThG;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79960A2610
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B79960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K2+U5ThG
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso10352496eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645504; x=1796250304; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
        b=K2+U5ThGQap3GpMbK+FRLMRhdapggwUfQzi+HU9cbCOTCMgY1cWvOlLJAYEC4iWHpU
         i3m9ZmsHDSRIZsWLuK754r0qJwYWN5JmUhGdVEgoJ7cBYHxwHdANKZ2D2YBapDYeejWj
         8xwTiFLG6KpS8mdaPrwlB8NMdgCGoppKspmcsvfUh2LaPsNkfkV2dGh5kkl68CArjBir
         g4oqLpep8odKpa/HW3RXyUJ1IJN3jG9XvVvXueGDG1PKPZCwnql8fYniplvC/fpgyfGP
         mTm0nQ2d7YCOzRUjNic8/vv1Ja4zL+YuEDyALQLXHzMNrU3/cj3n09Jjsfc0QOamiCID
         eZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645504; x=1796250304;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
        b=fScG3hwsj4DI0rEVafqSTQWqIhQPqroRoBkeDCtA0waWmnHTpwp9SHNsEZ0m0lOuzT
         PEK42o+ybqb8AQ5oHadJNAxaBTp+SZXoyYYKqbC9rvzfSDp36BD4HRIcbSaQJggjaess
         WngEKyhlOM0QYNX2pnB6HbyMFXwMrkyeybfRHBBZCoAnmaFsktgwjOVZN/WIIgGg+lKM
         jg+8U2Vqega6O5rUmgdf6Rm23jM9cXKBtIWxrbiTUDo3MkstzUX8UZn5oVbvG0SbH54n
         Q+GwycXH3eKrhfI5pLl/OPAw1+KuD4dTfSQTV/XfUo7GSfuSp//B3dvL3+hzDw1WM+C+
         0weQ==
X-Forwarded-Encrypted: i=1; AL+hErGJcWq+5RBgPowLcQjeHYoeBTE/t+kw/WI3vWlDINV8mdUdC2wuycZlMs31mLG31tn8QdaH@lists.linux.dev
X-Gm-Message-State: APuU4Z/ihjBgxnUlw/Nr3tBeAV9jiiHfcVX2rnR8xA6UnIchzLT8m8MA
	lF5DowzpYffST2INryY0kEJsAhpLTBnVzZOTmdnUik4Mv4BL/JwXv74uiLJGUo+dalRt9rA9GLv
	a1w==
X-Received: from dyw26.prod.google.com ([2002:a05:7300:881a:b0:381:e4bb:7fb7])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:152f:b0:376:203e:7d7b
 with SMTP id 5a478bee46e88-3856c6b35b5mr21680529eec.2.1795645503284; Wed, 25
 Nov 2026 14:25:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:55 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222455.1445007-1-elkin@google.com>
Subject: [PATCH] iommu/sysfs: Clear iommu->dev on error in iommu_device_sysfs_add()
From: Elkin Cruz <elkin@google.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In iommu_device_sysfs_add(), if device_add() or setting the kobject name
fails, put_device(iommu->dev) is called to release the allocated device.
However, iommu->dev is not cleared to NULL, leaving a dangling pointer.
Callers that inspect iommu->dev during error unwinding (such as
free_sysfs() in amd/init.c) can invoke iommu_device_sysfs_remove() on
the deallocated device pointer, causing a use-after-free and potential
double-free.

Set iommu->dev to NULL in the error path of iommu_device_sysfs_add(),
and guard iommu_device_sysfs_remove() against NULL pointers.

Fixes: 2926a2aa5c14 ("iommu: Fix wrong freeing of iommu_device->dev")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/iommu-sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index 937d1c749843..3b9e5578978e 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -85,12 +85,16 @@ int iommu_device_sysfs_add(struct iommu_device *iommu,
 
 error:
 	put_device(iommu->dev);
+	iommu->dev = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_device_sysfs_add);
 
 void iommu_device_sysfs_remove(struct iommu_device *iommu)
 {
+	if (!iommu->dev)
+		return;
+
 	dev_set_drvdata(iommu->dev, NULL);
 	device_unregister(iommu->dev);
 	iommu->dev = NULL;
-- 
2.56.1.839.g22a8290db9-goog

