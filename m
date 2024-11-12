Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2E204935
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376798; cv=none; b=duLOVWZdHmiIj4IQ7Mir+cIUUAJIiTs75JCwCn4JUle7sDoJhF8obQ77PP0tuzn6O67ViLcuCGSrOu27cGESyxOXwNvZ6I/Yn/zEJmz+yc2i6zbwDAtyzbdBJRhpw/Ud7HhzlCdjxnURem8P8RoHSlN7EFs4Ow20K2aK7U4fiNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376798; c=relaxed/simple;
	bh=etUkdgGOAeKQsofCjyp34uBeNTm3qccykJ4LE5ZFruA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeDDpPOJntnrUXbdN6s4RQRdyLVnawJJCTZ4sc1K8omTLmSc889s/facrHGAefuv0Cq6qvsuzjybldAGKFm6Q/wmpCXY9nMJD34L2LeS5YTsIRMxqNqr1STVHqF69y0zOLbJRutmcdwmZF4mW2q1E1khFwKyV+3IXHa9HwGjvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boQEtUn2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boQEtUn2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43163667f0eso43709085e9.0
        for <llvm@lists.linux.dev>; Mon, 11 Nov 2024 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731376795; x=1731981595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=boQEtUn2Wdm7E9C3zh8eskRncsiVEbSfKMZk88Hau/rGHqY9bSTXmWkZo4ml2VX08f
         7MTmJttCAFJUAPhDxoMrhyYN+t7dHGV7lyUGyFBeZ877i7KXBsw7axeGDU+lFi4nTgOI
         AwAjCRQb3a/kkXlMbG71gY5D60nOOOPPdrgZi4RQ3P1jmsB9Y5cLHHcgMVzgiuXqHwNJ
         cUTH5iXGw13rNelBofZalX1VCj93U+xlOgG/Fktn1oziCZJQoxgYSbmMixKpxdx1fpgh
         OxaeOyixem+eG/dnnzBII3rQxT5CCIUrcIPcNs3t1OK/P0CC39Y+NQmp/Afly6ybuHMe
         7CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731376795; x=1731981595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=s+H0UvcEsdsAOWUo6uo3AZSgu3MAlv4rzakQlHKeZ5AczSJbkn31G4hXfIKiCGc1qE
         irGTf5hFuqpar+qMJN0/Ts3wGGhO2wN5jw5AadQXU8Ugtbxk9bn3LCDP26lLL0O4g4QQ
         FG3Ln+QNwGNDHnqwNNRgNQi2yAUyFiaMFwdurrh+Jjl/4XHFIXECILXC2+92lPv1cbXv
         ktHcxvaNdGAmHCZWzTV0JcbRdH1aOcTplb/4UkumhXghXvjPzMgU8nMAYBKZ4uyFcA7U
         +hMDvlUntA/OX0z3nOvr9v4TyCYjbrbP+P+AR/bvkl2YC06aBiyv5p95C2D6Xjom4UE7
         Nehw==
X-Forwarded-Encrypted: i=1; AJvYcCXg5OdfbjCZHpkXFWL5TcIBomWLkYEND8bax8rZ6pFUPLBotOtVaBRFpWoxntgLyCavpnn7@lists.linux.dev
X-Gm-Message-State: AOJu0YzprhHkywxEfaXs0wyuZRwuuQ8EWC10OU2WbZpSJB941F+lBUJj
	kPosJivT/IMaF/mpMGVj7+7+a4TKDiOYe7kybyYLNLw3ePOb1Par
X-Google-Smtp-Source: AGHT+IHtIiBjvui2dLlHQWA+JNw8CrocUSQ1ug6/f12hjo5XfVCqdpNoTambWlUjZUvI/KoHyZIQYw==
X-Received: by 2002:a05:600c:4e4f:b0:431:5533:8f0b with SMTP id 5b1f17b1804b1-432b751f560mr113435765e9.32.1731376795142;
        Mon, 11 Nov 2024 17:59:55 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432cf2b9fb9sm1783295e9.1.2024.11.11.17.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 17:59:54 -0800 (PST)
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
Subject: [PATCH v7 1/3] spinlock: extend guard with spinlock_bh variants
Date: Tue, 12 Nov 2024 02:58:58 +0100
Message-ID: <20241112015920.22564-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112015920.22564-1-ansuelsmth@gmail.com>
References: <20241112015920.22564-1-ansuelsmth@gmail.com>
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

