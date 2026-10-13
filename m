Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9EA5372C4
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930377; cv=pass; b=VuKu+5Ijv8LpmgNlOjXdhhhbukn8YdBukxsayRpF0zNMgjl6c6QwvC8Yny+XT+4mbdoNZL0psOsR9WVOBPc4um+AYt9EYjH1+Ql93WjFQq9yUXXbeZzgQaqqc1Y98XPvQrq4E6riCO63zISQxHRe47L+tM7cg4n8IREkESGhGas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930377; c=relaxed/simple;
	bh=e97obOSaBF5A+CDMxcrni6hxHYCVamGCzvFlkP2JwH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cukSiJg5KJ0M924gpTQf9gnPgWsTuGO9uXz+dUcmcm9+Mft5ptqNwDUJrbQL6keoTSKWgnIhxxCp2rgJV8UMUl87X/FeWo16oRmyjzHHcUKxyVBkfCigedALMMOQYIn2NUaGlxoE3MlQ8znAQNc1R9gJIxlE4jf8+UrqUNlR3sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tMloTeFX; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tMloTeFX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db33db4de9so182235ad.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930375; cv=none;
        d=google.com; s=arc-20260327;
        b=f96pbUppZQSvq6WR9SXMEfJEF8H8o2KL0U/1Q5zURhjB5prU5lisTXU2V8nlwfUADe
         8GY38wRStKlddaQ9+HUo9lkU50Bp6ifM9YC5Nnn3RZ4JCKiYJzz+aQRgq1nQMlEpUJ+n
         7I4jlKRuy0OZ4GNTRd+NJoPYm4Hd9PYpLGNjLJufc8a55LP9dl8EhvwXJiqu5thxD1ph
         Yh/8uBeQnJppvPxzY7NmorSUyDHDKfrqdOqDu6kNNJuJPU8u6O7UeEVd9Vz+6xdPDsfh
         sipSi70zEpalHP6XP1VHFtOqRKOD3YBW5iwpi3WEWWhrrQz8MizazZrhTDDGdHs16C/0
         2/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        fh=dxuEfHrQyYTgrXrVL/J12tD3EG7Gy5aDtmgRkzq0Eww=;
        b=nj5Aa1MjpbgCiYvb4FX0bFKWZkf3C8ZMrGar7A8BuwkjeSWWnNfIaD/E8K2keRQftd
         jnx7ZPPe2d3+hGN8nZu4lmdeA6bk7xvBAfGlY+jMA6uBrX2JO08fz5B9WUPEc1ClHt1d
         HGJvx8et3KNoXYJGCIjgTyF0U4JGX4o3e/BsgW5aqLR6WcdQsdV6gHsMbz4Yw7u8hRGn
         ZrlA/WdUrP077KJ4lMvGLK3faUlSaipqjpTuTLDMWPY8WWhUSoKSSQr6fmZ4I0jGyS7d
         gf53Rqg/JehpK5sQOWLSnY+Xrl8esxFJ6bqdeSjvWSNJ+YpmsjPMdFhk3y1JnTnh/Qh1
         hXwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930375; x=1792535175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        b=tMloTeFX/uN0rwkxvqXz2pt8sBcptjXittfMd/6Z0+lDi5Xbd0lz1I45UYVI+xXXJF
         xBES6IN4e2LhvVbmmQkGIG77N3JNFnWOLDLOxYP5I3FI/X7m5HbQkoKd4hILRap0GpXs
         OWNQe1PHAkB24dxfDdocgGAsQHwzkhFX3HunnIzDeIJMEK73NG4BDrP7hDSi9KUMW7La
         WnbJ1VPSlt2kifuVTAlKnRtW+rRv8W1rXuCNU1fFAVRMR5piiPf8D6W8AnNF23Edr8up
         8n+9fWFB/VTasj0gfztnW9kwGLeG/ZtPX8DstD8g3KRKTaZzfOuY/pC4ZS0Sc0Rxxu/u
         /CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930375; x=1792535175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        b=rqjcr75edPLm0giHRN42BMCgUcDe6LHppv20+3sKMjmLPNIrDNMK0SGrq6Y9pnIYer
         EY3MFVm65P0FYriR/OElhDd4fUcWmbcxLRKWXlWHrrRSg67+fy5c/gLhHrNCy7HuTmAD
         hgqi3lIv8j82HqFqWJR2uaAu0g2lY2n/9smJ+hpk8NJ8XQ7RAcU9nUhD3py6JfaDrnn0
         KrTyxp0s4rg6yigqHzamI8SccbqsWwz14PHpz5ZYAXpalEmC0bcRycyRUDZwlts3fi6z
         PFMhuCfUT0n9WN3y2ZHLsYeccp5VxSjl+r1Jufb98IV9N8fzgcjpcATCkDeJw+1jSlVf
         szow==
X-Forwarded-Encrypted: i=1; AKwUvBytssZNGeE5jDFrs6HrJdWzXTuG2evhcG2c+IqZroUsyZC1InuVE1085e1TSrsu5MXQstZH@lists.linux.dev
X-Gm-Message-State: AFq9FYLkorQni6hTR6GxWBtEa4iGY7t2GfkHyCj00CyVC5kl97gzhbcF
	Ir83+S1wO3eaWaNT2QF3HlzCakOYh3/y7fcHWkXBLH4RnKbXmLFkmRdSKHksbgHfHBei/IOPYAN
	R8Uk3aQnubweGKSngvuWEtrOxPVAqusyodW1iU00L
X-Gm-Gg: AYBFou3qT+3csQLSYSZg0faUHiS9vcMr4dpAaUl3Zxnbz26EB8/Sa2qm+URrh3iJhJ6
	zOokKD12eshsol2ukREIQX5gOkx8lfDNMfXFpj6c5BZNd1XJyQgePsIspCyK3t+mKJQUrCm5Xrv
	4/n2Y1V6+ZrH5uFQANx5AqwNgJ0Pg/c2+LkgiZrkyHjawUyanRrSRb5QqUpRoaDX+a//X1jzZo+
	3rtsm2O11XNk9+mRPiL8SSLX9gASnUGBkGYPdsdSBC8JPf6rsQqiIzT6BqzVWtUnufYtZlqnEEW
	/NcCBXGILWflOVL/uOy5RZe8pLsqCBpvkde35SPr8u62d6Eb/mS6lCvHQO/fpQrTyYQpOpJIZrU
	c5Ifyr1hY2p0c5cZho24=
X-Received: by 2002:a17:903:124d:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2e939438b27mr346965ad.2.1791930374188; Tue, 13 Oct 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org> <CAP-5=fX1XZu=3scB1-hA2ppcM0+sR7t_3=C7fFx=kGikm=dLqA@mail.gmail.com>
 <56cea1ea-a4a5-4c26-a15d-732415986ede@acm.org>
In-Reply-To: <56cea1ea-a4a5-4c26-a15d-732415986ede@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:26:01 -0700
X-Gm-Features: AclHuK-gmtH3OisE1f-Puo1s8QVH6C5PZ7oWuzSB3BanVBcur38Q_IjsKLcry1A
Message-ID: <CAP-5=fU1fBNwnMWjjzqz+SNW2n5NWsEYeEbXd8QGBXfoCTADYA@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:15=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 3:10 PM, Ian Rogers wrote:
> > On Tue, Oct 13, 2026 at 12:44=E2=80=AFPM Bart Van Assche <bvanassche@ac=
m.org> wrote:
> >> On 10/13/26 11:24 AM, Ian Rogers wrote:
> >>> diff --git a/include/linux/compiler-context-analysis.h b/include/linu=
x/compiler-context-analysis.h
> >>> index 8302ebc2ea8c..024e303188ad 100644
> >>> --- a/include/linux/compiler-context-analysis.h
> >>> +++ b/include/linux/compiler-context-analysis.h
> >>> @@ -243,7 +243,7 @@
> >>>     * alias as a function argument).
> >>>     */
> >>>    #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p=
))
> >>> -static inline void _context_unsafe_alias(void **p) { }
> >>> +static inline void _context_unsafe_alias(void **p) { (void)p; }
> >>
> >> Why a void cast instead of __attribute__((unused))?
> >
> > I agree; unfortunately, the macro isn't declared before this header
> > change needs it and I wanted to minimize the change.
>
> Hmm ... as far as I know __attribute__() is not a macro.

The kernel use generally comes from the macros in
include/linux/compiler_attributes.h. You can see similar unused
variable warnings being avoided in the  __assume_ctx_lock and
__assume_shared_ctx_lock macros declared in this file for the
!WARN_CONTEXT_ANALYSIS case.

Thanks,
Ian
