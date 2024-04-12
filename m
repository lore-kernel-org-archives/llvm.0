Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055814F9E9
	for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 19:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712950246; cv=none; b=ttFMpYTpIeAMhuUdbLZXAbrDDWLzZrYBkZPHrEXLnlX7zd2s4ukszneCpHs3TC8X5VyKRZVX3Um/RXEJ9DIkwTZOCGf7etzH4g+bXd4tSDbiD+52jrkvx1Jkq08XXGiQEtaezZUFGnqB9UnVFVQqPWFCsa3oQ1F/geyl7n9b/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712950246; c=relaxed/simple;
	bh=xXqpfdKuwNL9Kig307Qx7iHEKaVdnd+3al7mxs/lJ/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrSoyi7FUrS34NpYAE0bO0033kQ9l/fWbGnzNEpI6tFyhBDYrESJnXU4OTx9O3KLRxVNzoICz9rw+Y8guBO9QTZ87n6IEBSeLU+Qm444ag4YQ9lK2hDPciIhUB4lECv0UAjMedmSz7ZGOW3RU4/gswgBoaEzNt3356LbTiz6FfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CRoXfrDq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CRoXfrDq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-417e326fceaso1695e9.0
        for <llvm@lists.linux.dev>; Fri, 12 Apr 2024 12:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712950243; x=1713555043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXqpfdKuwNL9Kig307Qx7iHEKaVdnd+3al7mxs/lJ/E=;
        b=CRoXfrDqNBTFX2SZ7REWAbWWuA1wFnvCf1yNyPSRI0+gDktDEozOxZbM/aXmCZg1iM
         kMgKp39OcA9vD6EvLnvRdZJU4c4+3V1451VNaM+6gUX2J0six5Dvi+Tmge8SRPb3kAGa
         +yBJV17wmYAYSNllHIwCqM1+s0afJjmLhim7Qr2+gOZazB6dDApaX+g/uLzwZ7NzvUEV
         B+wPxlljAPj0lisscHMnbpt0rNWSbyY/squfT54QOOMfp8/grfO9FUIdJvm6j2p9o3hA
         PwNJ5DH3SvjjQzBeQZ4SiPQ1XB1+Z5uVDTVvWGEYVRTX4nZ1hnYCkRugj1+aIXOHfh+A
         acSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712950243; x=1713555043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXqpfdKuwNL9Kig307Qx7iHEKaVdnd+3al7mxs/lJ/E=;
        b=Aem+TfomyKVSrUN9zFEADbvoB7Xh0Bb2DF+liM7TjYPQ7FLPbr9Hall7I1m5D5XcmA
         oKYt/EWUNsIbjftNo0GKgcsx9s9senrlp9F8y047tnpXFAjhEbYQ8gGXzUeoBoRxdCvb
         YAzOrferxzQx9kaSY8uZyslLgpMKaofDeQnm4ptAz0Emw0qZecVPASHh7S5SeznryCRM
         n/jTXZqV7G3F+Uwdcej2d3c+G7WPrbZEaK6gQekXx0thRx2rbqNfl/Eu8Fr7fnuz7Eg5
         UGEY+kQg05wQxzX/zEhB6Fsm34LpoqrjUFscuM1MCaYO5gxUvi8T/Roa+T39Gi2JkNRB
         J67Q==
X-Forwarded-Encrypted: i=1; AJvYcCWItUn9DkTRkmfJCFUE/jnKMrENITHA0oJFfKBffdbo4tlRXxkn6edJZsu23NxWo/YTsOlw9EfJm391sdeVes9tPID3Hw==
X-Gm-Message-State: AOJu0Yw1bpxP3vxSGoIrFByfHeJrt0Jj4xPrkFSW8vQoepW2J/xZltUg
	Auj4Yk7xHwHQCUFMOymnFXL09nZjWOsFmJsQZ/i8YP6jwo+0o935yIHM+GCnkYtdhh6hGHKZGTX
	MW+Wj34QsP8r3rqN2NlLOuiEUmvWJpMHBxGEo
X-Google-Smtp-Source: AGHT+IGevUffXrsP0zpzECV2A0lqZ+/gOkOlJB5YDYGLcWSxoooRreou4WiRPDCja5l0bWkxTJK40nL5YsmoSdm/uiA=
X-Received: by 2002:a05:600c:35c7:b0:416:b76e:b9ad with SMTP id
 r7-20020a05600c35c700b00416b76eb9admr23167wmq.7.1712950243298; Fri, 12 Apr
 2024 12:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411231954.62156-1-edliaw@google.com> <20240411163409.4f8969fa8a46b63d04a28f77@linux-foundation.org>
In-Reply-To: <20240411163409.4f8969fa8a46b63d04a28f77@linux-foundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Fri, 12 Apr 2024 12:30:15 -0700
Message-ID: <CAG4es9Wti4JACt9KzvEW4oSX0wZyBWC9NCLDW11NXYeeOzLM1w@mail.gmail.com>
Subject: Re: [PATCH] selftests/harness: remove use of LINE_MAX
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 4:34=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Thanks, I'll grab and shall send it Linuswards for 6.9-rcX.
>
> I added
>
> Fixes: 38c957f07038 ("selftests: kselftest_harness: generate test name on=
ce")
>

Thanks, I just realized I forgot to remove the <limits.h> includes.
Should I send another patch for that or send a v2 of this one?
