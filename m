Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328B76413
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643125; cv=none; b=VoHIrvpCljbxyuNeLuRc3J5YpCrA3NLr5+z9kKLbhd3d1ykCmrY1uzahbK96+dNlmo38ZVKF8Rh1qp/bvXRZdkjnjBGyYwANpOBHkXvtNf4delLiv4vRUn+PIRIAR1fviwke1CCTsKcINiQslfTeGRNufFZgeL2EYCgcsH27Zn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643125; c=relaxed/simple;
	bh=n+EOKrjOyFwBtqRSR4DqiXVEGHHNMUiIaHIFFgQ4+cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J1jBJrZhgICz12COYS5IhUt/kyhDlev1SwD15yHXtT30ajtR29997SpBgaYRDuq1iltb6V0UdIKrAZEvfYmFDcDtEInR9I6kww5X90m7SRB++WwEOc78vTNZEf9zCv4/q66ki+ze1b7u2S5QLIaCxKhGWBBNZQyH7mmM3kYCdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YNkFZraf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YNkFZraf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e244c7cbf8so43834075ad.0
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643123; x=1713247923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otFFuZ99fXcVhYb8FNCR9GjZzpzmViSqESgMKU4iT8s=;
        b=YNkFZrafjqgcgXAIO1fHxZexHs/PtJZGxpOhTq4Q0Y8q1p5/5LqplNcRbWoXHUWi/H
         DdVq3oKwXLWcKO0Q6t1fiIipQa0hXA6RGv0g3gZF04ADNMsjIp5ywZcfW3JmFxrqTBYy
         UbIJyXOgV8gHQiGIx9GRXPOth1th1ZrnpXA38PvyW/goVtiAfLMmJSbdrm+8Cf5yfv4D
         Wi8Ss04crimnp2TqyThcWW42ofXZ+aRyqLEGOUpCnjGEiNo7uM96qlZAda3stSvIrDmj
         qNmaPeATWwoSQS2iq1w7pRsYO39AXPDOyEVAC2HQhnBqdknG67cMuHHd9NvhLiqCgolK
         d35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643123; x=1713247923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otFFuZ99fXcVhYb8FNCR9GjZzpzmViSqESgMKU4iT8s=;
        b=p20qWoYbzizPfM+GkLsNsqupdXSl9Edm6pweK69MPDppEQkQpJWbxhTHuj12QvJg0Y
         YpSkV06HVhKZEMS/aYzfkCC+aS8AbNLLm3AK7RY0r9P6a29hxnIKWrMn0xt+xhEHftSe
         bO4X2c6xOawS028m9DCoxXP9ylz75t4DaPePkTNdRQDelOIlEyvWkKdC0oD/R/S6cXAt
         qSLTOzKIWdQtr12CiLK1oFjhYvHY+H4//4/+Kn0P3q4VXHYlHFo1nxQ2TaFMuc9IhrpD
         896fil+MJ853ZTK2fkEpq9wRyxTYuKA93nKtdQU6qIGWxzVBbBeFGlMr6s5N47mNAycj
         Anfg==
X-Forwarded-Encrypted: i=1; AJvYcCWa+PEk8pJWw8bWL/ElqwOgPxTsP/GN4K9jhoN5OqWI3mYT+7JG3dXcttqOG+bSMDsWi7z88LJnCH0ybDL9ez0bzx+e/Q==
X-Gm-Message-State: AOJu0YyW8b7dybNlWhpWx0MgjXdI0m1xspnNhT/vG/hV++S/iek9pEs/
	C/qrpLgemywOHx0ha9DnuWU9B7c1FgsqS6P1DulOOAVVtZSCj3+FFO0LYl0aUWw=
X-Google-Smtp-Source: AGHT+IFyiikZL/hhay4BjKgWK3lEvoskg6V/4zLFxKB+Bpw4p7lBdSTWw7dgsT6Vm8oj6bbr2fXrdA==
X-Received: by 2002:a17:902:c40c:b0:1e4:62e2:fc86 with SMTP id k12-20020a170902c40c00b001e462e2fc86mr3254513plk.7.1712643123055;
        Mon, 08 Apr 2024 23:12:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 03/12] riscv: after saving expected landing pad (elp), clear elp state
Date: Mon,  8 Apr 2024 23:10:34 -0700
Message-Id: <20240409061043.3269676-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On trap entry, save expected landing pad state and subsequently clear it
in sstatus so that if there are traps later on in kernel and sret happens
back to same mode, cpu will start faulting.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481a..be07355b9eff 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -56,7 +56,7 @@ SYM_CODE_START(handle_exception)
 	 * Disable the FPU/Vector to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS_VS | SR_ELP
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
-- 
2.43.2

