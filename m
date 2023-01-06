Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A01863;
	Fri,  6 Jan 2023 23:26:50 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-4c15c4fc8ccso41932257b3.4;
        Fri, 06 Jan 2023 15:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzMwwdZY3oMiVjSJDQ9I4Kl9NTgscPHXL13NH+00AiY=;
        b=BudRq+yLdzWdBk7w1nfo7PylN5GTI3Zfl0fUXhAujRwr2KAocfV77UMVbP/+4hmPWX
         Wf8hbTI5KS1OT6z5JQQ2IMoITWVziOSwqPqgzGwo8NhbILROPxiShRf8h2rC8+RrbZEF
         hyCmUtTIRuw77C0EMsQ+LucO/bNBdTK2f0JyKL+zahTXtAJ6SVGKbe2vS5+ZLTGCrYD+
         0MiOYFdAR6vFdyAvlJpfzKYIu48QHgVi8uzBX3klEKmxn8l8VJLx1X/HHN91ydI7doYi
         Dnhw+/nDRYEpoqL7cJ7G9+YWBN997DTZBYO8kjLYiorRdmTHD1HMkqFuDEZQFfqN4oVL
         8bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzMwwdZY3oMiVjSJDQ9I4Kl9NTgscPHXL13NH+00AiY=;
        b=rfqGrz5kVcgicsBIdCa+/4TWwrNXTpJ9itT7NiabxvBoveDutzonvhs0PZ1qYSf28O
         jAyHr4+Ajp2kPv9PYBhutqccuR4GawNUKnESvFkP5IxNZZlsqLoJPh8xJ4ifEZY6LHDx
         J4Ut3MOQIB7YoBR8vG+hccOBd6C76aCry10TSba/gZfEYCW1hAbvuxa2nbfqUC5XTNa+
         QtMuxmb+4eyadbbbdjuL2PfYDK5Ru1asO3uyjBktAE4/dz7bRadPlRmOKFNZ+32djlfr
         /n71YRBQawbf0EvHjolQBX6FdOCehRIm8m6fZoKZssL6pKDPg6mHlqwDTW8lMitZP7he
         3cJg==
X-Gm-Message-State: AFqh2kql6CGzqHcjNBvvUxppjWbhS3troeIMKwRLrOGcPv5D+ZEBCpHD
	PRUIbBDGuRY1FVODVdXvpATK93RukFLZJqOmjGM=
X-Google-Smtp-Source: AMrXdXsjllksGM0DMnueHbPOmq+XMnr9w3tkvoLDythchnZrcP8JhfJVo/VMX2ztMrvycS+l+7qinbFNNC8qpghsPvc=
X-Received: by 2002:a0d:f601:0:b0:3d8:8c0e:6d48 with SMTP id
 g1-20020a0df601000000b003d88c0e6d48mr440064ywf.462.1673047609522; Fri, 06 Jan
 2023 15:26:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic>
 <Y6r+UbfkXruwHU2v@zn.tnic> <76353487-736A-4470-AD31-77F47F8C08F6@me.com>
In-Reply-To: <76353487-736A-4470-AD31-77F47F8C08F6@me.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 00:26:38 +0100
Message-ID: <CANiq72mZ3d-W53o4iFryouRKkHkdyR=_qBWkMGm1aNd8Y9ZSnQ@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Alexander Altman <alexanderaltman@me.com>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 9:31 PM Alexander Altman <alexanderaltman@me.com> w=
rote:
>
> One way to resolve this temporarily would be to add the following line ab=
ove
> the offending struct:
> /// <div rustbindgen hide></div>
> This will cause bindgen to ignore the struct entirely and not translate i=
t.  If it=E2=80=99s
> actually needed for Rust code, now or later, then we can=E2=80=99t do tha=
t and need
> to actually replace it with something translatable, or else leave it hidd=
en and
> manually create its translation on the Rust side.  For the latter, just u=
sing a
> u32 for the entire bitfield-containing union would be sufficient.

Thanks a lot Alexander for taking a look!

This is https://github.com/rust-lang/rust-bindgen/issues/2179.

What we do for constructs that `bindgen` cannot map is to add the
appropriate parameter/line in `rust/bindgen_parameters`. We hit a
similar case for `x86_msi_data` that you can see in that file. So
please feel free to add it there.

If we end up needing to access it from the Rust side, another
alternative is to write a C function that performs the required
operation on it that then the Rust side calls.

Cheers,
Miguel
