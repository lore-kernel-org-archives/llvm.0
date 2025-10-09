Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F794212550
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024690; cv=none; b=tlgsjUIJF4omMXGV7O9nec/Ew+hCRqyR0iTzlpniDTv6Z2rZwgcz1n9mtPlUe2lo0PqM1HyniMSBn6jx5B8hLECsn9ad25BQ+wsnE/DZFT5/BrKhmwGcwfFJYuhziXULC1So8T6p2y2rimnTaR9Hp/XAcuBh4LOh7NzRm7A+bDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024690; c=relaxed/simple;
	bh=ISyXxX1CgQPxYK0n5WBhvNUsiBcHP1WQpSdLc5FTdtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWl+hJwb5CZFl/P46xX1NaEc/LXWPr6wQCNGd6oiMdQ0qMCkS8Yxf6bDq4t/nk3dOroJTW0w7r7q/TiCTLL+hlgUPoF4Sim3NgSDP019CEO3mKMrqO2w7N6joF1L6Ln9BDTBngeTmCWYnSXR3A5n5daEcMVFAQB8TDNGar43Gos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEt34WXU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEt34WXU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-280fc0e9f50so1868475ad.3
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760024687; x=1760629487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISyXxX1CgQPxYK0n5WBhvNUsiBcHP1WQpSdLc5FTdtI=;
        b=XEt34WXUeh8monx9gLVCzek52/6llLnP5Tj2mE8Ibtf+DgTl9fC8petoPsAOqi+bDu
         7+ZGicmkb3mVNz4j0ZKp4hXm7k+zMUkzMZOvjqJAgjagN1mRagGT5nYKYHQDWAE1LBWY
         HchS5BKJdMCQNyF0vT3+kx83hMSatNCb6ZzLamQx2WD1Z7873wxoZQ9SQ9zSWNehuYQS
         90uaZ9Hek+cBDY5JrEU1d8jReggBqLKgVZv2vxKfpD86W5MpnjiKJIS/OfC3tOD/XUDE
         uUU7RSGgMM0GB7oIXnA76xxY6coFwgGS0RMAFaLKM7m5JvOk69hNDFf/i+Q1fzZ9xhzF
         JSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024687; x=1760629487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISyXxX1CgQPxYK0n5WBhvNUsiBcHP1WQpSdLc5FTdtI=;
        b=VmETqKvWRcfJM97f1JdZJQyZ8DXZXX+FU1J/W/MESJ/mL/PGdcE9n/9gul+D0w9xOE
         YHsCfeGAmDH0urHtph+nv/2KCnPgJWIn6sX0xoDq/tUrYXZLN8O+t73NrAMQoGSlRtrm
         DbChLjg+c215VVimQ/zYb1mRkru2pcJ/HKo2zQZrTih8/mSYArebi2lPUHDAeO/VIlZZ
         BBjmWdWr35TmVhRNoXS9zicQk22x2ljBxg/mNsbFb4rq8AvBbnXvz3Vyjg2sLCpcNGxW
         cZABm7FLO/zidPTv8ryFuTLcMJAnUlN4nFhKdEgFdSZ0VGoIno1N5yRgz4ABXkTxNB/O
         WaIw==
X-Gm-Message-State: AOJu0YyreKVm5OZM+oS4ijQU/EZlXU1SBsgRo2j9TQEFFWm7Vf2OMNar
	QO5JBh4yMCq++8ZCS3+cdjdx7/4/o22S4rJq3BHc9K7SFaCMuvDhy6V15ovRcXh1CjUE0K69qeg
	IyUUBtzAwgaxmj9LPuB/QsC7k+5hFmf8=
X-Gm-Gg: ASbGncv4ud8+NU1p9F/C4Mst8ihBj3u7/Bcu0MUFOHRupM8NtQoclU1DE4ZEjSpX0NJ
	7nfoOVL62aEL+KONbIuo1q6PQ99GTxS33Zl5b1a/wuakHwqC+vdFmZQ488YNvIHBdgEL1CKGQvE
	PbtuTmGqzVU/lFVeR8e1CjEpKnod7r9ZWZ5wfkoamaZKYhkY0fsH2fGqB964cFw+16kj2qmkOPb
	MKbajo0BbzajfrvDuq3cDSNfZgrQj0SAitPoJ3/zNeECisUgHF6Ym4Z741v9ib/I37XfbB3kwEZ
	40+JSLh0eL7Lq9B3dk43jNQdhaDASPsV2JhkXv9QMRnkB8XbfQ==
X-Google-Smtp-Source: AGHT+IHVY42dVY/s3HGPNLm0YmAHrBSIuu8RB49AOjXxJqjSxRVehbPuC5RwOIEYcZqeiz2UmeZxv5xyJOuu3t5xZwo=
X-Received: by 2002:a17:902:ea08:b0:28d:1904:6e77 with SMTP id
 d9443c01a7336-2902726698dmr56840335ad.3.1760024687272; Thu, 09 Oct 2025
 08:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008000816.GA1856596@ax162>
In-Reply-To: <20251008000816.GA1856596@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 17:44:34 +0200
X-Gm-Features: AS18NWDb2NjPVihD4F9J0jmsEojiUL0B8kovxxb4Y5UBQmW33TKAOCsYHpV-Q-0
Message-ID: <CANiq72kgceVgcZnBzCTpJytb7GhjNWGVJR=4mexo1vtu3cAyXQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 2:08=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 21.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 21.x
> series is no longer supported.

Thanks as usual!

For a build with Rust enabled:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

(I have tested previous ones as usual, e.g. 21.1.2, but I didn't get
to send the tag)

Cheers,
Miguel
