Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA412C490;
	Wed,  1 May 2024 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714569853; cv=none; b=Q5nFEwFW5pspDUIM/TXRzoqsrQ/OvugD8dfER2ECbeZrch110GWnEnKu0Rf7jiMzRgFxG1jyt5QR1edBBt6f056fkC50d9XOITNz6Y8uJrddewypT3beODud2pLCumXrk/xf/pSLL+RoP4uARcmDUdbVE7iLeu0ryU1VUQvbXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714569853; c=relaxed/simple;
	bh=lMYzmV9//9INyU1Duoqy4uVKWMnnmekE58fSm7AFEL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZ8Ga8ueHTgYHS4y3hSy9dOOESLa4J1VVVzD0ZLlsou0CfTzx8/I2ujaMEcBz/kLqhPVwIL+0BTcbbeH+SUp8RBzBalDoU4csjcGMQoZo7t9bBTPPVeD1p3pYfMa0DQIcXIXSJ5KScposYheP9wp8JD1Sexe757T5xz2HBRmPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7vm0ISQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7vm0ISQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f07de6ab93so6353654b3a.2;
        Wed, 01 May 2024 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714569851; x=1715174651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMBFEPpX0chiN/ZQJQtqfNtd+/I0a6HtphalfcoEIRs=;
        b=I7vm0ISQyjka5yMz/qsszKHw9+eFk1G9IEOqmCII5OxXPi2Qn5FZNGL+bn/sc1Utuv
         2SdE7NpXpgY5ymzAKiAN0DSl77wn0D4MhaRDa/kHwUUHnI5M+ik67MfMjTFocMtohjxp
         +wuLFZsmzfsdQ6LqYkrOjj2Q9bd8Cj7Rjyd6TbYo16WagJ2Xq5VTysOXG1Z3GbrGKyup
         CNkcwJyH6UBTKs9/ncRNXfYQbTrx2l0DkjTqqyP5hWs9SL2/4oEZz+E4dbQ+bq1lOIEa
         Mfk8Kd2UZArHhVI4ByaG8eIyWkYpSZE2klb5uBgRtwW2pDowK+scmilzblEoXEA7yFDK
         /aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714569851; x=1715174651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMBFEPpX0chiN/ZQJQtqfNtd+/I0a6HtphalfcoEIRs=;
        b=l3taULYxakpd2B5azLcDvL6gj4f9l0BqcWhE0usussdzubiTeuAKApKgCmnvL8r+HJ
         idesEYoQFUuZYXAB2b1Mv6JpKUpvHFqSFmgdHiSe4ojILIx8kx3F8C0nm/T8DbbbUd4V
         XEouZO+zmqlqlSo1p9Fp8zPr3h8gMAhY/e4p/gwDx3fGN6higYExB1pMvYpybnz3fU1i
         APOkYcWvfC4y5UprF2QN7PhnqOCHHMA7CVacLoAvp54Ythq2TuzYi+klFJjBlNaJI1/1
         UEVyn1SF4AuSBw4pvdnmPw1rb4zEe/uL0wgDuSaKmSXNj/EsB8j9yn362olonumuhU/6
         UI9g==
X-Forwarded-Encrypted: i=1; AJvYcCVvnfg0Fr2wl3/zoF/QBsKS7urnki+gczl/vPscKs/2RPryUNOtqrKQilaA8+ioTCP3PsUGZGmOQ2FdAxUhMTOJrTQnrfjplqfzDcLZnMjNNxKbMwMRpcKkDTOOGFOsgQd56EY=
X-Gm-Message-State: AOJu0YyWQ6tKOd81H1uzHG5o4Ob5N3Goj0ssaenZCHR9nvHwn0WiES3U
	8x5iCNliRAhy0u8pq8EqMe9jCpj7Up8X4L7kSbF92nNKOUz5weU5
X-Google-Smtp-Source: AGHT+IGWQGHARDT9zOyTneCFcfF0M9DcNNCQix+mRZM8KZme0cTKD+4AVFAz6FeVhl6PzTx0E67ZUg==
X-Received: by 2002:a05:6a21:3996:b0:1ac:4fca:23c2 with SMTP id ad22-20020a056a21399600b001ac4fca23c2mr2514825pzc.8.1714569850990;
        Wed, 01 May 2024 06:24:10 -0700 (PDT)
Received: from localhost.localdomain ([49.142.40.215])
        by smtp.gmail.com with ESMTPSA id g3-20020aa79dc3000000b006f2909ab504sm17809894pfq.53.2024.05.01.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:24:10 -0700 (PDT)
From: skseofh@gmail.com
To: lkp@intel.com
Cc: daero_le.lee@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	rppt@kernel.org,
	saravanak@google.com,
	skseofh@gmail.com
Subject: [PATCH v2] of: of_reserved_mem: clean-up reserved memory with no-map
Date: Wed,  1 May 2024 22:23:59 +0900
Message-Id: <20240501132359.488616-1-skseofh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202405011208.qsZQwChO-lkp@intel.com>
References: <202405011208.qsZQwChO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daero Lee <daero_le.lee@samsung.com>

In early_init_dt_reserve_memory we only add memory w/o no-map flag to
memblock.reserved. But we need to add memory w/ no-map flag to
memblock.reserved, because NOMAP and memblock.reserved are semantically
different.

Signed-off-by: Daero Lee <daero_le.lee@samsung.com>
---
 drivers/of/of_reserved_mem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8236ecae2953..d00a17a9cebc 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -81,6 +81,7 @@ static void __init fdt_reserved_mem_save_node(unsigned long node, const char *un
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
 					       phys_addr_t size, bool nomap)
 {
+	int err = 0;
 	if (nomap) {
 		/*
 		 * If the memory is already reserved (by another region), we
@@ -91,7 +92,10 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 		    memblock_is_region_reserved(base, size))
 			return -EBUSY;
 
-		return memblock_mark_nomap(base, size);
+
+		err = memblock_mark_nomap(base, size);
+		if (err)
+			return err;
 	}
 	return memblock_reserve(base, size);
 }
-- 
2.25.1

