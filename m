Received: from out-06.smtp.spacemail.com (out-06.smtp.spacemail.com [66.29.159.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F8434E38;
	Tue, 21 Jul 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.29.159.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621103; cv=none; b=dIdLvQ1mZnoSnA/zwSsqhT6pBo/WK3DU2ACxjjKTpjDzS0hgpNTsaGqFFzZjlDn3stErwoPG71PEIKw7e+bo+F5cXd8Fc9pYuAo0K7p7mdpJ6gx1+GFAc7MkI3wrMiJS9GBzwtV1red9tsUQr3cF/rCquDNEvdwujFN99ghY2Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621103; c=relaxed/simple;
	bh=qL1EPVm5LN4CZqdymCMs6TfKj1CSrSaIZtTpOTHMoVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M6ceY7shyzzMtj+SHZmYdvT1P/6Mbuv7P/ZMtdrxBj7xcApZ2iQFrbRJnR0gzYHO7lbXDIpgKq9kqho3ApeFBelDXd/Ocx77NJVH9+efAWGAKr2jHpCbC284AQ6lCUjjLqrV8g2B7wKKfOJq+HnciqXIqE3YeUkcN3Rkh67i5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=BAZ3xd8I; arc=none smtp.client-ip=66.29.159.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="BAZ3xd8I"
Received: from [192.168.1.103] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4h48nl05RCz8sWP;
	Tue, 21 Jul 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1784620539;
	bh=SbNS+ybHkw3MgxjtBGr8q4vWgkNrJNLqPSGFi2khhe8=;
	h=From:Date:Subject:To:Cc:From;
	b=BAZ3xd8I45DXRMez9mF8CuAmHfvh/5W8rGrxktB4KRVTIwwYllrTmN+7/Mm1QsPVl
	 5XIb/fqUvrYneGXJTdzgVtRpIilFPQk1xEVEK99wSLwY+P6S8uhK539cVxp5vuZ6ok
	 zh7VJQ6/4HOpkIuyzEa7/c8yF1n9FoIjLS2v91P/H501iT20TUBZPTeX8O9XXIx6ul
	 3fHjjAJbbYYGtX02Xs8ccoEtcW+uA4ei/UQRQkwubNtWnSIGv+Xo0fXGGiuUZkpxh3
	 kKmkl+vShv/okimc3/6N3qlT7Lz+AqM2MREnHB3FXri3a1alTvnweFervx1/nL+3vE
	 YvAP9sIe420sQ==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Tue, 21 Jul 2026 00:55:30 -0700
Subject: [PATCH v2] samples: rust_dma: use vertical import style
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-rfl-vert-imp-v2-1-71ce0df519f2@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7Zi2Cg2uuIdhAXQKYxTIFBoN4
 e4Crl2+5P33FwgkTAFuyQJCkQMP/QbmlEDTVX1LyG5jMMpkyqoUxT8xkkzIrxGdNrWr6ZLbxsI
 2GYU8v4/cvfxxmOsHNdPe2I2OwzTI5/iLevf+pKNGjcYrm1+zKlepL9pZZleFs6MI5bquXyVnB
 di8AAAA
X-Change-ID: 20260705-rfl-vert-imp-d12bdbe397c7
To: Danilo Krummrich <dakr@kernel.org>, Link Mauve <linkmauve@linkmauve.fr>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guru Das Srinagesh <linux@gurudas.dev>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Separating out patches per-subsystem as per the review feedback in [0].

Tested via:

	$ make LLVM=1 rustfmtcheck || echo "fail"
	$

[0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
---
Changes in v2:
- Link Mauve: Relocated empty terminal comment from middle of imports to
  end of all imports
- Link to v1: https://patch.msgid.link/20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev

To: Danilo Krummrich <dakr@kernel.org>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Tamir Duberstein <tamird@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Onur Özkan <work@onurozkan.dev>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: driver-core@lists.linux.dev
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
---
 samples/rust/rust_dma.rs | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 5046b4628d0e..fc958d496c3e 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -12,10 +12,14 @@
         Device,
         DmaMask, //
     },
-    page, pci,
+    page,
+    pci,
     prelude::*,
-    scatterlist::{Owned, SGTable},
-    sync::aref::ARef,
+    scatterlist::{
+        Owned,
+        SGTable, //
+    },
+    sync::aref::ARef, //
 };
 
 #[pin_data(PinnedDrop)]

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260705-rfl-vert-imp-d12bdbe397c7

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>

