Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384651420A8
	for <llvm@lists.linux.dev>; Mon,  7 Oct 2024 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326009; cv=none; b=hI3C8rxBe44Lic4UQdcPbmIt+uC3ruS8QI4CAd7Q7YIC5EdR94YGB7kdD1Iaz8FAyqfgDezbHIORRr+dODMJlUGKoRr+SS2yaw2cD7dklEsJ3LB4NDmNWaP9KX3tZKJp2JlaPxlBXFXcMRCzOWjzWZEsfDlG8mBOef8uR/QDDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326009; c=relaxed/simple;
	bh=ZliK8otf4DPyN2MADeJuJzws3KQCKgf8pzmFtxSBbEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wwn3g+kcY1PxHylSq3+PTZOi25Rp3TtvT0K7xtOIx8NCHH10VS9KNQp75r+gIrWLq8ZwcpLp+mq4lEl1/MGwKNjzLURyExoukshH8fUsBWPWh1B2PQI2I9zbEfLGFSw96WlRthk7+gcV5HtOSRFyzm0ifoNjXEGlzrggB0DL6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlUzjEMZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlUzjEMZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718ef6a26dbso264691b3a.1
        for <llvm@lists.linux.dev>; Mon, 07 Oct 2024 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326007; x=1728930807; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4abmxiPmNVi3cKnPW7CiBWGlypLWQgwpQa1s7rzLXg=;
        b=jlUzjEMZkplY5v0YOCkooIyVGl3/4rUGW3vWPHyKidJQw5UOZmz9CICFV3wSTPDzOg
         awJ24MbJlB01s+WO4MEFUrMfZ/GP2I1VAWaMHthqV+N/bQcCLKMr4RZLJghIva/B31y/
         DyKMa2K7gqp45OomJy9/m7X1E42Koz48wOXL0//JLcs3C4vwVYMsEFUCN91812ksu2FB
         7hyGvTWQBV0eU8PKXiUA5quz70TE1fioMbaG4fsdf3JMHZWvxQscm2tlsb6cHePZcxUz
         EPNqjy6q7x9HfjMHih5dgNueYEuCfpQZNVFa8qDXiNK3gfAaIfuGUolQRsoq08XaeWlb
         sIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326007; x=1728930807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4abmxiPmNVi3cKnPW7CiBWGlypLWQgwpQa1s7rzLXg=;
        b=eWrxY+yZozrmHBYw9S9WAIbV2c9VdK2iJwYlIHOnwIdYLjcrgUCmneFG2ySeD96RXk
         MbfK5vJXJklLL7wjsCowRivVhXaZwzYrdO1fz++RDOoQf6N30xK0++vWG7R/FTOmbelu
         diT8pwi1VcPCuUraxx9GziXDTZcQECTuodDsTb5FjachMVmaMypJtSkNFoW1YLB3utU1
         cM01TnMXdUFvNRWiJyN9r6cXB4aXjXEUVpZs3fY/t1pcjwUeK1Mz77aGYMcwZDxtLJWH
         1lcudAvUihdb7OfRaXbkJ7nyX8/WcZZAyxWt0HlYismiAdxrAGo6yvRHTyeb7D9hAVGu
         IG+g==
X-Forwarded-Encrypted: i=1; AJvYcCXIsy9pMEhrv+cdQ9EkSTHKFnKeTNzJc40TpVjkh2DT481mhufv/RPdVaPT5Oeid8fPO+pw@lists.linux.dev
X-Gm-Message-State: AOJu0YzVCJYmAcb/sQoksL50BQCXXF7xElCZCieWlM30oC5VQ39PIZOy
	K3B2ie6dufAq9IMFiBpjiTXej+RonBDhe7WidL/YHxYiPm+9fChUYRxBfA3d16zjDoUE6iOZBMu
	6akeccEbz76j5YnLcMjX7yq41ouM=
X-Google-Smtp-Source: AGHT+IF+C2pJlkVmDRVo4PXcJTPJZ4U4RBrw9yaJ3O78ja9hmVpWEH3Lmebudm9Idsdk19oGIrpS46PjWjdiP2NSuEE=
X-Received: by 2002:a05:6a00:3e16:b0:71e:59d:36a3 with SMTP id
 d2e1a72fcca58-71e059d36edmr2264095b3a.5.1728326007506; Mon, 07 Oct 2024
 11:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <202410041106.6C1BC9BDA@keescook>
 <87setapq4s.fsf@trenco.lwn.net> <CAF1bQ=S7HfvXw+hczmQrSYcBf_DHsZo2k59JSL8T_9J9HitHuQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=S7HfvXw+hczmQrSYcBf_DHsZo2k59JSL8T_9J9HitHuQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Oct 2024 20:33:14 +0200
Message-ID: <CANiq72m7dkcy=0+ut=rM6Heo4tQSNyUrejBDWCvtwGQVVvLhWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Rong Xu <xur@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 8:04=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> I removed the "code-block" directives from the rst files,
> and used "::" suggested by Jonathan. The rst files themselves are now

I think it was Mike.

> (1) The text that was previously in code-block no longer indents. It alig=
ns
>       with the preceding text, regardless of how many spaces I add.

Did you try with a tab? At least in Doc/rust/ all those three ways
(i.e. `::`, `.. code-block::` and a single `:` for indented non-code)
seem to work fine, e.g. the following document uses all of them:

    https://docs.kernel.org/rust/coding-guidelines.html

I hope that helps!

Cheers,
Miguel
