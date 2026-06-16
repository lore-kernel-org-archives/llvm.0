Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E331364E89
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613052; cv=none; b=pEtg3etyf/M0YjIfILVnOyKQZbzTgyhReVGMYRWpEbVzlRzy/Pzqi9KfUcS5O5VArH5MG39QzJ5WATAr2Lcp0WSW9Qtgyp9lbgBTBYoUU87jF0+udWO0FMwxTsK/1c7VBdMR3DLDuq7j9loy1Hj1dnP7Fd+y5aIB3m/gfYabJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613052; c=relaxed/simple;
	bh=u01briDAvKMUw8TivlKgvuC8V59Jv57qkAmI27kzRfs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mSbiP+5AQg2wjNYMXx/ZZTGtH91ct0TufZfu6qTiVIdpzFtOjV6y119Sf1OeaPxH3002IWi7rjy4339ZQ3kuy3gmDVoz2Xa0yFf6/1kpwIFwov8ZFeJw7zldYveILbzk6xadh82mSWWo4uWGiimbjSQo3YMp5sQxeg8HDYNtekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mZw4Aqol; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mZw4Aqol"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so30244115e9.0
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781613049; x=1782217849; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQ+0+1VF0hgHTpAGgN4m5G21xwrV9nF9JpvOI7R2qy4=;
        b=mZw4AqolWAu1qe8dTMsUbzNctWVaqPr3lh8EYvkpLiV3grB2xib/hwYBbDguBjZvt/
         CdMf2kHRovhv1G6p0wNXkgAG4hWJJ39AgZNar1/CB1xZ+vu50czvFEaY3NgJ0nozMGko
         mcnJunbhVdXtyCYXEkgIvcLaxz051cHxSBSzSfKBj+hNKlVrtpjCdnmeDRgJPvAqsHWm
         T8hs67Gwvj1axTMp5iGLdl9mHGGEkeIAFd6joxiNU/ol6Lo2kbhKEsCWyebYw2yogq4c
         kihGxHtsDfWChZFJDgLP3Ogj9n2bClQb72leRajNAm/KRg0tYLwAOf/iEvO0iu5Iqyh5
         7Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613049; x=1782217849;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQ+0+1VF0hgHTpAGgN4m5G21xwrV9nF9JpvOI7R2qy4=;
        b=TnM4sYQsSw83YH7G5vFzlNp+4kIlw7SahQ48e7WCm7D6Mh3TmchsZl9OzFwFeTHNe6
         vPqzqi9rbVO5Olz5WWf0j6LsHiR4hk9qr/1FeCBK9v2cVT98XOvKZANDMq3NZdiQ+ruf
         VO1Z9oabQ1frnTZwR2sKHHrPZkhfmvbNhiFyXVdUZa85xDJIwCxr/qNn1hSwjerJDNOu
         vZd964JkNfIIFjLMDtPZMAFN/LtHr6pvzqAFLvm2xxQrCcIz0OMy5axnMkHaUDqwXqac
         JcesEbesSBEfW1KdBuUqlMoOx3JFxUvBz9ubFklaU9UZ9ro6f0yO0eqbwkdi+I2H4hNn
         UQvg==
X-Forwarded-Encrypted: i=1; AFNElJ+GaYS67mujmkWqQtHhurZCI7C3J9ynWDP5OqbmKTxzrDCIrQsybcRNyQx5s9nhzikkRq17@lists.linux.dev
X-Gm-Message-State: AOJu0YyyS+ouwh3yguFOzC0mciliZlNOqI40NazqFpFQil4SqkGod/0n
	4N53hdI4wtzdB0ZQHEQeEJQCxn/qRycn9ompCkOjrxgYIBbnuAuRdkeqXyAReYU9SazAkHRHI58
	sBhmAkhBWPdM5fWg3dQ==
X-Received: from wmbgz11.prod.google.com ([2002:a05:600c:888b:b0:490:c5d1:64bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a44:b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-4922ffaf123mr50220475e9.19.1781613048245;
 Tue, 16 Jun 2026 05:30:48 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:30:38 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO1BMWoC/x2MywqAIBAAfyX23IKPMOhXooPYWnvIZI0IpH9PO
 s7ATIVCwlRg6ioI3Vz4TA1030HYfdoIeW0MRhmnnHYYxR+E+RKM/KAOdrQ22jC6AVqThZr+f/P yvh90RG/gXwAAAA==
X-Change-Id: 20260616-frame-ptr-fix-1c3733f3c764
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=u01briDAvKMUw8TivlKgvuC8V59Jv57qkAmI27kzRfs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqMUHybmE2Dd+mSNTjDirdx1pwtxCHN6jYdDZcE
 Bnf2ARtTOyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajFB8gAKCRAEWL7uWMY5
 Rq0mD/9KWjAIESxGIflch1FpuvtpfCTx2LyT5cOF9tT6phtavw0gbI2paCTYZ46YpF00i25V1YE
 RfIaBEuyes86FVxhrcBNB2RxvaW16bTif1evuTX9oM4+tcSB+mDtVALgQLmdqCXu2s9p/WDyodn
 5+f/mUHRCbRwPz0Ny5xaE4mAwuWs0N8YRtPq+6MRiKSzoAM5SL2+UFq+bkaVtr/NweGnkIb2XN+
 yfSNEHa9Arbqem0n1tf9Uhco4AcoWZgukvscRlTlBNdnDwAJmCBxe2nu4hLD9NiXAkASSHMP67C
 pQir4p6JFiMjuO4H3asQp96g8W8t+M0cHHqs7nI+LBcH9hCHJ8xV+tPa2ezjk6rMiC4ljeE0YRs
 NnLv/MO6Kof7ocLnEgByTIPYtL2xk7TtMRNw1KcQMsHxXvYGWvVdmMrO0kCjrrJJdELHElQADVU
 ggEKAdhbJhZAcM+LLDz2lG4EaxSko2luYkq1q7i5v0U4CNRIJy9cLi1VQQRS/M/vgX5yzPmjidy
 eDWillyxQ4wcrSxqKteGdTob4QkOWz+PKI8dUYlL0Z7mhp0SQ+OcBa1Vy5HQPp6vKQyS8ELo8mo
 ohie5fPKciySgfnb8oCCiZYgf/iw6S7P1t4DSVagN2Fx4GJ5W+xJBpaLzBohbU1XlE1Eo+sEy+7 3QOwc9At2IzLwaA==
X-Mailer: b4 0.14.3
Message-ID: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
Subject: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Douglas Su <d0u9.su@outlook.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Fiona Behrens <me@kloenk.dev>, Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Due to a rustc bug, the -Cforce-frame-pointers=y flag only emits the
frame-pointer annotation for functions, but not for the module. This
means that functions generated by the LLVM backend such as
'asan.module_ctor' do not receive the frame-pointer annotation.

This is likely to lead to broken backtraces and may also cause issues
with ftrace if these features are used with functions generated by the
LLVM backend.

Thus, use -Zllvm_module_flag to work around this rustc bug if using a
rustc without the fix.

Cc: stable@kernel.org
Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
Link: https://github.com/rust-lang/rust/pull/156980
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5e73bba74da3..4bfa87e2562a 100644
--- a/Makefile
+++ b/Makefile
@@ -966,6 +966,7 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
+KBUILD_RUSTFLAGS += $(if $(call rustc-min-version,109800),,-Zllvm_module_flag=frame-pointer:u32:2:max)
 else
 # Some targets (ARM with Thumb2, for example), can't be built with frame
 # pointers.  For those, we don't have FUNCTION_TRACER automatically

---
base-commit: 0e0611827f3349d0a2ac121c023a6d3260dcecdb
change-id: 20260616-frame-ptr-fix-1c3733f3c764

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

