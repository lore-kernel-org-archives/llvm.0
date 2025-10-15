Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5530E851
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556672; cv=none; b=LksQ5TvZGJjXejG5SCCz7LUhcATsTkpNU36KwMXtyDPLEypWB//DAa+c9t84clpiIQTN4HWYeh7JMjxd+A9j0bjEdEQixY9b4/u6aZKQviY314gmbm9Ictvk5ri1+DBlyhRGMfeQ78ojPPBck5Nc+FYzuEVit9+Fz1RAjNy17NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556672; c=relaxed/simple;
	bh=M3OmafxYrytddi2fWGeQJQ8nIAlismXr2eiCuylqQ9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qp/hE50xhKoOdftiARDBNPNsUy7567sZicZk16MuVo0szU/9hN88WxSU+fakfRg8Rs6+f6ECUBCAXHfQ6XXuyVfuhL71c47WmDe3hUI+e0x7eLTzjSNDCw6jVr4uthJAYGRXy3tDQk0Rqe3zo5GTwWTLxsT1CGWk7IuUlggwdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Zno22mu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Zno22mu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso20858025e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760556669; x=1761161469; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9rhvc+XdtkSeql1ngz80HmWK4mJ3tw4/Kibofy2HKs=;
        b=1Zno22munAgRjpxr4aVpEKz1qkrb3VbeWqA4wr//OMqTnG3gSayIIeXbd5yeqMGi4R
         tLA702CVM/4BiijPTNkuKyDY1MUgJDFhlMYZaamy3hAQqipseHjwcfLkgGA8StOPJWPO
         FZxiG+6uwHAICgKHMColYWYKOufgG7zDQ3wdclGuaUjmeBoZL+ShJWx62kZeLTst3mri
         L8OFQtqyU+wiFVMBiLAFmth2gHPfVoHX9Jpt7MFHQ9Vlz+L4ec4mpFMPuuId/HKyVJFk
         ssryooymtSOcWRfdWqyYye5vVDD9wx7OJy86DJF+gPDN+QZsmMJae3mHpON/lf/hXNx6
         5Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556669; x=1761161469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9rhvc+XdtkSeql1ngz80HmWK4mJ3tw4/Kibofy2HKs=;
        b=lmLdm1bWYxS9PTFKZOfwtxX0/3xvuR2vkqr3op5qpo18M3KcqfkZ88G5FDtqOZxxyT
         qFy+ChkTiW4pK+xrbkZq1LdAR6k7XiTT0mCZdZww9HZ5kEvZTDE5P3D8ifZejlX+AMQR
         JgS+TXU/AZtLQlsKDSFzrXX50r36nJqz2H37KGcSAu8J9pMlNjNGALmTWhvCvYZO9Fmw
         0A7Zjr7Ogn2bt098FzR+Z75AbC7mVyXoG6uelhotwAhgqEpO8zyxIsuMOSnvdJ7vwh8H
         85LVifasw52rGlqfE2JuduslWkS1B0fwbh1JBxIgoaPfeK+xAcboolsPjdB2sLLQ8jgj
         ed9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf+R4J2VOxfiHVTBYnKyylWSarPiVb6Ndfi5wX6wcJxNNYHO3C8el+YxBSIGTLDntyBjkL@lists.linux.dev
X-Gm-Message-State: AOJu0YxpLzapb+HHpPrfPXcUhGbfLeXoEkF/l2gDqkSf16kfoZUplSUE
	YiSZ9koSoZT4xvohSWd8yFIl+/yt8KqX0YDSuy+EB9+oBvKWrhk366VEhkA3Xx0Sy/72V3HRXPs
	jySewloJGHC3raO4dag==
X-Google-Smtp-Source: AGHT+IFUuQlqtHR44WvPHRF9KPjT92Y5yOj1YhvXBQy9Crnrgo5UDneJSF9KPTAa9EHr6BuFGJGsfuKxG3RvfpA=
X-Received: from wmfq20.prod.google.com ([2002:a05:600c:2e54:b0:46f:c6cb:516f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529a:b0:46e:3802:741a with SMTP id 5b1f17b1804b1-46fa9af2d67mr202606365e9.22.1760556668803;
 Wed, 15 Oct 2025 12:31:08 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:31:08 +0000
In-Reply-To: <20251015-cstr-core-v17-3-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-3-dc5e7aec870d@gmail.com>
Message-ID: <aO_2fAYlMxOHBt7Q@google.com>
Subject: Re: [PATCH v17 03/11] rust_binder: use `kernel::fmt`
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

On Wed, Oct 15, 2025 at 03:24:33PM -0400, Tamir Duberstein wrote:
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
> 
> This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
> driver").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

