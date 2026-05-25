Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912C24DD15
	for <llvm@lists.linux.dev>; Mon, 25 May 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733027; cv=pass; b=AtvMXfg0zwjK/CIYka4was5tRBHOQg6qVQ4dY7bJO2SIcPytZZannafaB9ID31VExm71VTKlPbvk6ogA56FELO+2FqbEsxVhfML504mwyhBSygM2gHCBbM6QVWaglKwWFMyrKQg7eT3v5AOK46V1UUWn9Vb2inO03BkxMacclU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733027; c=relaxed/simple;
	bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppq2n1RccEVkzE+DG4xLyJmJNlB0CqBhxQY4UswLkHwfcWZowJZ1PUkNE27+SLllk/1cXDOpFzaaYZi6smqDyM6ZcyRrW33wu//gAaHPmXGWqHbu+k2rAz6fxYw/CSLaSmZxrget1ZgROFkvQbVuOVWlrwrbtPBWG/POI85p45M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RV1dUd4Y; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RV1dUd4Y"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f53c6af46eso696644eec.1
        for <llvm@lists.linux.dev>; Mon, 25 May 2026 11:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779733025; cv=none;
        d=google.com; s=arc-20240605;
        b=DUmbZ4sHxn6eOs+tkcbxSKJQauTpgwXVpLs0tRVfQhfxXjMzXT24fOyepK4HfsvS2L
         UrPDdm6q3UUhFx/bOyu5Npc57+GA5wuTbSHi+yihA+zLfrfzJtTVSOni3bvmUqPU++Rv
         AVAG9+2QfmW4RNVuC0iynvoaqPPyWxNKG4gKMIzJ9lkmfYIhzN73JYjBxUn5rbdFee+N
         tnEBx6Fx6k4v3CChECaTKFnXIiHqWG5j1IKA3gJO73evODv4+UPEBwbmwcT/KpBkpPsq
         GvMVQQWUG15EOzSkHzLvO8eyd83Vcqj6zIcuwwIC9zBaPivUbBFf4gVh3NW9pqpS9piv
         Em9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        fh=pxoDDqjU4lkC5K5VRtwXSFr0feKvKeUPN8nn2W4yGTI=;
        b=EzYpZo2mv36JDSJ4nRBtweVqqaPJzrt37itbjbpRLQDioTo+s6sC3lMX04Jv8HHvi/
         ZlwIkl1/GxPzuNtOLHsA128Gy4/Iw9EObgNyG8Sm8E0GD9nuX4udCNrkhR9JNDM18cT2
         9OROJC85E0YejmqYeG7najO/Hv+3YixlP+GfltMz3R+sR9yUvxCD/12AwLQX3IORfIUe
         3J8e/hRTfLYnGEWOOjffjbeVv5Ll90h/S1pwy3Ih8r7uy2zJunlq5e68oWip8I+ocwPq
         QsFG9f+YBmgJVscLhBq8kl4aeRBWx+9VwV8i84UIqzdeYj1JB/SbQYEBSxP2scr9LU3m
         Eogw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779733025; x=1780337825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        b=RV1dUd4YSkp8uS1QF01NcFyxGghPZEP1N497hyZxdQVSaFYLNkHw2tdY4wbXF38Elg
         4hc1ApwrEgKitXRFfAh2oT01lUONRRlpFVrBQtERDztziWNzXQIuI1or28iIJbYVHuYF
         xuc2Ainf+2sevngU//XOANEkqcVzxw0ymtWLt1gIr5tsqRgtpxZ7n9i2ZEt8iavLTliT
         JX/6L6P7hTcCc5z43h4j98Kjc8FJAjn6Wm2Nj4oVTZIlDR+gbZFmAalGINvH3t0mygq1
         ByoEBINAWQrRwtKr9P4Mit9D72hvxamTMAd2h/L0i99mnYhMSVJA57EHu55WDwLZXu1K
         rXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779733025; x=1780337825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        b=iMRWIGJQJucQm1R6lbHadjEUsZSB3r03NuQI1gVAQGR8UGcT6Y6cAJChQBJPYoIVdN
         aZ/CPRP7XasWnnEOSZlBQ8Lyl6zTaglTievVjnb11QBkwMsNAQUD/CsiZSqk+VMl0mzB
         HsVAIRhr0yBh10tvShmZbEXQofFzUvD4y1rHH56WfLkOQ7xmhWC/QCsUKcaUgFIekY/C
         FcdVHv32yGJq5KZgfwRVLqlSTzWa5blcBrjgDcpWEOR+e8cNK7QAm+ryD/kyYQ3PcFYy
         BSbpjAhBkzv9dTQb1RlQomrciTjZZS1kHnfwsRClTHkiaXNei9lzzHy1oaa0yrub7niv
         hgCA==
X-Forwarded-Encrypted: i=1; AFNElJ/pY2zQjuT0iDfW8lZ/OQK4ObBqwsc1o8IGSwFq16dq6LYqZGjk75lH27HceKfe9wn/Uuxk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1NE43o7RdZrcvfMuG3oSEC5r1R/DA/zX7shdOdsZ4iXfF/OuI
	5Turu9xCrPtD4WZYnnoI6aa4N2yAVkfYnDowXwhpMp+i8vT9CXXtPW3A0KRIv8UZLKCffbaejl5
	6wRUOD+7clLbq7pvLaq7/vuevt5+cszw=
X-Gm-Gg: Acq92OGmNS51TAx8SfohZrNOcebajYUfHLh/UdcZEoX62KNcgEHB1pNjol5moP3qEVY
	scvmN2tF0/aM7yskpaVF4gNTwQd22Y5Lf18Z2GPKBIz6Jaag4830weLwCzfNwlU7T/pXYzvuQQH
	3TfyFsNmpcvuvgYomDT4u0wBuYUsn09kjW8E2otvhirjqcZMBrdRwu+v2IqEobQUTzGgIqQSq3B
	l+dkUqHhy6UF28KdUYady66SArxrjblNK7cYtQWwbHHlBma5XpRHexoZgmMy+yOHgBE3Zk9aoHv
	Xka+g+x14Vii5lrxsPlyBk5lY/E8U2zXFSJjIzKFIOu/7btnKAJhEh+0X+aGUCTVM8TxeuAMlG0
	Pm1eVNXRU/jVP4wGS+RYwdDI=
X-Received: by 2002:a05:7301:2c89:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-3044912c779mr3218270eec.6.1779733025318; Mon, 25 May 2026
 11:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
In-Reply-To: <20260520064630.1785283-5-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 20:16:53 +0200
X-Gm-Features: AVHnY4KNP2Nl2JQ1LBLJOr_gMKPZJcSjALxmqaPRFB0APLpX2lXytJLQunJepAg
Message-ID: <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 8:48=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> Minimum `rustc` version required for powerpc is 1.95 as some critical
> features required for compiling rust code for kernel are not there.

Which critical features?

> For example Stable inline asm support which got merged in 1.95.

It is not needed that the support is stable, but rather that
everything you may need works.

From a quick test (with a dummy example that may not be
representative), ppc64 inline assembly seems to work for a long time,
way before Rust 1.95.

So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
seem to be required at least due to that.

That is why I am asking about the critical features above, because it
may be that this works since earlier versions.

(I wonder if this patch and s390's similar one influenced each other?)

Thanks!

Cheers,
Miguel
