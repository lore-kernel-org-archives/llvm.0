Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9371EE7B7
	for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828532; cv=none; b=O+PfFRM4SeTdpIA6afpLZLZKExx64mBP5vDlIZ3uzJSMpTbGAY/QXWFP64gM+ZHp89fwXANnycHslj1mApipOn2VHW/mC1ejhztT4u8UkgHAIVRSCk4chArmyWNF0GwSMdbM4PSecQcdn9b+6yA0Xuf6QW70kvcIVzbl0aiwuIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828532; c=relaxed/simple;
	bh=7P9OHFktnHehT6/0WfESnN3+d/wQTpA8ehdmH59U66Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kckly70Rpy9tSx2qyzqxLvgsjcVkEcQP6pfWaeyazdHSVoZ/QdN2lxC/tdCrK2GfgHx47CujLX76k+qukWKA0h3ZZFYJgpA6nHtsGgf9MGopxiQUjHXSOZKYID1eSxZZd+wza2zML7OC+f/Y0cTf9GKzePan4UXTO3ql4gCwDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egr7O4e/; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egr7O4e/"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d38ddc198eso674872885a.1
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 22:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828529; x=1751433329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7iMVxay3WmzLuCq2ZJestj5SyAiKNQShqHsp8//u9g=;
        b=egr7O4e/nXFrD5xCbaWn8LsQI/aLnG8aSY3RhHJ+voJSBbN/cEbGoip908mM5/Gcvi
         kwUD2zNqUA0QkaTHfQOd4uuUN9rQf4CbKVV0VSb6yeG1qNG18O+YmDH0T7KakcQdFAkz
         PQlJbKF9WBYYJ5m/nnkuj54rum4EYpbvVIXR7ebO+OUdscIgW6Y+tTPWvPfWcvdLGdXr
         SDpRnpwN38rXDmOKO+KimKU1zmFuEgGK0R0qDPrvDm0TlGUNvQRXtx+mND2iiPTHI9WQ
         gnQJJyRZRJwBuQmh/w5fiADWZ9Bl5CCXuROr8PWbhTBdh7++XVGTd3NREiT85qxWYkBQ
         ZB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828529; x=1751433329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7iMVxay3WmzLuCq2ZJestj5SyAiKNQShqHsp8//u9g=;
        b=o3Q6F+LhY1Qee+ikeaSPAjedriHcKu0Mf1n9l3uQEbJlVYNtRIMkQSG9LIYdRN8ePT
         pNcwVqk3MeyUESd+oRRz5FNWAzYKlXM+yLhVlgSYvAQxmCh5EtbSJs6/eIFFvHkLzy4h
         /oey+iDqgRtp7S+9CZBO2LSLHuLgpEaMvO/9Vqub3hrUt3AtKAGTgoHN/cecV/w/L3sQ
         N44LlorI0JGKGUSzZ28FOV5eNz0lHw8xFLnVp5wJkY7cz5KKGZDO/U2OLRzvmgzUEZKa
         GVpPe7PkD8A8qgWwrP4oI09VdgzKHUXKCm2H8uIKWFgitwuwhb+7XYpQAQC5G8Ugekh1
         OHnA==
X-Forwarded-Encrypted: i=1; AJvYcCXsr6p+vnN9b6YDp/ta7RXNZQMbyY2VqPFqYf8UZwguDYIlsERTFQOhrGiyjKPV4jA4Lra4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2GEG0ai0YVqPWZ9oH8z0VpP3AWSuI6EzR0cPvTZzGHldTuE1Q
	gbLu7M8FruZ8AlVyinvWahXZSHCwqE0WAuEJ8OFS5BRxl3A/BfpiOszg
X-Gm-Gg: ASbGncuo8kFY0jeo+bPQISfe9Kdkn0Y9479tOmkJVzGdphLwfs4HYnz2suJQLXLupYm
	sKNPolBe6aBvHZwO5i8plK04nXSzRazV0ntWoRpDPBoM8DAr5ppRRB/busZQ7skoxHTLL9yk/hm
	TymceQWdBWGxPpon/wQH6TqPbZJMU+K0IX4vs5n+tTUh5p0y7iz2WJQqlCfWUbJPNR98m7zHZQh
	8UUEN34bNUkCHrQC3tVGICQQhDGPUaFCA7I0Rqx0Ho/XfmntrBgEXFMDb2kv7pDESzRpaY+opTN
	R2zyMf8wJOnOBEn/Cu9qAYdnC85pXjKTa4JfBMi1jcVruDKGisXUECB4yOrCOdjGq7qSgQYlkJm
	kvrhNEL0J0IZlWmKu4btmzOSDRt5sZxZFvfo10xZIXDjGcw9bJzBl
X-Google-Smtp-Source: AGHT+IH5eh5NyDryLi2CVj0oAVK7jawM/QHsz+yh19M5+tyWzNSi5g3PazROuvwLLJau2orQReIvNg==
X-Received: by 2002:a05:620a:801b:b0:7d3:f0a3:d8cc with SMTP id af79cd13be357-7d4297487dbmr254922785a.45.1750828529411;
        Tue, 24 Jun 2025 22:15:29 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095bc554sm64286026d6.117.2025.06.24.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:29 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 40EBEF40066;
	Wed, 25 Jun 2025 01:15:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 25 Jun 2025 01:15:28 -0400
X-ME-Sender: <xms:8IVbaGB1pF7JAZg3-ts1rcOmEZdpchFO6_JoKyOnxkUoXKvNSbSv0A>
    <xme:8IVbaAhW8Mk4rcxqWbDe8GgVbd-4AVBFk42cMe7XxKqh1-poOGALHdUVHAYBV74rt
    0f9PdWxMhveiplKwA>
X-ME-Received: <xmr:8IVbaJkpYB_kSSwNmJfXLGYrr7T3-U7UiXHnPoJkEc_QSjDMeWh8_xJSLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepkeetteejgeduieekudejfedvvddtiefgieffffeljeefieehiefffedvfeffgfet
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    hinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehv
    ihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphhtthhopeguih
    gvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhopehrohhsthgv
    ughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:8IVbaEyYQA3gAY5F_geMShHAKvEXim9580O9fxeJCEfRJsx5IFmflw>
    <xmx:8IVbaLTkqDe1pvL3FjiSsra7VKuTCvOmzIzbCnS5oP3rOsdlvk5_Mg>
    <xmx:8IVbaPa0Od98KrdsCoDCcP2U-okoZvGWiETE_6YOTH2DZTA5RG5Erg>
    <xmx:8IVbaESijH0ygGbtCtxsD6MxoLdwuje5gL0oZ0OaA2zajn7KXk2Fnw>
    <xmx:8IVbaND7CmZxEij-rm0bgChx_52qmkpKQlZzw_XzcWZdAfod0mAj-e9k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:26 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: [PATCH v2 4/5] rust: Introduce file_from_location()
Date: Tue, 24 Jun 2025 22:15:17 -0700
Message-Id: <20250625051518.15255-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625051518.15255-1-boqun.feng@gmail.com>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of kernel debugging facilities take a nul-terminated string for
file names for a callsite (generated from __FILE__), however the Rust
courterpart, Location, would return a Rust string (not nul-terminated)
from method .file(). And such a string cannot be passed to C debugging
function directly.

There is ongoing work to support a Location::file_with_nul() [1], which
returns a nul-terminated string from a Location. Since it's still
working in progress, and it will take some time before the feature
finally gets stabilized and the kernel's minimal rustc version might
also take a while to bump to a version that at least has that feature,
introduce a file_from_location() function, which returns a warning
string if Location::file_with_nul() is not available.

This should work in most cases because as for now the known usage of
Location::file_with_nul() is only in debugging code (e.g. might_sleep())
and there might be other information reported by the debugging code that
could help locate the problematic function, so missing the file name is
fine at the moment.

Link: https://github.com/rust-lang/rust/issues/141727 [1]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250619151007.61767-2-boqun.feng@gmail.com
---
 init/Kconfig       |  3 +++
 rust/kernel/lib.rs | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index af4c2f085455..6f4ec5633ffa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -142,6 +142,9 @@ config RUSTC_HAS_SPAN_FILE
 config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 	def_bool RUSTC_VERSION >= 108800
 
+config RUSTC_HAS_FILE_WITH_NUL
+	def_bool RUSTC_VERSION >= 108900
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..717a5b6160ca 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,10 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
+//
+// `feature(file_with_nul)` is expected to become stable. Before Rust 1.89.0, it did not exist, so
+// enable it conditionally.
+#![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -274,3 +278,47 @@ macro_rules! asm {
         ::core::arch::asm!( $($asm)*, $($rest)* )
     };
 }
+
+/// Gets the C string file name of a [`Location`].
+///
+/// If `file_with_nul()` is not available, returns a string that warns about it.
+///
+/// [`Location`]: core::panic::Location
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::file_from_location;
+///
+/// #[track_caller]
+/// fn foo() {
+///     let caller = core::panic::Location::caller();
+///
+///     // Output:
+///     // - A path like "rust/kernel/example.rs" if file_with_nul() is available.
+///     // - "<Location::file_with_nul() not supported>" otherwise.
+///     let caller_file = file_from_location(caller);
+///
+///     // Prints out the message with caller's file name.
+///     pr_info!("foo() called in file {caller_file:?}\n");
+///
+///     # if cfg!(CONFIG_RUSTC_HAS_FILE_WITH_NUL) {
+///     #     assert_eq!(Ok(caller.file()), caller_file.to_str());
+///     # }
+/// }
+///
+/// # foo();
+/// ```
+#[inline]
+pub fn file_from_location<'a>(loc: &'a core::panic::Location<'a>) -> &'a core::ffi::CStr {
+    #[cfg(CONFIG_RUSTC_HAS_FILE_WITH_NUL)]
+    {
+        loc.file_with_nul()
+    }
+
+    #[cfg(not(CONFIG_RUSTC_HAS_FILE_WITH_NUL))]
+    {
+        let _ = loc;
+        c"<Location::file_with_nul() not supported>"
+    }
+}
-- 
2.39.5 (Apple Git-154)

