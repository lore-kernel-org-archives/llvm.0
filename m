Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91E6EB5C
	for <llvm@lists.linux.dev>; Thu,  3 Oct 2024 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979631; cv=none; b=rAjEeKYaPY4MRJWxeyvei4pNhgykIDwFxdbTCp9Kscb+E/3b2CHNNkLnRbMoi2+eQQ1YFtyLMTrWr/FD6TXsxPFDMu9eaZoILG//fCHKDrP3BXVKOWvKykbFzBPzMvhTIQltot/DJyCJxRDwSr8WsH4ZB1lW0kEBHGe2ND2j8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979631; c=relaxed/simple;
	bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNSMqbl8GiV9evPPUrWOUxyN3thVoO1vMcDAt2NHVJ4JtAexiKIRACjCBHVQoIjULdkPzxn3Dp/3ttISCd0uPDs8h7QGLC5aswmTCA+eR/NUzVNEF2Bn4eNrVTjau6G0m1er/5Vf3eLbnOBUC1EldayefpzXz9aqWlJdXGk9e5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4eC6fK/k; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4eC6fK/k"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4582fa01090so34681cf.0
        for <llvm@lists.linux.dev>; Thu, 03 Oct 2024 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727979629; x=1728584429; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
        b=4eC6fK/ksRs+M/3WS0YMw2zScPGnm9iZ5vPtztojWFACZPxANo9qLQCTesnovWYzLp
         GLbDbv6MMYBV7SrmtzYsy0xSYSQkFn0wg+bD7Ob+K4QCz1+4DVwS3x/oT87wsCnyXnp/
         6+o9RJZOucS5ztD+oEJ5uU2e82+27uX8zO9ec+bfKlTuxoEmGCvC+rjYiELgnTXV+/V2
         ogzBYy/AHcxwCtqHT8WU/v3ThLAbA95mVarPDPS+vOv35AjN7UDXOnhVWmTnxAkrWUuf
         teJDFNBOQpTl9E95C+JssZPmYjCgvrYFTFVVoo1+AuL5i4QnMKQJuSNnRxGC5d59VCFn
         Rxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727979629; x=1728584429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
        b=tI2CprYJLe9bSrqq83amHHYgTQ89Dpnmzu87AQBZumnqDUZ83qWH3htNTcNjBwtGKj
         C0I4A4fe7ME38yNvnjVCUKCrznjb6vxDS4QLYmbQ8TmKXSuvtotgfrxcQSSnCqtgR3Sf
         NZY8VOupha+bI5eJGth438xt6jtv2kCh9heU/WRrn4lTYSv8ePZROWsJWL/z7P4Zdxxo
         MWzkwC35oczXMJzBtevWfIVdpOXUqiR53mQQOmuATqeHL/uVxGvEvwPrzxeVGJjtNjOT
         iUYiSJwIPTDCZC/v/NWVcsWDFq4Ky3l0P/uvZiDIY9pH/C2gPjhSoJVqul/DriLpTFX+
         1gnA==
X-Forwarded-Encrypted: i=1; AJvYcCU5WjsTtu4lV1bKI5ICjHWLZmuc+0Ri+3Hv96pZhQzW8clsakOmTh1KKE3kvSrb/xrqprZk@lists.linux.dev
X-Gm-Message-State: AOJu0YxDXuUGbsOQCmfVghsQV8zS7AS1KcmhLXNbZKAWspLfsSHvEmc9
	61PpeLk8wEHMcnxIdTxQaeDZiSbGaFY+AC24ty9wPzbW9CzKhmBazmSHS5H8yMMdhZ0EtoNjKFm
	WnSYmQXkapOVTdZHjHMFFgxAQxUZtLGMxXJ8x
X-Google-Smtp-Source: AGHT+IHGZSKF56BASKK8GozB2yF2V8PIyDPsPS4fr3yQFHFDS0HG9quwxCeJ5MiYAd0srYGtlNnDajEe0HNMh2na5RM=
X-Received: by 2002:a05:622a:5687:b0:44f:e12e:3015 with SMTP id
 d75a77b69052e-45d9b947144mr205851cf.25.1727979629144; Thu, 03 Oct 2024
 11:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net> <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
 <20241003161257.GZ5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003161257.GZ5594@noisy.programming.kicks-ass.net>
From: Rong Xu <xur@google.com>
Date: Thu, 3 Oct 2024 11:20:17 -0700
Message-ID: <CAF1bQ=RAizpP-T_sRGpE2-Kjsk_RZD3r_iz_dpn25W+uDzpWOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
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

Writing the doc with all these code-blocks was not fun either.
We are happy to change if there is a better way for this.

-Rong

On Thu, Oct 3, 2024 at 9:13=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Oct 03, 2024 at 09:11:34AM -0700, Nick Desaulniers wrote:
>
> > > It makes it absolute crap for all of us who 'render' text documents
> > > using less or vi.
> >
> > "It hurts when I punch myself in the face."
>
> Weirdly enough I have a job that entails staring at text documents in
> text editors all day every day :-) sorry for thinking that's a sane
> thing to do.
