Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA23085DB
	for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345596; cv=none; b=cWQfGwDwW0klSZoxdZMx3i6rO6pzLDB+jRrtGUqwrOJTzw0A2lZ85ymGZ78RPHu5roOIXin9fJsl1aRl6lm6hYL7c7XRX1Ki0Nus4SXXMnXJR1e4wV8gtSWNUJ9k4aEnyG0kIwPNubnX1AA9Xx/LkphM5bN74Ub5Omb2Z2E44rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345596; c=relaxed/simple;
	bh=EBOv2iJUrNuFvpf6DgfwXDAQle4Ii2A9b6MwmYUjoEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+D/UhOtV2NWqc1DV7gRHIVZ6y+MML01s8CdSqd+hkvZmROkB+TBkKMmwNa136LtHXYEd/Z3rhLkKsUProU/w124KpSlPeJBLJ2w/E0hi9gpoo1cKZvwWEhNPiZIMWmvvB4vrVTpRKm/GwcxpOHcy7v681HSB90x9N5az4TirCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj/Kdbki; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj/Kdbki"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a774209cf0so6327101cf.0
        for <llvm@lists.linux.dev>; Thu, 19 Jun 2025 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750345593; x=1750950393; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bM2aOZbws9YwwuYVjK1ug8LtX85CzdHif6CnDf/GxLg=;
        b=Uj/KdbkiS35P6+gwnQaiBLR6WPf8XnsAKczxVR9OLsc252gOzuyvmDJPFJ3DgPecYM
         FjQL+KDsk6HFmma5oqlq9yhs6EHw59MkSkSnnOCK3pA3BaCwBFSNFf2ERiz3jIoyPth3
         8ZTpIdjUQGMn/6XSnJ5KTLtKSyUC4Ssi5NXq103prNzw6Lnr02imKnPuA+5muB6UnDIw
         W2X++gsGjvgRVASO80mnLtXp+vc/hwrXHgjiW9pz3e9I6RMwcNgbv20LIZpxVR3UA1Mh
         6Uew9K9E1HUC9yZ+gPdC7Zd/bOK5rJ5ja2fixBJrd8SSYI1YnYx874soBOQF2lPNaiRV
         Q47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345593; x=1750950393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bM2aOZbws9YwwuYVjK1ug8LtX85CzdHif6CnDf/GxLg=;
        b=fF9AlVvQBl21xYWMnh5OU2coJDZz3Svzzq2uxBdq01szp1mWBNFyGkQVwwi4i0fhzq
         mTX6F8QV0dKsd9AoQ1j5P+wxSzGoIp0qn4YGDgkX5Z90wdZs19yBRxd4wwmwAOwfolnm
         +kN7V1lNOb19XAFXmgKqT7UjJiyWdtGpeZmRmgqIaiyX243ZtIC1Ewjso6HkVoQa+b6L
         lYrtJQElWD4AiSZr/tIKUfCXOajC/JVo+MtIDnDHTB1b1zHXoKC2g/2ALE6O/3/kewfk
         BILSOopA8kZVRF/xRvFigi9EucpfZddEFtMO7//SehAeVab6niUCXrCoFAUwen02jXfA
         CSwA==
X-Forwarded-Encrypted: i=1; AJvYcCVJefZ0Egmz/g/S3nfhaELvyMym+tS1g/aogrLhss2jfkSWYaZNOsGk8QI0qXxYEvTeW07n@lists.linux.dev
X-Gm-Message-State: AOJu0YxFEG6zxCBsKp3wo1RjKfJTOvQGw2WYTN4eh4fmu/HMMw0+Hywq
	Wu0AQykfa3cIq0iPexigPtuueQW1RnyfGR26o7X3MtdP9/BYGucxFAuH
X-Gm-Gg: ASbGnctILN98I1RXq/9y7jTMZLGW7BrfaZfOGQ2uIGoSQtOdRfMQ4IchBaTXj4ZYwBL
	3zB+rdIlkE4baZmVCgEsY6heduwNBVd6j8Z82Xy31UJIuz2ZD25x2L2IUZ/FN+hB24lhx3wWF6C
	XGQvoB783wDl2DEc7Rb3cY01qD4MlRMtR/qR+IHrp2tZh6RO7m3HGUCJ0PfrMAP3jO0NKt4agHZ
	a37fOLnMp9ni+J4VGnvRZfBxP9zdaVoOvOmPcBAFMqO4ls6el3vg78es3EMw/W35VduEyXrCYox
	q/j8AMahHDiZHIiYoQI7QM0QgBjF0tDGpO8Kfrw5CvihOaxPGq95qdBxpTF+bLjPvD96sQr3xfc
	=
X-Google-Smtp-Source: AGHT+IH6uoGJ80i+gmE2Fu3xsbwnovJZH3MPF8JNjcwJ3CVhnE00RGYIPfowX1mIbGAqF/jdU2etbQ==
X-Received: by 2002:a05:622a:188c:b0:4a7:29f2:313 with SMTP id d75a77b69052e-4a73c619203mr287096761cf.42.1750345593031;
        Thu, 19 Jun 2025 08:06:33 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:5c8a:fc6a:b57c:e57f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7785aaacdsm250531cf.39.2025.06.19.08.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:06:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 19 Jun 2025 11:06:25 -0400
Subject: [PATCH v12 1/5] rust: macros: reduce collections in `quote!` macro
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-cstr-core-v12-1-80c9c7b45900@gmail.com>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
In-Reply-To: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
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

Remove a handful of unncessary intermediate vectors and token streams;
mainly the top-level stream can be directly extended with the notable
exception of groups.

Remove an unnecessary `#[allow(dead_code)]` added in commit dbd5058ba60c
("rust: make pin-init its own crate").

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

