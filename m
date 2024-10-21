Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A651D0164
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729531773; cv=none; b=FMva87NmIiE/Yh2JZSmTaEMQAo8NpHtzCOLuZyKQ2qS3m1RdHTnRA8FAz3P9R7Dd4F6AovIgzcx/THpaNMXxUCqy1xF6GC2thxuuGJqNjdJxQj6p0uaExkoTeE4ceOwqFUsVCD8ZytS26Xyi/wScZdnunInNN2922PZamlS5Z4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729531773; c=relaxed/simple;
	bh=lec2tidZmup8h1DfBg1pmUD/aaxIOPcPqf2J0RzEw5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iW9vyf974Y1g2HhyuH+h4qs9XAw2zHL38uA8GzlcI9/Np/mztd+s51zyrcrclDguD9arrkO43AQWxLEItttsagxHHKJhMECu3byfbHCjoY5ancpu4p33rYOLs1Z4YnwDMJxeiPbLNkfJU6FM6vEVi+rew3dzhOQyb/v+8Wup0Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5B7gyw6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5B7gyw6"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso3108212b3a.3
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729531771; x=1730136571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBMMpOhM7o/sGaQ+IgPO+fXmm5Xj7pn8re9uxcPeOlc=;
        b=h5B7gyw6UBk7lE6Xi0y2rhUGTyIfr1IgB1+ze+lP6yKFimaYMkPqcOA2vLRVuUPZM8
         7u6fqtLv+8Sv0Q+a55dej3HAx4aYgKdY5M7b5dnYOUVKSF5hckQUXInqimz3zHQyjph5
         iBaODtZLDeJkYOySyWy8DpFDOVqb8nx45BatLuv0Y7JDHapZmK+ViD8BNiLZ01L2nL+e
         jV6VNzPHCHU7ayrQzgveCAw7s19oithGLG/1DQ8w7SPp51GscYQKeeVSY8yKmfe+EKf9
         byYnydooiRwAf2BYArIzBzhXA6OeyU2NhttFt9xRwky23J29rTeDK31e3J8I1XmCagJi
         IUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729531771; x=1730136571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBMMpOhM7o/sGaQ+IgPO+fXmm5Xj7pn8re9uxcPeOlc=;
        b=rfkJxNI/f4Qh871L302C66DVYqmhjQTpiueM0V7BjM2HF4MTWKV+YBk3W/LbqyLN5O
         jsgwuwG+PoMCvWw8oufzNu+Z0MBVIMeAFlmaPCS6PvGW6wxRDoXInnuclUBMnsxsknrW
         T4Si4jvFShivKt3aAY/TWBbHu/mHiqMP+gcXFRmtzqhS2NDt2W4R49ErHM5DoUY6PPrJ
         akR2uhavL9H88+5Nkk6hPEywiT9j548y3gBNvK+UHA/jhaRFSf5zqosLiWiytVBxAsEv
         EqwY9LETtM0g82o620q+upJaITlUfDZaGlgWB4W2sPYXgbxwfqWDhdUYwMBJOgV83an6
         YzUg==
X-Forwarded-Encrypted: i=1; AJvYcCUXE97M6wpQ/jkiA1eHJIj2E4zzn09f/TUIskMXioHU/aWB4I9m0DLvLcliJzugNNXPm72X@lists.linux.dev
X-Gm-Message-State: AOJu0YyUTv7w9Vde97KPKwsUrlqk5QzOs/c1yRYzIyNS6dq+ITfWh8y4
	LJ4vNAFufajP+AaxwnVzBEoMKMC7ty+yxiAO57S+//p5Rju2ufTNe5rbfQG2yHvw2T01ugsk0y9
	6FeXdCuFa6OeMVRGFbdth3ULsw9o=
X-Google-Smtp-Source: AGHT+IHVW3rUf06tmEeKO+rmrJFBlUZBUoTVTxPBQTnYQLB2bqCxcMyKhBddR2jNjdOODAjhxcK4Jt0sluAEimugIUw=
X-Received: by 2002:a05:6a21:118e:b0:1d2:f124:a1cb with SMTP id
 adf61e73a8af0-1d92c4a5373mr17184971637.9.1729531771096; Mon, 21 Oct 2024
 10:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021120013.3209481-1-elver@google.com> <20241021172058.GB26179@willie-the-truck>
In-Reply-To: <20241021172058.GB26179@willie-the-truck>
From: Andrew Pinski <pinskia@gmail.com>
Date: Mon, 21 Oct 2024 10:29:18 -0700
Message-ID: <CA+=Sn1m7KYkJHL3gis6+7M2-o9fuuzDtyUmycKnHK9KKEr2LtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kasan: Fix Software Tag-Based KASAN with GCC
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	syzbot+908886656a02769af987@syzkaller.appspotmail.com, 
	"Andrew Pinski (QUIC)" <quic_apinski@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 10:21=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Mon, Oct 21, 2024 at 02:00:10PM +0200, Marco Elver wrote:
> > Per [1], -fsanitize=3Dkernel-hwaddress with GCC currently does not disa=
ble
> > instrumentation in functions with __attribute__((no_sanitize_address)).
> >
> > However, __attribute__((no_sanitize("hwaddress"))) does correctly
> > disable instrumentation. Use it instead.
> >
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117196 [1]
> > Link: https://lore.kernel.org/r/000000000000f362e80620e27859@google.com
> > Link: https://lore.kernel.org/r/ZvFGwKfoC4yVjN_X@J2N7QTR9R3
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218854
> > Reported-by: syzbot+908886656a02769af987@syzkaller.appspotmail.com
> > Tested-by: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Andrew Pinski <pinskia@gmail.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  include/linux/compiler-gcc.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.=
h
> > index f805adaa316e..cd6f9aae311f 100644
> > --- a/include/linux/compiler-gcc.h
> > +++ b/include/linux/compiler-gcc.h
> > @@ -80,7 +80,11 @@
> >  #define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
> >  #endif
> >
> > +#ifdef __SANITIZE_HWADDRESS__
> > +#define __no_sanitize_address __attribute__((__no_sanitize__("hwaddres=
s")))
> > +#else
> >  #define __no_sanitize_address __attribute__((__no_sanitize_address__))
> > +#endif
>
> Does this work correctly for all versions of GCC that support
> -fsanitize=3Dkernel-hwaddress?

Yes, tested from GCC 11+, kernel-hwaddress was added in GCC 11.
Also tested from clang 9.0+ and it works there too.

Thanks,
Andrew Pinski

>
> Will
