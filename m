Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51E1885A5
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734182928; cv=none; b=RAGQIt77B7X9yRkZ0p0SEFBrO61GXPpXwMB+X1zQsFjKfRJVf4kcDPqg8Yc5cx5bq5grF8/XvC5hUeVXYOO7RJ3d+7ReRElMSHxgoobg5I3FTBJd9RsVUn5qf5oawwKVziDkH36WqWUW7h4CTNB7PTbyOqWfSFhxL0Yj7JB/wHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734182928; c=relaxed/simple;
	bh=etUkdgGOAeKQsofCjyp34uBeNTm3qccykJ4LE5ZFruA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVbIzZSbzm0iVAFoVzi2jw1qAQeUQXf3q0i9VIoZWEMjJ80LQch4DBrmaZfZXiKdGj4CGFBOxyY58HnprFCYoU2MqN7QBBBN76H29pJxEM+DxRmJfWOwmPJcSBMFwZZIGunFFrRnAUX67fc6/jyc44u0n7eDp/moi1U1YNy8Tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atfqa1oU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atfqa1oU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso27592805e9.0
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 05:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734182925; x=1734787725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=atfqa1oUGPi6mGNspuFyjuV1d7McgsBY06ZqcmLrdh9xutaRBp0KGTKg6b/UFeR014
         bWx8xfe3Vs3lIp0p1F9nrAC9KPlLoi2TSeedl2h6AFNTYD7t/UFLc+MRVFaXsmyE9Jnx
         rjrJIMq6vYW6aHbaIkEn+/3gUFjNjfrRnl0ok4xnVRVJnAvV1Hs3aouGgAKwup2C+9eh
         g9bXFPxYE/Aov59lF1N8/CuaE/CVqKfQ5gfKYeoMPE0qEFrNrldv/2Rm1zy0dnP7c44E
         ssXer5CkkCke8vnQjqed30dZY3hPM1Pu5zrBdw8XUQXKKvtz9ZerDsMeu8nWesT1xmdX
         goJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734182925; x=1734787725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ukl42wl26ysASwjUxfV5ZoP20+T/0IwuT5xUtOVMrvc=;
        b=mZULIfGPqe8npiCGo/Z7VVVVHFBoOiWncrdsq5K3aApJs39lKwOf5xEpIcOi1Roisy
         NC1vpCE4UTB9LCy5j9yhpZUgaEIv/huaCw7iNKrLjAjU127HrlE5DxRKU1iuKV2VRQNf
         sV8hBJ20uN+oQVrdwGR2IuCS1BB8NtMkI8pgtDFM83xQJro4NwP0qAB5aajR+HKIvl1h
         bV4coAG/8xZ9/RKbXtwTTq8cYh7fX91xRHpHiDHPur1yPECi1kjpJ5RzdtDLJxcnam2g
         nTG/GX5ZlYraHRdsvIlq4bx37ITSTOra40Ynv7QdC5KYlOBkHLJOs7t13nh/9T1nd+7Q
         Fifg==
X-Forwarded-Encrypted: i=1; AJvYcCXs9GWIOW4jDmmLzq5qo2cnBTvr6AxaAOwaqNLakLhxRXIm+WqYW+vYC9E5YkTD1GPsDXzP@lists.linux.dev
X-Gm-Message-State: AOJu0YzbinQjuJssMJvzIEBYwVpNxVPAm/3+2hQ3qxvk1cGdvrSoexIf
	EJmg5NP+1J+dyR787vV08XO0YxrW5Yr1GwFbKuTHx8Xj5QKFux5p
X-Gm-Gg: ASbGnctfg8Huhi4E3FHBr6GhPmjDSRGQlvrWG1/P85aHdXd501Evt5SLM46Y1twZlIk
	aTNG5bVrYIR6fB4+57e1zcIyCORtN3pxqzTDh7b8zxS46nT0EG6y6QCTfunRe5UybUHaErYo1Sc
	+0Ot7QF0K3FIJP+Vq29ctJe5NpNsjoAZ1WaLXifhz2fg3/G11UWznhtoyZuip+8LhyFgYEE7E//
	H+9dY0c2xVPNnZSn37NnKI+RElmYJnItlohFPAgC16s+gVEftwyY0gIeZ3ImkOZv09+NAYW9feV
	+Vxr1VKrNrXeV3Qb9x4TvW5rmg==
X-Google-Smtp-Source: AGHT+IG5kdQpiIjRbtSweLewsWUDjb0hmx6Fb1IaBGBclApFb+ntYBESFJER2L81+4vZb12ZKm1MGw==
X-Received: by 2002:a05:600c:510c:b0:434:a19a:5965 with SMTP id 5b1f17b1804b1-4362aa157afmr55257345e9.6.1734182924638;
        Sat, 14 Dec 2024 05:28:44 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80162a6sm2559850f8f.33.2024.12.14.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 05:28:44 -0800 (PST)
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
Subject: [PATCH v9 1/3] spinlock: extend guard with spinlock_bh variants
Date: Sat, 14 Dec 2024 14:27:52 +0100
Message-ID: <20241214132808.19449-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214132808.19449-1-ansuelsmth@gmail.com>
References: <20241214132808.19449-1-ansuelsmth@gmail.com>
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

