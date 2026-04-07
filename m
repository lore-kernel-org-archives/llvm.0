Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B63A4F24
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550289; cv=none; b=pmqG5oPFPbahS6OVce2EkjIXFbksE2YJ+ksKMNHp0YyN8IbgJ40j5mLMlggApRsi6f9VlN41uy8RMSHBCMRbJ4attQ0sD7A4zm3Kodg5BpBhBegYh5bgnaJH6JzQb3SgT1AHYUEsRUtCc7gstxDJ5xjK1SytV+rSvFm6cLNLan4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550289; c=relaxed/simple;
	bh=+skoQQL+0SkGcmfUQ9vZIS0EWRvemnZIqCiWOxo9mhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DifusTiS5B1GdyXkNS/UW/zB6EO3V85f2dpQrSbfFpEeyghdwJlrJqR3BkdfqXqLVgPoWjpH7SYUg2i1fJZawl8dPYnAbIBlIqRRdOwXrV2k0Szv9DX57aWL5Ltypq4pnIOmgUNuTPb4M3APYWkKzI4t/dYrbGrYwEXrSP/9iB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qFtIl4Ee; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qFtIl4Ee"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d03bad787so4775628f8f.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775550285; x=1776155085; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNet6S9OveGRpRTuxmVLkafAYGIjoGgLPLTKLJXNzw=;
        b=qFtIl4EeDoNyCpWDtlRz2fCY0FJlGrOLyh6oHu1gYhyA1tzauukQW9nmjnQvFq7Hnr
         Ml89TPkF7u8Q9pbrlEkAaBqkIwg80xzpNoFMxTt4gFJXKR2ryDVuSPudcvVhK9h/koNa
         ur+gWhdhVlYH8+Vxkdboe/HH8XmRpeIvLS7kHjZ9khcUqTPPu2ajBSxpHkZRtMKaihn2
         +iuCWslgLJrub++o3R+rfgDWhcpMYevnd4n0WmOokwxMd5fiKEmoy47wZKj/o65Aglwr
         /f1H7m1mYqhyCny3d7CGKoyItDj6P3Qgvt7Z6KfnTJPs0FqnLMlIBSByryHhgk1T0H6x
         fRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550285; x=1776155085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNet6S9OveGRpRTuxmVLkafAYGIjoGgLPLTKLJXNzw=;
        b=F9eRSJmX6OZ8ZcbW/cGP4j1rdOO0cAYZfUmz7+S5xHUE6vdxqDQV75p6rocJVbEpu6
         CcgjOGs3mgIp8fgOvZAJYDHf/q8+87OUfpQVVCS2LTJGbdjgfqdZ0/BiEjFly5R2fUEn
         loNnZV0dtxkkZb6S5AdR0uoT8+WG1NlKRGx15jgoPig7Y0B6w6bCHQmxcxK2M+2zPhdG
         Iygw+EMtrXBVZ46V7EbJ6aBYyil6CIRFpwNouGNN24fPfUF6yKaNgNzGUdFLUK4hTehp
         IEmYRCtKXM+IsCt2wx8dMdZ5LlDhs59oDekht/fQbbeEjD1hoNCA6dlLIEk4kj1TI5+/
         +0PA==
X-Forwarded-Encrypted: i=1; AJvYcCXMMmPDTIeVVRJirXTumhi0ZWbleraMUIV14Fl1rBTulG1D/89abop43Dh84HCiA7OXnPY1@lists.linux.dev
X-Gm-Message-State: AOJu0YyUcVtrWAiUC0lVogwS2LaLRtCt859EI9bTgZyDowSIpJA8KL04
	5lNjPvPt1munYwQ5hPCUmcuL9O+KLwxIBCPuwWwyV4zN6kk7CV/Hy6i444Jr07IjzCtc3b2BGmn
	lKNpZdiyI55kdwJ6VVA==
X-Received: from wroh12.prod.google.com ([2002:adf:f18c:0:b0:43c:f758:33c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4010:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d292df72cmr24103016f8f.40.1775550284819;
 Tue, 07 Apr 2026 01:24:44 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:24:44 +0000
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org>
Message-ID: <adS_TAj5X5yDcrhh@google.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 06, 2026 at 11:58:19AM +0200, Miguel Ojeda wrote:
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
> 
> Thus update the comment to keep track of it.
> 
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
> 
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
