Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AE7DA66
	for <llvm@lists.linux.dev>; Thu,  5 Feb 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320080; cv=pass; b=iEXSlO91QW4Cy8GZmmWiJ657gzVZQ4F4ZepgJXmYUyrkBzk/iRH9aCiiEHrh8wUkHqHm/BZbDZmlhR97uiDyROQXwRKyX7Eoqb1an5iroRMGaXoRZETV0Lxff3+OHRW/hZBHYUP36iW3wenW9fW1xTwssn+BZ20/OJeNIo7VZ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320080; c=relaxed/simple;
	bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8s+zJQvsLxz8+dSJ0vy9hPDtQWf7UlKZe7MlGMxdymnBEj4NUrcBmZkplDOQMWekXZZ+zc+abjFs6PvOogj9q41m3WoZxL8nBSR2QZ4bekjTrpWUvgPpbueZKYU6jrpzKCFTh5AgDJYI6GUhsx1wMc+GmlHD4omoQeOAqvu9k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKRIKZP5; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKRIKZP5"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1233ad1b4cdso69962c88.0
        for <llvm@lists.linux.dev>; Thu, 05 Feb 2026 11:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320080; cv=none;
        d=google.com; s=arc-20240605;
        b=FPKCl297tu6xPKnp52qo4yaAyRvqN3RGBs/uwnmri5mWS8Uhf5fXUz4VP5KuxV5W2u
         r96FCSh/GmvWtyPdUZIr++DNSO2o6HseFBCD5UZT9VTg+ScJDT+B4aoIvbw48+WPP5dJ
         RrRcAXeJnRXyc7aJ2AXx72I/E9yQeVPVPLYZj50tL7TAroI57WLwsr6iLu9XIfv6LEpY
         AKbtv06D2eniAe/Mk0CxXaeYmJzRPzswije1zBH5ZE3C85HIXvh4Xyl0BlioZh1no/a/
         6T8iM3LT+d2gqkUME73Gc1uDDUX/dDC9GAW8+0owEK2O4a+iuI0MS47RP/Jr+oogBj+S
         cgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        fh=GBaryWNpIgwfg15Vs8Yl9/IkJIaQgqwIglvjmLRgTzs=;
        b=ZiZRC6UEvLx0eb+6M9JlvvvneI51Bd7hCE1VnoxqnTseIjMaKTMlL5amqRgpd6dOsa
         3YDBQIGIYvOk61w8nS5wGjKS/hryIw5Tye9V4bjsTMJppurKJmSYylZ10HJ3OmSvmYHo
         bLuh3CmydgxJfujuQGax4HXjkbjaMPR/fF56yep8CZF0i3E5TbFRtnan5Kmjpe4QGYQv
         sSxjtwoEMdb+PZGvH1TCBBVw3JASVCVxpjSzFfkGdUkApohCQWD+SO89SiEX6ONLsnaO
         BylkFHstDEc4h7Z9LJ1HCgFqVHGjv17dHU6wXYIo1VQCSw4Riu6qk7x5wjcC/uQwZDID
         ov3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320080; x=1770924880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=VKRIKZP5zYxXR2rPuI8xCJlpcoXkHb+eL8NWaP9SSLShPUaSlUa091lX+rVcnOq9A1
         qHeU9K8MLMXKoZedWaQJeKKMbctgJ52GE0NnsE2grmK6rw8kIEZuSi4weeNVlxujEMfA
         NHPcjQi40EA5oBAslhtxdoVKV3NDD9gC+MUJHC/9N0lh8AyaGx2dwNCSJIiZghVbM/YI
         OrE1NOsX7O8OboUokHONPdwB028trLurZz87hIkNtE4faIMSXLRUMVYNumR0FBEKynTy
         ahkAYf1C9MAw6thJQSjBFbZxpFpU6YLrdn1/vzFJ/pRfkRf8WSh6EpDsMIBSeegTq9Ph
         cNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320080; x=1770924880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=WNM97uj28EAS+ZDfOW5C4h0YTyz2SHzpKAPoAWMz9LBKqZjVZFwWEj5YU8j7tQvdtf
         9VlmPSS0WvYuWfJ+aeyN9r1Yek8H8ZHpLtm6LpRZxO/alZHqHWqTpP+SCvKT8zH1qRfj
         Z2j6xnVVGQljfI0yInGEmVMbn0IW/PXjxEZan3ke2PoPqQykPslmFVLwFltFQJF+BNQ7
         2CBAwk6p680CTqvLHdOIkIMyLfjdixIH/zHKCh+Ru/pKC66rpvKHTCphbfmeeOiEGqkN
         /YrVesjA2lD6S+8ates+jzvYUC5R7/tmSSkQc4+9/yREb/IUofnG8aaHgz3z9lMRbXTF
         SupQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXFlsma9jIpU//ZcNanG/bx2h0GauoLW6BBu+ch4dcJemIcqlXzDcB43zUSAzQDgk9RlpP@lists.linux.dev
X-Gm-Message-State: AOJu0YymqZv0un2UPtCOzmsX2SqjaivcBsE9WOPf5RC02pqVPjXARMKX
	fZT7z9MkWuE/zZLUeSQwGyFFkJoEpN+8jm4DihEJRiztjvLYPoWPjjSn17DXlOY14G/wkp8EZCS
	VYhced6nC4654s+h5UvG3AHoXuNahfvc=
X-Gm-Gg: AZuq6aL3sMlSYW8VGwzq68wUXpDwQ89vgfUCGUABdX1+ReXANwZ/8vV/Iz7D53zZ2eC
	N1TqUMzHoFi3ZBo6YLVEtn85cc4xBe4Sklll9+fYentEhpyBbjKFH8N2EYVM5BaXsI/GkZRKLuw
	Zy4rnpUhLN8FPsvMY8lH6Z0TZbxKdfJuyJlnkt5COESBj5SmQM61S5Mf7HdEiV40xF1WZchJipm
	puEos7lCmvzrk8HPoUtyiWNaGOppKb7+WC093FgQUM7CCRjm7bQnnSoxw4IUkhGpsCtWWRd2K2F
	QEf4rLNr9NRDRutwSkHiUiwcw8QHu7EfRam151oCm1lxVliSucz7GsQyk9qHTjzUv4VcIBqPrO/
	ofTyKO+93TCf2
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr38975eec.4.1770320079827; Thu, 05 Feb 2026
 11:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com> <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 20:34:27 +0100
X-Gm-Features: AZwV_QiXdOwsA6Cs9ikWk94o2hhbKT_np0MzoS_FXf6_Mvy8gIUKQAkUYwzBM0s
Message-ID: <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:29=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> use rust version nightly-2026-01-28
>
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>
> [1] https://github.com/rust-lang/rust/issues/152177

It appears to be a bug in LLVM 22 for ppc64, not present in 21.

If I understand correctly, then it may be fixed in 22.1.9 if it gets releas=
ed.

Thanks Jubilee for the quick reply there!

Cc'ing Clang/LLVM build support, in case they didn't hear about it.

I linked it in our usual lists.

Cheers,
Miguel
