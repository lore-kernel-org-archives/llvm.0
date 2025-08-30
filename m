Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD494221FBF
	for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756547400; cv=none; b=nQHx1kvXhVs/uRlBV4Mpn4PqUrNAJSDky7lm/oggmhiI+df4FTlopyGNw+/m+YXKkf3tFaUnlDqj/kOryVDr/tdKPt44UscmLu8+kIS01/XT2XljJhMAjijMoqSBPtMIJhPs8uONXbMMrB2uCAOg5AVVxlT4K+UZF+Wt/G9XTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756547400; c=relaxed/simple;
	bh=MhydSjpAwABmF/rCF0KsztuXi9gwym6dmu8o5mvUOII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/ND2vXorOzqlyhUnOM94M7zVAvZuhNovfUIz2yQWdgzGPzon76TO2pi1mqyYXpjfFi0xc2H+Ew3fUhMEk2apgA5XuTlSBGey9kKEZ8QImO48MGglcGc56iQHZA/qMpzZxBVfELtMgmQPtutFPYlh82/4d6KtjBzO1js2C6lIUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mAs0ZWqb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mAs0ZWqb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6d63afb5so121032e87.1
        for <llvm@lists.linux.dev>; Sat, 30 Aug 2025 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756547397; x=1757152197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRNROOHHAw2Bc/THJAy9MOJuP831ZvEwTWSfbFMLjGk=;
        b=mAs0ZWqbBbaYaa/v4atIdg5LJhf/B2m/AKvwLHgiD+B8tvsXWtwYIVnZ0oEiFsu10o
         T2Pa0AqgEz2fy+Iktv/pWVdA5r40cV+YBfoMxxJnJIezyqDJHJsnh53Grv7RZR0MOxnS
         /SpRv1rKrhOqoH+ZooZ/ibUHo4jDQ+iWM0M4cPvnG/P5/96NHdlZWuBgKUP6ijzAkVzM
         JwBFWB2lBXPiIZOhaBqYg03OWcPfCX0+tiZ1kvOTArklWDOGjrU8jfC9OENatdyTGm1I
         Lx0cLnJGMSfjv+qrOzGDF11sen7CqJh/c6y5rAevJboVnhMpfagkUUpAonxGRcQIo9kZ
         D5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756547397; x=1757152197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRNROOHHAw2Bc/THJAy9MOJuP831ZvEwTWSfbFMLjGk=;
        b=YsC1EpOyS0xRFD5A1Ratzsx7InWjLZzSOXUkQV0yyAwQKTEqz9TT5igbOMtSsvFsmo
         JPXbUVU6txqs731b6DppRSJ3zfzmP/h7GcO9BNH41MdZXaMLRxgiWRdnznqe6uBFXzfh
         EH+GgsIPNWKtGO9q3U26Ewgxpi+iCF2guFzvR7/H1snrTSz9Tw0Hjzyq85YRZCghe+/4
         zJqCBY6uy5CsToUrsvNwzTzKPVO6TTF0Ufk13Q4HJMFxJdmC+vpSPcDTRMJVj1Xmgl2D
         0WKCk++IlWe9ZmTxahK5wxiLnfredSCSU9XpoWZxCCHqBYmrKbIG4lgYbHQ06fE4v++T
         gffQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIrhTkOREx4hHDm7tnaQrw8CxgmrMihv2ZxNX2vzvIaJrJ31gl+NwPkmKPpZ7ElOxzjy0t@lists.linux.dev
X-Gm-Message-State: AOJu0YyoG8xe13i1Dd1lnx/gPgo8KvC3d8vH8ss9a47B/DZh7bpNIu09
	BFRRgHbLHWxFX8gSLoxqWtz8EtA6fwnTHgcPbbEatGLjRJ3airB4cGzyEvVzgaMLNLJ+E0kCzMB
	DpPyy
X-Gm-Gg: ASbGncsUYg5hmvlGkW1Aye5bBIkW7wwHrnsYi2ld4+3sWDu/iRvN5MisLoOY/x+8RL+
	JvfhTVSrQVxOfcarq1plr+bDd7UNog3c2oTFzyYu+6KzA45oWKyru+Ndq6BcZkbklTXbt+LwEzW
	Zv5svYDRWUFB37JZ7PxZy7XmMnNydcpwKx8/z16nL7rUe5Sestg4SX3nQ5bfMr9/icE64Dw0LY7
	VAfhi4ozJZdZsRGKGJrGB3jemmphlXfG8dyOxT5k21vHuojqeCDSqIbARazVeEwC7vnK3l3ohN6
	Bb5sJKCe7QA+dDwJB8EHM3JDBvQzQ1s4c+HsFjIh3uS4y3IvlPyQnHe9URgivvPCp4quPoxCT3x
	PuLzdvVJLlgnwBeaY0GtGg3WhKmZ+RE6KabEJr/36+J6+jXN/yGRFcnxct091+qvO0aYx
X-Google-Smtp-Source: AGHT+IG3HJ4okzHDbXzyC+DgyjCqGWEYnjZkIT75Na3msr+BLTTBdvc2Ju4vaDO6zUBBUpv9efwGtg==
X-Received: by 2002:a05:6512:104e:b0:55f:612b:b350 with SMTP id 2adb3069b0e04-55f6afd91d7mr563621e87.3.1756547396895;
        Sat, 30 Aug 2025 02:49:56 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-55f6784fdcbsm1325961e87.98.2025.08.30.02.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:49:56 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: peter.ujfalusi@gmail.com,
	vkoul@kernel.org,
	nathan@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	benjamin.copeland@linaro.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCHv2] dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
Date: Sat, 30 Aug 2025 11:49:53 +0200
Message-ID: <20250830094953.3038012-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829232132.GA1983886@ax162>
References: <20250829232132.GA1983886@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a critical memory allocation bug in edma_setup_from_hw() where
queue_priority_map was allocated with insufficient memory. The code
declared queue_priority_map as s8 (*)[2] (pointer to array of 2 s8),
but allocated memory using sizeof(s8) instead of the correct size.

This caused out-of-bounds memory writes when accessing:
  queue_priority_map[i][0] = i;
  queue_priority_map[i][1] = i;

The bug manifested as kernel crashes with "Oops - undefined instruction"
on ARM platforms (BeagleBoard-X15) during EDMA driver probe, as the
memory corruption triggered kernel hardening features on Clang.

Change the allocation to use sizeof(*queue_priority_map) which
automatically gets the correct size for the 2D array structure.

Fixes: 2b6b3b742019 ("ARM/dmaengine: edma: Merge the two drivers under drivers/dma/")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/dma/ti/edma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 3ed406f08c44..552be71db6c4 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2064,8 +2064,8 @@ static int edma_setup_from_hw(struct device *dev, struct edma_soc_info *pdata,
 	 * priority. So Q0 is the highest priority queue and the last queue has
 	 * the lowest priority.
 	 */
-	queue_priority_map = devm_kcalloc(dev, ecc->num_tc + 1, sizeof(s8),
-					  GFP_KERNEL);
+	queue_priority_map = devm_kcalloc(dev, ecc->num_tc + 1,
+					  sizeof(*queue_priority_map), GFP_KERNEL);
 	if (!queue_priority_map)
 		return -ENOMEM;
 
-- 
2.50.1

