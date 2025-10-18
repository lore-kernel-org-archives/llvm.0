Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095F28641D
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809555; cv=none; b=C9dUdUK1iYDl8JOTNdUyKq282QAqDj/Y/p6YUGcEWg+Qd+FmqaWXinPH0gRJExYxtw8yPAQ2E1AtvRJ3z1H5YB8l4pL0mTiA866WTzOfqMBOdzhqbAQOGeLt6/Cml1z0epvCSyAeqI7rBb6Xy1/75Tl0KmASNAIG1V+uf5Nur3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809555; c=relaxed/simple;
	bh=/cgHz1cX/7pqPCiwokdGYY23t2YMKDX7WgaCRbImZEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXZbwK8byjWQZ51a6Gw3UICicUORjp4og51Qt07b9c9wgu3pey+qgwyMN4HRF1ijbKdfFJV0nU2crSm3nuPqYHd7++7YbXnGvUa+dKTcUhaOUxow0ZYYuqxeGxu+fN9z+VOIwRepgBN11V2hXWoR6Wzi8H4zrMw/1fVLcc3qRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzw6NLfA; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzw6NLfA"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87a092251eeso77066736d6.0
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809550; x=1761414350; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
        b=Vzw6NLfASM22na6tOpyTTTlsh/JCVXPo2BL62tkgJ8kq6QUbmO/kQ7zImKK3i6pPXY
         NlE5xMLuGKA7EFgzRbUR0AeC0vnZZ4REkybRNJJ9tMwVa2zA0+mxyg+9SpW2esHW+oTv
         EHMjGPX14yaRmpNUnI8mnnfx46o+RvDmsFUU5BcoYhXInr85vsY6Hp8dw6TOq9sNkcGu
         HROYPGT55R0QkEfREV69+KdiZLKW0PLljv+RF8jvZ/j9jVw4cMIFRoDWbzqz0J039m3d
         bb0iNBz3z0fNFDnsZqBSnCEFGxKzgnXyumhSx2dPj4ejrvzCOyTnYTQE6GjWhTzhblmF
         B5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809550; x=1761414350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6x4i2Nx/KcrVad3Kw/MMDkaM+hSW8mJw3uIz+XsVU4=;
        b=s8eclh/491Gb7YLXcBtpXYMiXLSy6gYySxcCwrBbyq9lWdTP89u/znBf/WW65jon1K
         bLguRS6s2InBjaeXElBuDV53dbgfRCY+Kaec387EUqf+WmVsP0sntMlt6Zi9iz5hk/a1
         tzrVyAN0t2hKW6LBN3aXoktuzgag+3/xmT3SmD/qMVLebKexJNi3kgHcYCrIYKgolL6+
         +X6OLGQLwe3/23G/OtwiJuHsGJw2mnkpp8bXGXMW3Fi0sp8jc3XI1jhh0XOeOKs0huV/
         1N85hvTjRAxs4NPzgKaIcQEz4gvqAtmbnJ0Z3rfjU0CEzCidsRjuU5qJ7/CVe95dQeJn
         kusA==
X-Forwarded-Encrypted: i=1; AJvYcCWsrx90GQikhgkwxTnlVgaFJO3tmuiXtwjfOlDv4Ju31IBFWezPG+HbQx0G1NcMysUjVv4u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0KUNIuqszPVtVkREhNRHrL1w0yY4tA++EyuvfWN0nJMhQEXhc
	V9jyylAYgSIf0pZxTTvfmkVd/TPmRjXepGltjKqmOHyqaQyehwuoGJoB
X-Gm-Gg: ASbGncuS4Gb1S0GZ1L8c/Piwovp+pX5IBQSnNbgK1hWCWip731uYzozxVWVKw8zYcx/
	xkLrdBiPVFRubhyHuHMNysWgDXcCu3if7l5M898lZxLGAz5Yr8Gqp1y9oF50g4ZtMIQCLQZsGeM
	gFWh6d7rWb1LrAdAkSwf4EiSCVKXWE7yAEvAqt0y2WeLASjTd3U5JMFFZrnw+Fzf2XYyA2upvh1
	NeKkcq3Pkf4UVpimj2yQ5dcpLIL97uX31tOAsiuF+MreE95r++Jzw34dUQglaEJkuQCSHw87b0e
	n0VTbRifsYanhx3fJZING4o562xFIIYJSgHcK4r7+4HVh3CxDycLZIFdtaKJVQqE9kaeIAlxeEW
	rWTiAMR1/B/7APJIPUSZidr4Zr4LajghvI3YoHl5fWumAzTP4o41YgT7lN58ZKvtKmX5yjf7KdM
	x/RlC/o05zReCitDkkNlkzmJcvW3Uw9kNNLdn4p6w3vz/UGBN6wJ29fuQ4OVSEHWUp8tNUdqaHw
	FOV8kXSuiiOvLBSruuPr3TnSeVacPOMLzVDtM8iAtZiKTkfjp72
X-Google-Smtp-Source: AGHT+IFp9Vyr6DTgU7wMi5TzpEwlGd9IqV/k5vFAlka/PSHuVo2bkmg6CmRBEzK7leqOE/jg7Hax7Q==
X-Received: by 2002:a05:622a:609:b0:4d1:c31e:1cc8 with SMTP id d75a77b69052e-4e89cf24499mr98131111cf.22.1760809550121;
        Sat, 18 Oct 2025 10:45:50 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:16 -0400
Subject: [PATCH v18 05/16] rnull: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-5-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=1568;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/cgHz1cX/7pqPCiwokdGYY23t2YMKDX7WgaCRbImZEk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFUyC4lRe8XY0+2gwbmqCYLMq7haRexJVvoEh9TOXoK7TJHzmAqN9kHMrHdHUQpbaYKcy+kW0rr
 jQd4qaEURmQ0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit d969d504bc13 ("rnull: enable configuration via
`configfs`") and commit 34585dc649fb ("rnull: add soft-irq completion
support").

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull/configfs.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 8498e9bae6fd..6713a6d92391 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use super::{NullBlkDevice, THIS_MODULE};
-use core::fmt::{Display, Write};
 use kernel::{
     block::mq::gen_disk::{GenDisk, GenDiskBuilder},
     c_str,
     configfs::{self, AttributeOperations},
-    configfs_attrs, new_mutex,
+    configfs_attrs,
+    fmt::{self, Write as _},
+    new_mutex,
     page::PAGE_SIZE,
     prelude::*,
     str::{kstrtobool_bytes, CString},
@@ -99,8 +100,8 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl Display for IRQMode {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Display for IRQMode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             Self::None => f.write_str("0")?,
             Self::Soft => f.write_str("1")?,

-- 
2.51.1

