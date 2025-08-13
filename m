Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3F2882C4
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099918; cv=none; b=F05amXbdSXxgAL8EXMKv6jt3SqxPcjx/ICjss7IRn4UFH+UCtcreKK1dAQiVbfIIJtuJOkkYAh5lX7gi6vGlb3oQ3YrcgEDtidYaR911OXGIvtIkUbTenQdZXon/457zSovKt3ZpxwawwaBwFpJqrNr4F/ddOPBYcpZYZTnndAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099918; c=relaxed/simple;
	bh=LjcCbHMUoV3TltewN0HsJRdLdRD1ekMI3/F3iYl7gdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3A4IP+uGqRnc6eqNwFyEz/ZPCrBCkM5Lq2RkVqZUlYlV21qe8aIkgiVxH2TSNFOQN/GPpbbwAe+dqJCe+EIv7/VAJ45Osgd19UEqq/71yUHCUN0u+42wSyPyLyc8gQ/Pkx4jxN4wev1hNza/kaTzZ7XeQxvSxWd1C5kaJbU57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn+mmiFq; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn+mmiFq"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70a88db0416so812196d6.0
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755099916; x=1755704716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjwWWlaiSxuBLrutmj24/qoTYXM0TidVt0sz9ukj7i4=;
        b=mn+mmiFqoePfW75Num97Er+juM+Ic1tGUNHn2ZqBuUo2bcuJa87ORN6vTXPbed1tLH
         7UPpfjxcurXX3aRv9KPWEH9KG+oeGv2no14athG9quofepv8gykyBq3VR1n3gkLXd7wh
         6YqrE9y2PJb+4kdfUDD1uzt+Q69RBFiQWIUNthnl+E/YYCUKwwZ8AJXf/oWBsCEIbr3T
         HetXo0/UgHvSJfYyppYS0y3eSs8/lz70+4exvLfNyThipf9Q7cg49stXPbs65pLvFNV1
         5GO3YHTDwfdi195W+VNe4o3GJyv6//QAusLkY407Pa2CQXrhcAq53D4+sfOsYzje31BJ
         dKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755099916; x=1755704716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjwWWlaiSxuBLrutmj24/qoTYXM0TidVt0sz9ukj7i4=;
        b=joaS07bKsEJduV87V09mjsL7X4DQf7YyxXAiqT5Lbn6h26NUXG1+1St0AHCPv1xG+m
         yEzC8ckqQnQ6Dg3laTvK5KnrLiZL5/TkMc5Ved62BzllVXpm8gKtSmTPxOO2kbA1Bn5K
         3lPE3ZiDjlcWbm3sAIJn6Yp4c5FY2h0jegCIg+fjd66ZqXRhgaYMrNByGmcpeUhBZmMZ
         KlTozInsXofHZhWWRc3N/ArieOKmoQCGj77t/1b92JA8MqKSNitKQOC7GQo/lvtDEFry
         pRueMGuaGhjB/i5YfbP7kNQOpL6cIBL4OfeJdsRvMqS5pPEWdxVaZjpjeL0FtGSnzuyK
         Vzlw==
X-Forwarded-Encrypted: i=1; AJvYcCWUcEfrVRuDlRs1nLhWg9otOdSgbwA9ASmw9P4RylPuinv4N797KDPWVen88D+0JOmqh8ir@lists.linux.dev
X-Gm-Message-State: AOJu0YxSWbnA6TVDm00HyhYvJp+2K9/rA83XCo7Qou8lrQvPUtzrUWpq
	2FkSA8AukY1UOkO3RCXlrlmcOLj3Wtx8/Vn/iRbTncoX+/B1mqiZpNrQ
X-Gm-Gg: ASbGncuIwmnl7Ml1PqwUyEUJ1B1S8KE7B951QNBM3m0iIzLCf7mvREkJS6lXSNN7jML
	P7KbtOmOdwiKPYhCusgKxayn6XcLcyNgBRHhqpz95YGgDPxMdw//doMi1Icgu3BoovZIZ7L1Fp8
	oibknNlLADQv2maUzGB/4fdbiMJQf4vhtzF1F/ifsw20DDLBwHNYOX3hrRRokoIJZ4BDtlBXJZ/
	vLHFAt4ImSFtAIGVeQZpK2AYk3C3dVQc9Z89Y3i/+nhU/khoXMy7fr6M5PrRN5zztrxtWQrADUU
	7OXfS7WGD0nFnOAS6+XyoHJhKC2Ock5o9FI6fHPfW6Jxc+4Kqpkofn7GeAshBP/OidhYiWptGOS
	wuA0L4zMKTzFJsUd1smeVUgh79QTqIanLCpcB83JcrOlrEEhc/RMuDhk3FASEc33EQ419b9UxOC
	jpTirRYDnzHO8nWmdDwYTkOhOVHLbXsJ88AA==
X-Google-Smtp-Source: AGHT+IFo4WArkDrsCUK9t4B6jzw/aFmRiBWP2yrzAvS/zR6ACJmHYfP/VTbhopmm+LesuhQ0Tnd1Gg==
X-Received: by 2002:a05:6214:c62:b0:707:5d90:5e92 with SMTP id 6a1803df08f44-709e8969c59mr52606936d6.23.1755099915764;
        Wed, 13 Aug 2025 08:45:15 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:d445:7694:2051:518c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca3621asm194127396d6.33.2025.08.13.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:45:15 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:45:06 -0400
Subject: [PATCH v15 2/4] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-cstr-core-v15-2-c732d9223f4e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099909; l=1557;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=LjcCbHMUoV3TltewN0HsJRdLdRD1ekMI3/F3iYl7gdo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO8mU4ZtUTy2WAWiBRXSVqeaRSmzF3VR/fQVAMv11BPx81UtsH2jPBVrPoOeIFZIGeK9uRKIC2T
 lF7fw1KgGMA0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for the next commit in which we introduce a custom
formatting macro; that macro doesn't handle these spurious commas, so
just remove them.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_platform.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 69ed55b7b0fa..ad08df0d73f0 100644
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
2.50.1

