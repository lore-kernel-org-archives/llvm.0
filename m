Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net [178.154.239.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB4347FFE
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584789; cv=none; b=BcpRVcMX5akQXcJTqW0DBUD1w5MKRujzZTNmHc+bGheqW4A8X0DlkW8+6sg9BEPCr1hDbG8khJm7iCmi6rOr/GOedrsD3ijKNS+3kJTdN2DxVp6x1/Ivnal1O9qiGxEWNuZmMNJSsJbLQ2hebi3+flPaL0nFJK+tDh0O6zPqPn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584789; c=relaxed/simple;
	bh=cO991nW5urK9/OXkLEZmSQRBSSTG1gg61Ln2YmTXY64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CnPGi34iFmB1/ex0psizlcFJMhNEa/WjNdq3df6Eac5NdVkazIvnI7xi4UdIvZmKTZp3uxnHRJhUa/knHVLOZ9N8UrXwSboyKRl1CerK2UzNIN1d4eg/P9tpx/ynlAtE8MvjI+0GhXMhRZaKfS26FR/j8/KucQnx2+tzYrzSap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=f6G9iKr9; arc=none smtp.client-ip=178.154.239.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="f6G9iKr9"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward203a.mail.yandex.net (Yandex) with ESMTPS id 907658760E
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 16:54:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id CA3E7806AF;
	Wed, 24 Dec 2025 16:54:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id jrctgn1HTiE0-TsspEcnG;
	Wed, 24 Dec 2025 16:54:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1766584448;
	bh=eSIvKMG94eNJsUJQbnQOUr24UTSlu42e0Qza5prctJE=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=f6G9iKr9mvHhI4BhI7Pop9U13YbP/tf4wp6SIbdEgEqquDs8txAVpRdKh6AN4Pn8q
	 hed9Ffar7amlil2kbKOdP6vI65aU5zuDtzPi+J1GMIDea9bjAs+WKzvXMrzm+kMAQw
	 maEeHgU4mcfUSzrwz7pWDQicskhZq/8+O/78iWcE=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: llvm@lists.linux.dev
Cc: ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] remove sysroot assertion in generate_rust_analyzer.py
Date: Wed, 24 Dec 2025 16:53:43 +0300
Message-ID: <20251224135343.32476-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With nixpkgs's rustc, rust-src component is not bundled
with the compiler by default and is instead provided from
a separate store path, so this assumption does not hold.

The assertion assumes these paths are in the same location
which causes `make LLVM=1 rust-analyzer` to fail on NixOS.

Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/565284250
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 scripts/generate_rust_analyzer.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..e69fa5e0a9b9 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -213,9 +213,6 @@ def main():
         level=logging.INFO if args.verbose else logging.WARNING
     )
 
-    # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
-    assert args.sysroot in args.sysroot_src.parents
-
     rust_project = {
         "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
         "sysroot": str(args.sysroot),
-- 
2.51.2

