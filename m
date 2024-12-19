Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E291B4237
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734649325; cv=none; b=ot4Tmb2pNmnwwl1j6D5KaUKNpRG0Cc4wI1GgnBswm76F4iZTCarFagQLE2F+no+Q7XpGBQkMydsPHGjdAYSJ1n+ZTF7PieM5hZHQgwDMavxbwNMPrlyqWJRByzwi2AmPBFvpGymv3piJ28H22SbBb7Rln0dhhvGDSKa7lErHbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734649325; c=relaxed/simple;
	bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTILSAwOr7Ngg13LkOZoHtfPYUda5T+EpOXp4PqFDWdz9Dh02/MERPn39qH9ApPCDlpuh7/ZzxahYZ7xOKw/b+pKEk1YclLqrRr9xoQ5pb1lh5lB1S/TkcQiGn+3jSyBvhaBbzrXt/Css3FlaNU/SaoNEl/9AOke7Id/HODC6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AH/PifV2; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AH/PifV2"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fc93152edcso1041168a12.0
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 15:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734649323; x=1735254123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
        b=AH/PifV2uY7poz6SlI567cwqmK82/AKfNxISM6FoISExk/QyvASA4rJY/gS7+Cs507
         lf12srQfjrF7kyjTQHxojzhVzQFaJ2AO9C6z5tTFJC7o9KGYt/J74bjuDAI3u3dhbIn0
         maLq4tT6BfCU2PTPM1OaUVLLA2Jmnvd0UKxdfRr7Z/AAke4v1zeqLvuCsE3LlFBqMgnk
         cs5ukmG96rB7ryY5D0BvjfvH4beMuKQn/anGQZ5LdYp0HE812WVvVgLZgTU6M7wUzksd
         R0y+2deN91vktvhaTUaImTG/zQgNhA1AxdsoT1L1TDUc+QOPajoX4laBjHpoFRGLjES1
         DF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734649323; x=1735254123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t9sJm17zMjh9nS2520pB9UHMLqjCKiUePdrW91YeJE=;
        b=F4Tasuj1KLdFYZcK7DO7ejG5Mxw2GGUrUAX+QWEi6HWHoYj1gjVPXWw0YqtBwgcDkc
         G3pGiEVyWrCmf9HEmn5Znpgze9ERhxVYZygZ7QCwy8Y2tAZOQK/VhzWMNEt0fnuTShDH
         5o493plzsaNiGPF+XQXxTepXutt49lwElWxcy87M1D8MLPoP/dwCjVATWzbeqJUezyr4
         s6exYWimJKIBi4qEAGbHUaPGhqoQB6XUDBUHE4Xa+4M/XR1d966IXTqPQMPjNWyqoqq/
         vqyjcQejycazafyBIKlYvNXRzV/ARq9oMfpXmxEc2ZqHHrqTwkgVH5eN+LbFNS0ZVdKv
         E/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWhz7GmHegd3iIFVPCspbuTKLdgovT/w2sVIRt9pQEjQZNBRLvQCHP0IC/TG/kVK3wxAZDv@lists.linux.dev
X-Gm-Message-State: AOJu0YzOBxrrG8Hyg/lhdJgV4KPNqc399gU0DFTgNwmQ9PmyxB8NBtJy
	tEtHZz4mVpmvWy8Ei94FZ4aJk5tm+lWYaoyRCRJ8ZLPMldyPr+K7yNUifkqy+3HG6Rgzesyp4gP
	6h/25SaOBzUSwA557AOy7wBQrVpmF/rXYCtlS
X-Gm-Gg: ASbGncsY+CvfTcFLqP7FPqLLIMl0SiVHSik90QOKVKCWm5owoCa+K4gxZI5+uKH8md5
	EULYqm9ngPF3/Dd+LXLyUXPpsvJi/UT01HNik7atLqOno6Wgry1s/yGxxH+YzNKyZ2Vc=
X-Google-Smtp-Source: AGHT+IFzReAaCkEqUEW+1n4s+PAdFdKrrl4F01bTRyQK3ZxyuMEm8z1A4VPjOUJ8qEl5uYrWhtnCS0kYDmRkL7Y4DGo=
X-Received: by 2002:a17:90b:5190:b0:2ee:5106:f565 with SMTP id
 98e67ed59e1d1-2f4438e493emr7160538a91.16.1734649323309; Thu, 19 Dec 2024
 15:02:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe> <20241219221913.GA1259354@ax162>
In-Reply-To: <20241219221913.GA1259354@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Dec 2024 15:01:51 -0800
X-Gm-Features: AbW1kvYCVmlUEvz1HQsCdFztetspccUmhnURpw0E9O2r9_4s0rIDBZyrpgtQ9MA
Message-ID: <CAKwvOdm+03xrgupEGny4VG3mKVroYPH55qgGZcFbudFod9O=kA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Jackman <jackmanb@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 2:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Some objtool reports get sent to only llvm@lists.linux.dev when clang is
> involved (due to a historical filter IIRC, I cannot find the original
> request),

https://lore.kernel.org/all/CAKwvOdmJvWpmbP3GyzaZxyiuwooFXA8D7ui05QE7+f8Oaz=
+rXg@mail.gmail.com/
perhaps?
--=20
Thanks,
~Nick Desaulniers
