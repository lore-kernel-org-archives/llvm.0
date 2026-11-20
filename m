Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202458;
	b=fHfSzLl5Pwz6y3wIOHKaFqt72IbtkykCnWKY7YhymZAvjSA8MRfTCiIGVLfzQaPZuBuA
	 P8EosEi7X9TGF6iNWQz6BAgxWFOGnzYrheNRg6nUyfPHdLH7n3ePtUp+MLOGWkqQHtdoW
	 i+l4FUK4a+W698XPQF9FbG6eX2gMF6Rzrihjei0omhVgRhKws+DsXZqdmip6ddLFWk6j5
	 uCLqZhQHqg0Brm7syiE8LjGretfvRSiFvju/samkV6mRTvAuj7NppH2YKifULla1SveTs
	 2kJj30APzebsoYL6unoSMOA6QOf0+xF4OVZ31AVDpOmvRiz8xAB7ZqeJw6rt7uUx6OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
	b=3+iRgxeUPosyiJkVxCA4dlOFFUmnpi0lJOSsB4Wl57kwYz+LPfcDM/JtWs6QBJA8MdV7
	 +PNhvhiOlwPumqxenVz07N6JKWbs4jL5X/kB03EMd0SKze7r0NNtcuVoKnQ9CDAPR1xo9
	 l3BieivIhWq5GB+zQozQHksGrzsfIsPZEjW/KWo4DsGBcBBcQF2rUl+BX1b5h9gJ+axSH
	 xYz1YgqisetyhxaTicXVzJX7wSGVjkSTkQnyx2kWsm2RbK/Ho4Xcfgb4tEIQEa01+Wmfj
	 5qzZ+yxKirCfgH3AS3bI3W2kGjP4SJjkEpOVtVGYxqdW8Di+CCrwt3eBbS8BRYH8DCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UOH+xEwL;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A9606A6E1
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304A9606A6E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UOH+xEwL
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so1389138c88.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202450; x=1795807250; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=UOH+xEwL9dvxFlwkb5uBIgJi0uNOX7klGYzLlu4eibknN2SNQ+XOcYP6mV/eBRskr0
         0FVQm3SpEIx5LN8uA/jRfTUcOX33FKdIOHF9N4TRdUHVdJ9pSi/Xr4DsLHt1WmgRyvW5
         kIP76PeLCKIcmkD6RrJrpp9LU8cYNve2UD9sp92lyKAUVuD4EzRn2b9mhysseDkONoG5
         HjSq5BLiZ/AQgBLibbEyS7vidJKKPPGbxbEK/+Sd76qDVe0jA82aGdqfJsjNsw+/sSXh
         rmPXOiC/vZU5Dd5yQWhI1rOzp2ZyMcTOcSEfdj1pLc7NmOdT3u2o1KCroVblQLcKbyXv
         RBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202450; x=1795807250;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=YvtKoyMYT7Wf50H6PAJlN+2FYg61Xv5Cd+B4Qw+lXxwaCdOf9ejoydxB9vdMGfUb8n
         dx6b5soaaxkVaLb+6RjngSlaGYhmdIPY6uvaWU4d9SSD/E7pn7jkzkmZXYM1PNQOp49u
         zoKvXudmqpAiL2LQC8Bh7TZHJuoMXXwgnw2T+e1TZV4NYioFN8zGtmOWcKVZSkNAMC5G
         ck6HYbsUQSYJVSCzTyWJz1TZfMShoJV9+rqIdqDkgFPirrWGiG0VWATXWldWoS0fRrk/
         piv7J4YIRb5RqPwtMtwBM6cv26DgugfB3OUTsUOYqGvjjMeDUoXlx13Hg57FEcYueJUj
         Cz4A==
X-Forwarded-Encrypted: i=1; AL+hErE7UJczCltf2CVc79n9Su6YwReMPJfEYN0tyTsMvo5RE69VSQHeSryTR88hRqFR4iUj663u@lists.linux.dev
X-Gm-Message-State: APuU4Z9z3xYUph+pA+EtgkfggYfNKtKyax3gv8/MiQLJL7ZL6Xbh1Axe
	zy7L167d6bH1jO/A6501nHJKtzMkA/sFw/ni3trI0c/zFK9pMGrwEg7sNgbC41zGtXBWZoES74b
	4cg==
X-Received: from dldz14-n1.prod.google.com ([2002:a05:701b:418e:10b0:1a1:ce17:436b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0
 with SMTP id a92af1059eb24-1b55689edb4mr3489816c88.12.1795202450046; Fri, 20
 Nov 2026 11:20:50 -0800 (PST)
Date: Fri, 20 Nov 2026 19:20:31 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192031.2868216-1-elkin@google.com>
Subject: [PATCH] remoteproc: qcom_wcnss: fix NULL check on devm_ioremap_wc()
From: Elkin Cruz <elkin@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

devm_ioremap_wc() returns NULL on mapping failure rather than an
ERR_PTR(). Checking IS_ERR(wcnss->mem_region) lets NULL slip through as
success and would return 0 via PTR_ERR(NULL) even if triggered.

Check !wcnss->mem_region and return -ENOMEM on failure.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..abe0ab320d03 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -541,9 +541,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
-	if (IS_ERR(wcnss->mem_region)) {
+	if (!wcnss->mem_region) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(wcnss->mem_region);
+		return -ENOMEM;
 	}
 
 	return 0;
-- 
2.56.1.750.gf70dc682cf-goog

