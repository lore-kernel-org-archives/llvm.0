Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE214D2BB
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731961654; cv=none; b=WrZq8usIYAEnFm0ijSg+PUbQmy4esW15RlhqXX8D6qmAOA/BbanA6pAX6XnSxMIuOsdgfyGgEk9+5rQZCfE2uNEvLW1mKWUqJB6n+53VZJorvkiUZlubWwtecrIP4zcP9kJM5ESK9Qyreop/294GqoPMVdcZwR4kGwyKnSlPHPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731961654; c=relaxed/simple;
	bh=mUQUbdZM2wB07Dr6dMNlFKE5OpDs/vuM8ExzU1Ox/kI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lVIPZ7U6DtfVfN3idbJ2WdGUR+sm1bpBunpb5cfG0GxUvVzNOEfc0Km9jKKfL2Y69RQptb9AhLJwHPqhw477TpowkFXjqU4YylSTmUhrNpyUOTDZ/jJqpyEajRjcOpiWbqD/bPrqhi+gJy2xybMvja7LWjknxKS6+1fMh8AnuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rcQZCnqX; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rcQZCnqX"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee65ae21b9so36837147b3.3
        for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731961652; x=1732566452; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RSzXbcfeBbUeVFqww01Yww7G1C9jrZS952jPysDA1Dc=;
        b=rcQZCnqX1xJH5p767ntYCnH5hBglY15nHNRlKSJhZWX1BD5MpAO+paDtHb5+Lsk27T
         v5npdLiHxU2e58qvHtNTmLlHoCmRr5IsUqbHArHNbyvnfsoybSIX6Tgczln9NAoTRDZQ
         75/Fm6OepULQ1EDsVYvl4Kl/72mIxWcUfxWc5mX6xx/gr2HOFN13hEkvlqPQMpoeOL/A
         Qu5iaUSEKubrE7VIS/jn9+BQcTttu8L5XsWxlYqsXhV7cy750JkScuBAOMrh32IKIpq1
         2sUSWJ484L1DdJlggVtOhPlujYiKPE0CuTfxOsVZKxWpN7sJt/CnweaSDurHmPRez3vG
         ekbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731961652; x=1732566452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSzXbcfeBbUeVFqww01Yww7G1C9jrZS952jPysDA1Dc=;
        b=pX44pkl/6Rqk0M2j5ykhWyqH9IgC0NLZ+quf1t8gTLbJGFTKsx9T0FASpbejSCZ8uC
         6V+NiaOOLbqscEPXZSGsGNY1BhQ51xW/iaMXALCFH7bOp24H3ADMIsQAUi+/NOwylD8E
         FKeJ88P8TuBW3QGsYfCHwBejW9JIkcfb8p/OA8a+YtOs5Y2bS2hXRjJIbX6ZHPK+hV9T
         3TaUpRYq+3/mGwJPlKMz5ECXPSyYOJ9N1PHQHEXFDVNrrbeawgX07y9PyfcNc8uLGOtt
         2OSOPjg4n9v9gkrc94q9BdHu12kyGDbRLcZiizeyrXLpXUePkGxImosisRW/gHVMvRQh
         gxDA==
X-Forwarded-Encrypted: i=1; AJvYcCXskRcN/RSpnwPzgvLEBNF9KoOvUB2GpIVRwBFizwQw8nU6uf350mRuucB48YG+kgeLHplR@lists.linux.dev
X-Gm-Message-State: AOJu0YzujeExueDScIR02C04ouqPvyMWEABium3/OohurH/4o3OuvuB0
	rqVFeqnhLsyq+Y1k/3pbjWf1awY5lh9ZU4G2+sfRpBlUG6cq4afgWoVRRQI2q9p3JxyDv0ucjBQ
	azv5OPw5EHZ/wdA==
X-Google-Smtp-Source: AGHT+IE6GHgT+hW4JUk5Xmrgx6KYP92+Suqui+d2CTeWLEFST887tqS+GAcBTlvDTt0v4RG9AbgYe1GwYfM9ftg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4e0a:b0:6ee:613b:10c3 with SMTP
 id 00721157ae682-6ee613b1307mr509897b3.8.1731961651857; Mon, 18 Nov 2024
 12:27:31 -0800 (PST)
Date: Mon, 18 Nov 2024 20:27:26 +0000
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
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnO6LxrFVPAYwYEld95H7+qqElBC3vV734EtpiP
 fx0k+rNdreJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZzui8QAKCRAEWL7uWMY5
 RtMiD/0eqyxfN1l7zjWtJ16eTVp6cevdvqzVnil6da8f7cxXhbPrLaU6SE2H5lAZlqhrBdpTWIn
 hgBOIrPLdkeiq71OoRZ3Tsvm8ILFJO0XUQBqXUqDsMrMUJPogisPD25xuCzhe64cNVGFntcVZHG
 HHCe7o5eXP0ce6/2R6vO8QgxnMWUZHIoX40xBJZRdQJbwIXO3c/Yh5Gj+pXJycPogdzbKNYTQ1r
 4vd0HmXeMKfJz93WgQxK+91bloc6kZTKUWFtX+fCq3792CDIquwp21DAv0769ueAk2O8EcorvDZ
 jawc6ZX1XVI//cLepwYeQe6cBRj9IcqRoIuhaFFjo1ZIVKXvE3ueYnYJxiDnZkgzcs+XspL63bV
 pPAYxtXnsZSEYOMqyuUlOgZv4jitZ/fHnLM4tn/CkuYMqgjN190T1Vyx8UatLfGmrDGSzpm1V8+
 JDSxall5DpylmY8+B7Iwr8kLebfb7MIFmYC/rK432R0u8DkDXPSVqmMcpCeZWaRFba38yU4zc4E
 VK1bfbkjepWFYHf/Iht3CqKOfoAmleUTL3pJWyoRhe/D2PkBtZevxVzTS/T5RyD4A2umDI//nh1
 d1tpvp0jJnxCxNQbMj4GozbUxx+/clxo9IQH9tfSXAqftEgSQEQJKpA6vJWJasVtOKvVuWq6hpv bSce6v+aQ7DMoqw==
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241118202727.73646-1-aliceryhl@google.com>
Subject: [PATCH RESEND] jump_label: rust: pass a mut ptr to `static_key_count`
From: Alice Ryhl <aliceryhl@google.com>
To: lkp@intel.com
Cc: aliceryhl@google.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, rostedt@goodmis.org, 
	linux-trace-kernel@vger.kernel.org
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

