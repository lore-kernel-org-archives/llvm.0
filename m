Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2241F0E32
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 22:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595846; cv=none; b=Xap7zFMlJeiMa8pQWLPibFtoD/BVZkNbQWUyqBdMMd2svovkg7MMsk18rQHYXBITCZyJhtE0Wi0LJFbRCMBrKz+4QGJBhttbhshQAedubrAehxAoEMUMwXTP3cGh1TpbsUEkkZLqigoIJ3Diqfsw34nNIVTDecsweI31bwQ8njE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595846; c=relaxed/simple;
	bh=Pf80HbUr/DGQjCWPwmII0ZVFPKktGmOvnTdlRbkKMIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sn6BiIwSQYyXzcmSVB5NOAsskhoMPe3Aagms9tHi0fJKnO0Z4UIpTTYoFaAVP7QArG9skrWnS1OWmFGFK++zqdF7y7oLcrc3pWzRXgzAkkLmP14MXGRiX40hsUKfJgHRNoJDaODJUKU27B+DC80fdoPrv2ylfXvQ6YMSJMP7xS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3PtKu89n; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3PtKu89n"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so4028689a12.2
        for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742595843; x=1743200643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8jrJyKxiHJsFpDm0e3XwO0Ld22rjdn+cIHQuSUcYus=;
        b=3PtKu89n81MnI+HzUz2jU2QmlYRz6T5DUDbCzIadiYrn5i1LQTSbBZzvl3j/FD/d9L
         txcCjyKR0bl33wB+InuYOLLEETjshPX6DP3xFPPcEmtQgH/4CbISOpd/ZpBWYnxBML/A
         1/rZEnnC1i1EESmK0Ew+hsWLeUPmcNSDr4aO3clxikFZnHKFBDxMTE1lzIN2+oJ3t2tl
         10vm6t8I2rxv7bOypMvYqxz7jCXc4pkLClgz48wP8JU6rGpveJPRrOTI3RfIbicshcFg
         /ldomwZo89aM19UjVW9crOsbTKcZqKNEFb14X/oHjK8c0Xk8X0FdY+SgHzv1dtqs8bZf
         hGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742595843; x=1743200643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8jrJyKxiHJsFpDm0e3XwO0Ld22rjdn+cIHQuSUcYus=;
        b=mmuYsgN5RH44eK0tf1wgMBy3LEZ2ozGqv2zii5fT6rzmcZeW5J9pNbXOx8QcjVSVeY
         LNeDp/D3L7sP+dko6GNhYpR5zGNspYNJ80V4jNWxB+JKozTZZdokYRgmTaMhCi4OMACA
         QvQmhZM5VJ+jOn/cl4ZR2ijuhWBLdsTGucoIMnBfQThKO7ZeRofuwEwF0YwXUxq1s0Ni
         GLoPH7hToC/Hnr7Snca0/R/kc0wEcJ6sJRO1+iZYoia+DsIs4tTZVn0n4Z5KBODsfXWu
         u3Rgghmr2JVKZqS8qPfkBBmelG4dHrqnCE8igk/Z5Y553nIQcahr/7Gko4hzHBABZNJ/
         a9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZhnHq5sJkUk+PTxqXcDrvBrTsg0HvZtxqlSwpfr8XOVXgCak588w5k538bzZgxq8hVcl@lists.linux.dev
X-Gm-Message-State: AOJu0YxoQCQs3tpwXQDbQ2zoHTf3kYFySgqKtFOqizHdmkvm4lT9Hsds
	O5ZaCveuf8tKb/tXaDvvEYaw3L8FFGFS2FSbfdcLQkL0iYxf9jQa5K3iZclY+nBKKNi8WgOSRCu
	0ntUeS8RJSC6/Bxjwpu9Q7svJpScQOVwS1VE=
X-Gm-Gg: ASbGncvt1M6MVFBF9MeU0iuNlovhyr5YSsfzFdBztw+Iu8cEjR3kQowPcE9HtLqaB6P
	9NOdpq3FWEPvyrz1soFVIWO7rOpmeW48RjWu7k58fmnjw9M49p7505asRWiAV0235auMai37+1m
	f5/ekW7RUL4ztQ8/PoH6gLCe0=
X-Google-Smtp-Source: AGHT+IGiBo0grQRUu2nHJCjMTQZmtRZhraKKNe/LaYS2ganDDjeQhCx9hOUZj3XHWnRGLvT0rflSbrILe4b94nHCEIA=
X-Received: by 2002:a17:907:c88a:b0:ac3:f35c:755a with SMTP id
 a640c23a62f3a-ac3f35c78e6mr507778166b.15.1742595843070; Fri, 21 Mar 2025
 15:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QUEY_Gmu-6K7rk6-y8AB7HVuV2V9sP5K3h379teAZXyHQ@mail.gmail.com>
 <20250321220537.507917-1-changyuanl@google.com>
In-Reply-To: <20250321220537.507917-1-changyuanl@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 21 Mar 2025 15:23:46 -0700
X-Gm-Features: AQ5f1Jq0IhTuozvPpo_OHyjFNWZyGClQgpdIrwKlxghGJJyad_VMwGeLm_dK1fU
Message-ID: <CAGG=3QUzJ_McPbJWkbcjHn_Uhw9OeBajH8h2u_4Bexc1x4G4zw@mail.gmail.com>
Subject: Re: [PATCH] clang-format: add for_each macros from libfdt
To: Changyuan Lyu <changyuanl@google.com>
Cc: justinstitt@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	nishimura@mxp.nes.nec.co.jp, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:05=E2=80=AFPM Changyuan Lyu <changyuanl@google.co=
m> wrote:
>
> Hi Bill,
>
> On Fri, Mar 21, 2025 at 12:28:44 -0700, Bill Wendling <morbo@google.com> =
wrote:
> > On Thu, Mar 20, 2025 at 4:59=3DE2=3D80=3DAFPM Changyuan Lyu <changyuanl=
@google.co=3D
> > m> wrote:
> > >
> > > Add two for_each macros from scripts/dtc/libfdt/libfdt.h.
> > >
> > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > ---
> > >  .clang-format | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/.clang-format b/.clang-format
> > > index fe1aa1a30d40..4decda7474e1 100644
> > > --- a/.clang-format
> > > +++ b/.clang-format
> > > @@ -210,6 +210,8 @@ ForEachMacros:
> > >    - 'evlist__for_each_entry_from'
> > >    - 'evlist__for_each_entry_reverse'
> > >    - 'evlist__for_each_entry_safe'
> > > +  - 'fdt_for_each_property_offset'
> > > +  - 'fdt_for_each_subnode'
> >
> > Could you alphabetize these please?
> >
> > >    - 'flow_action_for_each'
> > >    - 'for_each_acpi_consumer_dev'
> > >    - 'for_each_acpi_dev_match'
> > > --
> > > 2.49.0.395.g12beb8f557-goog
> > >
>
> Thanks for taking a look, but I think the list `ForEachMacros`
> is already sorted alphabetically.
> Am I missing anything?
>
Oh! I'm sorry. I tought that the 'd' (dee) in 'fdt_...' was an 'o' (oh). My=
 bad.

-bw
