Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4D927E066
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388591; cv=none; b=IwLZV8ivsoZ4o4FhJlBXH03uLe2+QmqXOx6cK+8WiCG/gFVjxYUIdOU6+mlpg3aEcnjjaGnnUaRFSv1rqquuzOnzHxwLR9EXR9qT2yWzOL8Tl9ZVdNlFBgQMAfplh1itMH0m+3yvvZuSX+yu4mY99EEfd/F3LtD/TiV4uKzF6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388591; c=relaxed/simple;
	bh=chk1wwizZG1MPIiCNwD46/EZhbEvHPTiZmXZqpThA3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T13PGAVKgVr2g3N3Rt2imChrc2n5PT3vPKg7tlA/38Ds6Y81LynjF0wKglmCeuMu4R+AstlcGgrB60397Hwl9aemdieUZ9w+ecx1Yzg1YJ3CIRkmsEdy/UkOCnHs1c2DxSISotr2ozcxc3CoYM+FRlyDeOlcrVhUGgQDU6dv/HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnbXR7Un; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnbXR7Un"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d0a2220fb0so455562985a.3
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751388588; x=1751993388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPiSjh0N/D3OxLvptKuG8AXPpYOOl5hUxlwQvU9k874=;
        b=bnbXR7UnYnrMcLuxNiAXRwJhpGktNs8Ggnj2pNJx+tL6ryByXUTfXiFZ7++h1kEb6C
         DpLfruy8ADSZMUJxge1igs7HRLwBeOnWscl9qJS+YZadHxFro5v7avuTuafZB7eBsWpS
         2YuFCiQNox65g8qSnb6RME+pNV5gZEXSMwZ8OtfNa+pwp+nu7nGPlDouJWot5iLG2jTd
         hjK3ATA7/OCMpcTRz+pHe+cD6dI/KtaLQ7g5d+q6Ru45RCQ9gyUFqtj7ohOwohk86vu0
         pawJ64xuUd9cQWsjpB9hLSLZiBhf+wL7WGXwXN2YjX1WXjA7JEZfdT5jy3cqxDAk8H26
         1I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388588; x=1751993388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPiSjh0N/D3OxLvptKuG8AXPpYOOl5hUxlwQvU9k874=;
        b=YP6B+uhSybXDQlqaD1XqE9AkjQCZ4WpHORZm2XBInFFY+mpCOXv2FbSQPwCag2c/vX
         inkGTklYcRezofQnl336Cd5kBCNnwotAKZ+DVduWyf7pPt8d7GunTTV07T4COhr0anmp
         5dBZA4suzXJfgWMwHVulDnzg9vUZ4dYeLIqumsL5Yvv0eb3XTUUgQMuEOxvC2br73dKX
         O5ZCEHRCeStH3MWIddB9ToZY12ayFhKvYD6dbBWx8P5Kbyel2dV7GjaSMXuUe9mYrW9l
         pKwsdNDYcVvIQrxezTm1MyW+gwluD9rZJ577iWkYwBFUVtXNWkoycJR6bOgRRISOasT7
         BeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBauEIvag88SxTYoh6UbfQZAisnZ1HLzkm55AX/twNOUXoUa70cGFYgv8JdgXCvRUjLlM8@lists.linux.dev
X-Gm-Message-State: AOJu0YxeLVylas5qRuyHOIyNK7xE0HnsWx/4UNXAnig1S5NeDp6yvzIy
	tvLn2rggKGVGvgejIJRazRCtncqDAMwunq9uXclW6BmnYjbG1BAcvhHn
X-Gm-Gg: ASbGnct/UfeUv1IhQJbj91qkOLQcWN4oES3O8hhcl5P88CJDzNtEhtCUulVYbGy8F4y
	nDDjTwW0wOigNx8P325eyvFWTxqzdN7Vcro0klU1uYlL/O1Il5SKRquP8n2zPkXNeRdo9qEHngV
	EnFY9PVo6xllpYrWtfQuk33gbymw6iUzt5UCYIS7y6/X7NbAA6DrCZ6R1sajqHkiblTp/cBFtvb
	lClpG2w26Op4lEeZSC4hqN79kH9p0wAvTuDqVIQBz6oxi+SZimnxwXmeao5erNNJdtT45JIC0yN
	QRrz3JQypUPFqg5x1eOS4Cfo3nZuVdVD8b4L3N227nhK9MZhmAbgfAmdkhC/PPBhUZvA8ObzOAw
	iOde6VEg35mX/xchZCS+p3vAqgsr8jsGP6zAYO2BZLfe3HQ2jKVHZpDymxTv/lkaf2//zyb8BQw
	==
X-Google-Smtp-Source: AGHT+IGGs/fA6BbM/mtl8WZrhsacYrqQT0Q7w79xZLNS42IorGM0Z4Es17kL4nrws8MX53BCDx11XA==
X-Received: by 2002:a05:620a:1713:b0:7d2:284f:e471 with SMTP id af79cd13be357-7d44394fd4dmr2546821385a.33.1751388588025;
        Tue, 01 Jul 2025 09:49:48 -0700 (PDT)
Received: from a.1.b.d.0.e.7.9.6.4.2.0.b.3.4.b.0.0.1.1.e.f.b.5.1.4.0.4.0.0.6.2.ip6.arpa ([2600:4041:5bfe:1100:70ac:5fd8:4c25:89ec])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e285sm793098885a.45.2025.07.01.09.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:49:47 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 01 Jul 2025 12:49:33 -0400
Subject: [PATCH v13 1/5] rust: macros: reduce collections in `quote!` macro
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-cstr-core-v13-1-29f7d3eb97a6@gmail.com>
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
In-Reply-To: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751388583; l=8684;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=chk1wwizZG1MPIiCNwD46/EZhbEvHPTiZmXZqpThA3c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHncOK9jmTcSRpxenCz1qsF8Hfzh6VWwhvz5AFOmB20gAplsko5e7ie0TE/e9Kxqo9sKSUIwLiU
 Iq3d0s+9OwQ4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Remove a handful of unncessary intermediate vectors and token streams;
mainly the top-level stream can be directly extended with the notable
exception of groups.

Remove an unnecessary `#[allow(dead_code)]` added in commit dbd5058ba60c
("rust: make pin-init its own crate").

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/quote.rs | 104 ++++++++++++++++++++++++---------------------------
 1 file changed, 49 insertions(+), 55 deletions(-)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 92cacc4067c9..acc140c18653 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -2,7 +2,6 @@
 
 use proc_macro::{TokenStream, TokenTree};
 
-#[allow(dead_code)]
 pub(crate) trait ToTokens {
     fn to_tokens(&self, tokens: &mut TokenStream);
 }
@@ -47,121 +46,116 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 /// `quote` crate but provides only just enough functionality needed by the current `macros` crate.
 macro_rules! quote_spanned {
     ($span:expr => $($tt:tt)*) => {{
-        let mut tokens: ::std::vec::Vec<::proc_macro::TokenTree>;
-        #[allow(clippy::vec_init_then_push)]
+        let mut tokens = ::proc_macro::TokenStream::new();
         {
-            tokens = ::std::vec::Vec::new();
             let span = $span;
             quote_spanned!(@proc tokens span $($tt)*);
         }
-        ::proc_macro::TokenStream::from_iter(tokens)
+        tokens
     }};
     (@proc $v:ident $span:ident) => {};
     (@proc $v:ident $span:ident #$id:ident $($tt:tt)*) => {
-        let mut ts = ::proc_macro::TokenStream::new();
-        $crate::quote::ToTokens::to_tokens(&$id, &mut ts);
-        $v.extend(ts);
+        $crate::quote::ToTokens::to_tokens(&$id, &mut $v);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident #(#$id:ident)* $($tt:tt)*) => {
         for token in $id {
-            let mut ts = ::proc_macro::TokenStream::new();
-            $crate::quote::ToTokens::to_tokens(&token, &mut ts);
-            $v.extend(ts);
+            $crate::quote::ToTokens::to_tokens(&token, &mut $v);
         }
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) => {
         #[allow(unused_mut)]
-        let mut tokens = ::std::vec::Vec::<::proc_macro::TokenTree>::new();
+        let mut tokens = ::proc_macro::TokenStream::new();
         quote_spanned!(@proc tokens $span $($inner)*);
-        $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::new(
+        $v.extend([::proc_macro::TokenTree::Group(::proc_macro::Group::new(
             ::proc_macro::Delimiter::Parenthesis,
-            ::proc_macro::TokenStream::from_iter(tokens)
-        )));
+            tokens,
+        ))]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident [ $($inner:tt)* ] $($tt:tt)*) => {
-        let mut tokens = ::std::vec::Vec::new();
+        let mut tokens = ::proc_macro::TokenStream::new();
         quote_spanned!(@proc tokens $span $($inner)*);
-        $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::new(
+        $v.extend([::proc_macro::TokenTree::Group(::proc_macro::Group::new(
             ::proc_macro::Delimiter::Bracket,
-            ::proc_macro::TokenStream::from_iter(tokens)
-        )));
+            tokens,
+        ))]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident { $($inner:tt)* } $($tt:tt)*) => {
-        let mut tokens = ::std::vec::Vec::new();
+        let mut tokens = ::proc_macro::TokenStream::new();
         quote_spanned!(@proc tokens $span $($inner)*);
-        $v.push(::proc_macro::TokenTree::Group(::proc_macro::Group::new(
+        $v.extend([::proc_macro::TokenTree::Group(::proc_macro::Group::new(
             ::proc_macro::Delimiter::Brace,
-            ::proc_macro::TokenStream::from_iter(tokens)
-        )));
+            tokens,
+        ))]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident :: $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new(':', ::proc_macro::Spacing::Joint)
-        ));
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new(':', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::Spacing::Joint, ::proc_macro::Spacing::Alone].map(|spacing| {
+            ::proc_macro::TokenTree::Punct(::proc_macro::Punct::new(':', spacing))
+        }));
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident : $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new(':', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new(':', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident , $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new(',', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new(',', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident @ $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new('@', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('@', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident ! $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new('!', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('!', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident ; $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new(';', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new(';', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident + $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new('+', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('+', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident = $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident # $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Punct(
-                ::proc_macro::Punct::new('#', ::proc_macro::Spacing::Alone)
-        ));
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('#', ::proc_macro::Spacing::Alone),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident _ $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new("_", $span)));
+        $v.extend([::proc_macro::TokenTree::Ident(
+            ::proc_macro::Ident::new("_", $span),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident $id:ident $($tt:tt)*) => {
-        $v.push(::proc_macro::TokenTree::Ident(::proc_macro::Ident::new(stringify!($id), $span)));
+        $v.extend([::proc_macro::TokenTree::Ident(
+            ::proc_macro::Ident::new(stringify!($id), $span),
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
 }

-- 
2.50.0

