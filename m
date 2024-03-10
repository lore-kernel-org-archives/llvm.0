Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6A39FEF;
	Sun, 10 Mar 2024 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710108347; cv=none; b=EZDLyPDP0TsIvGPyhQ0tiSrBY+FzAO7cGkqZ5ILbL8V/aQDNZaz0BeDznMGOO2TycfDwoGgie96AyWL0OCFQgX+NDvY8xNWC/TOnqS+dTicKymzuaK4Nb0CUnGbw+Sf7vRcJmjFMzhyojBLSX7OvGAeDZawPNaOvkwAyWJ0pnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710108347; c=relaxed/simple;
	bh=5S9PZOOk2il3/6M/A9UXAwRg89wDWJJLeRc5FRTxJ0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwExhIG+mSQsERlMadx/vDIfsAWLkbxQUxy97PVdf6Orb6YiUBxkES3+5xfB0vBAlb1yQvpqpr5dqPLYYNtLfqdnCJ3ON3t1GdRDTT9Rr5XveayVxCnMKz/v0gRsLYJdi2L8nRX4Oh0j7xhWtYJ9N6nCeZp/yZHJ3edhvsMlgt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixQFoolZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixQFoolZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51381021af1so3215101e87.0;
        Sun, 10 Mar 2024 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710108344; x=1710713144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aKGf+Y72PoKg2C/OND4nMHDn6ZUZpF7AdOgDfeZSLA=;
        b=ixQFoolZRXhuvZJbL+CfPMxENWgaTjOi03JLYCTBGANx8NBMWQSKXDRid8X2x/xe4C
         2/DXpMUVbUguxf/FvR1pdS32I/tCEBH7zXbZi5Dz2ZQlscareG7tQP/wvj0u14qEN63C
         pfN/PgzREO6Pv1aV1sfzMCJiSLXMmU46xiWzP2DciSMiYLZGGcLDkHSmCAIwjzok5V7a
         TQNOkDwroMg7xUD0RaQv9js8tDDVqBYwAW95+mSDu8+4ZbJWpDfd9ddWunXLkga1oR4G
         Ee2/O90fkXZyk1L7oK0LZskucNgYF3Z2HlIpp2gwnTc8N/PffHe7pMVLzJCzowB70oLT
         p/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710108344; x=1710713144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aKGf+Y72PoKg2C/OND4nMHDn6ZUZpF7AdOgDfeZSLA=;
        b=JAoipYfu9F+dFrt96PjZsQ8maDVPNgRABnOmRIOY3H+Oc9bpxvT6S7mTJqLri1Hz/8
         AWVvlg7kYhcRScZbAPnUGa+ZabKIZaSja2nn2Z8EUQ4P6IX9oPpTxNHF+YAML1PeC2Sm
         OwS1KawD71tASbx1VsZgN5hshThI5qYpBAkxCJjy5xaTWDvdj1BS5K3V9Omhhcp+rQel
         kvY2MdnwaJ7wSHLSrac3YLwnlbJJ47bqeV2XY924NPI6kBuxqKuTom/7nvyHjx1DMrNL
         iC8jJsblWxejZLNd9lhsJA8IVrSqI8a4fqLP5lca0aJZb7ypcX3KucR0Cnl1IDt+ryy/
         bCCA==
X-Forwarded-Encrypted: i=1; AJvYcCUC3JtWF6EoY0aJMHNB4jcLsw/lAiBSYhBSjXgq4YxGYcQhIJsjbU6h/ZVDJlrh3vKm8wM33yEwDN30XjhuA4ZaOe5p1nxTyOD7QRtX2G8h6UsxHecuM+bxVt9J8YzC0yt/6l0=
X-Gm-Message-State: AOJu0Yzk2r2WZWvhYddmt2KIBdv1dty4gDm1Gtf+x0mAPd2HZvvspE6V
	eQpXiAEizA2WkeLsKWF8VCLJh/i70FFH1V66V7oBmRupkYYqUbc7Zpwuu9U7AYvYbquTzauqk9n
	9WIGZDdjzrS5FEhMGQRs2kHTVnO8=
X-Google-Smtp-Source: AGHT+IEW7I4Pb2aAtwXlkZzTHs3JgkwFiUuKUg9Ay+ldRaCkiM6NS9dBvo22SveC5/sBNZtGGBKKCi4ggGs50AcCxMk=
X-Received: by 2002:a19:c509:0:b0:513:3d4b:af9b with SMTP id
 w9-20020a19c509000000b005133d4baf9bmr3210128lfe.30.1710108343533; Sun, 10 Mar
 2024 15:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403092219.dhgcuz2G-lkp@intel.com> <CAADnVQJ+6mFs56fu+KEvumQ5uqM-oLpYx0hGxLJfE9XUCtEWEA@mail.gmail.com>
In-Reply-To: <CAADnVQJ+6mFs56fu+KEvumQ5uqM-oLpYx0hGxLJfE9XUCtEWEA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Sun, 10 Mar 2024 23:05:32 +0100
Message-ID: <CANk7y0gT8bvKuhJvxG1yLTxdRycMKNEBtgEv_PsCA56Nv74cDg@mail.gmail.com>
Subject: Re: [bpf-next:master 5/7] kernel/bpf/core.c:900:5: warning:
 '__pte_index_size' is not defined, evaluates to 0
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, Song Liu <song@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

On Sat, Mar 9, 2024 at 5:38=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Puranjay,
>
> Looks like I have to drop this patch for now,
> since PMD_SIZE is not a constant on all archs
> that can be evaluated by a preprocessor.
>
> We need to find a different way.
>

How about we define it like:
-#define BPF_PROG_PACK_SIZE (PMD_SIZE * num_possible_nodes())
+/*
+ * PMD_SIZE is really big for some archs. It doesn't make sense to
+ * reserve too much memory in one allocation. Cap BPF_PROG_PACK_SIZE to
+ * 2MiB * num_possible_nodes().
+ */
+#define BPF_PROG_PACK_SIZE ((PMD_SIZE <=3D (1 << 21)) ? (PMD_SIZE *
num_possible_nodes())  \
+
                             : ((1 << 21) * num_possible_nodes()))

So, it will be computed at runtime. This adds more performance
overhead but this is called very infrequently
so shouldn't matter.

Or we can hardcode it as `2MB * num_possible_nodes()` because
PMD size in most architectures will be 2MB or larger but never smaller.

Thanks,
Puranjay
