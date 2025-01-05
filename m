Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4741F154C0C
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736087553; cv=none; b=N82f6Y8JOHZwB9m+hqsTLbxWGpPpGZHk7njKAURtdHwGaRbsm4asCUNmXl8h9vovknTFFPiD6B5UkxMnAlanVgVBKDHFYBI+HlfN+1R9EgHLBHGnqvezyGG5OqEDuZxdL94r5bPUNS6HM8QuhHpGDAm93AWOTNufkUCaCDrCC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736087553; c=relaxed/simple;
	bh=etUkdgGOAeKQsofCjyp34uBeNTm3qccykJ4LE5ZFruA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twXu6nsugijnOauKrUs13TfZIFo/YvZvWTHIi6zIEmgnV6dz2x99x5nJFsY3FRkmPaDPKfqfZfBpXnizhnyks8vEx3fvbDfkSZ3SR7VlKobgmtgXMhoF2k3qrBfkmEnCiHBMZbf3Ye1C7vMjMW2TXBj3BW3xpkSihM2t7ehdELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFOkl5tf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFOkl5tf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43634b570c1so97195145e9.0
        for <llvm@lists.linux.dev>; Sun, 05 Jan 2025 06:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736087550; x=1736692350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=IFOkl5tf7Zo0l14L25YWQUtKazNdTL0+qm9H1T2Oi36lZj1jpJDNlbht4/7NzmlOSc
         HCQnlZPKriXQ4cJ7DSKKaRsh0+dlm1I/fEVFMCryqJwI7LlQfySwhTk8sLihW3EziJ8x
         i2QmvlQ8dOYYa5T3Q5HeECqHeb1DRk+ygLKKu5NnC+9oF6nKBcvWeIjFainxoYIUPk3f
         YlznmKhYkC97CqYQwfFPGiRf97M6wqCBMEzaxd2DqHvd4VASPoRtO6cqXNta/S8TIrDX
         xDfCeFNwUHfaGU07rGXfFhookDEJ2LMR7q20fkeRxQa3XXjgZoA5vd+pU3bhxV/PGwCZ
         mXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736087550; x=1736692350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=lVUEaH7GPc9eEX5jdeLOU+satBv6BcN/TwJSigX2KhzxZu1f+ij0v891lY0PgtoEDi
         6B84BXqKL+W7AGXRIcX2l6rpbOf3oHr1smzJRkl5E8SKmq2CHHfS7+TmHLxDuQ54szMA
         iUNlydQoiEeft/MeEDz/MIjCTRK5gEC+x8L61wIPIsbqvKwpVhCNtpPI/X6rYSBE/9L8
         WTFu6QNwDHLXGI/4wnTrghKSsX27Js1GKbTVHeRalrvOMXSYV5GCllSqrpYnFEEmzQA5
         Z5ccrtx1Cqu6yvmtPdjlfzmWY7Pb/AQZ4rWd5PTMNZFG5+DcUl6QwTTe31XyXIgIkHxb
         rVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHosBGyyk5sbpS/uFTmr0NLdwbdlkP8kmhEbJx5cc37PvLU1asYR/GJRGCZ4lKqQdYYSS0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Igd5Of2XDmBN7V7kvAukLVUhwJZoiOMl24lK+rvUbutnxyn/
	1EFfb/dkD+RNbDLguOKp340GiR5OKNAFIXVQjrIqKOdh4QvJFes0
X-Gm-Gg: ASbGnctrBsRlFn+6Mk0NfXXTbUsJrEoTPiespHp1F6VYk6CyeBlcWp1KlcbQiUGaJsK
	KuUcRGhk4nzbu4n9KKC+zU4JKg0tzC26UNm7TZZZ3bej8csIxpDPKvucQiKIG0m5eHB/x+DENS3
	gXGC7hc1KkmBVsYaghMhqzL2xHTLumA5hBQ9kJeFTYn9CeFcqUZ107Gdr/J7ajrx9rjxxde1APY
	OUT5tCwALtolAo0RC757mU8inSWNM/ev+gr/YNBnjF5uNq/oBoh+lPH9Dc8AGKFeZ00Uiu5Dg0k
	cVHi7LgaPaRu77A1xD4B7CM5LHP1AN7u+evXS5E+Yw==
X-Google-Smtp-Source: AGHT+IGWiRPIFba72Azh1VnX3B1DB2q4xW2k342SX73O+LavSRIo8sHD7IlluQkIFqBtY30AVoTvaA==
X-Received: by 2002:a5d:64ce:0:b0:385:f092:e16 with SMTP id ffacd0b85a97d-38a223fefbdmr49263388f8f.55.1736087550356;
        Sun, 05 Jan 2025 06:32:30 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm568189695e9.12.2025.01.05.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:32:29 -0800 (PST)
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
Subject: [PATCH v10 1/3] spinlock: extend guard with spinlock_bh variants
Date: Sun,  5 Jan 2025 15:30:46 +0100
Message-ID: <20250105143106.20989-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105143106.20989-1-ansuelsmth@gmail.com>
References: <20250105143106.20989-1-ansuelsmth@gmail.com>
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

