Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645483;
	b=QsQo5U/Ui2ShO4ym7f1SH6I2vb/9dqo2KLX5Z6qxKGj+q0ZU3hUaEKhV9szKpULNkm4B
	 toXBN3v/tIxuWaOVxjlEl4ZIj4SF0sghYpePn5Binvr3GBmWXI0nv87bpC43CKvoRnB1K
	 +gRNFRGnK/fWhaSnG7SANhiJ3bhX7mEluQbI0HBwABavGy3Hngl82nOQt1RBsJ52rTHLx
	 hHAMxHJxiCUO4DS+/jUUxEIyZpJSmkFEd0fg20CK89dj1pS8UW/BkP9hwS0SIRQXjDDD4
	 PW8I0+D/NLSO6zx2XBpKfd+M+P3tn1VHaxG0ritjnKJ2ytHNoWHxd3mIVkC/aLw0RPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
	b=Oqfr8oMraC85x/i/gS6Wp3NFGoCXxE7olxQXXf6yt6gp9tb2u4qApfOZCj3C7Z8GggYT
	 OET8KbZ38mqiRk5QaSqAfZkBCHBvX3R9k6yvRrGlXLGfGcAoFUcC058cew5FVrcHsA376
	 1GuR2zb40c3xfYeY/Ct1yk+nkFpjYMUTGP6wNZWMc7fFKyUcgVY1SiKhYO5yduhrCZii9
	 A4Qi3Anh1eoLfzK3+sY7ciTniJMWUjnt3J3komETuqJlvVZEr0UofAsoYWkGYlEoDc8/W
	 h1wvPsxB+wLMXlKKn42zlD3jVeY6NIA7mtu8VU4bS/8+8MEhH9+ngUyNcVwMxrd3smw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UUhzJ9qJ;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA8606A69C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AA8606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UUhzJ9qJ
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7335666eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645482; x=1796250282; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=UUhzJ9qJyo5nhJlRbw2kI6lfPuQSI/m4eWujS6L4+d3rl26OD6zAMJ8uJPlOW5RLNa
         otS34ed7bVN9cmXVql0kNnSdmncwyQF8LlSUu/0sYAa9+eEMqBJvw5SW4YB5jiWy3tBu
         ArEJXPwTHjt19T1KbjVP/FRjBz+Kanx5ZOmARtxfEMIxpUbMFEX4LYWThcpXSHQ33krV
         qYWCQdyT8C44s98fOU1sXeyTbe0zB68NGvDdwDIjL8F6JwMxnvjs7e/avStSy2LDOMr7
         zpLJGB9KkywiZS1OecIiql+/0lLsmI3zou7zoY0OJN63ucf2PR4o09oFHQ4xd1732sEK
         kJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645482; x=1796250282;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=AomVoSqh7YluWSPhHN9zR9ozFSDMSNqOO/DJ97HiZ0kUOtEyV3r8DeyICYiTchYUNX
         2cC2Ct0zvi7bUktAUaFxV3VSpngN75UwOJM3LB2oJvz7l6oj0hirqQm5YNV5yyGkjaWz
         GbePhz1eR1UACDaAPoWZ2eoVXq4SOt6uqnY9bjZ30CEwZV1ec3q4NuoHd1C8aniuwtRd
         2X/5r18QSU+SN+JDHT/cNwTuSk3R9v8mgSTutkzC9Yg4GdTMVVrHriAnrnt9uIrSEX+2
         H9I0jDm7WgzzjYkqs+AS4vPaQJeF+RYGb9SqlZPpXX/hkszxkzpuylHRQPjOrJkpuhXV
         z/lA==
X-Forwarded-Encrypted: i=1; AL+hErHqZybQvb1IP7iKFzq6nWsks4VBYijVTYHsIVPsh6CE+SwEHgxGM9IvupOE8tibL2rC3S/5@lists.linux.dev
X-Gm-Message-State: APuU4Z+lULa5IgCMKZ0sWylDbE+WT25WDdkJUcCHiGpFGXKzUIODeLsJ
	/DBdzDgAnqi1g+lpc5cnHlRahBoWdD6tNOwmIt2LCuWwF1LPVM+AcOD9DGFWNiCrj++xWxAfvzl
	g7g==
X-Received: from dycuf5.prod.google.com ([2002:a05:7300:105:b0:386:9be5:2d95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18955075eec.40.1795645482015; Wed, 25
 Nov 2026 14:24:42 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:33 +0000
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
Message-ID: <20261125222433.1442338-1-elkin@google.com>
Subject: [PATCH] iommu/arm-smmu: Fix use-after-free in nvidia_smmu_impl_init()
From: Elkin Cruz <elkin@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Krishna Reddy <vdumpa@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nvidia_smmu_impl_init(), smmu is reallocated with devm_krealloc() to
embed it within struct nvidia_smmu. When devm_krealloc() moves the
allocation, the old smmu pointer is freed, leaving nvidia_smmu->bases[0]
dereferencing the invalid pointer.

Read base from nvidia_smmu->smmu.base instead of the stale smmu pointer.

Fixes: af9da91493e5 ("iommu/arm-smmu: Use new devm_krealloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 2fce4f6d4e1b..a3884966dc29 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -319,7 +319,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 		return ERR_CAST(nvidia_smmu->mc);
 
 	/* Instance 0 is ioremapped by arm-smmu.c. */
-	nvidia_smmu->bases[0] = smmu->base;
+	nvidia_smmu->bases[0] = nvidia_smmu->smmu.base;
 	nvidia_smmu->num_instances++;
 
 	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
-- 
2.56.1.839.g22a8290db9-goog

