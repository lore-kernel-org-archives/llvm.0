Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066F1D554
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljynjWJs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c60a514f3aso18513745ad.3
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696607865; x=1697212665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMaXSdjxbXsiAirTGof/GcimC3N7kI+/btaqyHpj49Y=;
        b=ljynjWJsgS6imbuvwd8ZQmmgP5GLxa8NZr1FUVmyrcAvUd7FQnGSi+UNiOLcHXD5Cd
         ofX3kQoiJa9N1Nvku+78aX99zlCh0/W8H7kdH0vd51G6WK5/x9c4vrxF/G+HY1DJIOVf
         IXvovoIVmU6DJ/Ig6v+vPtOjLn4p61zhb49kk0gHw4sjpGSqPT0MrhwBAXdtGPedYohI
         oY8BkNaqXB787qqNIOtIv5AwoaRVZoIot9bHGbja/eEq5Uk7D6aKZcLXUzjrmHFhS2PQ
         Kj5EhXLwDHO+vUml0O3bKFkQtuZ7Iu7X4QN5LwwXtoeOkG1Cg/csw8aGx5eLjlB4iPd9
         JCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696607865; x=1697212665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMaXSdjxbXsiAirTGof/GcimC3N7kI+/btaqyHpj49Y=;
        b=Yg/CrCrkn5yHNVLrR1bwQnBCsjUGM1pLgYIv7dybS0v+Evm5PsFoWz0toOCygCfiuE
         gzCDm9dmAi0SjcfMoAD1fjydzpOQMNJotsjhyKIzWfjB89+LONP1oKW8vxpdip0o7fPK
         thwKhgkdpO/Qfrx6tAxtyi/1Zuns9HqBPJH27CJp9qF+vGTNxOM2McETqsMAHSo0EZqS
         zN6wogqXkYY6PsEaJxPAdVmUSfEYzoRcbQhSYnmZGpVYQH1dEOHlnIMe75SEkGsyN69u
         boRomfUURlv5RzQoyThRrUvCLMeS6fgBqNcju4mM4kDr74e95WxZ6IjB2Cgl/AyHi6IP
         1LdA==
X-Gm-Message-State: AOJu0Yw390sN3EjqCLKzmD9PlKiYQiutqtp0YagSqDHyp/csnFsueoiU
	KMmIl+hV42hmoAdrjOTbVUE=
X-Google-Smtp-Source: AGHT+IEhBhuGTi2CtNQboZ4D7jHQZWBTQVsg1o+NrcmVE4/6qmh4tDyC3SB+mQ4mPpSIDN7aN2NiWw==
X-Received: by 2002:a17:903:124b:b0:1c8:791c:d78b with SMTP id u11-20020a170903124b00b001c8791cd78bmr8760716plh.29.1696607865385;
        Fri, 06 Oct 2023 08:57:45 -0700 (PDT)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001aaf2e8b1eesm4040797pld.248.2023.10.06.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 08:57:45 -0700 (PDT)
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 0/1] rust: crates in other kernel directories
Date: Fri,  6 Oct 2023 12:57:36 -0300
Message-ID: <20231006155739.246381-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC provides makes possible to have bindings for kernel subsystems
that are compiled as modules.

Previously, if you wanted to have Rust bindings for a subsystem, like
AMBA for example, you had to put it under `rust/kernel/` so it came
part of the `kernel` crate, but this came with many downsides. Namely
if you compiled said subsystem as a module you've a dependency on it
from `kernel`, which is linked directly on `vmlinux`.

So instead of overpopulating `kernel` with a gazillion modules that
throws you into dire straits you should rather have the bindings in the
same directory as the subsystem you want to bind with and link it to
it.

For now I don't have a completely working example but I have an MWE as
following...

    # Add this line to drivers/usb/core/Kconfig
    config USB_RUST
    	bool "Rust USB bindings"
    	depends on USB && RUST
    	default n
    	help
    	  Enables Rust bindings for USB.

    # Add this line to drivers/usb/core/Makefile
    usbcore-$(CONFIG_USB_RUST)		+= usb.rlib

    # Create this file drivers/usb/core/usb.rs
    // SPDX-License-Identifier: GPL-2.0
    
    //! USB devices and drivers.
    //!
    //! C header: [`include/linux/usb.h`](../../../../include/linux/usb.h)
    
    use kernel::bindings;
    
    /// Check if USB is disabled.
    pub fn disabled() -> bool {
        // SAFETY: FFI call.
        unsafe { bindings::usb_disabled() != 0 }
    }

    # Compile the .rlib with
    make drivers/usb/core/usb.rlib LLVM=1

If everything went well then you should have
`drivers/usb/core/usb.rlib` ready to be linked.

As of now this PR won't compile the kernel fully as it serves as an
starting point and it's going to change in the future.

Martin Rodriguez Reboredo (1):
  scripts: Build per module Rust crates

 Makefile               |  4 ++--
 scripts/Makefile.build | 10 +++++++++-
 scripts/Makefile.lib   | 19 +++++++++++++------
 3 files changed, 24 insertions(+), 9 deletions(-)

-- 
2.42.0

