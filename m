Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3EB1B0F03
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849690; cv=none; b=svROZdYABmM+p34XnEa2UgZf7IDgx4l3OG3rLBRhOwJ/w/INrQg3/euImIil+tpZBKyvkqMyD4hjd1i7yqP/wyixK8G3Om7DWpfcmY5p91+FRh2s4gdiIu0RMqL98duZEMZkm8ybNrPMpeIUx2gh27hmiQZZmgNggx5Yy++pqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849690; c=relaxed/simple;
	bh=ThNvSYZfVe6QKlfxCYRKH8iB/n3TbOriKl7MaLULAAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=h5PvL+RIKuvP3h0yZCtUi6RqCv4r0oi8UryYVyCaGs7CRE7xaUvmKm9dGtNBJY2Aonts57N8NlXovCAYnB/Eb1Hevd/M8gDs8YalDG3gtUR12qd/AvlhO0olk+Vf4y/taB5C0yLLkZU8td5RW21rKVrhFI84ZxrxF+i844LLEyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N12cPnZG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N12cPnZG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso19626861fa.1
        for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729849686; x=1730454486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYXk8J3KGsQhDnC6wKQa2Bh6Djnz5JRK+lEco2zJMUk=;
        b=N12cPnZGTmaBUOGF3XWwmb2tv4Ow4OUf9OKcbRtMwq+tu7MgzmfTN+4LD2gnD4dyDS
         8SrlMbl5UAzQxvmdheFZ0bi1tun489j3kRbO75z6GHI2xciAkkF6WmNkyo4/QUxKrXH4
         Ztbqay1OKnfu2Y0/dhj98Bhsh1PA7Jr788fYU5gLDxXGCdoqM4Rq0g2DtoxC/iCb37Qt
         JFALSrPf7mBv/WMSv8IpChRaByuKh6gjNJi6HBClK4GkVhyq/8u3l6A3rj/eTFJg6mmf
         HuZNaCuXuGUHCPH3n8xSoTTM5t7mJSjULhw9Mv2MZHKfOtljoMTc/rKxoflrSAnXGL4/
         mZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849686; x=1730454486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYXk8J3KGsQhDnC6wKQa2Bh6Djnz5JRK+lEco2zJMUk=;
        b=v+jN2Ha2tdtrIBnPT2dRujRXZhlXiR6f6BJjpCCrLZqYAl4/c1S6wgWvtHleBWRyXz
         POFURZI6vmqaFOAvl4wz8/q0aRTaWz55/HmzQsyXoTEdtNFBtgcJgpOzQ19X9hdLohCD
         eHJA2ToiU74bXFF3Rjzpj1ArQTQjko+t6NCEFakMJfTJTwompWOpjYLMrfVmz1ymqNJD
         coqcee+QNi0HzB6+1GzCh9LtfMSZPadVW/Y1zCTiatYuCSSrXpV+fY4Js0Qfy6N0idSu
         wE5ll9EW/NU3byrfWbdeRhVNrZwp8JmemBsn5fsPFC5meamHkSeiVF6KAzf8nMtHYxF4
         XwoA==
X-Forwarded-Encrypted: i=1; AJvYcCXbO+NGQEH3suFSV0+LBB9m4kLqwethIjACH7NmWl0kV3jVxmIhH6UhNTTPUVgZ8XnKbyfx@lists.linux.dev
X-Gm-Message-State: AOJu0YwLWsqxOAFLQcvk3R5bWR7zMdyxmsYQnwW2VV4nNFKxmWV+jT8l
	Q4GYSTwPYuVGE2kpamR4iUh/Gj/N0yWMvx/64piP6U8ELMzJIc74fNvOTQ==
X-Google-Smtp-Source: AGHT+IGL3uChiYeGKtJomYvkUJIYvNEpHy1hENHRApI/vHuYwn6oMN9tfoB9YDLfeAdwSvGKyYrMMw==
X-Received: by 2002:a2e:a554:0:b0:2fb:407b:1702 with SMTP id 38308e7fff4ca-2fc9d392a94mr51934231fa.20.1729849686055;
        Fri, 25 Oct 2024 02:48:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4318b55f50csm42785605e9.17.2024.10.25.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:48:05 -0700 (PDT)
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
Subject: [PATCH v4 1/3] spinlock: extend guard with spinlock_bh variants
Date: Fri, 25 Oct 2024 11:47:22 +0200
Message-ID: <20241025094734.1614-1-ansuelsmth@gmail.com>
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

