Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2D3112B6
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556323; cv=none; b=RqVFMbwKH1ocR/cdhWit4ZWaW1IXICjoGCNLyKHtBoSZ0y2212n1IeCpUsK4DtOwWfVp2nueWKIasToMx84N7bgg7RPzX95yj1YyW3nqO61qK/9IAcdHgxsMhonSbToc3d8lfMvA5f3eutH+pJNybvd0pskB2pmKbHlcIrLkYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556323; c=relaxed/simple;
	bh=5hkdJMBXvyM5ROn0CqVVfhpYPBMFyjtfSpETEaraIms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ak18Zzly5hFzUKSs0yk9q6QcPbQVF8wQzhE1/gMllGJRsa8A1vPtbd1OamGBTR6MMOOaIYNnJnn7cmDZZzhSVXDB0dUukH1i3DEqQU9hyS1ye/iEbhLxBIUTyKn015XSXlOAm3/T/W3HV8lY5GKD9e7PD5hZ0yG6ZtcPdXetRyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOnLdeTM; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOnLdeTM"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so22082746d6.1
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556320; x=1761161120; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zfr+jg9qjRBK3esGQQzBD5L0g4VK44y370TXRFAq7lU=;
        b=XOnLdeTM5Yz9aJG8HuDASfD61Pcp+nTtdOIxP8sVkWDk1FaiF2yXNsMqHf9VBXbdRq
         rqoefIj8FIdHIwSLdoXd2QeqbcxMvUB6mL2K1VnWzCftdd+/l43VZTMF9bk6TS73QmUX
         sWxGAE7U93MVMlvN41Crkisx7f/Afp7i5db08NvfB5AW967GqWSLEb7yWH4AKtfzHKKT
         2GkJ8heMfQFyWLBE4JN1K1Z7QxUpT4X6GpWtvo5+V76WnUUEXVFXlZl+WBLpJu6jWW+U
         ApXoWHmGZESmHEpgdIGCIluYWe0G61Hzbxr6Nt7gcCh+Gdp2Qz/FaaxBT12W7C14+0ss
         Uvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556320; x=1761161120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfr+jg9qjRBK3esGQQzBD5L0g4VK44y370TXRFAq7lU=;
        b=k8dDBHNtbx7vMIrgzf8HLx8vydnj6FMdEvCi3+WPGMTD7CiIcrsVpHRsbskvR88tXX
         OfoQH/UrnFKkj2LqrEwDKU6j810U7ifgXgrcTk7fbNUu4WBq1w4nQHho9xnciwI0c8F4
         +9QxgtmfAOP+2fZ6ke3n65rkSUAYYb+5EEWTua2PpldeH+lTSugbVBCwLPOtFrf17kr2
         sR4g3w3YxjSY0mmIYp3F2y5GP+OHL+4tHGIeG/zRnOLVYyp5AMqdJj29q3Fq8zygnceB
         kXmADyXJWIrEbRfc+06OblaOoBvBsfO5nK1ThistoTquG/WniP4un4VqaMDiduUzeT3V
         WINQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdOhbCY0ua/rR0mPpJnA43zw8W4ZKPoij5xIjtDloVnERHGbt3BS7JjomOEtp4ADreEqy2@lists.linux.dev
X-Gm-Message-State: AOJu0YyoNg9oiNVQd6Ss/nVEiAfUEdhoB8oxiTG3daMn0bdofhsnX6zI
	KgT4NvqDDUhIUkeg0TT+/474RG25LxgCwnHrtN+9tM1it924nbmVpci4
X-Gm-Gg: ASbGncuQsK1rS548mXk1A7RdnXpmbMct7w1U4uBRH1eUyzySt+fDLD/fnyYhpeDQKNx
	2n8jg7z6xzAT00biluYpPY51ho6dbq3n7QOPoS4DPUb0PA4ZbMe0pNfl09XYb2JY+MwORnelPHp
	NdctokIp3XadN6BGrHj/JtmQlGNU4E1PQKGQrUK78t+FtuEi7gYP76kpL47jWBG4cUu8vw2ugTK
	oNIGv/YnEpDjgaz5RLt8ehxM8qtnWzabv5OTJ7QK343SB3rPqn9fpmcSlS/tP2Xcl/OLvpY8tCs
	DtW14aY6/B7K+VhwN/btYz+1/Bk7/h2hmzkVdg+Q3qw7clSDEx9NwHBM5AMavs+Ptn0Y7/DrHFa
	u8cGoGQ/gW/6NDDj/r4h7Wn7O+LBATzteCO8cfOmD2vfQc+CK1i6iurjZexdBtzZfbVdeJfgOcL
	5GnAS/cZu4QvLsRDjxS7mKn/jZAfHa18YLkoP3h/8/w9zfle6AjruFGGVAS09YpofGmwfUrLoUc
	+44JtYI5m0yuw5sQvUDZZOZfEcWMbY/PYGlMkiwuJLCLUyuhd2nvOvHpvA3z3Q=
X-Google-Smtp-Source: AGHT+IEDOgFM0nazGEEfzHtKDS647mvDkfCfJSWTYyfnR0K2d3p2LPiGQli6GsrPQ32Cigz0HxquCQ==
X-Received: by 2002:ad4:5fc5:0:b0:787:f736:bc66 with SMTP id 6a1803df08f44-87c0c5cb92fmr20009666d6.1.1760556320049;
        Wed, 15 Oct 2025 12:25:20 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:39 -0400
Subject: [PATCH v17 09/11] rust: remove spurious `use core::fmt::Debug`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-9-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556296; l=620;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=5hkdJMBXvyM5ROn0CqVVfhpYPBMFyjtfSpETEaraIms=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA49f7ifUr2XwLcazgyI6X2saN5gtmXaaA6IvRCW2zqJXH2aWsvrcTeWwyt5IimaZuePXX9+Xm5
 hOtGKK/bcVgE=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

We want folks to use `kernel::fmt` but this is only used for `derive` so
can be removed entirely.

This backslid in commit ea60cea07d8c ("rust: add `Alignment` type").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/ptr.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 2e5e2a090480..e3893ed04049 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,6 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::fmt::Debug;
 use core::mem::align_of;
 use core::num::NonZero;
 

-- 
2.51.0

