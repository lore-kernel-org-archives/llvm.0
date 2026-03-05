Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12837B41E
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707920; cv=none; b=ud+rIRApBcuUMLq/Ga83+pmIFliYf9d2tAMlrHdbNhYFk1e8zHs1dSir4J7QJtA5bSZYFYvqv4+ov7xbzTw51JVj2gh+VrEMygUOj4rqtVcw6byMBQ+FnPGEyrtCAwatcCOdH+zXlTCIcHnF9eHZGN04T7CeJVz5YsqRxnH9XtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707920; c=relaxed/simple;
	bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdyq++jO1xJ5cnTy22Ptfe34OU8RKtACBkRYI0z6qptuVnY6amQ8qUNsDbUAKP4vO9iyF+hcemP/QmgBfYHo2JnXFw55JPCdkWnSXSSmHA5XkBTavOwa0ASt6nZmiYMnZetoSD5wgHlfWfL7HQ3mqbnaaSe8yPDW/cAnr3nQ23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PZO+7Cdi; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PZO+7Cdi"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso67150535e9.0
        for <llvm@lists.linux.dev>; Thu, 05 Mar 2026 02:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772707918; x=1773312718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=PZO+7CdiUYumVdXtErR3oFj8kSPMA+zZ9Nse4geyD3X6AnQxwLWTBgDYQbrX5n9YMB
         7UOiYUwLAqrlMO7kLYhj2D9aFVuojoI2Fh+1NXdU6POahfpgZefHQqtywe3GvB/VG5XH
         TcS1RggJGhxUFQeqsPgg0zXUUkGtULp9WaE2IqzlT/tO3h/dxagSrBPZNNI5ZZ3cHBzQ
         8/YAcasA+wT+rUIDcipzZ1Ur6TyS8TUHZcXZfAsI6FtJGXwjg3R0oqVfkSLO69WY1QZ0
         YYuJznTVCEAcQw1hLUh8cJA/fpo4ZDG1UalGQbK58PiQoAqE2vSaTS/Afq93FJMs96H5
         5yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707918; x=1773312718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=ZDjVrJa2i83Zld2uiXGQDclyBg7cGW9yHljNZnKONNrny7mRi+p1ExbGly1Bki/Xfg
         KurRAnZ2RnJIQeIXX6vjFdQYRGzbT2JjAlqYNtT/p4ae/tCrg3Vxz4Vf0wihqBIR7eKo
         ZV5fmJHZ40tofqbNoijpVrR9JZp4IWc6DMtXYWqOWdmRyPfkSdQ/+LU/uHAzaOb26PIA
         6BnNoMyHzwuJD1PpQy5iv6t3GElmHLDRVuV1cIGZ5OtEjDKYvF95Dqj22x+TlPgIyVPF
         prAo+ZlIdJGMPweQ1AU5A3jVsxG0llTNRac9zXeFb13gRUYFGb63EGWkwjEPtKiphZFM
         0Klg==
X-Forwarded-Encrypted: i=1; AJvYcCWmuD0EI3jto87oMd39LZSndsuIQDe9imA3V3WqQrazgUoHRqUvkyQ2MIGhx4j4yyTsXVqP@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvu3wY+fJu61ZfQPDllhN4DIzr7ocVhjAlCZYLrehth8ausad7
	DQrVmPYx6BZpJ9/khjrVLBINquS/FTZsFJmlqwlfFGnfIjeYKZBKoSHvvBgSYsIBLs8OeD3F9xJ
	cSlG6MGjv3Sy3cEAiVQ==
X-Received: from wmpb29.prod.google.com ([2002:a05:600c:4a9d:b0:480:4be7:3f3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8a:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4851989fc75mr80019835e9.25.1772707917693;
 Thu, 05 Mar 2026 02:51:57 -0800 (PST)
Date: Thu, 5 Mar 2026 10:51:33 +0000
In-Reply-To: <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com> <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Message-ID: <aalgNO1gRJdrWm4p@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 05, 2026 at 11:12:59AM +0100, Nicolas Schier wrote:
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Tested-by: Nicolas Schier <nsc@kernel.org>

Thanks!
