Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EF503BD1
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467864; cv=none; b=rXEBDrgs8QmY8TM87y53KsY4v42iKb4Hz2vuiILTyxzVKU3BWZkcuuY2to1KBMnRV+0XE5EEetHM2DbQq26js2nHfVu1fj61eHCA46QMAqP3ho436GP+ECJoYCPRBskmamsdBsbeePIH1k9ffZvB4ZFkPXn2wwFslFQMAGOAukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467864; c=relaxed/simple;
	bh=mDzPWkMoO7yK7FwJIXdb8RjyDxLK4UW08E3phGRlvnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ee12U8UkmXqnc5rWsTlxALbsvIBhMUeUMPHi0Sge2ICJ84EnMlFZTesAdsxIrZK3R0QcLgy9Q291G8xR6x53WrYYHLLfGiuAMbbY6ERbKzP9KYcV4STuwSucMfXNvFHJ+sBXiZFyoDIb0egoh9v9tL+DLekInTJZcOugoLxltS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLg+rGEE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLg+rGEE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843f205a5bso234974f8f.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467850; x=1789072650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0p7OiT9IYtJ0QF28DnbFmBCLEmI8cNswVbeL0gIZVk=;
        b=RLg+rGEEdaJoGq4w/Lcvz1kU0+CfAt5eIwvGeN+m/hcHTiNCsayC02FPax1puLyMpJ
         D5nPfuQEwP2xbxOhdLt92cKFF53HzDZFPwHFcbapH0yaWue4tM0Jf+kYEEIW8hT8TP8P
         u2FZHCfM4fy1bk9nVYOJqa/SJDKBQiIfgUwSSKAb4RBOIz9g3atfz7uM3eYgMBsAik44
         k2bAYLtfimy0t1YJEeDK+80VO0AfOQLcEdjI7C0ANB8G98HMzKQh7HYABObZBjUYab9E
         qLX/FULfCvh0WMEGan8L8rWAm//e389+fWIVdMoeQSZMuEcI1kCXXjNjNytOXRIsNN9B
         ZdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467850; x=1789072650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0p7OiT9IYtJ0QF28DnbFmBCLEmI8cNswVbeL0gIZVk=;
        b=lPwezjRbrDoKDZBZWOYIrAhqOdScPFCyi7kp3lnJ6x7NLJV9se/BlsDTy85gTX/oXR
         nQkvt7jdRct+I7QdrHwvTY6IO3dTqPnz7WcvXYt9RU3zR86QVj9xhQDOOW1+/SWBTbup
         JCB+u/p0rjuWOby8kXM+GEsXGF4P+x2jb7Vpr2m/MGoaZz8i5UUzczfnzZPqIijvpskA
         77peES3QvbclSdHRaVVEcxtXwJMKuLCj11Hp4bu9DN2ct9Zp7t2WMJpmKWaJmcC/MZRz
         hieZ+Cl4jlobN7v0xkEg5amEEtwVebNz9lDIwgjH6mq0kagKa99tOAspYeuCK32Y7aCB
         ThKg==
X-Forwarded-Encrypted: i=1; AKwUvBwzZqE2cPnYh/bWyOc2Sq6PrRgcUg8RA6px0Em4L43Db9rvho6n6xWOPnfTuhJ6q88pO3u4@lists.linux.dev
X-Gm-Message-State: AFuF++mW9N3r7VLiMsC0A6JMoTF+4DIG2VomHbbjiwrADDrHm5+wB8mR
	1HErT7RXI2zGmgxdFFmUY06DOoAEbdfV5Y+LRRg3JAN+9azBqxVZysUl
X-Gm-Gg: AYBFou3D5ShroCX6dWIFyFK7mJgkQUF3eNYhc2ldme+Pr5/2GuaDTRWhFsd83XqJim1
	xjAdbs4HbhIyVmU7+xb9uB2zX41r7Af3wRy1l4sywBex1ZmzmMQAgkaibvLaak2l3d8e6IxIwvP
	poi8tC50Y02NTaokanljZFUmXgbXtgbT/tHfN5m8FOEMOgLR8aXnwGFrY6nQvc5GyAqaIEK4W6v
	3Xb2ob+72hIVIVCwjg33SKVVwbcY4rq9rpbQFBxdlGJQ1Kx4GXlrWP0HrTUD8dL63iMQ0g+eKj7
	yWPRgwyXvrsyuzp27uft0s5QTh+xdQuF/e+W6FptEuUJ0H15ydKX169VH5hDy3I3cXPfRXmwnf/
	Wt3BrbMHSXby+YXYw8Q3Qrf252pjn3ImwhA8dXqvP3HpLfvTgIA5Sz661eg4Way1xe2XNZrv94z
	ZQGVQDH3UU4rewyEeE/roO+wDSrPk2CN2NXmsHYPc2gBeg3jvnU6qkyALvoNla4tvh50351GKOK
	LDFRaKfJBaJa/cIee7cgdIPVwJW5wZ6gJIHISwZ3Vm3AZMtwTVZlfC0YGoPIKI9NmR6goxJk/ar
	yFdCDNvPI4/Ew7gWBgp1LzaRouIAyDrq9rAtA3+N3R+niU6yogXQs1250xgnhLEllqHiJmcs3jT
	eF4vw
X-Received: by 2002:a05:6000:46cc:b0:484:3f15:15f2 with SMTP id ffacd0b85a97d-485872bbf40mr1870059f8f.24.1788467849852;
        Thu, 03 Sep 2026 13:37:29 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/5] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Date: Thu,  3 Sep 2026 22:37:16 +0200
Message-Id: <20260903203720.63689-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points are annotated with __assume_kmalloc_alignment
but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.

This can mislead compiler optimizations. Clang's UBSAN_ALIGNMENT detects
the violation on armv5. GCC and Clang retain the ZERO_OR_NULL_PTR() range
check but eliminate an exact ZERO_SIZE_PTR comparison after an annotated
allocation.

Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
retaining the existing value where it is already aligned. Assert that
ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
from that poison pointer.

Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def67a..563dadc16d82 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -262,13 +262,16 @@ enum _slab_flag_bits {
 
 /*
  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
+ * It satisfies the alignment promised by __assume_kmalloc_alignment
+ * and keeps the historic value 16 where that is already aligned.
  *
  * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
  *
  * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
  * Both make kfree a no-op.
  */
-#define ZERO_SIZE_PTR ((void *)16)
+#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
+				ARCH_KMALLOC_MINALIGN : 16))
 
 #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
 				(unsigned long)ZERO_SIZE_PTR)
@@ -625,6 +628,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
 #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
 #endif
 
+/*
+ * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
+ * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
+ * has an ARCH_KMALLOC_MINALIGN above 128.
+ */
+static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
+
 /*
  * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
  * Intended for arches that get misalignment faults even for 64 bit integer
-- 
2.53.0

