Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE5261B8D
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809564; cv=none; b=fAnDwMt3BYLOtPRJZ2UvyOczBdKhIiG1MIPeKUQiJ6wIlNXXCzDWHutfr3PXWzqYQRc+uxGuS0nJS+OpWVp3iUTuhERbql8D7s8q1NULgbAkyz688+VdR3Sj1j9zlL4yKjBMi1c2GSE31s1m8OP0UE1DIhDbjddHt5OLwA3dcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809564; c=relaxed/simple;
	bh=03bsWp5q/RvNg/sXSrzNos1bBBR49+qyJdq4+m4Ha6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvakVQzw7VHv5Ndatf7RyA80o4fTdFiv4JrEQiD9aQ7teje7PPjNPc+drS/jqJGPOXV3WISx27OxbjfZzR+9Q2hvZtaG4tRGk8K7Ap1QO+De5PTIyA/ZWHIqDanTQJFfEsZgxl2qVssOsP85Nkiqkybwg0TE+u5bJpmj0SpOI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC3Hg4aq; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC3Hg4aq"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-890d9981983so330120785a.2
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809561; x=1761414361; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5WimfWZlEqiYHKzfmcAckTYkDvTe0+bpTYNTmk8aT4=;
        b=CC3Hg4aqsXVNbutsUBA0hhG5cmQfoqFr1Ld1EldNCtD9pEuuxYkBfzIeLFwxu5i7qR
         tzeaJyD6aVmCVHnT5DA/1JKohBmNQg7Id7MEl14ReVuEbHw5Q4hzXXKuR4S5dGJl8u1A
         Gc1LkxyTbzspZqnx2XFRCf4FxqGOivLrV8zPUBOd+3MnYBnkCqmmF83pP6zWaJ0yIKF7
         9Hg/m9H4RprII9Q+4MgPmeW/JruiboVBBMN86rBuitA4eBzWQFZDhkfJ/RSIlF2IA9Kc
         yqrv8UAUtrd1uR6FeXkEHK2eYR/aq/3qpqW3t0c35qjvKiYZIze/juk7VcEgA9aLlZC9
         txRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809561; x=1761414361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5WimfWZlEqiYHKzfmcAckTYkDvTe0+bpTYNTmk8aT4=;
        b=lqqI0TpBpDQPBPFeA9/HP8anXCwKHuZ0ZDyaP4mOcxsfV7fExnyMNbJeB3Dhwgyh6b
         2wOaLerW03EzYuBiBV4lql8dmtXSo2imvorTMV7pIojEuF7nbzfI5agO1THugI8ulXyH
         5cEqRifXWePPh4Lcl/HBET4XSNCLFiXqwhFTT8z5hv2qxUAPZOZ7rprEezw5v70JePZ/
         NKZ5dyrdAskNp7v4CfGvszHWNWGao8r6QG2m5xkzzEuYv9/95c+D66v9k0fIidaydQOp
         17uMTRG/cwmIvaA0JPeavedDgVvDnwRglIjWaMge5SS3P5c/KWbfYHj8JNgH6szk1AbY
         uFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMHvCe4ldZ/amHiOIpUyvXsvxdAP0LdmaFWt39H1eWp+wDW8R0+2YWR804X1IyqSajZf9i@lists.linux.dev
X-Gm-Message-State: AOJu0YxWqH5EGSXn7sZpPD2Z8q03wzVPuNLJczS5y6kqWVuUsT96Im/I
	zJVWsILC216PZKYydwoKroXOa2cnI+oNJ+RTwFN2mUI6Yex0Dtw3YElv
X-Gm-Gg: ASbGncuZuGnco4TZaB6t/57ALcmc3qGPSDR0al9wiAvD55pHfqNIZaYTr/sJ8CyO6p1
	wm+GfnPPN3ji+lhz+4u90ELdSpfX9xMOY8zmRZrMXUkWumDEPcoaNqBvc8ldg8Z0sWtBGwsjYnC
	lY98Rsrdq7pDrKbNFdeT8CNJTqF9v+jbZyAttqVRS6sTrIBv0D2zIX+sWpES5LVqCcxAT219Xb+
	QR95M1gpJf1jqdTUuUsGrHIwE5fG4RR8sRyXDEwIj+Vx+6CKsyLTQefkUW7n/nToTjcw9lrk4sd
	P1FBBpQsK5dLJnk67wHpUBvH8oMlxhRSIyXkx1CaDVx25mQupmOFRTRV1KCdKsi2paFPgYYtoAd
	g2pvzqqL4iHSbFvgcIN1ixuQAWofmuhXUEeISMwV0wJR4GTwmYYkt60HOTEoEmGT+Sfen7Ploo5
	tnjLf4jSxZ4krkB7+Cc6gsv5l6AtEGKWd/jhZ0oolZtgNazILbsdm4OkzHRJ08GH6gtDRYCWpaW
	A0+gNflqnJ1J94eg6gcOo1r+6vJb44iamxBihW+MLJyrQm6eIvX6lnH5C8pIto=
X-Google-Smtp-Source: AGHT+IH8lweP2XYB08E+inbzDnXw7d9uWVgrdDvTnlgrkRHMKVP2lag0JhfKwKbfvNE1zYcp4Zi2rA==
X-Received: by 2002:a05:622a:15cd:b0:4e8:894e:1345 with SMTP id d75a77b69052e-4e89d07d9b1mr104925911cf.0.1760809560785;
        Sat, 18 Oct 2025 10:46:00 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:19 -0400
Subject: [PATCH v18 08/16] rust: pci: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-8-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=918;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=03bsWp5q/RvNg/sXSrzNos1bBBR49+qyJdq4+m4Ha6w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH27Y5uAfTmrvKZIdGCHYL/oomYMJkFLfNEOLtlLtpxxDPHsRr1ISH3D/10dPkATw5kw42q12/O
 zIe1ETaFKVAY=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit ed78a01887e2 ("rust: pci: provide access to PCI
Class and Class-related items").

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/pci/id.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
index 7f2a7f57507f..5f5d59ff49fc 100644
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@ -4,8 +4,7 @@
 //!
 //! This module contains PCI class codes, Vendor IDs, and supporting types.
 
-use crate::{bindings, error::code::EINVAL, error::Error, prelude::*};
-use core::fmt;
+use crate::{bindings, error::code::EINVAL, error::Error, fmt, prelude::*};
 
 /// PCI device class codes.
 ///

-- 
2.51.1

