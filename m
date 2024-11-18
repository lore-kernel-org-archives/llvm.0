Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C4189919
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923162; cv=none; b=OLCLuMmtIcHub58LyBLbj1C8JNZ4BaiHSGu6bqTM0cVKQpWAzaFO6wJkTwW5T69b7BzWaLEGKymNmwjHmVapYoBs4PlR42Y3voRJV0sCPJaTacuxoXRdWq1v8xHDMJL84EQTd9Zi+MmnFyokufHS5yesYHZcl93Y7HJziEEPQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923162; c=relaxed/simple;
	bh=mUQUbdZM2wB07Dr6dMNlFKE5OpDs/vuM8ExzU1Ox/kI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fnqwggmXmsZQGXpExJ5ncL3WaJpRSSnkkyacUdOTIJfhno13OjYoeml0WjE4IyfjTr5ymTQp+k5OYwErnOc5y8AgAogLfpybFcwupA7yQREgh9Vp5YNV+cHgHia879v1U+X/wXkG9G4Ji88omcv4sanberuG4coiLxBhffxDrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWakfleJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWakfleJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4317391101aso13672895e9.2
        for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731923159; x=1732527959; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RSzXbcfeBbUeVFqww01Yww7G1C9jrZS952jPysDA1Dc=;
        b=wWakfleJm2YfeEc2WRZuI42JwnGjEdoqeVpOqMDhR/8tPhTL0AzeyIcVHqKbd0SJak
         Csde3Ylb7K94DrYlvJgKx29+2gmCGg5jfcvMO5J1LTjKo+vjgCm707BvmOwTCqaraVDU
         F+uEzsu9bERJ8RTulWtgwuwpFcJqW1tosS+TXYZ5kx35oRW8KJ80CZzG2R0+UR4o0LxV
         9pAedvCJmsIV6mAmrybeWDlRoO9byBSRGAdtPohSV/Dfur5cgD84NCvXFlQaCflWfjby
         T5YlNRYy7+vOc4yD8FsT0sL0oFWLQnysDVPMkZp2zW8Mxcz9851B5Siv3oFc4+ZwoN3w
         c2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923159; x=1732527959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSzXbcfeBbUeVFqww01Yww7G1C9jrZS952jPysDA1Dc=;
        b=knrwQmx/QxiUAUbr8kl7FVHsmAOYYJRoUHrfevb0OZjAgOMDJLB2LFTl2lMVt5Lxpo
         j0vXQ5OPnhmm1+1GgtAysLhP5iC8a5G2hnbPC67iTnznc0UrDu+sa6Qbe5M0f6K9n11+
         99U8yoI97NRtHShkzltkDezi8mESz3H8n2xNwbulmoly4wL11+1zqN/AjL8muzCzvHFG
         Lq+Go4FcTqeqgmJmSGfUfSWiGsbbmzBNuaNgsbDZ/A0rI3NgUeMugET6S0XcEj4/QKOg
         2vtfS74mQ5WcAiKXwUuOC/jCS5TPXAWNuJOsJyMNSRkWhxzb33fhlsprWVDlVNia2wJv
         fVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXEmbAU0wuIi/iSkf+i+Aqt2yrswv+37hS7k3dhQv1gzD8GfPl4wY9UTw4E+60Z4N0ubNtr@lists.linux.dev
X-Gm-Message-State: AOJu0YwImI5tmmpgbNsYndVFC/eVrA+up/Yn5/XROT1ObaTXEqMgxBXd
	UMwcDPSGxmrZ/T8ijcTaLK3QwJ5PYblb+MuOmJWajrh79Hm92kHJlJCtb/a1xgoSpx03B7+ZTJn
	alqWAjS3OytzEyQ==
X-Google-Smtp-Source: AGHT+IGXNocgNSIUHqqsyjnvJEyCJXmTljyWq9QmJHH3np9JIxVnk5W+lA6r62qYmN0JCERlE9ZVGtFwx/58rss=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:4215:b0:431:4162:6ae4 with SMTP
 id 5b1f17b1804b1-432df795362mr208495e9.7.1731923159062; Mon, 18 Nov 2024
 01:45:59 -0800 (PST)
Date: Mon, 18 Nov 2024 09:45:55 +0000
In-Reply-To: <202411181440.qEdcuyh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202411181440.qEdcuyh6-lkp@intel.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=aliceryhl@google.com;
 h=from:subject; bh=mUQUbdZM2wB07Dr6dMNlFKE5OpDs/vuM8ExzU1Ox/kI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnOwxwrFVPAYwYEld95H7+qqElBC3vV734EtpiP
 fx0k+rNdreJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZzsMcAAKCRAEWL7uWMY5
 Rm6wD/9agfhSO35uSz3ujzRglJWSW+eKrJ7uUYHCFpWA5ybgvsbCYYb6V9V1T7G8U6NPtbLw98n
 3i2iYhiBk0RuIHH/+oQvfK1DDIlTSn5RdJGuJ1KSWFXz/lgqFJP32bWQwkqtupkHQLS0xQEaiFS
 TxhGgAv1ZNVSLMijj4HBjTU5zJhVbyvaA569dFuh5ogazF+WosY4gOxKR6xpvYIgGood6wMOBUZ
 2t3I1I1BLA7Ol8UAkh4Mj/2/t8XUXAQeUyvktDIDi74QIEM+dH6VsB5Qo3gvh++mnCUuggJD+ey
 5uCj+n55DydJbueuUJlbYLvpuZU90aM5Y/jJ+ml7TnyIVuDhu0clhtFTqP4blvfNCfeD9GY503/
 bSidq71l6rN5fhLFnGLUl/kOy6rFd2hrw3kJOeNGDsGt9ZmJamccMhN5KoJZRiCfqtdWHCDn03w
 5x9K/BcbqoS6N/+n1EN/+4O7W4SAw/yL/duCDiDMliEU/7P3Zd5arQolUQCiAoLZInXXGWBej+r
 R80vew0eJJagQnOq1KUtwJxsmL/uw4uJcruJts6hqUq4KL2PIJXG+cujOB/k+EEPZyY6xm1nWYm
 ItIl8WGy2yTHU44Dq1/asmQo+MQhTlz68GN+bS1BxkbsnYm0Mz+r5XCj4MEhqui0GLiZ2t18PEI DVm4QA2wl5EHpaw==
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241118094555.2583708-1-aliceryhl@google.com>
Subject: [PATCH] jump_label: rust: pass a mut ptr to `static_key_count`
From: Alice Ryhl <aliceryhl@google.com>
To: lkp@intel.com
Cc: aliceryhl@google.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"

When building the rust_print sample with CONFIG_JUMP_LABEL=n, the Rust
static key support falls back to using static_key_count. This function
accepts a mutable pointer to the `struct static_key`, but the Rust
abstractions are incorrectly passing a const pointer.

This means that builds using CONFIG_JUMP_LABEL=n and SAMPLE_RUST_PRINT=y
fail with the following error message:

	error[E0308]: mismatched types
	  --> <root>/samples/rust/rust_print_main.rs:87:5
	   |
	87 | /     kernel::declare_trace! {
	88 | |         /// # Safety
	89 | |         ///
	90 | |         /// Always safe to call.
	91 | |         unsafe fn rust_sample_loaded(magic: c_int);
	92 | |     }
	   | |     ^
	   | |     |
	   | |_____types differ in mutability
	   |       arguments to this function are incorrect
	   |
	   = note: expected raw pointer `*mut kernel::bindings::static_key`
	              found raw pointer `*const kernel::bindings::static_key`
	note: function defined here
	  --> <root>/rust/bindings/bindings_helpers_generated.rs:33:12
	   |
	33 |     pub fn static_key_count(key: *mut static_key) -> c_int;
	   |            ^^^^^^^^^^^^^^^^

To fix this, insert a pointer cast so that the pointer is mutable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411181440.qEdcuyh6-lkp@intel.com/
Fixes: 169484ab6677 ("rust: add arch_static_branch")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/jump_label.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 2f2df03a3275..b5aff632ecc7 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -26,7 +26,7 @@ macro_rules! static_branch_unlikely {
 
         #[cfg(not(CONFIG_JUMP_LABEL))]
         {
-            $crate::bindings::static_key_count(_key) > 0
+            $crate::bindings::static_key_count(_key.cast_mut()) > 0
         }
 
         #[cfg(CONFIG_JUMP_LABEL)]

base-commit: 22193c586b43ee88d66954395885742a6e4a49a9
-- 
2.47.0.338.g60cca15819-goog

