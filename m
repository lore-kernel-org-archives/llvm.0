Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC2253F12
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809539; cv=none; b=bhJ60Nnaqj6Iou2s/pKPcv1WoGwM5zvg59wOqpt5HsvHNfart7Zhx22Xjim4Euww/x0ve32aP9DO/Y6os93fvXkAJfHTRyAQ9qLpLIPUEx+K7iNkEj7CKL4K6FbRPmfeI7cmukKaXqQn3Ssgr2ltGuir2IXKG3onrwLDqphFwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809539; c=relaxed/simple;
	bh=5IzviSKzcg5QXxBA9uZe2s664KTsV8Tne2rtRwo/bww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeMltJ8+qNzV7ZPwwrVDay1h6iyhj1XAfM//Ba6Pwmjrst8z2vtj5TRJISsyUa601lWfUIoHwBMzDvm5YHHdz2rOc3F6JapIHtyJXGmX/YJDh+g0SwTU9hbtQuAtPMwpxTfAqUhUVNo87rFfNH4/EOrOOttRNb6dY4xp4T4VHHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMcLOC62; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMcLOC62"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7f04816589bso472516185a.3
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809536; x=1761414336; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
        b=LMcLOC62gZaR1DGHGjjH/EWbzvY3uPBbAEZCWs7aTMMEsAGEN6qS4tue+Bu49Iloqr
         bT5A7UxjI4kpi3mhk3Ewr4KLN35GK013nXNJSbfL+4w4Q+8vH+ApVPlcIZbHfSLas/fS
         LRonE8p8PAC2vbLveIOkMQgLfhQNqH9bRtPrYwjwhcBGEOF9IMJnhwbXOvxH4C3UD2ph
         sCVd0C7jr4VPlx23J9iMakCF6zKZh3ymxdAQcJSHpagESNCtsPCMyYgmauMDMndOxXQ+
         3TiX+e8SWktzMEyEJPCiGu/fFYF45uvswTqV60oUdmgvD+3s+6VyAuf/1uZK9nqm8ide
         3lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809536; x=1761414336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmofoJkHkMxsaLhdlprPrmfRRb4k8Y1fAGmfllLm4kw=;
        b=jV5tKpQz6L+qKX3pUIHhg3+lrttRVliGqjp0OmCiNjDPWh247cYssForkxInqtTYtV
         VyPjvZi9rJgpmDLq2ZdK6F9CoAsUpWrDGdaknf295UbR99WQNG1E/wxpBv/HWTOEltRA
         oKl9sVUhzhDBYgqvCegPJZ00VXlIWgEHms4JUsNBklSwPl3RVsUIgU0MUSSspYjgL/LP
         1yk7CPueN6HoRBZDN3wmenQ1vbQZf1f+SgKyEeuH195waejPDLqIScGG85+2SK2fQt/R
         1T4BVqVdEjGFTa1E1JrojCWh9Oxc3W0ZtCH4hwr0BoQCxEX+fLXLT8IPx52OE+Ng0RsF
         axWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhImKW3JcORmJUckJghATIribwJYSZgZJqpPKz1uReTWdjE7rnvZOUcxLMFevsvQL+kgTb@lists.linux.dev
X-Gm-Message-State: AOJu0YyRjFGyBxekcRZkjgCZ4PNJZZp87OhwYmkXi62um/DkivZcFz0K
	AWXC0d40JixgW4fMwtaRqelcAZ8wd6ijbAq3pU9KDxOAnGZoDUbgYQyZ
X-Gm-Gg: ASbGncv+jH5jNpYOwSwL7XaL+p91zyVV6FSYrDes/FcdzQrLl03fZY8jjLp5GrCpnjp
	Z6SGk/xbnWKXsyWHMOPJhPDzjcR/JbK6ZniqzelvzXvW57Vjg0OXuZ+t7gEDEeEHrFykzvgAobz
	rBuHVmqdBJBNXmb/vcV/hr9OqW30GbH+vt21Q4Ec+8uedmooLIg0Yx4FLW2TYY5bd4YU4wKCkzC
	qVcRfxcpPIQsR6+t9I1UO6wZ6RKp+JsaAba833zI5iVyYhPfKXQZl4hF2ib5QeK1Pex77TUBgxi
	T9SD4cWeyhLHZiWcvM/zmbDziaVbfxRmmFq0t1gKZ/u3R3o1iZPKublvO5VIJEczUiG/+4Gcgwx
	xIq7KtvXcA9ulber6UWE1IwVonhfu6WDIrfAWV5Vl1ludVTXMf0FOxI43xpPPE17Ag/WmcjpPu/
	LiUaUnR9WN0VpwVAfrcSeDJLq5AW8YzJnQt/KRPnMJc5fToDsSpsWcdPIL+WmzazhZyo30/osd0
	r2NG7h29eF45wh1hkoiRX5QneGdy2CMnPSNL46z04HleGSd6T53
X-Google-Smtp-Source: AGHT+IHGPyNylAC+NcjKR3LVCwruQ+XagK91t9ZK/AgOi9yexcJC3Bdqjt9T2UkkZHJl14b1ky8RWg==
X-Received: by 2002:a05:622a:10:b0:4e8:a664:2cfa with SMTP id d75a77b69052e-4e8a66467efmr59406621cf.34.1760809535454;
        Sat, 18 Oct 2025 10:45:35 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:34 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:12 -0400
Subject: [PATCH v18 01/16] samples: rust: platform: remove trailing commas
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-1-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1642;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=5IzviSKzcg5QXxBA9uZe2s664KTsV8Tne2rtRwo/bww=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDwRhntvVCGUiRlEkiv1zZeGhdA6rD6SNhGZH3QI1C43PlBagNvzfDvivxfFTU380ObMT25PMu4
 pe9SrdQ8j/g4=
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
2.51.1

