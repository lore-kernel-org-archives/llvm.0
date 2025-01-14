Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153B1E2309
	for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858520; cv=none; b=IaTylH156BTl8ZkzFO2cQ8F5Qh1ehRpdRtCfFlthIhUcgIPLnpP/vDiqb1I5K93XjV3ctMMqd9G6wuIPMdZ1e/UcTVJK7tfNzjCRSOtkBHnpfODVpB8QWuMD2qN9C8ULViRBKSZkC7oRYg84hElwZJLQ6ST64Qk0Btnq1xi0DbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858520; c=relaxed/simple;
	bh=etUkdgGOAeKQsofCjyp34uBeNTm3qccykJ4LE5ZFruA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLDYYKnCb7is7ezbxoSZGauYkq979ylrWNp+cFChARhBK2xQGH1+dR/hTkrtSNqwRdfGn3Bpgm/RhKfu8eKBwT9z9TnBhroK1Cm2o1m4n1vn0DSAKehowgHoWaHNjuTX6DF/nBLC7vsaQF8sBwnsm+ZXJlEyF200zq1k50aaf2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbDGGotQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbDGGotQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so38876955e9.1
        for <llvm@lists.linux.dev>; Tue, 14 Jan 2025 04:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858517; x=1737463317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=fbDGGotQlexbW/kPIyEILbsm1PHC1TGT2lMi1d81y20XVWIhtkNn/rgCBjVldN+5Dv
         5gJJ3sjs2nhCBSH5I8djuWUG9QiS5hS20MpxImd03vNTFg97LevAEPLaAi1NZHGTBz9Q
         gB3rvizO7vFE0LCSpflU7m2X+rAiVRraihyFh488G4mPKfRoiMXcLK6TuYrZ3De32ZX2
         47scDJjmu4jmfOI24fcRf7G9penCPvcGEAIxcf+MNm+J0jnJHlU8Fe4r3lw/On9xLzki
         4jj/nvOalmgZr+UvESnaOAg9dehem+jb7SjSNZVAm/S7ouEPVEOP2muhRIOgx34KU+HM
         IdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858517; x=1737463317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=PlAEVKiHYa28SdauHEpcxMnylUlcSg5GdIKcvGahOIv0wr7intuzosvqFDpjyorPcN
         v3/H9ZZ8Yw3+rz84LQb90jhA9E2nbWH/qA4nT14dEWK5IzZudpIdH40cor/KhySgIPR5
         I3rEp4KO6e4Ktz6B1thHwa8frSXB8ryAEV0X1d5UU9x4L6UtoQz1H7bMosEfv4Fg+IEW
         d2imKWai2foDl3+2VAJvepzdcFT5bccH6PqG3E+u86JN2YjKK16Vd3/07Kg4lRVhUng4
         21UgjwQAPnWE6/fJEMqjCbx/GxZgxsRJEeS1GNjFxw/yk/GL0F/TkBKjLq+sDjHG7GRh
         l/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUr7aLL0g51ZnjTGbqc+KacaaV8VuI8uel53xBdCaAbb/EKJCEN9jH0T6cIuxXzwOCBeSoR@lists.linux.dev
X-Gm-Message-State: AOJu0YzadolC6UfQCY9i64ytXTq6SYGepcXT7WAyCPcfy9DU9huYANjf
	SwzqVeEMJeDxs0DQQDHqQFgKxuOURJGYtynw50+GsVPeup80I0/2
X-Gm-Gg: ASbGncs7dj3gylsQpF1p4J9FDMa/Q1HHrmijMhqORjn9zfhrixWvGjNVXsBW2YyFsC1
	eF2Ux7Vdrk5V1BfVpwaY/aZ2qBcXp7MeYKPctN2aprI4lDZ10gGkfa8CQt1jvloLFsdlCoE2G4Z
	/mTNVy68LqbqVfIBhav+PinrNYEXFNpvL94jDPWjYGULhW2EtCL14n4UxXnwDi01FEUxsU9ozpt
	PXegeIwXtlvlC5B8ZjrDpHqn+y+xCxu6qXNgvuQP4AwlxXKfiuXjfO0TU4SJD9r2Q2qIv7dEEpt
	v0/31FFtPhVHx35OpSp+x/dthw==
X-Google-Smtp-Source: AGHT+IGnbebatGAOiJ3fjOKMQPS+jkDpP6sYR3bmMOHCqroBtsQ1XYlDJmLLnxvAZWV1clSRm5lr1Q==
X-Received: by 2002:a05:600c:1c14:b0:434:f0df:a14 with SMTP id 5b1f17b1804b1-436e26786a4mr52023115e9.2.1736858516797;
        Tue, 14 Jan 2025 04:41:56 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm14798771f8f.54.2025.01.14.04.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:41:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	upstream@airoha.com
Subject: [PATCH v11 1/3] spinlock: extend guard with spinlock_bh variants
Date: Tue, 14 Jan 2025 13:36:34 +0100
Message-ID: <20250114123935.18346-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114123935.18346-1-ansuelsmth@gmail.com>
References: <20250114123935.18346-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend guard APIs with missing raw/spinlock_bh variants.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/spinlock.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 63dd8cf3c3c2..d3561c4a080e 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -548,6 +548,12 @@ DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
 
 DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
 
+DEFINE_LOCK_GUARD_1(raw_spinlock_bh, raw_spinlock_t,
+		    raw_spin_lock_bh(_T->lock),
+		    raw_spin_unlock_bh(_T->lock))
+
+DEFINE_LOCK_GUARD_1_COND(raw_spinlock_bh, _try, raw_spin_trylock_bh(_T->lock))
+
 DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
 		    raw_spin_lock_irqsave(_T->lock, _T->flags),
 		    raw_spin_unlock_irqrestore(_T->lock, _T->flags),
@@ -569,6 +575,13 @@ DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
 DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
 			 spin_trylock_irq(_T->lock))
 
+DEFINE_LOCK_GUARD_1(spinlock_bh, spinlock_t,
+		    spin_lock_bh(_T->lock),
+		    spin_unlock_bh(_T->lock))
+
+DEFINE_LOCK_GUARD_1_COND(spinlock_bh, _try,
+			 spin_trylock_bh(_T->lock))
+
 DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
 		    spin_lock_irqsave(_T->lock, _T->flags),
 		    spin_unlock_irqrestore(_T->lock, _T->flags),
-- 
2.45.2

