Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208E22B59B
	for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 20:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863766; cv=none; b=Ja3RpjrZFJrTzcAztFoLcKBbdx4+PTN0I0G0prNWT4RDq3n4RYIXsDCoeW8Bhn1XW+OQYl3qnRhBGylclOtUhR/HTdHuI7dVv5/rdRCFWN9rczfaGBxHJa2RkuywqJTQKmVDaUajtiEEgzjt5sQqDR3r3mS5OtbP8hOYWtegD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863766; c=relaxed/simple;
	bh=etUkdgGOAeKQsofCjyp34uBeNTm3qccykJ4LE5ZFruA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQn/a20vfCkrjnQONvMmdyai+Geaj6tlayebwCBJ8XlYQkQOPzWFpMmOuFiiN/Z/YDBx5tKtlbdKADKepT43YJPmh2hMxY5fXWN+x8ZFXYWZ2ACMBG4IgQ5aXaKhFiopyclf+O4aANOC7B0Do31JHdapOj4YGyAfQPUKnt6r1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVbLiP85; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVbLiP85"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361a50e337so5022345e9.0
        for <llvm@lists.linux.dev>; Tue, 10 Dec 2024 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863763; x=1734468563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=KVbLiP85U9Q8rq8A7xDjN0znAv3vpOXncG0doxrPDIyMtZUSvJahozm0lEnyp+iWrC
         x8OgZqDO9er0ILU48dB9ZfMryvncNn5lpNaovEbTfI34CoeE+Ppe96Y86kITqH34HYvk
         XpYrmXtgQ+UacVv4U1RbEF78ce2806l+vpb1cYGu12Q21J+MoODjMfNsbe6flO+3KSA4
         Iq3tM8hJwYYSsN2BYmMf3V4e68UTHW/u/HaddrbMxOPcq61dWbmBb+o0A2dr7u7bnY2g
         QOdqgmE5AOrJU711E2ObVzJ1v1TNBvHZ8DP0Cf4Mo4m71E5Kf4J2kzr07B+veCgUVsiU
         j4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863763; x=1734468563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=s9BsBpSkJ/Kdb4rtHWtITqMr24Vl86RCBqyWTdmgW7zIMDag711dY5SlBveZ0G8DWY
         KahavW8JmxMmwBasWAoOt/wujqVEo2O9MJAJHHciA9lSPno1e+73L1houAXYEd4Qv22Z
         Zsng8/GY/QpI6UoyrkAyxj+uzGMUfp6yfXpDCkl7D/MZaN6K8QoPzvqp2EzaEmAri379
         ezjjTmgOP4morOL3xY0hZeXnbxCOHVyTO2Jv92ko9Rq0uJDQUIx8omB6kYi//ov+4jO3
         meY+HawSOCzXJ+tVwYHWxUcG6K7teb82nSNTHCKDPUZpOOKLex3V3eFTPZXetZPpEIiy
         yBlA==
X-Forwarded-Encrypted: i=1; AJvYcCViBqhGdueY9cMsvuiBuih2iRfOAd75jMWHt6wCMd3rsQmBtFDAJbaa52LXg+gwObh3zbxg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8BiWNoWNlNpnz6O1KyF7KM0QBkN3LaOn+0gzcxy61u7lIIduB
	ZixoskLjM7xUGKTj0mTpexztBFQnOWdOLsbZh9wRsuyGN54aWdMD
X-Gm-Gg: ASbGncsEtt0igIF3+MzDxM4U0IEM9KyoYEmg7/UneYEwD/ynMdZ5l3c+4Ee7WPexcl9
	Vksc5PkOJhX2VFqgyOgEnRWeFBL+U7GmWiaW08hw5POK/vNzm4jXvmMRK82lePu3h+GyKmLavPu
	lpJz0KDagYwjJ+b0e5UiXUZNLjMM61lxTgSzU/OZ5JFFbIeSRxiQFd8VIM4k9OabDwvf/jqy7v8
	lBzKWLfJ+I8onDJkcVjCorB8fDAhJpgSIFQd0sUfO48SAk0LTsYyXyD2e4MJqS1cqtx7pYwmThC
	15+x8Hn68rfedAHYC4ML1GE=
X-Google-Smtp-Source: AGHT+IHZp+NUH73dscQuYZ/2Rd2wKuMljBl3NtIdFrOR7rbxWGIGQYPnskLR76kS8T3Ksr9CszjJxA==
X-Received: by 2002:a05:6000:1867:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-3864cea41f2mr345776f8f.49.1733863762853;
        Tue, 10 Dec 2024 12:49:22 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-386334d0486sm11808307f8f.50.2024.12.10.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:49:21 -0800 (PST)
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
Subject: [PATCH v8 1/3] spinlock: extend guard with spinlock_bh variants
Date: Tue, 10 Dec 2024 21:48:31 +0100
Message-ID: <20241210204853.18765-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210204853.18765-1-ansuelsmth@gmail.com>
References: <20241210204853.18765-1-ansuelsmth@gmail.com>
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

