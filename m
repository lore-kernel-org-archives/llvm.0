Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9552641E7
	for <llvm@lists.linux.dev>; Thu,  2 Oct 2025 21:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441393; cv=none; b=I42Ws/GPONaS2V8qvNbwyzjV9jOlsoJbZqtAE191xEiZeAyr8Yo0KWCGWjeU0TXD8KkD2VYteccUEgHIUQ0XfFTnlS/NwWGF8lq1GfxYoz/nxZYQGhNaRX7tc/GGJJ3OJCt9vm/JvrbW2u0xzDnLkSMZ8IV9Kuf7Z0lxxGn2pjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441393; c=relaxed/simple;
	bh=EC/JwrRzEfWyNU1MymFPlAzzZzaW3cKzpLn7u1s1Ig4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6YELyuCS/IF88L8QgjziXA+mZl5fJjiXxL55WEgCQIXnK8l5fthHlNUAaSImK31Lk5v8y2oO4syxrlef61WqnsrYFeLGzCUiLleRFVvVrLblplFqmVjAQBOcIOaG7MzaorOpeMdxsqvqUKUrdETg47ZE5kzwFNwmOcBaTNYeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGNu7NUM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGNu7NUM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2697051902fso1932885ad.1
        for <llvm@lists.linux.dev>; Thu, 02 Oct 2025 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441391; x=1760046191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPcXFzKT5wVu+oYSVpByRjAYmnWsxgWqvNHhKj+wPuQ=;
        b=iGNu7NUMWE5PbNkpEKK2vipMjhFP8IswEElytcBgFhQLnZR8cWYPnjVK0q/LWJbcGv
         rxiMk5wOGFapnWRyZasxg6+KmPcjlAppb7ZbSGGqz4n9OqTxTomCHMtdl+zcFYd8gTWC
         JxDC85CgPt1KL9wmcKJp1vVQdXmGjffbun0nd4cEg7G11vkdKTwoRDONZNtCFdjwx8B4
         59KKc+271XoKVn9oDFbA89wQl27734tKRI8S9r6wPfbN8lUpLZkJXrF9L3PeYDQaAzSa
         yxZ33YQ2Yc8RL84A1NrAb4FHR7DVBujTl5Ceb+F+7Z1GeA9RwSV6r659E1Xg7ljFA6pF
         HY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441391; x=1760046191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPcXFzKT5wVu+oYSVpByRjAYmnWsxgWqvNHhKj+wPuQ=;
        b=uc7lPeNSwhJmTtjuubgvrQW2ZOY/o6lX0tCtyt48nvOBJJKcRLPGCHnqIbQF4hAhsA
         NpOjWVwujiDKC6R628PuYBW9k+/MBVp2VGZX1jr78c/X+RercKZelwIqFBmZMUzSbFUx
         npktnjjBsxceD65KDrZYuN7Tgv7fAbX6NOgO+u81D8ZJUCX3LeYvrp2AQJFHNStFfQhg
         CzgDJDW1Ns4gPr0kzxf1loNKOCexupjc0oKB06kpUPaZ8MB5N6PGvjH3mIq+Hw6fbDEm
         RaETUWu0aohxEkTFjQSmq/8oY0KVvW5LzmQwFscs3Sm/SGkC91rxPYpfupoBy2ZT5U/6
         twyw==
X-Forwarded-Encrypted: i=1; AJvYcCW3yjDWGapQtnr/Aa54BGFyOycYuyJsb9Pys6yiC/TF15X9IwTVxaJ2VIq8pkky9i2P6Oij@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0UDJ+Lvea8CV9GgJbbVWA8/6iNwJCp1pX/9TnfDA/Bs+twSvL
	OvPCGHGOL3B5pBuIu/JvZ5BgIpy6MmAsEY8xoaEHO0/CUUtfOVK96zVR2Tgef2BliyllgL4/YZ3
	YvIwQ2CzQLPBdIkt3nCJ3pfWmlsaxgjc=
X-Gm-Gg: ASbGncsbZSi4SvBmN8zZkdqouAFZnbS1HdlvAtgZljW6o54+6x6EvC+0XvKYguFVolJ
	U1Maom/ANZ3Zke5Pc+rmJHI+G521iB4SqmDq+Odta23ymR8MaWxyvTKO2rhYQRM/374W2OmecdZ
	0HCMDeBDA4hBI0C8osqlmLZ+0axVhE9mZtOE6LoIYvC+iI4M8UtyO8DjPm0R0lMbpMKawq5RQZ6
	4SjgF8NA1agoR+s7vQZ4AS/FrgZ8qf6qQLgv+mtnVtBHYq6mGQBbjlqc2XtZ2gzI2iddJ9BDaPP
	oYkkiOLZfvmJZijN7EFUSFZ6kfvZxRXoPt0wzL8rOrwmPJUVbg==
X-Google-Smtp-Source: AGHT+IFZzSxiqDHj6MHdqyQ1Q1hdzZXvFd6lioB0p3uh+24Ijmg973MsU4BcCXMws2SWUfETRmGWtCjrkLphe1TQaL8=
X-Received: by 2002:a17:902:d2ca:b0:288:8c30:f08c with SMTP id
 d9443c01a7336-28e9a5d22c7mr5070435ad.2.1759441391458; Thu, 02 Oct 2025
 14:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
In-Reply-To: <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 23:42:59 +0200
X-Gm-Features: AS18NWD7b1CZpOPQhwI0Dn5y2ltKsgZ6GaZnx5tlIYsi0bLzqLKsPKXfvkSWyuI
Message-ID: <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:19=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> No idea.  Let me cc rust-for-linux.
>
> It's a one-line patch:
>
> --- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise
> +++ a/include/linux/mm.h
> @@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
>  #define VM_MIXEDMAP    0x10000000      /* Can contain "struct page" and =
pure PFN pages */
>  #define VM_HUGEPAGE    0x20000000      /* MADV_HUGEPAGE marked this vma =
*/
>  #define VM_NOHUGEPAGE  0x40000000      /* MADV_NOHUGEPAGE marked this vm=
a */
> -#define VM_MERGEABLE   0x80000000      /* KSM may merge identical pages =
*/
> +#define VM_MERGEABLE   BIT(31)         /* KSM may merge identical pages =
*/
>
>  #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
>  #define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit arch=
itectures */

Yeah, non-trivial macros confuse `bindgen`.

For the moment, you can do e.g. [1].

Other times, we have changed `#define`s into `enum`s -- that also works.

I hope that helps.

Cheers,
Miguel

[1]

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 5128e2f12038..918f4c74067b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -106,3 +106,5 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PRE=
SENT;

 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
+
+const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
