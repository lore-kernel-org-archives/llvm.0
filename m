Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E530E849
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556314; cv=none; b=o2tfk+FjgVFRQYl8KY9U24JExDOolE6kjEXE+eT0hZu3WwDXL2a2M6wFmw1EwQ7DaNGcwxJVKT22p0XRHQYnpoyQ2iARocjOP3rTTI1cV2tX+D2d0AYiLup9z1rsWuHGIuwSMySrfCLbzH1iiRh60ZZ6Oeo25ze5n1xmojIZRio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556314; c=relaxed/simple;
	bh=KlspLvr521ZswwzUDPIsBp2B9Wg66z4eaz2g1WzaBxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI19GyH2OGyKAoWRUJEmFdx4Eee1QMb8D6kZVOWrQKLdlDrBiy4CXYYV4T4QEcxlv7OFODIUVjwvClva8jR4LQxkqK7h20tmahqcKlJ9taYn7Um8IEKtceT+jE0SsrsEToUoOMrdpzl/TIh0/PSV+uB9kQTc3v5QGGt1ugq7EHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIw82Irz; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIw82Irz"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-879b99b7ca8so107000546d6.0
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556310; x=1761161110; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlH2K2eTZ1PSArwqcAz1RbXMF6sxizBGN/Y8PHlK+Wc=;
        b=kIw82IrzbH97jQhxVxOpb4nKUawc3L95MBf53+oLUgkPQIWdShHdlra0YKrn7w2749
         zVZV70sML83EKyKIi8Inn79qzCwP1LqMomwuFmdCIEeZOtZQDTdOSdi6OhR1ST4Ghhpt
         LOxTdJYK1LeBDdTu/sL99vlHpZCnVMe2dmL2GB3THhbmEdUy30NFQ/Xvs2qFhTYoFVWq
         YfElDK3u2tehXVeU3DZCynHdRL58bbcrKls3xp/XXL0lOkYZp9FwVbGQVGAsTs7De2ay
         gLo/s5qU2igYe1uI+MYrWLk/+qQLGAIyy+HmrOvmj5aHPTKvDsMzrl5JC1UiEW1ErRFt
         801A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556310; x=1761161110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlH2K2eTZ1PSArwqcAz1RbXMF6sxizBGN/Y8PHlK+Wc=;
        b=SzQf5IkGXTSm5bRYGxB2qZi/9nDt2gqipIcPnpAPBsDu8uJCSm/PA8/86f+8zpXmta
         7u9uI2Joyoq5rb6FBMQ2TRMXn42jzjCj9gHiNIkEcpGdVA1q3rv7g6O6EHs/2ysHhWuU
         cInaLP/z9Zq5viOm7roGaIcpsSF+RwoahYs5PCTdcmTTmNhGl3W58z5r089qCG2hdfnA
         9QtemGzE2NTN3O2lflaPasxmHyJ6Vfinfi6/b9myApkRiMsqxVqypnznprHHAdKCsBbB
         MqJV/NmP9/oeS0OvKlI2xzX38U2lHylZiSiznGMEW0WcwsGA+62yoGbuTHoG6ubcZJxu
         DyKg==
X-Forwarded-Encrypted: i=1; AJvYcCXrbQy9MVdPq3FIFyZQn3Btm9i+adHxfJ9qSiLZjeyCD8mZJoY65DcUTtlS25IlyiNQmEmS@lists.linux.dev
X-Gm-Message-State: AOJu0YyFJXCV56yT+ri1QqPVyvm437I8bMG4r4Lq0UWMK674e23IlnLr
	2nqryE/NelqiM7OuCAXAloNn1IPpnkTlrBVE7hhGQ0i2PxeMTRvgH9Hz
X-Gm-Gg: ASbGnctfMaHHLvRcmj32HyoYSnT2loVSJrDI7rl0s+kqh/nGf/jJQe2tieYlruh8apt
	Bj+ShfhK79f3ON+YaObwkgqQdDouXHwGkVg3U8LC/rSfjNm0Qf0OZSkamNHx+lv8ihfldE+0mur
	L5u/zGa4pHVKWUv6O3aJ0hrPk9jn/oV+Y3l95htOlC6tG3a2TxKX3/KfiVa980eDDB55kwvoNQO
	Q0X1H8w1I13geIzAQIkCDFZLksoAXN/xYhTyrrDRY0YRxn6c4BIZyoTQwWKpOwRC2salxabVnlQ
	Ml0Waht+jiuNVvhtmOBJdxpUNB7NFNkop6GhLodxfxMbyZOi3EzWPmGAv5Zl/VhIluw/w0T/Uzs
	UGEV+3kByZ3Td5BZWFLk0qLw9cz0wN7FJ1jc6JpTjJgTo2xZmmZdwhi6EA4WdXlkUpjCysa1P0Y
	+/8i57Kl47PUOCJ4NiiKIvafz7eKDAYk9edtcdNLhSZcgO23Az8R7uL3oGPHgXSascIHUUiapYR
	+3l+0KLSE4Skm+fYpujd35aDfri
X-Google-Smtp-Source: AGHT+IGPF1xrploY4yyf3/qJv7Wa6m7LEZDAuiBlGyAxIyb2xiX2HjjGqOaaPv9jGE8ttZXyV/gqwg==
X-Received: by 2002:ad4:5e8a:0:b0:81a:236c:c846 with SMTP id 6a1803df08f44-87b2ef6c9c9mr354624946d6.33.1760556310156;
        Wed, 15 Oct 2025 12:25:10 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:35 -0400
Subject: [PATCH v17 05/11] rnull: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-5-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1516;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=KlspLvr521ZswwzUDPIsBp2B9Wg66z4eaz2g1WzaBxk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHxMXWDjPc4JHWDJF+k+dKHv7GUEw5MjBiz/HrOQDc00FLmk5b2RTxkdaw7ylNTACU7Exa4g7kq
 NOXZk/P8Bewk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit d969d504bc13 ("rnull: enable configuration via
`configfs`") and commit 34585dc649fb ("rnull: add soft-irq completion
support").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull/configfs.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 8498e9bae6fd..6713a6d92391 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{NullBlkDevice, THIS_MODULE};
-use core::fmt::{Display, Write};
 use kernel::{
     block::mq::gen_disk::{GenDisk, GenDiskBuilder},
     c_str,
     configfs::{self, AttributeOperations},
-    configfs_attrs, new_mutex,
+    configfs_attrs,
+    fmt::{self, Write as _},
+    new_mutex,
     page::PAGE_SIZE,
     prelude::*,
     str::{kstrtobool_bytes, CString},
@@ -99,8 +100,8 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl Display for IRQMode {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Display for IRQMode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             Self::None => f.write_str("0")?,
             Self::Soft => f.write_str("1")?,

-- 
2.51.0

