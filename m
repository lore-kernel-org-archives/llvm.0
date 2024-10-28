Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560E1DA2FD
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119361; cv=none; b=n8DFWJBgXIMAHGM5JP5YpbGRvaJDje0fmdOc+wZRqnAXBIXM/agcJO2VQa0GbZwq44MTuA0K8ccn3ljYTGW2CT9pQeZxJ/7UQXpGHO/LAJJb6sE9bxBc72oXzQU7IVgdkgwosrCNyrGnGfIQZ61+EtrlNdNOwTW3JkGPmyYE7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119361; c=relaxed/simple;
	bh=YamZzvhmaDu6jNuMTIZ5BlSZQSa1W1+FOr371olPtTw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IGdrCEjlUhaHBNKRuoXpzXrlmuMzuG1TEuGQQBjKjH9RFd8z9X/7YDX2utLeuqKww467wYP1tH95+6fQ2FrMH5zGcQbvO99xML915KvNp7ZMLNnhUcwctEic8Z8n7dG2lVl0aFPxIeSheao2U+ZcXMbyqdhM05U2TrhCGZpv5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbhRyokk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbhRyokk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d462c91a9so3163533f8f.2
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119358; x=1730724158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CXMuB9N8iV8ohwDfKCUDi+5Z+yxX91mIom7ZPwIqV+s=;
        b=hbhRyokkwYdFs5hYDdTYwf63xtMhExYU2EG4zHoK4ilwtspMNI4ESsXe15/0G0bcw+
         2PunozZpCdlxBulmNAq743troLvEDgPBc5hektfXyzd+aue1vT54wv9dNo4OFpdwa2l4
         CVmZeJGTf/7jry81T4OkzPXcpktN3eRyyg14H+tsDJF9U5zdeS+CZkt/1GaY6o8kHE8C
         4dvhoCzjvz6BOTUzfaK4eKLQd39EOw/cYIH9r3FaZXoENMmleOjTVpgYFon2iGgn1S5Z
         hre7E2rKwZwc32LyoPtTfYzxmGXCiLyjEE600BNsKuXOCq8Nev0B8Jf1mHL/bq3Br7mF
         DfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119358; x=1730724158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXMuB9N8iV8ohwDfKCUDi+5Z+yxX91mIom7ZPwIqV+s=;
        b=uKGPDCpE6ZhfdkvMDJGI7DT0Y0AZBINnKFpScBdOtOREfTqx77mKDOdx3YElskcYNQ
         2MI08zL+ONcx/EhJE/wACqfWt6Qc54XxTfQoYwdjZKMJcvacS7le+ciW40EBPfKdaVOW
         bdPlpZ9B71np/AjpOlrMuMBvOt/QG4nKexCwHJQ5q28hQQDl0n8U2xq8uWOuxTDks7vb
         MvuoJFvRawpYuhgnK0zOtDEDc3N+zWgQAwLx+T9D7HiyPO2BYBkKfbHcQ3+Aeu0uGchT
         /dPXlGaGzqDXeDNZ+AqkdrO4IYv231mWsuGGSe+ZifUZa+hOEsmnpXhDv/2O9zcdW2h6
         fgIw==
X-Forwarded-Encrypted: i=1; AJvYcCUVQ+N8APHw8PaZt2yiyKhWzRG+/KqHJdkHBVcHKV8ffPd1PfWj3nk660HqLEnhtWZJBJfT@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4iGINezhDUZJWEbMbWYtc57drhoZMN3V6G1mauYbWzVKgQYxh
	l5idrzjzRYkkE5i+ltNrLds7SV2qG/iIUjlT9eYvAV9ua7cEejBb
X-Google-Smtp-Source: AGHT+IGSNkzbM6+B2nzURo8UwNG27pnjBN5LqzCF0OK8RLWSWY8HEXRszgdqRunm2dHG0ZmdMlqgGw==
X-Received: by 2002:adf:a444:0:b0:37d:46f4:35 with SMTP id ffacd0b85a97d-380611dc87dmr5821481f8f.45.1730119357792;
        Mon, 28 Oct 2024 05:42:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b71231sm9352608f8f.66.2024.10.28.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:42:37 -0700 (PDT)
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
Subject: [PATCH v5 1/3] spinlock: extend guard with spinlock_bh variants
Date: Mon, 28 Oct 2024 13:41:41 +0100
Message-ID: <20241028124206.24321-1-ansuelsmth@gmail.com>
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

