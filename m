Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454282475F2
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225427; cv=none; b=VpkOFigdGfh73uYX9OIQyRMmLsNzrImCDMFmXu6+aOMIOGpTWEogIi5n5fw0J28ieetN1MJSnv2S+BqyPJUDXYijhoeKSSVaB+KKlgKoY1QS4jGNxZOeAW27Wt96QaVo5wDUB4gR7rvTGqONk8uSa7OvxI14+pxzGhaJOmhOs8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225427; c=relaxed/simple;
	bh=d7Rz7cuLovyGVvrtYrCOPM9t8j0m/GRderePkZNlcPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTm7GYSSOe2ms5tGz+6jqhPd5A6sLvuAW/09ZLkqvM0Im62ZKRb1wibSo5PpXHQQKQzYVVO9Ec+5lk41rcn1AWgJuRb0FGgSHqGwIYZjRLDONtqTk92T4Tb9mWpGCj0BJeQs0AhU47ZgaNzNKrC9iS1stC7r83xv102kgb1ijHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKNNPTX1; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKNNPTX1"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fce04655so40028186d6.3
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742225424; x=1742830224; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9zxS6CUa0/BHcuQ/0Pp0DCveQxLHdMMTHZcqu2K/XY=;
        b=UKNNPTX1AmjfJyuaUy6hi1FWC5IhIhW8MOFrgacmpLFd+aSTiBZuS3hmiei5B7vDy+
         W4FVbIyLUd6ZiBC9nAn4D2VGshg4Mj743knRYKASCH6q//GJ73IiUkBF3YXzVN0yD7C/
         12gY37bUfsiNNFq5gHKm0pkMaAKk9CcCPIYlzuW6RdhC4SpdTFsZHVHp7unhR4QH5QrI
         N0IBO42gaeknedsC2/b7Hht/B82KEQ0PZSH57h3n0wIEsQKUOhioWwHzZGUjsW3cd9MN
         Xwk1wUCmdb2vefWSxxaQNcIR97JUrSBY8PC4a+18AIxJisR1r5RHKYPs6dfJcIOS7s98
         sZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225424; x=1742830224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9zxS6CUa0/BHcuQ/0Pp0DCveQxLHdMMTHZcqu2K/XY=;
        b=koWghLA3pZJq1gsQjJBaO8l7CjC9Uz/Zm55AO0dfNHUmtOq4BQRGYw8Qa4kVLvTKa1
         KdljIZOy346MN95/sK1mopDPpezIhGzGqboGOvUedJF4u2KgIEi6uIsd4sXd9ATwJruq
         RPHr1padzIykbO95W16pObz/ePBFQbz/PeI28YxTic6mzEZY2owZBo6p3mEq3pe3P/tf
         c3wb2uP5rPHXuCSGYsYR6UZWU0I2HHojFksxcr1x/KDW/bGvZK29MdzJhuULN8tXL1Hp
         HWrfq2ny4LDNx6+4nF2OJQ64z40igfM3pGCccUbXGKvhyQTOJwzCQoo+wtDB+D5gq0lq
         pd+g==
X-Forwarded-Encrypted: i=1; AJvYcCU0KlR28Jc/PmGRdetSzyduyxLh6zSZZavmOrdFE3i4v3xr/BHqXp3y91+Tlhj0KV6ke2RC@lists.linux.dev
X-Gm-Message-State: AOJu0YwwkK27gGuwsFngFXZ06SgNIQFxe9cCDTJwRX9ybiS1rMdGBySH
	UUu8A/+BHrE/5fWPmVV7HQ2MHEWFT6MOBtUxdbOQ30m/vzJkaXv+
X-Gm-Gg: ASbGncuJ/JtnyVSKr+Fb0HTHN/f3DagfXbz6QVomrzNNKyPdV94d3iyMZaPN73Vmfoi
	xKt9tdfvBKSvjIIfygl+4UUb/jPjDRvaEv//LTnatUo4ccIpxqkp+3V/KgKLaVKyC11c+BaZ6W3
	2aYhoHqhGZOpJcSX3DZgC1KF8p50u3q1D08NIlOimmaSNDhzU6++Jx9pSFauGwrBDOpD9UexayO
	261rzKs6mNUYjRTHVtSUiYWs3pKP2z7RcAkwfXMHHVPfVyQHdc6HGhZQPkKXR/atFwtV1U7C4Yc
	+6fI/s3iuIuSDYPxNgKlco0OXVFU4fpcTV8GgeRC7lrkF5uM+ibbcZ5oZua8Q0xCEkiv0zYRat4
	ix7zI4Q==
X-Google-Smtp-Source: AGHT+IGKApfu++GDospg5BAghnZqA2Q3bluHqs4fOtKhT5CccsHZP+rcXPKZRpvMgiPxDwJYLIjXqw==
X-Received: by 2002:ad4:5cc2:0:b0:6e8:fd03:abdc with SMTP id 6a1803df08f44-6eaeaa5dbe3mr249961486d6.18.1742225424080;
        Mon, 17 Mar 2025 08:30:24 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2600:4041:5be7:7c00:6895:24c6:e898:e320])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade34c51fsm55736766d6.109.2025.03.17.08.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:30:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 17 Mar 2025 11:30:06 -0400
Subject: [PATCH v9 4/4] rust: remove core::ffi::CStr reexport
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-cstr-core-v9-4-51d6cc522f62@gmail.com>
References: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
In-Reply-To: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
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
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Clean up references to `kernel::str::CStr`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs  |  4 ++--
 drivers/net/phy/ax88796b_rust.rs |  1 +
 drivers/net/phy/qt2025.rs        |  1 +
 rust/kernel/device.rs            |  3 +--
 rust/kernel/driver.rs            |  4 ++--
 rust/kernel/error.rs             |  6 ++----
 rust/kernel/faux.rs              |  5 ++++-
 rust/kernel/firmware.rs          | 10 ++--------
 rust/kernel/kunit.rs             |  6 +++---
 rust/kernel/lib.rs               |  2 +-
 rust/kernel/miscdevice.rs        |  3 +--
 rust/kernel/net/phy.rs           |  4 +++-
 rust/kernel/of.rs                |  3 ++-
 rust/kernel/pci.rs               |  3 +--
 rust/kernel/platform.rs          |  3 +--
 rust/kernel/prelude.rs           |  5 +----
 rust/kernel/str.rs               | 19 +++++++++----------
 rust/kernel/sync/condvar.rs      |  3 ++-
 rust/kernel/sync/lock.rs         |  4 ++--
 rust/kernel/sync/lock/global.rs  |  5 +++--
 rust/kernel/sync/poll.rs         |  1 +
 rust/kernel/workqueue.rs         |  1 +
 rust/macros/module.rs            |  2 +-
 23 files changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index fa55547a1535..61f878347be7 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -26,8 +26,8 @@
 //! * <https://github.com/erwanvivien/fast_qr>
 //! * <https://github.com/bjguillot/qr>
 
-use core::cmp;
-use kernel::{prelude::*, str::CStr};
+use core::{cmp, ffi::CStr};
+use kernel::prelude::*;
 
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
 struct Version(usize);
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..68b8e30ae296 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -4,6 +4,7 @@
 //! Rust Asix PHYs driver
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
+use core::ffi::CStr;
 use kernel::{
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 78f52efd13e3..07d026c1f9b5 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,6 +9,7 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
+use core::ffi::CStr;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index df4bfa5f51ea..a1123206819b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,10 +6,9 @@
 
 use crate::{
     bindings,
-    str::CStr,
     types::{ARef, Opaque},
 };
-use core::{fmt, ptr};
+use core::{ffi::CStr, fmt, ptr};
 
 #[cfg(CONFIG_PRINTK)]
 use crate::str::CStrExt as _;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index ec9166cedfa7..9926664d9ba2 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -6,8 +6,8 @@
 //! register using the [`Registration`] class.
 
 use crate::error::{Error, Result};
-use crate::{device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
-use core::pin::Pin;
+use crate::{device, of, try_pin_init, types::Opaque, ThisModule};
+use core::{ffi::CStr, pin::Pin};
 use pin_init::{pin_data, pinned_drop, PinInit};
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 58157ec9403c..a2a6f74904d3 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,11 +4,9 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{
-    alloc::{layout::LayoutError, AllocError},
-    str::CStr,
-};
+use crate::alloc::{layout::LayoutError, AllocError};
 
+use core::ffi::CStr;
 use core::fmt;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 5acc0c02d451..d932186f75b1 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,10 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::{
+    ffi::CStr,
+    ptr::{addr_of_mut, null, null_mut, NonNull},
+};
 
 /// The registration of a faux device.
 ///
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 70449571aea6..f400ef81f495 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -4,14 +4,8 @@
 //!
 //! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
 
-use crate::{
-    bindings,
-    device::Device,
-    error::Error,
-    error::Result,
-    str::{CStr, CStrExt as _},
-};
-use core::ptr::NonNull;
+use crate::{bindings, device::Device, error::Error, error::Result, str::CStrExt as _};
+use core::{ffi::CStr, ptr::NonNull};
 
 /// # Invariants
 ///
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 527794dcc439..f4e0e58877a0 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -56,10 +56,10 @@ macro_rules! kunit_assert {
                 break 'out;
             }
 
-            static NAME: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($name);
-            static FILE: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($file);
+            static NAME: &'static core::ffi::CStr = $crate::c_str_avoid_literals!($name);
+            static FILE: &'static core::ffi::CStr = $crate::c_str_avoid_literals!($file);
             static LINE: i32 = core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr =
+            static CONDITION: &'static core::ffi::CStr =
                 $crate::c_str_avoid_literals!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c92497c7c655..2360cba7354b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -133,7 +133,7 @@ fn init(module: &'static ThisModule) -> impl pin_init::PinInit<Self, error::Erro
 /// Metadata attached to a [`Module`] or [`InPlaceModule`].
 pub trait ModuleMetadata {
     /// The name of the module as specified in the `module!` macro.
-    const NAME: &'static crate::str::CStr;
+    const NAME: &'static core::ffi::CStr;
 }
 
 /// Equivalent to `THIS_MODULE` in the C API.
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 78c150270080..6e6f70cb4981 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -16,10 +16,9 @@
     fs::File,
     prelude::*,
     seq_file::SeqFile,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
-use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
+use core::{ffi::CStr, marker::PhantomData, mem::MaybeUninit, pin::Pin};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 8129419a3931..72635af8f20e 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::{ffi::CStr, marker::PhantomData, ptr::addr_of_mut};
 
 pub mod reg;
 
@@ -780,6 +780,7 @@ const fn as_int(&self) -> u32 {
 ///
 /// ```
 /// # mod module_phy_driver_sample {
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
@@ -807,6 +808,7 @@ const fn as_int(&self) -> u32 {
 /// This expands to the following code:
 ///
 /// ```ignore
+/// use core::ffi::CStr;
 /// use kernel::net::phy::{self, DeviceId};
 /// use kernel::prelude::*;
 ///
diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 12ea65df46de..087ac8e05551 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -2,7 +2,8 @@
 
 //! Device Tree / Open Firmware abstractions.
 
-use crate::{bindings, device_id::RawDeviceId, prelude::*};
+use crate::{bindings, device_id::RawDeviceId};
+use core::ffi::CStr;
 
 /// IdTable type for OF drivers.
 pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f7b2743828ae..1b4df605bd2b 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -13,11 +13,10 @@
     error::{to_result, Result},
     io::Io,
     io::IoRaw,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
-use core::{ops::Deref, ptr::addr_of_mut};
+use core::{ffi::CStr, ops::Deref, ptr::addr_of_mut};
 use kernel::prelude::*;
 
 /// An adapter for the registration of PCI drivers.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 474f8cb4587b..ca439581129a 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -9,12 +9,11 @@
     error::{to_result, Result},
     of,
     prelude::*,
-    str::CStr,
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
 
-use core::ptr::addr_of_mut;
+use core::{ffi::CStr, ptr::addr_of_mut};
 
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 97a66d29f48b..5b530a25d0ff 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -36,10 +36,7 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{
-    str::{CStr, CStrExt as _},
-    ThisModule,
-};
+pub use super::{str::CStrExt as _, ThisModule};
 
 pub use super::init::InPlaceInit;
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index f1b35fa5823a..fa44856b4ade 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,6 +3,7 @@
 //! String representations.
 
 use crate::alloc::{flags::*, AllocError, KVec};
+use core::ffi::CStr;
 use core::fmt::{self, Write};
 use core::ops::{Deref, DerefMut};
 
@@ -129,8 +130,6 @@ macro_rules! b_str {
     }};
 }
 
-pub use core::ffi::CStr;
-
 /// Returns a C pointer to the string.
 // It is a free function rather than a method on an extension trait because:
 //
@@ -371,8 +370,8 @@ fn as_ref(&self) -> &BStr {
 /// # Examples
 ///
 /// ```
+/// # use core::ffi::CStr;
 /// # use kernel::c_str_avoid_literals;
-/// # use kernel::str::CStr;
 /// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
@@ -382,13 +381,13 @@ macro_rules! c_str_avoid_literals {
     // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &'static str = concat!($str, "\0");
-        const C: &'static $crate::str::CStr =
-            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
-                Ok(v) => v,
-                Err(core::ffi::FromBytesWithNulError { .. }) => {
-                    panic!("string contains interior NUL")
-                }
-            };
+        const C: &'static core::ffi::CStr = match core::ffi::CStr::from_bytes_with_nul(S.as_bytes())
+        {
+            Ok(v) => v,
+            Err(core::ffi::FromBytesWithNulError { .. }) => {
+                panic!("string contains interior NUL")
+            }
+        };
         C
     }};
 }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index b3e7889db44b..8da123f9fb12 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -8,11 +8,12 @@
 use super::{lock::Backend, lock::Guard, LockClassKey};
 use crate::{
     ffi::{c_int, c_long},
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
     time::Jiffies,
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::marker::PhantomPinned;
 use core::ptr;
 use pin_init::{pin_data, pin_init, PinInit};
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 0b36d4a3d3cc..bf2b3465f390 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,10 +7,10 @@
 
 use super::LockClassKey;
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
-use core::{cell::UnsafeCell, marker::PhantomPinned};
+use core::{cell::UnsafeCell, ffi::CStr, marker::PhantomPinned};
 use pin_init::{pin_data, pin_init, PinInit};
 
 pub mod mutex;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index 4a040c29faee..7d6d1abf9279 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -5,13 +5,14 @@
 //! Support for defining statics containing locks.
 
 use crate::{
-    str::{CStr, CStrExt as _},
+    str::CStrExt as _,
     sync::lock::{Backend, Guard, Lock},
     sync::{LockClassKey, LockedBy},
     types::Opaque,
 };
 use core::{
     cell::UnsafeCell,
+    ffi::CStr,
     marker::{PhantomData, PhantomPinned},
 };
 
@@ -266,7 +267,7 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr =
+            const NAME: &'static core::ffi::CStr =
                 $crate::c_str_avoid_literals!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index e105477a3cb1..d23fd6998ecf 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -11,6 +11,7 @@
     sync::{CondVar, LockClassKey},
     types::Opaque,
 };
+use core::ffi::CStr;
 use core::ops::Deref;
 
 /// Creates a [`PollCondVar`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 0cd100d2aefb..25723207c2be 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -135,6 +135,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::{prelude::*, sync::Arc, sync::LockClassKey, types::Opaque};
+use core::ffi::CStr;
 use core::marker::PhantomData;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5467a0d539f7..d764fc35dfe5 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -237,7 +237,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             }};
 
             impl kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static kernel::str::CStr = c\"{name}\";
+                const NAME: &'static core::ffi::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.

-- 
2.48.1

