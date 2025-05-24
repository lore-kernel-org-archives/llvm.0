Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE7D18DB0E
	for <llvm@lists.linux.dev>; Sat, 24 May 2025 20:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748118805; cv=none; b=n5Q4NpUK62KTEn+Y2kgpDTkqUXolCsoP+BjKiiqGAL3GcFfh62/Uj3bVT7APP6EAszsEObbp+sdLQu9fDEqug95ykO0UpQ9OjZ1SqpUZ2paYrHPyi+x3XO3XrtAz0Ty2HsZ1iIW/POHAhrD11yt2wyE4N6iV7b0WPXm8Vc7teY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748118805; c=relaxed/simple;
	bh=hrug913Vp1NiKCmHn+m4wiqCG8z8FSEDUX4Thc02O9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlbc1s+jnQyUxOGYaOwpf4MeK8G9du3s4fA2oYbcQoc26fqPtG0Mwr/duRYBu3IveWI6/LjDJeqMby6YKNHUQ8emJzQVczVDqvuYOMTgAJpK32MUKOMsrD8K1C2/md0VTQ905rbKApWSXH99kUFbqE2YcPsBF4OFkkhcAGqtA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcKLYPs2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcKLYPs2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7cadd46eb07so92176685a.3
        for <llvm@lists.linux.dev>; Sat, 24 May 2025 13:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748118802; x=1748723602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvfJkqxXdrTl2ACAyEytt+D5VYLPEzTHxEFeE81vrvE=;
        b=fcKLYPs2kdWdIGPvxRzi+5jSw8Vmtn8YhzX0P5S/N85hi3GeKTL8NCCvCLG3+EN+IY
         GCyiqqnLZG2WeK3ukSR8JiiNJOcW2koX8eOh+HKC6K1imPLqE0QHRfbt/JeQo/QvJY+u
         AezZcQ0ATNlFqTvZ/nWU2PWKYPx7CpMPIOuFUHq+DsIrutJcxnk/FKjW0+AQCD0iJOC2
         dBA7WrKiZ2VHCc9/RACh4qJpKHwGWkcFXmDXpzM4voIXZGmpIKtViFwKC+i41qmTCJJc
         Yks8o4DRHpZsXb+ytv6JIojDtRzG5JHDXAJmr7toyBP1fhXepzWOIBG2MO5RVgumacEu
         xj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748118802; x=1748723602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvfJkqxXdrTl2ACAyEytt+D5VYLPEzTHxEFeE81vrvE=;
        b=ODRsxu72VscDTcEB6e8o3Y11uamJmjypyvxKrD0a24pTKd7tMJmooDKBxTPaUsbOu5
         DZmuJkLtUkjgEdef66D9O5u+mz0vntO25dBv1MZJDbleVf4LVkX+UtIYa/Hh5fpW910k
         LfjWpcc1dreTWY85IOuDK46kFujY2WNpHPaeaDeEt8/3wR7ZiABmWvgGwb7nFd2f5g2o
         hi5B+1lEPH/Oq7OYQbCjmhGs1SwF28ecPAcChr5DLNqKNBcDe1D7TaW0Ut4leqIQ/fz6
         a0kYVAPUEzG1cPVGOHfqcv/0ofZ1rv+wGo8u6+MgEbdu0i/1Co7PF+cQiiscXlrzU7Us
         j7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaBkFTBR+V3Kx9bHyn0/1yOaWBDC5tazL6rq7wdvqbWGQfkhj5cVjoPFflgnTWu9EIjhd5@lists.linux.dev
X-Gm-Message-State: AOJu0YwGUxj0Rr6H8rTVu00d+tW5V2abXPXNFDqEWvd1FWf7BFoUxE3k
	bvFlYJDScDiiAEjOn+KWQZvC2U15qq3k+kpORNDL8FDGxU6wxOPS1bfE
X-Gm-Gg: ASbGncuo8ygpwSZUx+6UtTs7KJUD6pMP3C3KBG25dg8Bbe7JmxsT1IWvc8ic0cKx2k+
	LQZtoVNiWEj7AWZxsrvo6qnqbIcGZy2m3/4SCF6EC5c97fMuJUUtAQljAK1BE1fWTGtfrpKw3N5
	ndahrx8L0wrI/PCaOv5nslsJAVWbtybAPdvYXNxAN1eQ3TErGT+I+1ELRgrLea+Y7y6S0M8vZi8
	HrIr7yesaMnyb406Z7SJvjS9rEMF9tPrPMVyJet+oDApsst3Flj+FQdVxWMI4TwSjx2gNBLCMrt
	7Z6yRdMuITYnS7JTpLzlimNyGcvW4kSWJMais0HjB51qMkF+FBbPaYwP2akDWKG0XL2imowzAYC
	JdDqod64D7WRYG0bWmNowftdX8xCFVI11TMXWmMtt6kmShJ8Uyl1SS5GzXZrF1YCvsHSHqCVtGA
	kfwaI=
X-Google-Smtp-Source: AGHT+IFboxRLluplUf3LaplIw8SJcbgWkLbYbE/qq4hS3to1whGiWg64X2sqtasOImnMch7vEUC1oA==
X-Received: by 2002:a05:620a:608e:b0:7ca:eb5b:6b99 with SMTP id af79cd13be357-7ceecba77cdmr512632385a.15.1748118802225;
        Sat, 24 May 2025 13:33:22 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:8563:e370:791f:7436])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d7fd1sm1379590085a.29.2025.05.24.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 13:33:21 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 24 May 2025 16:33:01 -0400
Subject: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
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
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This title is consistent with all other macros' documentation,
regardless of the number of examples contained in their "Examples"
sections.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 9acaa68c974e..d31e50c446b0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -263,7 +263,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// literals (lifetimes and documentation strings are not supported). There is a difference in
 /// supported modifiers as well.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```
 /// # const binder_driver_return_protocol_BR_OK: u32 = 0;

-- 
2.49.0

