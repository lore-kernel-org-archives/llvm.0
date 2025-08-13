Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92E2857DF
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099916; cv=none; b=T3PZBRhJRmF8FWp8atW8iY3o5yKqkEpAOQZCj6r4axN8zk9Uwpdmoe+m7iU1Cw/8Q/UsK18BDeqchl880wEUzFw1B1of58HjJYyXs/5/B1UHDTkav7C69LCGramDxANx9fqhOSnd4djdiIMcss7hZGOndeojdCaNEyTZIvVTXfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099916; c=relaxed/simple;
	bh=PTDvM2HBIQtiHRjiaQnIp9LPfNsXH8zj3ZtohuuvaLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpNC+3QI4IwbngpDXmVdAuCRMCU+YpJyLsG130kBEXc5+rSoURGI7r6ZVLvfhUGUoADGBA/w2Whuvx4crxJbXUpJvFyjYWjY4bm6+ORXn7H9uKTiF2fMfrZmhe3XG1cXs80B2JELBjAC5xed3EDK+bRAOqBQMHq0SfdORgw45P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adP8FJnR; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adP8FJnR"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70a9f55ea73so599886d6.2
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755099914; x=1755704714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y+gnC6bXE+JfrQZkTYH2GNP1c2kKpqC9hVlpupTTFc=;
        b=adP8FJnRj8s3kDXySvDDCJVbYx0OKM0F1F6nhy2Xv8EP5OnYyIt6wz78COI5Cqo/La
         XucnUOvLlot4QroB0/u59haI7MkZzK54CFDpAsTT9T10K4VRR2d3+X13u+MRii1/2Rtw
         dYxnwOz35UL8mRW9pwUP3/2KB3yX0BhRuxKGUoieB6uXbDl9WdXasxb+EQcM65a178AX
         qN8xFSxUlSWuM2AFb7Z90yoze7hunOfHxumjrhreLC9VJmGN92RLptFL4leKHUALBj8T
         DdvB8fE0WpPTrMOSzSxSgj+k5N0h5xRU01GqHFSLRLxxMBvXgWr9v1TjYT4V8o/IrHhz
         3cCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755099914; x=1755704714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y+gnC6bXE+JfrQZkTYH2GNP1c2kKpqC9hVlpupTTFc=;
        b=wVFJWH3pFNQ3QXjiSLRbBtvB88c0HDYG9Wxhtc/UHva6yoWFrKxZQE1lQulC36GRdE
         GQoux0JC04lGmZXpXYDpKHppML/LaDZGlqCLrMBrGlu+mDTyO3/3r4SQRUw1uV2toX8L
         bXFriSwINoYKDk8oDrTgZDCYH0RIlIUsV7R9HXdNNsfTWUdhK2IXvYQY+UrMPgcHVrge
         6GGmScR4qnb2POgt0sGqWUfgm9gqFklKD/JPMq/QnfsDZ1E9h3UkLKqgVTXrmhsgAjJv
         IrQ4j/QFmQTw281qUFx2WRg72/1GSjO1Ia0//m24DXYkkX49pbvWzaq3UNxtBYALZCKR
         W9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXLk5GmdajR6pp884zEgFtfe9EHvglDUHbARnq4QBwKumXoOs5JN2Gdgw54z6yMocv15Dc4@lists.linux.dev
X-Gm-Message-State: AOJu0YyannBl+Q5NaHTu+YYAKz+N6TFsXSohl1inyo9bPhbu2rbCY/Ha
	NG7X9dtPc8FlHyXieUOL1GmYEAt9vHPDSizb33ercs5r4LKbL8EAnR/2
X-Gm-Gg: ASbGncueFe1+rSwqBsL1PiyEWpCjd11EOBIdpykT34dXWsf7WGxqsbvEGSkDFPEz599
	KQKze05cLiwnW8wXLFGMigsYOh1FdLg8CYo7BTDQeLgubFyOYrKV+F9WkL/ncSQfcODI7gai/VJ
	fqwNGCgxrGN53GwEFPLzYVjZ4uIb+QYMiFWZ3lTRW++83Rf/GMPnmY24MEuNrU2RohxPdO7Zofo
	iR+WpOLqvmHSIT27OWVduI93U0I9CDf6ggTRQVQm18CV5hTGeb/uP0GdIA+YNEjpSkVmSLWFrkY
	JWRWX3Ulhw4/Z571h8sdCWHQ7zX0UYqROzJcx0awBwn7ZzF67E9I3kAzORYitFpi8jr4/IxpVXn
	xLhG81ovYPMIU7qdpf555l9wBCt3Oq62VygGKsrop2Gmi5oyFlYkLnj8MmDNF9I0htSxEAF9j+V
	eaaekFf8ljG9RE+u6b6oasK8oBzdocusDVug==
X-Google-Smtp-Source: AGHT+IHtLspbw3Tqyywo/LjGQ4g7+P+EzXr8xJKhOKm/r+Oa+FAmGtFSkFP7kWNYQjC+LEzUuxX5Hg==
X-Received: by 2002:a05:6214:2587:b0:6fa:c408:5a3b with SMTP id 6a1803df08f44-709e87eb75emr38852556d6.9.1755099913733;
        Wed, 13 Aug 2025 08:45:13 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:d445:7694:2051:518c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca3621asm194127396d6.33.2025.08.13.08.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:45:12 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:45:05 -0400
Subject: [PATCH v15 1/4] rust: macros: reduce collections in `quote!` macro
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-cstr-core-v15-1-c732d9223f4e@gmail.com>
References: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
In-Reply-To: <20250813-cstr-core-v15-0-c732d9223f4e@gmail.com>
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
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099909; l=8730;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=PTDvM2HBIQtiHRjiaQnIp9LPfNsXH8zj3ZtohuuvaLA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDmMTBy3KylRjaSxoOn6HVmt++mJSXkDOp3JVyI3SaRT41raCRvnlfJf1bMl3uR1+0uOFSYNuSO
 2Pbl50BvO7AQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Remove a handful of unncessary intermediate vectors and token streams;
mainly the top-level stream can be directly extended with the notable
exception of groups.

Remove an unnecessary `#[allow(dead_code)]` added in commit dbd5058ba60c
("rust: make pin-init its own crate").

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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
2.50.1

