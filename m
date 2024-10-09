Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2430A1E131F
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728497113; cv=none; b=WyrtWYr4+F1S0VkE+25xk9ha8zpOQG1PUDk5NGq612QLw5OSg15wIEPSVEZp0D3EwfZxmISONZZ0aMyJiHYE/JFZ4n6QcJtqoOqpbuWUcWOLKv6Inpl9Q1QUQ7PtRzaTB9Rz2M+tZxUTPk5DlNLSiZk77V0aKaOBIhXe7kBqScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728497113; c=relaxed/simple;
	bh=dTst3TzcEyw3tRqilTUktgkbQoYxklC5Ta/NvbE8BKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JsacD37Qd7nsMv7PieaiVI2I4cHzzJ6yiUUI+s7Z3e7XI7eNONEiwCbks9jEdWsNm8bZWajD8rsrG8yncWDF57L5zVzPwlhAw4+EtLeMJP1c51Z3RRdD3ShRdCTskrfQA4zJFQ6TMCtGaaKhsbM+d2WmIIMM5PXozZAlaiklZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCjO+Jvq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCjO+Jvq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so51463e87.0
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728497110; x=1729101910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg5cj1gCluVnGdiYqSgBY4zdUcGWuMAkq5T51OVrPiA=;
        b=OCjO+JvqCWhqZzDcZCGe/FumOJPnheRWoTbDGv/3/eKP8a9U4XeS5pSMYBmmG+jEu4
         QNUZXKSI7gUPQLJSUz11Te1iAPTH9c99RyAsslKK3LAMiJO8D3XNWWrDCAJc21q9DbA2
         y33GtZYJ02CImJo0+AXQPg/iknGS8cAXow6KhBcwsrI0qWAiWqGxMSPTVd687DEpynMG
         C7HuUDL2ZP3c6TvzbSHvPkqZaRk3VWEwAg6f39wCM7S+Xrao0D+PQVkDvppNkdfcp5lf
         gKRlBOJvdRSASpX+HJV2wJnrS5J/bVI2b2Kmh5rTEUqxsKpsnS3umZAyTFqviTcR5Mb4
         D9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728497110; x=1729101910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg5cj1gCluVnGdiYqSgBY4zdUcGWuMAkq5T51OVrPiA=;
        b=rQiWxkr0suwH/qQ3p9CA9Tk56pebIsA4wrcS7kYEtscVWAAK5ZG6hCbQjBv7qCb6kj
         hKy9R4gvVL4SqKTSwE56npu5yr4PKWQHABr4gUrGjkzjaK/3AWYR2QOlCTlABhar7lsf
         4QfmVdVOl4h9jto9iJsXSXrI++SN6jRz7ASWS0KYSPm0udovNpqnr3/ulRDsAJtqquPD
         gG6aFY3u7l+V6YegzQ5VZZ7AZuRfBJ33T8T7ybyx+REvRdos5cT0Q0dLE6Dxv8Tu2I+A
         ZaRF8BXLqV8JNRLe1kbCpHAOHEwA8nDffREET7fDspek5aPRE37b6iZGQ8SBOHAALaKb
         nLmA==
X-Forwarded-Encrypted: i=1; AJvYcCUNIrBnQB+6hjLDWuka8nKvjZJwnLvteUnO+nKnSOZcJlMbV9vwKgws0HGK3XJif+Ke9LJn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3l4F2hqnFDNUnAuq6E0mDBmUmibfaGmQAiciQnIkHKtosOHE7
	IswCan0RBM8dYkFqla+pHH7ogSTuZlfNY/nd59B1bOsfdP7xqjCI
X-Google-Smtp-Source: AGHT+IEjRBA8jNMnfVfMn7a9XGrUXb9Bhm9Z7vnut0to/79rWfwo+X0c7kx8GI6nz487wAaM691i2w==
X-Received: by 2002:a05:6512:3e25:b0:52c:e17c:3741 with SMTP id 2adb3069b0e04-539c4892c13mr2452171e87.5.1728497109987;
        Wed, 09 Oct 2024 11:05:09 -0700 (PDT)
Received: from teknoraver-mbp.access.network ([89.101.6.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1697024fsm10972801f8f.95.2024.10.09.11.05.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Oct 2024 11:05:08 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Matteo Croce <teknoraver@meta.com>
Subject: [PATCH bpf] bpf: fix argument type in bpf_loop documentation
Date: Wed,  9 Oct 2024 19:05:00 +0100
Message-ID: <20241009180500.87367-1-technoboy85@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matteo Croce <teknoraver@meta.com>

The `index` argument to bpf_loop() is threaded as an u64.
This lead in a subtle verifier denial where clang cloned the argument
in another register[1].

[1] https://github.com/systemd/systemd/pull/34650#issuecomment-2401092895

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
 include/uapi/linux/bpf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 8ab4d8184b9d..874af0186fe8 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -5371,7 +5371,7 @@ union bpf_attr {
  *		Currently, the **flags** must be 0. Currently, nr_loops is
  *		limited to 1 << 23 (~8 million) loops.
  *
- *		long (\*callback_fn)(u32 index, void \*ctx);
+ *		long (\*callback_fn)(u64 index, void \*ctx);
  *
  *		where **index** is the current index in the loop. The index
  *		is zero-indexed.
-- 
2.46.0

