Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30C10E8
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 00:08:30 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id n15so14917758plh.2
        for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 17:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNOHO0MxND9U5QYTutXy4JWYuAASnDKcx8vBDjMeWwg=;
        b=jfdXT7xBd71Bf8/eabDPpUSNh/yhLcRlOu/GD8JBy9t/2EcozNl/l17+OX54PVXx2/
         yCogKYYNHbNaLUlu6Sq6+0YBR+72hqjyciROITBwSPeN+J2+Oyh81Riw4me8fBrEWn7l
         T60BJ96mUNSwc1GfufqglTy4cgW025PyRo+L3+9W1f56Z4C/Qd5M60m2R2U/JArt6Sx3
         r55Q+tZ7bvL5FvygXzx5IPqMITqRuzZvgql5vFjlgNy+9it0ACkdpLPbeojfCaWOi3VL
         Vjt5kIxCNa3vsE7ylPwYw2txJ+sADmU5/y/Dylexxv2QxCst2Z4uRQMz5yz0GoL/AmNz
         DuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNOHO0MxND9U5QYTutXy4JWYuAASnDKcx8vBDjMeWwg=;
        b=DqzLMhzSdNAuixSxzYcqMPF4pKzuwnemQo/W0dy4oCXyjxXj4kNrOFFNeDBvUnkYVT
         ikk4EMVW1MgztciIqVLLieF/NDIoSk8wlL/teGBHEdB3TPRKrHGiD19kCrCM2XzBzGk5
         839WlfahFVNfZ9TT2cBndk6zorURRvITO5xNd2oNY8ZaF8QVHBP6TWpb7J9lcs+xSb0C
         rAjsfJbxIClONDhbCe4oDTB9JpJotOOoiuimh1gxp+U5/HTFdrbKl4ZLDOHoVp9pYdfj
         0wJOCbz5i9oa/nBDT+W1iPqr70z1ThbU2Ws69pgN1/HTQnBNjd+dGa0D91xL5nYc3822
         P4NA==
X-Gm-Message-State: AOAM531Z7hK8764ZKs6jyJR34y2adjia8ft/DUDhuHDI8my4P/CIri+Y
	6PFNZz9nSYQb9e0+WP+hvBYZlavvT9vOZGSny1i2
X-Google-Smtp-Source: ABdhPJyTl2dscitxyL5B/Z6MzR7vvqUpFfY6Hae/3AEMYiqXzeVQQ6vEgbpH4fs+TS9zcFfCzRRQIBqPXzjTGccstk0=
X-Received: by 2002:a17:90a:c252:b0:1bc:52a8:cac8 with SMTP id
 d18-20020a17090ac25200b001bc52a8cac8mr1599760pjx.61.1647302909598; Mon, 14
 Mar 2022 17:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211215211847.206208-1-morbo@google.com> <87mtl1l63m.ffs@tglx>
 <CAGG=3QV2sw1w+j2NDqPVAbobGj04QXfOF0VcSCebRbs6y-L5WA@mail.gmail.com> <dccb0cf2-edc1-fb98-d4ca-4f76687b7e6c@zytor.com>
In-Reply-To: <dccb0cf2-edc1-fb98-d4ca-4f76687b7e6c@zytor.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 14 Mar 2022 17:08:18 -0700
Message-ID: <CAGG=3QUHSRHNKsibezy6NSaJea3uJhnHE61k1+W384tbPzuMrA@mail.gmail.com>
Subject: Re: [PATCH] x86: use builtins to read eflags
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 4:10 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 12/16/21 11:55, Bill Wendling wrote:
> > On Wed, Dec 15, 2021 at 4:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>
> >> Bill,
> >>
> >> On Wed, Dec 15 2021 at 13:18, Bill Wendling wrote:
> >>
> >> please always CC the relevant mailing lists, i.e. this lacks a cc:
> >> linux-kernel@vger.kernel.org
> >>
> > I thought that was automatically added. But as Peter pointed out in
> > another email thread, no one has time to read the LKML, so it seems a
> > bit pointless? Nonetheless it's added now.
> >
>
> Consider linux-kernel a distributed archive. Noone reads it in real
> time, but it is really great to be able to search for someone specific
> in one place.
>
Ah! Okay. That makes more sense then. :-)

-bw
