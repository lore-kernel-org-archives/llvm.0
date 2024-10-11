Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A39216432
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647684; cv=none; b=MFKTY7HU2ImQD1c2K+DHSYSY4Pr5ck7/t5525BEp3Hn9fmS9N/QFuFCaUWFZlyE1mZf1th+nb3jYTCDfs2XmYD3QrjWdWU/Nn6Ve3KToM4laHUw1Q0gVZ8xX5rtuuZ+EMNHHMFtWzTwpPi0VxGZp85xzOck8MQnq91fE6xi+y04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647684; c=relaxed/simple;
	bh=BH4DbbmMQUbDmGpkllQVRVVJhPfwORuNLGg9TXD6Tiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgPsfWg30Nf4Ka6pgcOkIdKkKjLaDUX/UJUDZzWYZhXbxiXwQ/7TrVQVacGLm7Izd28fayrj4Le9lr7/cyGKNWKXarBvXExljW1VTTesTBkZ1XrC6HOQrbHMIPNJUYWVTAquaFccRWU8S5l6PFGQXQvY81alEfh0kqocxmaAgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYEjetI8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYEjetI8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b93887decso18258225ad.3
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728647682; x=1729252482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0M9rAFbcV+izFFMOP8m5z+SO85I3Ch0rIJacPyB8ek=;
        b=dYEjetI8e/+L8eA2JllXLmx5O1kPIXlCYfMBZbuPUlM++F+eLoYdYHN+A072dek3//
         l055AKFx9Y1gBL37RzXqhBCljOb9+ZLJ/Ev7VMysGX73Rnh5zFAFg+v9749zY6jmBJ0S
         ZkCjO3CPm6EQPyTLPSOw6tbUkjQpvMN4PpjtssguwMnZlXlDI7j0cQfrXYjtIcpFf0Nq
         l8HIfWh9MuZnahMd3WTE09o9zpncqxOUWR9HDAJZWfuobNSgFW5hrP40rRBu+wZlGOXK
         /WcTKV8ortvG3ZrGkvEAqqvwQyw3myp4ilePdc2fQzckt+3FYrkjFxjuYIyoxzg2nmL4
         K5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647682; x=1729252482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0M9rAFbcV+izFFMOP8m5z+SO85I3Ch0rIJacPyB8ek=;
        b=cj4OQ0E5wBp5XOq3VMapIPTZma/Dlews/i3dvOhjl5b2Jni14u/VCAxDc9ubZg4uM0
         hILbfExUYA17rprx3sZXIoI0VedIFvVT1TsV+9dgDOZhsrh86LtsBSbFrvSAVRTWwFpQ
         0Ob6Oysyg/cCe5WeQggvZY3hSTEmGQDwo/x+20MELJVcBiJBOwcbHCE4p9/pY2zDsKMa
         CAyzTMdtaUlVYmKSvbv3L+aoZY5vq42i6HpRxS04T4PBVV6kUt+oSwqcjIcnXDvImH+J
         sRof8nN59RvvFyHryA2FwjlYhqcjB61akWnXqFehYk+UmOGz72xSeR6/SXt+aJgjRVcW
         0zpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8mxf+S5kV+QPQ3lrNMiDdHIx40CHqtxNCwmJSCYNvaGVwsO06V4dKJHRPVp+pPY2twdKG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2/q9HrzfNbm9FLYGZXLKwrFv2GOS0B+GbQ2WssxLPj0QHrd+d
	sacml3rMLNlmluoGQ9UVaOHZLtIT34M++bBUKRModSRbXSEeFlZJ
X-Google-Smtp-Source: AGHT+IFWWVOZXb6Mget6b+bWzMDShsv+T0KKOi2cgOJQlaJd94yNCHHf+KVc/uLTiV9ebyDumvxcIQ==
X-Received: by 2002:a17:903:191:b0:20b:9c8c:e9f3 with SMTP id d9443c01a7336-20ca1458e3amr31858825ad.14.1728647681927;
        Fri, 11 Oct 2024 04:54:41 -0700 (PDT)
Received: from ernestox.. (2001-b400-e2af-f494-1c09-712f-68dc-c3fd.emome-ip6.hinet.net. [2001:b400:e2af:f494:1c09:712f:68dc:c3fd])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20c8bad32a0sm22298575ad.11.2024.10.11.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:54:41 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] iio: Fix uninitialized variable
Date: Fri, 11 Oct 2024 19:52:24 +0800
Message-ID: <20241011115334.367736-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011093752.30685-1-0xff07@gmail.com>
References: <20241011093752.30685-1-0xff07@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang found that the "offset" in bmp580_trigger_handler doesn't get
initialized before access. Add proper initialization to this variable.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
Change in v2:
- Make value initialization immediate before its first use.
- Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07@gmail.com/

---
 drivers/iio/pressure/bmp280-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f4df222ed0c3..682329f81886 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
 		goto out;
 	}
 
+	offset = 0;
+
 	/* Pressure calculations */
 	memcpy(&data->sensor_data[offset], &data->buf[3], 3);
 
-- 
2.43.0

