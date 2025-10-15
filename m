Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E04306D3F
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556317; cv=none; b=MnMhE4POKM7Fk/eSxaW6cIAeGr+/xAijhBsE9UBoYCm6Lhp2tA7pGrD5QdC5KdcuoIkD6g+73cypI+WcwTWl6FZwHXgSeu1apB/kNCS+in9l3slwDRq3bFtnCkGwknnAQMvbPKzYUif4iTKntfPVdT95aV+UGu5+h9VyOIaQCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556317; c=relaxed/simple;
	bh=1C7R0OlcDfzCrDNlHP23bsVD6WxFN5roYyk953BnBNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okyjQeSWJDbJVsAAsrU6qOMvT98eyPZ1rZs+CCymDjOryxMR1sMjlUS4Q4b4aqVnc5qz58orcZiuL82j2DBxrYDlUk/0u683omxfJNFstErD2Inc81fO7LUQN1P/VOoEZdCBhRmOqxCiizIma7Sg8bJgzippI9g4lonyUaKwMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHv0sqF5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHv0sqF5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78f30dac856so100730646d6.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556313; x=1761161113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZKdkbczThzjFB/XasmnId0cLwQ4C+67cjGeOTOncUU=;
        b=cHv0sqF5ygaaw8Sv9ZSDVzvzsT4FWdygb/5y+b6VeA01fleSuD1AYWZaXN3hoar26v
         CXHkd20G49BJzRRcFj0nBicJT1Afm8fHbqjaLsjdrU+ny1oMkYPC7qm1ChVoRJ2hbyb8
         ZuFjdu2xYfSx2vhkZ1TqNS7MC2JUND4c9zMVhCnK08KteRSionGyTrcauk90TKNafOww
         8Ii3jRFnNfSBwcTIYjSl9JIYBZ8dUc39/+8esnDRo6+ZwWVtpxU6jtznifNCOTLXNdL9
         xtcofCwHAJE/TUTg9jjSQPot9vmXG+url2gSO2o3DeyMF548YGyDnMfS5L7PFhe7w1Km
         Xezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556313; x=1761161113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZKdkbczThzjFB/XasmnId0cLwQ4C+67cjGeOTOncUU=;
        b=qmZ3LlwoTTu6Cfa4yARxdXDM+WCuNx/et7S1Jkm6MCMbmqoLgua/7Seogt/RdKSSjf
         t7PuReAo7RndAMivwaORJz6wC36AyUN4zE6OYAhVtHMKXwYugUIDKmAC12AP5hdlxkBD
         nAQTabnBlJ45vTLy+C3B4bbA43tLU/Yr4RZEYoafc9HS8f8T5VVUGNTQlQFIZh99LtSC
         6WJBgvaN0moPrnK9wavy0c9vn8e/Stp2c/+bKLjKQsrniARjaHZVUuQ3uFl+JIYke0+L
         sx+YZfNawWAfd1Na7mxf6FcJsia90OOCtEsrcX/oCIw3ZT1jmRMirvdKms8mXVGMjsq2
         xsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+3wI+34kdbM6IO3OBDVc/8Jg9ZO+ZelH5WMd7214/SSjaQ40LAcPjugNptHMBKwCLSdeH@lists.linux.dev
X-Gm-Message-State: AOJu0YyyQoKrnimliKpsoG/w0zSMZYa5xgCds1STlNLE9nzwanlwsFX6
	bXHcWQsNkOMM5ziaRqY0RhazfWADUsLeSFvl/VZWPT7f0pW3Zh8kRVUN
X-Gm-Gg: ASbGncsnX6O09VpcBq+45RT7fgbxCup/MlJaO6hCPNlL6UtjE3sdTT1II238kIAVrkB
	Q0MIuY/cWYUt9PxLr+MEK4tSFcoKzi7oQaZ8in0RBpl38K20UGfckCt4/Zz3hPu53Sdp7KgjtJr
	V+tAh7FQEK1yR51Fkfwf/vwDKxvDuOyGvW0n7KCltobqY2UvoetAIek0Dvg4OyTxBT9Lk5ZhYad
	k3fx5Yusmj4zi2fi+LLWKFA+MDI6SHDeyUYkyEzWJdjXYFpkA4XcgQwU+lcpbHrXKAutl84pyXg
	h+pP8ioZi51L8W80zYfstfchz4SNvzfCbASGI5DkkB2PwljIDTQP7hNz8RCIOif4brn+AE72vwZ
	hHIFTGj4jyWaDPZ6Xv6GJ1hu96f8Rs9nE2op+DkGfq4zLOegLtgeg9L8LNYJLGLyXqYfJ5RzRTl
	DXTnpxd4AXF+nDj7spx0kF8/xkbKuYavNijTdZKVIUKm9N4vTHvqzgJHdiFkddfhpkF2xVq1iJE
	XgLFkQsuDNwV+HszzXSZ/70ivuw012gJzXaN29ZFFS95cUaQuUCxJdyPiK4k8A=
X-Google-Smtp-Source: AGHT+IG7liVg/dFGAXjOyaKmVuQjChyGkmShQ9JV9oLbo6kDusjiP3kvxzCrSASqCG/bT3aBHrC7KQ==
X-Received: by 2002:a05:6214:da5:b0:81c:b934:a01 with SMTP id 6a1803df08f44-87b2efb9b5fmr472291556d6.31.1760556312957;
        Wed, 15 Oct 2025 12:25:12 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:12 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:36 -0400
Subject: [PATCH v17 06/11] rust: alloc: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1945;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=1C7R0OlcDfzCrDNlHP23bsVD6WxFN5roYyk953BnBNs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDAN3p325daLL4ZjhjcTgzqClyBuzpHB1y4m1///5j/K+30qaqRH3Sgm2aqLHXCgT2ZR6uF5mJU
 hkiaomJhEowg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit 9def0d0a2a1c ("rust: alloc: add
Vec::push_within_capacity").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec/errors.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 21a920a4b09b..e7de5049ee47 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,14 +2,14 @@
 
 //! Errors for the [`Vec`] type.
 
-use kernel::fmt::{self, Debug, Formatter};
+use kernel::fmt;
 use kernel::prelude::*;
 
 /// Error type for [`Vec::push_within_capacity`].
 pub struct PushError<T>(pub T);
 
-impl<T> Debug for PushError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for PushError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Not enough capacity")
     }
 }
@@ -25,8 +25,8 @@ fn from(_: PushError<T>) -> Error {
 /// Error type for [`Vec::remove`].
 pub struct RemoveError;
 
-impl Debug for RemoveError {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl fmt::Debug for RemoveError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Index out of bounds")
     }
 }
@@ -45,8 +45,8 @@ pub enum InsertError<T> {
     OutOfCapacity(T),
 }
 
-impl<T> Debug for InsertError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for InsertError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             InsertError::IndexOutOfBounds(_) => write!(f, "Index out of bounds"),
             InsertError::OutOfCapacity(_) => write!(f, "Not enough capacity"),

-- 
2.51.0

