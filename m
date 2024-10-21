Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B341E9074
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522675; cv=none; b=AhmVqrgO/6yi6NER+sE68bV9Z9i9eie6/YFjlk0MAobTXEU32KtCl3aROAkbuOF68XtlszxnmVAn86N7aIbHSNNOXIjvZH4yqNTpRVdA1+lIhVKZx2tzhkIdUXe6MdXmSBp89RSnB5jZX4Zcb8vdQFFVqMgAuRR8KdogQN2+7qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522675; c=relaxed/simple;
	bh=kJOUFMj6PXyuxDe3YoC2Je0/IAK0gMUIltuZ7HfFDHo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Uayxhk6lEQABh+hdyQ32c7tsdsE8jBt/2UyvKPPEhR4yI7opXNDaLw1J41M+VcqBruBH1uoBHJ65oygzfzF0cwufD/907lje9lXkEKYJuNx4D4FTDHjFXIEtWJ34soqR9W6CIz14C5sDBJAqnjTRh8puI5rCUWtPl1aXvSSoaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0CrYwIN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0CrYwIN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43163667f0eso30522665e9.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522672; x=1730127472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3owwwcHs1MDpHN+omOmsedchFOMoG1OAJp1p2+rcmMM=;
        b=X0CrYwINPLtMF/Szgl7nAsFO6WlVuPvK+MptTn6H2JDtX7Q6WytH4MKU0xln6ZFkLR
         ypeWx+edpkS8uFeiTW9j069Sx1b4zQJP+1otx9t12r6tdgTY3oBfcIwiK5xHY9JGUJKX
         Jjyz+hVJBfauuNhE9Q3w2ioEA7KtCuj1ANjKzZeeBrKgDXrUw+kCNbBPjJrGE8zdjtHy
         8i1useE4G7oZECIJAWXDtzunQJ3Xge8sG5dGxjpNGRl1WqfKqWRNszbuPlmWihrz8beO
         P5EUUOZ/sCRjeJKta9bfgGpxKGv3rODswit0Ed2GE8pyLxFBtrXiWoIPeAfNiIBxZxmE
         PzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522672; x=1730127472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3owwwcHs1MDpHN+omOmsedchFOMoG1OAJp1p2+rcmMM=;
        b=Kz5qvzinu/72C3AY66qsi5Krv4Uk4JRjwovg30j49tSEz1klvCfAAb+MVJcM795IRw
         ip1ODSyJ7CRdwlV+0WWfbEvXdeZpITBOw3uYmCFxrcmcEZGpp+aHkjKIGpgPaiZrDxFq
         dbzVIstKUICn1zqIDzZTmwQ1FCXpkpRQ+6BjO4wpL8pdVyQY0+ex36Ktp49WNeKPbD2L
         qm1ve6JqFBAT5yhdZkxT9WaeWx+n6JqgCbMyccCOkZ8UeWjc1rnjY196CfeYPxsOpuZ3
         aiNjlx3uQn19CIilsoR0nC0vQdFb8jDj27vttl8IpAWWpHLk7Oh4rapt10iotPE1sQ4l
         Jo9g==
X-Forwarded-Encrypted: i=1; AJvYcCXhkZ9wOXnt4iY4DaT4Qh9ylBYaJIUCPwKCgUH4rBolZTA+3QcduQBZQBYMUWpAdVBFP8pu@lists.linux.dev
X-Gm-Message-State: AOJu0YwkmO7ycMdeFRPPOxJtpeBZn5msYtN0meSKLBxfu6TZ/7oFFP9Z
	74+mkwPg6ZFcPpH7E/I9ahD/Ll+bf7S2U++Nqju/SHFFGJCoLuo7
X-Google-Smtp-Source: AGHT+IEmU9LyD7il74oyZHDJiaTohk0WzR0tAbNyuFwffiexLZFKYQGfHAyBwaGs3mcOURxZ9Jl+IA==
X-Received: by 2002:a05:600c:1c95:b0:431:6083:cd2a with SMTP id 5b1f17b1804b1-43161659c02mr100797525e9.15.1729522671501;
        Mon, 21 Oct 2024 07:57:51 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4316f58adffsm60303545e9.22.2024.10.21.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:57:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
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
	Richard van Schagen <vschagen@icloud.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH v3 1/3] spinlock: extend guard with spinlock_bh variants
Date: Mon, 21 Oct 2024 16:56:37 +0200
Message-ID: <20241021145642.16368-1-ansuelsmth@gmail.com>
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
---
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

