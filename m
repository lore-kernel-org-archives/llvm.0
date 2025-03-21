Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1918FC75;
	Fri, 21 Mar 2025 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742585881; cv=none; b=USMjUuJmrj9uAd6rXr+bkEdRnhKE7X1CA3Vx6oxtxBMSEoxDowawgI5Gl4H1+WfAaGGwB4oQduGTbnazSaxS8uS9ySuNMwGBIcKD7HYz5tAr6nmAxhlvavbt2A2tuoSo065XNpSUvABWW5PphQqDB/yquwEX+1EG1VXLtpvidXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742585881; c=relaxed/simple;
	bh=VmGk2QKnCgeNy1W5/I3wjMhcHhVvDTr6PEDFoCrfs4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okQEfRPJQ8qiX5+nUnjdoKHoi7XYxBzetlCKH/jiQfiRcUyjPOnsIm3GuSZDegPj8ouDvriiNE9acW5iJBnT47bLaDQ9dOwui46BuU4h4Rx4zgvICVTL1kAk3dkxUWykk/p6IBXMzGJcEYMj0x7uVgxtT3gD2u2Ed9TtW9u0pto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0wg1ia1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0wg1ia1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so679264a91.0;
        Fri, 21 Mar 2025 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742585879; x=1743190679; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmGk2QKnCgeNy1W5/I3wjMhcHhVvDTr6PEDFoCrfs4g=;
        b=W0wg1ia1/uhOW/H/LOtb+AQdg7r2WBpB0GvkXU7gtL0JvdFik0gCxPA7vYmulURwpz
         FofmxGQwKUDh+YzNwqZZ9sjIHTDVCqax9xclWipk4SbuYUKQcQ86Q29eGCfWAlIRVcCN
         9+/HOul67YS0nZzgKjb3WfaGYciJcFOOgoynL3GLnLeBClTR4XWOigRyHERwsqaq01DS
         GdySmV8FxAXLKLsF/0/+W9qPKqBkXT0b9Fi/qlPfL6OhgD9nyRBeg5RdaQu86p2E3/hn
         y062UMbLcEmppvaYzlC0U8SX/rTH+Bwj0iXb8KtmIIrSVvzavecf8jvYz5sQcezSb2K2
         uy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742585879; x=1743190679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmGk2QKnCgeNy1W5/I3wjMhcHhVvDTr6PEDFoCrfs4g=;
        b=t2NsR6YYBstZGELOhkg32zohdB7szsi0mtfnEzGOVGVqfe4P1RVXG4G7kMCc9AcCqc
         d+2Cj+XrVeqM+BXvHQjTDXLUfqOdgyvq8UxK+lSKBigWydFpqmwnggpAWZ/gbIfjejCx
         GA2ewrVYLKnrOjCMmSZ7tihWclUPkv8WYyvK55K7Hm5nRqHnpzdZuvUWNADUgqIKkBJO
         zKPrbaA43/k/AH47S4JxdLyA46QUdc/3PrnlEYhv6q1vurT1GVPNI0pjyRNL1901886r
         dAZRkPhvWTMtiJcO79dAOpLCEGS6XsbCpLWa4X1SbZ+k3Y22GjuvbgPQrci05wK86jyq
         h96Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZkfbyWpneK2Tip2sc1Ale1EGHL8FxKmKb/UhtDid8PAnuNsiYrj5ZXqkomD/htFsy19lics1tyS7lWC/4xA==@lists.linux.dev, AJvYcCWoPawjEtSRz4h/64aJfd7eIwtMsdX9LvpA/UZiE/JuUID6WFMV+ivmpYMpbf0KEN2FNbpK@lists.linux.dev
X-Gm-Message-State: AOJu0YxIVByJlIjnmoIz9ZP/t9Obk/6fKMrwe6UPQLwtfeb9Xw/Wybpc
	B66xFCzu1jvH4PbvrAYAMk2BuO4Xmj+crylavf5SS+AWj5rJUPmqJw1vpi2IcExbq4vTAkR3xpf
	gC67UcY+nsp1xGqXn0yFfZu0IeasBcFKYBfo=
X-Gm-Gg: ASbGncsQmGdqL2iW6NMA5c19CL1CgjhBHuaFfD5LUq14PoNELuVM6qXSPkBROX0R29F
	EN2QR+lGZhkwp5YhQfYc0oU/tZFA29q3Fb0SjsgbDV7H8uNURuSq3+Jbo3kKJ0M/DCzODy181B5
	/TpNQSqqkR9THxjLiF0cnaf5scGA==
X-Google-Smtp-Source: AGHT+IHcbZzF+JlsnM7N1XM9q9dnz9lZIXPMELUd/weF/NBB/+ylTDpLlAt78Ks9jpFQJPhbWPjCqFXH0ARLhFmlQwA=
X-Received: by 2002:a17:90a:e7cc:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-3030fb1fff3mr2593669a91.0.1742585879537; Fri, 21 Mar 2025
 12:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250320222823.16509-4-dakr@kernel.org> <202503220040.TDePlxma-lkp@intel.com>
 <Z92ldvI4ihlm0HJd@cassiopeiae> <CANiq72=s3rQwRt-TOr0_n=EKHwJSQSGmKfu_4TtoEhSTc2Fvqg@mail.gmail.com>
 <Z9253sEI_cRS3mtN@pollux>
In-Reply-To: <Z9253sEI_cRS3mtN@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Mar 2025 20:37:47 +0100
X-Gm-Features: AQ5f1JrVmdS3YKYMvAc3O62mGzPeFxqsSgBlARAqJZSbBraEX8Zy_C2Dxa7CiEw
Message-ID: <CANiq72nvp_fWD6oDULgq1PVBD417iUVVWcZr_cvfd8r9Lpk=rg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: pci: impl TryFrom<&Device> for &pci::Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: kernel test robot <lkp@intel.com>, bhelgaas@google.com, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 8:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> From the second link:
>
> "Previously, the compiler's safety checks were not aware that the raw ref
> operator did not actually affect the operand's place, treating it as a po=
ssible
> read or write to a pointer. No unsafety is actually present, however, as =
it just
> creates a pointer.
>
> That sounds like it was a bug, or do I miss anything?

Yeah, if they didn't intend it originally, then I would call it a bug
-- they also seemed to considered it a bug themselves in the end, so I
think you are right.

I meant it from the point of view of the language, i.e. in the sense
that it was a restriction before, and now they relaxed it, so more
programs are accepted, and the feature would be "you need less
`unsafe`" etc.

The blog post seems to mention both sides of the coin ("This code is
now allowed", "Relaxed this", "A future version of Rust is expected to
generalize this").

> Yeah, thanks a lot. Especially for the second link, I couldn't find it ev=
en
> after quite a while of searching.

You're welcome!

Cheers,
Miguel
