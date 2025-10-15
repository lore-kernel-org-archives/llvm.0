Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00603074BC
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556304; cv=none; b=Wl3W9ESKplA0WUgxWeZcC3C4rPDXxpYCLAtXNiPGimy/fdr+zrlS8zdROoCobcD/AIuMKsHYlucCLjsUPxqK0tJ4MtjfOiSQkdHOND6tZQotfzPuzNdDxDnGKcNuKsu1FTSEdFSn1bIZS0Wv7wYG45VUDZjgy1z4cKQ0zR5e19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556304; c=relaxed/simple;
	bh=2Vk6qFD+khvBWosYiPgnWwsc9w2ItSZw9y9K7Wf3lO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrYXRbSrJEMzZKmmgCZsMDBRdKUt4uwTZKhaR3ywf8+KBBfTae4NDJxtkOa32AIpzbn0P7R0y+x8oMRiVdXIHBhhfXVz86ELX9pzZS46DLl0JVh74+6rZqYzQTl/pAeghrkK/n1MsfyhEhy9i0zNz8H58uSbmvtv87wcVkFbZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrC7FI0J; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrC7FI0J"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87a092251eeso23819646d6.0
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556302; x=1761161102; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjPhqOIsQnP5icf3xI8+fTWI6demrBvMGeJug28QAmc=;
        b=RrC7FI0J8zUJ2ypeGNOH8Y4llbpJ6tgn5COY1LDh3LxOfeiadhjnCu79BPMJUiTru1
         R+p5mqswcm8H1pLT/n3FXRoKYIplRHnY9BIIrngjtWbD1LyeG38nIphcAMUFS3K0cUmD
         9sBP2LfOZsl2YaE1tsyBz/G4MEupwVhuGGXpw1w3itGNydhnKyNXkNLS6aQK/8Qys4DU
         u++rhL+062U0qs3aGMptnTRwtdXKaJjukbtbgPtoc8AdFRUDsf/0xZaqUy7qcLXTADVz
         QWaTdBjW44TR2XYcxuPgZUtQdQPCvnyzlmn4XhzdQhVlfUZy7XNY41vQY5z9MXGoyf/S
         F+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556302; x=1761161102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjPhqOIsQnP5icf3xI8+fTWI6demrBvMGeJug28QAmc=;
        b=BtzRigNIetOApbmukXo/SCaVWOAzWwctauqQO6iMmFoNC6N4CnTHcJmUhW0IWcJLAz
         lW6R0Kp/C4FX+RyVG+ameZkMzh+eUwjaxba71o/q1lWR/YZRRBb8101PkLLinzCOkevv
         56vBPTZnisSiYf1FQDGp+pDQ5FCiWdfOnSQrJQSaBj/WVosEKZvXUX7PhEwXZT/vGe9Q
         KxYcEpMX/POKIZH+5BxmPl17exUYTZlYtY2uv2EWCwQ52F88wnX97SM6oiHeq6Gjo8h+
         C0xfDxxtLB3tT+MubrK9Wh7YMWSUTNPXts127TWrR2FwOPLghdrJNc2APDT3GKFI/+SS
         2+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW/0BvqQP+k5zHEyEzQQaYWt4sVsyZ7sAmiRGZvAZTjVA0iHqiqumi8kOwsBDVoMsuYMtbV@lists.linux.dev
X-Gm-Message-State: AOJu0YyEqYp2CFnkQmkv24QS5d31zsPuAzpkaKlHjYOBQkguhs16CW5p
	cFnzEf86ZsYo7fHIKgUC0QtEBQZL6EfjyciaR473ZpEnkQVQxrbW0WJ8
X-Gm-Gg: ASbGncvAF5/ZXBuSI4HJobitiBiSzrMwfLsfdDK6Sh5jkCPA4caFtawkJKK/OT3Fxp+
	lK6klGI6nuqFxphwwQN6qub3QiIbHnsAneQm9NiNI6jBTXV5j+m+eIu/lWA9rDcsCg/EMBhZjv/
	RUvtcaLliN5sNntgWKeZ/evJa3xfaN01XikPTAspdtgWuQyKFb00b6kHcvzmTrKeOwjFMc2OZx1
	O6cbMcCcOx961AVxQZQONCuj68aiL/qx6DH7t3Or1PV6cjuzUx+rEZv5Y/kkjLiP6BBVP0iAmmb
	/2P+eWd1eKcOosX3+u2hlkIzlH6YKpkcxzbnj4X/NDO/7OY8mnEL/jXggC3nfUkwao3fpx885aQ
	V8nd81kYOERYSS3+dJ+PbTJng5LMFCfrZjJpDefy6Nz60xXvQ3Pn9sk3e3w8qhapjrWufnvERQs
	C9mdY6WYkFyJPGno5s2cwc69CWOg46SAUB6I2i6h4OEDAozq0jTH3sIOU1/95VCcQVEw/toujKf
	i1Unkl6M6mxMdob7ugLzKropYyyKnryFUo8MeeyPUFWYnIwi/fWQ+MSciUeCyc=
X-Google-Smtp-Source: AGHT+IE/6/93cmzALh4Jmouh/MLI95PCde1EljHLkZKlJY4iPwz/j8r/4JCLGlbGVcRLXtlHwQc0sw==
X-Received: by 2002:ad4:596f:0:b0:783:f54f:418a with SMTP id 6a1803df08f44-87c0c8131a5mr22292536d6.15.1760556301319;
        Wed, 15 Oct 2025 12:25:01 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:31 -0400
Subject: [PATCH v17 01/11] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-1-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1642;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2Vk6qFD+khvBWosYiPgnWwsc9w2ItSZw9y9K7Wf3lO0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKJ1BUAmPVQjuKlRlHXyE7o0qpMUW2qdVnOqngFN6VFfXZIKKvKAJg9piKZPdbhI25H2DhoqGoP
 iQgwB+DS24Aw=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove them.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 6473baf4f120..8a82e251820f 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -146,7 +146,7 @@ fn properties_parse(dev: &device::Device) -> Result {
 
         let name = c_str!("test,u32-optional-prop");
         let prop = fwnode.property_read::<u32>(name).or(0x12);
-        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n",);
+        dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
@@ -161,7 +161,7 @@ fn properties_parse(dev: &device::Device) -> Result {
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
-        dev_info!(dev, "'{name}' length is {len}\n",);
+        dev_info!(dev, "'{name}' length is {len}\n");
 
         let name = c_str!("test,i16-array");
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;

-- 
2.51.0

