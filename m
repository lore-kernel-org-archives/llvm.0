Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0415688C
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569880; cv=none; b=aRwY0CybDSmLrokTrZYkZlKq911s40Mp0ncXqonTkZXBDlUHUg04vWZmaOvQmdA4ZYiVW4wFZQwklWVorX0DNp4WYybRpu0zBvwALaO/HD6INnNZZp9CP/H71/S78wC+R+yTfasDcivqQBXnSF2Gtt+JkHwLfRRmN9eH49dacrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569880; c=relaxed/simple;
	bh=YamZzvhmaDu6jNuMTIZ5BlSZQSa1W1+FOr371olPtTw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dFIbVR6C0C1sL/DWOG8TUKnVidhnLa5R2SXZ8Mo1Oc7nGmra1Lebory8iDy16FFM5YyI0URi2W4JMHmLOuxK+RpiVyyovMGVt5ilgKDvsceaPELJiAt2Ub3eH8daKveDbi8DsxVrq6PG3KwZO4Q8f94FBiNOSf48Ul63ilTjN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NATpG+Dm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NATpG+Dm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431616c23b5so17110785e9.0
        for <llvm@lists.linux.dev>; Sat, 02 Nov 2024 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730569877; x=1731174677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CXMuB9N8iV8ohwDfKCUDi+5Z+yxX91mIom7ZPwIqV+s=;
        b=NATpG+Dmk4HiAXoQDBWhWYQ+TcTw5gS60XTNe+pQRYoQ+/GSGUVVbiqCKUU1DMn3kg
         xnAZ33hjYM20g9fPiNGZqJRaLw9zceBD0vQ2T/qfRfLlwdJEeWRQaskAky3Vtm4jeSo2
         FvpsWWGBn6dwzWD5KBfq2vVM0A5hVi/2pUzfZowI+d8q+hkGu+WZLBBr+3IBYKBQRoGa
         X9eePhQTe8SAn8xeFIn1bJGLV6/U3cbrS5wEbJB9mHbfE1UkvG26D/5KZG2yjVaJ+oC7
         6n7ZKw56jqBD06KiHRPiRmTWwTSuVapmeIBOvAW/j0yz/U2SG/B0Xnj4NfoMGwAYQZHU
         PbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569877; x=1731174677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXMuB9N8iV8ohwDfKCUDi+5Z+yxX91mIom7ZPwIqV+s=;
        b=C6gRUPvCQVOXPZ2HHybQFdDxHKd5Zt7QLphMJzs7+VMA+RbTnJXBMvGpnEHn5KJP2W
         DM0qRGf9JfEQ/+7PWjPTghPfVtO/CC0B6dnXnr7Pi4IA6x8avS1eJhOWaqrJ2TEBV/PI
         JrwP9eN7kDeCvTxArYyr7IkRosBRyJNY2TLFcxs3+qLteDA7CwNbYB4xnEnuING8L/2W
         I+pteyrCWSxp0iOtxTkH23vbUWU75YKdblxPcQcHtd0U89TFBo9X80WY8aQMtHYae7oA
         SQszeCTDXGvmYb7e95+zG4/2LTBalRNZaFlvjFip5l03Oqc2ZyFkqa6+3brb9A51UvKh
         nQHA==
X-Forwarded-Encrypted: i=1; AJvYcCXOCQyoLv6BoD7M1C8BPwmmymAOh2YBoYD7HOjdR6SDlguDzKBE2NZmkcMVlhprPHTJycEX@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqy2UqQVVj/FpHvhX+sxvZyTqZksGRXS45juZlXC9+RbMvCIKw
	VXxJhQNlzYSu4ql1kj4NEumiBhbuQ2d9efDzgnfIIz5nQRYYwEBx
X-Google-Smtp-Source: AGHT+IG4ErV019b24ATJCRbM47/c0+opqsvXEfIywMoSiIaC/9Pmiq6VSJ0+BXswztHALWT6hLxtkQ==
X-Received: by 2002:a05:600c:1d08:b0:431:559d:4103 with SMTP id 5b1f17b1804b1-4327daa3507mr83554475e9.7.1730569877333;
        Sat, 02 Nov 2024 10:51:17 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431bd9aa611sm131471715e9.34.2024.11.02.10.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 10:51:16 -0700 (PDT)
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
Subject: [PATCH v6 1/3] spinlock: extend guard with spinlock_bh variants
Date: Sat,  2 Nov 2024 18:50:33 +0100
Message-ID: <20241102175045.10408-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Changes v5:
- Add Ack tag
Changes v4:
- Out of RFC
Changes v2:
- Add this patch

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

