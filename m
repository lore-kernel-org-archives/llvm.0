Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C612DF703
	for <llvm@lists.linux.dev>; Sat, 27 Sep 2025 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975276; cv=none; b=KGSlasR2eXk7TS1svW0ZAZ6G7ki060V2A6CG89QeUEsdbEHl612jPPGYNR8kq77oaTK3RJ6hXAU9gvkSzdpfDVEHKgxz7ET6NGJGkSx1bKVV8dHb4FjZymDKGACRpn0eT1mzRo4cS8H5FtyWiLCtFPNIhLEzSEDDn3gqdiHZtqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975276; c=relaxed/simple;
	bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzpZdGNFZItJa/UcUkdwmyCmPPgu5d3VMwiJJUuE5HF5KotmGSeV+JNgt/2wcfeeBXg/OptLnGPri4w/apqMnAv1cRLV04/DfgdVIBHsJ7jb09lvngsUzIMBbXdLvlvtIFTLHx+Zpw8TpzMMXBM5qqWm0Q05fEvzCpI6g0o6b/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZNIIBfN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZNIIBfN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27ec3db6131so6062075ad.1
        for <llvm@lists.linux.dev>; Sat, 27 Sep 2025 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758975274; x=1759580074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
        b=BZNIIBfN323oCDVj5oyfQXuipeJ7oQ0DIz60551LSyuoZ1YpwmlJM36XZGuK/k9B8k
         uRafrfkcPGLe9H/Poi3m5W2rdW3KTRuwkJEt5dZAcU/GjBe3TPVY2/c0sRjl0V8nySlS
         EW6bY3qjtr/k3JhBuPlezsP+hIdNr1J52I1ZdpEWEtt9hpmrE9EyLXzePmNlCO6I7TZn
         TOfBzVJTKwfOFNFNBKYXVah6jk3S/1TKFW6kPUl4vORfBVnFyljr2Vqwp5zsMp26G+JH
         Rp7mMkQU1J8rXDotclxtPInaS/T8hDzQaGiuigGjEd7OCyn+wR5+PGHd5hAvmBYsoBsH
         r91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975274; x=1759580074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
        b=HHsrfpr+1JPEZ01lzcUK+NSAORNPC0rfavHd2ypMT+olyTlBzat+nCmn9A/sHgv/w8
         2JI9h5e1WTQD6BSoJV9reFXKItwSxcd6hXtHTw2jqyrRiUgdPed2zjWj0yum03qtiG0X
         wNs5ptVNNDFuKdjw3lCScq0qJlcLXKQwS3i0ZCq4dxTxs9wLGAaE1osqAVSdMSWDBvrV
         vj3i9hXYFYsNFMYVZycaPxHJjj2Cr4DDqlsTVtgw9CBKXnXqtYV8fq5tWzph6Qpm9cRu
         eH8Yz8oVjUQsUgh8zUVQNJoXJYcw/94YbZRZg/Z9p4XvMCBBm2X1PXl+AlHufKSG+XkW
         FDYA==
X-Forwarded-Encrypted: i=1; AJvYcCV6fOIK3iRyArhwq20V6vmoWQtvmmHg3eG3PuCNof+UdiMMX/iDiQKVgjVsMMIghNdgJwmf@lists.linux.dev
X-Gm-Message-State: AOJu0YylVgZFIuIVGvqnUfovZ4MbCMXoSzs/nKVGBRs+EAyBHt3VH+bn
	Jf1LXASOwVI9i7IzUALZVZX3Wr9n6TBgTQbExeyrav65oS99lU4/0ri2AZvO/xELviqxXXE/hbQ
	yaMWIr9QDGJ+GBO0MekMxUQdr1M8LgpQ=
X-Gm-Gg: ASbGnctgaO985jbdX/aNnyXEKm7srY7pbX9IIEIgBdoX5waF2mPft/IHV2IkBIcIYxL
	JGyBOzlH9wDmUNmxhhTLd7OEzn/Dw1B3r5CKMzDbGbpbiNoCg+N5+KHWJjU8do1lD4fCF0JV7Dd
	ku3tQ4Dg5+lW445GB4lgQzviO6nkBN+nUcxLQcwiD65WvqS2x2j3Yg7W8lFQgK16lYOvG+5FtBM
	Z/H29YM9LrH17xEwvw/HGxy+g/YrBCQ46FJFI8qH3rWZs1NAt+n5xAUKIt4yD7GXQndkuddcafp
	4QuVcrozbsw/1Ki1YN3dYyfVznPHLnK7zori
X-Google-Smtp-Source: AGHT+IHZjp/EfiazAV4KIr6CKQXQ4M+vN6ByhlopidH8GmTXvgth0071YPgESmpcClrC9cwMbzePH8Og+U45ZvhzRpU=
X-Received: by 2002:a17:902:db11:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-27ed4aca4a5mr73015705ad.11.1758975274365; Sat, 27 Sep 2025
 05:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918123100.124738-2-phasta@kernel.org> <aNa7BDpKS2KA__4M@tardis.local>
In-Reply-To: <aNa7BDpKS2KA__4M@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Sep 2025 14:14:22 +0200
X-Gm-Features: AS18NWCd0oDH3VKEokXgs76roViozK_Ajh78YilTwKiHy-TyrYWiBu0MM9gxng4
Message-ID: <CANiq72=6pGtKKr3XeZXLVrJTNMv7YbGzbezSUrZ7A43MJQLwJg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Lyude Paul <lyude@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 6:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

Either way sounds OK.

More generally, one thing to consider nowadays is whether we will want
something to eventually live in its own crate etc., but for this I
don't think it applies and being in the `kernel` crate is fine.

By the way, should Gustavo and -media be Cc'd?

Thanks!

Cheers,
Miguel
