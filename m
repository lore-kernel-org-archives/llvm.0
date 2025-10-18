Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858992741C9
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809546; cv=none; b=flHA/rM7aGmo8OXL2ZGG2wz9FYCA1t+JFvGBZbNAI5DiIm+jxyZm0MN06WykACRFFeY8j06KrNwSMGkuHgTdXTB1fK1RBo76H/6UKKrRCTcO/Anr72E63gRL3FIX+TLh8QEAQh2TMYiEyaRARQu5dyWRQShIY4UnA2SV+hWGgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809546; c=relaxed/simple;
	bh=872/2/9eITdb9tB+ajd4McXNzNIKi7XLnXFm8ifjokI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7VmC39PSHzBvJC/a9D7KNrEAwbN/+AuRAxkKn9yp9xMq6rDgEPe8ATVjvh/W35H2dr+ariCwR3tM8cMDA+HC5MsAczG/nlGSTFZKeSIkn4X8WWVUP3F0mXu0JNnmdXCNi7KXI0sHP38m+F79Eg+y/gtVOV9th0MdlJJw2vC7eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdeB99qP; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdeB99qP"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8901a7d171bso370095285a.1
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809543; x=1761414343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxxD2K5FdBz/EnZVjAulq7wLhETf3uBIbeo+/VSTI5o=;
        b=WdeB99qP7k3ZipWs0VwLViWx0qah1PLyEpaviAsSZC2TdVLuqZqXPBAtgQ+WhhnoVx
         wyNNgXa2wVhwmeAX9EcKNX2f3nezPixYjghBTWoY8RVASwTdAgOMywhSAtrOhdRNJHn4
         J7vBdo2cyXSujf+kWXmg2Q5unfwWZ8+2OA+9smvqRekr85Kx289XbNW+gNl3dfGP13KB
         yJcKRd9OMudAjI5H4ElogpI7izy1lVlymoCUj00PozuXJHMdeuiwQNEfQUt6GqcTlePC
         p4ovy1CxBctKMLkaoGyXoLgwWdtluMaaToQRX/R4PcTRqAoOb6vPmHDpF2HPFWrXzQex
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809543; x=1761414343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxxD2K5FdBz/EnZVjAulq7wLhETf3uBIbeo+/VSTI5o=;
        b=DGZJ2wMw0hN3Mlq+1f7xow5FwW7LMkQS2yvigBrOcNTFxF9tJe9ZF5eFNxsRTYB78j
         opePRrYgVPOo3NSEo+nkCR7dYyGsSQBcDTOax8VMK8Be7KMof3WnAcq7ciWluhrC7L9W
         ifS+OwGq1yZIwm3LG30WygJn1b0YVy8mLq2fizeU2LRD+D3wxAwWyd44IXNsWxp0/E5a
         JhqkQL/fEZBi/sskx/50LG57ute3pUQA07m516NDZ36uc3pQzuew9AlfU1Z2mAMVf5pb
         SHcgmwnk07CgpBUQl+43VoMORTynsugES30i+tLxr5ZRHrn0bg/MzEO8xl0vByyTFGMw
         gDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcwtwL4VzuwVzBBTijWRWMvDIq5fgZ7oDSbKGDWbw2Z4EcF5KMEuetBJRNrIXZWpWyvYqK@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw+0mkEoE7L3+73bJiPxJvaF2490UzV2+u/L6wSjRRaaDQQci8
	CbrGUCyKDm25GwLm22mwEa1Eh+4kWNj5WvrBXl5CypojifSMe/K+SVLO
X-Gm-Gg: ASbGnctvql3NIy2sKrHxdl9Z6/BOgq19Mvu8tV2UwPt3z4+/yiL9Fp2ekaSN3uxsbj6
	iDIDPxOTGh9lK5z29rMFubOFoQcbxRJ3kUk4J8ihblVuA7wtululClby2W0CQw13vBBJHWeOo0k
	ruDn4YijChV/JCfB/Uam8MpK+kDNadcCfkEU0kKwvLN2F+wPyQDRHAklZBM9PsJetYHSQNbIWQ7
	f/gQ0rjqXE9sw1otRXj/bLaoCFw8EMEYyHBQvsGjdNx1GbjFBDZ5m3Mjxy9wuy/lR9EnqfShL29
	4vk3/WnhIp5p4QFc5IX2x64oEfJsIYDub8Oasb0oTY4aYnAGCxjrqmvgOFDLeYSuBRBYa4a0vFM
	ctMLVvE9I9zeSzadPlyzyTxMfsmRN0V2X81Ljr8qWfztVmvo4peNK0T13/y6OeSzvvoD7eWVssX
	mXXU6CEpnAb9EZoI3dCeP3AI/dUZtIlci6RrFRae2GNp8gFDL9U89eYMlqTl5ngoGwKZI5WNNG1
	YjEqqNdmhUgJ6qRWEZj8F3vOVzSB9tYEBL+LAduRJy74c4l1gJocx/E0AXw5FQ=
X-Google-Smtp-Source: AGHT+IFKKdVLl3mAPx5GW1O57JDFIbYY3aQNyGp5ohShtikkzbyW7xTlAHv9ByPokofKb8ncQ992Dw==
X-Received: by 2002:a05:620a:28d0:b0:891:7def:94a5 with SMTP id af79cd13be357-8917def9615mr601979985a.89.1760809543355;
        Sat, 18 Oct 2025 10:45:43 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:14 -0400
Subject: [PATCH v18 03/16] rust_binder: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-3-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1195;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=872/2/9eITdb9tB+ajd4McXNzNIKi7XLnXFm8ifjokI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNpeE2O2veZx/WAQcXn2BPsuVFmwejvaIZ814PGVaIzTcLISv+9UjXgL3SnRuXBWt3P0YjfBZ5X
 ySAtgUYGZcgw=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/error.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
index 9921827267d0..b24497cfa292 100644
--- a/drivers/android/binder/error.rs
+++ b/drivers/android/binder/error.rs
@@ -2,6 +2,7 @@
 
 // Copyright (C) 2025 Google LLC.
 
+use kernel::fmt;
 use kernel::prelude::*;
 
 use crate::defs::*;
@@ -76,8 +77,8 @@ fn from(_: kernel::alloc::AllocError) -> Self {
     }
 }
 
-impl core::fmt::Debug for BinderError {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for BinderError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self.reply {
             BR_FAILED_REPLY => match self.source.as_ref() {
                 Some(source) => f

-- 
2.51.1

