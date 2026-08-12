Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC28432E80
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537759; cv=none; b=R9M96QQNJRAnMAURHrkGqjLkuqVWH+rVehWVqKe/+3DBR5UcWfcieeaegm6rrQiR+n49ca2W6CaLMObbobGaTPEHpJ6coXeoDmWYu64c8O8yLdi/M+tFmakSLEPLMA0NgGDdsW2KXwUD57AoXexmmfEDxmvzs7V5EYmM1IXHCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537759; c=relaxed/simple;
	bh=n7/U2S5maCV5Vf0nRUZmSQD2Viw34RFeOIx8Uc/E1OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzsgfG5dtqxJ71WdzgS/6AcUxQERXLiRSESil5+QqwTkHd1h9A9QxRAE5tcPdA+aD8Q+7e0327PWOpsQoDgJQKlyNt3x0KnhBYzZfuV1L/Fv1EoCdc97kUafxTsupVHo5cS9Oott5jy/8c10GbyrWiJ7nWURGCOsJ7qSppo5COs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NOvrL42b; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m7KBV7J4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NOvrL42b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m7KBV7J4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hKnqB2vRkzMl1C;
	Wed, 12 Aug 2026 14:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAedvff3QSP0EFBuHSwE45YjQw2aBi3g60mPut/5Tvg=;
	b=NOvrL42bTrvNtirUZqZXJJe0oxh+HkO97xPHfsjTUHL8JqZBVxzgD2LQRocNonWE3GOzRh
	YmEir3CHUq2nALTC+T/P6J8zLiAXANTwsDn7JcyDOLB0nyXLb1sKfLKabmYAtKQUhldwNa
	AVBa0ZLKBL2DuMBL0H1KWqS2m4Gun3+9nDeMSrRJ4M+Adc9SpiBnmu8v+zfOCjbesoYRua
	ouMd53bGJDmlbXMga/wugDYK4b99bI71ST+/OEji13BBl0P5rbt09iTpDyEnWrtpKsEI6X
	+fcOK8btV6w+FZodEq5hZFi4ljxuR028caHe+jYHlgZWuALFtjDa/jG6tq8Zcg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m7KBV7J4;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAedvff3QSP0EFBuHSwE45YjQw2aBi3g60mPut/5Tvg=;
	b=m7KBV7J44czUqNWhFxfajalxd7ZpTRle9D842Yn7z3mjbHKXLLMSTEq8LNBxKwRIET8ZwC
	JiqZBBKyk5xsvsiPzKQT57Ukp62rXq1Xm8yupRiOgRflDwNKJL+rA6ZyziVn7Ov1GdptIq
	Q0n88N5/zQKj88KaJy3Xv1dyyc+xeVSQs8Pq9ZyjfuCNn2BaIMi08s7X1Ba6keTcH3HG/7
	QB3vC4cQTfAHuF65YxzSBfwV82u5ehiHnqi99fpHGeqchVTADJuEPHY1qkfAgOoreFOXfe
	WAGYmG4UhKIAZS2SEzIFd6sL9+R8isZyjzi/VMA5D8BCN+C6Y+K5jNYBQLUPIg==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/5] Docs: software-requirements.rst replace optional tag with footnotes
Date: Wed, 12 Aug 2026 14:24:22 +0200
Message-ID: <20260812122426.1636227-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9a6552926477983df8a
X-MBO-RS-META: 9wstznwmdimpop4iii1fw88jbufmkobd
X-Rspamd-Queue-Id: 4hKnqB2vRkzMl1C

The optional tag isn't obvious nor defined. Therefore replace with footnotes
like the one of Sphinx.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 .../process/software-requirements.rst         | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
index 5fdfcf6a0c01..a31e0ae20498 100644
--- a/Documentation/process/software-requirements.rst
+++ b/Documentation/process/software-requirements.rst
@@ -33,20 +33,20 @@ you probably do not need to concern yourself with pcmciautils.
 ====================== ===============  ========================================
 bash                   4.2              bash --version
 bc                     1.06.95          bc --version
-bindgen (optional)     0.71.1           bindgen --version
+bindgen [#f1]_         0.71.1           bindgen --version
 binutils               2.30             ld -v
 bison                  2.0              bison --version
 btrfs-progs            0.18             btrfs --version
-Clang/LLVM (optional)  17.0.1           clang --version
+Clang/LLVM [#f2]_      17.0.1           clang --version
 e2fsprogs              1.41.4           e2fsck -V
 flex                   2.5.35           flex --version
 gdb                    7.2              gdb --version
-GNU awk (optional)     5.1.0            gawk --version
+GNU awk [#f3]_         5.1.0            gawk --version
 GNU C                  8.1              gcc --version
 GNU make               4.0              make --version
 GNU tar                1.28             tar --version
 GRUB                   0.93             grub --version || grub-install --version
-gtags (optional)       6.6.5            gtags --version
+gtags [#f4]_           6.6.5            gtags --version
 ip-route2              6.14.0           ip -V
 iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
@@ -54,7 +54,7 @@ kmod                   13               kmod -V
 liblzma                5.8.1            lzma -V
 lzop                   1.04             lzop -V
 mcelog                 0.6              mcelog --version
-mkimage (optional)     2017.01          mkimage --version
+mkimage [#f5]_         2017.01          mkimage --version
 nfs-utils              1.0.5            showmount --version
 openssl & libcrypto    1.0.0            openssl version
 pahole                 1.26             pahole --version
@@ -63,8 +63,8 @@ PPP                    2.4.0            pppd --version
 procps                 3.2.0            ps --version
 Python                 3.9.x            python3 --version
 quota-tools            3.09             quota -V
-Rust (optional)        1.85.0           rustc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+Rust [#f6]_            1.85.0           rustc --version
+Sphinx\ [#f7]_         3.4.3            sphinx-build --version
 squashfs-tools         4.0              mksquashfs -version
 udev                   081              udevadm --version
 util-linux             2.10o            mount --version
@@ -72,7 +72,13 @@ xfsprogs               2.6.0            xfs_db -V
 xz                     5.8.1            xz -V
 ====================== ===============  ========================================
 
-.. [#f1] Sphinx is needed only to build the Kernel documentation
+.. [#f1] bindgen is needed to generate Rust bindings
+.. [#f2] Clang/LLVM is an alternative to GNU C (gcc)
+.. [#f3] awk is needed with CONFIG_BUILTIN_MODULE_RANGES set
+.. [#f4] gtags is there to generate tag files through ``make gtags``
+.. [#f5] mkimage is used when building a Flat Image Tree (FIT)
+.. [#f6] Rust is only required when enabled
+.. [#f7] Sphinx is needed only to build the Kernel documentation
 
 Kernel compilation
 ******************
-- 
2.54.0

