Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B843E060
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457573; cv=none; b=I3C4JOGYPEpbS32Lnl3Zxol6krnp26qiyc8Cw+FOg69kLnVDO/18Txzn68BhVm2VlGBKWmo7/WJQBwP6N6kxkwKBlJ/llWfV7mq/pA3BxvYVQhDRlVadXU/dUfkkjZHCKAOJI3KXUcnH7FJ+f6lnVOQKlEf6JfR5KFhLMEyp1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457573; c=relaxed/simple;
	bh=TaCmrurOP6eiSThHEAhj0hS/qDuy18I8xMkgu8ZEriI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JvXo4JxdpMm3aBT8gXXukyDYfKWd4d6qdrBYgIPU3AUBPWB0pwQiC6KvtNOaxU0SeRCoOcMSmffFfUQ61M9VjRia4MhD9uP7fsZFfPzkrC9JPLEhdvn04hMp7Tt0nsj324I2zxsdb4wrdYTeGq2dIv3lp+p1Wl19zwnOM8cw0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzScyqh+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzScyqh+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954df200ddso21574055e9.0
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786457569; x=1787062369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah0y0gDveI06pCiQf0Bv3vLT+VZq6BOea0NjGFqGqkY=;
        b=EzScyqh+AofboEZP3A+oa3Xyyjk+6TqjsgyR7i8ugwwC7Gh/C893snc7CMzn60GXw0
         XvrcFFsaUpbV8VyKgSw5yMJsgXvfTA99BnbB3doPgAsoYFku617HIM3y4F5M6RRwLIwU
         SWGUP4Yq0g+l9SiomfwS9oJhTSguxJTB/7oPJ5OQsW0wI5Eo3rrpNbyWuTtPGwCtLyLU
         ALrlezbJBtXt+AHb468fyzyEhjTRZqdriI57nY1Lsb2F3nxyaJDOBYB2/zKAx8Rg9VPc
         ZqMUYUIwSPbqLJg+oCDCFUYbDu4qx02Zfaah2Khng+qMy3p6lfVo9XGYCDcGXhr7NdEy
         fl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457569; x=1787062369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah0y0gDveI06pCiQf0Bv3vLT+VZq6BOea0NjGFqGqkY=;
        b=R2QKhOmXMMluozxZUOk5uwL7J6o4iz6KMKDvHkFxVSxlx9AtSexcrnNucoacUqLWiX
         26g2divfGU3zBQxLywiFz2thNCQvJTmEKPggl1wpCF5Zm3Z3KsRQUnkr5SfLl7tTD2Mh
         LCzoDdE4IA9ryXZFep9iWAkQYTYhvOET+o5l6tD6rCIQIpuyAk1te/ILkBsa7Z3aJGmU
         Rh3BU2YYS0JokxAYVy64AXOMRJVsOGyYaAc7o3TbOaHLrYOOJqyNZ8pysnHCWyMiap4E
         lgRSSgb/u81/j85BYdhsbSNMSsKQR/bum07mkWX+3BGIHYWzBz7mESkRwY+OAyP+z01p
         OWkw==
X-Forwarded-Encrypted: i=1; AHgh+RpwGP9+q1L+PgJbvPCcn5Uw/Q5grZ0mMz/SH6FSiq+2+SaA0IBw0onjIilZMXGQ3h/xV/oL@lists.linux.dev
X-Gm-Message-State: AOJu0YzGxVIXdAG+RwXzVeUjdfqat05TsnrPryM8ScpL4aw+T0c12cSZ
	I7W2+z6Jko11IUkwEPb50k51aBWneOjuT6M14hUKv3C4mWNDUyU9/bCi
X-Gm-Gg: AR+sD11XUwJJ2wvnY+BnK+Zg0YHZUKWyoNOQKl+iYq0Hc0mWWa/OJYwiZPU7rb7tU7Z
	TY52cgXgzeYjAlP/7vC5hJY1v9Wc7ClSP0Au6kepHXFMvKE80IwU+qM23jJGJKwxWsBWwWMunWD
	XPVI+1YgIRaEymEfLlONyX1rPwTHwdjB/qyQE10r7bu1z8tWkP6xZFkOBywXthKrhPJwCLDSIua
	KA+rEfZ96tUmZGGBzz1Y+ewySqf9UpGR+I5ayNSvQ7toBlhKHenpX5RsEDX5m9wfHa5AwZRjk67
	CveCpdcTaO84Uv96I7d/pExCL5ApF2XR4OVSy3WxyTHKenYrHl9hF0BTM1+Q0uI93vtXVeiWtVC
	RZmf6u7Zem3/Z2U6mPmTnOnd0IC1tRmbKU5iJ2fCDBnuaStDQozSDq4I/RxZr7EvvCCqQWIbBSF
	Y3lQuVQSD1oqU2pb6NONXLt0VZsp46U05g1pMpby3n+04gw2VnlcudTBa9CO6hlR3w6bV9TbwLp
	eXGK06Pu0LUj5k8iEi2T00JVjS2LnK2nsX4HvtuaK8vErIflE9IjcAMq5AfaQweswyj5SNxbh/F
	GMXMgPojToGkRlqf2CSgjIpY5gy5PAPcfYa/Pw0TJOEUjln9irTCcI8XYLBg+O8S+BK19Q==
X-Received: by 2002:a05:600c:3103:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4997846c317mr57654805e9.15.1786457568853;
        Tue, 11 Aug 2026 07:12:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be29fsm4464099f8f.12.2026.08.11.07.12.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 07:12:48 -0700 (PDT)
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
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/3] slab: check for ZERO_SIZE_PTR by exact match
Date: Tue, 11 Aug 2026 16:12:39 +0200
Message-Id: <20260811141240.62519-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811141240.62519-1-kmehltretter@gmail.com>
References: <20260811141240.62519-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZERO_OR_NULL_PTR() returns true for every value less than or equal to
ZERO_SIZE_PTR. With the sentinel raised to ARCH_KMALLOC_MINALIGN, up
to 128 on some architectures, the helper matches additional values
that are neither NULL nor the sentinel.

Compare explicitly against NULL and ZERO_SIZE_PTR. Store the argument
in an unsigned long temporary to support both pointer and integer
address arguments while evaluating it only once.

This also changes check_bogus_address() in hardened usercopy: nonzero
addresses below ZERO_SIZE_PTR no longer cause its null-address abort.

Apart from hardened usercopy, direct in-tree users apply the helper
to allocation results or explicit sentinel values.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 3e012cc4f001e..023e10ab77f8d 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -270,8 +270,12 @@ enum _slab_flag_bits {
 #define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
 				ARCH_KMALLOC_MINALIGN : 16))
 
-#define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
-				(unsigned long)ZERO_SIZE_PTR)
+#define ZERO_OR_NULL_PTR(x)						\
+({									\
+	unsigned long __zon_ptr = (unsigned long)(x);			\
+	__zon_ptr == 0 ||						\
+	__zon_ptr == (unsigned long)ZERO_SIZE_PTR;			\
+})
 
 #include <linux/kasan.h>
 
-- 
2.53.0

