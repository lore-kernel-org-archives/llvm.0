Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63330FC1A
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556722; cv=none; b=QqxEK0rEuS59EqYl6Y2Ots71F+Dqhu9vYUHBx6286+AymcOu16G+OpqMnX1MH8ekxeO3k5ZsZadYU8gvUobuc3TDmZehFhWOmbucW9QDa9UmbRx1Xisl4NyijUfylteZxi/xEvVqqpGR8wNlUvZ6kvj3h5SMhT+wUW/wZvb9kA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556722; c=relaxed/simple;
	bh=vFQ57qEPFFK4a1P47Xt/5YF6jxl+QY81g9//5V0r9E0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jpIUO6pkLLxD5FdeWU5TSHwYtdrFCg3KmMOauh4SdG5pezoJMUgtg1q8lm9li8t5WdztAHPy6xWoBz7KBroVgtx8FVfP6ss3YMD3resIqPfjSvqyDOeX4w9mABhbYSlEkziDL6qE6c/s6iW8wBmwBkJQPTTVxaWvmGiCjJvc9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAGBUcMT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAGBUcMT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47106a388cfso4762945e9.0
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760556719; x=1761161519; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gjm1LijoOvaR4UmxrMCJ1ivWAHmFdej62IpC3mzcB4=;
        b=hAGBUcMTsr8e/7xaZCyWMsXyf0RhV/zgF9M8P0Ae/DrIYDXobA9qF+5/HwaLviNydw
         IVfBQ497fSF8T/yZx6BRySKYEeLFGGw+8GoGCZ0yGBE9NMdpuXnEPS3vkmnDyubFuOM8
         U8GH/kWshuNrvDVtDLN12+UBkCFm1+8BkNyx/FQjKRc1XsNGsKqzRsnIBTxEv2ohMwy0
         jz7hS1PWAlrOGeQOTtTrX6WX9X8LUWshrcW+g7yKwdiaj8A4Bg7/caEBCNzPRLbAiG5t
         zVrU4qz/EWdEaqcpf5MyANh6JoZBjMQ4zBYn177GxDTpx7naYAuBlbEpNdKlN9Oda75u
         4WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556719; x=1761161519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gjm1LijoOvaR4UmxrMCJ1ivWAHmFdej62IpC3mzcB4=;
        b=o8Cd1PQhq6wOWUgqsaWAQ1vRf5u9P45HCtvLyXK/039qV1vqvObFwnpS+K9jur8jH3
         7gD+zzKyLIMf8n+FdYQJLp0tlzlaxwQ29FdQKGrMN4ehsqov5H7y6G1WxvT78R20mMPN
         1pXpu60RCZkwS9u5X2/GVo4mkMdWW4kWlTkwftr7fo0GMoBea1ojWEsVzXek8qrCso09
         0GQTyvtgvA/66oiSJoMe+hvp2mVPwqG2KPXJUQo0+t/LUlZAQw2J2Hq0vz5ed2B2aqdg
         hOUDj07p0nNpuGtWS31M9r1P7Ob7uxt2vSAH6zWgAjt0ecykprfkHSr3I3L1PeT/Ew4h
         wdBg==
X-Forwarded-Encrypted: i=1; AJvYcCXWMSzI9ZFXFCbxxwkYtGK1v+5Wo8JdVRJ+VJl6eyDgsROfSYCcK367DM7n4K9Spz9+Z8Uk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8zAEMY4CqR9rF2AI7OIhzAGF6kSNYhREL86Uf0mqcHcXAllA+
	x6knZN9DK/IlLWvuCdND2mOWN/jUdgPnoZ7021X3KV5dztIzBA393hUhR2hBq83okhjVqITfJL9
	aFsxb0udBC37rrZwxgw==
X-Google-Smtp-Source: AGHT+IEL/VHOLFHuIoVUiV/D6Bqe6tW62TJ5aBz6rcqOw3p0/Xw8HWgUhNCxtEkFwsrO9XapAOq1uGfyLXGMMfk=
X-Received: from wmbd3.prod.google.com ([2002:a05:600c:58c3:b0:46f:aa50:d6ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:138a:b0:46d:7fa2:7579 with SMTP id 5b1f17b1804b1-46fa9a96521mr194128565e9.9.1760556718448;
 Wed, 15 Oct 2025 12:31:58 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:31:57 +0000
In-Reply-To: <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-6-dc5e7aec870d@gmail.com>
Message-ID: <aO_2rb29XrSn0qo3@google.com>
Subject: Re: [PATCH v17 06/11] rust: alloc: use `kernel::fmt`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 15, 2025 at 03:24:36PM -0400, Tamir Duberstein wrote:
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
> 
> This backslid in commit 9def0d0a2a1c ("rust: alloc: add
> Vec::push_within_capacity").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

